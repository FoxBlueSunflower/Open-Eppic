-- Open Eppic — Atom Prototype, migration 0010
-- Founder-confirmed 2026-08-07: a Block reused into another Element should
-- just be visible — no separate activation step.
--
-- Root cause of the bug this fixes: derive_element() defaults every new
-- derivative to is_active = false (correct for a normal derivation, which
-- IS a separate publishing decision). derive_block_into() called
-- derive_element() and never overrode that default. But is_active on a
-- Block-derivative can only ever mean "visible to others" — LD 6 already
-- bars a derivative from being re-derived, so the "open to derivation"
-- half of what is_active means elsewhere is moot here. Leaving a reused
-- Block inactive-by-default therefore didn't gate anything real; it just
-- made the Block invisible to everyone but its new owner, including
-- anyone who could already see the parent Element it was attached to.
--
-- Fix: derive_block_into() now activates the derivative immediately after
-- deriving it, stamping activated_at the same way set_activation() does.
-- The parent Element's own visibility is unchanged by this — a Block
-- reused into a not-yet-activated Element is still only visible to that
-- Element's owner, because elements_public still requires EITHER
-- ownership OR is_active, and nothing here touches the parent.
--
-- Also retroactively fixes the one already-existing affected row
-- (Maren's "Standard Ward-Sigil (derived)" attached to "The Ninth
-- Lantern"), which was invisible to Theo before this migration.

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

  -- derive_element() still does the real work: activation gate on the
  -- SOURCE, no sub-derivation, owner/lineage set server-side.
  v_child := public.derive_element(p_block_id, null);

  -- A reused Block is part of its host's content, not a separate
  -- publishing decision — make it visible immediately, matching the
  -- founder's confirmation (2026-08-07). Same fields set_activation()
  -- would set, applied directly here rather than via a second call so
  -- this stays one atomic operation.
  update public.elements
     set is_active = true,
         activated_at = coalesce(activated_at, now())
   where id = v_child.id
  returning * into v_child;

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

comment on function public.derive_block_into is
  'Reuses a Block inside another Element via derive_element(). The resulting derivative is activated immediately (2026-08-07): a Block-derivative cannot be re-derived (LD 6), so is_active here can only mean visibility, not a further derivation gate — defaulting it inactive only broke visibility for content already attached to an activated parent.';

-- Retroactive fix for the one row affected before this migration existed.
update public.elements
set is_active = true, activated_at = coalesce(activated_at, now())
where type = 'block'
  and derived_from_id is not null
  and is_active = false
  and deleted_at is null
  and id in (select child_id from public.element_links);
