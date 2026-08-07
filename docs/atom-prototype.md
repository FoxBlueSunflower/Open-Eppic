# Open Eppic — The Atom Prototype

**Status:** prototype — not a product, not a launch, not a member-facing
instance. Founder-authored seed content only.

## What it is

The smallest artefact that makes the idea legible in one sitting:

> create original → activate → derive → render the unbreakable lineage line.

Extended 2026-08-07 with three founder-requested compositions that grew
naturally out of the same lineage mechanic rather than being separate
features: Works as collections of Chapters, Blocks reusable in other
Elements as static lineage-stamped copies, and Collections that can publish
their assembled pieces as a new Work. Still absent, and still real MVP
scope deliberately not built here: Spaces (one implied), Brands, Following,
endorsement tags, governance, the editor library. The point remains putting
the *idea* in front of people quickly, not shipping the platform — the three
additions earned their place because each is a small, direct extension of
the same `derive`/`activate`/lineage core, not a new mechanic.

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

Content model: one table, two views, four functions. Composition (Works,
Chapters, Block reuse): one join table, one view, three functions.
Collections: two tables, two views, four functions.

| Object | Purpose |
|---|---|
| `elements` | The whole content model. Subset of LD 5's polymorphic graph — same `type` enum. |
| `elements_public` | Read surface. Masks tombstoned content while keeping the node in the lineage graph (title is tagged, not hidden — see below). Exposes the computed `is_derivable`. |
| `set_activation()` | The creator consent moment (LD 7). Withdrawal is prospective-only. |
| `derive_element()` | The only path that may write `derived_from_id`. Enforces the activation gate and the no-sub-derivation rule. |
| `tombstone_element()` | Soft delete. Lineage survives. |
| `restore_element()` | Reverses a tombstone, owner-only. Does not re-activate — the creator must activate again (LD 7's consent moment is a deliberate second step, not silently restored). |
| `element_links` | Composition edges. Two shapes only: Work→Chapter, and non-Work-non-Block Element→Block-derivative. A strict subset of LD 5's wider adjacency-list design — no link "kind" yet, since composition is the only kind built here. |
| `element_links_public` | Read surface joining links against `elements_public`, so the UI gets child title/type/status without N+1 queries. |
| `attach_chapter_to_work()` / `detach_chapter_from_work()` | Owner-gated. Attaching does not copy anything — the Chapter stays itself, just ordered under the Work. This is the "Works are collections of Chapters" mechanic. |
| `derive_block_into()` | Block reuse. Calls `derive_element()` under the hood — a "used" Block is a real, lineage-stamped derivative owned by whoever reused it, not a live reference. Explicitly refuses a Work as the host (Works hold Chapters, not Blocks) and refuses a Block as the host (no nesting). Static-copy-with-lineage, per LD 9 as written — not the deferred live-sync model. **Activates the derivative immediately** (2026-08-07 fix): `derive_element()`'s normal inactive-by-default behavior made reused Blocks invisible to anyone but their new owner, including people who could already see the parent Element the Block was attached to — a real visibility bug, not a design choice, since a Block-derivative can never be re-derived (LD 6) so `is_active` here has nothing left to gate except plain visibility. The UI's Block picker also initially excluded the caller's own activated Blocks (a separate, unstated restriction); fixed 2026-08-07 — reusing your own Blocks is exactly what the modularity use case needs. |
| `collections` / `collection_items` | A persistent, owner-private curation object. **Not** part of the `elements` graph — Collections sit outside LD 5's content types entirely, closer to a personal list than a content type. |
| `collections_with_counts` / `collection_items_public` | Read surfaces for the above. |
| `create_collection()` / `add_to_collection()` / `remove_from_collection()` | Ownership-gated; `add` also checks the Element being added is actually visible to the caller (owned, or activated). |
| `publish_collection()` | Creates a new Work; walks the Collection's items **alphabetically by title**; a Work item contributes **its own current Chapters individually** (also alphabetical), not itself as a single summary Chapter. **Chapters the caller already owns — collected directly, or reached via a collected Work's own Chapters — are linked (`element_links`), never copied**, matching what `attach_chapter_to_work()` already means. Anything else the caller owns becomes a new Chapter **stamped with real lineage** back to its source via `derive_element()` (added 2026-08-07 — previously an unstamped copy, the one place in the build that silently dropped lineage). Content the caller does **not** own is still copied, unstamped — ownership is what makes linking or lineage-stamping safe. Snapshot at publish time regardless: nothing is cached from when an item was added, and publishing the same Collection twice creates two independent Works (though any owned Chapters they share are the *same* linked row, not duplicated). |

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
- Derivatives cannot be derived from (LD 6) — this also bounds Block reuse:
  a reused Block's copy cannot itself be reused again as a source.
- Removed Elements keep their title, tagged `[removed] Original Title`
  rather than masked outright — the read surface (`elements_public`) still
  withholds `body` content, only `title` is shown.
- `element_links` writes only happen through the three composition RPCs;
  there is no direct insert/update/delete policy on the table (RLS defaults
  to deny), so the composition rules (Work↔Chapter only, Block↔non-Work
  only, no Block nesting) cannot be bypassed from the client.

## What it does *not* prove

- **The editor.** LD 8 is still open; this uses a plain field. The typing-lag
  gate is untested and a good demo reception is not evidence it is solved.
- **Any demand claim.** Everything in the journeys corpus remains
  hypothesis-grade until people are actually shown this.
- **Collections at MVP scope.** LD 11 sequences Collections *after* the
  Element/Block CRUD loop is streamlined; this prototype has Collections and
  Work-Chapter composition ahead of that sequencing, which is fine for a
  disposable demo but is a visible departure worth naming rather than a
  quiet drift — a real Phase 3 build should still follow LD 11's ordering.
  The atom's "flat, alphabetical, no filtering" Collection is also far
  simpler than LD 11's eventual "flat/filterable, then ordered/hierarchical"
  shape; nothing here should be read as having settled that design.

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

**A second consequence, surfaced by a real bug (2026-08-07):** for a
Block-derivative specifically, `is_active` can *only* ever mean "visible" —
the "open to derivation" half is moot, because a derivative can never be
re-derived regardless of activation state (LD 6). `derive_block_into()`
originally left every reused Block at `derive_element()`'s normal
inactive-by-default, which — since that default exists to gate a *further
publishing decision* that doesn't apply here — did nothing but make reused
Blocks invisible to anyone who could already see the Element they were
attached to. Fixed by activating the derivative immediately on creation.
The general lesson: `is_active`'s meaning is not uniform across every
`type` value, and a default that is correct for originals is not
automatically correct for every derivative shape.

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
