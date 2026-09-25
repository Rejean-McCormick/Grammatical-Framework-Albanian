# MorphoDictSqi MAX — C2 final engineering delivery

**Campaign:** `CMP-C2-MAX-20260925`  
**Date:** 2026-09-25  
**Owner:** C2 / MorphoDictSqi  
**Canonical documentation:** `Albanian_RGL_Total_Documentation_v2_CompendiumAligned_20260925`  
**Declared baseline:** `albanian-s02-green-20260925` / GF 3.12 / Wordbench 1.3.4 / 58 targets / 52 scenarios

## Delivery boundary

This is the final **C2 engineering candidate** that can be established from the supplied sources in the current execution environment. It removes compile-safe placeholder morphology from the active MorphoDict surface, resolves every placeholder that can be supported by the supplied Tosk evidence plus an existing numbered Albanian morphology class, terminally classifies the complete supplied source universe, and supplies the reproducible C2 build/validation/review pipeline.

It is **not** labelled linguistically final or C6-certified because this environment does not contain the GF 3.12 executable and therefore cannot execute the native compile/table-introspection/Wordbench gates required by the canonical certification ladder.

## Before / after

| Metric | Before | Candidate |
|---|---:|---:|
| active MorphoDict lemgrams | 592 | 560 |
| compile-safe N/A/V placeholders | 155 | 0 |
| placeholders resolved to existing explicit class | 0 | 123 |
| unresolved placeholders retained as fake inflection | 155 | 0 |
| unresolved candidates moved to blocked queues | 0 | 32 |
| `variants` | 0 | 0 |
| active unwaived multiwords | 0 | 0 |
| active unprovenanced entries | not machine-gated | 0 |
| C6 claimed by static analysis | — | 0 |

The active count decreases because 32 entries did not have sufficient evidence for a defensible table. Removing them is intentional: MorphoDictSqi MAX does not preserve an unproved public symbol by fabricating an invariant inflection.

## Placeholder resolution

The 155 former placeholders were evaluated against all recorded Tosk forms and the current numbered classes in `MorphoSqi`.

- 123 resolve to an existing explicit numbered class: **75 N, 32 A, 16 V**.
- 32 remain unresolved: **22 N, 3 A, 7 V**.
- of the 32 unresolved, 5 are source conflicts and 27 are insufficient-evidence C2 review cases.
- only `filloj` and `tjetër_N` have zero statically matching numbered class and are emitted as **C1 triage candidates**, not as proven missing paradigms.
- `missing_paradigms.tsv` is intentionally empty because this campaign does not possess enough evidence to assert a new productive core class.

Representative recovered entries:

```gf
  aeroport_N = mkN005 "aeroport" ;
  breg_N = mkN096 "breg" ;
  mashkull_N = mkN257 "mashkull" ;
  barabartë_A = mkA013 "barabartë" ;
  tjetër_A = mkA025 "tjetër" ;
  bazohem_V = mkV041 "bazohem" ;
  kryej_V = mkV042 "kryej" ;
```

## Source-universe completion

The supplied C2 source universe contains **7,079 candidate records** and has **0 unclassified records**. Every record is terminally classified as active-pending-certification, blocked, or excluded with reason.

Current terminal states:

- `BLOCKED_CERTIFICATION_PENDING`: 809
- `BLOCKED_INSUFFICIENT_EVIDENCE`: 4,424
- `BLOCKED_SOURCE_CONFLICT`: 5
- `EXCLUDED_MULTIWORD`: 1,831
- `EXCLUDED_CATEGORY`: 5
- `EXCLUDED_RGL_MAPPING`: 5

The final Tosk coverage audit found only 16 Tosk lemma/category groups absent from the original 592-entry baseline; they are closed-category/dialect-analysis/multiword cases such as `Marker`, `Particle`, pronoun/determiner analyses, or `për në`. None provides a defensible new open-class N/A/V table that should bypass the normal review/certification pipeline.

## Active category inventory

`A 81; Adv 26; Conj 12; Det 6; IAdv 5; IDet 1; IP 4; IQuant 1; Interj 2; N 255; NP 5; PN 2; Predet 3; Prep 20; Pron 7; Quant 3; Subj 5; V 122`.

Total: **560**.

## Certification state

Static evidence can establish construction/provenance states, not native GF or linguistic certification:

- C1: 306
- C2: 254
- C3–C6: not claimed by this campaign
- C6: **0**

This is deliberate. The canonical ladder requires native GF compilation, evidence-to-cell matching, linguistic review, and global regression gates before C6.

## Code and pipeline delivered

### Generated GF surface

- `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf`
- `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf`
- `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.config`

The `.config` is explicitly compatibility/bootstrap-only; it is not a certification source.

### Reproducible build tools

- `tools/morphodict/build_morphodict_max.py`
- `tools/morphodict/morpho_static.py`
- `tools/morphodict/map_tosk_features.py`
- `tools/morphodict/generate_introspection_request.py`
- `tools/morphodict/compute_table_signatures.py`

### Machine-readable state

- `resources/morphodict/BASELINE_LEMGRAMS_20260925.jsonl`
- `resources/morphodict/SOURCES.yaml`
- `resources/morphodict/SOURCE_UNIVERSE.yaml`
- `resources/morphodict/CANDIDATES.jsonl`
- `resources/morphodict/EVIDENCE.jsonl`
- `resources/morphodict/LEMGRAMS.jsonl`
- `docs/morphodict/PARADIGM_REGISTRY.yaml`
- `docs/morphodict/DEPENDENCIES.jsonl`
- `docs/morphodict/METRICS.json`
- `docs/morphodict/FEATURE_MAPPING.tsv`
- `docs/morphodict/BLOCKED.csv`

### Review / handoff artifacts

- `validation/morphodict/review_queue.tsv`
- `validation/morphodict/blocked_review_queue.tsv`
- `validation/morphodict/source_conflicts.tsv`
- `validation/morphodict/missing_paradigms.tsv`
- `validation/morphodict/core_escalation_candidates.tsv`
- `validation/morphodict/GOLD_MORPHOLOGY_CANDIDATES.tsv`
- `validation/morphodict/GF_TABLE_INTROSPECTION_REQUEST.tsv`

## Validation performed

- MAX static validator: **27/27 PASS**.
- combined DictSqi + MorphoDictSqi static validation: **PASS**.
- DictSqi static validation: **PASS**.
- `MorphoSqi` heuristic lint: **0 findings**.
- deterministic double rebuild: **22/22 generated artifacts byte-identical**.
- 437 pre-existing non-placeholder expressions: preserved expression-for-expression.
- static source census remains **51 language + 5 API + 2 MorphoDict = 58**.
- required scenario file count remains **52**.

## Test migration

`validation/scenarios/alb-morphodict-smoke.gfs` previously referenced `armë_N`, one of the removed unproved placeholder symbols. It now uses evidence-resolved active lemgrams and adds probes for the recovered alternative-class cases. This is a C10 reconciliation item and must be accepted by the external Wordbench/C10 run; the baseline set still contains 52 scenarios.

## External gates still required

The following are explicitly **NOT EXECUTED** here because no native GF executable is installed:

1. `gf -make MorphoDictSqi.gf` under GF 3.12;
2. native table introspection for all 560 active entries;
3. TSIG-1 table-signature computation from native tables;
4. evidence-to-cell matching for C4;
5. C10 linguistic review / gold acceptance;
6. Wordbench 58/58 compile census;
7. Wordbench 52/52 baseline scenarios plus migrated MorphoDict smoke scenario;
8. regression against accepted golds.

A failure in any of these gates invalidates promotion; it must not be hidden with a new placeholder.

## Final C2 assessment

The C2 workstream is **engineering-complete for the supplied evidence**: no compile-safe placeholder remains active, the full candidate universe is classified, unresolved morphology is explicit, the build is deterministic, validation/review artifacts are machine-readable, and cross-workstream handoffs are bounded. Linguistic finality remains intentionally gated on native GF and C10 evidence.
