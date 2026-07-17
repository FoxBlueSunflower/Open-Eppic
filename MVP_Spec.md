# Open Eppic — MVP Specification (v1.2)

The Covenant (`Open_Eppic_Covenant.md`) is the highest overarching philosophy of this build. Every feature, workflow, architecture, and process decision in this document is subordinate to it and must be assessed against it.

---

## Glossary

- **Space** — a walled, multi-tenant community hub; the unit of hosting/billing.
- **Category** — broadest structural bucket (e.g., Fiction / Non-Fiction); broad enough that natural borders exist between them; edge cases acknowledged.
- **Brand** — an IP identity within exactly one Category; owned by one creator.
- **Element** — the universal content entity. Types: Work, Chapter, Character, Setting, System, Event, Item, Block.
- **Work** — an Element representing a finished expression (book, illustration, etc.); the target of Collection publishing and the trigger of the activation gate.
- **Block** — a reusable content chunk; in MVP, static copies only.
- **Derivative** — an Element copied from an original, permanently stamped with `derived_from_id`; non-monetizable, non-derivable, Space-locked.
- **Activation gate ("Home Work" rule)** — original Elements cannot be linked to or derived from until their creator links them to a published Work (establishes legal "expression" and acts as a quality gate).
- **Collection** — a user's gathering of Elements: flat/filterable first, then ordered/hierarchical; publishable to a Work.
- **Endorsement tag** — a tag applicable only by the original creator of an Element to derived/linked Elements; requires an owner-authenticated write path (deferred, high priority).
- **Covenant** — `Open_Eppic_Covenant.md`; the governing philosophy of the entire build.
- **Transparency Log** — the Covenant's public accountability record (Commitment 6, Part IV Transparency). Split by kind per Locked Decision 16: constitutional interpretations as GitHub markdown; moderation outcomes as public data plus a baseline periodic markdown report. Opens with a pointer to **Open-Eppic-Research-and-Theory** for pre-existing history. Report cadence: monthly (automated). Constitutional-interpretation log takes the broad reading — see `transparency/README.md`.

---

## Build Methodology

- **Walking skeleton first**: one end-to-end vertical slice (create Space → Brand → Element → link → derive) before building features wide.
- **Before building**: define user "loop" pathways and journeys for each user type (Space Owner, Creator, Reader); assess and design MVP UI with deferred features in mind so layouts don't foreclose them.
- **RLS-first security**: design and assess Row-Level Security policies before UI. Treat every table as public-by-accident until proven otherwise; test with a second dummy account from day one.
- **Server-side authority**: ownership (`owner_id`), lineage (`derived_from_id`), endorsement writes, and activation-gate flips are set by Postgres triggers / Supabase Edge Functions — never by client submissions from WeWeb.
- **Soft deletes only**: `deleted_at` timestamps + tombstoning. Hard deletes are forbidden — lineage must survive deletions, and DMCA takedowns must hide content while preserving lineage records.
- **Schema under version control**: all schema changes via Supabase CLI migrations committed to GitHub (never dashboard-only edits). This is both engineering hygiene and the Covenant's forkability/transparency commitment. The official public GitHub repo is the "Home of transparency."
- **Seed data script**: built alongside development — populates a demo Space with a full graph (brands, elements, links, a derivative, a collection) for testing and demos.
- **Editor "feel" standard**: zero cursor/typing lag is the bar. Prefer a slim editor over a feature-rich one that lags. The editor gets its own clean, dedicated page to maximize its performance budget.
- **Per-type metadata contract**: define a minimal documented JSON shape per Element type before building (prevents inconsistent polymorphic JSONB sprawl). To be worked out together; YAML/JSON format appropriate here.
- **High-level phase design** includes user interviews (per *Deploy Empathy*; user has sources) and pre-launch legal review — IP attorney on license text + DMCA agent registration with the US Copyright Office.

---

## Locked MVP Decisions

*Do not reopen unless the user asks. If a request conflicts with one of these, flag the conflict rather than silently complying.*

1. **Spaces are walled gardens for linking/derivation** — no cross-space links or derivations. However, a user **can transfer or copy their 100% original content between Spaces**. Derivative content is permanently locked to its Space.
2. **Space membership**: Original IP owners + Space owner decide who can join. Formal invite mechanics deferred.
3. **Single ownership only** for Spaces, Brands, and Elements. Multi-ownership deferred.
4. **Brand belongs to exactly one Category.** Categories are broad with natural borders (e.g., Fiction / Non-Fiction). Tags handle all granularity (genre, warnings, discoverability).
5. **Polymorphic Element graph**: all entity types (Work, Chapter, Character, Setting, System, Event, Item, Block) live in one `elements` table with a `type` column; connections via a central `element_links` join table (adjacency list).
6. **Permanent lineage**: `derived_from_id` set once at derivation, immutable thereafter. Derivatives are non-monetizable and non-derivable. Derivation as a *sanctioned, lineage-tracked mechanic* exists only on the platform — a platform-scope claim, not a claim that people can't post crossovers elsewhere.
7. **Home Work activation gate**: original Elements are locked from linking/derivation by others until their creator links them to a published Work.
8. **Editor**: JSON block-based output stored as JSONB; no HTML WYSIWYG. **Specific editor library is an open strategic decision** — TipTap has commercial licensing costs conflicting with lean financials; evaluate alternatives (Editor.js, ProseMirror direct, Lexical, others) on cost, WeWeb custom-component compatibility, JSON output structure, and typing-lag performance.
9. **Blocks in MVP: static copies only.** No live-sync or review pipeline.
10. **Element versioning (minimal) is in the MVP**: content updates are append-only — saving publishes a new immutable row in an `element_versions` table rather than overwriting, with a current-version pointer on the Element. This is what Publish-to-Work re-publishing hangs on, guarantees derivatives/static Block copies never break, and lays the substrate for the deferred diff/review pipeline. It must exist to test and resolve soft-delete workflows and related interactions. **No versioning UI in the MVP** (no history browsing, no restore) — unless a minimal UI proves necessary to test how core functions interact with versioning. What stays deferred: live-sync, frozen-state management, side-by-side diff review, and version-change notifications beyond the basic "a Work you follow was updated."
11. **Collections are in the MVP** as part of the higher-level CRUD flow: "Collect" button on any Element → flat, filterable gathering (built first), then ordered/hierarchical structuring, then **Publish to Work** (the only publish target). Priority order: the editor and Element/Block CRUD loop come first and must feel streamlined before Collection work.
12. **Following is in the MVP**: the sole Reader mechanic at this stage (follow Users, Collections, Elements).
13. **Perpetual licensing: undecided but immensely core.** Likely form: perpetual license restricted to the platform, granted to sub-creators. Exact form to be worked out; flag it in all schema/infra decisions so nothing forecloses it. **Attorney review of the final license text is a Phase 5 launch gate: drafts (including AI-assisted drafts) are requirements work, non-final by definition (2026-07-17; Commitment 3).**
14. **Governance baseline**: report button on every Element + formalized DMCA takedown flow + platform-owned Public Domain administrative account (user submissions via review queue).
15. **WeWeb usage**: native/premade WeWeb elements wherever possible; custom coded Vue components only where truly necessary (e.g., the JSON block editor).
16. **Transparency log is split by kind: interpretations as markdown, outcomes as data — infrastructure precedes decisions.** Constitutional interpretations (rare, high-weight applications of the "When Commitments Appear to Conflict" rules) are written as markdown and committed to the public GitHub repo — git history is the audit trail. Moderation outcomes (frequent, structured — DMCA actions, enforcement decisions, pattern-level statistics) are stored as data with a public read path. The reporting floor is **data plus a simple periodic markdown report** of aggregated hard numbers (totals for the period; no comparisons, no charts) — both required at minimum, not data alone. Comparative reporting and visualization are later enhancements. This log infrastructure must exist **before** it is first exercised. **Amended 2026-07-17:** in Phase 0 this means the markdown convention (done) plus a committed **capture-schema specification** for moderation outcomes; the physical table, public read view, and report generation are built in Phase 1's initial schema pass from that spec — before the platform can produce its first moderation datum, preserving the infrastructure-precedes-use principle (see transparency log, 2026-07-17 rescope entry). The markdown log opens with a historical-note pointer to the pre-existing **Open-Eppic-Research-and-Theory** repo, where prior decisions and research already live — this log is not a re-capture of that history, only what follows it. Detailed shape (table schema, public view/RLS design, report cadence) is an Open Strategic Decision, resolved in Phase 0.
17. **Repo license & contributor terms: AGPL-3.0-or-later + DCO; CLAs refused permanently.** AGPL-3.0-or-later chosen for immediate forkability (Covenant Part VI; Commitments 4, 6) and anti-extraction copyleft (the Aim). "Or-later" (AGPL §14's own option) provides covenant-safe license-version migration without creating platform-held relicensing rights. Contributions require DCO sign-off (provenance certification only). CLAs and copyright assignment are rejected as extractive (Commitments 3, 5) — permanently, not deferred. Custom unreachable-contributor clause: referred to IP attorney; adopted only if draft language survives Covenant assessment, as its own transparency-log entry. Accepted consequence: relicensing outside the AGPL family requires per-contributor consent — the platform binds itself alongside its contributors. See transparency log entries of 2026-07-16.
18. **Contribution policy: constrained scope, quality-first core, open periphery.** Core contributions are accepted only when aligned with communicated build goals and focus areas. Security contributions are welcome at all times, as are bug reports and reproduction cases, documentation and onboarding writing, accessibility review, user-research participation, design/UX critique, and covenant scholarship. Core development prioritizes systemic quality (Deming) over feature accretion; contributor feature energy is directed toward add-ons and integrations. Every accepted contribution is recorded in the public contribution ledger (`transparency/contribution-ledger.md`) — chosen public name only, no contact information (Commitment 1 / conflict rule 3).

---

## Open Strategic Decisions

- **Editor library** — cost, WeWeb custom-component compatibility, JSON output structure, typing-lag performance.
- **Perpetual license form** — likely platform-restricted; exact terms TBD.
- **Contributor recompense — covenantal, not transactional.** Recompense begins with being heard, worked with openly, and publicly recognized; extends to participation in future value systems (monetary or otherwise) if/when they exist, decided transparently and logged at a named milestone. Symmetric constraint: no provision may enable contributors to extract from the platform or its members. Future brainstorm scoped, deferred with monetization: reach/exposure micro-compensation; member advertising limited to on-platform Brands/Works/Elements (the platform itself does not advertise — advertising would introduce transactional strangers into the covenant community); gift-economy structural alignment. Each requires assessment against Commitments 9 (rich-get-richer gradients drown smaller voices) and 11 (reach rewards can quietly become an engagement economy) before design.
- **Definition of "Evil" in the Covenant (Commitment 2)** — needs fleshing out; gates Content Guidelines and moderation design.
- **Transparency log detailed shape** — moderation-outcome capture schema (Phase 0, markdown spec: next deliverable); table DDL, public view/RLS design, and report generation implemented in Phase 1 from that spec. Cadence decided: monthly, automated.

---

## Deferred Features

*Design around these — MVP architecture must not foreclose them — but do not build.*

- **Endorsement tags** — deferred from MVP but **high priority**: a major feature and a stance on IP-owner moderation and community interaction. Requires owner-authenticated write path. Prioritize early post-MVP.
- **Versioning UI** — history browsing, restore, diffs (storage substrate is in MVP; see Locked Decision 10).
- Formal invite mechanics for Spaces.
- Cross-space linking/derivation; Open Eppic crossover Space mechanics (original Brands and Elements only when built).
- Block live-sync, frozen states, diff review pipeline, notifications engine.
- Multi-ownership; IP/Brand transfer.
- Monetization, marketplace, licensing agreements beyond the core perpetual license, payment splits.
- **Bounty system** — Readers place bounties on content they want; creators fill them (big; may or may not make it).
- **Services offering system** — creators offer services within IP + agreements with original IP owners (big; may or may not make it).
- Community features **pending Covenant assessment** (Commitment 11: no engagement traps, addictive algorithms, or one-to-many broadcast dynamics): likes/Inspiration Points, comments, canon voting, direct messaging.
- Multi-channel publication (PDF, other publish profiles, tag-conditional output per CCMS patterns).
