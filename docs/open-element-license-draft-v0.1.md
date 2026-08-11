# The Open Element License — Draft v0.1

**Status: `draft — not decided`.** This is a founder working draft. Nothing in it
is a decision, and no part of it may be cited as settled however finished the
prose reads. The register model it presupposes is an **effectuation probe**, not
an adopted product shape: adopting it would amend MVP_Spec Locked Decision 13 and
would carry its own transparency-log entry at that time.

**This is preparation and risk-flagging, not legal counsel.** No privilege, no
jurisdictional sign-off, no accountability. Every custom instrument affecting
members' rights is non-final until attorney review at the Phase 5 gate (MVP_Spec
LD 13, as amended 2026-07-17). AI-drafted instrument text is non-final by
definition.

**Companion instrument:** `docs/attestation-draft-v0.1.md`. The two are designed
together — this License is the grant; the Attestation is its acceptance. Neither
is complete without the other.

Compiled 2026-08-11.

---

## 0. What this document contains

| § | Contents |
|---|---|
| 1 | What the instrument is, and what it deliberately is not |
| 2 | Design constraints it must satisfy |
| 3 | **The License** — operative text, CC0-dedicated, free-standing |
| 4 | Clause commentary — why each Article exists and what it is doing |
| 5 | Attorney-gate items |
| 6 | Risk register (E1–E9) |
| 7 | Open decisions |

---

## 1. What this is

The **Open Element License** is a public copyright license in the family of the
Open Game License and the ORC License. A rights-holder uses it to open **named,
individual elements** of a creative work — a character, a faction, a setting, an
event, an item — to identified people who have recorded a written acceptance,
within a scope the rights-holder chooses, revocably as to the future and
irrevocably as to what has already been made.

It is **free-standing.** It does not require Open Eppic, name Open Eppic, or
depend on any Open Eppic mechanic. It refers only to a **Register** — any system
of record that performs the four functions Article XII defines. Open Eppic is
intended to be the first such register, and Open Eppic's Space mechanics are an
implementation of this License's Designated Scopes, not a term of it.

**It is the default, not the requirement.** A register implementing this License
records whatever license a rights-holder brings — the OGL, the ORC License, a
publisher's own third-party license — and offers this one only to rights-holders
who do not have a license of their own, or who want element-level granting finer
than their existing license offers.

**The Register never licenses anything.** It is not a licensee, not a sublicensor,
not a party, and acquires no interest in anything described here. Hub-and-spoke —
a platform taking a license and granting it onward — is refused permanently as
violating Covenant Commitments 3 and 5 (MVP_Spec LD 13). This is stated in the
operative text at Article XII, not only in commentary, because a default license
distributed by a platform is the exact instrument most likely to be *read* as
platform-held.

### What it does that the existing licenses do not

The OGL and the ORC License both draw the open/reserved line **inside a published
product**: a static notice block, at publication, to the entire world,
permanently. OGL's Product Identity definition excludes characters, storylines,
plots, places, and proper nouns from what the license grants at all. ORC's
Reserved Material definition does the same, and opens such material only where a
Licensor expressly designates it — after which ORC §IV forbids withdrawal as to
existing *and prospective* licensees, forever. Lancer's Third Party License does
genuinely permit locations, characters, factions, and events, but it is a webpage
with no version history, no acceptance record, and no irrevocability clause.

So a rights-holder's real choice today is blanket, anonymous, worldwide, and
permanent — or nothing. This License moves the designation out of the product and
into a dated register act, which changes four things:

1. **Designation is per-element and dated**, not a notice block.
2. **Acceptance is by recorded Attestation**, not by conduct — so the Licensor has
   an identified counterparty and a list.
3. **Withdrawal is prospective-only**: closing an element to new acceptances
   breaks nothing already made.
4. **The governing text is fixed by content hash** at each acceptance, which is
   the direct answer to the 2023 OGL 1.1 episode, where the dispute turned on
   which version was "authorized" and no licensee held independent evidence of
   the text they had relied on.

### CC0

This License text is intended for dedication to the public domain under **CC0
1.0**, on the same reasoning recorded for the Attestation:

- The trust precedent runs this way. ORC's answer to OGL 1.1 was to place its text
  at the Library of Congress and make it expressly unamendable (§V.b), deliberately
  not owned by any platform. ORC is adoptable precisely because it is not "the
  Paizo License." A rights-holder burned in 2023 will read a platform-proprietary
  instrument as the same trap in new clothing.
- The words are not the moat. The timestamp, the hash, the public listing, and the
  identified-counterparty record are.
- It is the rule already adopted — *open source, metered service*
  (`docs/rights-and-legal-architecture.md` §6) — applied to a legal instrument.
- It extends forkability to the one stratum the four-strata architecture does not
  currently reach (`docs/rights-and-legal-architecture.md` §1).

The **name** is protected differently from the text. CC0 imposes no conditions, so
adaptations cannot be required to rename — but the name is defensible by trademark,
which the rights architecture already plans (defensive registration plus a published
non-weaponization policy, LD 19c). This is the same split ORC uses: open text,
controlled name.

---

## 2. Design constraints

1. **The Register holds no rights.** Nothing in the text may be read as granting a
   register a license, a sublicensable interest, or any interest in anyone's work
   (Commitments 3 and 5; LD 13).
2. **Retained rights lead.** Ownership anxiety is the first question a participant
   actually asks (`docs/rights-and-legal-architecture.md` §3.3), so it is Article
   II, before the grant.
3. **No platform mechanics in the text.** The words "Space," "Element," "Work,"
   "Activation," and "Open Eppic" are Open Eppic vocabulary. The License uses
   Register, Registered Element, Designated Scope, Participant, and Attestation,
   each defined here, so the instrument survives being used by someone else.
4. **Combination is always opt-in.** Cross-scope mixing happens only where every
   Licensor involved has designated into a common Scope. Silence would be read
   restrictively and would foreclose the feature; the clause is therefore
   affirmative and default-off.
5. **No forced onward licensing.** ORC §II.b conditions the grant on the licensee
   offering their Adapted Licensed Material onward under ORC; OGL does the same for
   Open Game Content. This License does neither. The commons compounds by the
   Participant's **voluntary** designation of their own original contributions, plus
   **mandatory** attribution — a consensual mechanism rather than a compulsory one
   (founder decision; see also the 2026-07-22 peer-commons finding).
6. **No moral-rights waiver.** Lineage attribution aligns with moral rights rather
   than fighting them (`docs/rights-and-legal-architecture.md` §5). ORC §II.d.ii
   waives them to the extent possible; this License does not ask.
7. **Commercial use is opt-in.** Default off, matching LD 6, designated by the
   Licensor in the Register rather than written into the text — so LD 6 is not
   relaxed and Layer 1 is not foreclosed.
8. **Each Licensor states their own conduct condition.** The License does not carry
   an Open Eppic-defined content restriction. Open Eppic is not a party to this
   License and could not enforce one; claiming otherwise would misstate its role
   (Commitment 6). Covenant Commitments 1 and 2 are enforced where Open Eppic *is*
   a party — its Content Guidelines and Terms.
9. **Unamendable, version-and-hash fixed.** ORC §V.b's discipline, refusing OGL's
   "authorized version" clause.

---

## 3. The License

> Everything between the rules below is the proposed instrument text. Bracketed
> `[ ]` items are completed by the adopting Register or the Licensor.

---

### THE OPEN ELEMENT LICENSE

**Version 0.1-draft · Text content hash: `[SHA-256 of this License text]`**

*This License text is dedicated to the public domain under CC0 1.0. It may be used,
adapted, and embedded by anyone, for any purpose, without permission. Adaptations
are asked, though not required, to be published under a distinct name.*

---

#### Preamble

You made a world, and people want to live in it. Until now your choice has been to
hand it to everyone on earth, anonymously and permanently, or to hand it to no one.
This License is the middle. You open the pieces you choose, to people who have put
their names to your terms, in the places you choose. You can stop opening new pieces
whenever you like. What people already made under your terms stays theirs, and stays
legal. That last part is not a courtesy; it is what makes the first part safe to do.

---

#### Article I — Definitions

**a. "Register"** means a system of record that performs the functions described in
Article XII.

**b. "Registration Record"** means the record a Register maintains for a Registered
Element, stating at minimum: the Licensor, the identification and description of the
Element, the Designated Scopes, any Designated Permissions, the Governing Version of
this License, and the date of each of these and of any change to them.

**c. "Licensor"** means the person or entity designating material under this License.

**d. "Participant"** means a person whose Attestation has been recorded by the
Register.

**e. "Registered Element"** means an individual item of creative material that a
Licensor has designated under this License in a Registration Record — for example a
character, a faction, an organization, a setting, a location, an event, an item, a
creature, or a body of lore. Material not so designated is not licensed by this
License.

**f. "Designated Scope"** means a named context, identified in the Registration
Record, within which the Licensor permits the Registered Element to be Used. A
Licensor may designate one or more Scopes for an Element, may add Scopes at any time,
and may cease designating into a Scope prospectively under Article VI.

**g. "Designated Permission"** means an additional permission the Licensor has
expressly enabled in the Registration Record, beyond the grant in Article IV. A
permission not expressly enabled is not granted.

**h. "Attestation"** means a dated, written, identity-verified declaration recorded by
the Register in which a person identifies the material relied on, identifies the
Governing Version of this License by version designation and content hash, and states
that they have read it and are bound by it.

**i. "Governing Version"** means the version and content hash of this License
identified in a particular Attestation.

**j. "Reserved Material"** means everything the Licensor has not designated as a
Registered Element, and in every case includes trademarks, service marks, trade dress,
logos, and brand identifiers, which cannot be licensed under this License at all.

**k. "Contributed Element"** means original material of a Participant that the
Participant has, at their own option, designated as a Registered Element under this
License.

**l. "Use"** means to reproduce, adapt, translate, perform, display, distribute, or
make derivative works of material, and to make material available to the public.

**m. "Your Work"** means the work a Participant creates that incorporates or derives
from one or more Registered Elements.

---

#### Article II — Retained rights

**a.** Everything a Participant originates in Your Work belongs to the Participant.
This License transfers nothing of theirs, grants no interest in Your Work to the
Licensor, to the Register, or to anyone else, and creates no obligation to license
Your Work to anyone.

**b.** A Participant's rights extend only to what they contributed. The Licensor's
rights in the Registered Elements are untouched by anything a Participant makes.

**c.** A Participant's own original material travels with them. Nothing in this
License restricts a Participant's use of their own original material anywhere, at any
time, for any purpose, whether or not it first appeared in Your Work, and whether or
not the Licensor later withdraws any designation.

**d.** No Participant waives, and no Licensor is asked to waive, any moral right.

---

#### Article III — Designation

**a.** A Licensor designates material under this License by creating or updating a
Registration Record. Designation is effective from the date recorded and applies only
to the Elements, Scopes, and Permissions the record identifies.

**b. Representation of authority.** By designating an Element, the Licensor represents
that the Element is the Licensor's original creation or that the Licensor holds rights
sufficient to grant the rights this License conveys. The Licensor makes this
representation to Participants. No Register verifies it.

**c.** Reserved Material is not licensed, is not made licensable by appearing in the
same work as a Registered Element, and is not made licensable by being described in a
Registration Record for identification purposes.

**d.** A Licensor may designate visual, musical, or audio material only by identifying
it expressly. It is otherwise Reserved.

---

#### Article IV — Grant and acceptance

**a. Acceptance.** This License is accepted by recording an Attestation with a
Register. It is not accepted by conduct. A person who Uses a Registered Element
without a recorded Attestation has no license under this License.

**b. The grant.** Subject to this License, the Licensor grants each Participant a
worldwide, royalty-free, non-exclusive, non-sublicensable license to Use the Registered
Elements identified in that Participant's Attestation, within the Designated Scopes
stated in the Registration Record, on the terms of the Governing Version.

**c. Combination.** A Participant may combine Registered Elements of two or more
Licensors in a single Work only where every such Licensor has designated the Elements
used into a Scope common to them all. Where Elements in one Work carry different
Designated Permissions, the Participant's use of the Work as a whole is limited to the
narrowest permission carried by any Element in it.

**d. Commercial use.** This License does not permit commercial use of Your Work.
Commercial use is available only where every Licensor whose Registered Elements appear
in Your Work has enabled it as a Designated Permission, and is limited by Article
IV.c.

**e. Consideration.** The Licensor's grant and the Participant's undertakings in this
License and in the Attestation are exchanged, each for the other.

---

#### Article V — Limitations

**a.** Nothing in this License permits a Participant to assert or imply that they, or
Your Work, are connected with, sponsored by, endorsed by, approved by, or granted
official status by the Licensor or by any Register.

**b.** No right in Reserved Material is granted, including by implication, by course of
dealing, or by the fact of registration.

**c.** This License grants no right in another Participant's original material. Such
material is available only if that Participant has designated it as a Contributed
Element, and then only on the terms of that designation.

**d.** Nothing in this License limits any use of any material that could lawfully be
made without permission.

---

#### Article VI — Duration, withdrawal, and irrevocability

**a. Vesting.** A grant vests when an Attestation is recorded, and as to that
Participant it is perpetual and irrevocable.

**b. What withdrawal cannot do.** A vested grant is not affected by the Licensor's
later withdrawal of a designation, by the Licensor's removal of a Scope, by the
Licensor's publication or adoption of a later version of this License, by the Licensor
ceasing to participate in any Register, or by any Register ceasing to operate.

**c. What withdrawal can do.** A Licensor may at any time cease designating an Element,
or cease designating it into a particular Scope. From the date recorded, no new
Attestation may vest a grant in that Element or that Scope.

**d. Statutory limits, stated plainly.** United States law permits an author to
terminate a grant of copyright after a statutory period. Where that occurs, works
prepared before termination may continue to be used under the terms of the grant, but
new works may not be prepared. This License does not and cannot promise otherwise.

---

#### Article VII — Required notices

The grant is conditioned on the Participant including, in a reasonable manner for the
medium:

**a. License notice.** A statement identifying this License by name, version, and
content hash, and stating where its text may be obtained.

**b. Attribution.** A statement identifying each Licensor of each Registered Element
Used, and all upstream licensors of Registered Elements on which those Elements are
themselves based, in a form reasonably requested by those parties. Credit may be given
by legal name, chosen public name, or pseudonym as each party has indicated. A party
may update how they wish to be credited going forward; no such update requires a
Participant to halt distribution of, or alter, works already produced.

**c. Registration reference.** The identifier of the Participant's Attestation, so that
what was relied on and when can be located in the Register.

**d. Non-affiliation.** A statement that Your Work is not an official product of, and is
not affiliated with, any Licensor. Where a Licensor has specified the exact wording of
such a statement in the Registration Record, that wording is used.

**e.** Any attribution list a Register computes and supplies is a convenience derived
from the records available to it. It does not discharge the obligation in Article VII.b,
and verifying attribution remains the Participant's responsibility.

---

#### Article VIII — The Participant's own contributions

**a.** A Participant may, at their option, designate their own original material as a
Contributed Element under this License, and thereby becomes a Licensor as to that
material.

**b.** Nothing in this License requires them to do so. There is no condition, in this
License or in any grant made under it, obliging a Participant to license their own
material to anyone.

**c.** A Licensor acquires no right in a Participant's original material by reason of
this License, of a Participant's use of Registered Elements, or of anything recorded in
a Register.

---

#### Article IX — The Licensor's conduct condition

**a.** A Licensor may state in the Registration Record a condition governing the conduct
or content of works made under their designation. Such a condition is a term of that
Licensor's grant, binding between that Licensor and Participants who attest to it.

**b.** No Register is a party to, an interpreter of, or an enforcer of such a condition.

**c.** A Register may separately decline to publish or host any material under its own
terms. That is a decision about the Register's own service and is not an act under this
License.

---

#### Article X — Warranty and limitation of liability

Each Licensor licenses the Registered Elements as-is and as-available, and makes no
representations or warranties of any kind concerning them, whether express, implied,
statutory, or otherwise, including warranties of title, merchantability, fitness for a
particular purpose, non-infringement, accuracy, or the absence of errors — except for
the representation of authority expressly made in Article III.b. To the extent
possible, no Licensor is liable on any legal theory for any direct, special, indirect,
incidental, consequential, punitive, exemplary, or other loss arising out of this
License or the use of the Registered Elements. Where such a disclaimer or limitation is
not permitted in full or in part, it applies to the maximum extent permitted.

---

#### Article XI — Termination and remedies

**a.** A Participant's grant terminates automatically if they fail to comply with this
License, and is reinstated as of the date of termination if the failure is cured on a
going-forward basis within 60 days of the Participant's discovery of it, or if the
Licensor waives it in writing. Cure does not require destruction of inventory on hand.

**b.** Termination of one Participant's grant does not affect any other Participant's
grant, any Licensor's rights, or any upstream or downstream grant.

**c.** Only the Licensor and the Licensor's upstream licensors may bring an enforcement
action under this License. No Register has standing under this License, and none is
conferred by this License on any other person.

---

#### Article XII — The Register

**a. What a Register does.** A Register receives, dates, hashes, retains, and publishes
Registration Records and Attestations; makes records available to the parties in
complete, machine-readable form; maintains them append-only, so that corrections are new
records referring to prior ones; and publishes the version and content hash of the
License text under which each record was made.

**b. What a Register is not.** A Register is not a party to this License. It is not a
licensor, licensee, or sublicensor of anything described here, acquires no right in any
material, and grants none. It does not review, verify, approve, endorse, or certify any
Registration Record or Attestation; does not determine whether any person holds the
rights they claim; does not determine whether any use complies with this License or any
other; confers no status, authorization, official standing, or affiliation; and is not a
notary, notarial officer, or certifying authority.

**c. What a Register's record proves.** That a record was made, by an identified person,
on a stated date, referring to a License text of a stated content hash. It is not
evidence that the record is accurate, that a designation was validly made, or that any
person is or remains in compliance.

**d. Multiple and successor Registers.** Nothing in this License limits a Licensor or
Participant to one Register, and a grant vested under one Register is not affected by the
Licensor, the Participant, or the material being recorded in another.

---

#### Article XIII — Versions

**a.** This version of this License may not be amended, superseded, modified, updated,
repealed, revoked, or deauthorized, whether by any Licensor, any Participant, any
Register, or any author of this text.

**b.** Later versions may be published. A later version applies only to Attestations
recorded under it. No later version has any effect on a grant already vested, and no
person may designate any version as the sole authorized version.

**c.** Each Attestation identifies its Governing Version by version designation and
content hash. Where a version designation and a content hash disagree, the content hash
governs.

---

#### Article XIV — Construction

**a. Governing law.** `[jurisdiction, as stated by the Licensor in the Registration
Record]`, without regard to conflict-of-laws principles.

**b.** If any provision is held unenforceable, it is reformed to the minimum extent
necessary to make it enforceable, or if it cannot be reformed, severed, and the
remainder stands.

**c.** No term is waived and no failure to comply is consented to except as expressly
agreed by the Licensor.

**d.** This License does not modify, supplement, or interpret any other license, and
nothing in it may be construed to do so.

---

*End of License.*

---

## 4. Clause commentary

**Article II leads for the same reason the Attestation's clause 1 does.** The
loudest finding in the journeys corpus is ownership anxiety — what happens to my
stuff when the steward changes the rules or disappears. The DMs Guild failure mode,
a creator receiving a cease-and-desist for printing their own writing, is that fear
realized, and Article II.c is drafted to foreclose exactly it. It also does real
legal work, making explicit the 17 U.S.C. §103(b) position that a derivative author
owns what they originated and nothing more.

**Article IV.a is the load-bearing divergence from both reference licenses.** OGL
accepts by conduct — "By Using the Open Game Content You indicate Your acceptance."
ORC's grant flows to anyone exercising the Licensed Rights. Both are therefore
anonymous and worldwide by construction, which is why neither can ever give a
rights-holder a list of who is building in their world. Registration-gated
acceptance is what produces the identified counterparty, and the identified
counterparty is what makes everything downstream possible: revenue splits with
someone you can pay, endorsement of someone you can name, a bespoke permission
served to someone you can reach, and evidence a creator can hold up when a
distributor pulls their book.

It is also strictly less generous than OGL and ORC, and the cost falls on real
people. See E1.

**Article IV.c is the crossover clause, and it is default-off deliberately.**
Silence would be read restrictively and would foreclose the feature entirely. The
Designated Scope is the abstraction that lets a Licensor's choices about *who* and
*where* be recorded once and honored by any Register. Open Eppic's Space is one
implementation; two rights-holders creating a shared Space where their worlds may
mix is two Licensors designating into a common Scope. The least-permissive rule in
the second sentence is what stops a combined Work from silently acquiring the
loosest terms in the pile.

**Article IV.d keeps LD 6 intact without foreclosing Layer 1.** Derivatives are
non-monetizable at Layer 0; commerce is an additional permission granted by the
rights-holder. Writing it as a Designated Permission rather than into the text means
the Locked Decision is not relaxed, the Amazon-published-homebrew case is reachable
the day a rights-holder enables it, and no existing grant needs re-consent when it
is.

**Article VI is the product.** ORC §IV expressly forbids withdrawal as to existing
*and prospective* licensees — the offer is irrevocable forever once published. That
is what makes opening a world frightening, and it is the single term this License
changes. Vesting at Attestation, rather than at publication, is what lets both
things be true at once: nothing already made can be broken, and nothing new has to
be permitted. Article VI.d says out loud what §203 will and will not support, because
a member-facing instrument that promised literal-forever would be dishonest
(Commitment 6).

**Article VII.b is where a Register earns its keep.** ORC §III.b.i requires
attribution to all upstream licensors, not merely the immediate source; OGL's
COPYRIGHT NOTICE clause requires reproducing the exact prior notice text and adding
your own, which is why OGL products carry pages of notices and why people get them
wrong. That chain is painful by hand and trivial to compute from registration
records. VII.e is drafted so the computed list is explicitly a convenience — without
it, a Register has quietly assumed the compliance role it refuses in Article XII.

**Article VIII is the express refusal of ORC §II.b.** ORC conditions your grant on
your offering your adapted material onward under ORC; OGL does the same for Open
Game Content. This License does neither, because sub-derivation is barred on the
Open Eppic side (LD 6) and because compulsory onward licensing is a condition
imposed on a creator's own originated material. The commons still compounds, by the
mechanism the founder identified: a Participant who wants their own contributions
built on designates them, becomes a Licensor, and gets attribution as of right.
VIII.b exists so that the absence of compulsion is stated rather than inferred, and
VIII.a exists so the voluntary route is discoverable — an option nobody knows about
is not an option.

**Article IX puts the conduct condition where it can actually work.** Lancer's 3PL
bars content directing hate toward protected groups, and it can, because Massif is
the licensor. Open Eppic is not a party to this License and could not enforce an
Open Eppic-defined content restriction in it; writing one in would claim a role it
does not have (Commitment 6). Covenant Commitments 1 and 2 are floors, and they are
enforced where Open Eppic *is* a party — its Content Guidelines and Terms, which
govern what it will host. IX.c states that separation on the face of the instrument
so a Licensor is not surprised by a removal, and is not misled into thinking a
Register is policing their terms for them.

**Article XII is the anti-hub-and-spoke article, in operative text.** Everything in
it restates the registrar spine (`docs/rights-and-legal-architecture.md` §0) in
words a court could read: nothing flows through the Register, so there is nothing in
the Register for an acquirer to buy, a trustee to reject under §365(n), or a
bad-faith successor to hold hostage. XII.b's final clause is the records-custodian
correction — a company cannot hold a notarial commission, and holding oneself out as
a notary is a criminal offense in most jurisdictions.

**Article XIII is the OGL 1.1 article.** OGL's update clause let Wizards publish new
versions and permitted use only of "any authorized version," and the 2023 fight
turned on whether prior versions could be de-authorized. XIII.b forecloses the move
in terms; XIII.a borrows ORC §V.b's unamendability; XIII.c makes the content hash
the tiebreaker, so a text quietly rewritten in place on a webpage does not become
the governing text by stealth.

---

## 5. Attorney-gate items

Compiled for the Phase 5 engagement; not acted on now.

1. **Consideration and enforceability** of the grant, given acceptance by
   Attestation to a Register that is not a party. Whether the Attestation and the
   Registration Record together form a bilateral contract, and what the answer means
   for Article VI.a's irrevocability. This is the load-bearing item.
2. **"Perpetual and irrevocable" as to vested grants**, and whether Article VI.b
   survives the Licensor's death, insolvency, or transfer of the underlying
   copyright to a purchaser without notice.
3. **Article VI.d's §203 framing** — accuracy, and whether the plain-language
   statement creates any risk by stating it.
4. **Choice of law in a per-Licensor field** (Article XIV.a): whether a public
   license with a Licensor-selected forum is workable, and its interaction with the
   forum of any Register's own terms.
5. **Non-US moral rights and irrevocability variation**, given the deliberate
   absence of a waiver (rights architecture R5).
6. **The least-permissive rule** in Article IV.c — whether it is administrable, and
   what happens where one Licensor in a combined Work withdraws prospectively while
   others do not.
7. **Article IX conduct conditions** — whether a Licensor-authored condition of open
   scope creates any exposure for a Register that hosts the resulting record, and
   whether Article IX.b is sufficient to keep the Register out of it.
8. **Trademark**: Article I.j's absolute exclusion, and the name/text split
   (CC0 text, trademark-protected name) against the planned defensive registration
   and non-weaponization policy.
9. **CC0 dedication mechanics for a legal instrument**, and the interaction between
   CC0's no-conditions rule and the request that adaptations be renamed.
10. **Identity verification** as a condition of acceptance: what standard is
    sufficient for Article IV.a to mean anything evidentially, and the data-protection
    posture of holding verification records (rights architecture §1.4; Attestation
    risks A5, A6).

---

## 6. Risk register (E1–E9)

Severity × Likelihood, 1–5 each, per the framework used in
`docs/rights-and-legal-architecture.md` §7. Prefixed `E` to avoid collision with
that document's R1–R10 and the Attestation's A1–A7.

| # | Risk | S×L | Level | Mitigation / status |
|---|---|---|---|---|
| E1 | Registration-gated acceptance excludes the undocumented, the pseudonymous, and those whose legal name differs from their public one — a Commitment 9 access gradient | 3×5=15 | ORANGE | **Accepted by founder decision.** The mechanic is what makes every downstream path legal, and the trade-off is taken knowingly. Mitigations are partial only: reading and collecting stay unverified; public credit is by chosen name (Article VII.b); verification records are held privately. Disclosed on the face of the instrument and at the point of attesting, never buried. Revisit when a lower-friction verification route exists. Strain-accepting and therefore formational — see §7. |
| E2 | Prospective withdrawal makes this License weaker for licensees than ORC §IV; a Participant's source can close mid-project | 3×4=12 | ORANGE | Inherent to the design, not a defect — it is the term that makes opening possible at all. Vesting at Attestation (VI.a) protects work already begun under a recorded grant. Registers should show designation and withdrawal dates on the public entry so the risk is visible before anyone invests. |
| E3 | The Register becomes an enforcement map — non-registration is conspicuous, and a Licensor uses the list to pursue unregistered fans | 3×3=9 | YELLOW | No Register standing (XI.c); Article XII.b's no-compliance-finding posture; the non-weaponization posture already adopted for the mark should extend to the register data as published policy. Genuinely unmitigated at the instrument level: this is a policy problem, not a drafting one. |
| E4 | A Licensor designates material they do not own — the "original Spartan from Halo" case | 4×3=12 | ORANGE | Article III.b representation runs to Participants, not to the Register; claim-not-truth on the face of every public entry; the provenance-dispute path (Roadmap Open Tensions, 2026-08-11) is distinct from content moderation and must exist before designations are published; concierge review for cohort one. |
| E5 | The Register is read as licensor or sublicensor despite Article XII | 4×3=12 | ORANGE | Article XII in operative text rather than commentary; recitals in the Attestation say the same in the Participant's voice; public-entry face text. Residual risk is user perception, not drafting. |
| E6 | Choice of law indeterminate or unenforceable in a per-Licensor field | 3×3=9 | YELLOW | Attorney item 4. The alternative — a single fixed forum in a free-standing license — is worse, because it makes the instrument jurisdiction-bound and defeats reuse. |
| E7 | A future steward, or a fork, publishes a version claiming to supersede this one (the OGL 1.1 replay) | 4×2=8 | YELLOW | Article XIII in three parts; content hash as tiebreaker; copyright deposit of the text on the ORC model; the purpose trust (rights architecture §4, mechanism B) at maturity. |
| E8 | A Licensor enables commercial use without understanding the downstream chain — upstream attribution obligations, third-party platform terms, tax | 3×3=9 | YELLOW | Designated Permission is a deliberate, dated act rather than a default; disclosure at the point of enabling; Article IV.c's least-permissive rule limits the blast radius. |
| E9 | A combined Work acquires inconsistent terms as Licensors change designations at different times | 3×4=12 | ORANGE | Article IV.c least-permissive rule; vesting under VI.a means changes are prospective; attorney item 6 tests administrability. |

Escalation: E1, E2, E4, E5, and E9 meet the "outside counsel recommended" criteria
(novel issues, specialized IP expertise, material member-rights exposure). All fold
into the existing Phase 5 attorney gate.

---

## 7. Open decisions

1. **Is the register model the product shape, or the premise this instrument is
   drafted against?** If the former, it amends LD 13 and is formational — a
   transparency-log interpretation entry is owed, and MVP_Spec's register probe moves
   from Open Strategic Decisions to a Locked Decision. If the latter, nothing changes
   and the probe bullet already covers it. Unresolved as of this draft.
2. **E1 is strain-accepting and therefore formational** under the five criteria in
   `transparency/README.md`. Knowingly conditioning participation on identity
   verification, with the Commitment 9 cost named and taken, is exactly the shape of
   decision the log exists for. The entry is owed **when the instrument is adopted**,
   not while it is `draft — not decided` — the same treatment the register probe
   received.
3. **Relationship to LD 6 and LD 7.** This License is drafted so that neither is
   relaxed: commerce stays off by default, and nothing here creates a per-requester
   veto. But LD 7's "activation opens an Element to derivation by that Space's
   members" and Article III's designation act are the same act described in two
   vocabularies, and the two documents should eventually say so in one place.
4. **Register listings are index records, not Elements** (founder decision,
   2026-08-11). LD 21a governs Elements and does not reach index records, so the
   no-visible-but-inert invariant survives intact rather than carrying an exception.
   Needs stating in MVP_Spec; not formational, since it amends no Locked Decision and
   accepts no strain.
5. **Whether the Attestation form needs revision** now that this License exists.
   Attestation clause 5 assumes the Governing License's attribution requirements are
   unknown to the form; where the Governing License *is* this one, Article VII is
   knowable and the register can do more. The forms should stay independent — but the
   interaction is worth one pass.
6. **Copyright deposit of the License text**, on the ORC model, and at what point it
   is worth the filing.
