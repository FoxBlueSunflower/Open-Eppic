-- Open Eppic — Atom Prototype, migration 0001
-- Scope: the minimum that demonstrates create -> activate -> derive -> lineage.
-- Deliberately absent: spaces, brands, element_links, element_versions,
-- collections, following, endorsement tags, governance. All bolt on later.

-- ---------------------------------------------------------------------------
-- Profiles (needed only so authorship is visibly attached to an Element)
-- ---------------------------------------------------------------------------
create table public.profiles (
  id           uuid primary key references auth.users(id) on delete cascade,
  display_name text not null check (length(trim(display_name)) > 0),
  created_at   timestamptz not null default now()
);

alter table public.profiles enable row level security;

create policy profiles_select_all
  on public.profiles for select
  to authenticated
  using (true);

create policy profiles_update_own
  on public.profiles for update
  to authenticated
  using (id = auth.uid())
  with check (id = auth.uid());

create policy profiles_insert_own
  on public.profiles for insert
  to authenticated
  with check (id = auth.uid());

-- ---------------------------------------------------------------------------
-- Element types (LD 5 vocabulary, full set even though the atom uses few)
-- ---------------------------------------------------------------------------
create type public.element_type as enum (
  'work','chapter','character','setting','system','event','item','block'
);

-- ---------------------------------------------------------------------------
-- Elements
-- ---------------------------------------------------------------------------
create table public.elements (
  id              uuid primary key default gen_random_uuid(),
  owner_id        uuid not null references auth.users(id) on delete restrict,
  type            public.element_type not null,
  title           text not null check (length(trim(title)) > 0),
  body            jsonb not null default '{}'::jsonb,
  is_active       boolean not null default false,
  activated_at    timestamptz,
  derived_from_id uuid references public.elements(id) on delete restrict,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now(),
  deleted_at      timestamptz,
  constraint elements_no_self_parent check (derived_from_id is null or derived_from_id <> id)
);

create index elements_owner_idx  on public.elements(owner_id);
create index elements_parent_idx on public.elements(derived_from_id);
create index elements_active_idx on public.elements(is_active) where deleted_at is null;

comment on column public.elements.derived_from_id is
  'Permanent lineage (MVP_Spec LD 6). Set once by derive_element(); immutable thereafter. Never client-settable.';
comment on column public.elements.is_active is
  'Activation gate (LD 7). For originals, activation is the creator consent moment that opens the Element to derivation.';

-- ---------------------------------------------------------------------------
-- Server-side authority: owner and lineage are never taken from the client
-- ---------------------------------------------------------------------------
create or replace function public.elements_set_server_fields()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  new.owner_id := coalesce(auth.uid(), new.owner_id);
  if new.owner_id is null then
    raise exception 'elements: owner_id cannot be resolved (no authenticated user)';
  end if;
  new.created_at := now();
  new.updated_at := now();
  if new.is_active then
    new.activated_at := coalesce(new.activated_at, now());
  end if;
  return new;
end;
$$;

create or replace function public.elements_guard_immutable()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if new.owner_id is distinct from old.owner_id then
    raise exception 'elements: owner_id is immutable';
  end if;
  if new.derived_from_id is distinct from old.derived_from_id then
    raise exception 'elements: derived_from_id is permanent lineage and is immutable (LD 6)';
  end if;
  if new.id is distinct from old.id then
    raise exception 'elements: id is immutable';
  end if;
  if new.created_at is distinct from old.created_at then
    raise exception 'elements: created_at is immutable';
  end if;
  if old.deleted_at is not null and new.deleted_at is null then
    raise exception 'elements: deleted_at cannot be cleared (soft delete is one-way)';
  end if;
  if new.is_active and old.activated_at is null then
    new.activated_at := now();
  end if;
  new.updated_at := now();
  return new;
end;
$$;

create or replace function public.elements_forbid_hard_delete()
returns trigger
language plpgsql
as $$
begin
  raise exception 'elements: hard delete is forbidden; set deleted_at instead (lineage must survive)';
end;
$$;

create trigger elements_before_insert
  before insert on public.elements
  for each row execute function public.elements_set_server_fields();

create trigger elements_before_update
  before update on public.elements
  for each row execute function public.elements_guard_immutable();

create trigger elements_before_delete
  before delete on public.elements
  for each row execute function public.elements_forbid_hard_delete();

-- ---------------------------------------------------------------------------
-- RLS. Treat the table as public-by-accident until proven otherwise.
-- ---------------------------------------------------------------------------
alter table public.elements enable row level security;

create policy elements_select_own_or_active
  on public.elements for select
  to authenticated
  using (owner_id = auth.uid() or is_active);

create policy elements_insert_originals_only
  on public.elements for insert
  to authenticated
  with check (owner_id = auth.uid() and derived_from_id is null);

create policy elements_update_own
  on public.elements for update
  to authenticated
  using (owner_id = auth.uid())
  with check (owner_id = auth.uid());

-- No delete policy at all: deletes are denied by RLS and by trigger, both.

-- ---------------------------------------------------------------------------
-- Public read surface. Tombstoned Elements keep their node in the lineage
-- graph but surrender their content.
-- ---------------------------------------------------------------------------
create view public.elements_public
with (security_invoker = true) as
select
  e.id,
  e.owner_id,
  p.display_name as owner_display_name,
  e.type,
  case when e.deleted_at is null then e.title else '[removed]' end as title,
  case when e.deleted_at is null then e.body  else '{}'::jsonb end as body,
  e.is_active,
  e.activated_at,
  e.derived_from_id,
  (e.derived_from_id is not null) as is_derivative,
  (e.deleted_at is not null)      as is_tombstoned,
  e.created_at,
  e.updated_at
from public.elements e
left join public.profiles p on p.id = e.owner_id;

-- ---------------------------------------------------------------------------
-- Activation: the creator's consent moment (LD 7).
-- Withdrawal is prospective-only: it closes the standing offer and never
-- touches derivatives already made.
-- ---------------------------------------------------------------------------
create or replace function public.set_activation(p_element_id uuid, p_active boolean)
returns public.elements
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.elements;
begin
  select * into v_row from public.elements where id = p_element_id;
  if not found then
    raise exception 'activation: element not found';
  end if;
  if v_row.owner_id <> auth.uid() then
    raise exception 'activation: only the creator may activate or withdraw their Element';
  end if;
  if v_row.deleted_at is not null then
    raise exception 'activation: element is removed';
  end if;

  update public.elements
     set is_active = p_active
   where id = p_element_id
  returning * into v_row;

  return v_row;
end;
$$;

-- ---------------------------------------------------------------------------
-- Derivation: acceptance of the standing offer. The only path that may
-- write derived_from_id.
-- ---------------------------------------------------------------------------
create or replace function public.derive_element(p_parent_id uuid, p_title text default null)
returns public.elements
language plpgsql
security definer
set search_path = public
as $$
declare
  v_parent public.elements;
  v_child  public.elements;
begin
  if auth.uid() is null then
    raise exception 'derivation: not authenticated';
  end if;

  select * into v_parent from public.elements where id = p_parent_id;
  if not found then
    raise exception 'derivation: source Element not found';
  end if;
  if v_parent.deleted_at is not null then
    raise exception 'derivation: source Element has been removed';
  end if;
  if not v_parent.is_active then
    raise exception 'derivation: source Element is not activated; its creator has not opened it to derivation (LD 7)';
  end if;
  if v_parent.derived_from_id is not null then
    raise exception 'derivation: derivatives cannot be derived from (LD 6, no sub-derivation)';
  end if;

  insert into public.elements (owner_id, type, title, body, derived_from_id, is_active)
  values (
    auth.uid(),
    v_parent.type,
    coalesce(nullif(trim(p_title), ''), v_parent.title || ' (derived)'),
    v_parent.body,
    v_parent.id,
    false
  )
  returning * into v_child;

  return v_child;
end;
$$;

-- ---------------------------------------------------------------------------
-- Soft delete (tombstone). Lineage survives.
-- ---------------------------------------------------------------------------
create or replace function public.tombstone_element(p_element_id uuid)
returns public.elements
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.elements;
begin
  select * into v_row from public.elements where id = p_element_id;
  if not found then
    raise exception 'tombstone: element not found';
  end if;
  if v_row.owner_id <> auth.uid() then
    raise exception 'tombstone: only the creator may remove their Element';
  end if;

  update public.elements
     set deleted_at = now(), is_active = false
   where id = p_element_id
  returning * into v_row;

  return v_row;
end;
$$;

grant execute on function public.set_activation(uuid, boolean) to authenticated;
grant execute on function public.derive_element(uuid, text)    to authenticated;
grant execute on function public.tombstone_element(uuid)       to authenticated;
grant select on public.elements_public to authenticated;

-- New profile row on signup, so authorship always has a name to show
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, display_name)
  values (new.id, coalesce(new.raw_user_meta_data->>'display_name', split_part(new.email, '@', 1)))
  on conflict (id) do nothing;
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
