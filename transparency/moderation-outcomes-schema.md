# Moderation Outcomes: Capture Schema (v1.0)

**Status:** Committed specification. Phase 0 deliverable per Locked Decision 16
(as amended 2026-07-17) — the physical table, public read view, and report
generation are built in Phase 1's initial schema pass **from this document**.
No moderation datum may be recorded outside this schema.

**Covenant grounding:** Commitment 6 (system-truth unconstrained),
Commitment 1 (individual dignity), Commitment 7 (correction with an open
door back), Commitment 9 (equal process regardless of size). Conflict rule 3
(publish pattern, not pillory) is operationalized structurally by the
`public_reasoning` / `private_notes` split.

---

## Fields

Every moderation outcome records exactly these fields. Additive fields may be
introduced later by amendment (new spec version, committed to this repo —
git history is the record); fields are never removed or repurposed.

### 1. `outcome_id`
Stable public identifier for the outcome. Format decided in Phase 1 DDL
(UUID or sequential public slug); must be safe to cite in public reports and
appeals correspondence.

### 2. `occurred_at`
Timestamp of the decision itself — when the action was taken, not when it was
recorded. (Record-creation time is captured automatically by the database and
need not be specified here; any material lag between decision and recording is
itself a pattern the monthly report may surface.)

### 3. `action_type`
Enum. One of:

| Value | Meaning |
|---|---|
| `report_received` | A member report was filed (logged even if no action follows) |
| `no_action` | Review completed; no action warranted |
| `warning` | Corrective warning issued to a member |
| `content_hidden` | Element hidden from public view (soft, reversible) |
| `content_removed` | Element tombstoned (soft-delete; lineage preserved) |
| `dmca_takedown` | Content removed pursuant to a DMCA notice |
| `dmca_counter` | Counter-notice received |
| `dmca_restore` | Content restored following counter-notice resolution |
| `account_restricted` | Member's capabilities limited |
| `account_removed` | Covenant relationship dissolved (Part V standard: systematic, intentional violation only) |
| `appeal_received` | Member appealed a prior outcome |
| `appeal_upheld` | Appeal succeeded; prior outcome reversed or reduced |
| `appeal_denied` | Appeal reviewed and denied |
| `restoration` | Member or content restored after changed behavior (Commitment 7's open door) |

New values are additive-only.

### 4. `trigger`
Enum: `member_report` | `dmca_notice` | `platform_initiated` |
`public_domain_queue`.

### 5. `element_type`
Nullable enum matching the platform's Element types (Work, Chapter,
Character, Setting, System, Event, Item, Block). Null for account-level
actions with no single subject Element. This is the primary pattern
dimension for the monthly aggregate report.

### 6. `commitments_implicated`
Array of commitment numbers (1–12) the outcome applies or protects. Mirrors
the interpretations-log discipline: every enforcement act names the covenant
ground it stands on. `report_received` and `no_action` entries may record an
empty array.

### 7. `public_reasoning`
**Published verbatim in the public read view.** Pattern-level statement of
what happened and why, written *for publication at the moment of recording* —
never redacted after the fact.

**Fillable structure (required form):**

> **[party role]**'s **[element type / subject]** was **[action taken]**
> because **[guideline or covenant ground, pattern-level]**.
> **[Process context: warning history, appeal path, restoration terms.]**

Where:
- **[party role]** is one of: `a creator`, `a derivative creator`,
  `a reporter`, `the platform`, `a member` — roles only, never names,
  handles, or identifying description.
- **[action taken]** restates the `action_type` in plain language.
- **[guideline or covenant ground]** cites the Content Guideline section or
  Commitment number — the *rule*, not the member's specific expression of
  breaking it, where quoting would identify.
- **[process context]** states where this sits in the correction pattern:
  whether a warning preceded it, whether appeal is open, what restoration
  requires. This sentence is how Commitment 7 stays auditable.

Worked examples:

> A creator's Character element was hidden because its content violated
> Content Guidelines §[n] (Commitment 2). A warning preceded this action;
> appeal is open for 30 days; restoration follows on revision.

> The platform received a DMCA notice; a derivative creator's Work was
> removed pursuant to it (Commitment 3, legal-compliance posture per the
> Covenant's Legal-Covenant Relationship). Counter-notice instructions were
> provided; lineage records preserved per soft-delete policy.

> A member report was reviewed; no action was warranted. The reported
> Setting element complies with Content Guidelines.

**Dignity test before saving:** could a reader in the affected member's
sub-community identify them from this text alone? If yes, generalize further
or move the detail to `private_notes`.

### 8. `private_notes`
**Never exposed in the public read view — excluded at the RLS/view layer in
Phase 1, not by application discipline.** Member identities, correspondence,
specifics of the violating content, legal notice contents, and anything
failing the dignity test above. Retention and access rules for this field are
decided with the Phase 1 RLS design.

**Fillable structure (recommended form):**

> Member: **[handle/id]**. Subject: **[element id]**.
> Detail: **[what specifically occurred]**.
> Correspondence: **[refs]**. Decided by: **[name]**.

`Decided by` lives here (not as a public field) while the platform has a
single decision-maker; if a second decision-maker ever exists, a public
`decided_by_role` field is added by amendment.

### 9. `related_ref`
Nullable reference to a prior `outcome_id`. Used for: an appeal referencing
the outcome appealed; a reversal or correction referencing the entry it
supersedes; a removal referencing the warning that preceded it; any
multi-step case chaining its actions. This single field is what makes
warnings-before-removal and corrections auditable as a public pattern.

---

## Invariants

1. **Append-only.** Rows are never updated or deleted. Corrections and
   reversals are new rows with `related_ref` pointing at the superseded
   entry — same discipline as the interpretations log.
2. **Public view = all fields except `private_notes`.** Enforced
   structurally in Phase 1 (view definition / RLS), not by convention.
3. **No identities in public fields.** `public_reasoning` carries roles
   only. No pseudonymous per-member tokens either — cross-entry correlation
   can deanonymize in a small community, which would be pillory by
   inference (Commitment 1, conflict rule 3). Repeat-offense visibility is
   served by aggregate counts in the monthly report instead — pattern
   without person.
4. **Logged as part of the workflow, not after.** Per Roadmap Phase 4:
   every DMCA action, moderation decision, and Public-Domain-account
   intervention writes its row as a step of the action itself.

## Monthly report floor

The automated monthly report aggregates from this table: totals per
`action_type`, per `trigger`, per `element_type`, appeal and restoration
counts, and repeat-offense counts in aggregate. Totals only — no
comparisons, no charts (Locked Decision 16).

## Relationship to other documents

- Table DDL, public view, and RLS design: Phase 1, authored from this spec.
- `content_guideline_ref` as a structured field: added by amendment when
  Content Guidelines exist (gated on the "Evil" definition).
