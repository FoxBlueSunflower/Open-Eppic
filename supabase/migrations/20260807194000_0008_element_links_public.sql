-- Open Eppic — Atom Prototype, migration 0008
-- Read surface for element_links, joined against elements_public so the
-- UI gets titles/types/status in one query instead of N+1ing them.

create view public.element_links_public
with (security_invoker = true) as
select
  el.id,
  el.parent_id,
  el.child_id,
  el.position,
  ep.title       as child_title,
  ep.type        as child_type,
  ep.is_active   as child_is_active,
  ep.is_tombstoned as child_is_tombstoned,
  ep.is_derivative as child_is_derivative,
  ep.owner_id    as child_owner_id
from public.element_links el
join public.elements_public ep on ep.id = el.child_id;

grant select on public.element_links_public to authenticated;
