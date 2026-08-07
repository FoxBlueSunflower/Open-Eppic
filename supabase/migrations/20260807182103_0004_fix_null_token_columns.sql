-- Open Eppic — Atom Prototype, migration 0004
-- Fix: migration 0002's seed insert into auth.users left several token
-- columns NULL. GoTrue's Go driver scans these as non-nullable strings, so
-- every /token (sign-in) and /admin/users call failed with "Database error
-- querying schema" / "converting NULL to string is unsupported" — a GoTrue
-- driver constraint, not an RLS or application issue. Coerce to empty string
-- for the two demo users and guard against recurrence.
--
-- Migration 0002 is patched in place (not just this fix) so a fresh run of
-- the full migration set does not reproduce the bug.

update auth.users
set
  confirmation_token          = coalesce(confirmation_token, ''),
  email_change                 = coalesce(email_change, ''),
  email_change_token_new       = coalesce(email_change_token_new, ''),
  email_change_token_current   = coalesce(email_change_token_current, ''),
  recovery_token                = coalesce(recovery_token, ''),
  phone_change                   = coalesce(phone_change, ''),
  phone_change_token             = coalesce(phone_change_token, '')
where email in ('maren@demo.openeppic.test', 'theo@demo.openeppic.test');
