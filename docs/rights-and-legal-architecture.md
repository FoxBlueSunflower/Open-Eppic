# Open Eppic — Rights & Legal Architecture (v0.1, Draft)

**Status: DRAFT — architecture decided, text not final.**

Read this correctly before relying on it:

- **The architecture below is decided** and is recorded in the transparency log
  and MVP_Spec (Locked Decisions 13, 19). It is not speculative.
- **No license text exists yet.** Every instrument described here is
  requirements-level. Final license language is gated on IP-attorney review at
  Phase 5 (LD 13, as amended 2026-07-17) and may differ in wording.
- **This is design intent and risk-flagging, not legal counsel**, and it is not
  a member-facing promise. Member-facing terms will be the reviewed license,
  the Terms of Service, and the Covenant — not this document.
- **Sections marked hypothesis-grade are exactly that.** Demand-side claims
  rest on founder journey-mapping under the Commitment 8 strain logged
  2026-07-17, not on user interviews.
- Standard instruments already adopted verbatim (AGPL-3.0-or-later, DCO) are
  settled and need no review.

Compiled 2026-07-21, revised 2026-07-22. Corrections and reversals follow the
transparency log's discipline: this document is amended in place with git
history as the record, and any change of substance gets its own log entry.

**Related working drafts (not in this repository).** Several adjacent
questions raised alongside this work are held as founder working drafts and are
deliberately *not* committed, because they are genuinely unsettled: monetization
principles and candidate revenue engines; an ADR on an offline local-first
editor and content-portability round-trip; substrate posture and vertical
strategy; creator-onboarding and formation-gate design; and Space-level
self-governance with cross-Space content mobility. Where this document depends
on a conclusion from one of them, that conclusion is stated here in full rather
than referenced. It is **design intent and risk-flagging, not legal
counsel** — every custom instrument here is non-final until the Phase 5
attorney gate (MVP_Spec LD 13, as amended 2026-07-17). Standard instruments
already adopted verbatim (AGPL-3.0-or-later, DCO) are settled and need no
review.

**Confidence:** The *legal-mechanism* reasoning is firm. The *demand-side*
claims that motivate parts of the structure (ownership anxiety, growth-path
personas) are **founder journey-mapping, hypothesis-grade** under the already
logged Commitment 8 strain (2026-07-17 rescope); they are confirmed at
post-launch interviews before the Deferred layers are built.

**Relationship to Locked Decisions:** This document *refines and will feed an
amendment to* LD 13 (perpetual license — currently "undecided but immensely
core"). It does **not** silently reopen any Locked Decision. Where it touches
LD 1, 2, 6, 7, 8, 9, 13, 17, 18 it says so and flags any strain. One item
(§3.2, the derivation-default fusion) carries a genuine Covenant strain that
needs the founder's explicit acknowledgment before it is treated as settled.

---

## 0. The one-sentence spine

> **Open Eppic is a registrar and evidence-keeper of rights, never a holder of
> them.** Code forks by license; content is licensed peer-to-peer and merely
> recorded by the platform; identity does not fork; members port themselves.
> Every growth idea — bounties, services, external participation, paid
> updates — is an additional permission layer granted *by the rights-holder*
> and *notarized*, never owned, by the platform.

This spine is what survived three independent stress tests — fork-safety,
bankruptcy, and journey-demand — from three directions. It is the property
that lets the model grow without re-consenting every creator, and the property
that means there is nothing in the platform for an acquirer, a trustee, or a
bad-faith future steward to seize. Everything below is an application of it.

---

## 1. The four-strata fork architecture

"Forking the platform" is not one act. It is four, each with a different legal
mechanism. Part VI of the Covenant ("because Open Eppic can be forked, Open
Eppic can be trusted") is honored only if **all four** hold.

| Stratum | What forks | Mechanism | Auto or conscious | Covenant |
|---|---|---|---|---|
| Code | The software | AGPL-3.0-or-later (LD 17) | Automatic — anyone may run it now | 4, 6; Part VI |
| Content | Works & derivative grants | Peer licenses + venue definition (§4) | **Conscious** — creators port originals; nothing auto-replicates | 3, 4, 5 |
| Identity | The name/mark | Forks **must rename**; defensive registration + non-weaponization policy | N/A — forks do not receive the name | 6 |
| Data | Members' accounts/content | **Does not fork.** Member-initiated self-serve export only | Conscious, per-member | 1, 4 |

### 1.1 Code — settled

AGPL-3.0-or-later, per LD 17. Anyone may already run the published software for
any purpose. Nothing in this document changes that; the other three strata
exist because the code license alone does **not** carry content, name, or
members with it.

### 1.2 Content — see §3 and §4

The heart of the custom work. Summarized in the spine; detailed below.

### 1.3 Identity / trademark — the stratum the code license does not cover

AGPL forks the code and the venue definition governs the content, but **neither
touches the name**, and the name is where fork fights actually happen. The live
WordPress/WP Engine dispute is the cautionary tale: a trademark claim became
the root of a multi-year, multi-front battle reaching the governance and
finances of the foundation that owns the mark. The refused pattern is a steward
using the name as a retroactive toll-booth on its own ecosystem.

Decisions (founder-confirmed):

- **Forks must operate under a new name.** The fork right is to code, content,
  and community continuity — not to impersonation. Truthful non-confusion is a
  Commitment 6 requirement, not a restriction on the fork right.
- **Defensive registration of the "Open Eppic" mark** — founder-filable like
  the DMCA agent registration; attorney optional, not gating. The worst state
  is an unregistered, policy-less mark: maximal ambiguity available to a future
  bad steward.
- **A published trademark policy that binds the platform against
  weaponization** — nominative fair use expressly permitted ("compatible with
  Open Eppic," "built for Open Eppic Spaces" must stay legal). The mark defends
  users from confusion; it is never a lever against compatible forks or
  add-ons.
- **The mark-holder converges with the purpose-trust** contemplated in Part VII
  (succession) and in mechanism B (§4). The trust stewards the *name and the
  license text*, never venue legitimacy. *(Founder decision 2026-07-22: the
  broader steward-ownership / perpetual-purpose-trust structure is developed
  when/if the company matures to need it. Parked, not abandoned.)*

Status: defensive registration is MVP-era founder work; the policy is drafted
alongside launch materials; the trust is Part VII / post-MVP.

### 1.4 Personal data — the stratum that must *not* fork

The content license moves *Works*; it cannot move *members*. Accounts, emails,
follow-graphs, and above all `private_notes` (the moderation schema's
non-public field) are personal data under GDPR (no size threshold if EU members
are served) and a growing set of US state privacy laws. A platform may not hand
its user database to a fork or a successor.

The lawful path is identical to the covenant value: **member-initiated,
self-serve, machine-readable export.** Data-portability law and Commitment 4
say the same thing. The founder's "vote with your feet" instinct is here not
merely permitted but legally mandatory.

Decisions (founder-confirmed):

- **Self-serve export / migration is an explicit MVP feature line** (not merely
  implied by "portability"). Phase 5 already verifies the *public* transparency
  data is reachable; this adds the *personal* half — a member can extract their
  own content and account data in an open, re-uploadable format.
- **`private_notes` is structurally non-forkable and non-exportable to
  successors.** The moderation schema already isolates it at the view/RLS layer
  (invariant 2); this extends the reasoning to the fork/succession case.
- Supabase DPA posture, breach notification, and any EU-transfer mechanism are
  ordinary compliance items on the Phase 5 / attorney checklist — not covenant
  design.

---

## 2. The governing principle, stated as rules

Three rules make the spine operational and testable:

1. **The platform is never a party to a content license.** Grants run
   creator→creator (on-platform derivation) or rights-holder→participant
   (external). The platform records, timestamps, version-stamps, and stores
   evidence. It never holds a sublicensable interest. *(The hub-and-spoke
   alternative — creators license the platform, platform sublicenses derivers —
   is the CLA pattern in content form. It reserves asymmetric rights over
   members' work and **violates Commitments 3 and 5**. Rejected permanently,
   consistent with the CLA rejection of 2026-07-16.)*
2. **"Through the Platform" means mediated by, never held by.** The founder's
   original framing — expansion happens "through the Platform" — is honored:
   the platform supplies the mechanism (the Space-defined permission menu, the
   notary function, the evidence record). It is the conduit and the witness,
   not the owner of the right.
3. **Rights are held at the edges; the platform holds only the record.** This
   is why LLC insolvency cannot reach the grants, why an acquirer buys no
   content rights, and why a bad-faith successor inherits no leverage. The
   distribution of rights *is* the trust architecture.

---

## 3. The content-licensing model

### 3.1 Layer 0 — the base derivation grant (MVP)

The whole MVP licensing surface is one grant. When a creator passes the
activation gate (§3.2) on an original Element inside a Space, that act
constitutes a **standing offer** of the Open Eppic Derivation License to the
members of that Space. Each act of derivation is acceptance, forming a **direct
license between the original creator and the derivative creator.** The platform
records the grant (who, what, when, license version).

Core terms (requirements level; final text is the Phase 5 attorney gate):

- **Non-exclusive, royalty-free, worldwide** as to the right, but
  **venue-restricted** to qualifying instances (§4) and **Space-scoped** in
  practice (derivatives are Space-locked, LD 1/6).
- **Non-commercial** at Layer 0 (LD 6: derivatives are non-monetizable). Commerce
  is a Layer 1 additional permission (§3.4).
- **No sub-derivation.** Only originals are derivable; a derivative cannot be
  derived from (LD 6, and founder-confirmed 2026-07-21). This caps chain
  complexity at depth one and keeps lineage tractable.
- **Attribution satisfied structurally** by the immutable `derived_from_id`
  lineage stamp (LD 6). Lineage records are plausibly copyright-management
  information under 17 U.S.C. §1202, giving the "preserve lineage" rule a
  statutory backstop independent of the license (§5).
- **Perpetual and irrevocable as to each derivative Work already created under
  it.** Withdrawal of an Element revokes only the *standing offer*,
  prospectively — no new derivations — while every existing grant stands. This
  is the Covenant's grandfathering (conflict rule 4), the ORC's irrevocable-
  offer discipline, and 17 U.S.C. §203(b)(1)'s statutory derivative-works
  exception, all agreeing on one mechanism.
- **Retained rights lead the text** — see §3.3.

**Assent fires at the derivation / link-enabling action, not at signup.** A
member who never derives and never activates never executes this grant. This
keeps the license scoped to the act that needs it and leaves single-player and
intra-org use (the light-CCMS persona) untouched by a licensing flow they don't
need.

### 3.2 Derivation defaults and the Space commons — **founder-confirmed, with a flagged strain**

Founder decision (2026-07-21): *When original content is activated on the
platform, others may create derivatives of it by default, and this cannot be
selectively turned off. Only originals are derivable; derivatives cannot be
re-derived. Derivatives remain locked to the Space they were created in and
cannot migrate (cross-Space derivative migration is a future consideration, not
an MVP problem).* And: *within a Space, all activated content may be used by
members of that Space* — the consensual peer commons is affirmed.

How this reconciles with the existing architecture:

- The creator's **consent moment is the activation gate** (LD 7): originals are
  locked from derivation until the creator links them to a published Work.
  Choosing to activate *is* the choice to open the Element to derivation within
  its Space. Nothing is derivable that the creator did not activate.
- The creator's **control is exercised at two boundaries** — *which Space*
  (walled, LD 1) and, for a Space owner, *who is a member* (LD 2) — plus the
  deferred endorsement-tag "official" signal. It is **not** exercised as a
  per-request derivation veto after activation.
- **Consensual commons:** a creator who activates inside a Space has consented
  to that Space's commons terms (members may derive). This is consent-based, not
  imposed.

**Resolved 2026-07-22 — the fusion is embraced permanently; the Covenant text
must follow.** Founder: *the whole aim of Open Eppic is to invite
participation. Someone who wants read-only publishing isn't being served by
this platform and isn't locked out of anything — Amazon and every major
publisher already offer exactly that. Open Eppic serves those who want
something completely different.*

This is the stronger position: participation is not a feature of Open Eppic,
it is what Open Eppic **is**, and "publish here but no one may build on it" is
a different product that the market already supplies abundantly. There is
therefore **no read-only publishing state**, now or planned, and none should
be designed-around.

**Consequence — the strain relocates into the Covenant text.** Commitments 3
and 5 currently state that a creator "remains free to restrict their Element,
set their own terms, or decline to share." As written, that sentence is
**inaccurate for activated Elements**. The honest fix is not a log entry about
an accepted strain but a **Covenant amendment** stating the scope plainly:
participation is constitutive; the creator's control is *which Space* and
*whether to activate*, not a per-derivation veto; the creator who wants no
derivation does not activate, or is served elsewhere.

That amendment, when made, **is formational** and gets its own
transparency-log entry — the same treatment the "What Evil Is" amendment
received (2026-07-20). It is not drafted here.

**Dignity-preserving obligation in the meantime:** disclosure. The fusion must
be stated in onboarding and at activation, before anyone invests, so no
creator is surprised by it (Commitment 6; and the disclosure discipline
required for Space permission menus in §3.5).

### 3.3 Retained rights — the clause that leads (§103(b))

A derivative creator owns copyright only in what they *originated*; the
underlying Element's copyright is untouched (17 U.S.C. §103(b)). The license
constrains only the derivative Work *as a combined whole*. The derivative
creator's own original contributions remain theirs absolutely and travel with
them anywhere, always.

The journey evidence makes ordering a design decision, not just drafting: the
loudest, best-triangulated finding in the corpus is **ownership anxiety /
steward-betrayal** ("what happens to MY stuff when the steward changes the rules
or disappears"). The DMs Guild failure mode — a creator hit with a cease-and-
desist for printing *their own* writing — is precisely that fear realized. So
the license **leads with retained rights**, because that is the first question
the user is actually asking. A **plain-language, covenant-level summary**
("what you are giving, what stays yours, what happens if Open Eppic dies") is
bound to the formal text, and the clickwrap assent record captures both. This
is Commitment 6 (no dark patterns) meeting the journey's anxiety.

### 3.4 Additive permission layers (Deferred, hook built now)

Every growth idea is the same shape: an **additional permission** the rights-
holder grants on top of Layer 0, each a separate consented act (the GPL §7
"additional permissions" pattern — additive only, never subtractive). Because
Layer 0 carries the additional-permissions **hook** and the grant-record schema
allows a grant to reference an optional permission set, later layers require **no
re-consent from existing creators.** Omitting the hook is the migration trap;
building it is cheap.

| Layer | Persona / use | Nature | Who grants | Platform role | Status |
|---|---|---|---|---|---|
| 0 | Gift-economy derivation | Base grant, on-platform, non-commercial | Original creator (via activation) | Registrar | **MVP** |
| 1 | Bounties, services, commercial derivation | Lifts the non-commercial restriction under stated terms | Original creator, per-Element/per-Space | Registrar; **menu defined at Space level** | Deferred |
| 2 | External participation — convention art, fan goods, physical merch | Breaks venue restriction *on purpose*; bespoke | Rights-holder → participant, **person-to-person, unique per agreement** | **Notary only — never a party** | Deferred |

**Layer 1 — commercial / bounty.** The bounty journey is a
*reader→commissioner* and *creator→paid-filler* relationship the base grant
deliberately excludes (LD 6, non-monetizable). Bounties are therefore not a
tweak to Layer 0 but an additional permission an IP owner grants. **Which
additional permissions are available is decided at the Space level**
(founder-confirmed) — Space governance over the permission menu — bounded by
the platform's Covenant floor (§3.5).

**Layer 2 — external / off-platform.** The convention-and-fan-art case. An IP
owner says "yes, make and sell art of my world at a convention." This is a
**distinct grant from the rights-holder to a participant that the platform
merely records and evidences.** The hard rule, founder-confirmed:

> **The platform is never a party to an external grant.** If it inserted itself
> as licensor-of-record for off-platform exploitation, it would have recreated
> Kindle Worlds (the platform capturing external rights). Correct shape: the
> rights-holder defines the terms, the participant accepts, the platform
> timestamps and stores the record. Rights run rights-holder→participant
> directly.

**External agreements are always person-to-person and unique to that
agreement** (founder-confirmed). The platform's contribution is the notary
function and the evidence trail, plus — where a Space offers templated external
grants (the Helldivers-style curated "on-brand crossover") — a template the
rights-holder chooses to use. Even then the platform is witness, not signatory.

### 3.5 Space-level permission governance + the disclosure duty

Founder decision (2026-07-21): the **menu of available additional permissions
is set at the Space level**; **external agreements are always bespoke person-to-
person**; and **when a member migrates or introduces content into a Space, the
additional permissions allowed/active in that Space must be clearly stated.**

Constraints that keep this covenant-safe:

- **A platform Covenant floor bounds every Space menu.** A Space cannot offer a
  permission that violates the Covenant — e.g., it cannot offer a permission
  that strips a creator's retained §103(b) rights, waives moral rights, or
  grants the platform a sublicensable interest. Space governance operates
  *above* a fixed floor, never through it.
- **Disclosure-on-entry is a hard requirement**, not UX polish. The moment a
  creator brings content into a Space, the active/available permission set is
  presented plainly. This is Commitment 6 (no hidden terms) and directly
  answers the ownership-anxiety finding: the creator always knows what regime
  their content is entering.
- **Space governance strengthens, it does not fragment.** Menus select from a
  platform-defined catalog of permission types; a Space chooses *which* to
  offer, not invents arbitrary new legal instruments (that would reintroduce
  the sprawl the methodology warns against and would each need attorney review).

### 3.6 Composition — derivatives in Collections and Works

Founder decision (2026-07-21): **derivative elements, including Blocks, can be
used in Collections and therefore in Works.** A person may publish a Work that
is nothing more than an ordered Collection of content. **This freedom is
necessary and the feature stays as-is regardless of how people use it;** the
monetization impact is deferred.

Licensing consequence to record (not to act on yet): a Work composed of
derivative elements carries, through its lineage chain, the IP of the
underlying original owners. Its off-platform or commercial use therefore
requires those owners' Layer 1/2 permissions — the `derived_from_id` lineage is
exactly what makes this computable at the moment monetization is designed. Until
then: composition is free; monetization of composed Works is deferred; nothing
here changes the feature.

---

## 4. Venue definition — mechanism A + C (founder-confirmed)

The problem: a license needs a determinable scope, but *naming a referee for
"the legitimate successor"* creates a capturable institution — the very failure
mode the fork provision exists to prevent.

**Adopted: A (objective self-executing definition) + C (cessation trigger),
with B (steward trust) as the Part VII maturation.**

- **A — objective venue definition.** "The Platform" = any publicly accessible
  instance of the published software that (i) preserves lineage records, (ii)
  enforces this license's terms, and (iii) provides member exit/portability.
  All qualifying instances are licensed venues simultaneously; **no one
  certifies legitimacy** — there is no fork-certification problem because
  nothing certifies. This is exactly how AGPL forks already work for the code.
- **C — cessation/insolvency trigger.** A belt-and-suspenders clause: venue (or
  defined rights) expands automatically on objective events (operations cease
  for N days, insolvency, dissolution). Objective and cheap. *Breach* triggers
  are deliberately excluded — "covenant breach" is not adjudicable in license
  text; breach is left to A's structure and Part VI's community remedies.
- **B — purpose trust holds the license text and mark** beyond the LLC's power
  to amend (the ORC's Library-of-Congress discipline; the FSF's role for GPL).
  Converges with Part VII succession. Post-MVP maturation of A, not a competitor
  to it.

**The critical founder refinement (2026-07-21):** the venue definition governs
whether the **license remains valid when content is consciously ported** — it
does **not** cause content to auto-replicate onto forks.

> **An original IP owner always determines where their content goes. A
> legitimate fork does not auto-receive the community's content. The community
> must consciously port it.**

This resolves the Commitment 3 strain flagged in earlier sessions ("a creator's
material might appear on an instance they dislike"): it cannot. A fork receives
the *code* (AGPL, automatic) and starts with an **empty content set**. Original
creators may port their originals (LD 1: 100%-original content is transferable
between Spaces/instances); the venue definition ensures the peer-license terms
still hold at the destination. **Derivatives do not travel at all** — they are
Space-locked (LD 1/6). Consequences to state honestly:

- The fork provision preserves **community continuity via ported originals**,
  not portability of derivative Works.
- **Derivative durability is Space-scoped.** If a Space or instance disappears,
  its derivatives are not carried across (see R8, §7). This is an accepted
  current limitation; cross-Space derivative migration is a deferred future
  consideration.
- What the venue definition actually secures is threefold: the **code** license
  (automatic), the **validity of peer grants at a destination a creator chooses
  to port to**, and — via §1.3 — the **name** (which does not port; forks
  rename).

**Rejected venue options** (recorded as precedent): LLC-operated-service-only
(**violates Part VI** — strands everything on steward failure); community-vote
clause (right sociology, unadjudicable in text — A implements the same value
without a counting mechanism); no-venue-restriction (contradicts platform
scope, LD 6, and removes the meaning of "expansion through the Platform").

---

## 5. Why the model is legally robust (hardening notes)

These are the load-bearing legal facts the structure depends on or benefits
from. All are attorney-confirmable at the Phase 5 gate; none are counsel here.

- **"Perpetual" ≠ "irrevocable."** Perpetual = no end date; irrevocable = cannot
  be cut short. The text must say both, and the covenant/ToS structure must
  supply real **consideration** (mutual commons access, platform services,
  reciprocal obligations) so the grants are contracts, not bare licenses — a
  bare non-exclusive license given without consideration is revocable at will;
  one supported by consideration is irrevocable. Non-monetary consideration is
  well-supported in the open-source line of cases.
- **17 U.S.C. §203 termination.** Authors hold an inalienable right to terminate
  grants in a 5-year window beginning 35 years after grant, *regardless of
  "perpetual and irrevocable" language.* But §203(b)(1) lets derivative works
  *prepared before termination* continue under the grant's terms — statutory
  grandfathering that matches the Covenant's own pattern. Our irrevocability
  promise attaches to **existing derivative Works**, which is both what the
  Covenant wants and what the law can actually deliver. Member-facing text must
  not overclaim literal-forever (Commitment 6): we say precisely what holds.
- **Copyright-management information (§1202).** Lineage/attribution stamps
  conveyed with Works plausibly qualify as CMI; stripping them carries federal
  statutory liability independent of the license. The "preserve lineage" venue
  criterion is backed by statute, not only contract.
- **Bankruptcy (§365(n)) — the model passes because there is nothing to
  reject.** In the direct peer-grant model, creator-to-creator licenses are not
  the platform's property; LLC insolvency cannot reach them and a trustee has
  nothing to reject or an acquirer to capture. (Hub-and-spoke would have
  concentrated every grant in the estate — another reason it is rejected.) This
  completes the "nothing to extract" architecture: forkable code, peer-held
  content rights, trust-held name/text, member-held data.
- **Assent mechanics.** The grants' validity depends on clean clickwrap:
  affirmative act, version-stamped record, terms presented at the moment of
  derivation — which the grant-record schema already captures. Attorney confirms
  form; schema is unchanged.
- **Enforcement standing.** Against a non-qualifying instance, the infringed
  parties are the **creators** (they are the licensors). The platform's
  Commitment 3 "we will defend it" is a **support** commitment (evidence from
  the grant registry, assistance), not a rights-holding one — power stays
  distributed even in enforcement.
- **Age floor foreclosing two risk classes.** Launching **18+** (see §6/§7)
  removes both COPPA (under-13) duties and contract-capacity/disaffirmance risk
  entirely, since all grantors are adults. Non-US moral-rights variation
  survives (adults can be non-US) — handled by choice-of-law and by our refusal
  to demand moral-rights waivers anyway (lineage attribution *aligns* with moral
  rights rather than fighting them). Revisiting 13+ is deferred and explicitly
  not-now.

---

## 6. The economic-survival tension — honest framing

The founder's push (2026-07-21): *the platform must be able to economically
survive; it cannot run for people who won't or can't provide the resources to
operate it, or it is a pipe dream that fails before it starts.* This corrects an
over-rotation in a prior session, where a "Commitment 9 guard" was framed as
*monetization must wait until small creators are served for free.* That framing
was wrong and is withdrawn.

**Resolution under the conflict rules (this is a genuine two-goods case,
resolvable — not a violation):**

- **Rule 1 (examine assumptions):** economic survival is not *opposed* to
  Commitment 9; it is *upstream* of it. A platform that dies serves no one,
  including the smaller voice. The Aim itself — "a stewarded commons where no
  one flourishes alone" — presupposes a commons that continues to exist.
- **What Commitment 9 actually guarantees:** the smaller voice is **heard and
  defended**, receives **the same clarity, appeals, and justice** as large
  creators, and is protected from **predatory monetization** and **unequal
  enforcement.** The Covenant states plainly that "the smaller voice does not
  always *win*." It does **not** guarantee free, unlimited service irrespective
  of contribution.
- **Rule 4 (balance, don't eliminate):** the resolution is a **non-predatory
  graduated economic model**, not "free for all" and not "pay or be silenced."
  The glossary already names **the Space as the unit of hosting/billing** — the
  built-in resource path. Space owners bear hosting; members participate within
  Spaces (LD 2 invitation model), so a small creator often participates without
  paying directly.
- **Rule 5 (aim wins final ties):** where the trade is genuinely irreducible,
  the Aim requires the platform to *exist*, which requires it to be funded.

**The Commitment 9 floor that does bind monetization** (kept from the prior
session, correctly scoped): pricing and permission structures must be
non-predatory; must not make *being heard, appealing, or receiving equal
process* contingent on payment; and must not be tuned so that only large IP
owners can afford the controls that protect a world (control granularity, not
price, is the lever — a §9 constraint already noted for the monetization open
decision). Advertising remains limited to on-platform Brands/Works/Elements;
the platform itself does not advertise (monetization open decision).

**The open edge, stated so it isn't lost:** the model funds infrastructure
cleanly for Spaces with an owner who bears billing. The **anchorless newcomer
who wants their own Space** is the case where "who funds it" is genuinely open.
This is a real design question for the deferred monetization work, not a solved
one — flagged here, unresolved.

**Pricing constraint that binds this document's Layers 1/2 (added 2026-07-22):
open source, metered service.** The Covenant constrains *source availability*,
not *resource allocation*. Permitted: metering or tiering features that consume
real infrastructure (storage, compute, bandwidth, export volume), and charging
for hosting, operations, support, and scale — honest pricing of real cost,
transparently stated (Commitment 6). Forbidden: **withholding source** to
create a proprietary moat (all code is published under LD 17; a self-hoster
must be able to run everything); **deliberately degrading the free tier** to
manufacture upgrade pressure; and **tier-gating dignity** — being heard,
appeals, equal process, exit, and portability are never paid features
(Commitments 4, 9). Consequence accepted: feature-based open core is
foreclosed, and dual licensing is foreclosed *structurally*, since it would
require the CLA permanently refused in LD 17.

---

## 7. Consolidated risk register

Severity × Likelihood (1–5 each); updated for the 18+ launch decision.

| # | Risk | S×L | Level | Mitigation / status |
|---|---|---|---|---|
| R1 | Grants held revocable (consideration failure); derivatives stranded | 5×3=15 | ORANGE | Contract-integrated consideration; explicit "perpetual and irrevocable"; version-stamped grants. Residual → YELLOW. Attorney-mandatory. |
| R2 | Venue-death stranding (LLC-only venue + platform failure) | 5×4=20→low | GREEN/YELLOW | Dropped by A+C **and** by the conscious-porting model: originals are exportable, so community continuity survives. Residual is R8. |
| R3 | §203 termination at 35 yrs | 2×2=4 | GREEN | Accept; §203(b)(1) protects existing derivatives; say so honestly (C6). |
| R4 | Minor grantors disaffirming grants | — | **Foreclosed** | 18+ launch removes it entirely. |
| R5 | Non-US moral rights / irrevocability variation | 3×3=9 | YELLOW | No moral-rights waiver demanded (lineage aligns with them); choice-of-law clause. Attorney item. |
| R6 | Regretful creator files DMCA vs. a validly grandfathered derivative | 3×3=9 | YELLOW | Grant records as counter-notice evidence; `dmca_counter`/`dmca_restore` already in the moderation schema. Registrar role is load-bearing. |
| R7 | Trust collapse via unilateral license amendment (OGL scenario) | 4×2=8 | YELLOW | Version stamped at derivation; changes prospective-only; ORC-style unamendability of issued grants; purpose trust (B) at maturity. |
| R8 | **Derivative durability is Space-scoped** — Space/instance death loses derivatives (they are non-portable) | 3×3=9 | YELLOW | Accepted current limitation (LD 1/6). Cross-Space derivative migration is a deferred future consideration. State plainly to members. |
| R9 | Trademark ambiguity weaponizable by a future steward (WordPress scenario) | 4×3=12 | ORANGE→YELLOW | Defensive registration + published non-weaponization policy + eventual trust-held mark. Founder-filable now. |
| R10 | Personal data unlawfully treated as a forkable/transferable asset | 4×3=12 | ORANGE→YELLOW | Self-serve export only; `private_notes` non-exportable; DPA + breach posture on Phase 5 checklist. |

Escalation: R1, R5, R7, R9, R10 meet the "outside counsel recommended"
criteria (novel issues, jurisdictional complexity, specialized IP/privacy
expertise). All fold into the **existing Phase 5 attorney gate** — this
register documents *why* that gate is hard, without reopening the 2026-07-17
rescope.

---

## 8. MVP vs Deferred — the legal architecture at a glance

| Item | MVP | Deferred | Design-around-now |
|---|---|---|---|
| Base derivation grant (Layer 0), peer-to-peer, registrar-recorded | ✅ | | |
| Activation gate as consent point (LD 7) | ✅ | | |
| Derivation-on-by-default post-activation; Space commons | ✅ | | (log the C3 strain) |
| Retained-rights-first text + plain-language summary + clickwrap record | ✅ | | |
| Self-serve member export / migration | ✅ | | |
| Venue definition A + C-trigger | ✅ (design intent) | B trust: Part VII | |
| Defensive trademark registration + non-weaponization policy | ✅ (founder-filable) | Trust-held mark | |
| 18+ age floor | ✅ | 13+ revisit | |
| Additional-permissions **hook** in base text + grant-record slot | ✅ | | ✅ |
| Layer 1 (commercial/bounty), Space-defined menu | | ✅ | ✅ (hook) |
| Layer 2 (external), person-to-person, platform-as-notary | | ✅ | ✅ (hook) |
| Space-level permission governance + disclosure-on-entry | | ✅ (with Layers 1/2) | ✅ (Covenant floor) |
| Monetization of composed Works / Works-containing-derivatives | | ✅ | (lineage makes it computable later) |
| Cross-Space derivative migration | | ✅ | |

---

## 9. Attorney-gate items (Phase 5)

Compiled for the eventual engagement; not acted on now:

1. Final Derivation License text — consideration structure, perpetual+
   irrevocable language, §203 honesty, retained-rights clause, sub-derivation
   bar, venue definition (A+C), additional-permissions hook.
2. Clickwrap/assent form sufficiency.
3. Choice-of-law and the non-US moral-rights posture (R5).
4. Trademark registration mechanics and the non-weaponization policy language
   (R9).
5. Personal-data: Supabase DPA review, breach posture, EU-transfer mechanism if
   EU members are served (R10).
6. Purpose-trust structure for name + license text (converges with Part VII
   succession) — when it matures.
7. The Layer 2 external-grant **template** language (when Deferred layers are
   built) — confirming the platform's notary-not-party posture holds in the
   drafting.

---

## 10. Formational decisions needing transparency-log entries

Per the README formational reading, these meet the criteria (hard-to-reverse /
member-rights-touching / strain-accepting / violation-rejecting / amends a
Locked Decision). Candidate entries to draft next — **one consolidated license
entry is likely cleaner than several**, but listed separately so nothing is
lost:

1. **The rights model** — base grant + additive layers; direct peer grant;
   platform-as-registrar; hub-and-spoke rejected as violating C3/C5. *(Amends
   LD 13.)*
2. **Venue definition A + C**, including the conscious-porting refinement and
   the rejected venue options as precedent. *(Touches Part VI; member rights.)*
3. **The four-strata fork architecture**, especially the trademark stratum
   (rename requirement, defensive registration, non-weaponization) and the
   personal-data non-forkability + self-serve export. *(Hard-to-reverse;
   member rights.)*
4. **The derivation-default fusion** (publish = enable derivation) — **resolved
   2026-07-22 and reclassified.** This is no longer a strain to be logged but a
   **Covenant amendment to be drafted**: Commitments 3 and 5 must be reworded so
   the creator's freedom is stated accurately (control = which Space, and
   whether to activate — not a per-derivation veto). The amendment is
   formational and gets a log entry when made, as "What Evil Is" did. Separate
   work, not part of the licensing entry. See §3.2.
5. **18+ launch floor** and the risk classes it forecloses. *(Data-retention/
   member-rights shape.)*

MVP_Spec amendments that will follow (drafted for Claude Code on approval):
LD 13 rewritten from "likely form / undecided" to the base-plus-layers model
with the registrar spine; new Deferred items (Layers 1/2, cross-Space
derivative migration, monetization-of-composed-Works); the Commitment 9 pricing
floor and the anchorless-newcomer funding edge appended to the monetization
open decision; a pointer to this document as the rights-architecture reference.

---

## Appendix A — Adjacent items, held as working drafts

Several questions raised during the rights-architecture sessions are **not part
of the rights architecture proper** and are **deliberately not committed**, because
unlike the architecture above they are genuinely unsettled. They are held as
founder working drafts and will be committed individually if and when they are
decided:

| Topic | Nature |
|---|---|
| Monetization principles and candidate revenue engines | Business model; wholly undecided. The one settled piece — the "open source, metered service" pricing constraint — is stated in §6 above rather than referenced. |
| Offline local-first editor/viewer; content-portability round-trip; markdown↔JSON contract | Architecture decision record, proposed status. Depends on the server-side authority rule that protects registrar provenance integrity (§2). |
| Substrate posture and vertical strategy (content-reuse north star, CCMS vertical, TTRPG beachhead) | Posture and hypothesis, not product. |
| Creator entry gate (LD 2), its accepted strain, and a possible educational formation gate | Carries a named Covenant strain; will need its own log entry **when decided**, not before. |
| Space-level self-governance over metadata and Element types; cross-Space derivative migration | Develops risk R8 (§7). Deferred. |
| Business identity thesis; steward-ownership / purpose-trust container | The latter parked by founder decision 2026-07-22 until the company matures to need it; converges with Part VII succession and mechanism B (§4). |

**No draft carries a transparency-log entry.** Log entries record decisions, and
these are not yet decisions.

---

*End of v0.1, revised 2026-07-22.*
