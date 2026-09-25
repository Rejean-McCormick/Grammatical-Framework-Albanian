# Consolidation validation matrix

The **canonical consolidation check** is `validation/consolidation/static_validate_consolidation.py`; it passes **54/54**. `gf_morphosqi_lint.py` reports **0 findings**. Python tooling under `tools/` and `validation/` compiles successfully.

The isolated C1–C10 validators were also rerun as diagnostics, but they are not all authoritative after fusion because several encode mutually exclusive workstream assumptions.

| Validator | Current result | Consolidation interpretation |
|---|---:|---|
| Neutral consolidation | 54/54 PASS | canonical static merge check |
| MorphoSqi heuristic lint | 0 findings | pass |
| C1 morphology MAX | FAIL | expects C1 five-case noun/adjective architecture; active merge intentionally uses C6 MorphCase + typed adjective morphology. Smart API pieces are retained. |
| C2 MorphoDict | 25/27 | core MorphoDict checks pass; remaining checks assume exactly 52 physical scenario files / no blocked lemgram in any optional campaign |
| C4 verbal | FAIL | several exact-source-shape expectations conflict with compatibility fields; active voice/progressivity/marked realizer capabilities are retained |
| C5 clitics/case | 160/167 | seven failures are scenario-policy expectations (C5 wanted its 5 scenarios promoted to required); consolidation keeps them optional |
| C6 nominal | partial | active nominal contracts pass; failures concern retained GenNum compatibility, scenario physical count, and C8/C9 cross-domain lexical constructions |
| C7 clause | FAIL | validator expects its exclusive helper architecture; C7 implementation remains archived as variant while active clause uses C5+C8 synthesis |
| C9 API | 135/139 | one physical-scenario-count policy difference + three lexical-default policy differences; API/relative integration remains active |
| C10 refresh | expected nonzero | campaign manifests/79-scenario generator are stale against 91-scenario consolidation; dashboard correctly says NOT_ESTABLISHED |

These diagnostics are intentionally shipped for the next GF/Wordbench iteration rather than normalized away.
