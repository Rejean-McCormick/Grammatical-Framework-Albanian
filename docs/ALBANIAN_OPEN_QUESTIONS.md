# ALBANIAN_OPEN_QUESTIONS

## Purpose

This file tracks unresolved or partially resolved design and implementation questions for the Albanian GF concrete syntax. It is intended to prevent silent drift during coding and refactoring.

This is **not** a TODO dump. Each item should identify:
- the exact subsystem or function family,
- what is currently known,
- what is still unknown,
- what evidence should decide the issue,
- what counts as closure.

---

## Scope

Primary scope:
- `albanian/ExtendSqi.gf`
- Albanian category/lincat shapes from the core Albanian modules
- cross-module assumptions that affect `ExtendSqi`
- comparisons with model languages only where Albanian evidence is incomplete

Secondary scope:
- any Albanian module whose category shape or constructor behavior is needed to settle an `ExtendSqi` implementation question

Out of scope:
- abstract signature invention
- undocumented category redesigns copied from other languages without Albanian justification
- “works syntactically” patches that ignore category shape warnings

---

## Current Status Snapshot

### Latest live facts — run `20260918_210629`
- `PossPronRNP` remains PMCFG-confirmed as `(28,28)` under fix16.
- `SlashBareV2S` is PMCFG-confirmed as `(1,1)` under fix17.
- GF reaches the final named PMCFG declaration, then crashes during backend finalization.
- The latest run has **no `missing lock_*` warning cluster**.
- Six `no linearization` warnings remain for `Base/Cons/ConjComp` and `Base/Cons/ConjImp`; they are now the first unresolved structural family.

### What this means
The immediate repair target is the **Comp/Imp list boundary family**, not another isolated extension symbol. Its six functions must be treated as one family because they share category shape, list representation, coordination behavior, warning state, and ownership decision.

---

## Priority Levels

- **P0**: blocks compilation or strongly risks invalid type-shape fixes
- **P1**: compiles but still structurally unsafe or warning-prone
- **P2**: design/documentation debt that can cause later drift

---

## P0 — Compile-Critical Open Questions

### Q0. Does the Albanian `Comp` / `Imp` boundary family close the final PMCFG failure when implemented coherently?

**Priority:** P0 — first unresolved structural family after fix17  
**Symbols:** `BaseComp`, `ConsComp`, `ConjComp`, `BaseImp`, `ConsImp`, `ConjImp`  
**Owner candidate:** `ExtendSqiScaffolding.gf` with thin coordinator wiring

**Current compiler evidence:**
- run `20260918_210629` completes `SlashBareV2S` as `(1,1)`;
- GF completes every later named declaration through `youPolPl_Pron`;
- all six Comp/Imp linearizations are still reported missing;
- backend PMCFG finalization then crashes and no final `ExtendSqi.gfo` is produced.

**Current category evidence:**
- `Comp = {s : Str}`;
- `Imp = {s : Str}`;
- `Conj = {s : Str}`;
- `[Comp] = {init,last : Str}` and `[Imp] = {init,last : Str}` in `ExtendSqi`;
- `ConjunctionSqi` already implements the same string-list Base/Cons/Conj pattern for several Albanian categories.

**Evidence-backed fix18 hypothesis:**
- implement all six together using the native Albanian string-list pattern;
- keep exact `ListComp` / `ListImp` retyping in the coordinator to preserve category locks;
- do not alter VPS/VPI inheritance or use model-language record shapes.

**Closure criterion:**
- all six warnings disappear;
- no new lock/category warnings appear;
- record whether final `ExtendSqi.gfo` is produced;
- if PMCFG still fails after warnings disappear, reclassify the six functions as structurally repaired but not causal to the remaining backend crash.

---
### Q1. What is the final correct implementation strategy for `PredAPVP`?

**Subsystem:** AP/VP interaction

**Current state:**
- This was a historical top type-shape blocker. It is **not** the current first failure in run `20260918_153932`; keep it open as a regression/design question until the compiler reaches and validates it in the stabilized chain.
- Historical Albanian implementations flattened AP to a surface string and combined it directly with VP.
- That strategy is structurally suspect because it discards full AP shape.

**Known facts:**
- The failing pattern is category-shape related, not merely lexical.
- `PredAPVP` belongs to the AP/CN/complement cluster that repeatedly triggered AP lock warnings.
- `ExtendFunctor` suggests constructor-based composition is preferred where available.

**Unknowns:**
- Whether the final Albanian implementation should:
  1. delegate fully to inherited grammar constructors,
  2. build via a local Albanian AP constructor path,
  3. use a dedicated Albanian helper such as `SentAP` compositionally,
  4. or require a different clause-level route entirely.

**What must decide it:**
- exact `Extend.gf` signature
- actual `ExtendFunctor.gf` implementation path
- Albanian AP/Comp/Cl shapes from core modules
- whether `SentAP` is legitimate Albanian-local infrastructure or only a temporary patch

**Closure criterion:**
- compiles with no direct type error
- no `lock_AP` warning caused by `PredAPVP`
- implementation uses a category-preserving path, not AP flattening

---

### Q2. What is the final Albanian strategy for the existential family?

**Functions:**
- `ExistS`
- `ExistNPQS`
- `ExistIPQS`
- `ExistCN`
- `ExistMassCN`
- `ExistPluralCN`
- `ExistsNP`

**Subsystem:** existential constructions

**Current state:**
- Earlier implementations flattened these to surface strings.
- Run logs show structural/type mismatches for at least part of this family.
- The CN-based members also triggered category-shape warnings in earlier runs.

**Known facts:**
- These functions are not ordinary string wrappers.
- The family likely needs clause/question constructors from inherited grammar infrastructure.
- CN-based existential forms should preserve category correctness rather than stringifying `CN`.

**Unknowns:**
- whether Albanian should simply inherit all available functor/default implementations
- whether the language needs local article/indefiniteness policy for `ExistCN` / `ExistPluralCN`
- whether mass/plural existential constructions need Albanian-specific article handling beyond the functor default

**What must decide it:**
- exact `ExtendFunctor` composition for each function
- Albanian NP/Det/CN constructors from `NounSqi.gf`
- Albanian indefinite/article policy already used elsewhere

**Closure criterion:**
- no existential-family type errors
- no `lock_CN` warnings caused by existential CN members
- documented policy for mass vs count vs plural existential forms

---

### Q3. How should the AP/CN conversion cluster be finalized without lock-field drift?

**Functions:**
- `ICompAP`
- `AdjAsCN`
- `AdjAsNP`
- `CompoundAP`
- `AdvIsNPAP`
- `CompBareCN`
- `CardCNCard`
- `N2VPSlash`

**Subsystem:** AP/CN conversion and complement-building

**Current state:**
- This is the highest-warning cluster.
- Earlier implementations repeatedly used `apStr`, `cnStr`, `apConst`, or `cnConst` to stand in for full category values.
- That approach repeatedly triggered `lock_AP` / `lock_CN` warnings.

**Known facts:**
- Many of these functions either have a functor/default composition path or should be expressible through existing Albanian constructors.
- `CardCNCard` already demonstrated the danger of returning the wrong category shape.
- If these remain string-based, the file is likely to keep cycling through AP/CN type failures.

**Unknowns:**
- Which members should be fully inherited from `ExtendFunctor`
- Which members are genuinely language-specific gaps (`variants {}`)
- For each gap, which Albanian constructor chain preserves the right hidden fields and lock fields

**What must decide it:**
- `ExtendFunctor` exact defaults and gaps
- Albanian AP/CN lincat definitions and constructors from core modules
- model-language handling only where Albanian evidence is missing

**Closure criterion:**
- no `lock_AP` / `lock_CN` warnings in this cluster
- no direct AP/CN type mismatch in `ExtendSqi`
- every custom function justified in the decision log

---

### Q4. What is the final coherent strategy for the `RNP` family in Albanian?

**Functions:**
- `ReflRNP`
- `ReflPron`
- `ReflPoss`
- `PredetRNP`
- `AdvRNP`
- `AdvRVP`
- `AdvRAP`
- `ReflA2RNP`
- `PossPronRNP`
- `ConjRNP`
- `Base_rr_RNP`, `Base_nr_RNP`, `Base_rn_RNP`
- `Cons_rr_RNP`, `Cons_nr_RNP`, `Cons_rn_RNP`

**Subsystem:** reflexive/referential NP extension layer

**Current state:**
- The earliest Albanian snapshot treated this family as flat strings.
- Later repair attempts moved toward inherited `NP/ListNP` behavior.
- Current verbose run `20260918_153932` makes `PossPronRNP` the first hard PMCFG blocker in this family.
- Several RNP list/attachment functions already complete before that point, which is useful local evidence but does not by itself validate the whole family.
- Bulgarian and German both show that the whole family must be treated as one subsystem.

**Known facts:**
- This family should not be fixed member-by-member with unrelated shapes.
- The German and Bulgarian references prove that a coherent subsystem design is necessary.
- Albanian does not yet have a fully documented native `RNP` strategy.

**Unknowns:**
- whether final Albanian should inherit `NP/ListNP` semantics throughout
- whether Albanian needs a custom `RNP` record after all
- whether `AdvRVP` and `AdvRAP` require richer agreement or object-role tracking than the inherited NP strategy can safely provide

**What must decide it:**
- `ExtendFunctor` inheritance behavior
- model-language comparison, especially Bulgarian vs German
- Albanian clitic/case/agreement behavior where relevant

**Closure criterion:**
- all `RNP` functions compile under one coherent design
- no raw-string remnants remain in the family
- decision log records why inherited vs custom strategy was chosen

---

## P1 — Structural Safety Questions

### Q5. Should `SentAP`, `AdjOrd`, and `Cons_rn_RNP` exist in Albanian `ExtendSqi` at all?

**Subsystem:** local extensions vs abstract alignment

**Current state:**
- Earlier runs showed warnings that these functions are not in the abstract.
- Some of them may be local repair helpers rather than legitimate abstract-concrete correspondences.

**Known facts:**
- Unabstracted local functions are acceptable only if they are clearly local helpers and do not masquerade as abstract implementations.
- If they remain in the `lin` block as if abstract functions, they increase drift risk.

**Unknowns:**
- whether each should be:
  1. removed,
  2. renamed as `oper` helpers,
  3. retained as legal local concrete additions,
  4. or documented as deliberate Albanian-only extensions.

**Closure criterion:**
- each non-abstract symbol is explicitly classified and documented

---

### Q6. What is the long-term policy for helper functions like `apStr`, `cnStr`, `apConst`, `cnConst`, `npConst`?

**Subsystem:** implementation safety

**Current state:**
- These helpers are useful, but they are also a major source of category flattening drift.

**Known facts:**
- `npConst` is usually safe when the target really is NP-like.
- `apStr` / `cnStr` are dangerous when they are used to replace full category values.
- `apConst` / `cnConst` can be structurally incomplete if hidden fields matter.

**Unknowns:**
- which helpers should remain approved,
- which should be restricted to debugging or placeholder use,
- which should be forbidden in final implementations.

**Closure criterion:**
- explicit helper policy recorded in the implementation-pattern and anti-drift docs

---

### Q7. When should Albanian override `ExtendFunctor`, and when should it inherit unchanged?

**Subsystem:** override policy

**Current state:**
- Some current overrides appear necessary.
- Others may simply reimplement what the functor already does, but less safely.

**Known facts:**
- Constructor-based inheritance is lower-risk than string-based custom code.
- Model languages override only where their concrete syntax truly diverges or needs a richer subsystem.

**Unknowns:**
- exact threshold for Albanian-local override vs inheritance
- whether certain current overrides should be deleted entirely

**Closure criterion:**
- every remaining override classified as one of:
  - required Albanian-specific override
  - inherited by default
  - deprecated local approximation

---

## P2 — Documentation and Design Debt

### Q8. Which model language should be primary for each subsystem?

**Current state:**
- Bulgarian is often the best minimal reference for the `RNP` family.
- German is a richer but more structurally elaborate reference.

**Unknowns:**
- whether a different model language is better for AP/CN conversion
- whether any model language is close enough to Albanian existential behavior to guide the final design

**Closure criterion:**
- model-language comparison table completed in `ALBANIAN_MODEL_LANGUAGE_COMPARISON.md`

---

### Q9. Which Albanian modules are still missing extraction into the language-wide documentation set?

**Likely candidates:**
- `AdjectiveSqi.gf`
- `QuestionSqi.gf`
- `SentenceSqi.gf`
- `ConjunctionSqi.gf`
- `VerbSqi.gf`
- `RelativeSqi.gf`
- `PhraseSqi.gf`

**Unknowns:**
- whether all critical category-shape and constructor patterns have been documented yet
- whether any hidden dependency remains undocumented

**Closure criterion:**
- module dependency map and category reference both complete enough to support coding without re-auditing the whole dump

---

## Cross-Cutting Open Questions

### Q10. What should count as “done” for Albanian `ExtendSqi`?

Proposed closure standard:
- all compile errors gone
- zero `lock_AP` / `lock_CN` warnings
- no known category-shape mismatches in the active run
- no abstract-function drift
- all custom overrides documented by subsystem
- minimal test suite defined for each repaired family

**Open point:**
Should “done” also require a generation/regression test pass for representative examples?

---

### Q11. What is the official anti-drift review rule for future AI edits?

**Proposed rule:**
Any AI change to Albanian code must cite:
1. abstract signature,
2. functor/default implementation or explicit gap,
3. Albanian lincat shape,
4. Albanian or approved model-language evidence,
5. subsystem-level impact.

**Open point:**
Should this rule be mandatory for every change, or only for changes touching category shape or inheritance?

---

## Evidence Still Needed

The following source material will help close the remaining questions faster:

1. Clean source extraction for the exact relevant chunks of:
   - `Extend.gf`
   - `ExtendFunctor.gf`
   - Albanian core constructor modules
2. Explicit Albanian examples for:
   - AP as complement
   - existential clause/question behavior
   - reflexive possessive NP constructions
3. Additional model-language evidence for:
   - AP/CN conversion functions left as `variants {}` in the functor
4. A successful or near-successful compile run after each subsystem rewrite

---

## Closure Workflow

For each open question, use this sequence:

1. confirm exact abstract signature
2. inspect `ExtendFunctor` for default vs `variants {}`
3. inspect Albanian lincat and constructor source files
4. inspect the approved model language for the same subsystem
5. implement the smallest category-correct Albanian solution
6. compile
7. record the decision in `ALBANIAN_DECISION_LOG.md`
8. remove the item from this file only after closure criteria are met

---

## Initial Triage Order

Recommended order for closing questions:

1. `PredAPVP`
2. existential family
3. AP/CN conversion cluster
4. `RNP` family finalization
5. non-abstract local symbol cleanup
6. helper-policy cleanup
7. model-language mapping completion

---

## Change Log for This File

### Initial version
- seeded from Albanian codedump
- aligned with current `ExtendSqi` debugging history
- aligned with latest run evidence showing AP/CN and existential structural issues as the main remaining risk
