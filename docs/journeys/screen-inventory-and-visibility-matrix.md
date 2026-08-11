# Screen Inventory & Visibility Matrix — Draft

**Status:** canonical (v1.0, committed 2026-08-11 at the close of the Phase 0
journeys assessment). Superseded working-draft status. Dual-purpose:
input to later wireframe/design work, and input
to Phase 1 RLS policy design (the methodology's "design RLS before UI, treat
every table as public-by-accident").

**Derived from:** the Stage 2 in-platform loop pathways (screens follow loops,
not the schema). Visibility decisions ratified in MVP_Spec LD 21 and
transparency log entry 2026-08-11-participation-surface.

**Roles:** Anon (anonymous visitor) · Reader (reader-member of a Space) ·
Sub (sub-creator-member) · Owner (Space owner) · Admin (platform /
Public-Domain administrative account).

---

## 1. Screen inventory

### Launch-core (Phases 1–3)

| # | Screen | Origin loop | Primary action |
|---|---|---|---|
| 1 | Space landing | Reader discover; Sub arrive | Enter / request access |
| 2 | Space create & settings | Owner establish | Configure Space; **disclose active permission set** (rights arch §3.5) |
| 3 | Brand create/edit | Owner establish | Define a Brand within one Category (LD 4) |
| 4 | **Element editor** | tend-canon, derive-and-build, become-originator | Create/edit an Element. Typing-lag gate (LD 8, D3). Light point-of-creation reminder (D6) |
| 5 | Element view | all | Read; see lineage + endorsement state; anchor for Ph4 discussion |
| 6 | Canon registry / Brand browser | Reader legibility; Sub orientation | Browse a world's structured contents |
| 7 | Activation confirmation | Owner/Sub establish | Consent moment (LD 7): discloses non-selective opening + prospective-only withdrawal |
| 8 | Derivation assent | derive-and-build | Retained-rights-first summary + version-stamped clickwrap (rights arch §3.3) |
| 9 | Collection build | Sub/Owner publish | Flat/filterable → ordered/hierarchical |
| 10 | Publish-to-Work | Sub/Owner publish | The only publish target |
| 11 | Following mgmt + update surface | Reader core | Follow; see "a Work you follow updated" |
| 12 | Profile / self-manage | all members | Edit profile, manage follows |
| 13 | Export / exit | all members | Self-serve export (rights arch §1.4) — first-class |
| 14 | Invite / request-access | admit-members; cross-into-creating | Owner invites; member requests (D2) |
| 15 | Endorsement action | Owner endorse | Owner-authenticated write (D1); server-side |
| 16 | First-run / welcome | arrive | Hospitality beat (Part IV); reader-tier & creator-tier formation (D6) |
| 17 | Report button/flow | governance | Button on every Element from launch (LD 14); flow completes Ph4 |

### Phase 4 additions

| # | Screen | Origin loop | Primary action |
|---|---|---|---|
| 18 | Discussion thread | Discuss/Participate (D4) | Post on an Element/Work, Space-scoped |
| 19 | Moderation surfaces | governance | Action, appeal, public-reasoning display, victim-side workflow |
| 20 | Transparency log public view | accountability | Read public outcomes + monthly report (Ph5 reachability) |

---

## 2. Visibility matrix

Cell legend: **V** = view · **E** = view + edit/act · **—** = hidden ·
**C** = count/existence only (not contents) · **own** = only for own records.

### Launch-core

| Screen / data | Anon | Reader | Sub | Owner | Admin |
|---|---|---|---|---|---|
| 1 Space landing (public face) | V | V | V | E | V |
| 2 Space settings | — | — | — | E | V |
| 2 Active permission set | V | V | V | E | V |
| 3 Brand | V | V | V | E(own) | V |
| 4 Element editor | — | — | E(own) | E(own) | — |
| 5 Element view — activated | V | V | V | V | V |
| 5 Element — pre-activation (D7) | — | — | V(own) | V(own) | V |
| 5 Lineage stamp | V | V | V | V | V |
| 5 Endorsement state | V | V | V | E(own Brand) | V |
| 6 Canon registry (activated) | V | V | V | V | V |
| 7 Activation confirmation | — | — | E(own) | E(own) | — |
| 8 Derivation assent record | — | V(own) | V(own) | V(own + all derivations of own Elements) | V |
| 9 Collection (public) | V | V | V | V | V |
| 9 Collection — edit/organize | — | E(own, flat only) | E(own) | E(own) | V |
| 10 Draft/unpublished Work (D7) | — | — | V(own) | V(own) | V |
| 10 Published Work | V | V | V | V | V |
| 11 Following — who I follow | — | V(own) | V(own) | V(own) | V |
| 11 Follower identity | — | — | — | — | V |
| 11 Follower **count** | V | V | V | V | V |
| 12 Profile (public fields) | V | V | V | V | V |
| 13 Export / own account data | — | E(own) | E(own) | E(own) | V |
| 14 Request-access — requester id | — | — | — | V | V |
| 14 Invite (issue) | — | — | — | E | V |
| 15 Endorsement action | — | — | — | E(own Brand) | V |
| 16 First-run/welcome | — | V(own) | V(own) | V(own) | — |
| 17 Report button | — | E | E | E | V |

### Phase 4

| Screen / data | Anon | Reader | Sub | Owner | Admin |
|---|---|---|---|---|---|
| 18 Discussion contents | — | V(Space) | V(Space) | V(Space) | V |
| 18 Discussion **count** | C | V | V | V | V |
| 19 public_reasoning | V | V | V | V | V |
| 19 private_notes | — | — | — | — | E(acting) |
| 19 Appeal (own case) | — | V(own) | V(own) | V(own) | E |
| 19 Victim-side workflow | — | V(own) | V(own) | V(own) | E |
| 20 Public outcomes + monthly report | V | V | V | V | V |

---

## 3. Notes feeding Phase 1 RLS

- **Participation invariant (MVP_Spec LD 21a):** visibility affords
  participation. Every visible Element is **at minimum Collectable**; the two
  states (creator-only / visible) are the only legal ones, and there is no
  visible-but-inert state. Derivability is a **narrower and computed** fact,
  not a synonym for visibility: per LD 6 a derivative is visible and
  Collectable while permanently closed to further derivation. RLS and the read
  surface must express these as two distinct predicates — never bind a Derive
  affordance to visibility or to an `is_active` flag.
- **D8 tiering:** Collect (reader, flat/unordered) is ungated; Organize
  (ordered/hierarchical) and Derive are creator-gated. RLS/authz must gate the
  *organize* write path and the *derive* write path behind creator status,
  while leaving the *collect* (flat add) write open to readers. The gate is the
  flat→ordered boundary (LD 11).
- **Derivation-assent records** are visible to the original Element's owner (all
  derivations of their Elements), not only to the deriving member — the grant is
  between them, and this feeds the endorse loop.
- **Follower identity** is never exposed by any policy; only an aggregate count
  is. Consistent with the moderation schema's refusal of correlatable tokens.
- **private_notes** is excluded at the view/RLS layer, not application code
  (moderation schema invariant 2). Only the acting moderator/admin row-path
  reads it.
- **Pre-activation / draft** rows are owner/creator-scoped SELECT; the
  public-by-accident test applies hardest here.
- **Request-access** exposes requester identity to the Space owner only — a
  scoped, consent-based exception to the otherwise-private identity posture.
- **Discussion** SELECT is gated on Space membership; anonymous path returns
  count only.

---

## 4. Open (Stage 3 → later stages)

- **Q4** Endorsement absence: is "not endorsed" distinct from "not yet
  endorsed" as a visible state? C1/C7 dignity question. Screen-spec (Stage 4)
  decision; affects screen 5's endorsement cell.
- Admin/Public-Domain account's exact powers over others' Elements (screen 5,
  Admin column shown V; edit/act scope is a governance-design question, Ph4).
- **RESOLVED:** Collections are public. Flat Collections (reader Collect tier)
  are personal but publicly viewable, Pinterest-style; others can see a
  member's Collections. Organize/edit is gated per D8.
- Compilation-Work lineage (from D8): a Work published from a Collection of
  collected Elements — its selection/arrangement copyright vs. the retained
  owners of collected Elements. Open rights-architecture item (LD 6/13),
  arises only at Publish (creator-gated).

