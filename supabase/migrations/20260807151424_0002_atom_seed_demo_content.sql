-- Open Eppic — Atom Prototype, seed data.
-- DEMO BOUNDARY: every Element below is founder-authored throwaway content.
-- No member originals enter this instance before the Phase 5 attorney gate.
-- Two accounts so RLS is exercised from day one, per the build methodology.
-- Idempotent: re-running is a no-op once elements exist.

do $$
declare
  v_maren uuid;
  v_theo  uuid;
  v_char  uuid;
  v_set   uuid;
begin
  -- ---- Demo accounts (password for both: demo-atom-2026) -------------------
  select id into v_maren from auth.users where email = 'maren@demo.openeppic.test';
  if v_maren is null then
    v_maren := gen_random_uuid();
    insert into auth.users (
      instance_id, id, aud, role, email, encrypted_password,
      email_confirmed_at, created_at, updated_at,
      raw_app_meta_data, raw_user_meta_data
    ) values (
      '00000000-0000-0000-0000-000000000000', v_maren, 'authenticated', 'authenticated',
      'maren@demo.openeppic.test', crypt('demo-atom-2026', gen_salt('bf')),
      now(), now(), now(),
      '{"provider":"email","providers":["email"]}'::jsonb,
      '{"display_name":"Maren (world owner)"}'::jsonb
    );
  end if;

  select id into v_theo from auth.users where email = 'theo@demo.openeppic.test';
  if v_theo is null then
    v_theo := gen_random_uuid();
    insert into auth.users (
      instance_id, id, aud, role, email, encrypted_password,
      email_confirmed_at, created_at, updated_at,
      raw_app_meta_data, raw_user_meta_data
    ) values (
      '00000000-0000-0000-0000-000000000000', v_theo, 'authenticated', 'authenticated',
      'theo@demo.openeppic.test', crypt('demo-atom-2026', gen_salt('bf')),
      now(), now(), now(),
      '{"provider":"email","providers":["email"]}'::jsonb,
      '{"display_name":"Theo (sub-creator)"}'::jsonb
    );
  end if;

  if exists (select 1 from public.elements) then
    return;
  end if;

  -- ---- Maren's originals ---------------------------------------------------
  insert into public.elements (owner_id, type, title, body, is_active, activated_at)
  values (
    v_maren, 'character', 'Sister Wren of the Ninth Lantern',
    jsonb_build_object(
      'summary', 'A lamplighter-monastic who tends the border shrines and keeps the record of who passed through.',
      'notes',   'Speaks little. Carries the ledger. Will not lie, but will decline to answer.'
    ),
    true, now()
  )
  returning id into v_char;

  insert into public.elements (owner_id, type, title, body, is_active, activated_at)
  values (
    v_maren, 'setting', 'The Ninth Lantern',
    jsonb_build_object(
      'summary', 'The last shrine on the salt road, lit every dusk for four hundred years without a night missed.',
      'notes',   'The lighting is a duty inherited, never assigned.'
    ),
    true, now()
  )
  returning id into v_set;

  -- an original still closed to derivation, so the gate visibly has two states
  insert into public.elements (owner_id, type, title, body, is_active)
  values (
    v_maren, 'event', 'The Night the Lantern Failed',
    jsonb_build_object('summary', 'Unfinished. Not yet opened to the Space.'),
    false
  );

  -- ---- Theo's derivatives --------------------------------------------------
  insert into public.elements (owner_id, type, title, body, derived_from_id, is_active, activated_at)
  values (
    v_theo, 'character', 'Wren, After the Salt Road',
    jsonb_build_object(
      'summary', 'The same lamplighter, twenty years on, no longer keeping the ledger for anyone but herself.',
      'notes',   'Theo''s own additions: the limp, the second ledger, the boy she refuses to name.'
    ),
    v_char, true, now()
  );

  insert into public.elements (owner_id, type, title, body, derived_from_id, is_active, activated_at)
  values (
    v_theo, 'setting', 'The Ninth Lantern, Dark',
    jsonb_build_object('summary', 'The same shrine in the years after it stopped being lit.'),
    v_set, true, now()
  );
end $$;
