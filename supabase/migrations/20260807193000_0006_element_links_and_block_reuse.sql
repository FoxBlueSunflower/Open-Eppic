-- Open Eppic — Atom Prototype, migration 0006
-- Founder-confirmed 2026-08-07:
--   1. Works are collections of Chapters (element_links, parent=Work).
--   2. Blocks are reusable in other Elements (not Works) as static,
--      lineage-stamped derivatives, attached via the same element_links
--      table (parent=any non-Work, non-Block Element; child=block derivative).
--      Not editable by the attacher — derive_element() already enforces
--      that a derivative belongs to whoever derived it, and RLS already
--      blocks non-owners from editing.
--
-- element_links is a strict subset of LD 5's adjacency-list design: no
-- link "kind" enum yet (composition is the only kind here), no ordering
-- beyond a simple integer position. Both extend later without a rewrite.

create table public.element_links (
  id         uuid primary key default gen_random_uuid(),
  parent_id  uuid not null references public.elements(id) on delete restrict,
  child_id   uuid not null references public.elements(id) on delete restrict,
  position   integer not null default 0,
  created_at timestamptz not null default now(),
  constraint element_links_no_self_link check (parent_id <> child_id),
  constraint element_links_unique_child_per_parent unique (parent_id, child_id)
);

create index element_links_parent_idx on public.element_links(parent_id, position);
create index element_links_child_idx  on public.element_links(child_id);

comment on table public.element_links is
  'Composition only in the atom: Work->Chapter, and non-Work Element->Block-derivative. Not a general link/reference graph yet (LD 5 scope is wider; this is a subset).';

alter table public.element_links enable row level security;

-- Read: same visibility as elements — a link is visible if its parent is
-- visible (own, or activated-and-public). Children of a visible parent are
-- reachable through elements_public regardless of the link's own visibility,
-- so this stays permissive without leaking anything elements_public wouldn't.
create policy element_links_select
  on public.element_links for select
  to authenticated
  using (
    exists (
      select 1 from public.elements p
      where p.id = element_links.parent_id
        and (p.owner_id = auth.uid() or p.is_active)
    )
  );

-- No direct insert/update/delete policy: every write goes through the
-- RPCs below, which enforce ownership and the composition rules server-side.
-- (RLS defaults to deny with no matching policy.)

-- ---------------------------------------------------------------------------
-- attach_chapter_to_work: the Work-as-Chapter-collection mechanic.
-- Parent must be an owned Work; child must be an owned, non-tombstoned
-- Chapter not already linked to this parent. Position defaults to "append."
-- ---------------------------------------------------------------------------
create or replace function public.attach_chapter_to_work(p_work_id uuid, p_chapter_id uuid, p_position integer default null)
returns public.element_links
language plpgsql
security definer
set search_path = public
as $$
declare
  v_work    public.elements;
  v_chapter public.elements;
  v_pos     integer;
  v_row     public.element_links;
begin
  if auth.uid() is null then
    raise exception 'attach_chapter: not authenticated';
  end if;

  select * into v_work from public.elements where id = p_work_id;
  if not found or v_work.owner_id <> auth.uid() then
    raise exception 'attach_chapter: you do not own this Work';
  end if;
  if v_work.type <> 'work' then
    raise exception 'attach_chapter: parent must be a Work';
  end if;
  if v_work.deleted_at is not null then
    raise exception 'attach_chapter: Work has been removed';
  end if;

  select * into v_chapter from public.elements where id = p_chapter_id;
  if not found or v_chapter.owner_id <> auth.uid() then
    raise exception 'attach_chapter: you do not own this Chapter';
  end if;
  if v_chapter.type <> 'chapter' then
    raise exception 'attach_chapter: child must be a Chapter';
  end if;
  if v_chapter.deleted_at is not null then
    raise exception 'attach_chapter: Chapter has been removed';
  end if;

  if p_position is null then
    select coalesce(max(position), -1) + 1 into v_pos
    from public.element_links where parent_id = p_work_id;
  else
    v_pos := p_position;
  end if;

  insert into public.element_links (parent_id, child_id, position)
  values (p_work_id, p_chapter_id, v_pos)
  on conflict (parent_id, child_id) do update set position = excluded.position
  returning * into v_row;

  return v_row;
end;
$$;

create or replace function public.detach_chapter_from_work(p_work_id uuid, p_chapter_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if not exists (select 1 from public.elements where id = p_work_id and owner_id = auth.uid()) then
    raise exception 'detach_chapter: you do not own this Work';
  end if;
  delete from public.element_links where parent_id = p_work_id and child_id = p_chapter_id;
end;
$$;

-- ---------------------------------------------------------------------------
-- derive_block_into: reuse a Block inside another Element. Copies the Block
-- (same mechanism as derive_element — lineage stamped, non-editable by
-- anyone but the new derivative's owner) and links the copy under the host
-- Element. Host must be owned, non-Work, non-Block, non-tombstoned. Source
-- Block must be activated and an original (identical gate to derive_element).
--
-- The source's type is checked BEFORE calling derive_element(), so a
-- wrong-type call fails clean with nothing inserted, rather than leaving an
-- orphaned derivative behind (caught and fixed during same-day testing,
-- folded directly into this migration rather than left as a separate patch).
-- ---------------------------------------------------------------------------
create or replace function public.derive_block_into(p_host_id uuid, p_block_id uuid, p_position integer default null)
returns public.elements
language plpgsql
security definer
set search_path = public
as $$
declare
  v_host   public.elements;
  v_source public.elements;
  v_child  public.elements;
  v_pos    integer;
begin
  if auth.uid() is null then
    raise exception 'derive_block_into: not authenticated';
  end if;

  select * into v_host from public.elements where id = p_host_id;
  if not found or v_host.owner_id <> auth.uid() then
    raise exception 'derive_block_into: you do not own the host Element';
  end if;
  if v_host.type = 'work' then
    raise exception 'derive_block_into: Blocks attach to Elements, not Works (Works hold Chapters)';
  end if;
  if v_host.type = 'block' then
    raise exception 'derive_block_into: Blocks cannot contain other Blocks';
  end if;
  if v_host.deleted_at is not null then
    raise exception 'derive_block_into: host Element has been removed';
  end if;

  select * into v_source from public.elements where id = p_block_id;
  if not found then
    raise exception 'derive_block_into: source Element not found';
  end if;
  if v_source.type <> 'block' then
    raise exception 'derive_block_into: source Element is not a Block';
  end if;

  -- derive_element() still does the real work: activation gate, no
  -- sub-derivation, owner/lineage set server-side.
  v_child := public.derive_element(p_block_id, null);

  if p_position is null then
    select coalesce(max(position), -1) + 1 into v_pos
    from public.element_links where parent_id = p_host_id;
  else
    v_pos := p_position;
  end if;

  insert into public.element_links (parent_id, child_id, position)
  values (p_host_id, v_child.id, v_pos);

  return v_child;
end;
$$;

grant execute on function public.attach_chapter_to_work(uuid, uuid, integer) to authenticated;
grant execute on function public.detach_chapter_from_work(uuid, uuid)        to authenticated;
grant execute on function public.derive_block_into(uuid, uuid, integer)     to authenticated;
