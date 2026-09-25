# Implementation sequence and change control

**Status:** blocking engineering protocol.

## 1. Migration principle

Change the smallest complete **producer → carrier → consumer → test** slice possible. Do not refactor `Verb`, `VP`, `VPSlash`, all clause types and Extend families simultaneously unless an exact contract proves that unavoidable.

Typical vertical slice:

```text
resource/morphology type
→ paradigm/irregular producer
→ VP/VPSlash carrier
→ ClauseSqiRes realizer
→ one public Verb operation
→ one clause consumer
→ focused tests
→ full baseline
```

## 2. Ordered implementation phases

| Phase | Deliverable | Exit condition |
|---|---|---|
| `V0` | freeze hashes, baseline, evidence IDs | source lock and current behavior recorded |
| `V1` | clean simple/compound tense ownership; remove ambiguous final `Past` semantics | no compound-perfect value masquerades as a simple tense contract |
| `V2` | centralize `kam/jam` auxiliary strategy | active/non-active compound selection has one owner and tests |
| `V3` | introduce morphological voice dimension without output changes | producers and carriers migrated; old active outputs unchanged |
| `V4` | structured passive/reflexive use | `PassV2`/`ReflVP` no longer hard-code final strings |
| `V5` | named TAM strategy dispatch | common 16 combinations route through explicit strategies |
| `V6` | typed progressive | only licensed `po` cells reachable; anti-tests for forbidden combinations |
| `V7` | Albanian extra TAM/moods/non-finites | optative/admirative/aorist/imperfect/past-anterior extensions exposed as decided |
| `V8` | valency/modal/clitic integration | all 29 `Verb` operations use final contracts |
| `V9` | full propagation/release | 58/58 + 52/52 + new focused tests + linguistic review |

A later phase may start experimentally before an earlier OPEN linguistic question is closed only if the change is representation-only and preserves output.

## 3. Slice record

Every implementation slice records:

```yaml
slice_id: VSL-...
base_source_hash: ...
changed_files: []
changed_contracts: []
producer_carrier_consumer_map: ...
evidence_ids: []
decision_or_question_ids: []
test_ids: []
focused_compile: pass|fail
full_58: pass|fail|not_run
original_52: pass|fail|not_run
new_verbal_tests: pass|fail|not_run
gold_changes: []
linguistic_status: ...
rollback_artifact: ...
```

## 4. Rollback triggers

Rollback or quarantine a slice when:

- a new field has no identified final consumer;
- a supported form becomes empty/placeholder merely to compile;
- model-language code changes Albanian output without Albanian evidence;
- a failure is hidden by weakening lexical category/valency;
- a gold changes without evidence/review;
- baseline 58/58 or original 52/52 regresses without an explicit reviewed migration;
- PMCFG/compiler behavior becomes unstable and the causal boundary is unknown.

## 5. Compatibility adapters

Temporary adapters are allowed only if they preserve prior output, do not infer grammar from strings, have focused before/after tests, and carry a `TEMP-V-*` ID with a named removal phase.

## 6. DRAFT-MAX harvesting

DRAFT-MAX is historical design evidence, not a baseline. Current policy:

- typed voice distinction: **harvestable design direction**;
- typed clitic cluster: **shared dependency**, coordinate with clitic workstream;
- lexical `perfAux` on every verb/VP: **do not adopt as-is** under current Standard-Albanian evidence;
- `u` through a reflexive/clitic slot: **promising but not settled**, because non-active `u` != semantic reflexive state;
- refusal to heuristically synthesize non-active present/imperfect: **adopt**.

Every harvested idea must be re-derived against current source, implemented as a `VSL-*` slice, compiled, tested, and baseline-validated. Never apply checkpoint2 as a block overlay.
