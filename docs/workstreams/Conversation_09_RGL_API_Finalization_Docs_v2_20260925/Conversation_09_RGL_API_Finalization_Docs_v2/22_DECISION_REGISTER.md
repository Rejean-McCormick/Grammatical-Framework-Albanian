# Decision register — Conversation 9

A decision closes only when evidence, affected rows, tests and source-lock context are recorded.

| Decision ID | Question | Severity | Status | Domain | Required outcome | Evidence to close | Affected surface |
|---|---|---|---|---|---|---|---|
| `C9-DEC-001` | Exact active RGL revision/search path | `release_blocking` | `open` | version/contracts | Establish Git/archive identity used by protected baseline | RGL identity + reproducible GF path | 01,03,Documentation/API |
| `C9-DEC-002` | Documentation abstract mismatch / InflectionCl | `release_blocking` | `version_blocked` | version/contracts | Match exact active Documentation abstract | C9-DEC-001 + compile evidence | C9-DOC-* |
| `C9-DEC-003` | Genitive representation vs Dat-like morphology | `capability_blocking` | `open` | nominal | Choose representation preserving genitive syntax and morphology | E-C9-ALG-001 + tests | Gen*, Prep, Documentation |
| `C9-DEC-004` | Neuter gender treatment | `capability` | `open` | nominal | Define supported core/API treatment | grammar + contextual evidence | pronouns/agreement/docs |
| `C9-DEC-005` | Nyje/article contract | `release_blocking_for_related_rows` | `open` | nominal | Specify AP/genitive/article behavior | E-C9-ALG-002 + focused tests | APCN, Gen*, Structural Det |
| `C9-DEC-006` | VV/VPI complement contract | `release_blocking_for_vpsvpi` | `open` | verbal | Define Tosk/standard complement strategy | E-C9-ALG-003 + scenarios | Structural VV, VPS/VPI |
| `C9-DEC-007` | Active/non-active/passive ownership | `release_blocking_for_voice` | `open` | verbal | Define representation and realization boundary | E-C9-ALG-005 + core contract | VPBridge/passives |
| `C9-DEC-008` | Optative/admirative API exposure | `scope_decision` | `open` | tam | Core vs Albanian-specific API disposition | E-C9-ALG-004 + API use case | Documentation/API |
| `C9-DEC-009` | Clitic placement contract | `release_blocking_for_clitic_interactions` | `open` | clitic | Specify polarity/mood/imperative/subjunctive interactions | E-C9-ALG-006 + clitic tests | RNP/pro-drop/VP |
| `C9-DEC-010` | Pied-piping/stranding strategy | `release_blocking_for_rows` | `open` | advanced syntax | Classify Albanian-valid vs compatibility behavior | E-C9-ALG-008 + tests | slash functions |
| `C9-DEC-011` | Focus/fronting constraints | `release_blocking_for_rows` | `open` | advanced syntax | Establish valid word-order/focus realizations | E-C9-ALG-008 + contexts | Focus* |
| `C9-DEC-012` | Structural modal semantics | `release_blocking_for_rows` | `open` | structural verbal | Certify can/must/want complement semantics | E-C9-ALG-003 + lexical contexts | Structural VV |
| `C9-DEC-013` | Existential strategy | `release_blocking_for_rows` | `open` | advanced syntax | Agreement/definiteness/polarity contract | contexts + tests | Exist* |
| `C9-DEC-014` | RNP/reflexive possession semantics | `release_blocking_for_rows` | `open` | advanced syntax | Person/agreement/possessive contract | E-C9-ALG-006 + tests | RNP |
| `C9-DEC-015` | Combinators appCN/appCNc specialization | `api_blocking` | `open` | api | Generic vs Albanian-specialized decision | API use cases + tests | CombinatorsSqi |
| `C9-DEC-016` | Try overload/export collision policy | `api_blocking` | `open` | api | Final ergonomic export set | GF export census + smoke tests | TrySqi |
| `C9-DEC-017` | Browse/tooling scope | `release_scope` | `open` | api/tooling | Include BrowseSqi or declare out of C9 release | use case + maintenance cost | Browse |
| `C9-DEC-018` | Standard/Tosk/Geg policy | `release_blocking_for_linguistic_gold` | `open` | dialect | State normative core scope and optional dialect behavior | E-C9-ALG-007 + project policy | all linguistic certification |

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
