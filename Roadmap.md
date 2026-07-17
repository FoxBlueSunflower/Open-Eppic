# Open Eppic — Build Roadmap (v1.0)
 
The Covenant (`Open_Eppic_Covenant.md`) is the highest overarching philosophy of this build. This Roadmap is subordinate to it and to `MVP_Spec.md`, and must be assessed against both. Unlike the Covenant, this is a **living document** — phases get checked off or annotated as work proceeds, and scope shifts are recorded here rather than left to drift silently. This Roadmap does not override MVP_Spec.md's Locked Decisions; if a phase turns out to require reopening one, that conflict is flagged the same way any other locked-decision conflict is flagged.
 
---
 
## Phase 0 — Foundations (pre-code)
 
- Finalize the Open Strategic Decisions enough to unblock schema work: editor library, perpetual license form (enough to know what fields it needs, not final legal language), GitHub repo license, definition of "Evil" (enough to gate Content Guidelines drafting). These don't all need to be *fully* resolved, but each blocks something downstream — flag which.
- **Build the transparency-log infrastructure itself**, sequenced before any strategic decision that would become the log's first real entry (e.g., the "Evil" definition, or any early moderation edge case). This is a prerequisite to decision-making, not a companion feature bundled with later governance UI:
  - Document and commit the markdown convention for constitutional interpretations, opening with a historical-note pointer to the pre-existing **Open-Eppic-Research-and-Theory** repo (where prior decisions and research already live — this log is not a re-capture of that history, only what follows it).
  - Stand up a minimal moderation-outcomes data table with a public read view.
  - Implement baseline periodic report generation: a simple markdown report of aggregated hard numbers for the period (totals only — no comparisons, no charts). Report cadence (monthly or otherwise) is decided here.
  - Resolve the detailed shape (table schema, RLS/public-view design, report cadence) as part of this work — see MVP_Spec.md's "Transparency log detailed shape" open decision.
- User interviews / journey mapping for the three user types (Space Owner, Creator, Reader), per the build methodology.
- Per-type metadata JSON contracts for each Element type (Work, Chapter, Character, Setting, System, Event, Item, Block) — needed before schema, per Locked Decision 8 / methodology note.
- Legal: IP attorney engagement on license text, DMCA agent registration — long lead time, start early even though it lands pre-launch.
## Phase 1 — Walking Skeleton
 
- One vertical slice: create Space → Brand → Element → link → derive, end-to-end, ugly UI, real RLS.
- RLS policies designed and tested with a second dummy account before any UI work, per methodology.
- Supabase schema as versioned CLI migrations from commit #1 — no dashboard edits. If the transparency-log data table (Phase 0) isn't already migrated in, it belongs in this initial schema pass.
- Seed data script alongside this, not after.
## Phase 2 — Core CRUD Loop
 
- Editor (once library is chosen) gets its dedicated page; typing-lag is the gate for shipping it.
- Element/Block CRUD, per-type metadata forms driven by the JSON contracts from Phase 0.
- Activation gate (Home Work rule) enforced server-side (trigger/Edge Function).
- Element versioning substrate (append-only `element_versions`, current-version pointer) — no UI yet.
- Soft-delete/tombstone pattern implemented and tested against lineage-survival requirement.
## Phase 3 — Collections & Publishing
 
- Collect button → flat/filterable Collection → ordered/hierarchical → Publish to Work.
- This is explicitly sequenced *after* the editor/Element loop is streamlined, per Locked Decision 11.
## Phase 4 — Reader Loop & Governance Baseline
 
- Following (Users, Collections, Elements) — sole Reader mechanic.
- Report button on every Element, DMCA takedown flow, Public Domain admin account with review queue.
- **Wire these governance features into the transparency log already built in Phase 0** — every DMCA action, moderation decision, and Public-Domain-account intervention writes a log entry as part of the workflow, not as a follow-up step. This phase does not stand up the log itself; that infrastructure already exists by this point.
- These features are Covenant-load-bearing (Commitments 1, 6, 9) as much as feature work — not a "nice to have" tacked on later.
## Phase 5 — Pre-Launch Hardening
 
- Second-account RLS re-audit across all tables (public-by-accident assumption re-tested after full schema exists, not just at Phase 1).
- Legal review completion (license text, DMCA registration finalized).
- Verify the transparency log's public data and periodic report are actually publicly reachable (not just present in the database) — a public-facing view/page, even minimal, before launch.
- Confirm open-source repo is public and satisfies the code/schema half of Commitment 6 (already substantially met by the Phase 1 migrations-in-GitHub discipline — this is a verification step, not new work).
---
 
## Explicitly Excluded From This Roadmap
 
Per MVP_Spec.md's Deferred Features list: endorsement tags, versioning UI, formal invites, cross-space linking, block live-sync, multi-ownership, monetization/marketplace, bounty system, services offering, likes/comments/canon voting/DMs, multi-channel publication. Architecture at every phase above should be checked against not foreclosing these — flag if a specific schema or UI decision risks that.
 
---
 
## Open Tensions to Watch
 
- **Phase 4 governance vs. Commitments 1 & 6**: the "publish pattern, not pillory" mechanism (system-truth transparency vs. individual dignity) needs real design before the first moderation action happens — not improvised live. Worth scoping as its own mini-spec before Phase 4 starts.
---
 
## How to Use This Document
 
- Phases are worked in order; do not advance to the next phase without confirmation, per working rules.
- Annotate phases here as work completes or scope shifts — this doc is the record of what actually happened, not just what was planned.
- If a phase requires reopening a Locked Decision in MVP_Spec.md, flag it explicitly rather than quietly proceeding.
- New Open Strategic Decisions or Deferred Features discovered mid-build get added to MVP_Spec.md, not buried only here.
