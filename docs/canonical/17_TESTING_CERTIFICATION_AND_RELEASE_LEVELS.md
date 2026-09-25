# Tests, campagnes et niveaux de maturité

## Trois couches minimales

A. **Structure** — compile/type/locks/API/census.  
B. **Behavior** — tables/scénarios/parse-linearize/generation.  
C. **Linguistic** — revue contre preuve et gold.

## Campaign scale

- G1 : 569 CASEs initiaux ;
- G2 : ≥ 5 000 CASEs curatés ;
- G3 : ≥ 20 000 CASEs curatés.

## Maturity

- R0 : baseline structurelle ;
- R1 : corpus G1 entièrement classifié ;
- R2 : maturité core (G2) ;
- R3 : maturité lexicale/stress (G3) ;
- R4 : English-parity candidate.

## Règle de zéro tolérance dans un périmètre annoncé

`invalid=0`, `questionable=0`, gold mismatch=0, missing evidence=0 dans le périmètre qualifié comme reviewed/protected.

## Morphology tests

Tables complètes + canonical/boundary/orthographic/invalid. Chaque overload public `ParadigmsSqi` a un test. Chaque irrégulier a full-table test.

## Syntax tests

Tester interactions cross-product : case × clitic × polarity × TAM × voice × question/relative × agreement × valency selon pertinence.

## Performance

Mesurer compile time, PGF/GFO size, génération Dict/MorphoDict et mémoire avant refactors majeurs.

## Compendium state vs maturité Albanian

Les niveaux `R0–R4` ne sont **pas** des états de développement. Ils mesurent la maturité interne du projet Albanian. La progression légale utilise `S00–S11` :

`S00 UNASSESSED -> S01 SOURCE_LOCKED -> S02 BASELINE_ESTABLISHED -> S03 EVIDENCE_READY -> S04 ARCHITECTURE_APPROVED -> S05 CONTRACTS_READY -> S06 MORPHOLOGY_READY -> S07 CORE_IMPLEMENTATION -> S08 EXTENSIONS_ACCOUNTED -> S09 REGRESSION_VALIDATED -> S10 RELEASE_CANDIDATE -> S11 UPSTREAM_READY`.

Le plus bas gate non satisfait contrôle l'état. Un score R élevé ne permet jamais de sauter un S-gate.

### Microcycle obligatoire

Chaque patch/workstream suit :

`W00 IDENTIFIED -> W01 EVIDENCE_RESOLVED -> W02 CONTRACTED -> W03 PATCH_PLANNED -> W04 IMPLEMENTED -> W05 COMPILES_LOCALLY -> W06 TESTED_LOCALLY -> W07 REGRESSION_SAFE -> W08 RECONCILED`.

La compilation indisponible peut autoriser la progression documentation/evidence/contracts, mais pas `W05+`, `S09+`, ni une claim de validation.
