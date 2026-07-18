# The Open Eppic Transparency Log

This directory is Open Eppic's public accountability record, required by the
Open Eppic Covenant (Commitment 6: *Speak truth — especially about ourselves*;
Part IV: *Transparency*).

> **Historical note.** Decisions, research, and reasoning that precede this
> log live in the
> [Open-Eppic-Research-and-Theory](https://github.com/FoxBlueSunflower/Open-Eppic-Research-and-Theory)
> repository. This log is not a re-capture of that history — it records only
> what follows it.

## What lives here

The log is split by kind (MVP_Spec.md, Locked Decision 16):

1. **Constitutional interpretations** (`interpretations/`) — markdown entries,
   one file per decision, committed to this repository. Git history is the
   audit trail.
2. **Moderation outcomes** — structured data with a public read path, plus a
   periodic markdown report of aggregated totals (monthly cadence). The data
   table and report generation are Phase 0 infrastructure; reports will be
   committed under `reports/` once the platform is live.
3. **Contribution ledger** (`contribution-ledger.md`) — the public,
   append-only record of accepted contributions. See CONTRIBUTING.md.

## What counts as a constitutional interpretation (formational reading)

*Revised 2026-07-17, exercising the revision this section originally
reserved. The original broad reading ("when in doubt, it belongs here")
governed entries dated on or before 2026-07-17.*

Covenant **assessment** is universal: every feature, workflow, architecture,
and process decision in this build is measured against the Covenant. Covenant
**logging** is exceptional: an interpretation entry is written only for
formational decisions — those meeting **any one** of these criteria:

1. **Hard to reverse** — license terms, contributor terms, launch gates,
   data-retention shape.
2. **Touches member rights directly** — IP, dignity, privacy, exit, or
   moderation *structure* (individual moderation outcomes are recorded in
   the moderation-outcomes data, not here).
3. **Invokes the conflict-resolution rules, or knowingly accepts a named
   strain** of a Commitment.
4. **Rejects an option as violating a Commitment** — rejections are
   precedent.
5. **Amends a prior logged entry or a Locked Decision.**

Decisions meeting none of these are still Covenant-assessed, then recorded
only as ordinary git history or an engineering ADR. The purpose of this
narrowing is the log's own integrity: a log of everything is a log of
nothing, and ceremony-as-overhead is the quiet death of Commitment 6.

**Boundary with engineering ADRs:** purely technical decisions with no
covenant weight (library internals, index strategy, refactors) are recorded
as engineering ADRs elsewhere in the repo. When in doubt about whether a
decision meets a criterion above, it belongs here.

## Entry format

Files are named `YYYY-MM-DD-short-slug.md` and contain:

- **Date** — when the decision was made.
- **Decision** — one-paragraph statement of what was decided.
- **Commitments implicated** — by number and name.
- **Conflict rules applied** — which of the five rules in "When Commitments
  Appear to Conflict," if any; or "none — direct application."
- **Options considered** — what was weighed and why the alternatives were
  rejected, with the Covenant verdict on each (complies / strains / violates).
- **Decided by** — who bore the decision (per Part IV, *Skin in the Game*).
- **Consequences accepted** — costs the decision knowingly takes on.

## Individual dignity constraint

Per the Covenant's conflict rule 3: transparency about the *system* is
unconstrained; transparency about *individuals* is constrained by their
dignity (Commitment 1). Entries and reports publish patterns, reasoning,
statistics, and outcomes — never pillory. No entry names or shames an
individual member, and no log document carries personal contact information.

## Amendments

Entries are append-only in spirit: an entry is not rewritten to change history.
Corrections or reversals are new entries that reference the old one. Typo-level
fixes are permitted; git history preserves every state regardless.
