# ADR-001: Editor Library — TipTap v3 (MIT surface only)

**Status:** Accepted
**Date:** 2026-07-20
**Deciders:** Founder
**Covenant note:** Technical decision -> engineering ADR, not a transparency-log
entry. The one formational piece it produced — the fork-buildable-dependency
precedent — is logged separately (transparency/interpretations/2026-07-20-
fork-buildable-dependencies.md).

## Context
Locked Decision 8 requires JSON block output stored as JSONB, no HTML WYSIWYG.
Constraints: WeWeb custom components are Vue 3; zero typing-lag is the ship
gate; repo is AGPL-3.0-or-later; Commitment 4 / Part VI require that any fork
be buildable by anyone from open source; deferred features (Block live-sync,
inline variables/CCMS, diffs, endorsement-tag anchoring) must not be
architecturally foreclosed.

## Decision
Adopt TipTap v3 using its MIT-licensed surface only, with first-class Vue 3
bindings, as a headless editor. Custom node types (owned by us) implement
Blocks and later CCMS variables. ProseMirror-direct is the named fallback.

## Options Considered
| Option | Covenant verdict | License | Vue fit | Build cost | CCMS extensibility |
|---|---|---|---|---|---|
| **TipTap v3 (MIT surface)** | complies (4, 6, Aim) | MIT | first-class | low-med | strong |
| ProseMirror direct | complies | MIT | vanilla, fine | high | strong (fallback) |
| Editor.js | strains build methodology | Apache-2.0 (AGPL-compatible one-way) | vanilla | low | weak (stalled pace, coarse inline model, no server validator) |
| Lexical | rejected: framework mismatch | MIT | React-first | — | — |
| Scratch-built | rejected: violates quality-first methodology | n/a | — | months | — |
| Any paid/proprietary editor as load-bearing dep | **violates 4 / Part VI** (fork can't build) + conflicts with AGPL frontend distribution | proprietary | — | — | — |

Key finding: TipTap core is MIT and free; only cloud/platform features
(collaboration, document history) are paid — none of which we use (versioning
is Supabase-side per LD 10; collab is deferred). In mid-2025 TipTap removed the
free cloud plan but open-sourced ten formerly-Pro extensions under MIT,
including drag-handle (Vue 3 flavor), unique-id, file-handler, node-range,
table-of-contents, and details.

## Consequences
- Easier: Block provenance nodes, later inline variables, server-side JSON
  validation in a Supabase Edge Function (prosemirror-model runs in Deno),
  clean Vue integration.
- Harder: we own **all** editor UI (headless) — and therefore own its
  accessibility and its schema-migration discipline permanently.
- Vendor-drift exposure on TipTap-the-company; mitigated by MIT-irrevocability,
  version pinning, and the ProseMirror fallback.
- Revisit trigger: if TipTap re-paywalls an extension we need, drop that
  extension to ProseMirror-direct.

## Version policy
Pin exact versions; commit the lockfile so every fork builds an identical tree.
MIT-published extensions cannot be un-published, so there is no need to track
releases to retain free access. Upgrade only for security fixes, bugs that hit
us (Android/IME fixes are the likely pull), or a feature we choose to adopt.
Each deliberate upgrade is treated as a schema-migration event: re-run the feel
gate (incl. Android/IME) and check for changed node/mark shapes before any
write-back.

## Acceptance Conditions (build-binding)
1. **Schema versioning / no silent content loss.** Stamp a schema-version
   attribute on every stored doc. Editor schema is additive-only (node/mark
   types added, never removed or repurposed — same discipline as the
   moderation enums). Migrate lazily at read time via a version-keyed manifest.
   Never write back a document loaded under a mismatched schema version without
   an explicit migration. (Commitment 3 — stored versions are immutable member
   stewardship.)
2. **Export / portability.** Every custom node type defines its Markdown/HTML
   serialization in the same PR that introduces it; raw JSON export always
   available. (Commitment 4.)
3. **Accessibility.** Editor root carries role="textbox"; all custom chrome
   (toolbar, slash menu, drag handle) is keyboard-operable with managed focus
   and ARIA/semantic structure. MVP baseline now; full WCAG audit via the
   accessibility-review contribution type post-launch. (Commitment 1.)
4. **Android / IME.** The "feel" gate includes Android Chrome plus at least one
   IME, not desktop-Latin only (Commitment 9 — mobile and non-Latin-script
   writers). BlockCopy is a container node (editable inside), not an atom
   island, to avoid the worst contenteditable=false Android behavior. Inline
   variables stay deferred, which keeps MVP atom-node exposure low.
5. **Render safety / XSS.** Published content is rendered from JSON by a static
   or server-side serializer — the editor is never mounted to display content.
   No raw-HTML node type ever. Link href protocols are whitelisted in the
   Edge Function validator.
6. **Concurrency.** Saves carry the base version id and reject on mismatch
   (optimistic concurrency), so two open tabs can't silently last-write-lose.
   (Commitment 3.)
7. **Version pinning.** Exact version pins; lockfile committed. No
   `@tiptap-pro/*` package ever enters the repo. Upgrades batched and treated
   as schema-migration events (see Version policy).
8. **No autosave; Save publishes a version.** There is no autosave. The
   deliberate Save action is the only persistence path and publishes a new
   immutable `element_versions` row (LD 10). Content is not written until the
   user saves. Consequence: a cheap unsaved-changes guard (browser
   beforeunload / in-app navigation warning) is provided so member work isn't
   silently lost on navigation — a guard, not autosave (Commitments 3, 8).
