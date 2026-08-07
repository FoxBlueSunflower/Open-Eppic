# Open Eppic — The Atom Prototype

**Status:** prototype — not a product, not a launch, not a member-facing
instance. Founder-authored seed content only.

## What it is

The smallest artefact that makes the idea legible in one sitting:

> create original → activate → derive → render the unbreakable lineage line.

Nothing else. No Spaces (one implied), no Brands, no Collections, no Following,
no endorsement tags, no governance, no editor library. Those are all real MVP
scope and all deliberately absent here, because the point of this build is to
put the *idea* in front of people quickly, not to ship the platform.

The test of whether it works: a person watches the derive-and-show-lineage
happen once, with no explanation, and immediately imagines the tree that grows
from it.

## The demo boundary (binding)

No member's original content enters this instance before the Phase 5 attorney
gate (MVP_Spec LD 13). Seed content is founder-authored and disposable. If a
prospect wants to try it with their own material, that material is stated as
throwaway *before* they type a word.

Rationale: there is no reviewed licence text, no export, no moderation, and no
terms to disclose. Inviting real originals in would be a Commitment 6 failure —
a creator entering a regime that does not yet exist.

Assent under the rights architecture fires at activation/derivation, not at
signup, so a prototype containing no member originals executes no grant and
touches nothing the attorney gate protects.

## Schema

One table, one view, three functions.

| Object | Purpose |
|---|---|
| `elements` | The whole content model. Subset of LD 5's polymorphic graph — same `type` enum, no `element_links` yet. |
| `elements_public` | Read surface. Masks tombstoned content while keeping the node in the lineage graph. Exposes the computed `is_derivable`. |
| `set_activation()` | The creator consent moment (LD 7). Withdrawal is prospective-only. |
| `derive_element()` | The only path that may write `derived_from_id`. Enforces the activation gate and the no-sub-derivation rule. |
| `tombstone_element()` | Soft delete. Lineage survives. |
| `restore_element()` | Reverses a tombstone, owner-only. Does not re-activate — the creator must activate again (LD 7's consent moment is a deliberate second step, not silently restored). |

Invariants enforced in the database, not the client:

- `owner_id` and `derived_from_id` are set server-side and are immutable after
  insert (build methodology; LD 6).
- Derivatives can only be created through `derive_element()`; the RLS insert
  policy permits originals only, so lineage cannot be forged from WeWeb.
- Hard deletes raise. `deleted_at` is one-way **except through `restore_element()`**,
  which is owner-gated and stamps `restored_at` so the reversal leaves a
  trace rather than looking like it never happened. This departs from the
  strict one-way soft-delete the build methodology otherwise specifies;
  accepted for prototype purposes (2026-08-07), not the intended MVP
  behavior — LD 10's own append-only-versioning approach to content history
  is the more likely long-term shape for "undo," not a reversible tombstone.
- Derivatives cannot be derived from (LD 6).
- Removed Elements keep their title, tagged `[removed] Original Title`
  rather than masked outright — the read surface (`elements_public`) still
  withholds `body` content, only `title` is shown.

## What it does *not* prove

- **The editor.** LD 8 is still open; this uses a plain field. The typing-lag
  gate is untested and a good demo reception is not evidence it is solved.
- **Any demand claim.** Everything in the journeys corpus remains
  hypothesis-grade until people are actually shown this.

## Second-account verification

Run as `authenticated` impersonating the sub-creator account:

| # | Check | Result |
|---|---|---|
| 1 | Sees only the world owner's *activated* originals | PASS |
| 2 | Cannot derive from a non-activated Element (LD 7) | PASS |
| 3 | Cannot derive from a derivative (LD 6) | PASS |
| 4 | Cannot forge `derived_from_id` on insert | PASS |
| 5 | Cannot activate another creator's Element | PASS |
| 6 | Cannot hard delete | PASS (RLS no-op; trigger raises under privileged roles) |
| 7 | Cannot rewrite lineage on their own derivative | PASS |
| 8 | Legitimate derivation succeeds | PASS |

## Activation semantics (founder-confirmed 2026-08-07)

`is_active` means **published and visible** *and* **open to derivation**.

For originals this is exactly true and is the consent moment of LD 7. For
derivatives it cannot be, because LD 6 bars sub-derivation: a published
derivative is visible and closed. Derivability is therefore a *computed* fact,
not a stored flag, and `elements_public` exposes it as `is_derivable`
(`is_active AND original AND not tombstoned`) so no client ever has to infer
it. The UI binds its Derive affordance to `is_derivable`, never to
`is_active`.

Consequence to carry forward: if the deferred cross-Space or sub-derivation
work ever changes the LD 6 bar, `is_derivable` is the one place the rule
lives.

## Demo accounts

`maren@demo.openeppic.test` (world owner) and `theo@demo.openeppic.test`
(sub-creator), password `demo-atom-2026`. Dev environment only; rotate or drop
before any instance is publicly reachable.

## A GoTrue pitfall worth remembering

Migration 0002's original seed insert into `auth.users` supplied only a
subset of columns, leaving `confirmation_token`, `email_change`,
`recovery_token` and similar columns `NULL`. Postgres allows this; GoTrue's
Go driver does not — it scans these as non-nullable strings, so **every**
sign-in and admin/users call failed with `converting NULL to string is
unsupported`, surfaced to the client as a generic "Database error querying
schema." This has nothing to do with RLS, triggers, or the schema in
`0001`; it is purely a GoTrue driver constraint on `auth.users` rows created
directly by SQL rather than through the Auth API. Fixed in migration `0004`
and patched into `0002` so a fresh run doesn't reproduce it. Anyone seeding
`auth.users` directly in future work should set these columns to `''`, not
leave them at their column default.
