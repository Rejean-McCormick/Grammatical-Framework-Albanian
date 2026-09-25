# Source manifest

| source | role | SHA-256 |
| --- | --- | --- |
| Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip | current Albanian source + validation baseline | 961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829 |
| gf-rgl-master.zip | supplied upstream RGL abstract/API/model source | e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d |
| Code_snapshot_GF_RGL_AI_Compendium(4).zip | RGL contracts/workflows/patterns | 73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe |
| Code_snapshot_GF_Wordbench(20260925-123301).zip | Wordbench validation implementation | 1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd |
| Albanian_ref(10).zip | Albanian linguistic/reference package | 15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc |

## Important provenance limitation

`gf-rgl-master.zip` does not by itself identify an immutable Git commit. It is therefore cited as the **supplied RGL snapshot**, not as a verified remote commit hash.

## Baseline facts extracted for v2

- 58 expected GF census targets = 51 language + 5 API + 2 MorphoDict.
- 52 scenario files.
- Current parity roadmap: 569 reviewable generated CASEs (review workload, not gold count).
- DictSqiAbs functions: 6720.
- Active direct API definitions observed: Verb 29/29; Conjunction 9/9; Construction 68/68; Idiom 14/14.
