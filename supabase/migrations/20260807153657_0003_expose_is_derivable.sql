-- Open Eppic — Atom Prototype, migration 0003
-- Founder confirmation (2026-08-07): is_active means "published and visible"
-- AND "open to derivation".
--
-- That holds for originals. It cannot hold for derivatives, because LD 6 makes
-- derivatives non-derivable: a published derivative is visible and closed.
-- So derivability is not a stored flag but a computed fact, and the read
-- surface says so explicitly rather than leaving the client to infer it.

drop view if exists public.elements_public;

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
  -- the single source of truth the UI binds its Derive button to
  (e.is_active and e.derived_from_id is null and e.deleted_at is null) as is_derivable,
  e.created_at,
  e.updated_at
from public.elements e
left join public.profiles p on p.id = e.owner_id;

grant select on public.elements_public to authenticated;

comment on view public.elements_public is
  'Read surface for the atom prototype. is_active = published and visible. is_derivable = published AND original AND not tombstoned (LD 6 bars sub-derivation).';
