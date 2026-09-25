# MorphoDictSqi MAX — C2 final engineering candidate — 2026-09-25

This directory documents and reconstructs the **Albanian morphological dictionary workstream (C2)**. It is governed by the consolidated Albanian RGL v2 documentation and the MorphoDictSqi MAX contracts.

## Current C2 result

The starting snapshot contained **592** MorphoDict functions, including **155 `compile-safe-placeholder` N/A/V entries**. Those placeholders were not linguistic analyses.

Campaign `CMP-C2-MAX-20260925` removes that ambiguity:

- **123 / 155** placeholder entries are resolved to an **existing explicit numbered Albanian morphology class** (`mkN###`, `mkA###`, `mkV###`) because that class reproduces every recorded Tosk surface form available for the lemma and, for nouns, agrees with recorded gender.
- **32 / 155** cannot be uniquely justified. They are removed from the active MorphoDict and retained in machine-readable blocked/conflict queues.
- active MorphoDict: **560 lemgrams**;
- active compile-safe N/A placeholders: **0**;
- `variants`: **0**;
- active multiwords: **0**;
- source-universe candidate records: **7,079**, all terminally classified as pending/blocking/excluded in this campaign;
- static MAX validator: **27/27 PASS**;
- native GF 3.12 / Wordbench rerun: **required externally; not claimed here**.

The reduction from 592 to 560 is deliberate: a smaller dictionary with explicit blockers is preferred to a larger dictionary containing invented invariant inflection.

## Certification boundary

This campaign establishes static C1/C2 engineering facts only. It does **not** promote entries to C6. C6 requires native GF compilation/table introspection, evidence matching at GF feature level, linguistic review, and the global Wordbench regression gate.

`docs/morphodict/METRICS.json` is the machine-readable status source.

## Canonical build inputs

- `resources/morphodict/BASELINE_LEMGRAMS_20260925.jsonl` — immutable reconstruction input for the 592-entry starting state;
- `resources/morphodict/TOSK_REFERENCE_LEMMAS.tsv` — supplied Tosk observations already present in the project;
- `docs/morphodict/RGL_LEXICON_MAPPING.csv` — current RGL lexical mapping;
- `resources/dictionary/albanet_unique_pos_lemma_synset.tsv` — Albanet/OMW candidate inventory; lemma/POS is **not** treated as inflectional evidence.

## Rebuild

```text
python tools/morphodict/build_morphodict_max.py --apply
python tools/morphodict/map_tosk_features.py
python validation/morphodict/validate_morphodict_max.py
```

Two consecutive builds from the locked baseline produce identical hashes for the generated MorphoDict, coverage, provenance, queues and metrics.

`MorphoDictSqi.config` remains only a compatibility/bootstrap file. Its one-form `mkN/mkA/mkV` rules are **not certification rules**.

## Machine-readable artifacts

### Active state
- `resources/morphodict/LEMGRAMS.jsonl`
- `docs/morphodict/COVERAGE.csv`
- `docs/morphodict/COVERAGE.json`
- `docs/morphodict/METRICS.json`
- `docs/morphodict/DEPENDENCIES.jsonl`
- `docs/morphodict/PARADIGM_REGISTRY.yaml`

### Sources / evidence
- `resources/morphodict/SOURCES.yaml`
- `resources/morphodict/SOURCE_UNIVERSE.yaml`
- `resources/morphodict/CANDIDATES.jsonl`
- `resources/morphodict/EVIDENCE.jsonl`
- `docs/morphodict/FEATURE_MAPPING.tsv`

### Review / escalation
- `docs/morphodict/BLOCKED.csv`
- `validation/morphodict/review_queue.tsv`
- `validation/morphodict/blocked_review_queue.tsv` — 27 C2 evidence-ambiguity cases
- `validation/morphodict/missing_paradigms.tsv` — reserved for **proven** missing productive classes; empty in this static campaign
- `validation/morphodict/core_escalation_candidates.tsv` — 2 narrow C1 triage candidates, not yet asserted as missing classes
- `validation/morphodict/source_conflicts.tsv`
- `validation/morphodict/GOLD_MORPHOLOGY_CANDIDATES.tsv` — proposed evidence rows only; C10 owns gold acceptance
- `validation/morphodict/GF_TABLE_INTROSPECTION_REQUEST.tsv`

## Native gate runner

The final engineering candidate includes `tools/morphodict/run_native_certification.py` and `docs/morphodict/NATIVE_CERTIFICATION_RUNBOOK.md`. The runner verifies the locked GF/Wordbench versions, executes the 27/27 static gate, then runs Wordbench Diagnostic Global Scan and release validation in fail-closed mode. It does not grant C6 automatically.

The current build environment was tested with that runner: RGL root PASS, Wordbench 1.3.4 PASS, C2 static PASS, GF availability FAIL because no `gf` executable is installed. The machine-readable result is under `docs/morphodict/campaigns/CMP-C2-MAX-20260925/native_gate/`.

## Final gates still external

The supplied execution environment has no `gf` executable. Therefore the following must be run in the maintainer GF 3.12 / Wordbench 1.3.4 environment before this candidate can become a certified release:

1. compile `MorphoDictSqi.gf` and its abstract;
2. obtain native table introspection for the active 560 entries;
3. compute TSIG-1 signatures and check table duplicates;
4. reconcile all Tosk feature mappings and review queues;
5. rerun the full Albanian census and required scenarios;
6. establish **58/58 + 52/52** (or document any approved denominator migration) with no existing gold regression;
7. C10 accepts morphology golds/reviews before any C6 promotion.

## Ownership boundaries

C2 owns MorphoDict lemgrams, source universe, morphology provenance and dictionary generation. Missing productive morphology classes are not implemented locally here: they are emitted to `missing_paradigms.tsv` for C1 (`MorphoSqi`/`ParadigmsSqi`). Gold acceptance remains C10-owned.
