# The Open Attestation of Licensed Use — Draft v0.1

**Status: `draft — not decided`.** This is a founder working draft. Nothing in
it is a decision, and no part of it may be cited as settled however finished the
prose reads. The register model it presupposes is an *effectuation probe*, not
an adopted product shape: adopting it would amend MVP_Spec Locked Decision 13
and would carry its own transparency-log entry at that time.

**This is preparation and risk-flagging, not legal counsel.** No privilege, no
jurisdictional sign-off, no accountability. Every custom instrument affecting
members' rights is non-final until attorney review at the Phase 5 gate
(MVP_Spec LD 13, as amended 2026-07-17). AI-drafted instrument text is non-final
by definition.

Compiled 2026-08-11.

---

## 0. What this document contains

| § | Contents |
|---|---|
| 1 | What the instrument is, and what it deliberately is not |
| 2 | Design constraints it must satisfy |
| 3 | **The Form** — operative text, CC0-dedicated, free-standing |
| 4 | Clause commentary — why each clause exists and what it is doing |
| 5 | Attorney-gate items |
| 6 | Risk register (A1–A7) |
| 7 | Open decisions |

---

## 1. What this is

The **Open Attestation of Licensed Use** is a unilateral, dated, hash-anchored
written declaration by a person who is building on someone else's licensed
creative material. The declarant states what they relied on, which exact version
of which license governed it, that they read it and are bound by it, and what in
their own work is independently theirs.

It is **not a license.** It grants nothing to anyone. It sits *over* whatever
license the rights-holder already publishes — the Open Game License, the ORC
License, a publisher's own third-party license, or a register's default template
— and does not modify, supplement, or interpret that license.

It is **not a notarial act, and the register that receives it is not a notary.**
A notary public is a natural person holding a state commission; a company cannot
hold one, and holding oneself out as a notary is a criminal offense in most
jurisdictions. The register is a **records custodian operating a system of
record**, designed so that its records are admissible as business records
(FRE 803(6)) and self-authenticating (FRE 902(11), 902(13)), with integrity
established by cryptographic hash (FRE 902(14)). Those are US evidentiary rules
and cannot be baked into a jurisdiction-neutral form; the form therefore states
an integrity and retention *posture*, and each adopting register makes its own
evidentiary claims in its own documentation.

> **Naming correction carried out of this draft.** `docs/rights-and-legal-architecture.md`
> §3.4 and MVP_Spec LD 13 use "notary — never a party" as internal shorthand.
> The architecture is unaffected, but the word must not appear in any
> member-facing text (Commitment 6, and legal exposure). A wording amendment to
> both documents is proposed separately; it is not formational.

### Why it exists

Every widely used open creative license in this space uses **conduct-based
acceptance** — you accept by using the material — which leaves no dated record
of *who* accepted *what text* *when*. The OGL 1.1 episode turned precisely on
which version of a license was authorized, and no participant held independent
evidence of the text they had relied on. Lancer's Third Party License has no
acceptance mechanism at all.

This instrument converts a fuzzy, undated, conduct-inferred acceptance into an
explicit, dated, hash-anchored one, and creates a record of the declarant's own
retained rights at the same moment. It supplements the governing license's
acceptance terms; it does not replace them.

### CC0

This form is intended for dedication to the public domain under **CC0 1.0**, so
that any register, publisher, or individual may use, adapt, or embed it without
permission or attribution. Reasons, stated so they are not lost:

- The trust precedent runs this way. ORC's answer to OGL 1.1 was to place its
  text at the Library of Congress and make it expressly unamendable (§V.b) —
  deliberately not owned by any platform. A rights-holder burned in 2023 will
  read a platform-proprietary attestation form as the same trap in new clothing.
- It costs nothing competitively. The words are not the moat. The timestamp,
  the hash, the public listing, and the identified counterparty record are.
- It is the rule already adopted: *open source, metered service*
  (`docs/rights-and-legal-architecture.md` §6) applied to a legal instrument
  rather than to code.
- It extends forkability to the one stratum the four-strata architecture does
  not currently reach (`docs/rights-and-legal-architecture.md` §1).

**CC0, not CC-BY** — attribution conditions on a legal form create friction at
every reuse. Version drift is the failure mode this form exists to solve, so the
form carries a version number and a content hash of its own, and adopting
registers are asked (not required — CC0 imposes no conditions) to publish
adaptations under a distinct name.

---

## 2. Design constraints

Carried in from the covenant and architecture work; each is load-bearing.

1. **The register holds no rights.** Nothing in the form may be read as granting
   the register a licence, a sublicensable interest, or any interest in the
   declarant's work. Hub-and-spoke is rejected permanently as violating
   Commitments 3 and 5 (MVP_Spec LD 13).
2. **Retained rights lead.** Ownership anxiety is the first question a
   participant actually asks (`docs/rights-and-legal-architecture.md` §3.3), so
   the clause that answers it is clause 1, not clause 11.
3. **Claim, not truth.** The register attests that a declaration was made on a
   date. It never attests that the declaration is correct, never reviews it, and
   never confers status. Anything else is false witness (Commitment 6; "What Evil
   Is," shape 4).
4. **No moral-rights waiver.** Lineage attribution aligns with moral rights
   rather than fighting them (`docs/rights-and-legal-architecture.md` §5).
5. **Chosen name public; identity verified privately.** ORC §III.b.i expressly
   permits named, anonymous, or pseudonymous credit; the contribution ledger and
   moderation schema invariant 3 already run on chosen public names only.
6. **Pointer-based obligations.** Participant obligations differ per license, and
   a per-license form defeats free-standing reuse. The form binds by reference to
   a hashed text, and states on its face only what is common across the major
   instruments.
7. **Append-only.** An attestation is never edited; corrections are new records
   referencing the prior one (moderation schema invariant 1).
8. **One attestation per governing license version**, listing one or many
   materials under it. The hash must stay singular.

---

## 3. The Form

> Everything between the rules below is the proposed instrument text. Bracketed
> `[ ]` items are fields completed by the adopting register or the declarant.

---

### THE OPEN ATTESTATION OF LICENSED USE

**Form version 0.1-draft · Form content hash: `[SHA-256 of this form text]`**

*This form is dedicated to the public domain under CC0 1.0. It may be used,
adapted, and embedded by anyone, for any purpose, without permission.*

---

#### Record header

| Field | Value |
|---|---|
| Attestation ID | `[register-assigned identifier]` |
| Register | `[register name]`, `[register URL]` |
| Declarant (public name) | `[chosen public name]` |
| Declarant identity | Verified by the Register on `[date]`; verification records are held privately and are not published |
| Declared on | `[timestamp, UTC]` |
| Governing License — title | `[license title]` |
| Governing License — licensor | `[licensor name]` |
| Governing License — version | `[version designation]` |
| Governing License — source | `[URL or other locator]` |
| Governing License — content hash | `[SHA-256 of the license text relied upon]` |
| Licensed Material relied upon | `[register identifiers, one or more]` |
| The Declarant's Work | `[title]`, `[register identifier]`, `[external locator, if published elsewhere]` |

---

#### Recitals

**A.** The Register named above operates a system of record. It receives, dates,
hashes, retains, and publishes declarations of the kind set out below.

**B.** The Register **does not**: review, verify, approve, endorse, or certify
the contents of any declaration; determine whether any person holds the rights
they claim; determine whether any use complies with any license; confer any
status, authorization, official standing, or affiliation on any person or work;
act as a notary, notarial officer, or certifying authority; or hold, acquire, or
exercise any right in any material described in any declaration.

**C.** A record in the Register is evidence that **a declaration was made, by an
identity-verified person, on a stated date, referring to a license text of a
stated content hash**. It is not evidence that the declaration is accurate, that
the declared license was validly granted, or that the Declarant is or remains in
compliance with it.

**D.** The Declarant makes this declaration voluntarily and for the purpose of
creating a durable, dated record of the Declarant's reliance and undertakings.

---

#### The Declarant declares:

**1. Retained rights.**
Everything I originated in my Work remains mine. This declaration transfers no
right, grants no license, and creates no interest in my Work in favour of the
Register, the Licensor, or any other person. My own original contributions —
the expression I authored, the material I created — remain my property
absolutely and travel with me. Where my Work incorporates or is derived from the
Licensed Material, my rights extend only to what I contributed, and the
Licensor's rights in the Licensed Material are untouched by anything I have made.

**2. The governing license and its exact text.**
I have obtained the text of the Governing License identified in the record header
above. The content hash recorded there is the hash of the text I obtained and
relied upon. I understand that this record fixes *that* text as the text I acted
on, and that later versions, amendments, or replacements of the Governing License
are not what this declaration refers to.

**3. Reading, understanding, and being bound.**
I have read the Governing License in full. I understand its terms, including its
restrictions and its conditions. I undertake to comply with it in my use of the
Licensed Material. My obligations under the Governing License are owed to the
Licensor and are governed by that license, not by this declaration.

**4. Sufficient rights and independent origination.**
My contributions to my Work are my own original creation, or I hold rights
sufficient to include them. To the best of my knowledge, my Work does not use
material belonging to any third party except (a) the Licensed Material identified
above, used under the Governing License, and (b) material I have separately
identified in the Register with its own basis of use. I understand that I alone
am responsible for the accuracy of this statement.

**5. Attribution.**
I undertake to provide attribution as the Governing License requires, in the form
and placement it requires. Where the Governing License requires attribution to
licensors upstream of my immediate source, I undertake to attribute those upstream
licensors also. I understand that any attribution list the Register computes and
supplies to me is a convenience derived from the records available to it, that it
does not discharge my obligation, and that verifying attribution against the
Governing License remains mine to do.

**6. No affiliation, no endorsement, no official status.**
My Work is not an official product of the Licensor. I am not affiliated with the
Licensor, and I do not claim, imply, or intimate affiliation, sponsorship,
approval, endorsement, or official status. I will include in my Work any
disclaimer, acknowledgement, or notice the Governing License requires, in the exact
words it requires where it specifies them. Registration confers no affiliation and
no endorsement, and I will not represent it as doing so.

**7. Material not granted to me.**
I understand that the Governing License grants me some things and withholds
others, and that material withheld — however described in that license, whether as
product identity, reserved material, trademarks, trade dress, logos, art, or
otherwise — is not mine to use merely because I have registered this declaration.
Registration of a declaration referring to the Licensed Material is not a grant of
anything beyond what the Governing License itself gives.

**8. This record is not a certificate of standing.**
I understand that licenses of this kind commonly terminate on breach, sometimes
with a cure period, and that my rights under the Governing License depend on my
continuing compliance with it and not on this record. This declaration records what
I stated on the date I stated it. It does not certify that I was then in
compliance, and it does not certify that I am in compliance now.

**9. Public listing.**
I consent to the publication by the Register of: my chosen public name; the fact,
date, and identifier of this declaration; the Governing License identified,
including its version and content hash; the Licensed Material identified; and the
identification of my Work, including any external locator I supplied. I understand
that my identity verification records are **not** published, that my legal name is
not published unless I have chosen it as my public name, and that no contact
information of mine is published by the Register.

**10. The Register is not a party.**
The Register is not a party to the Governing License, is not a licensor or
licensee of anything described here, and is not a party to this declaration in the
sense of owing or acquiring obligations under it. It is the custodian of the
record. Any obligation of the Register to me arises only under its own published
terms of service and not under this instrument.

**11. Integrity, correction, and retention.**
I understand that this record is append-only: it will not be edited after it is
made. If I need to correct or supersede it, I will make a new declaration
referring to this one, and both will remain in the record. I understand that I may
obtain a complete, machine-readable copy of this record at any time.

**12. Withdrawal.**
I may withdraw this declaration from public listing at any time. I understand that
withdrawal removes the public listing and minimizes my personal data in the
Register, but does not erase the record itself, because the record's purpose is to
be durable evidence of what was stated on a date, and because the Licensor and
others may have relied on it. A withdrawn declaration is marked withdrawn, with the
date of withdrawal, and remains referable by its identifier.

**13. Electronic execution.**
I intend the affirmative act recorded below to be my signature on this declaration,
and I consent to making and receiving this record electronically.

**14. Truthfulness.**
Everything I have declared above is true to the best of my knowledge and belief. I
understand that a false declaration may expose me to liability and may result in
removal of my declaration from the Register.

---

#### Execution

| Field | Value |
|---|---|
| Affirmative act | `[record of the signing action taken by the Declarant]` |
| Declarant public name | `[chosen public name]` |
| Identity verification reference | `[private reference; not published]` |
| Timestamp | `[UTC]` |
| Attestation content hash | `[SHA-256 of this completed record]` |

---

#### Optional: Licensor Counter-Acknowledgment

*This block is optional and takes effect only if completed by the Licensor or a
person authorized to act for the Licensor. Its absence means nothing: the great
majority of valid declarations will never be counter-acknowledged, and absence is
not disapproval, non-recognition, or any adverse signal.*

The undersigned, for the Licensor:

**i.** Acknowledges receipt of the declaration identified above.

**ii.** Confirms that the Governing License identified, at the version and content
hash recorded, is a license the Licensor published.

**iii.** Confirms `[one of: that the Licensed Material identified is material the
Licensor has opened under that license / nothing further]`.

**iv.** Does **not** thereby: review or approve the Declarant's Work; determine or
warrant that the Declarant is in compliance with the Governing License; grant any
right beyond the Governing License; or create any affiliation, sponsorship, or
endorsement, except to the extent the Licensor states so expressly here:
`[optional express statement]`.

| Field | Value |
|---|---|
| Licensor | `[name]` |
| Acknowledged by | `[name, capacity]` |
| Timestamp | `[UTC]` |
| Content hash | `[SHA-256]` |

---

#### Governing law

This declaration is governed by the law of `[jurisdiction]`, without regard to
conflict-of-laws principles. This choice does not affect the law governing the
Governing License itself, which that license determines.

#### Construction

This declaration does not modify, supplement, interpret, or add terms to the
Governing License, and nothing in it may be construed to do so. If any provision
here is held unenforceable, it is severed and the remainder stands.

---

*End of form.*

---

## 4. Clause commentary

**Clause 1 leads for a reason.** The loudest finding in the journeys corpus is
ownership anxiety — *what happens to my stuff when the steward changes the rules
or disappears* (`docs/rights-and-legal-architecture.md` §3.3). The DMs Guild
failure mode, a creator receiving a cease-and-desist for printing their own
writing, is that fear realized. Putting retained rights first is a design
decision, not a drafting preference, and it also does real legal work: it makes
explicit the §103(b) position that a derivative author owns what they originated
and nothing more.

**Clause 2 is the OGL 1.1 clause.** The hash is the whole point. Version
designations drift, get renumbered, and get quietly rewritten in place on
webpages. A content hash of the text actually obtained is the only field here
that cannot be argued with later.

**Clause 3 is deliberately thin on substance.** It binds by reference rather than
enumerating obligations, because the obligations differ: OGL requires reproducing
the exact text of every prior copyright notice plus a full copy of the license;
ORC §III requires a location notice, an upstream attribution chain, a credit
statement, a reserved-material designation, and an expressly-designated-licensed-
material statement; Lancer requires two verbatim sentences and a third-party asset
in the front or back matter. Enumerating any of these would make the form
license-specific and defeat CC0 reuse.

**Clause 5 is where the register earns its keep.** ORC §III.b.i requires
attribution to *all upstream licensors* behind the material used, not merely the
immediate source. OGL's notice clause is worse in practice: exact prior text plus
your own, accreted, which is why OGL products carry pages of notices and why people
get them wrong. That chain is painful by hand and trivial to compute from lineage
records. The clause is drafted so the register's computed list is explicitly a
convenience and explicitly does not discharge the obligation — otherwise the
register has quietly assumed a compliance role it refuses everywhere else.

**Clause 6 is required by all three reference licenses, in three different
words.** ORC §II.d.i forbids asserting or implying connection, sponsorship,
endorsement, or official status. Lancer forbids claiming affiliation with Massif
Press or intimating that a product is official, and mandates two exact sentences.
OGL reaches the same place through its Product Identity and trademark-
compatibility restrictions. This is also where the register's own honesty lives:
the clause says registration confers no affiliation, in the declarant's own voice.

**Clause 7 is the reserved-zone clause.** Product Identity (OGL), Reserved
Material (ORC), and art-text-and-logos (Lancer) are the same structure under three
names — a fenced zone the license does not reach. The clause is written
generically so it works with any of them.

**Clause 8 exists to stop the record from reading as a certificate.** OGL
terminates automatically on uncured breach within 30 days of awareness; ORC §V.a
terminates on non-compliance with reinstatement on cure within 60 days of
discovery. A dated record of a past declaration cannot speak to present standing,
and saying so on the face of the instrument is the difference between a register
and a laundering service.

**Clause 12 is a genuine two-goods case.** Commitment 4 makes exit unconditional;
the instrument's evidentiary value depends on permanence; and the Licensor may
have relied on the record. Under conflict rule 4 the resolution is graduated
rather than absolute — public listing withdrawn and personal data minimized, the
record itself durable and marked. Neither interest is made perfectly whole. This
is the clause most likely to need rework after attorney review, and the most
likely to draw objection from a member reading it closely, which is exactly why it
is stated plainly rather than buried.

**The counter-acknowledgment block is LD 20 in legal form.** It is opt-in, it
upgrades the record from evidence-of-a-claim to a bilateral acknowledged record,
and building it now costs an unused section. Retrofitting it later into a form
published as CC0 and positioned as non-amendable would rebuild the version-drift
trap. Note also its fourth paragraph: absence of counter-acknowledgment must not
become a visible adverse state, which is the same dignity question LD 20 already
carries open (Commitments 1 and 7).

**What is deliberately absent:** any grant to the register; any moral-rights
waiver; any indemnification running to the register; any arbitration clause or
class-action waiver; any warranty by the register; any penalty-of-perjury formula
under 28 U.S.C. §1746 (considered and omitted — it would raise the stakes of an
ordinary registration, chill participation, and read as adversarial in a covenant
community); and any language capable of functioning as a status certificate.

---

## 5. Attorney-gate items

Folds into the existing Phase 5 gate (MVP_Spec LD 13; `docs/rights-and-legal-architecture.md` §9).
Numbered here so nothing is lost.

1. **What this instrument legally is.** Unilateral, made to a party who does not
   countersign. Likely evidence plus possible promissory or equitable estoppel,
   not a contract. It may be worth materially less than it appears, and the
   register's public description must match whatever the answer is. **First
   question, and the one the whole model rests on.**
2. **E-SIGN (15 U.S.C. §7001) and UETA sufficiency** of the affirmative act,
   electronic-transaction consent, attribution to the signer, record integrity,
   and retention/reproduction capability.
3. **FRE 902(11), 902(13), 902(14) posture** — the custodian certification text,
   the system process description, and whether the hash design satisfies 902(14).
4. **Identity verification design** — third-party verifier with a pass/fail token
   held by the register, versus documents held directly. Interacts with the
   personal-data non-forkability position (`docs/rights-and-legal-architecture.md`
   §1.4) and risk R10.
5. **Right to host third-party license text.** OGL grants distribution permission
   on its face; ORC is Library-of-Congress registered and reproducible; a bespoke
   publisher license is neither. A right-to-host representation is needed from any
   licensor who uploads one.
6. **Clause 12 (withdrawal)** against GDPR erasure rights and US state privacy
   laws — whether "withdrawn but durable" survives an erasure request, and on what
   basis.
7. **CC0 dedication mechanics** for a legal form, and whether a name-distinction
   request for adaptations is meaningful given CC0 imposes no conditions.
8. **eIDAS** qualified timestamp and trust-service posture, if EU participants are
   ever served.
9. **Choice-of-law** in a jurisdiction-neutral form, and its interaction with the
   Governing License's own choice of law.

---

## 6. Risk register (A1–A7)

Severity × Likelihood, 1–5 each, consistent with the framework used in
`docs/rights-and-legal-architecture.md` §7. Prefixed `A` to avoid collision with
that document's R1–R10.

| # | Risk | S×L | Level | Mitigation / status |
|---|---|---|---|---|
| A1 | Instrument is worth less than represented (not a contract; weak estoppel) | 4×3=12 | ORANGE | Never describe as more than evidence; recitals C and D drafted to match; attorney item 1 is mandatory before any public claim. |
| A2 | False originality claim registered and published (the "original Spartan" case) | 4×3=12 | ORANGE | Claim-not-truth on the face of every public entry; clause 4; provenance-dispute path distinct from content moderation; concierge review for cohort one. |
| A3 | Register read as conferring official status despite disclaimers | 4×3=12 | ORANGE | Clause 6 in the declarant's own voice; recital B; counter-acknowledgment ¶iv; public-entry face text. Residual risk is user perception, not drafting. |
| A4 | Hosting third-party license text without permission | 3×3=9 | YELLOW | Right-to-host representation at upload; OGL and ORC are safe on their face; bespoke licenses are the exposure. Attorney item 5. |
| A5 | Identity verification as a Commitment 9 access gradient | 3×4=12 | ORANGE | Reading and collecting stay unverified; verification gates attesting only. Falls hardest on those without documents or with a legal name that differs from their public one. Real and unmitigated beyond scoping. |
| A6 | Verification records as the most sensitive data held | 4×2=8 | YELLOW | Third-party verifier with pass/fail token preferred; non-forkable and non-exportable to successors per rights arch §1.4; DPA and breach posture on the Phase 5 checklist. |
| A7 | Withdrawal clause conflicts with statutory erasure rights | 3×3=9 | YELLOW | Clause 12 drafted as graduated (listing withdrawn, data minimized, record durable); attorney item 6. |

Escalation: A1, A2, A3, A5 meet the "novel legal issues" and "specialized
expertise needed" criteria for outside counsel. All fold into the existing Phase 5
gate rather than opening a new one.

---

## 7. Open decisions

Carried forward, not resolved here:

- **The register listing model.** Whether register entries are Elements (the
  founder's read, 2026-08-11) or a separate index record type. If Elements, LD 21a
  needs a third state — *listed* (visible, Collectable, not derivable) alongside
  *creator-only* and *activated* — which is a conforming amendment but an
  amendment nonetheless, and formational.
- **External Work type.** The register introduces a Work that Open Eppic does not
  host (the Amazon ebook, the convention print run, the publisher's own books).
  Needed so a licensor can satisfy the LD 7 Home Work gate without moving their
  catalogue onto the platform.
- **Provenance-dispute flow**, distinct from content moderation and from DMCA.
  "That element isn't yours" is not "that content is harmful."
- **Counter-acknowledgment absence as a visible state** — the LD 20 dignity
  question, now with a second surface.
- **Whether to adopt the register shape at all.** This is an effectuation probe.
  The cheap test is rights-holder conversations, not a build.

---

*End of draft v0.1.*
