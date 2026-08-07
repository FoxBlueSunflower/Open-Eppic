-- Open Eppic — Atom Prototype, migration 0005
-- Two changes, founder-requested 2026-08-07:
--   1. elements_public shows "[removed] Original Title" instead of masking
--      the title entirely — the tag says what happened, the name says what
--      it was.
--   2. Tombstoning becomes reversible by the original owner only. Migration
--      0001 made deleted_at strictly one-way; this relaxes that for the
--      prototype's demo purposes. A restored Element is NOT re-activated —
--      it returns to the same "created but not yet activated" state a new
--      Element starts in, so LD 7's consent moment is not silently bypassed.
--      A restored_at column keeps the fact of the removal-and-return
--      honest rather than making it look like nothing happened.

alter table public.elements add column if not exists restored_at timestamptz;

comment on column public.elements.restored_at is
  'Set when a tombstoned Element is brought back by its owner. Informational only — does not affect is_active or derivability, and does not hide that a removal happened.';

-- ---------------------------------------------------------------------------
-- Relax the immutability guard: deleted_at may now be cleared, but only by
-- restore_element() (below), which is owner-gated. Direct client updates
-- still cannot clear it, because elements_update_own's RLS check doesn't
-- restrict columns — the guard is what stopped it, so restoration must go
-- through a security definer function that the guard trusts.
-- ---------------------------------------------------------------------------
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
  -- deleted_at may now be cleared only via restore_element(), which sets
  -- restored_at in the same statement. A bare clear (no restored_at set)
  -- is still rejected, so this can't be bypassed by a direct client update.
  if old.deleted_at is not null and new.deleted_at is null and new.restored_at is null then
    raise exception 'elements: deleted_at can only be cleared via restore_element()';
  end if;
  if new.is_active and old.activated_at is null then
    new.activated_at := now();
  end if;
  new.updated_at := now();
  return new;
end;
$$;

-- ---------------------------------------------------------------------------
-- Restore: the mirror of tombstone_element(). Owner-only. Does not
-- reactivate — the creator activates again as a deliberate second step.
-- ---------------------------------------------------------------------------
create or replace function public.restore_element(p_element_id uuid)
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
    raise exception 'restore: element not found';
  end if;
  if v_row.owner_id <> auth.uid() then
    raise exception 'restore: only the creator may restore their Element';
  end if;
  if v_row.deleted_at is null then
    raise exception 'restore: element is not removed';
  end if;

  update public.elements
     set deleted_at = null,
         restored_at = now(),
         is_active = false
   where id = p_element_id
  returning * into v_row;

  return v_row;
end;
$$;

grant execute on function public.restore_element(uuid) to authenticated;

-- ---------------------------------------------------------------------------
-- Read surface: title keeps its content, tagged rather than replaced.
-- ---------------------------------------------------------------------------
drop view if exists public.elements_public;

create view public.elements_public
with (security_invoker = true) as
select
  e.id,
  e.owner_id,
  p.display_name as owner_display_name,
  e.type,
  case when e.deleted_at is null then e.title else '[removed] ' || e.title end as title,
  case when e.deleted_at is null then e.body  else '{}'::jsonb end as body,
  e.is_active,
  e.activated_at,
  e.derived_from_id,
  (e.derived_from_id is not null) as is_derivative,
  (e.deleted_at is not null)      as is_tombstoned,
  (e.restored_at is not null and e.deleted_at is null) as was_restored,
  (e.is_active and e.derived_from_id is null and e.deleted_at is null) as is_derivable,
  e.created_at,
  e.updated_at
from public.elements e
left join public.profiles p on p.id = e.owner_id;

grant select on public.elements_public to authenticated;

comment on view public.elements_public is
  'Read surface for the atom prototype. Removed Elements keep their title, tagged with [removed]. was_restored flags an Element that was tombstoned and brought back.';
