---
document_role: campaign_scaling_plan
status: normative
date: 2026-09-25
---

# Plan de campagne : 569 → 5 000 → 20 000+

## 1. Baseline 569

Le bundle de validation actuel documente :
- 50 scénarios core;
- 500 CASEs core;
- 2 scénarios smoke lexicaux;
- 69 CASEs lexicaux;
- total : 52 scénarios / 569 CASEs.

Distribution core actuelle documentée :
- noun-morphology : 100
- verb-morphology : 100
- adjective-agreement : 50
- syntax-core : 80
- clitics-negation : 50
- questions-relatives : 50
- names-preps-numerals : 20
- construction-stress : 20
- cross-feature-stress : 30

Lexical smoke :
- DictSqi : 39
- MorphoDictSqi : 30

## 2. G1 — revue complète des 569

Critère :
- 569/569 ont verdict + confiance + justification;
- tous les `invalid` sont groupés en familles de défaut;
- les `questionable` ont une question de recherche explicite;
- les sorties gold-éligibles sont identifiées;
- aucun échec n'est masqué par suppression de CASE.

## 3. G2 — 5 000 CASEs curatés

La croissance ne doit pas être un simple échantillonnage aléatoire du lexique.

Le corpus 5k doit être stratifié sur :

### Morphologie
- classes nominales;
- nombres;
- cas;
- définitude;
- classes de genre pertinentes;
- adjectifs et accord;
- personnes/nombres verbaux;
- TAM/modes actifs;
- voix/non-actif;
- participes/non-finis;
- irréguliers;
- limites des smart paradigms.

### Syntaxe
- NP/CN/AP;
- gouvernement prépositionnel;
- valence V/V2/V3/VS/VQ/VV et classes réellement supportées;
- clitiques simples et clusters;
- négation;
- ordre;
- auxiliaires;
- questions;
- relatives;
- subordination;
- coordination;
- constructions Extend/Extra pertinentes.

### Lexique
- catégories fréquentes;
- entrées irrégulières;
- entrées à haut risque;
- valences distinctes;
- classes morphologiques rares;
- homographes lorsque les lemgrammes diffèrent.

### Stress croisé
Combinaisons de dimensions susceptibles d'interagir : clitique + négation, question + auxiliaire, relative + cas, adjectif + définitude, etc.

## 4. G3 — 20 000+ CASEs

Le corpus 20k+ doit ajouter de la profondeur, pas seulement du volume :

- couverture de chaque classe de paradigme;
- cellules rares et frontières;
- exceptions lexicales;
- constructions imbriquées;
- stress syntaxe × morphologie;
- échantillons représentatifs de DictSqi et MorphoDictSqi;
- régressions issues des bugs historiques;
- contre-exemples/negative tests lorsque possible.

## 5. Règle de génération

Chaque lot généré doit conserver :
- générateur/version;
- seed si randomisation utilisée;
- source-lock;
- règle de sélection;
- dénominateur visé;
- distribution réelle;
- exclusions et raison.

Un lot impossible à reproduire ne compte pas comme preuve de couverture.

## 6. Règle de promotion des CASEs

Un CASE peut entrer dans le corpus permanent parce qu'il :
- couvre une cellule requise;
- couvre un phénomène core;
- représente un bug historique;
- couvre une limite de paradigme;
- représente une classe lexicale importante;
- exerce une interaction à risque.

Éviter les milliers de doublons qui n'augmentent aucune dimension de couverture.

## 7. Stop conditions

On ne passe pas au palier suivant si le palier courant révèle une famille `invalid` systématique non traitée dans une zone core. Le volume ne doit pas diluer un défaut architectural.
