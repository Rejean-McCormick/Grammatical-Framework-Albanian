# Roadmap globale optimale

Chaque phase doit publier son `S-state`, ses blockers et les transitions `W00–W08`. Les phases ci-dessous ne remplacent pas la state machine Compendium.

## Phase 0 — source/evidence closure (`S01–S05`)
- archiver le run correspondant à `albanian-s02-green-20260925` ou produire un fresh run ;
- figer source-locks ;
- matérialiser owner/risk/decision registries.

## Phase 1 — harness avant types (`S05`, préparation `S06`)
- morphology table harness ;
- 569 CASEs classifiés ;
- baseline performance ;
- public API smoke tests.

## Phase 2 — shared nominal contracts (`S04/S05` rollback possible)
Ordre :
1. introduire `Case`/`MorphCase` mapping sans changer les surfaces ;
2. centraliser noun realization ;
3. migrer Gen consumers ;
4. migrer `Noun.g : Number => Gender` + `Agr` ;
5. réduire `Adj` à Gender×Number + `AdjClass` ;
6. centraliser *nyje* ;
7. full regression à chaque slice.

## Phase 3 — morphology families (fermeture `S06 MORPHOLOGY_READY`)
Classifier 563/36/135, principal parts, guards, gold tables, irregular cleanup.

## Phase 4 — verbal realizer + clitics (`S07 CORE_IMPLEMENTATION`)
Typed cluster, TAM mapping, voice-use vs morph-voice, perfect aux, progressive, imperative, compatibility shims puis suppression de legacy strings.

## Phase 5 — clause + valency (`S07 CORE_IMPLEMENTATION`)
Close common Sentence/Question/Relative + valence/control/complements/coordination with evidence.

## Phase 6 — Structural/Extend/Extra/API (fermeture `S08 EXTENSIONS_ACCOUNTED`)
Close parity matrix row-by-row; neutralize rather than omit common contracts.

## Phase 7 — Dict/MorphoDict promotion (`S08`, support release)
Replace placeholders by certified paradigms in stratified batches; enforce provenance, schema, reproducibility, dedup.

## Phase 8 — scale campaigns (fermeture `S09 REGRESSION_VALIDATED`)
G2 ≥5k then G3 ≥20k with stress/cross-product, not pure volume.

## Phase 9 — R4 candidate + Compendium release (`S10`, puis `S11`)
Full parity disposition, gold protection, bounded debt, release evidence packet and reviewer suffix.

## Promotion finale

`R4_candidate` signifie que la maturité Albanian est suffisante pour demander le release review. Il ne devient `S10 RELEASE_CANDIDATE` qu'après passage du release gate Compendium sans blocking `fail`/`not_executed` et sans question critique ouverte. `S11 UPSTREAM_READY` exige ensuite packaging, clean reproducibility et review protocol.
