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

### Latest live facts — Global Scan `20260921_201720`
- FIX22C remains the last known compiler-stable historical baseline.
- Candidate (11) was validated with GF 3.12 in Wordbench Diagnostic / Global Scan.
- Wordbench included 47 targets: **27 PASS, 20 FAIL, 0 ERROR, 0 TIMEOUT**.
- ALB-DEC-046 is empirically supported for the clitic boundary: the former `CProj "cl"` PMCFG family disappeared.
- The dominant remaining PMCFG family descends through `CProj "Indicative" (CProj "v" ...)`, reached by the old `subjunctiveFinite` path that inferred subjunctive morphology from present-indicative surface strings.
- One independent overload failure remains in the run evidence: `LexiconSqi.distance_N3` calls an ambiguous one-argument `mkPrep`.
- Candidate (12) moves finite subjunctive morphology into `ResSqi.Verb.Subjunctive`, copies the full currently represented verbal form inventory into `VP`/`VPSlash`, removes `VP.v`, and makes `subjunctiveFinite` a selector only.
- Candidate (12) also gives `distance_N3` explicit case-governed two-argument prepositions.
- Candidate (12) static gate over the full current **52-file** source census: **0 findings, 0 scan exceptions**; `gf_morphosqi_lint.py`: **0 findings**.
- The current census is 48 language-folder modules plus four parent API facades. The latest automatic Wordbench run covered only 47, so five targets still require automatic-discovery support or explicit supplemental compilation.
- Scenarios seen: 0.

### Immediate unresolved questions

**Q-LIVE-1 — Explicit subjunctive / Verb→VP PMCFG acceptance (P0).** Does candidate (12) eliminate the repeated `CProj "Indicative" (CProj "v" ...)` GeneratePMCFG crash without introducing missing-field/type regressions in `MorphoSqi`, `ParadigmsSqi`, `IrregSqi`, `VerbSqi`, or their importers? Closure requires a GF 3.12 rerun on the exact candidate.

**Q-LIVE-2 — Lexicon typed-government closure (P0).** Does the explicit `mkPrep "nga" R.Ablat` / `mkPrep "deri në" R.Acc` repair clear `distance_N3` and its importers? Closure requires compilation; static overload readability alone is insufficient.

**Q-LIVE-3 — Complete compile census (P0).** The current target is 52 GF files. Closure requires recorded GF results for all 48 language-folder modules plus `SyntaxSqi`, `ConstructorsSqi`, `SymbolicSqi`, and `TrySqi`; automatic Global Scan coverage must not be mistaken for the full census when it includes only 47.

**Q-LIVE-4 — Behavioral adequacy of generated subjunctive tables (P1 after compiler recovery).** The candidate preserves the existing Albanian derivation rules but moves them to morphology construction time. After compilation is green, confirm those rules against Albanian reference evidence and reviewed scenarios; compiler acceptance alone does not establish linguistic correctness.

**Q-LIVE-5 — VPS/VPI ownership after compiler recovery (P1).** Local companion ownership is provisional. Closure requires clean GF/PMCFG validation plus Albanian scenario evidence, then a family-wide architecture decision consistent with the current lincats and `ExtendFunctor` coverage.

The older fix17/fix18 Comp/Imp/PMCFG questions below are retained as historical design context. They are **not the current priority order** and must not override current compiler evidence.

---

## Priority Levels

- **P0**: blocks compilation or strongly risks invalid type-shape fixes
- **P1**: compiles but still structurally unsafe or warning-prone
- **P2**: design/documentation debt that can cause later drift

---

## Historical / deferred questions from the pre-FIX22C repair cycle

The numbered questions in this section remain useful architectural context where still unresolved, but their old priority labels are superseded by Q-LIVE-1 through Q-LIVE-5 above.

### Former P0 — Compile-Critical Open Questions

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

### Q8. Which model-language patterns are useful for each subsystem?

**Current state:**
- model languages are supporting engineering evidence, never primary linguistic authority;
- the supplied corpus has now been summarized in `ALBANIAN_MODEL_LANGUAGE_COMPARISON.md`;
- Bulgarian can be a useful minimal structural reference for some RNP work, while German can expose richer alternatives.

**Unknowns:**
- which compatible structural patterns are useful for AP/CN conversion, existentials, and other families after exact Albanian types are known;
- whether a candidate pattern preserves all information required by Albanian consumers.

**Closure criterion:**
- every borrowed pattern has an explicit Albanian type/ownership rationale and targeted validation; no subsystem design depends on choosing a model language as linguistic authority.

---

### Q9. Is any additional documentation extraction required for safe implementation?

**Current state:**
- the active bundle intentionally relies on current source + compiler for exact category/constructor facts rather than requiring a separate extraction document for every module;
- missing historical helper/category extraction documents are not implicit authority.

**Unknowns:**
- whether a recurring implementation question cannot be answered efficiently from the current source, ledger, plan, and tests;
- whether that recurring evidence would justify a new focused support document.

**Closure criterion:**
- create a new extraction/reference document only for repeated, high-value evidence that cannot be kept reliably in the existing normative docs; do not recreate broad inventories merely to satisfy an old document list.

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

**Resolved rule:**
Yes. “Done” requires representative generation/regression scenarios with Albanian-reviewed expected outputs in addition to compiler/structural success. A release with `Scenarios seen: 0` is not linguistically complete.

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
