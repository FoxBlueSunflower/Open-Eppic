# Community mechanics: invitation surface, graduated formation, and Element-anchored discussion

**Date:** 2026-08-11

## Decision

The journeys assessment produced three linked decisions about how members
enter a Space and talk to one another, all committed together. First, the
in-platform **invitation surface enters the MVP** — owner-initiated invite
plus member-initiated request-access — partially lifting Locked Decision 2's
deferral of formal invite mechanics; the request-access half is the
load-bearing one, because off-platform-only invitation leaves the un-networked
creator no visible path in. Second, **formation weight is graduated by role**:
minimal for readers at entry, greatest at the becoming-a-creator threshold,
deliberately light at point-of-creation. Third, **Element-anchored discussion
enters the MVP**, sequenced into Phase 4 alongside the governance baseline and
never before it, amending Locked Decision 12's "sole Reader mechanic" clause;
it is Space-scoped and artifact-anchored, with no feed, ranking, karma, or
likes. Direct messaging, a Space-scoped forum, and global feed / cross-Space
discovery / karma / likes / streaks were assessed and rejected.

## Commitments implicated

- **9 (the smaller voice is heard — and defended)** — the invitation surface
  is the partial repair of the strain Locked Decision 2 knowingly accepted: a
  relational gate filters hardest against the creator with no network.
- **11 (rest is sacred; we do not become Pharaoh)** — the assessment the
  Deferred Features list required before any community feature could move, made
  here rather than assumed.
- **12 (everyone is taught; everyone teaches)** — apprenticeship needs a room;
  work-anchored talk is the digital form of side-by-side labour.
- **7 (do everything in love — including correction)** — appeals defined
  before first use; no silent removal.
- **6 (speak truth — especially about ourselves)** — implicated adversely by
  the accepted schema strain below.
- **1 (every person bears God's image)** — discussion contents are visible to
  Space members only; anonymous visitors see a count.
- **Part IV Hospitality and Human Scale** — a visible path in for the
  stranger; Space-bounded talk with no cross-Space amplification.

## Conflict rules applied

Rule 1 (examine assumptions first) on the discussion question: the apparent
conflict between Commitment 12's need for a room and Commitment 11's refusal
of engagement mechanics dissolves once the surface is anchored to an artifact
rather than to a speaker — the artifact holds the floor, so there is nothing
for a feed or a ranking to attach to. Rule 2 (Ground before operational) is
not reached. No other rule invoked; the rest is direct application.

## Options considered

- **Element-anchored, Space-scoped discussion** — *complies.* No broadcast
  dynamic, no ranking, no cross-Space amplification; the mechanic the
  element-graph architecture is already shaped for. **Adopted.**
- **Direct messaging at MVP** — *violates Commitment 11 and Human Scale.* Harm
  in DMs is invisible to the community, which defeats the detection-certainty
  mechanism that makes gentle, proportionate enforcement viable in the first
  place. Rejected. If ever built it requires a shared-Space precondition,
  block and report from day one, and treatment of DM content as personal data
  — non-forkable, self-exportable.
- **Space-scoped forum** — *violates Commitment 11.* The public square in
  miniature; it reintroduces the performance dynamic the anchoring exists to
  avoid. The weakest conversational option assessed on covenant grounds.
  Rejected.
- **Global feed, cross-Space discovery, karma, likes, streaks** — *violate
  Commitment 11 and Human Scale* outright. Rejected.
- **Leaving invitation off-platform only** — *strains Commitment 9 and Part IV
  Hospitality* past what the Locked Decision 2 mitigations carry. Rejected.
- **A uniform formation requirement applied at every act of creation** —
  *strains Commitment 11* (a wall at each act is a nag) and misplaces the
  Deming point, which is to build quality in upstream of the act rather than
  inspect at it. Rejected in favour of graduation.

## Decided by

The founder, on the assessment recorded in the journeys working notes
(decisions D1–D6).

## Consequences accepted

- **The formation gate is still Deferred, so the discussion surface arrives
  ahead of the upstream formation mechanism the Deming frame depends on.** A
  named strain, not a violation. Compensating mechanisms: point-of-creation
  norm salience, endorsement tags (now MVP), small Spaces, and the
  invite/request-access gate itself.
- **Discussion posts are not representable in the moderation capture schema,
  and the remedy is deliberately deferred.** Schema v1.0 defines `element_type`
  against Locked Decision 5's Element types and makes it the primary pattern
  dimension of the monthly report; a discussion post is neither an Element nor
  an account-level action, so its moderation would aggregate as null. Because
  no moderation datum may be recorded outside the schema, there is no
  workflow-layer workaround. This **strains Commitment 6** — a report that
  structurally cannot surface a class of enforcement is not the truth about
  the system — and **strains Commitment 9**, since the unauditable class is
  precisely where interpersonal harm to smaller members occurs. An additive
  `subject_type` field was assessed as the remedy and held for the Phase 4
  mini-spec. Accepted cost: Phase 1 builds the table from v1.0 and will
  require a migration for a requirement already known today. **The amendment
  must land before Phase 4 ships discussion**; shipping against an unamended
  schema would convert this strain into a Commitment 6 violation.
- **Request-access creates a queue**, assessed as membership rather than
  enforcement; it writes nothing to the moderation-outcomes schema. Requester
  identity is exposed to the Space owner only — a scoped, consent-based
  exception to the otherwise-private identity posture, justified because a
  consent interaction requires knowing who is asking.
- **MVP scope grew** by an invitation surface and (at Phase 4) a discussion
  surface. Phase 4 is pre-launch, so the editor and Element loop of Phases 2–3
  remain the primary build untouched.
