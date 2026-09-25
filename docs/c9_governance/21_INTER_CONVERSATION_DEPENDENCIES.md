# Inter-conversation / cross-workstream dependency register

Conversation 9 owns advanced coverage and public API integration. It may expose defects owned elsewhere. Those dependencies must be explicit rather than patched locally.

| Dependency ID | Capability | Likely owner outside C9 | C9 consumers | Status | C9 rule |
|---|---|---|---|---|---|
| `C9-DEP-001` | core case/genitive representation | core Cat/Res/Noun workstream | Gen*, Prep, Documentation | open | C9 may propose migration but cannot fake genitive downstream |
| `C9-DEP-002` | nyje/article/adjective agreement | core nominal/adjective workstream | Structural Det, APCN, Gen* | open | preserve rich category info; no string patch |
| `C9-DEP-003` | clitic cluster/placement | core Verb/Clause/clitic workstream | RNP, pro-drop, advanced VP | open | C9 tests interaction; owner fixes core placement |
| `C9-DEP-004` | VV/subjunctive complement strategy | core Verb/Clause/TAM workstream | Structural modals, VPS/VPI | open | no English infinitive assumption |
| `C9-DEP-005` | voice/non-active/passive | core verb/voice workstream | PassVPSlash, participles | open | no passive workaround in Extend |
| `C9-DEP-006` | optative/admirative/TAM representation | core TAM workstream | Documentation, advanced VP/API | open | expose only after representation contract is stable |
| `C9-DEP-007` | morphology/paradigm correctness | morphology workstream | Documentation, lexical Structural items | open | compile-safe placeholder never grants C9 linguistic certification |
| `C9-DEP-008` | valency correctness | lexicon/valency workstream | Structural verbs, Try examples | open | C9 cannot certify modal/verb behavior on unreviewed valency |
| `C9-DEP-009` | Dict/MorphoDict placeholder debt | dictionary/morphodict workstreams | public lexicon demos only | non_blocking_for_core_API | keep separate; do not use as advanced grammar evidence |

## Handoff rule

When C9 discovers a core defect:

- record affected C9 row IDs;
- open/update dependency ID;
- state required contract from the external owner;
- add a failing or pending focused test if possible;
- do not mask the issue in Extra/API.

External workstream numbers/names are intentionally not invented here; bind them when the parallel-conversation ownership map is supplied.
