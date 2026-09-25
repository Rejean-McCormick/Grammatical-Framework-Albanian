# Development state map — Compendium S00–S11

## 1. State sequence normative

```text
S00 UNASSESSED
S01 SOURCE_LOCKED
S02 BASELINE_ESTABLISHED
S03 EVIDENCE_READY
S04 ARCHITECTURE_APPROVED
S05 CONTRACTS_READY
S06 MORPHOLOGY_READY
S07 CORE_IMPLEMENTATION
S08 EXTENSIONS_ACCOUNTED
S09 REGRESSION_VALIDATED
S10 RELEASE_CANDIDATE
S11 UPSTREAM_READY
```

Le plus bas gate non satisfait contrôle le state. Des modules avancés peuvent exister sans autoriser une promotion.

## 2. État global prudent au 2026-09-25

**Language state canonique : `S05 CONTRACTS_READY` (projet en implémentation au-delà de ce gate, sans promotion S06 prouvée).**

Raison :

- S01 : source archives/hashes identifiés ;
- S02 : baseline réelle et écarts déclarée/archivée documentés ;
- S03 : corpus/références Albanian + open questions présents ;
- S04 : architecture globale et décisions consolidées ;
- S05 : plans, ownership, field-flow et contracts de workstreams disponibles ;
- S06 n'est pas encore démontré comme gate global : gold morphology complet, familles productives, guards/fallbacks et dette placeholder ne sont pas encore tous fermés/certifiés ;
- l'existence de core syntax/Extend ne permet pas de sauter S06.

### Blockers globaux

```yaml
blockers:
  - kind: BLOCKED_LINGUISTIC_TEST
    target: morphology/core linguistic certification
    exact_problem: golds et CASEs ne ferment pas encore toutes les familles/dimensions requises
  - kind: BLOCKED_REGRESSION
    target: full evidence-backed green baseline
    exact_problem: dernier run archivé = 56/58 strict + 52/52; correctif présent mais rerun externe final non archivé
```

Le compiler GF indisponible dans l'environnement documentaire courant est une limitation d'exécution locale, pas un `BLOCKED_COMPILER` permanent du repository.

## 3. Maturité Albanian séparée

- `DECLARED_BASELINE` : 58/58 + 52/52, label mainteneur `albanian-s02-green-20260925`.
- `EVIDENCE_BACKED_RUN` archivé : 56/58 strict + 52/52 avant rerun du correctif.
- `evidence_backed_R_level` : **pré-R0 tant que le fresh 58/58 n'est pas archivé**.
- cible produit : `R4_candidate`.

R0–R4 ne modifient jamais le S-state.

## 4. Subsystems

Un subsystem peut avoir un state différent de la langue globale. Tout rapport doit enregistrer `language_state` **et** `subsystem_state`. Par exemple, un patch syntaxique peut être dans le microcycle S07/Wxx tandis que la langue globale reste S05 à cause d'un gate morphologique antérieur non fermé.

## 5. Blocking overlays autorisés

`BLOCKED_SOURCE`, `BLOCKED_EVIDENCE`, `BLOCKED_ARCHITECTURE`, `BLOCKED_CONTRACT`, `BLOCKED_DEPENDENCY`, `BLOCKED_COMPILER`, `BLOCKED_LINGUISTIC_TEST`, `BLOCKED_REGRESSION`, `DEFERRED_EXPLICITLY`.

Chaque blocker stocke target, exact problem, evidence checked/required, safe next action et prohibited speculation.

## 6. Microcycle W00–W08

```text
W00 IDENTIFIED
W01 EVIDENCE_RESOLVED
W02 CONTRACTED
W03 PATCH_PLANNED
W04 IMPLEMENTED
W05 COMPILES_LOCALLY
W06 TESTED_LOCALLY
W07 REGRESSION_SAFE
W08 RECONCILED
```

Un patch ne change pas le state global automatiquement ; une transition S-state requiert un transition record séparé avec hashes, evidence, gates, tests, compiler result et blockers.

## 7. Rollback

Toute nouvelle preuve peut forcer un rollback vers le premier gate invalidé : source/API change -> S01 ; nouvelle baseline context -> S02 ; linguistic contradiction -> S03 ; architecture invalidée -> S04 ; contract insuffisant -> S05 ; morphology manque une forme consommée -> S06 ; regression core -> workstream S07 ; extension expose manque core -> S07 ; full regression fail -> avant S09.
