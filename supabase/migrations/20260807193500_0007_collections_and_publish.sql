-- Open Eppic — Atom Prototype, migration 0007
-- Founder-confirmed 2026-08-07:
--   - Collections are persistent (add/remove over time, publish whenever).
--   - Publish creates a new Work; every collected Element becomes a
--     Chapter (content copied), alphabetical by title, flat (no hierarchy).
--     A collected Work contributes ITS OWN current Chapters individually
--     (copied), not itself as one summary Chapter.
--   - Publish always reflects current content at publish time — nothing
--     cached from when an item was added to the Collection.
--
-- Collections are NOT part of the elements graph (LD 5) — they're a
-- curation layer over it, closer to a personal list than a content type.

create table public.collections (
  id         uuid primary key default gen_random_uuid(),
  owner_id   uuid not null references auth.users(id) on delete restrict,
  title      text not null check (length(trim(title)) > 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.collection_items (
  collection_id uuid not null references public.collections(id) on delete cascade,
  element_id    uuid not null references public.elements(id) on delete restrict,
  added_at      timestamptz not null default now(),
  primary key (collection_id, element_id)
);

create index collections_owner_idx on public.collections(owner_id);
create index collection_items_element_idx on public.collection_items(element_id);

alter table public.collections enable row level security;
alter table public.collection_items enable row level security;

-- Collections are private to their owner in the atom — no Space-wide
-- Collection browsing yet (that's real MVP scope, LD 11's "flat/filterable
-- gathering," not built here). Simplest correct policy for a single-owner
-- curation object.
create policy collections_owner_all
  on public.collections for all
  to authenticated
  using (owner_id = auth.uid())
  with check (owner_id = auth.uid());

create policy collection_items_owner_all
  on public.collection_items for all
  to authenticated
  using (exists (select 1 from public.collections c where c.id = collection_id and c.owner_id = auth.uid()))
  with check (exists (select 1 from public.collections c where c.id = collection_id and c.owner_id = auth.uid()));

-- ---------------------------------------------------------------------------
-- create_collection / add_to_collection / remove_from_collection
-- Thin wrappers; RLS already does the ownership work, but RPCs keep the
-- write surface consistent with everything else and let add validate that
-- the Element being added is actually visible to the caller.
-- ---------------------------------------------------------------------------
create or replace function public.create_collection(p_title text)
returns public.collections
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.collections;
begin
  if auth.uid() is null then
    raise exception 'create_collection: not authenticated';
  end if;
  insert into public.collections (owner_id, title)
  values (auth.uid(), trim(p_title))
  returning * into v_row;
  return v_row;
end;
$$;

create or replace function public.add_to_collection(p_collection_id uuid, p_element_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_col public.collections;
  v_el  public.elements;
begin
  select * into v_col from public.collections where id = p_collection_id;
  if not found or v_col.owner_id <> auth.uid() then
    raise exception 'add_to_collection: you do not own this Collection';
  end if;

  select * into v_el from public.elements where id = p_element_id;
  if not found then
    raise exception 'add_to_collection: Element not found';
  end if;
  if v_el.deleted_at is not null then
    raise exception 'add_to_collection: Element has been removed';
  end if;
  -- visible = owned, or activated-and-public (same rule as elements_public)
  if v_el.owner_id <> auth.uid() and not v_el.is_active then
    raise exception 'add_to_collection: Element is not visible to you';
  end if;

  insert into public.collection_items (collection_id, element_id)
  values (p_collection_id, p_element_id)
  on conflict do nothing;
end;
$$;

create or replace function public.remove_from_collection(p_collection_id uuid, p_element_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if not exists (select 1 from public.collections where id = p_collection_id and owner_id = auth.uid()) then
    raise exception 'remove_from_collection: you do not own this Collection';
  end if;
  delete from public.collection_items
  where collection_id = p_collection_id and element_id = p_element_id;
end;
$$;

-- ---------------------------------------------------------------------------
-- publish_collection: the real work. Creates a new Work; walks the
-- Collection's items alphabetically by title; for a Work item, pulls in
-- ITS current Chapters (alphabetically) as copies; for anything else,
-- copies the item's own content as one new Chapter. Everything copied, flat,
-- no hierarchy — matches "not even in order, just alphabetically."
-- ---------------------------------------------------------------------------
create or replace function public.publish_collection(p_collection_id uuid, p_work_title text default null)
returns public.elements
language plpgsql
security definer
set search_path = public
as $$
declare
  v_col       public.collections;
  v_work      public.elements;
  v_item      record;
  v_source_ch record;
  v_pos       integer := 0;
  v_new_ch    public.elements;
begin
  if auth.uid() is null then
    raise exception 'publish_collection: not authenticated';
  end if;

  select * into v_col from public.collections where id = p_collection_id;
  if not found or v_col.owner_id <> auth.uid() then
    raise exception 'publish_collection: you do not own this Collection';
  end if;

  -- New Work, owned by the publisher, not yet activated (LD 7 still applies
  -- to the published Work itself — publishing a Collection doesn't bypass
  -- the activation gate).
  insert into public.elements (owner_id, type, title, body, is_active)
  values (auth.uid(), 'work', coalesce(nullif(trim(p_work_title), ''), v_col.title), '{}'::jsonb, false)
  returning * into v_work;

  -- Walk items alphabetically by the element's own title.
  for v_item in
    select e.* from public.collection_items ci
    join public.elements e on e.id = ci.element_id
    where ci.collection_id = p_collection_id
      and e.deleted_at is null
    order by e.title asc
  loop
    if v_item.type = 'work' then
      -- Pull in THIS work's own current chapters individually, alphabetically.
      for v_source_ch in
        select ch.* from public.element_links el
        join public.elements ch on ch.id = el.child_id
        where el.parent_id = v_item.id
          and ch.deleted_at is null
        order by ch.title asc
      loop
        insert into public.elements (owner_id, type, title, body, is_active)
        values (auth.uid(), 'chapter', v_source_ch.title, v_source_ch.body, false)
        returning * into v_new_ch;

        insert into public.element_links (parent_id, child_id, position)
        values (v_work.id, v_new_ch.id, v_pos);
        v_pos := v_pos + 1;
      end loop;
    else
      -- Any other Element: copy its content into one new Chapter.
      insert into public.elements (owner_id, type, title, body, is_active)
      values (auth.uid(), 'chapter', v_item.title, v_item.body, false)
      returning * into v_new_ch;

      insert into public.element_links (parent_id, child_id, position)
      values (v_work.id, v_new_ch.id, v_pos);
      v_pos := v_pos + 1;
    end if;
  end loop;

  return v_work;
end;
$$;

grant execute on function public.create_collection(text)          to authenticated;
grant execute on function public.add_to_collection(uuid, uuid)    to authenticated;
grant execute on function public.remove_from_collection(uuid, uuid) to authenticated;
grant execute on function public.publish_collection(uuid, text)   to authenticated;

-- ---------------------------------------------------------------------------
-- Read surfaces for the new objects.
-- ---------------------------------------------------------------------------
create view public.collections_with_counts
with (security_invoker = true) as
select
  c.id, c.owner_id, c.title, c.created_at, c.updated_at,
  count(ci.element_id) as item_count
from public.collections c
left join public.collection_items ci on ci.collection_id = c.id
group by c.id;

grant select on public.collections_with_counts to authenticated;

create view public.collection_items_public
with (security_invoker = true) as
select
  ci.collection_id,
  ci.element_id,
  ci.added_at,
  ep.title,
  ep.type,
  ep.is_tombstoned
from public.collection_items ci
join public.elements_public ep on ep.id = ci.element_id;

grant select on public.collection_items_public to authenticated;

comment on function public.publish_collection is
  'Snapshot-copies every collection item into a new Work''s Chapters, alphabetical, flat. A Work item contributes its own current Chapters, not itself. Nothing here is a live link — publishing again later would create a second, independent Work.';
