# Decision register — Conversation 9

A decision closes only when evidence, affected rows, tests and source-lock context are recorded.

| Decision ID | Question | Severity | Status | Domain | Required outcome | Evidence to close | Affected surface |
|---|---|---|---|---|---|---|---|
| `C9-DEC-001` | Exact active RGL revision/search path | `release_blocking` | `closed_for_candidate_target` | version/contracts | Target this patch to supplied RGL archive SHA-256 `e6491c23…e8a4d` | exact archive identity fixed; historical baseline Git identity remains global provenance debt | 01,03,Documentation/API |
| `C9-DEC-002` | Documentation abstract mismatch / InflectionCl | `release_blocking` | `implemented_not_run` | version/contracts | Match supplied Documentation abstract | `InflectionCl` implemented; GF 3.12 compile pending | C9-DOC-026 |
| `C9-DEC-003` | Genitive representation vs Dat-like morphology | `capability_blocking` | `open` | nominal | Choose representation preserving genitive syntax and morphology | E-C9-ALG-001 + tests | Gen*, Prep, Documentation |
| `C9-DEC-004` | Neuter gender treatment | `capability` | `open` | nominal | Define supported core/API treatment | grammar + contextual evidence | pronouns/agreement/docs |
| `C9-DEC-005` | Nyje/article contract | `release_blocking_for_related_rows` | `open` | nominal | Specify AP/genitive/article behavior | E-C9-ALG-002 + focused tests | APCN, Gen*, Structural Det |
| `C9-DEC-006` | VV/VPI complement contract | `release_blocking_for_vpsvpi` | `open` | verbal | Define Tosk/standard complement strategy | E-C9-ALG-003 + scenarios | Structural VV, VPS/VPI |
| `C9-DEC-007` | Active/non-active/passive ownership | `release_blocking_for_voice` | `open` | verbal | Define representation and realization boundary | E-C9-ALG-005 + core contract | VPBridge/passives |
| `C9-DEC-008` | Optative/admirative API exposure | `scope_decision` | `open` | tam | Core vs Albanian-specific API disposition | E-C9-ALG-004 + API use case | Documentation/API |
| `C9-DEC-009` | Clitic placement contract | `release_blocking_for_clitic_interactions` | `open` | clitic | Specify polarity/mood/imperative/subjunctive interactions | E-C9-ALG-006 + clitic tests | RNP/pro-drop/VP |
| `C9-DEC-010` | Pied-piping/stranding strategy | `release_blocking_for_rows` | `implemented_not_run` | advanced syntax | No canonical stranding; neutralize common API to Albanian preposition-first realization | E-C9-ALG-012 + GLOB-017; focused smoke candidate added | slash functions |
| `C9-DEC-011` | Focus/fronting constraints | `release_blocking_for_rows` | `open` | advanced syntax | Establish valid word-order/focus realizations | E-C9-ALG-008 + contexts | Focus* |
| `C9-DEC-012` | Structural modal semantics | `release_blocking_for_rows` | `open` | structural verbal | Certify can/must/want complement semantics | E-C9-ALG-003 + lexical contexts | Structural VV |
| `C9-DEC-013` | Existential strategy | `release_blocking_for_rows` | `open` | advanced syntax | Agreement/definiteness/polarity contract | contexts + tests | Exist* |
| `C9-DEC-014` | RNP/reflexive possession semantics | `release_blocking_for_rows` | `open` | advanced syntax | Person/agreement/possessive contract | E-C9-ALG-006 + tests | RNP |
| `C9-DEC-015` | Combinators appCN/appCNc specialization | `api_blocking` | `implemented_not_run` | api | Albanian specialization through `NounSqi.PossNP` | ownership analysis + focused API smoke candidate | CombinatorsSqi |
| `C9-DEC-016` | Try overload/export collision policy | `api_blocking` | `implemented_not_run` | api | Add safe `mkAdv/mkAdN/mkOrd` overloads; retain risky/duplicate Albanian exclusions | source collision analysis + focused API smoke candidate | TrySqi |
| `C9-DEC-017` | Browse/tooling scope | `release_scope` | `closed` | api/tooling | Browse remains outside core C9 release | canonical GLOB-022 | Browse |
| `C9-DEC-018` | Standard/Tosk/Geg policy | `release_blocking_for_linguistic_gold` | `closed_scope_policy` | dialect | Standard Albanian normative; Tosk primary evidence; Geg contrastive unless explicitly scoped | canonical GLOB-001 + supplied reference routing | all linguistic certification |

## Resolution record template

```text
DECISION_ID:
STATUS: closed | deferred | superseded
SOURCE_LOCK:
RGL_REVISION:
QUESTION:
OPTIONS_CONSIDERED:
DECISION:
RATIONALE:
LINGUISTIC_EVIDENCE_IDS:
EXACT_SOURCE_LOCATORS:
AFFECTED_MATRIX_ROWS:
AFFECTED_FILES:
TEST_IDS:
GOLD_IMPACT:
COMPATIBILITY_IMPACT:
FOLLOW_UP:
```

A decision marked `deferred` must state the resulting release limitation.

## 2026-09-25 C9 finalization candidate

Statuses containing `*_not_run` mean the design/code decision is made in the candidate but cannot be promoted to executable closure until the exact-current GF 3.12/Wordbench run passes. `C9-DEC-001` is closed only for the supplied archive target, not retroactively for historical baseline provenance.
