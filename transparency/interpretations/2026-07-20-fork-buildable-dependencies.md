# Load-Bearing Dependencies Must Be Fork-Buildable

**Date:** 2026-07-20

**Decision:** Any dependency required to build and run the Open Eppic platform
must be installable from open-source packages under licenses compatible with
AGPL-3.0-or-later. Paid or proprietary dependencies for core function are
refused. Applied first to the editor library (ADR-001): TipTap adopted on its
MIT surface only; its paid cloud/platform features are excluded, and no
proprietary editor was eligible.

**Commitments implicated:** 4 (No one is held here — forkability), 6 (Speak
truth — code is open source), and the Aim's refusal of platforms that extract.
Part VI (the fork provision) governs directly.

**Conflict rules applied:** None — direct application.

**Reasoning:** Part VI's trust architecture ("because Open Eppic can be forked,
Open Eppic can be trusted") requires that a fork actually build. A core
dependency that a fork cannot obtain without buying a license makes the fork
provision nominal, and bundling proprietary code into an AGPL-distributed
frontend is independently a license conflict. The constraint binds the
platform, not just contributors — the same shape as the AGPL and CLA-rejection
decisions.

**Options considered:**

- **Fork-buildable-only (open source, AGPL-compatible) — complies.** Forks
  retain buildability; no per-fork license purchase; no distribution conflict.
- **Allow a paid/proprietary dependency for core function — violates 4 and
  Part VI.** Rejected as precedent, not merely for the editor.

**Decided by:** Founder, with advisory assessment.

**Consequences accepted:** Some best-in-class proprietary tools are foreclosed
for core paths (add-ons/periphery are unaffected). Dependency selection now
carries a license-and-buildability check as a first-order filter.
