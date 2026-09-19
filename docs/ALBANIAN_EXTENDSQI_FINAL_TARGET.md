# ALBANIAN_EXTENDSQI_FINAL_TARGET

This file defines the stable target architecture, **not the current blocker**. For the latest Wordbench run, warnings, and next evidence gate, see `CURRENT_REPAIR_STATE.md`.

## Status
Approved coordinator architecture for the Albanian RGL Completion phase.

The thin-coordinator rule remains stable. The former cycle-specific rule that VPS/VPI/VPS2/VPI2 must remain inherited has been superseded for post-v0.1.0 Completion by `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`.

This document defines the intended role of `GF/lib/src/albanian/ExtendSqi.gf` and the subsystem ownership rules that all companion modules must follow.

---

## 1. Purpose

The purpose of this document is to keep the target architecture of the Albanian `Extend` layer stable while functional coverage expands.

The guiding principles for the Completion phase are:

- `ExtendSqi.gf` is a **thin coordinator**.
- Companion modules hold Albanian-specific implementation logic.
- Families stay inherited until Albanian evidence justifies coherent local ownership.
- A family may move from inheritance to a dedicated Albanian subsystem when its final category/realization contract is compatible with `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` and the live acceptance evidence recorded in `CURRENT_REPAIR_STATE.md` supports ownership transfer.
- Every local override must preserve the correct concrete category shape and must be backed by behavior tests.

This document governs coordinator structure; the expansion plan governs completion order and VPS/VPI architecture.

---

## 2. Final target for `GF/lib/src/albanian/ExtendSqi.gf`

`ExtendSqi.gf` must be a **thin wiring layer only**.

It must contain:

- the concrete header and `Grammar = GrammarSqi` binding
- the canonical subsystem imports
- the subtraction list for supported local Albanian overrides only
- the `lin` renamings that connect abstract `Extend` functions to subsystem implementations

It must not contain:

- local VPS/VPI/VPS2/VPI2 implementation machinery directly in the coordinator; coherent family logic belongs in a dedicated subsystem if local ownership is activated
- local coordinator-side helper definitions
- generic repair code
- drifted or experimental logic that belongs in a subsystem module
- overflow implementations that should live in core Albanian modules

---

## 3. Fixed architecture decisions for this cycle

### 3.1 Coordinator rule

`ExtendSqi.gf` remains thin and declarative.

### 3.2 Companion module set

The canonical Albanian `Extend` companion modules for this cycle are:

- `GF/lib/src/albanian/ExtendSqiScaffolding.gf`
- `GF/lib/src/albanian/ExtendSqiExistential.gf`
- `GF/lib/src/albanian/ExtendSqiAPCN.gf`
- `GF/lib/src/albanian/ExtendSqiFocusPrep.gf`
- `GF/lib/src/albanian/ExtendSqiVPBridge.gf`
- `GF/lib/src/albanian/ExtendSqiRNP.gf`
- `GF/lib/src/albanian/ExtendSqiLexicon.gf`
- `GF/lib/src/albanian/ExtendSqiHelpers.gf`

Conditional Completion module:

- `GF/lib/src/albanian/ExtendSqiVPS.gf` — create only when coherent local VPS/VPI ownership is activated after the Architecture Gate

### 3.3 VPS-family decision

The stabilization-cycle prohibition on local VPS/VPI ownership is superseded.

For the Completion phase:

- the family may remain inherited while its contract is unresolved;
- `(0,0)` inherited members remain explicitly incomplete;
- local ownership may be activated only for the family as a coherent subsystem;
- isolated one-function overrides remain prohibited;
- `ExtendSqi.gf` remains wiring-only;
- any required core verbal realization machinery belongs in core resource/syntax modules, not in the coordinator.

The preferred local owner, if activated, is `ExtendSqiVPS.gf`.

### 3.4 Contract-side rule

Boundary-facing helpers must align with the `Extend` / `ExtendFunctor` / `CommonX` contract, not with ad hoc local shapes.

### 3.5 Category-shape rule

Do not flatten rich Albanian categories to `Str` unless the current Albanian lincat is already string-shaped.

### 3.6 Family-coherence rule

Subsystems are implemented and reviewed family-by-family, not one isolated function at a time.

---

## 4. Final role of each subsystem

### 4.1 `ExtendSqiScaffolding.gf`

Role:

- boundary-safe helpers
- contract alignment helpers
- small Albanian glue operations that do not belong in richer subsystem modules

Responsibilities include:

- `GenNP`, `GenIP`, `GenRP`, `GenModNP`, `GenModIP`
- pied-piping/stranding shell helpers
- basic utterance and complement wrappers
- boundary-facing tense/polarity/anteriority helpers
- gerund wrappers
- small NP/CN/Comp helpers

This subsystem is the first stabilization target and must remain contract-correct.

### 4.2 `ExtendSqiVPBridge.gf`

Role:

- participial/AP/VP bridging
- VPSlash-derived bridges
- VP-to-Adv/AP conversion helpers in the Albanian extension layer

### 4.3 `ExtendSqiAPCN.gf`

Role:

- AP/CN/NP conversion family
- category-preserving adjectival and nominal bridge helpers

### 4.4 `ExtendSqiExistential.gf`

Role:

- existential family only
- all existential variants implemented coherently as one subsystem

### 4.5 `ExtendSqiRNP.gf`

Role:

- reflexive NP family
- reflexive/possessive/RNP coordination family
- AP/VP attachment helpers that are specifically part of the RNP family

### 4.6 `ExtendSqiFocusPrep.gf`

Role:

- focus family
- focused prep-related extension behavior only

### 4.7 `ExtendSqiLexicon.gf`

Role:

- extension-specific lexical tail only
- no structural repair logic

### 4.8 `ExtendSqiHelpers.gf`

Role:

- local helper constructors and reusable internal support for the above modules
- not a second coordinator

---

## 5. Final ownership map

### Owned by `ExtendSqi.gf`

Only:

- subsystem imports
- subtraction list
- subsystem renamings

### Owned by `ExtendSqiScaffolding.gf`

Only:

- boundary-safe glue helpers
- tense/polarity/anteriority contract-safe wrappers
- gerund and small shell wrappers

### Owned by `ExtendSqiVPBridge.gf`

Only:

- VP/VPSlash/AP/Adv bridge family

### Owned by `ExtendSqiAPCN.gf`

Only:

- AP/CN/NP conversion family

### Owned by `ExtendSqiExistential.gf`

Only:

- existential family

### Owned by `ExtendSqiRNP.gf`

Only:

- reflexive NP / RNP family

### Owned by `ExtendSqiFocusPrep.gf`

Only:

- focus/preposition extension behavior

### Owned by `ExtendSqiLexicon.gf`

Only:

- extension-specific lexical entries and lexical wrappers

### Conditionally owned by `ExtendSqiVPS.gf`

Only after the Completion Architecture Gate:

- coherent `VPS` / `VPI` / `VPS2` / `VPI2` extension-family realization;
- their list/coordination constructors;
- extension-level saturation/bridging logic that belongs to this family.

It must not duplicate core Albanian `VP`/`Cl` realization machinery.

---

## 6. Final override policy for this cycle

A function belongs in local Albanian `Extend` code only when all of the following are true:

1. The abstract `Extend` function is present and understood.
2. The `ExtendFunctor` default path is inspected.
3. The Albanian category shape is confirmed in the current codedump.
4. The override has a specific Albanian reason.
5. The implementation preserves the correct concrete category shape.

Otherwise, the function remains inherited.

This cycle applies that rule strictly.

---

## 7. VPS/VPI family transition policy

The VPS/VPI/VPS2/VPI2 family was intentionally inherited during compiler stabilization. That historical decision remains valid for the v0.1.0 cycle but is no longer a permanent Completion constraint.

Current policy:

- keep the family inherited until the Architecture Gate establishes the Albanian contract;
- treat inherited `variants {}` / `(0,0)` members as visible completion gaps;
- when local ownership is activated, move the family coherently to `ExtendSqiVPS.gf`;
- do not reintroduce isolated members in `ExtendSqi.gf`;
- preserve core-vs-extension ownership: general verbal realization stays in core modules, while the `Extend` API family stays in the extension subsystem.

The completed-family contract is defined in `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`. Any current transition/gate sequence belongs in `CURRENT_REPAIR_STATE.md` and the testing specification.

---

## 8. Explicit local Albanian subsystem families

The following are local Albanian subsystem families for this cycle:

- scaffolding family
- existential family
- AP/CN family
- focus/prep family
- VP bridge family
- RNP family
- lexical tail
- VPS/VPI family, conditionally, once its coherent local ownership is activated

Each locally owned subsystem is completed and validated as a family.

---

## 9. Acceptance criteria for the Completion phase

The Albanian `Extend` layer is considered architecturally correct only when all of the following are true:

1. `ExtendSqi.gf` remains a thin coordinator.
2. Every local override is owned by the correct subsystem file.
3. No one-off VPS/VPI/VPS2/VPI2 family drift is present.
4. Any locally owned VPS-family implementation is coherent and backed by the Architecture Gate.
5. No accidental category flattening has been introduced.
6. Any core reopening is justified by a behavior test showing information loss at that boundary.
7. The full Albanian extension layer compiles cleanly.
8. No unexplained new lock/shape warning is introduced.
9. `ExtendSqi`, `LangSqi`, and `AllSqi` regressions pass.
10. Linguistic completion claims are supported by registered Wordbench scenarios and reviewed outputs.

---

## 10. Current implementation order

The Completion phase uses capability gates rather than the old compiler-repair sequence:

1. Wordbench Architecture Gate scenarios (`vps_agreement`, `vps_temp_pol`);
2. minimal verbal realization kernel where the tests prove information loss;
3. finite VPS slice (`MkVPS`, `PredVPS`, lists/coordination);
4. VPS question/relative integration;
5. VPI + representative `VV` embedding/control;
6. structured slash/clitic preservation;
7. VPS2/VPI2 saturation and coordination;
8. `ExtendSqi` → `LangSqi` → `AllSqi` regression;
9. reviewed goldens and family release gate;
10. remaining Structural/Construction/Irreg completion.

See `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` for the normative final-state contract; use `CURRENT_REPAIR_STATE.md` for the current gate/cursor.

---

## 11. Anti-drift rules

The following are prohibited during the Completion phase:

- reintroducing VPS/VPI/VPS2/VPI2 implementation logic directly in the coordinator
- reintroducing only a subset of the VPS/VPI family without a coherent ownership decision
- moving subsystem logic into `ExtendSqi.gf`
- fixing one function in a family while leaving the rest structurally inconsistent
- flattening rich Albanian categories to strings for convenience
- using coordinator-level hacks instead of subsystem fixes
- treating stale run logs as more authoritative than the current codedump

---

## 12. Reference set

This target document is aligned to the current Albanian source dump and the Albanian architecture docs, especially:

- future `ExtendSqi` structure
- override and inheritance policy
- module dependency map
- implementation pattern catalog
- high-priority watchlist
- forbidden patterns and anti-drift rules

---

## 13. Immediate next deliverable

The immediate deliverable is:

```text
WP1 — Verbal Realization Architecture Gate
```

It consists of a producer/consumer map plus the first two Wordbench behavior scenarios:

```text
vps_agreement
vps_temp_pol
```

No full 24-function VPS/VPI implementation should precede this gate.

The normative final-state specification is `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`; the current work package is tracked in `CURRENT_REPAIR_STATE.md`.
