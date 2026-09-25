# C5 local release-evidence packet — 2026-09-25

## Result

**Status: FINALIZED LOCALLY — NOT GF/RUNTIME CERTIFIED**

The C5 implementation has been taken as far as this execution environment can support without a GF 3.12 binary. All local structural, source-lock, inventory, hash, and Python-side validation gates pass.

## Source identity

- baseline coordination tag: `albanian-s02-green-20260925`
- comparison archive: `Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip`
- final C5 GF census: **58** = 51 language + 5 API + 2 MorphoDict
- aggregate SHA-256 across exact 58 GF targets: `e15d7abd7c99510a438cc90b682b55c7ef7e1f17f3b49e8aae791e90c2adb49b`
- active diff against supplied snapshot: **33 modified / 26 added / 0 deleted**

See `C5_SOURCE_LOCK_SHA256.txt` and `C5_DIFF_AGAINST_SUPPLIED_SNAPSHOT.tsv`.

## Local validations

| Validation | Result |
|---|---:|
| C5 dedicated structural validator | **167/167 PASS** |
| DictSqi static validator | **PASS** |
| MorphoDictSqi static validator | **PASS** |
| combined Dict + MorphoDict validator | **PASS** |
| MorphoSqi heuristic lint | **0 findings** |
| Python `compileall` | **PASS** |
| C5 scenario input hashes | **PASS** |
| required scenario inventory | **57** |
| Structural preposition inventory | **21/21 classified** |
| C5 RGL API parity inventory | **21/21 statically assessed** |

## C5 runtime campaign prepared

Five scenarios are required by `project.toml`:

1. `alb-c5-clitic-matrix`
2. `alb-c5-pronoun-cases`
3. `alb-c5-prep-government`
4. `alb-c5-realization-contexts`
5. `alb-c5-relative-genitive`

They add **199 reviewable CASEs**. Of the expectation rows, **165 are source-locked** and **34 require runtime/reviewer assessment**.

## Required external certification run

The authoritative next run must use this exact source state with GF 3.12 and Wordbench 1.3.4. Required gate:

```text
GF census:              58/58
historical scenarios:   52/52
C5 scenarios:            5/5
combined scenarios:     57/57
```

No C5 gold should be promoted merely because compilation is green. Runtime outputs must first be compared with `validation/c5/C5_REFERENCE_EXPECTATIONS.tsv` and reviewed under the supplied linguistic-reference policy.

## External blockers that remain by design

- no GF 3.12 executable is available in this environment;
- 6 Structural preposition mappings remain `REVIEW_REQUIRED` (but none is `UNASSESSED`);
- selected variation policies remain open in the canonical documentation;
- new C5 golds remain intentionally unpromoted pending runtime/review.
