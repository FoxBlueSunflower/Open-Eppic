-- Open Eppic — Atom Prototype, migration 0009
-- Founder-confirmed 2026-08-07:
--   1. When publish_collection() encounters a Chapter the caller already
--      owns (either collected directly, or pulled in from a collected
--      Work's own Chapters), it now LINKS the existing row via
--      element_links instead of copying it. This matches what
--      attach_chapter_to_work() already means — no reason Publish should
--      behave differently for the exact case that function already
--      handles cleanly. Fixes a duplicate-chapter bug: a Work whose
--      Chapters were already attached elsewhere previously got a second,
--      disconnected copy on every publish.
--   2. Everything else the caller owns (a Character, Setting, etc. with no
--      existing Chapter form) still becomes a NEW Chapter — there is
--      nothing to link to — but that new Chapter now carries
--      derived_from_id back to its source, via derive_element(). This
--      closes a real gap: published Chapters previously had NO lineage
--      stamp at all, inconsistent with every other copy operation in the
--      build. derive_element() requires the source to be activated and an
--      original (LD 6/7), same as everywhere else — an unactivated or
--      already-derivative source Element falls back to an unstamped copy
--      (see note in the loop below), since publishing must not silently
--      fail just because a collected item hasn't been activated.
--   3. Content the caller does NOT own is untouched: still copied, exactly
--      as before. Ownership is what makes linking or lineage-stamping safe;
--      it is not available for someone else's content by design.
--
-- Verified 2026-08-07 as the Theo demo account: publishing the same
-- Collection twice links (not duplicates) an already-owned Chapter across
-- both publishes; an owned, activated non-Chapter Element gets a fresh,
-- separately lineage-stamped Chapter each publish; content owned by
-- someone else still copies plainly with no lineage, unchanged from before.

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
  v_caller    uuid;
begin
  v_caller := auth.uid();
  if v_caller is null then
    raise exception 'publish_collection: not authenticated';
  end if;

  select * into v_col from public.collections where id = p_collection_id;
  if not found or v_col.owner_id <> v_caller then
    raise exception 'publish_collection: you do not own this Collection';
  end if;

  insert into public.elements (owner_id, type, title, body, is_active)
  values (v_caller, 'work', coalesce(nullif(trim(p_work_title), ''), v_col.title), '{}'::jsonb, false)
  returning * into v_work;

  for v_item in
    select e.* from public.collection_items ci
    join public.elements e on e.id = ci.element_id
    where ci.collection_id = p_collection_id
      and e.deleted_at is null
    order by e.title asc
  loop
    if v_item.type = 'work' then
      -- Pull in this Work's own current Chapters, alphabetically.
      for v_source_ch in
        select ch.* from public.element_links el
        join public.elements ch on ch.id = el.child_id
        where el.parent_id = v_item.id
          and ch.deleted_at is null
        order by ch.title asc
      loop
        if v_source_ch.owner_id = v_caller then
          -- Caller owns this Chapter already: link, don't copy.
          insert into public.element_links (parent_id, child_id, position)
          values (v_work.id, v_source_ch.id, v_pos)
          on conflict (parent_id, child_id) do nothing;
        else
          insert into public.elements (owner_id, type, title, body, is_active)
          values (v_caller, 'chapter', v_source_ch.title, v_source_ch.body, false)
          returning * into v_new_ch;
          insert into public.element_links (parent_id, child_id, position)
          values (v_work.id, v_new_ch.id, v_pos);
        end if;
        v_pos := v_pos + 1;
      end loop;

    elsif v_item.type = 'chapter' and v_item.owner_id = v_caller then
      -- A Chapter the caller collected directly and already owns: link.
      insert into public.element_links (parent_id, child_id, position)
      values (v_work.id, v_item.id, v_pos)
      on conflict (parent_id, child_id) do nothing;
      v_pos := v_pos + 1;

    else
      -- Anything else: becomes a new Chapter. If the caller owns the
      -- source and it qualifies for derivation (activated original),
      -- stamp real lineage back to it via derive_element(). Otherwise
      -- (not owned, or not eligible for derivation) fall back to a plain
      -- copy, exactly as before — publishing must not fail on this.
      if v_item.owner_id = v_caller and v_item.is_active and v_item.derived_from_id is null then
        v_new_ch := public.derive_element(v_item.id, v_item.title);
        -- derive_element() copies type from the source; force it to
        -- 'chapter' since that's what Publish means by "becomes a Chapter."
        update public.elements set type = 'chapter' where id = v_new_ch.id;
        v_new_ch.type := 'chapter';
      else
        insert into public.elements (owner_id, type, title, body, is_active)
        values (v_caller, 'chapter', v_item.title, v_item.body, false)
        returning * into v_new_ch;
      end if;
      insert into public.element_links (parent_id, child_id, position)
      values (v_work.id, v_new_ch.id, v_pos);
      v_pos := v_pos + 1;
    end if;
  end loop;

  return v_work;
end;
$$;

comment on function public.publish_collection is
  'Publishes a new Work from a Collection, alphabetical, flat. Chapters the caller already owns (directly, or via a collected Work''s own Chapters) are LINKED, not copied. Anything else owned by the caller becomes a new, lineage-stamped Chapter (derive_element). Content not owned by the caller is always copied, unstamped, matching the pre-existing behavior for non-owned content.';
