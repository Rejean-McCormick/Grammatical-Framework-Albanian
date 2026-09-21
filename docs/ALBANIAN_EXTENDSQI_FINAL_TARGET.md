# ALBANIAN_EXTENDSQI_FINAL_TARGET

> **Current execution note (2026-09-21):** this is an Extend/architecture reference, not the current first repair gate. The post-FIX22C mega-update is presently blocked by lower-level GF syntax integrity; follow `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md` and `CURRENT_REPAIR_STATE.md` before applying this document tactically.


This file defines the stable target architecture, **not the current blocker**. For the latest Wordbench run, warnings, and next evidence gate, see `CURRENT_REPAIR_STATE.md`.

## Status
Target architecture for the Albanian `Extend` layer. The thin-coordinator rule is approved; final VPS/VPI family ownership is evidence-driven and currently provisional after the mega-update.

This document defines the final intended role of `GF/lib/src/albanian/ExtendSqi.gf` and the subsystem ownership rules that all companion modules must follow.

---

## 1. Purpose

The purpose of this document is to freeze the target architecture of the Albanian `Extend` layer before further implementation work.

The guiding principle for this cycle is:

- `ExtendSqi.gf` is a **thin coordinator**.
- Companion modules hold Albanian-specific implementation logic.
- Families stay inherited when the inherited implementation is category-correct and behaviorally sufficient; a family may become local only through an explicit family-wide decision and a companion owner.
- Every local override must be justified by Albanian-specific evidence and must preserve the correct concrete category shape.

This document is the subsystem target for `ExtendSqi`-related edits. Operational order is controlled by `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`, and the total final-state contract in `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` prevails if an older cycle-specific rule conflicts.

---

## 2. Final target for `GF/lib/src/albanian/ExtendSqi.gf`

`ExtendSqi.gf` must be a **thin wiring layer only**.

It must contain:

- the concrete header and `Grammar = GrammarSqi` binding
- the canonical subsystem imports
- the subtraction list for supported local Albanian overrides only
- the `lin` renamings that connect abstract `Extend` functions to subsystem implementations

It must not contain:

- local VPS/VPI/VPS2/VPI2 or VP-series-list implementation logic directly in the coordinator; if local ownership is justified, the family belongs in a dedicated companion module
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
- `GF/lib/src/albanian/ExtendSqiVPS.gf` — **conditional final owner only if local VPS/VPI ownership is accepted after validation**

### 3.3 VPS-family decision

The older cycle rule that the entire VPS/VPI/VPS2/VPI2/list-wrapper family must remain inherited is **superseded as an unconditional target rule**.

Current source fact after the mega-update:

- `ExtendSqi.gf` subtracts `VPS`, `VPI`, `VPS2`, `VPI2`, their list categories, and the associated constructors from `ExtendFunctor`;
- it declares richer Albanian lincats locally;
- it locally implements the family in the coordinator;
- its header comments still claim the family is inherited, so the current source is internally inconsistent and not yet accepted architecture.

Final target decision rule:

1. **inherit** the whole family if `ExtendFunctor` is category-correct, behaviorally sufficient, and provides the required coverage; or
2. **localize** the whole family if Albanian requires richer agreement, complement, clitic, or embedded-verbal structure that inheritance cannot provide.

If local ownership is accepted, create/use a dedicated companion owner such as `ExtendSqiVPS.gf` (the name used by the total completion plan) and keep `ExtendSqi.gf` to boundary lincats and wiring only. Do not keep substantive VPS/VPI realization logic in the coordinator.

The current mega-update is a **provisional implementation experiment**, not proof that localization is final or linguistically correct. It must first pass syntax integrity, compilation/PMCFG, and targeted Albanian scenarios.

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

## 7. Inheritance/localization decision boundary

The following family is no longer pre-declared as inherited for all future work:

- VPS / ListVPS;
- VPI / ListVPI;
- VPS2 / ListVPS2;
- VPI2 / ListVPI2;
- associated Base/Cons/Conj/Mk/Compl/Pred/Quest/Rel/Refl operations.

It must be handled as **one coherent family**. Mixed ownership is forbidden except for documented boundary adapters. The accepted final state is either:

- coherent inheritance from `ExtendFunctor`, or
- coherent Albanian local ownership in a companion module with the coordinator remaining thin.

Current coordinator-local implementation is not an accepted third architecture.

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

Each of these is completed and validated as a family.

---

## 9. Acceptance criteria for this cycle

The Albanian `Extend` layer is considered correct for this cycle only when all of the following are true:

1. `ExtendSqi.gf` remains a thin coordinator.
2. `ExtendSqiScaffolding.gf` is contract-correct.
3. VPS/VPI/VPS2/VPI2 has one coherent accepted owner: inherited or a dedicated Albanian companion; substantive family logic is not left in the coordinator.
4. Every local override is owned by the correct subsystem file.
5. No accidental category flattening has been introduced.
6. The full Albanian extension layer compiles cleanly.
7. No new lock warnings are introduced by the extension layer.
8. Final public-surface validation through `GrammarSqi` and `SyntaxSqi` passes.

---

## 10. Operational order

This subsystem document no longer carries a fixed whole-project patch order. Follow `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`.

Within `Extend`, once the global compiler gate is green:

1. verify category/contract prerequisites;
2. decide VPS-family ownership as a family;
3. keep `ExtendSqi.gf` thin;
4. repair/validate companion families;
5. compile `ExtendSqi`;
6. validate through `GrammarSqi`, `LangSqi`, `AllSqi`, `SyntaxSqi`, and the other public facades;
7. run targeted linguistic scenarios.

---

## 11. Anti-drift rules

The following are prohibited during this cycle:

- placing or retaining substantive VPS/VPI/VPS2/VPI2 or VP-series-list realization logic directly in the coordinator
- moving subsystem logic into `ExtendSqi.gf`
- fixing one function in a family while leaving the rest structurally inconsistent
- flattening rich Albanian categories to strings for convenience
- using coordinator-level hacks instead of subsystem fixes
- treating stale run logs as more authoritative than the current codedump

---

## 12. Reference set

This target document is aligned to the active bundle, especially:

- `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`;
- `CURRENT_REPAIR_STATE.md`;
- `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`;
- `ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md`;
- `ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md`;
- `ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`;
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md`;
- `ALBANIAN_MODEL_LANGUAGE_COMPARISON.md` for supporting engineering comparison only.

---

## 13. Immediate next evidence gate

This target and the override matrix already exist. The next deliverable is **not another architecture document**. Follow the recovery sequence:

1. restore syntax integrity and the compiler baseline;
2. rerun the full compile census including public facades;
3. then resolve the VPS-family ownership question from current typed/compiler evidence;
4. update this target/matrix only if that evidence changes the accepted final owner.

