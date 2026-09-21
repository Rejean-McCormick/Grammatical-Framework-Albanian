# ALBANIAN_DECISION_LOG.md

Status: working authoritative log  
Scope: Albanian GF concrete syntax, with emphasis on `lib/src/albanian/*` and especially `ExtendSqi.gf` when override decisions affect cross-module assumptions.

## Purpose

This file records implementation decisions that have already been made, decisions that were tested and rejected, and decisions that remain provisional. It exists to prevent drift across repair sessions and to stop future edits from re-opening settled design questions without explicit evidence.

This log is authoritative for **settled Albanian implementation decisions**, but it does not replace:

- abstract signatures,
- `ExtendFunctor` inheritance/default composition,
- the current Albanian codedump,
- current compiler reality,
- or the dedicated operational control files that now carry large inventories and matrices.

It complements those sources by recording what has already been learned from them.

## Companion control documents

This log is intentionally concise compared with the larger operational files. For the **active bundle**, read it together with:

- `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`
- `CURRENT_REPAIR_STATE.md`
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md`
- `ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md`
- `ALBANIAN_EXTENDSQI_FINAL_TARGET.md`
- `ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md`
- `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`
- `ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`
- `ALBANIAN_OPEN_QUESTIONS.md`

Older decisions below may cite companion documents from earlier documentation sets that are **not present in this bundle**. Those citations are historical provenance only; they are not prerequisites for current work.

The principle is:

- the **decision log** records short authoritative lessons,
- the **rule docs** record operational detail,
- the **registry/matrix/ledger/tracker docs** record inventories and fragile live facts,
- and the **codedump + compiler** remain authoritative for what actually compiles now.

## How to use this log

Each entry contains:

- **ID**: stable identifier.
- **Status**: `accepted`, `provisional`, `superseded`, `rejected`, or `open`.
- **Area**: subsystem or file group.
- **Decision**: the chosen rule.
- **Why**: technical rationale.
- **Evidence**: files that support the decision.
- **Implications**: what code should do next.
- **Do not**: anti-regression note.

Use the log in this order:

1. read the exact abstract signature,
2. check the current codedump and current compile behavior,
3. check `ExtendFunctor` or the relevant inherited constructor path,
4. check the relevant Albanian core modules,
5. check the relevant support/control documents if the issue is about helpers, shallow categories, fragile symbols, stale comments, or module documentation coverage,
6. then use this log to avoid re-opening already settled questions.

## Entry format reference

### ID
Short machine-readable key.

### Status
- `accepted`: current working rule.
- `provisional`: strong current rule, but still subject to compile confirmation.
- `superseded`: historically important, no longer current.
- `rejected`: explicitly ruled out.
- `open`: unresolved question, documented here for continuity.

---

# Decisions

## ALB-DEC-001
**Status:** accepted  
**Area:** global methodology  
**Decision:** Resolve implementation questions by exact abstract signature and module context, not by function name or surface intuition.

**Why:** Several repair failures came from assuming a function returned one category because its surface behavior looked similar to another. The most important example was `PrepCN`, which was initially treated as if it returned a noun-like value rather than its actual abstract result category.

**Evidence:**
- `Extend.gf`
- `ExtendFunctor.gf`
- `GFCodex.txt`

**Implications:**
- Every override must start with abstract type.
- Then check inherited functor behavior.
- Then check Albanian lincat shape.
- Only after that compare model languages.

**Do not:**
- Choose implementation shape from the function name alone.
- Copy a German/Bulgarian implementation just because the function names match.

---

## ALB-DEC-002
**Status:** accepted  
**Area:** source hierarchy  
**Decision:** Use the following order of authority.

1. `abstract/Extend.gf` and other abstract signatures.
2. `common/ExtendFunctor.gf` and inherited constructor composition.
3. Albanian core modules (`CatSqi.gf`, `NounSqi.gf`, `AdjectiveSqi.gf`, `AdverbSqi.gf`, `ResSqi.gf`, `SyntaxSqi.gf`, `SentenceSqi.gf`, `QuestionSqi.gf`, `ConjunctionSqi.gf`, etc.).
4. Model languages.
5. Local repair decisions in this log.

**Why:** The Albanian repair work repeatedly showed that the safest fixes come from abstract signatures + inherited functor structure + Albanian local category shape. Model languages are useful only after those three are fixed.

**Evidence:**
- `Extend.gf`
- `ExtendFunctor.gf`
- `AlbanianGF_codedump.txt`
- `Bulgarian.txt`
- `GermanGF_Codedump.txt`

**Implications:**
- Model languages are secondary references.
- Local approximations must cite higher-order evidence.

**Do not:**
- Treat model-language code as primary truth.

---

## ALB-DEC-003
**Status:** accepted  
**Area:** category-shape policy  
**Decision:** Preserve full target-category shape. Do not flatten AP/CN/NP/Cl-like categories to `{s : Str}` unless the target category is actually string-like.

**Why:** The main Albanian failures in `ExtendSqi.gf` came from building simplified records where the grammar expected full category records with inherited fields and lock fields. The compile runs repeatedly surfaced `missing lock_AP`, `missing lock_CN`, and type mismatches of the form “expected `{s : Str}` but inferred a category table” or the reverse.

**Evidence:**
- `run_20260317_084411_20260317_084437_03_details.txt`
- `run_20260317_143053_20260317_143145_03_details.txt`
- `AlbanianGF_codedump.txt`

**Implications:**
- `apStr`, `cnStr`, `apConst`, and `cnConst` are only safe in truly string-targeted outputs or carefully justified helper contexts.
- When output category is AP/CN/NP/ListNP/etc., preserve the native shape.

**Do not:**
- Hand-roll reduced AP/CN records in production overrides.
- Assume a working surface string means the category is correctly typed.

---

## ALB-DEC-004
**Status:** superseded  
**Area:** `PrepCN`  
**Decision:** Early repair attempts treated `PrepCN` as noun-like and returned a `CN`-shaped record.

**Why superseded:** Abstract and functor evidence showed `PrepCN` does not belong to the noun-returning family.

**Evidence:**
- Earlier `ExtendSqi.gf` snapshots in `AlbanianGF_codedump.txt`
- `Extend.gf`
- `ExtendFunctor.gf`

**Implications:**
- Keep this entry only to explain earlier failed patches.

**Do not:**
- Re-introduce noun-like `PrepCN` implementations.

---

## ALB-DEC-005
**Status:** accepted  
**Area:** `PrepCN`  
**Decision:** `PrepCN` must follow the abstract/functor result category and be implemented through constructor composition rather than a noun-preserving wrapper.

**Why:** This was the first major signature mistake uncovered during `ExtendSqi.gf` debugging. The right fix direction is composition through existing grammar paths rather than a bespoke noun-table wrapper.

**Evidence:**
- `Extend.gf`
- `ExtendFunctor.gf`
- `AdverbSqi.gf`
- `ResSqi.gf`

**Implications:**
- Prefer constructor paths equivalent to prep + NP/CN composition.
- Preserve Albanian preposition behavior only at the point where Albanian local modules justify it.

**Do not:**
- Build `PrepCN` as `lin CN { ... }`.

---

## ALB-DEC-006
**Status:** accepted  
**Area:** `RNP` / `RNPList`  
**Decision:** Default Albanian strategy is to inherit `RNP = NP` and `RNPList = ListNP` from `ExtendFunctor`, unless Albanian-specific evidence later proves a custom subsystem is necessary.

**Why:** Uploaded `ExtendFunctor.gf` establishes the inherited baseline. Albanian failures were caused in part by flattening `RNP`/`RNPList` to `{s : Str}`. The simplest evidence-backed correction is to restore inherited NP/ListNP compatibility first.

**Evidence:**
- uploaded `ExtendFunctor.gf`
- `Extend.gf`
- run history around `ReflPoss`

**Implications:**
- `ReflPoss`, `PredetRNP`, `ConjRNP`, `Base_*_RNP`, and `Cons_*_RNP` should be compatible with NP/ListNP.
- Custom record redesign is secondary, not default.

**Do not:**
- Flatten `RNP` to `{s : Str}`.
- Mix custom and inherited `RNP` representations in the same repair pass.

---

## ALB-DEC-007
**Status:** accepted  
**Area:** `RNP` subsystem  
**Decision:** Treat the whole `RNP` family as one subsystem.

**Functions included:**
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

**Why:** Bulgarian and German both implement these as a coordinated family. Albanian compile failures moved from `ReflPoss` to `RNPList` constructors, confirming that single-function patching is insufficient when representation is shared.

**Evidence:**
- `Bulgarian.txt`
- `GermanGF_Codedump.txt`
- uploaded `ExtendFunctor.gf`
- run logs

**Implications:**
- Any change to one member must be checked against all other members.
- `Base_*_RNP` and `Cons_*_RNP` must return `ListNP`-compatible values.

**Do not:**
- Patch `ReflPoss` in isolation and assume the family is fixed.

---

## ALB-DEC-008
**Status:** accepted  
**Area:** `RNPList` constructors  
**Decision:** `Base_*_RNP` and `Cons_*_RNP` must be wrapped as `ListNP` values, not returned as raw records.

**Why:** After the `RNP = NP` correction, the next failure moved to `Base_rr_RNP`, `Base_nr_RNP`, and `Base_rn_RNP`, where GF explicitly requested wrapping with `lin ListNP`.

**Evidence:**
- run after `RNP` fix (`Base_rr_RNP` / `Base_nr_RNP` / `Base_rn_RNP` diagnostics)
- uploaded `ExtendFunctor.gf`

**Implications:**
- Always construct `RNPList` through `lin ListNP { ... }` when overriding.

**Do not:**
- Return bare records for inherited list categories.

---

## ALB-DEC-009
**Status:** accepted  
**Area:** lock-field diagnostics  
**Decision:** `missing lock_AP` and `missing lock_CN` warnings are design warnings, not harmless noise.

**Why:** In the Albanian runs, every time these warnings clustered around one family, that family later produced a hard type mismatch. They reliably indicate that an implementation is using reduced records or wrong category shapes.

**Evidence:**
- `run_20260317_084411_20260317_084437_03_details.txt`
- `run_20260317_143053_20260317_143145_03_details.txt`

**Implications:**
- Zero hard errors but lingering lock warnings is not considered “done”.
- Warnings should be eliminated before marking a family final.

**Do not:**
- Ignore lock warnings on the grounds that generation “looks fine”.

---

## ALB-DEC-010
**Status:** accepted  
**Area:** AP/CN conversion family  
**Decision:** Functions such as `ICompAP`, `CompBareCN`, `AdjAsCN`, `AdjAsNP`, `AdvIsNPAP`, `N2VPSlash`, `CompoundAP`, and `CardCNCard` must be rewritten using category-preserving Albanian constructors or inherited functor composition whenever possible.

**Why:** This family generated the broadest cluster of `lock_AP` / `lock_CN` warnings and later surfaced as the `PredAPVP` blocker. The common root cause was flattening AP/CN values to strings and rebuilding reduced records.

**Evidence:**
- `run_20260317_143053_20260317_143145_02_raw.txt`
- `run_20260317_084411_20260317_084437_03_details.txt`
- `AlbanianGF_codedump.txt`
- `NounSqi.gf`
- `AdjectiveSqi.gf`

**Implications:**
- Prefer `CompCN`, `CompAP`, `UseComp`, `AdvVP`, and similar inherited paths where available.
- If no inherited path exists, build full Albanian category records, not reduced string wrappers.

**Do not:**
- Implement these functions by `apStr` / `cnStr` concatenation unless target type is truly string-only.

---

## ALB-DEC-011
**Status:** accepted  
**Area:** existential family  
**Decision:** `ExistS`, `ExistNPQS`, and `ExistIPQS` must be built through clause/question constructor paths, not direct string concatenation.

**Why:** The compile logs explicitly reported record-type mismatches for the existential family. This shows they are structurally tied to `Cl`/`QCl`-like machinery, not just to strings.

**Evidence:**
- `run_20260317_143053_20260317_143145_03_details.txt`
- `ExtendFunctor.gf`

**Implications:**
- Use inherited existential constructor composition whenever possible.
- Do not treat existential outputs as plain surface strings.

**Do not:**
- Revert to `pol.s ++ np.s ! Nom`-style existential implementations.

---

## ALB-DEC-012
**Status:** accepted  
**Area:** model-language policy  
**Decision:** Use Bulgarian as the first model language for the minimal `RNP` subsystem, and German as the richer secondary reference.

**Why:** Bulgarian provides a closer “small structured RNP” model, while German shows a larger custom subsystem with extra fields. German is useful for structural insight, but Bulgarian is the safer first comparison when Albanian inheritance is still under repair.

**Evidence:**
- `Bulgarian.txt`
- `GermanGF_Codedump.txt`

**Implications:**
- For `RNP`, compare Bulgarian first.
- Use German to understand subsystem completeness, not as an automatic copy target.

**Do not:**
- Copy German-specific field inventory into Albanian without direct Albanian need.

---

## ALB-DEC-013
**Status:** accepted  
**Area:** model-language limits  
**Decision:** Model languages are validation aids, not templates of truth.

**Why:** German and Bulgarian both customize some `Extend` families, but not always in the same way. Their differences prove that abstract signatures do not determine a unique concrete implementation.

**Evidence:**
- `Bulgarian.txt`
- `GermanGF_Codedump.txt`
- `Extend.gf`

**Implications:**
- Always reconcile model-language code with Albanian lincats.
- Record any model-language borrowing explicitly in this log.

**Do not:**
- Merge Bulgarian and German fragments into Albanian without a coherent target representation.

---

## ALB-DEC-014
**Status:** provisional  
**Area:** `ICompAP`, `N2VPSlash`, `AdjAsCN`, `AdjAsNP`, `CompoundAP`, and parts of `RNP`  
**Decision:** These remain best-effort until they are rebuilt entirely with full Albanian category constructors and validated by a compile run with no lock warnings.

**Why:** `ExtendFunctor.gf` does not give a ready-made default for every one of these, and the current Albanian patches still rely partly on approximations. They are the main remaining sources of non-final confidence.

**Evidence:**
- uploaded `ExtendFunctor.gf`
- latest run logs
- Albanian core modules

**Implications:**
- These functions should be priority targets for future “finalization” work.
- Any local approximation here must be marked provisional in documentation.
- Their current status should also be visible in the symbol status ledger and relevant subsystem documents.

**Do not:**
- Mark the language repair complete while these remain warning-bearing or shape-approximate.

---

## ALB-DEC-015
**Status:** accepted  
**Area:** documentation system  
**Decision:** Albanian documentation should be language-wide and modular, not restricted to `ExtendSqi.gf`.

**Why:** The repair effort showed that constructor behavior, lincat shape, morphology, syntax, inheritance, and cross-module assumptions are tightly interrelated. A narrow `ExtendSqi` doc would not prevent drift in future edits elsewhere.

**Evidence:**
- cross-file dependencies visible in `AlbanianGF_codedump.txt`
- repeated repair dependence on `CatSqi.gf`, `NounSqi.gf`, `AdverbSqi.gf`, `ResSqi.gf`, `QuestionSqi.gf`, and model-language files

**Implications:**
- Maintain the full Albanian documentation suite.
- Record future implementation decisions here with file-level evidence.
- Keep architecture docs, rule docs, inventories, and test docs in sync.

**Do not:**
- Keep important implementation rules only in chat history.

---

## ALB-DEC-016
**Status:** accepted  
**Area:** completion criterion  
**Decision:** “Final” means more than “compiles once”.

**Finality criteria:**
1. no hard type errors,
2. no `lock_AP` / `lock_CN` warnings,
3. no category-shape approximations left undocumented,
4. every override either justified by functor composition or documented as a deliberate Albanian-specific implementation,
5. minimal representative examples specified in the test suite.

**Why:** The repair history already showed multiple stages where one hard error disappeared only for the next design error to surface. A stricter definition of “done” is required.

**Evidence:**
- sequence of run logs from `PrepCN` to `ReflPoss` to `RNPList` to `PredAPVP`

**Implications:**
- Future merges should use this criterion.
- Open/provisional items should stay visible in the symbol status ledger until the finality criteria are actually met.

**Do not:**
- Declare success after the first green compile if lock warnings or undocumented approximations remain.

---

## ALB-DEC-017
**Status:** accepted  
**Area:** helper typing discipline  
**Decision:** Shared helper reuse requires exact category compatibility. Family resemblance is not enough.

**Why:** The current `ExtendSqiFocusPrep.gf` failure showed that surface-extraction permission for a shallow target does not make every nearby helper valid. In the live code, `adjSurfaceNomMascSg` is an `A -> Str` helper, while `fp_FocusAP` takes an `AP`; using the former on the latter produced a real compile failure.

**Evidence:**
- `albanian/ExtendSqiHelpers.gf`
- `albanian/ExtendSqiFocusPrep.gf`
- `run_20260325_084209_20260325_084337_01_ROOT.txt`
- `ALBANIAN_CATEGORY_AND_LINCAT_REFERENCE.md`
- `ALBANIAN_SYNTAX_AND_CONSTRUCTOR_RULES.md`

**Implications:**
- Helper tables in documentation must record exact input and output categories.
- Before reusing a helper, verify exact type, not just family (`A` vs `AP`, `N`/`CN` vs `NP`, `Pron` vs generic `NP`, `ListNP` vs `NP`).
- A local `AP -> Str` helper is acceptable for a shallow `Utt` target if the result category is truly surface-only, but an `A -> Str` helper must not be substituted for it.
- The helper registry is the first operational place to record such exact helper legality.

**Do not:**
- Reuse a helper because its name looks close to the needed category.
- Treat adjective-family helpers as interchangeable across `A`, `A2`, and `AP`.

---

## ALB-DEC-018
**Status:** accepted  
**Area:** constructor availability  
**Decision:** A documented lincat shape is necessary evidence, but it is not by itself a license to use `lin Cat { ... }` in any module. Constructor availability must be checked in the actual module context.

**Why:** The current `StructuralSqiClause.gf` failure showed that even when `DConj` is documented as surface-shaped, a local `lin DConj {s = ...}` pattern can still fail if the category/constructor is not actually available or valid in that resource context.

**Evidence:**
- `albanian/StructuralSqiClause.gf`
- `run_20260325_084209_20260325_084337_01_ROOT.txt`
- `run_20260325_084209_20260325_084337_02_raw.txt`
- `ALBANIAN_CATEGORY_AND_LINCAT_REFERENCE.md`
- `ALBANIAN_SYNTAX_AND_CONSTRUCTOR_RULES.md`

**Implications:**
- Before writing `lin Cat { ... }`, verify:
  1. the category is in scope in the current module,
  2. the fields assumed by the record match the current Albanian concrete category,
  3. the constructor path is already supported somewhere in the current codedump or is compile-validated,
  4. no existing Albanian producer/helper/paradigm path should be preferred.
- Treat simple-looking structural categories (`DConj`, `CAdv`, `Utt`, `Voc`, etc.) as high-risk if module context has not been confirmed.
- The shallow-category constructor matrix is the main operational companion for this lesson.

**Do not:**
- Infer constructor validity from lincat shape alone.
- Import a constructor pattern from one module into another without checking scope and compile behavior.

---

## ALB-DEC-019
**Status:** accepted  
**Area:** evidence quality  
**Decision:** Comments are secondary evidence only. When comments, current source, and current compiler behavior disagree, current source plus compiler reality win.

**Why:** The Albanian maintenance workflow already contains stale or historically descriptive comments. These are useful for context, but they are not authoritative enough to override current category definitions, helper signatures, or compile failures.

**Evidence:**
- current Albanian codedump
- current compile/audit workflow
- `ALBANIAN_CATEGORY_AND_LINCAT_REFERENCE.md`
- `ALBANIAN_SYNTAX_AND_CONSTRUCTOR_RULES.md`

**Implications:**
- If a comment conflicts with live code, either update the comment or document the discrepancy explicitly.
- AI systems must not treat comments as equal to typed source and compiler diagnostics.
- Documentation should mark historical comments as historical where needed.
- The stale comment tracker is now the main place to record such mismatches explicitly.

**Do not:**
- “Fix” live code to match a stale comment.
- Use a comment as the only evidence for a constructor or helper pattern.

---

## ALB-DEC-020
**Status:** accepted  
**Area:** concrete implementation disputes  
**Decision:** For concrete coding disputes, use the following precedence order:

1. current compiler error and current source dump,
2. exact abstract signature,
3. current Albanian lincat and current Albanian core constructor path,
4. architecture and policy documents,
5. model-language comparison,
6. comments and chat history.

**Why:** The recent `fp_FocusAP` and `StructuralSqiClause` failures showed that architecture docs can be correct in principle while a specific proposed local pattern is still wrong in the live repository. Concrete coding decisions must therefore be resolved against what actually compiles now.

**Evidence:**
- `run_20260325_084209_20260325_084337_01_ROOT.txt`
- `run_20260325_084209_20260325_084337_02_raw.txt`
- `albanian/ExtendSqiFocusPrep.gf`
- `albanian/StructuralSqiClause.gf`
- `ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md`
- `ALBANIAN_CATEGORY_AND_LINCAT_REFERENCE.md`
- `ALBANIAN_SYNTAX_AND_CONSTRUCTOR_RULES.md`

**Implications:**
- Architecture still governs ownership and subsystem design.
- Current compiler behavior governs acceptance of a concrete local code pattern.
- Future repairs should record whether a conclusion is architectural, category-shape-based, constructor-based, or compile-driven.

**Do not:**
- Choose one side globally as “always right”.
- Use architecture documents as if they certify every local constructor pattern automatically.
- Ignore current compile evidence because a pattern looked plausible in an earlier session.

---

## ALB-DEC-021
**Status:** open  
**Area:** `must_VV` in `StructuralSqiVerbal.gf` / `StructuralSqi.gf`  
**Decision:** Keep `must_VV` disabled until the crash source is isolated in the verbal helper chain.

**Why:** The current structural aggregator still keeps `must_VV` disabled with an explicit note that the crash source is not yet isolated. This means the item is known but not stable enough to normalize into ordinary structural vocabulary.

**Evidence:**
- `albanian/StructuralSqi.gf`
- current Albanian codedump

**Implications:**
- Do not silently re-enable `must_VV` in structural exports.
- Treat it as a tracked open item rather than an accidental omission.
- When it is repaired, update this entry and add minimal tests.
- Its state should also remain visible in the symbol status ledger until closure.

**Do not:**
- Remove the warning note without actual evidence.
- Treat the disabled state as proof that the rest of the verbal structural layer is unstable.

---

## ALB-DEC-022
**Status:** superseded as an unconditional current ownership rule by ALB-DEC-044; historical PMCFG/architecture evidence retained  
**Area:** `ExtendSqi` architecture  
**Decision:** `ExtendSqi.gf` must remain a thin coordinator; companion modules own Albanian-specific subsystem logic; VPS/VPI/VPS2/VPI2/list-family machinery remains inherited in this cycle.

**Why:** The current extension architecture is intentionally split to stop coordinator drift and unsafe cross-family overrides. The thin-coordinator policy, subsystem ownership, and inherited VPS-family rule were all fixed for the current cycle and should be treated as settled unless new architectural evidence appears.

**Evidence:**
- `ALBANIAN_EXTENDSQI_FINAL_TARGET.md`
- `ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md`
- `ALBANIAN_FUTURE_EXTENDSQI_STRUCTURE.md`
- `albanian/ExtendSqi.gf`

**Implications:**
- Keep `ExtendSqi.gf` limited to imports, subtraction list, and `lin` renamings.
- Do not create `ExtendSqiVPS.gf` in this cycle.
- Keep family coherence in subsystem modules (`RNP`, existential, AP/CN conversion, focus/prep, lexical tail, VP bridge).

**Do not:**
- Re-introduce local coordinator-side helper logic.
- Reintroduce VPS/VPI family overrides into `ExtendSqi.gf`.
- Split one family across unrelated local patches.

---

## ALB-DEC-023
**Status:** accepted  
**Area:** documentation maintenance  
**Decision:** When a compile failure reveals a missing operational rule, update the relevant rule documents and this log together.

**Why:** The current documentation suite is meant to prevent repeat drift, not merely describe the architecture. The recent helper-type and constructor-availability failures showed that a lesson is not stable until both the rule document and the decision log capture it.

**Evidence:**
- `ALBANIAN_DECISION_LOG.md`
- `ALBANIAN_CATEGORY_AND_LINCAT_REFERENCE.md`
- `ALBANIAN_SYNTAX_AND_CONSTRUCTOR_RULES.md`
- `ALBANIAN_IMPLEMENTATION_PATTERNS.md`
- current audit failures

**Implications:**
- New lessons should update both rule files and decision-log entries.
- The log should remain the shortest authoritative statement of each settled lesson.
- Rule documents should carry the fuller operational detail.

**Do not:**
- Leave important repair lessons only in temporary conversation history.
- Update one doc file and assume the rest of the anti-drift system will infer the change.

---

## ALB-DEC-024
**Status:** accepted  
**Area:** support documentation dependencies  
**Decision:** The helper registry, shallow-category constructor matrix, symbol status ledger, stale comment tracker, and module extraction coverage file are now authoritative companion controls for this log.

**Why:** The decision log should remain short and authoritative, but some categories of evidence are too large and too changeable to be restated cleanly as prose-only decisions. The new support documents exist specifically to hold operational inventories, matrices, fragile-symbol states, stale-comment records, and documentation-coverage status.

**Evidence:**
- `ALBANIAN_HELPER_REGISTRY.md`
- `ALBANIAN_SHALLOW_CATEGORY_CONSTRUCTOR_MATRIX.md`
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md`
- `ALBANIAN_STALE_COMMENT_TRACKER.md`
- `ALBANIAN_MODULE_EXTRACTION_COVERAGE.md`

**Implications:**
- Use this log for the short settled lesson.
- Use the helper registry for exact helper legality and status.
- Use the constructor matrix for shallow-category constructor-context questions.
- Use the symbol status ledger for fragile/open/provisional symbol tracking.
- Use the stale comment tracker for known comment/code mismatches.
- Use the module extraction coverage file to decide whether a module is documented deeply enough to guide coding without full source re-audit.

**Do not:**
- Expand this log into a duplicate of the registries and matrices.
- Leave a fragile live fact undocumented because “the rule already exists somewhere else”.

---

## ALB-DEC-025
**Status:** accepted  
**Area:** documentation coverage discipline  
**Decision:** Module-level documentation completeness must now be tracked explicitly rather than assumed.

**Why:** The older documentation debt notes explicitly left open the question of which Albanian modules were still under-extracted into the language-wide documentation set. That uncertainty is itself a drift source, because an AI may assume that a module is fully documented when only its architecture placement is known.

**Evidence:**
- `ALBANIAN_MODULE_EXTRACTION_COVERAGE.md`
- `ALBANIAN_LANGUAGE_ARCHITECTURE.md`
- `ALBANIAN_MODULE_DEPENDENCY_MAP.md`

**Implications:**
- Before treating a module as documentation-backed evidence, check whether it is `COVERED_IN_DEPTH`, `COVERED_STRUCTURALLY`, `PARTIALLY_EXTRACTED`, or still `PENDING_TARGETED_EXTRACTION`.
- Deep coding work on under-extracted modules should still consult the live codedump.
- Promotion from partial coverage to in-depth coverage should be recorded in the coverage file, not assumed silently.

**Do not:**
- Assume that architectural naming alone means implementation-level extraction is already complete.
- Treat a thin wrapper and a rich producer module as requiring the same level of narrative extraction.

---

## ALB-DEC-026
**Status:** accepted  
**Area:** fragile symbol tracking  
**Decision:** Symbol-level fragility, provisionality, and blocked status must be tracked centrally rather than only embedded in scattered prose.

**Why:** The Albanian codebase now has multiple classes of non-final items: open issues like `must_VV`, provisional AP/CN/RNP items, warning-state structural categories, blocked helpers, and compatibility wrappers. Leaving these statuses implicit causes AI systems to treat them as ordinary stable patterns.

**Evidence:**
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md`
- `ALBANIAN_HELPER_REGISTRY.md`
- `ALBANIAN_DECISION_LOG.md`

**Implications:**
- Keep short decisions here.
- Keep live symbol status in the symbol status ledger.
- When a decision changes the fragility or maturity of a symbol, update both this log and the ledger.
- Treat provisional and open symbols as non-final even if they are currently compileable.

**Do not:**
- Hide a non-final status in one paragraph of one doc file and assume future sessions will notice.
- Treat a compatibility wrapper or blocked helper as ordinary final infrastructure.

---

## ALB-DEC-027
**Status:** accepted  
**Area:** anti-drift system integrity  
**Decision:** A documentation lesson is not considered stabilized until all affected control layers are updated together.

**Why:** The Albanian docs suite is now intentionally layered. A single repair lesson can affect:
- the short decision statement,
- the rule explanation,
- the helper inventory,
- the constructor matrix,
- the fragile-symbol ledger,
- the stale-comment tracker,
- the test suite,
- and module coverage expectations.

If only one layer is updated, the next session can still drift.

**Evidence:**
- `ALBANIAN_DECISION_LOG.md`
- `ALBANIAN_IMPLEMENTATION_PATTERNS.md`
- `ALBANIAN_SYNTAX_AND_CONSTRUCTOR_RULES.md`
- `ALBANIAN_HELPER_REGISTRY.md`
- `ALBANIAN_SHALLOW_CATEGORY_CONSTRUCTOR_MATRIX.md`
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md`
- `ALBANIAN_STALE_COMMENT_TRACKER.md`
- `ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`

**Implications:**
- A new settled lesson must propagate to every directly affected control file.
- The decision log remains the short anchor, but not the only place the lesson lives.
- Future review should ask: “which companion files must also be updated?”

**Do not:**
- Treat a conversation conclusion as if it were a stabilized project rule.
- Update only one control file and assume the system is now aligned.

---

## ALB-DEC-028
**Status:** provisional  
**Area:** `ExtendSqi` / `EmbedSSlash` / PMCFG compile repair  
**Decision:** Subtract `EmbedSSlash` from the inherited `ExtendFunctor` path and route it through `ExtendSqiVPBridge` only as a tracked compile probe. The temporary Albanian bridge preserves the already-flattened `SSlash.s` into `SC.s`; it is not accepted as the final linguistic realization.

**Why:** The pinned shared functor leaves `EmbedSSlash : SSlash -> SC` at `variants {}`. The observed GF 3.12 Wordbench run crashes in `GeneratePMCFG` and does not produce `ExtendSqi.gfo`, while companion modules do compile. Current Albanian `SSlash` and `SC` are shallow string records, making the probe type-shape compatible. However, canonical model languages that override `EmbedSSlash` reconstruct or fill the slash rather than performing a bare string coercion, and current Albanian `SSlash` no longer carries equivalent complement metadata.

**Evidence:**
- current Wordbench `ExtendSqi.gf` PMCFG failure (`GeneratePMCFG.hs`, non-exhaustive patterns)
- pinned `abstract/Extend.gf`: `EmbedSSlash : SSlash -> SC`
- pinned `common/ExtendFunctor.gf`: `EmbedSSlash = variants {}`
- current `CatSqi.gf`: `SSlash = {s : Str}` and inherited `CommonX.SC = {s : Str}`
- current `ExtendSqi.gf` / `ExtendSqiVPBridge.gf` ownership structure
- canonical pinned model-language implementations in `ExtendFin.gf` and `ExtendSwe.gf`

**Implications:**
- This patch may establish or reject the PMCFG-causality hypothesis after `Quick -> ExtendSqi.gf`.
- A passing compile does not promote `EmbedSSlash` to `stable`.
- Finalization requires an Albanian-specific slash/free-relative strategy and targeted linguistic tests.
- The override matrix and symbol-status ledger must keep the temporary status visible until those exit criteria are met.

**Do not:**
- Report `EmbedSSlash` as the proven PMCFG cause before the retest.
- Report direct `SSlash.s -> SC.s` preservation as linguistically complete.
- Copy Finnish or Swedish surface strings into Albanian.

---
## ALB-DEC-029
**Status:** provisional  
**Area:** `ExtendSqi` / `ComplBareVS` / PMCFG localization  
**Decision:** Replace the current scaffold reconstruction for `ComplBareVS` with the direct Albanian core reuse `ComplBareVS = ComplVS` as a bounded GF 3.12 compile probe.

**Why:** A verbose Wordbench run now localizes the PMCFG crash directly. `CompVP` completes with full PMCFG statistics, then GF prints `+ ComplBareVS 1` and crashes before the statistics tuple for that function. In the same run, `VerbSqi.gfo` is produced successfully, so the Albanian core `ComplVS : VS -> S -> VP` path is already accepted by GF 3.12. The available Bulgarian model-language source uses the same direct reuse (`ComplBareVS = ComplVS`). This is stronger evidence than the previous generic scaffold reconstruction through `verbPres3sg`.

**Evidence:**
- Wordbench verbose run `20260918_020756`: last completed entry `+ CompVP 4 (1,1)`, followed by `+ ComplBareVS 1` and the `GeneratePMCFG.hs` non-exhaustive-pattern crash
- current abstract signature: `ComplBareVS : VS -> S -> VP`
- current Albanian `VerbSqi.gf`: `ComplVS` already realizes `VS -> S -> VP`
- the same run successfully emits `VerbSqi.gfo`
- available Bulgarian model-language implementation: `ComplBareVS = ComplVS`

**Implications:**
- This probe changes only the `ComplBareVS` wiring; it does not pre-emptively alter later Extend functions.
- If the next verbose run advances past `ComplBareVS`, the old scaffold path is confirmed as a PMCFG trigger for this function.
- If the crash remains on `ComplBareVS`, the direct-alias hypothesis is rejected and the next investigation must inspect the normalized concrete term rather than patching later functions.
- `sc_ComplBareVS` may remain temporarily unused until the probe result is known; remove or repurpose it only after validation.

**Do not:**
- Claim that all of `ExtendSqi` is repaired before the retest.
- Patch `ComplDirectVS`, `ComplDirectVQ`, or later functions merely because they are in the same family; wait for verbose evidence.
- Treat the previous `EmbedSSlash` or `A2VPSlash` hypotheses as proven PMCFG causes.

---
## ALB-DEC-030
**Status:** provisional  
**Area:** `ExtendSqi` / `ComplDirectVQ` / PMCFG localization  
**Decision:** Replace the manual `lin VP {s = verbPres3sg vq ++ ...}` realization inside `sc_ComplDirectVQ` with composition through the already-compiled Albanian core constructors `UseV` and `AdvVP`, preserving the current direct-utterance surface as `Utt.s`.

**Why:** The GF 3.12 verbose run after ALB-DEC-029 proves that `ComplBareVS` now completes (`+ ComplBareVS 1 (1,1)`) and that PMCFG then crashes while generating `ComplDirectVQ` (`+ ComplDirectVQ 1` with no completed statistics tuple). The current `sc_ComplDirectVQ` repeats the same manual `verbPres3sg` + bare `lin VP` pattern that was removed from `ComplBareVS`. Albanian core `VerbSqi` already compiles `UseV` and `AdvVP`. The pinned RGL also contains architecture-compatible model implementations that compose `ComplDirectVQ` through `UseV` and `AdvVP`; model evidence is corroborative only, not authoritative over Albanian category shapes.

**Evidence:**
- Wordbench verbose run `20260918_023203`: `+ ComplBareVS 1 (1,1)` followed by `+ ComplDirectVQ 1` and the `GeneratePMCFG.hs` non-exhaustive-pattern crash.
- `ComplDirectVQ : VQ -> Utt -> VP`.
- Albanian `VQ = Verb`, `VP = {s : Str}`, and core `UseV`/`AdvVP` compile successfully as part of `VerbSqi.gfo`.
- Albanian override matrix already assigns `ComplDirectVQ` to `ExtendSqiScaffolding.gf`.
- Pinned RGL implementations use the same core-composition architecture for direct VQ complements.

**Implications:**
- Only `sc_ComplDirectVQ` changes functionally in this probe.
- `ComplDirectVS` and fronted direct-complement functions are intentionally left untouched until verbose evidence reaches them.
- The probe preserves the current Albanian output policy by passing `utt.s` unchanged; it does not import punctuation/quotation policy from another language.
- If the next verbose run prints a completed tuple for `ComplDirectVQ`, the manual VP reconstruction is confirmed as a PMCFG trigger for this function.

---
## ALB-DEC-031
**Status:** provisional  
**Area:** `ExtendSqi` / `ComplDirectVS` / PMCFG localization  
**Decision:** Record successful GF 3.12 PMCFG validation of the preceding `ComplBareVS` and `ComplDirectVQ` repairs, then replace only the manual `lin VP` realization inside `sc_ComplDirectVS` with Albanian core composition through `UseV` and `AdvVP`, preserving `Utt.s`.

**Compiler evidence:** Wordbench verbose run `20260918_024514` completes:
- `+ ComplBareVS 1 (1,1)`
- `+ ComplDirectVQ 1 (1,1)`

and then fails while generating:
- `+ ComplDirectVS 1`
- `GeneratePMCFG.hs ... Non-exhaustive patterns in case`

**Rationale:** The active failure has moved exactly from `ComplDirectVQ` to `ComplDirectVS`. The current `sc_ComplDirectVS` still uses the same manual `verbPres3sg` plus bare `lin VP {s = ...}` construction that has already been removed from the two preceding hotspots. Albanian core `UseV` and `AdvVP` are compiled in `VerbSqi.gfo`. The pinned `ExtendFunctor.gf` uses the same structural composition (`AdvVP (UseV <lin V vs : V>) ...`) for `ComplDirectVS`; its punctuation/quotation surface policy is not copied.

**Scope:**
- functional change only in `sc_ComplDirectVS`;
- no change to `FrontComplDirectVS`, `FrontComplDirectVQ`, `SlashBareV2S`, or later functions;
- keep GF verbose enabled for the next validation.

**Pass condition:** GF 3.12 must print a completed PMCFG tuple for `ComplDirectVS` and advance to the next function or emit `ExtendSqi.gfo`.

---
## ALB-DEC-032
**Status:** provisional  
**Area:** `ExtendSqi` / `ComplGenVV` / PMCFG localization  
**Decision:** Record successful GF 3.12 PMCFG validation of `ComplDirectVS`, then replace only the manual bare-`VP` realization inside `sc_ComplGenVV` with the existing Albanian core constructor `ComplVV vv vp`.

**Compiler evidence:** Wordbench verbose run `20260918_024851` completes:
- `+ ComplBareVS 1 (1,1)`
- `+ ComplDirectVQ 1 (1,1)`
- `+ ComplDirectVS 1 (1,1)`

and then fails while generating:
- `+ ComplGenVV 4`
- `GeneratePMCFG.hs ... Non-exhaustive patterns in case`

**Architecture evidence:**
- abstract signature: `ComplGenVV : VV -> Ant -> Pol -> VP -> VP`;
- pinned `ExtendFunctor.gf`: `ComplGenVV = variants {}` (language-specific obligation);
- Albanian override matrix already assigns `ComplGenVV` to `ExtendSqiScaffolding.gf` and requires the `CommonX` contract with no `TenseSqi` leakage;
- Albanian core `VerbSqi.gf` already provides `ComplVV : VV -> VP -> VP`;
- the previous helper's surface `verbPres3sg vv ++ wordSep ++ vp.s` is structurally equivalent to the current Albanian core `ComplVV` realization (`vPred vv` + `vp.s`).

**Important limitation:** `Ant` and `Pol` remain ignored by this bounded probe, exactly as in the previous Albanian implementation. This is not claimed to be a linguistically complete implementation of generalized VV complementation. The purpose of this patch is to eliminate manual `lin VP` fabrication while preserving existing surface behavior and to test PMCFG stability. Once `ExtendSqi` is structurally stable, `ComplGenVV` needs a separate Albanian linguistic design for anteriority/polarity.

**Scope:** no changes to later functions. Keep GF verbose enabled.

**Pass condition:** GF 3.12 prints a completed PMCFG tuple for `ComplGenVV` and advances to the next function or emits `ExtendSqi.gfo`.

---
## ALB-DEC-033
**Status:** superseded as the current ownership prescription by ALB-DEC-044; historical compiler experiment retained  
**Area:** `ExtendSqi` / inherited VPS-VPI family / coordinator drift  
**Decision:** Reconcile the live coordinator with accepted ALB-DEC-022: the VPS/VPI/VPS2/VPI2/list family remains inherited from `ExtendFunctor`; `ExtendSqi.gf` keeps only documented boundary `lincat` declarations and must not subtract or locally implement this family.

**Why:** The current snapshot contradicts the accepted architecture by subtracting and locally rebuilding the inherited family. GF 3.12 verbose run `20260918_124945` now reaches the local `ComplVPIVV` implementation and crashes there after successfully completing the preceding repaired functions. The override matrix explicitly classifies such local ownership as a coordinator drift bug and requires that mismatch to be fixed before another coordinator-side patch is accepted.

**Compiler evidence:**
- `+ ComplGenVV 4 (1,1)`
- `+ ComplSlashPartLast 9 (1,1)`
- `+ ComplVPI2 9 (1,1)`
- `+ ComplVPIVV 1`
- then `GeneratePMCFG.hs ... Non-exhaustive patterns in case`

**Code action:**
- remove the inherited family from the subtraction list;
- remove all local inherited-family `lin` implementations, including `Base/Cons/ConjComp` and `Base/Cons/ConjImp`;
- retain the existing explicit shallow boundary `lincat` declarations for `VPS`, `VPI`, `VPS2`, `VPI2`, their lists, `[Comp]`, and `[Imp]`;
- correct the stale policy comment that previously claimed Albanian local ownership.

**Important limitation:** inherited `ExtendFunctor` functions that are still `variants {}` remain explicitly incomplete. Restoring inheritance is an architecture/stability correction, not a claim of linguistic coverage.

**Pass condition:** a verbose GF 3.12 run must advance beyond the coordinator-drift hotspot or produce `ExtendSqi.gfo`. If inherited `variants {}` expose a new family-level failure, do not restore one-off local functions; reassess the whole family and update the matrix before changing ownership.

---
## ALB-DEC-034
**Status:** provisional  
**Area:** `ExtendSqi` / `FrontComplDirectVS` / `Cl` preservation  
**Decision:** After fix11 successfully advances beyond the locally reintroduced VPS/VPI family, repair only `FrontComplDirectVS` by constructing an Albanian `Cl` through `PredVP` and `UseV`, then applying a same-category update to preserve the existing surface realization.

**Compiler evidence — run `20260918_132835`:**
- `+ FrontComplDirectVQ 9 (1,1)` completes;
- `+ FrontComplDirectVS 9` is printed;
- GF then crashes in `GeneratePMCFG.hs` before the statistics tuple for `FrontComplDirectVS`.

The same run also demonstrates that fix11 removed the previous `ComplVPIVV` crash: inherited/provisional VPS/VPI family functions now complete with `(0,0)` where `ExtendFunctor` still uses `variants {}`.

**Current problematic path:**
```gf
lin Cl {s = ...}
```

**Fix12 path:**
```gf
let cl : Cl = PredVP np (UseV <lin V vs : V>)
in cl ** {s = <existing Albanian surface>}
```

**Why:** `CatSqi` exposes `Cl` as shallow, but the compiled category interface carries lock/category structure. Albanian policy requires composition over direct reconstruction when a core constructor path exists. `SentenceSqi.PredVP` is the current Albanian `NP -> VP -> Cl` constructor, and `VerbSqi.UseV` is the current Albanian `V -> VP` path. The same-category update preserves the constructor-produced `Cl` shape rather than fabricating a fresh reduced `Cl`.

**Surface policy:** This compile probe deliberately preserves the existing Albanian surface order. It does not copy Estonian, Russian, or Romance punctuation/quotation behavior.

**Scope:**
- change only `sc_FrontComplDirectVS` functionally;
- leave `sc_FrontComplDirectVQ` unchanged because it already completes PMCFG;
- do not alter later scaffolding functions until verbose evidence reaches them.

**Separate open issue:** GF now warns that `Base/Cons/ConjComp` and `Base/Cons/ConjImp` have no linearizations under the inheritance-only configuration. This contradicts the previously assumed compiler completeness of that boundary. Do not silently reintroduce coordinator implementations; resolve the six constructors as one family in a later architecture decision.

**Pass condition:** verbose GF 3.12 prints a completed PMCFG tuple for `FrontComplDirectVS` and advances further.

---
## ALB-DEC-035
**Status:** diagnostic / non-final  
**Area:** `ExtendSqi` / `FrontComplDirectVS` / PMCFG minimization  
**Decision:** Reject the previously proposed `VS -> VQ` sibling cast and instead temporarily inherit `FrontComplDirectVS = variants {}` from the pinned `ExtendFunctor`.

**Evidence:** fix12 compiled its changed scaffolding module, but GF 3.12 still crashed at the exact same `FrontComplDirectVS` PMCFG step immediately after `FrontComplDirectVQ` completed.

**Why this is safer:** `VS` and `VQ` share a visible Albanian `Verb` representation, but they remain distinct abstract categories and compiled lock markers. The Albanian helper-reuse policy and Compendium retyping rules do not justify treating them as interchangeable merely because the visible record shape matches.

**Functional scope:** remove exactly `FrontComplDirectVS` from the local subtraction list and remove exactly its local wiring. Leave the helper source present but unused so the experiment is reversible. Do not change the adjacent passing `FrontComplDirectVQ`.

**Pass condition:** verbose GF prints a completed empty/inherited PMCFG tuple for `FrontComplDirectVS` and advances.

**Failure condition:** if GF still crashes on the same symbol, stop Albanian realization edits and create a minimal GF/backend reproducer.

---
## ALB-DEC-036
**Status:** provisional  
**Area:** `ExtendSqi` / `FrontComplDirectVS` / exact-typed minimization  
**Decision:** Promote the fix13r diagnostic result to evidence, restore Albanian ownership of `FrontComplDirectVS`, and test the smallest non-empty realization using only `PredVP np (UseV <lin V vs : V>)`, with `Utt` intentionally ignored.

**Evidence — run `20260918_140731`:**
- inherited `FrontComplDirectVS = variants {}` completes as `+ FrontComplDirectVS 9 (0,0)`;
- GF advances through many later declarations;
- the next observed hard failure is `PossPronRNP`, proving the previous `FrontComplDirectVS` position is no longer intrinsically fatal.

**Reasoning:** This isolates the non-empty realization while preserving the exact abstract categories. The probe avoids the prohibited `VS -> VQ` cast and removes every reported-speech augmentation that was present in the failing fix12 helper.

**Functional realization:**
```gf
sc_FrontComplDirectVS : NP -> VS -> Utt -> Cl =
  \np,vs,_ ->
    PredVP np (UseV <lin V vs : V>) ;
```

**Pass condition:** verbose GF completes `FrontComplDirectVS` with a non-zero tuple and advances.

**Failure condition:** if GF crashes again at `FrontComplDirectVS`, stop adding surface material and construct a minimal GF 3.12 reproducer for the exact non-empty constructor path.

**Linguistic status:** incomplete by design; `Utt` is temporarily ignored only for compiler localization.

---
## ALB-DEC-037
**Status:** compiler-confirmed / linguistically provisional  
**Area:** `ExtendSqi` / `FrontComplDirectVS` / exact helper reuse  
**Decision:** Promote fix14 as PMCFG-confirmed and reintroduce `Utt` by composing two exact-typed Albanian paths: `sc_ComplDirectVS : VS -> Utt -> VP` followed by `PredVP : NP -> VP -> Cl`.

**Compiler evidence — run `20260918_153252`:**
- `+ FrontComplDirectVQ 9 (1,1)`
- `+ FrontComplDirectVS 9 (1,1)`
- compiler advances to `PossPronRNP 324`, where the next hard backend crash occurs.

**Functional realization:**
```gf
sc_FrontComplDirectVS : NP -> VS -> Utt -> Cl =
  \np,vs,utt ->
    PredVP np (sc_ComplDirectVS vs utt) ;
```

**Why:** fix14 proves the non-empty `PredVP` + `UseV` skeleton is safe. `sc_ComplDirectVS` already composes `UseV` and `AdvVP` and its public `ComplDirectVS` wiring completes PMCFG. Reusing it is therefore more evidence-preserving than reconstructing a `Cl` string or inventing a category cast.

**Pass condition:** `FrontComplDirectVS` remains a completed non-zero PMCFG entry and the run reaches the later blocker again or progresses beyond it.

**Linguistic status:** still provisional. The function now consumes `Utt`, but the final fronted direct-speech order/punctuation must be validated separately after structural compilation stabilizes.

---

## ALB-DEC-038
**Status:** accepted structural result / active blocker handoff  
**Area:** `ExtendSqi` / `FrontComplDirectVS` confirmation / `PossPronRNP` PMCFG localization  
**Decision:** Freeze the fix15 compositional implementation of `FrontComplDirectVS` as the current structurally accepted path, keep its linguistic direct-speech status provisional, and move the first-hard-blocker investigation to `PossPronRNP`.

**Compiler evidence — run `20260918_153932`:**
- `+ ComplDirectVQ 1 (1,1)`
- `+ ComplDirectVS 1 (1,1)`
- `+ FrontComplDirectVQ 9 (1,1)`
- `+ FrontComplDirectVS 9 (1,1)`
- GF advances through the remaining middle section and then prints `+ PossPronRNP 324` before the `GeneratePMCFG.hs` non-exhaustive-pattern crash.
- no `missing lock_*` warning occurs in this run.
- six boundary warnings remain: no linearization of `Base/Cons/ConjComp` and `Base/Cons/ConjImp`.

**Accepted structural path:**
```gf
sc_FrontComplDirectVS : NP -> VS -> Utt -> Cl =
  \np,vs,utt ->
    PredVP np (sc_ComplDirectVS vs utt) ;
```

**What this proves:**
- the exact-typed `NP -> VS -> Utt -> Cl` Albanian composition is PMCFG-safe in the current source state;
- the earlier `lin Cl` / manual surface-rewrite path is no longer needed for structural compilation;
- compiler acceptance does **not** validate the final Albanian order, quoting, or punctuation of fronted direct speech.

**Next evidence gate — `PossPronRNP`:**
1. exact abstract signature `Pron -> Num -> CN -> RNP -> NP`;
2. current Albanian `Pron`, `Num`, `CN`, `RNP`, and `NP` contracts;
3. current `ExtendSqiRNP.gf` implementation and owner/wiring;
4. Albanian core possessive constructors and their module availability;
5. exact inherited/functor status;
6. target NP producer/consumer requirements;
7. compatible model-language corroboration only after the target contract is fixed.

**Do not:**
- reopen `FrontComplDirectVS` merely because `ExtendSqi` still fails later;
- flatten `PossPronRNP` to a surface-only NP record;
- patch functions after `PossPronRNP` before the first independent blocker is advanced;
- treat the six Comp/Imp warnings as permission for piecemeal coordinator reintroduction.

---

## ALB-DEC-039
**Status:** provisional / compile probe pending  
**Area:** `ExtendSqiRNP` / `PossPronRNP` / rich NP construction  
**Decision:** Replace the manual `lin NP` implementation of `PossPronRNP` with the existing Albanian noun-constructor chain:

```gf
rnp_PossPronRNP : CatSqi.Pron -> Num -> CN -> NP -> NP =
  \pron,num,cn,rnp ->
    DetCN
      (DetQuant (PossPron pron) num)
      (PossNP cn rnp) ;
```

**Evidence:**
- exact abstract signature: `Pron -> Num -> CN -> RNP -> NP`;
- pinned `ExtendFunctor` maps `RNP` to `Grammar.NP` but has no `PossPronRNP` implementation;
- Albanian core `NounSqi` already defines `PossPron`, `DetQuant`, `PossNP`, and `DetCN`;
- the returned Albanian `NP` is rich (`Case => Str` plus `Agr`), so direct final-record reconstruction should be avoided when the core constructor path exists;
- Bulgarian, German, and Swedish at the pinned RGL revision independently use the same high-level `DetCN (DetQuant (PossPron ...)) (PossNP ...)` architecture.

**Why the old implementation is suspect:** it manually concatenates pronoun, noun, and RNP surfaces and sets `a = pron.a`. That makes the agreement of the whole possessed NP follow the possessor pronoun rather than the possessed nominal head. The Albanian `DetCN` path derives agreement from `cn.g` and `num.n`, which is the current core nominal contract.

**Scope:**
- change only `rnp_PossPronRNP` functionally;
- do not change coordinator wiring;
- do not patch the next PMCFG declaration until this probe is rerun;
- do not flatten the returned `NP`.

**Compiler status:** not run after change.

**Pass condition:** verbose GF prints a completed PMCFG tuple for `PossPronRNP` and advances.

**Linguistic status:** provisional until targeted Albanian possessive/RNP examples validate surface order, genitive linking, case behavior, and agreement.

---

## ALB-DEC-040
**Status:** provisional / compile probe pending  
**Area:** `ExtendSqi` / `SlashBareV2S` / inheritance restoration  
**Decision:** Promote fix16 as PMCFG-confirmed, then stop locally overriding `SlashBareV2S` and inherit the pinned `ExtendFunctor` implementation `SlashBareV2S = SlashV2S`.

**Compiler evidence — run `20260918_205422`:**
- `+ PossPronRNP 324 (28,28)` confirms fix16 structurally;
- GF advances through later entries and then stops at `+ SlashBareV2S 1` with the same `GeneratePMCFG.hs` non-exhaustive-pattern crash;
- no `missing lock_*` cluster appears;
- the six `Base/Cons/ConjComp` and `Base/Cons/ConjImp` warnings remain separate boundary work.

**Exact contract:**
```gf
SlashBareV2S : V2S -> S -> VPSlash ;
```

**Pinned inherited path:**
```gf
SlashBareV2S = SlashV2S ;
```

**Albanian core evidence:** `VerbSqi.SlashV2S` already returns `VPSlash` through the core verb/slash path and includes `v2s.c2.s`. The local scaffolding helper instead fabricates a fresh `lin VPSlash {s = ...}` and omits that complement material.

**Architecture rationale:** Albanian policy says to inherit by default and override only with evidence of a real language-specific divergence. Here the inherited function has the exact signature and points directly at an existing Albanian core constructor, so the local override has no remaining burden-of-proof justification.

**Functional scope:**
- remove only `SlashBareV2S` from the subtraction list;
- remove only its local coordinator wiring;
- keep `sc_SlashBareV2S` source temporarily untouched for reversibility;
- do not modify the next PMCFG declaration in the same probe.

**Compiler status:** not run after fix17.

**Pass condition:** verbose GF prints a completed PMCFG tuple for `SlashBareV2S` and advances.

**Linguistic status:** provisional until targeted V2S/slash examples validate Albanian complement placement and saturation behavior.

---

## ALB-DEC-041
**Status:** provisional / family compile probe pending  
**Area:** `ExtendSqi` / `ExtendSqiScaffolding` / `Comp` + `Imp` list boundaries  
**Decision:** Promote fix17 as PMCFG-confirmed, then implement `Base/Cons/ConjComp` and `Base/Cons/ConjImp` together as one Albanian string-list family in `ExtendSqiScaffolding`, with exact `ListComp` / `ListImp` retyping kept in the thin coordinator.

**Compiler evidence — run `20260918_210629`:**
- `+ SlashBareV2S 1 (1,1)` confirms fix17 structurally;
- GF continues through the remaining named entries and reaches `+ youPolPl_Pron 1 (1,1)`;
- the backend then crashes during final PMCFG generation;
- no final `ExtendSqi.gfo` is produced; only `ExtendSqi.gfo.tmp...` remains;
- the six `no linearization` warnings for `Base/Cons/ConjComp` and `Base/Cons/ConjImp` are still present.

**Target-category evidence:**
- `CatSqi.Comp = {s : Str}`;
- `CatSqi.Imp = {s : Str}`;
- `CatSqi.Conj = {s : Str}`;
- `ExtendSqi` already declares `[Comp] = {init,last : Str}` and `[Imp] = {init,last : Str}`;
- `ConjunctionSqi` already implements the same Base/Cons/Conj string-list architecture for `S`, `Adv`, `AdV`, `IAdv`, and `RS`.

**Inheritance evidence:** pinned `ExtendFunctor` has no implementation for these six functions, so this is not an inheritance-restoration case like fix17.

**Implementation rule:**
- implement all six or none;
- family logic belongs in `ExtendSqiScaffolding.gf`;
- `ExtendSqi.gf` contains only exact-category wiring and `lin ListComp` / `lin ListImp` boundary retyping;
- do not add dummy strings, `variants {}`, cross-category casts, or direct category redesign;
- keep VPS/VPI/VPS2/VPI2 ownership inherited and untouched.

**Compiler status:** not run after fix18.

**Acceptance:**
1. all six missing-linearization warnings disappear;
2. no new category/lock warning appears;
3. if `ExtendSqi.gfo` is produced, fix18 is a strong root-cause candidate;
4. if the warnings disappear but the final PMCFG crash remains, keep the family only if structurally clean and continue backend minimization.

**Linguistic status:** provisional; compile success does not validate Albanian coordination semantics.

---

## ALB-DEC-042
**Status:** accepted / current operational reset  
**Date:** 2026-09-21  
**Area:** whole-language compiler recovery after mega-update

**Decision:** Supersede the pre-FIX22C fix17/fix18 repair order as the active work sequence. Treat FIX22C as the last known compiler-stable historical baseline and route the current mega-update through syntax-integrity recovery, Global Scan causality classification, compiler-baseline restoration, and only then linguistic/capability completion.

**Evidence — Wordbench run `20260921_151446`:**
- 47 language-folder `.gf` files scanned;
- 5 PASS, 42 FAIL, 0 ERROR, 0 TIMEOUT;
- every failed compilation currently reports the same first dependency error at `ResSqi.gf:347:7`;
- GF diagnostic: `Unexpected token ']'`, `Expected: String`;
- scenarios seen: 0;
- automatic scan does not yet include `SyntaxSqi.gf`, `ConstructorsSqi.gf`, `SymbolicSqi.gf`, or `TrySqi.gf` in the parent source directory.

**Consequence:** the 42 failures are not accepted as 42 independent Albanian bugs. `ResSqi` is the first confirmed direct blocker; downstream counts must be reclassified as evidence improves.

**Operational authority:** `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`.

---

## ALB-DEC-043
**Status:** accepted syntax invariant / model-language corroboration  
**Date:** 2026-09-21  
**Area:** GF notation integrity

**Decision:** Enforce the following notation distinction before any category or linguistic redesign:

```gf
\x -> expr       -- ordinary function abstraction
\\x => expr      -- table abstraction
"" => expr       -- empty Str pattern
_ => []          -- empty surface result
```

**Current source evidence:** `ResSqi.teWithClitic` uses `[] =>` while its scrutinee is `Str`, producing the current first parser error. `VerbSqi` contains two additional visible `[] =>` sites whose scrutinees are also `Str` and must be checked after the dependency blocker is removed.

**Static-scan evidence:** 139 `single_slash_eq` hits across 17 files and 9 `untyped_case_str_pat` hits require typed review.

**Model-language corroboration:** the supplied model-language bundle contains extensive double-backslash table abstractions and ordinary `->` lambdas, but no single-backslash `\x =>` form and no `[] =>` pattern in the supplied sources. This confirms an engineering convention; it does not establish Albanian linguistic realization.

**Repair rule:** never perform a blind global replacement. The local expected type or case-scrutinee type must justify each syntax edit.

---

## ALB-DEC-044
**Status:** accepted / ownership decision reopened; final owner pending evidence  
**Date:** 2026-09-21  
**Area:** `ExtendSqi` / VPS-VPI-VPS2-VPI2 family ownership

**Decision:** The old inheritance-only prescription from ALB-DEC-022/033 is no longer an unconditional rule for the post-mega-update source. The current source has explicitly reopened the entire VPS/VPI/VPS2/VPI2/list family by subtracting it from `ExtendFunctor`, declaring local richer lincats, and implementing the family in `ExtendSqi.gf`. That source fact does **not** by itself make local ownership correct.

**Current source contradiction:** the same `ExtendSqi.gf` still contains header commentary saying the family remains inherited. Therefore comments, subtraction/wiring, and architecture docs are not aligned.

**Final decision boundary after compiler recovery:**

1. choose **INHERIT** if the exact `ExtendFunctor` family is category-correct, sufficiently covered, and behaviorally adequate for Albanian; or
2. choose **LOCAL_COMPANION** if exact Albanian lincats and linguistic behavior require richer agreement/complement/clitic/embedded-verbal structure. In that case substantive family logic belongs in a dedicated companion such as `ExtendSqiVPS.gf`, while `ExtendSqi.gf` stays a thin coordinator.

**Not allowed:**
- treating current coordinator-local code as accepted merely because it exists;
- reverting to inheritance merely because the pre-FIX22C experiment compiled farther;
- mixed one-off ownership across family members without an explicit typed boundary reason;
- deciding the family while lower-level syntax corruption still prevents a meaningful current compiler/PMCFG comparison.

**Evidence required for closure:**
- syntax/compiler baseline restored;
- exact abstract and `ExtendFunctor` coverage inspected;
- current Albanian lincats/producers/consumers inspected;
- both ownership alternatives evaluated at the family boundary when necessary;
- clean PMCFG/compile result;
- targeted Albanian scenarios for agreement, complementation, coordination, clitic interaction, and embedded verbal behavior.

**Supersedes:** ALB-DEC-022/033 only as **unconditional current ownership prescriptions**. Their historical compiler observations remain valid provenance for the snapshots on which they were recorded.

---


## ALB-DEC-045
**Status:** accepted for candidate validation  
**Date:** 2026-09-21  
**Area:** deferred VP representation / PMCFG boundary

**Decision:** Narrow `VP.cl` and `VPSlash.cl` from `Agr => Str` to `Str`, while retaining agreement-sensitive post-verbal material as `post : Agr => Str`.

**Evidence — Wordbench run `20260921_192039`:**
- candidate (9): 22 PASS / 25 FAIL;
- the dominant `GeneratePMCFG` trace at `ComplVV`, `EmbedVP`, `RelVP`, `UttVP`, `GenericCl`, and every importer shows PMCFG descending through `CProj ... "cl"` indexed by an `Agr` record;
- the crash is therefore tied to representation complexity at the clitic field, not to the former parse blocker;
- object clitic choice is determined by the saturated object (Acc/Dat/person-number), not by later subject agreement.

**Implementation in candidate (10):**
```gf
VP = {
  v : Verb ;
  cl : Str ;
  post : Agr => Str
} ;
```

The same narrowing applies to `VPSlash`. `appendClitic`/`addClitic` now concatenate fixed strings. Agreement-sensitive AP/complement material remains in `post`.
All legacy consumers were migrated to the narrowed field, including progressive/self VP updates and `ExtendSqiVPBridge` / `ExtendSqiScaffolding`; no `.cl ! agr` projection remains in candidate (10).

**Additional fixes from the same run:**
- open `Prelude` in `NamesSqi` for `Bool` constants;
- open `ResSqi` in `StructuralSqiClause` for Albanian `Case` constructors;
- replace underconstrained anonymous resource tables in `StructuralSqiNominal` with explicit case/gender tables;
- expose `StructuralSqiVerbal.mkVConst` as the invariant-verb helper required by the expanded lexicon;
- simplify `QuestionSqi.QuestIComp` and `ConstructionSqi.have_name_Cl` to avoid unnecessary intermediate VP record updates that produced `evalTerm ([])` backend crashes.

**Acceptance:** rerun GF 3.12 Global Scan. The decision is retained only if the `CProj "cl"` PMCFG crash disappears without introducing a type/category regression.


## ALB-DEC-046
**Status:** accepted for candidate validation  
**Date:** 2026-09-21  
**Area:** PMCFG-safe clitic/subjunctive representation

**Decision:** Supersede ALB-DEC-045's assumption that narrowing `cl` to `Str` is sufficient. Preserve `cl : Str`, but add `subjcl : Str` to `VP` and `VPSlash` and pre-resolve the `të` + object-clitic surface form when the clitic is introduced.

**Evidence — Wordbench run `20260921_200140`:**
- candidate (10): 24 PASS / 23 FAIL;
- every remaining VP-related PMCFG crash still has `descend (... CProj ... "cl" ...)`;
- direct failures appear at `ComplVV`, `GenericCl`, `UttVP`, `QuestQVP`, `RelVP`, and `EmbedVP`;
- those consumers all eventually call `teWithClitic(vp.cl)`, whose implementation performs `case` over a projected runtime `Str`.

**Candidate (11) representation:**
```gf
VP = {
  v : Verb ;
  cl : Str ;
  subjcl : Str ;
  post : Agr => Str
} ;
```

`subjcl` is computed from grammatical object information, not by inspecting a string later. Accusative/dative agreement helpers produce `ta`, `t'i`, `t'u`, or uncontracted `të + clitic` as appropriate; reflexive `u` carries `t'u`. Progressive/self updates preserve the previous candidate's surface ordering without a dynamic string case.

**Additional candidate (11) fixes from the same run:**
- explicit constant tables for `left_Ord` and `right_Ord`;
- explicit nested table for `which_IQuant`;
- structural prepositions use `ResSqi.Compl`/`mkCompl` to avoid `Prep` overload ambiguity.

**Acceptance:** rerun GF 3.12 Global Scan. ALB-DEC-046 is confirmed only if the `CProj "cl"` family disappears and no new clitic-placement regression is introduced.

---

## ALB-DEC-047
**Status:** accepted for candidate validation  
**Date:** 2026-09-21  
**Area:** Albanian verbal morphology / `Verb` → `VP` PMCFG boundary

**Decision:** Make finite subjunctive morphology an explicit field of `ResSqi.Verb`, and copy the complete currently represented verbal form inventory into `VP`/`VPSlash` at the lexical boundary. Syntax may select an already-structured subjunctive form; it must not reconstruct subjunctive morphology by inspecting an indicative surface string.

**Evidence — Wordbench run `20260921_201720`:**

- candidate (11): `27 PASS / 20 FAIL` over the 47 automatically discovered language-folder targets;
- the former `CProj ... "cl"` PMCFG signature is gone, confirming the clitic-specific part of ALB-DEC-046;
- the dominant new backend trace is:

```text
CProj "Indicative" (CProj "v" ...)
  -> Pres
  -> Sg
  -> P1
```

- the trace occurs first at `ComplVV` and is reproduced through `GenericCl`, `UttVP`, `QuestQVP`, `RelVP`, `EmbedVP`, and importers;
- those consumers share the old `subjunctiveFinite vp.v a` path;
- `subjunctiveFinite` derived 2sg/3sg forms by `case` analysis over `v.Indicative ! Pres ! Sg ! P1` / P2 strings.

**Representation in candidate (12):**

```gf
Verb = {
  Indicative       : Tense => Number => Person => Str ;
  Subjunctive      : Number => Person => Str ;
  Imperative       : Number => Str ;
  participle       : Str ;
  pres_optative    : Number => Person => Str ;
  perf_optative    : Number => Person => Str ;
  pres_admirative  : Number => Person => Str ;
  imperf_admirative: Number => Person => Str
} ;
```

The existing productive/irregular subjunctive rules are retained by `subjunctiveFromPresent`, but they execute when morphology builds a `Verb`. Every generated/paradigm verb record supplies `Subjunctive` explicitly. `subjunctiveFinite` is reduced to a compatibility selector over this table.

`VP` and `VPSlash` no longer carry `v : Verb`. They copy the structured tables/forms required by syntax:

```gf
indicative        : Tense => Number => Person => Str ;
subjunctive       : Number => Person => Str ;
imperative        : Number => Str ;
participle        : Str ;
pres_optative     : Number => Person => Str ;
perf_optative     : Number => Person => Str ;
pres_admirative   : Number => Person => Str ;
imperf_admirative : Number => Person => Str ;
cl, subjcl        : Str ;
post              : Agr => Str ;
```

This preserves all verbal dimensions currently carried by `Verb`; it is not a broad flattening into strings.

**Model-language corroboration:**

- Romanian encodes conjunctive/subjunctive morphology directly in its verb-form table (`Subjo SPres Number Person`) and `ComplVV` selects it from the structured VP representation.
- Bulgarian builds VP structure with `predV`/`daComplex` and keeps clitic/complement state separate rather than inferring mood from a realized indicative string.
- Greek retains a lexical verb inside VP but its morphology itself encodes `Mood`; `ComplVV` selects `VPres Con ...` directly. This shows that keeping a verb record is not inherently wrong; the rejected Albanian pattern is the late string-derived mood reconstruction plus the failing nested projection in the current GF 3.12 backend.
- German similarly centralizes verbal realization in VP helper APIs (`predV`, `useVP`, `useInfVP`) rather than reconstructing lexical mood in each consumer.

Model evidence is engineering corroboration only; Albanian morphology and reference material remain the authority for actual forms.

**Independent same-run repair:** `LexiconSqi.distance_N3` must call the two-argument `mkPrep` overload with explicit case government (`nga` + Ablative; `deri në` + Accusative), eliminating the remaining ambiguous overload failure without discarding complement typing.

**Candidate-(12) structural preflight:** the migration was audited over all 135 `lin V` blocks in `MorphoSqi`. A bulk-edit defect that had inserted 51 extra record openings before `Subjunctive` was detected before packaging and repaired; brace/parenthesis balance is now zero and all 135 blocks contain `Indicative`, `Subjunctive`, and `Imperative`. `gf_morphosqi_lint.py` now enforces those invariants. This is source-structure evidence only, not GF compiler acceptance.

**Acceptance gate:** rerun GF 3.12 Global Scan. ALB-DEC-047 is confirmed only if the `CProj "Indicative" (CProj "v" ...)` PMCFG family disappears and no new missing-field/type failure is introduced in `MorphoSqi`, `ParadigmsSqi`, `IrregSqi`, `VerbSqi`, or their importers.

**Supersedes:** the old implementation detail inside ALB-DEC-046 that still allowed syntax to call a string-reconstructing `subjunctiveFinite`. ALB-DEC-046 remains accepted for the clitic/subjcl boundary it successfully fixed.
