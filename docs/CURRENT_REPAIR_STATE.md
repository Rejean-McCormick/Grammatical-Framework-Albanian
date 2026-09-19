# Albanian RGL — Current Development State

**Status:** live state — update after every evidence-changing Wordbench run or capability-gate transition  
**Date:** 2026-09-19  
**Phase:** Albanian RGL Completion  
**Baseline:** `albanian-rgl-core-v0.1.0`

---

## 1. Current state

The compiler-survival phase is complete.

The current verified core release gate is:

```text
StructuralSqi.gf    OK
GrammarSqi.gf       OK
LexiconSqi.gf       OK
ConstructionSqi.gf  OK
ExtendSqi.gf        OK
LangSqi.gf          OK
AllSqi.gf           OK
TestSqi.gf          OK
```

The historical GF 3.12 `GeneratePMCFG.hs` crash is resolved and the final `.gfo` files are produced for the release-gate targets.

Current conceptual state:

```text
FOUNDATION:            STABLE / FROZEN AT CORE v0.1.0
CORE IMPLEMENTATION:   SUBSTANTIAL
CORE RELEASE GATE:     PASS
EXTEND COMPILATION:    WORKING
PUBLIC AllSqi BUILD:   WORKING
SCENARIO REGRESSION:   PENDING
LINGUISTIC QA:         IN PROGRESS
FEATURE COMPLETION:    IN PROGRESS
FINAL RGL RELEASE:     NOT YET
```

There is therefore **no current compiler blocker that should drive development order**.

---

## 2. Validation limitation

The release-gate Wordbench runs were `quick` runs and still reported:

```text
Scenarios seen: 0
```

Therefore the v0.1.0 baseline proves compiler/structural stability, not full linguistic behavior.

The next evidence must come from registered behavioral scenarios and reviewed expected outputs.

---

## 3. Current highest-priority capability

The first completion target is the coherent family:

```text
VPS / VPI / VPS2 / VPI2
```

including:

```text
MkVPS
BaseVPS
ConsVPS
ConjVPS
PredVPS
QuestVPS
SQuestVPS
RelVPS

MkVPI
BaseVPI
ConsVPI
ConjVPI
ComplVPIVV

MkVPS2
BaseVPS2
ConsVPS2
ConjVPS2
ComplVPS2
ReflVPS2

MkVPI2
BaseVPI2
ConsVPI2
ConjVPI2
ComplVPI2
```

Inherited `(0,0)` entries are now classified as **completion gaps**, not compiler defects.

---

## 4. Current architecture evidence

The current core realizes verbal information too early for mature VPS/VPI behavior:

- `UseV` is historically known to collapse a verb to an indicative present 3sg surface form;
- `UseCl`/`UseQCl`/`UseRCl`/`UseSlash` historically ignore `Temp`/`Pol` at the final clause boundary;
- `VPSlash` is currently too shallow to guarantee preservation of open-complement government and clitic information.

This is sufficient evidence to begin an **Architecture Gate** before implementing the whole family.

The core freeze may be reopened only minimally and only when a Wordbench scenario proves the exact information-loss boundary.

---

## 5. Active work package

```text
WP1 — Verbal Realization Architecture Gate
```

Required deliverables:

1. producer/consumer map for `VP`, `Cl`, `VPSlash`, `Temp`, `Pol`, and `Agr`;
2. Wordbench scenario `vps_agreement`;
3. Wordbench scenario `vps_temp_pol`;
4. exact localization of the first information-loss boundary for each scenario;
5. minimal proposed verbal realization contract;
6. compiler regression through `ExtendSqi`, `LangSqi`, and `AllSqi` after any accepted change.

Do not implement all VPS/VPI functions before this gate is satisfied.

---

## 6. Model-language and Compendium guidance

Current comparison policy:

- **Bulgarian:** primary VPS/VPI structural model;
- **Greek:** secondary embedded/subjunctive-like realization comparison;
- **Romanian:** primary slash/clitic preservation stress model;
- **German:** segmented-realization complexity/stress model;
- **English:** coverage reference for the full `Extend` API.

Primary Compendium pattern:

```text
EP004 — deferred realization tables
```

Supporting patterns are activated only when Albanian evidence requires them:

```text
EP005  segmented clause/VP slots
EP019  single clause assembly point
EP020  clitic cluster flattening
EP021  polarity propagation
EP022  control and argument metadata
EP030  lexically selected non-finite complement forms
EP033  modal composition by semantic subclass
```

---

## 7. Current ownership rule

`ExtendSqi.gf` remains a thin coordinator.

Historical stabilization decisions that forced the VPS/VPI family to remain inherited were cycle-specific. During Completion, coherent Albanian ownership may be introduced **after** the Architecture Gate defines the family contract.

If local ownership is activated, the preferred extension-level owner is:

```text
ExtendSqiVPS.gf
```

Core verbal realization machinery still belongs in the appropriate core resource/syntax modules.

One-off local reintroduction of isolated VPS/VPI functions remains prohibited.

---

## 8. Wordbench execution policy

Wordbench remains the canonical harness.

Until the historical CLI composition issue is explicitly repaired, diagnostics may continue through the stabilized core API path:

```python
probe_language_path(...)
resolve_configuration(...)
execute_quick_run(...)
```

Direct GF probes are only for surgical isolation of a failure already observed through Wordbench.

Goldens are added only after linguistic review of deterministic scenario output.

---

## 9. Documentation update rule

When evidence changes:

- update this file for live state;
- update `status/ALBANIAN_IMPLEMENTATION_STATUS.md` when capability maturity changes;
- update `ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md` when stable ownership changes;
- append `ALBANIAN_DECISION_LOG.md` when accepted reasoning changes;
- update `ALBANIAN_OPEN_QUESTIONS.md` when a question is answered or reprioritized;
- do **not** rewrite `status/ALBANIAN_CORE_V0.1.0.md` for post-release work.

The governing Completion plan is:

```text
ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md
```
