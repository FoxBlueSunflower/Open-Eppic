# The Open Eppic Transparency Log

This directory is Open Eppic's public accountability record, required by the
Open Eppic Covenant (Commitment 6: *Speak truth — especially about ourselves*;
Part IV: *Transparency*).

> **Historical note.** Decisions, research, and reasoning that precede this
> log live in the
> [Open-Eppic-Research-and-Theory](TODO-verify-url)
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

## What counts as a constitutional interpretation (broad reading)

This log takes the **broad reading**: any decision that applies the Covenant's
commitments, conflict-resolution rules, or Aim to a concrete question belongs
here — not only decisions where two commitments visibly conflicted. Most
significant decisions are conflicts; it depends only on where one stands.

A future revision may distinguish *decisions* (Covenant applied, no live
conflict) from *conflicts* (the "When Commitments Appear to Conflict" rules
invoked). Until then, everything of constitutional weight is logged the same
way, and each entry states which conflict-resolution rules, if any, were
applied.

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
