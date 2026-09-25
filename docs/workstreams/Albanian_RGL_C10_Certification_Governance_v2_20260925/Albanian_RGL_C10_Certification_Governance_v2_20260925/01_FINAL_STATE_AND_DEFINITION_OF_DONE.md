---
document_role: final_state_definition
status: normative
version: 2.0
date: 2026-09-25
---

# État final cible et définition de « terminé »

## 1. Objectif final

La cible n'est pas « Albanian compile comme English ». La cible est une RGL albanaise :

- intégrée proprement à GF/RGL;
- linguistiquement correcte pour `Standard Albanian`;
- fonctionnellement comparable à English RGL sur la surface RGL pertinente;
- dotée de paradigmes productifs, explicables et testés;
- dotée de lexiques syntaxique et morphologique profonds;
- protégée par des golds réellement revus;
- mesurée par des matrices de couverture à dénominateurs explicites;
- traçable de la source jusqu'au packet de release;
- capable de déclarer honnêtement ce qui reste non certifié.

## 2. Produit final attendu

### 2.1 Core RGL

Chaque capacité core pertinente possède :
- une implémentation Albanian ou un équivalent fonctionnel;
- un statut de parité;
- un test;
- une preuve linguistique lorsque la surface produite est linguistiquement significative;
- un gold lorsque la sortie est déterministe et confirmée.

Aucune fonction core ne reste `missing` sans justification à R4.

### 2.2 Morphologie et paradigmes

Le produit final contient :
- un modèle explicite des dimensions grammaticales;
- un registre des paradigmes publics;
- des tests T2/T3 sur les tables complètes;
- des tests de frontières et entrées invalides pour les smart paradigms;
- une couverture observable de chaque famille productive;
- une dette explicite pour les cellules non certifiées.

La source actuelle possède des tables morphologiques riches; leur présence n'est pas une certification. La certification porte sur leurs valeurs observées.

### 2.3 `DictSqi`

`DictSqi` reste le lexique syntaxique :
- catégories;
- valences;
- sélections de compléments;
- prépositions/gouvernement;
- distinctions requises par l'abstract syntax.

Les entrées compile-safe non analysées restent de la dette et ne sont pas comptées comme maturité linguistique.

### 2.4 `MorphoDictSqi`

`MorphoDictSqi` reste un inventaire morphologique :
- un lemgramme par table flexionnelle;
- pas de duplication de sens;
- pas de `variants` comme échappatoire;
- multiwords seulement avec justification morphologique explicite;
- priorité aux paradigmes publics et constructeurs appropriés.

### 2.5 Certification et gold

Le produit final possède :
- un ledger de CASEs hash-bound;
- un gold corpus explicitement promu;
- une traçabilité CASE → preuve → verdict → gold;
- des régressions Wordbench;
- une séparation stricte entre `executed`, `reviewed`, `golded` et `certified_in_scope`.

### 2.6 Parité English

English sert de benchmark de :
- couverture API;
- ampleur des modules/constructions;
- profondeur des lexiques;
- maturité des paradigmes;
- qualité de la régression et de la documentation.

La parité n'exige ni mêmes structures internes ni mêmes compteurs bruts.

## 3. « Terminé » est multidimensionnel

Une release finale doit fermer simultanément les axes :

- **S — structure** : GF/RGL cohérent;
- **E — exécution** : scénarios requis exécutés;
- **L — linguistique** : revue complète du périmètre;
- **G — gold** : régression revue et stable;
- **C — couverture** : phénomènes/cellules/API mesurés;
- **P — parité** : écarts English expliqués;
- **D — dette** : dette restante bornée et déclarée;
- **H — niveau de revue** : AI/humain/dual explicitement indiqué.

Les gates exacts appartiennent à `20_CERTIFICATION_THRESHOLDS_AND_LEVELS.md`.

## 4. Niveaux

Les niveaux R0–R4 sont définis normativement dans `20_CERTIFICATION_THRESHOLDS_AND_LEVELS.md`. Les volumes de campagne G1/G2/G3 sont définis dans `05_CAMPAIGN_SCALING_569_5000_20000.md`.

**Important : volume de CASEs et maturité sont deux axes différents.**

## 5. Ce qui ne constitue jamais « terminé »

- `58/58` seul;
- `52/52` seul;
- PGF build seul;
- « ça ressemble à de l'albanais »;
- un grand corpus de sorties non revues;
- une hausse de Dict/MorphoDict obtenue par placeholders;
- l'égalité numérique avec English;
- la copie d'une analyse English ou d'une langue balkanique sans preuve Albanian;
- la suppression des cas difficiles;
- un gold réécrit pour faire passer la release;
- un score sans dénominateur;
- un label « certifié » sans préciser périmètre et type de reviewer.
