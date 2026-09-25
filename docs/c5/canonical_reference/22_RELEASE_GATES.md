# Release gates globaux

## R0 structurally green
- GF 3.12 ;
- current expected census all pass ;
- required scenarios all pass ;
- source-lock exact ;
- no blocking lock/type warning.

## R1 initial reviewed scope
- 569/569 CASEs classifiés ;
- no invalid/questionable in claimed scope ;
- reviewer/rationale/hash present ;
- required golds pass.

## R2 core maturity
- ≥5k curated CASEs ;
- all core phenomena have denominators ;
- all public paradigm overloads tested ;
- all productive core families tested ;
- no core `untested`.

## R3 lexical/stress maturity
- ≥20k curated/reviewed CASEs ;
- syntax×morphology cross coverage ;
- historical bugs regressions ;
- stratified Dict/MorphoDict sampling ;
- rare/boundary classes represented ;
- placeholder debt measured and excluded from protected coverage.

## R4 candidate
- common/English parity matrix complete ;
- no unexplained core `missing` ;
- no core `needs_review` in release scope ;
- `partial` either closed or explicit scope limitation ;
- public paradigms fully inventoried/tested ;
- gold corpus large/stable ;
- remaining debt bounded ;
- release packet coherent.

## Additional hard gates
- Dict protected final: no unreviewed placeholder ;
- MorphoDict protected final: `variants=0`, no stale C6, no unprovenanced active ;
- no gold change without decision ;
- no source-lock mismatch ;
- no bare `certified` label.

## Mapping normatif vers `testing/RELEASE_GATE.yaml` du Compendium

Les gates R0–R4 sont des gates de maturité Albanian. Toute promotion `S10`/`S11` doit en plus évaluer les exigences `RG-*` avec le vocabulaire exact `pass | fail | not_executed | not_applicable | provisional`.

| Compendium | Domaine | Gate Albanian associé |
|---|---|---|
| RG-001 | source/compiler lock | R0 hard gate |
| RG-002 | generated contracts vs RGL revision | R0 / source reconciliation |
| RG-010 | architecture explicit/reviewed | pré-R2 + architecture |
| RG-011 | category contracts | pré-R2 |
| RG-012 | inheritance/overrides | pré-R2 |
| RG-020 | core morphology | R2 |
| RG-021 | morphology golds | R2 |
| RG-030 | core syntax coverage | R2 |
| RG-031 | core syntax tests | R2 |
| RG-032 | architecture-sensitive interactions | R2/R3 |
| RG-040 | Extend/Extra/Missing explicit | R4 parity |
| RG-050 | minimal foundational compile | R0 |
| RG-051 | clean complete language compile | R0 |
| RG-052 | compiler warnings classified | R0 hard gate |
| RG-060 | regression suite | R3/R4 |
| RG-061 | variants/ambiguities explicit | R3/R4 |
| RG-070 | docs/code synchronized | tous niveaux |
| RG-071 | no release-blocking open question | R4 |
| RG-080 | AI review protocol | S10 |
| RG-081 | limitations explicit | S10 |
| RG-090 | minimal repository-conformant patch | S11 |
| RG-091 | reproducible build/tests | S11 |
| RG-092 | upstream summary | S11 |

### Promotion rule

`S10 RELEASE_CANDIDATE` n'est autorisé que si :

- tous les blocking requirements sont `pass` ou `not_applicable` ;
- aucun blocking compiler-dependent n'est `not_executed` ;
- aucune régression linguistique critique inexpliquée ;
- toutes les fonctions shared non supportées sont explicites ;
- source/RGL version connus ;
- architecture/contracts non stale ;
- aucune question critique ne peut encore changer le comportement core.

Les blocking requirements **ne sont jamais waivables**. Les waivers ne peuvent viser que les exigences `major` et doivent avoir id, preuve, reviewer et condition d'expiration/revue.

`S11 UPSTREAM_READY` exige en plus le packaging upstream, un clean build reproductible, le review protocol et les limitations connues documentées.

### Relation R4 / S10

`R4_candidate` ≠ `S10`. R4 est une condition de maturité interne ; S10 est une promotion procédurale fondée sur le release gate normatif.
