# Albanian RGL — C07 Clause Syntax Final Maximum Locally Verifiable Candidate

**Date:** 2026-09-25  
**Scope:** Conversation 7 — complete clause syntax  
**GF target:** 3.12  
**Wordbench target:** 1.3.4  
**Declared baseline:** `albanian-s02-green-20260925`  

## Delivery status

C07 is implemented as a **final evidence-supported candidate under the current shared representations**. No `CatSqi` or `ResSqi` migration is included.

Implemented/finalized:

- one canonical ordinary-clause assembly kernel in `ClauseSqiRes`;
- complete shared `Sentence` / `Question` / `Relative` coverage: **41/41**;
- declarative and negative clause routing without duplicating TAM/clitic logic;
- direct polar and wh question framing with preserved government;
- ordinary subject/object/oblique relative framing;
- indicative/subjunctive embedding ownership cleanup;
- clausal-subject agreement repair for the attested family;
- `SentAP` complementizer ownership repair;
- explicit stranding APIs neutralized to pied-piping where their arguments make this representable;
- 52 required scenarios preserved;
- optional `alb-clause-final` campaign added with **18 SHA-locked CASEs**.

## Validation executed here

- C07 static validator: **PASS**;
- shared API coverage: **41/41**;
- Dict static validator: **PASS**;
- MorphoDict validator: **PASS**;
- combined Dict/MorphoDict validator: **PASS**;
- MorphoSqi lint: **0 findings**;
- Python compileall: **PASS**;
- baseline→candidate whitespace/diff check: **PASS**;
- Wordbench direct scenario-contract validation: **PASS for 53 scripts** (52 required + optional C07), including SHA locks and markers.


## Stronger Wordbench source evidence

The candidate has now been mounted into a complete supplied RGL layout and resolved by **GF Wordbench 1.3.4**. Wordbench discovers the exact target census **58 = 51 language + 5 API facades + 2 MorphoDict**, reports **0 static findings**, and locks the exact 58-source set with aggregate SHA-256:

```text
55906c0f63c919e307730cc642d432d86392b120a414d2080937bd42dc8550c1
```

Compendium evidence reaches **T0 PASS / S01 SOURCE_LOCKED**. The run is scan-only: all compile targets are intentionally skipped because no GF executable is installed here. Its T8/overall error state must therefore not be read as a compiler failure. See `docs/clause/C07_FINAL_EVIDENCE_20260925.md` and `validation/clause/wordbench_static_58/`.

## Certification boundary

A GF 3.12 executable is not available in this execution environment. Therefore this package does **not** claim a fresh 58/58 GF compiler census or 52/52 executable scenario run. Before merging/tagging, run:

1. GF 3.12 strict Global Scan: target **58/58**;
2. required scenarios: target **52/52**;
3. optional `alb-clause-final`: target **18/18 executable**;
4. existing gold comparison: **zero unintended regression**;
5. linguistic review before promoting new outputs to gold.

## Explicit uncertified boundaries

The implementation does not fabricate solutions for representation/evidence gaps. Remaining boundaries are recorded in `docs/clause/C07_UNCERTIFIED_BOUNDARIES.md`, including governed declined `cili/e` relatives under plural-gender loss, controller-sensitive generic `EmbedVP`, embedded-question marking, `se/që` generation policy, focus/topicalization/scrambling, generalized pro-drop and adverb ordering.

## Primary documentation

- `docs/clause/C07_FINAL_IMPLEMENTATION_20260925.md`
- `docs/clause/C07_PATCH_RECORD_20260925.md`
- `docs/clause/C07_POST_IMPLEMENTATION_AUDIT.md`
- `docs/clause/C07_TEST_MATRIX.md`
- `docs/clause/C07_UNCERTIFIED_BOUNDARIES.md`
- `validation/clause/`
