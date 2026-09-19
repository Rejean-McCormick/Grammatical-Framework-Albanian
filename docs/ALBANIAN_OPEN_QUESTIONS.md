# ALBANIAN_OPEN_QUESTIONS

**Date:** 2026-09-19  
**Phase:** Albanian RGL Completion  
**Baseline:** `albanian-rgl-core-v0.1.0`

## Purpose

This file tracks design or linguistic questions that are genuinely unresolved in the current Completion phase.

It is not a chronological repair log. Resolved compiler investigations belong in `ALBANIAN_DECISION_LOG.md`; the frozen release record belongs in `status/ALBANIAN_CORE_V0.1.0.md`.

Each open question must identify:

- the affected capability;
- what is already known;
- what remains unknown;
- what evidence decides it;
- what counts as closure.

The normative completed-system target is `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`. This file records unresolved design/linguistic questions; `CURRENT_REPAIR_STATE.md` records the live implementation cursor.

---

## Current priority order

```text
P0  verbal realization Architecture Gate
P0  finite VPS agreement / Temp / Pol
P0  Albanian VPI embedding strategy
P1  VV control / complement selection
P1  VPS2/VPI2 slash + clitic preservation
P1  VPS question / relative / coordination integration
P2  Structural DConj / must_VV cleanup
P2  ConstructionSqi linguistic refinement
P2  top-level Lang/All/Irreg/Markup completion
```

---

## Q1. What is the minimal Albanian deferred verbal representation?

**Priority:** P0  
**Capability:** `VP` / `Cl` / finite realization

### Known

- the compiler-stable core exists and should not be redesigned without behavioral evidence;
- current `UseV` historically selects an indicative present 3sg form too early;
- current `UseCl` historically ignores `Temp` and `Pol`;
- mature VPS behavior requires some grammatical information to survive beyond `UseV`;
- AI Compendium EP004 is directly applicable when later consumers still control realization.

### Unknown

- the smallest exact `VP` resource shape needed by Albanian;
- whether `Cl` itself should be a table over selected clause dimensions or should delegate to another resource-level clause record;
- which dimensions can be derived rather than stored;
- which operation is the final realization boundary for ordinary finite clauses.

### Evidence required

- producer/consumer map for `Verb`, `VP`, `Cl`, `Temp`, `Pol`, `Agr`;
- Wordbench `vps_agreement`;
- Wordbench `vps_temp_pol`;
- direct compiler regression after the smallest candidate change.

### Closure

Close when the minimum retained dimensions and the final consumer for each are documented, implemented, compiler-stable, and sufficient for the first finite VPS slice.

---

## Q2. What is the final Albanian `VPS` contract?

**Priority:** P0  
**Capability:** finite VPS

### Known

- historical `{s : Str}` VPS boundaries were stabilization scaffolding, not a final linguistic design;
- Bulgarian provides a strong structural model where `MkVPS` consumes tense/polarity and `VPS` remains open on agreement;
- English defines the required API coverage but is not an Albanian realization model.

### Working hypothesis

```text
MkVPS consumes the finite Temp/Pol context.
VPS remains open on subject agreement.
PredVPS supplies subject/agreement.
```

A shape conceptually similar to `{s : Agr => Str}` is a candidate only.

### Unknown

- whether Albanian needs additional order/mood/auxiliary dimensions at the `VPS` level;
- whether those dimensions belong in `VPS` or below it in the core verbal resource.

### Evidence required

- at least two subject-agreement cases;
- positive/negative polarity;
- materially distinct tense/anteriority examples;
- coordination behavior.

### Closure

Close when `MkVPS`, `PredVPS`, `BaseVPS`, `ConsVPS`, and `ConjVPS` share one accepted contract and their Wordbench scenarios pass.

---

## Q3. What is the productive Albanian `VPI` realization?

**Priority:** P0  
**Capability:** embedded/non-finite verbal construction

### Known

- no final VPS/VPI design was accepted before v0.1.0;
- historical `vp.s` values are often already finite present-3sg strings and therefore cannot by themselves establish correct VPI behavior;
- existing `për të`, `pa`, and `që të` VP-bridge strings are not proof of a general `VPI` contract;
- Balkan model languages show that embedded verbal constructions can remain agreement-sensitive and clause-like rather than simple infinitive strings.

### Unknown

- when standard Albanian uses `të` + finite/subjunctive morphology for the `VPI` functions in the current abstract API;
- whether multiple embedding strategies are needed;
- how agreement, polarity, anteriority, and clitics interact with the embedded construction;
- whether participial or other constructions belong to any `VPI` paths.

### Evidence required

- Albanian grammar/reference examples for representative governors;
- Wordbench `vpi_embedding`;
- representative `VV` examples;
- parse/control tests when ambiguity or attachment matters.

### Closure

Close when `MkVPI` has a linguistically justified realization contract and the list/coordination/VV consumers can reuse it without string reconstruction.

---

## Q4. Do Albanian `VV` lexemes select different complement forms or composition algorithms?

**Priority:** P1  
**Capability:** `ComplVPIVV` / generalized VV complementation

### Known

- the current structural `ComplGenVV` path compiles but historically ignores `Ant` and `Pol`;
- no accepted taxonomy for `want/can/must/begin` exists;
- `must_VV` remains a separate known structural/open-symbol issue;
- Compendium EP030 applies only if different governors select distinct typed embedded forms;
- EP033 applies only if semantic subclasses require different composition algorithms.

### Unknown

- whether one Albanian VPI strategy covers the relevant `VV` lexicon;
- whether some governors select different embedded forms;
- whether control/raising distinctions require explicit metadata;
- whether modal subclasses change polarity or clause construction.

### Evidence required

A small reviewed set of representative governors, initially including available equivalents of:

```text
want
can
must
begin/start
```

Do not infer the classes from English translations alone.

### Closure

Close when the simplest adequate strategy is known: one general composition path, EP030-style form selection, EP022-style control metadata, or EP033-style subclass dispatch.

---

## Q5. What information must `VPSlash` preserve for VPS2/VPI2?

**Priority:** P1  
**Capability:** unsaturated verbal complements

### Known

- the current shallow `VPSlash = {s : Str}` boundary cannot preserve rich complement metadata by itself;
- Albanian `Pron` already exposes `acc_clit` and `dat_clit`;
- historical `ComplSlash` realizes the object as a surface accusative NP;
- Romanian provides strong structural evidence for preserving complement government and clitic material separately until clause realization;
- Compendium EP005/EP020 are relevant only if Albanian ordering behavior demonstrates separately movable slots/clitic clusters.

### Unknown

- exact complement metadata required by Albanian `VPSlash`;
- direct/indirect-object case/government representation;
- full NP versus clitic choice;
- finite versus VPI clitic placement;
- reflexive interaction;
- whether clitic doubling or additional Albanian-specific conditions must be represented.

### Evidence required

Wordbench scenarios:

```text
vps2_object
vpi2_object
clitic_acc
clitic_dat
clitic_refl
```

plus Albanian reference examples.

### Closure

Close when saturation does not require recovering government or clitic information from an emitted string and the same contract supports finite and embedded contexts.

---

## Q6. How should `ResSqi` tense/mood parameters map to RGL `Temp`/`Ant`/`Pol` without provenance collisions?

**Priority:** P1  
**Capability:** verbal realization kernel

### Known

- FIX21 proved that same-named parameters from different modules can compile far enough to trigger PMCFG failure when used as table keys;
- `ResSqi` owns its own verbal tense distinctions;
- the public RGL layer supplies `Temp`, `Ant`, and `Pol` through shared interfaces.

### Unknown

- the exact centralized mapping from public clause-time semantics to Albanian morphological forms;
- which distinctions are morphological and which are periphrastic/particle-based;
- how mood/subjunctive behavior should be represented for VPI.

### Evidence required

- exact type provenance audit;
- named mapping functions with qualified parameter use where needed;
- tense/polarity scenario matrix.

### Closure

Close when there is one documented mapping boundary and no helper mixes incompatible parameter types by unqualified constructor names.

---

## Q7. What is the final interaction of VPS with questions and relatives?

**Priority:** P1

### Known

The abstract family requires:

```text
QuestVPS
SQuestVPS
RelVPS
```

### Unknown

- whether Albanian question/relative ordering requires additional deferred order information;
- whether the ordinary clause kernel is sufficient without special VPS fields.

### Evidence required

```text
vps_question
vps_relative
```

plus comparison with existing `QuestionSqi` / `RelativeSqi` behavior.

### Closure

Close when these functions reuse the finite kernel without duplicating a second verbal realization algorithm.

---

## Q8. Which Structural warnings still represent real Completion work?

**Priority:** P2

Known tracked items include:

```text
DConj-related legacy surface
must_VV
Prep/lock-related warnings when reproducible
```

`DConj` must first be checked against the current abstract RGL contract; stale abstract symbols should be removed rather than repaired as if still required.

`must_VV` must be revisited after the VV/VPI architecture is known, so that it is not “fixed” with a temporary surface-only construction.

### Closure

Each item is either removed as stale, implemented through the accepted architecture, or documented as a deliberate unsupported feature with a test.

---

## Q9. Which `ConstructionSqi` realizations are still surface-only fallbacks?

**Priority:** P2

### Known

`ConstructionSqi` compiles but some constructions remain simple/string-oriented.

### Required work

Classify each nontrivial construction as:

```text
linguistically validated
structurally plausible / needs golden
surface fallback / redesign required
```

Do not mix this audit into WP1 unless a construction directly blocks the verbal realization kernel.

### Closure

Representative construction families have Wordbench scenarios and no known shallow fallback is labeled as mature behavior.

---

## Q10. What remains for mature top-level RGL parity?

**Priority:** P2

Areas to revisit after the VPS/VPI family stabilizes:

- `IrregSqi` coverage;
- optional `MarkupSqi` integration if required by current RGL composition;
- `LangSqi` / `AllSqi` parity with the intended public surface;
- remaining `Extend` coverage gaps;
- broader scenario/golden corpus.

### Closure

Close only when module coverage and behavior tests justify the intended final Albanian RGL release target.
