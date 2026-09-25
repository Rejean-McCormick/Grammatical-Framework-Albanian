---
document_role: certification_thresholds
status: normative
version: 1.0
date: 2026-09-25
---

# Seuils de certification et niveaux de maturité

## 1. Deux axes indépendants

### Échelle de campagne

- **G1** : 569 CASEs
- **G2** : ≥ 5 000 CASEs curatés
- **G3** : ≥ 20 000 CASEs curatés

### Échelle de maturité

- **R0** : baseline structurelle
- **R1** : première certification du corpus initial
- **R2** : maturité core
- **R3** : maturité lexicale et de stress
- **R4** : candidat à la parité English

Un grand G n'implique pas un grand R.

## 2. Axes des gates

Chaque niveau rapporte :

- `S` structure;
- `E` exécution;
- `L` linguistic review;
- `G` gold regression;
- `C` coverage;
- `P` parity;
- `D` debt;
- `H` reviewer level.

## 3. R0 — baseline structurelle

Exigences :
- GF 3.12;
- 58/58 cibles ou nouveau census intentionnel entièrement passé;
- 52/52 scénarios baseline ou nouvelle suite requise entièrement passée;
- source-lock enregistré;
- pas de blocker structurel.

`L`, `G` peuvent être `NOT_ESTABLISHED`.

## 4. R1 — corpus initial certifié en périmètre

Précondition : G1.

Exigences :
- 569/569 CASEs classifiés;
- chaque CASE a verdict, confiance, rationale et hash;
- aucun `invalid`/`questionable` non résolu dans le périmètre que le rapport appelle certifié;
- golds promus uniquement selon policy;
- régression structurelle nulle;
- bugs non résolus hors périmètre explicitement listés.

## 5. R2 — maturité core

Précondition : G2.

Exigences :
- ≥5 000 CASEs curatés et revus;
- tous les phénomènes core ont un dénominateur défini;
- tous les public paradigm overloads pertinents ont un test T3;
- chaque famille productive a ses tests T2 de canonical/boundary/orthographic/irregular/invalid lorsque applicable;
- aucune famille core ne reste `untested`;
- aucun `invalid`/`questionable` bloquant dans le périmètre core annoncé;
- toutes les régressions gold requises passent.

## 6. R3 — maturité lexicale et stress

Précondition : G3.

Exigences :
- ≥20 000 CASEs curatés/revus;
- couverture croisée syntaxe × morphologie;
- bugs historiques transformés en régressions;
- échantillonnage Dict/MorphoDict stratifié;
- dette placeholder mesurée par catégories/classes;
- classes rares et frontières représentées;
- aucune croissance lexicale non analysée présentée comme certification.

## 7. R4 — English-parity candidate

Précondition : R3.

Exigences :
- matrice English complète sur le périmètre déclaré;
- aucun `missing` core inexpliqué;
- tout `linguistically_not_applicable` justifié;
- aucun `needs_review` core dans le périmètre de release;
- tout `partial` core est soit résolu, soit explicitement exclu avec décision bloquant l'emploi de « full core parity »;
- public paradigms entièrement inventoriés/testés;
- couverture morphologique active explicitement définie;
- gold corpus large et stable;
- dette restante bornée;
- release packet cohérent.

## 8. Niveau reviewer

Wordbench distingue la validation AI de la certification humaine indépendante.

Un rapport R4 doit donc porter un suffixe :
- `R4_candidate_AI_reviewed`
- `R4_candidate_human_reviewed`
- `R4_candidate_dual_reviewed`

Le mot « human-certified » n'est utilisé que selon `29_REVIEWER_AND_HUMAN_CERTIFICATION_POLICY.md`.

## 9. Principe zéro-tolérance dans le périmètre

On ne calcule pas un « 98 % valid donc OK » pour masquer des erreurs core. Dans un périmètre déclaré certifié :
- `invalid` requis = 0;
- `questionable` requis = 0;
- gold mismatch requis = 0;
- missing evidence requis = 0.

La couverture externe au périmètre reste visible comme dette.
