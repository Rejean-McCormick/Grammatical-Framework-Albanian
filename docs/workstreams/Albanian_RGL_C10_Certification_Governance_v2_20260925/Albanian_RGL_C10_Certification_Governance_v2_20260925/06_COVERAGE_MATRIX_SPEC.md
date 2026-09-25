---
document_role: coverage_specification
status: normative
date: 2026-09-25
---

# Spécification des matrices de couverture

> Les dimensions source exactes sont définies dans `17_ALBANIAN_GRAMMATICAL_FEATURE_MODEL.md` et `18_PARADIGM_AND_MORPHOLOGICAL_CELL_REGISTRY.md`. Ce document définit uniquement la mesure.

## 1. Pourquoi une matrice

Un taux global de CASEs valides peut cacher une absence totale de couverture d'une cellule critique. La certification doit donc avoir des dénominateurs explicites.

## 2. Axes obligatoires

### Axe A — phénomène
Exemples :
- nominal_morphology
- adjective_agreement
- verbal_morphology
- clitics
- negation
- voice_nonactive
- tam
- valency
- questions
- relatives
- coordination
- subordination
- information_structure
- constructions_extend_extra

### Axe B — catégorie GF
Exemples selon la surface active :
`N`, `N2`, `N3`, `A`, `A2`, `V`, `V2`, `V3`, `VV`, `VS`, `VQ`, `VA`, `Adv`, `Prep`, `Pron`, etc.

La liste effective vient du RGL verrouillé et du target, pas d'une liste inventée.

### Axe C — cellule morphologique
Pour chaque paradigme actif :
- paramètres;
- valeurs;
- cellules théoriques;
- cellules réellement réalisables;
- cellules testées;
- cellules gold-certifiées;
- cellules N/A justifiées.

### Axe D — construction/API
- fonction abstraite;
- module propriétaire;
- scénario;
- nombre de CASEs;
- statut de parité;
- statut gold.

### Axe E — lexique
- catégorie;
- classe de paradigme;
- valence;
- fréquence/strate de sélection si disponible;
- statut placeholder;
- statut revue.

## 3. États d'une cellule de couverture

- `untested`
- `executed_only`
- `reviewed_valid`
- `reviewed_valid_variant`
- `questionable`
- `invalid`
- `golded`
- `not_applicable_justified`

`executed_only` ne compte pas comme certifié.

## 4. Métriques minimales

- `% CASEs reviewed`
- `% CASEs gold-eligible`
- `% CASEs golded`
- `% active morphological cells tested`
- `% active morphological cells gold-certified`
- `% core abstract functions with certified evidence`
- `% lexicon sampled`
- `% paradigms with boundary tests`
- regression pass rate
- unresolved `invalid`
- unresolved `questionable`

## 5. Dénominateurs

Chaque pourcentage doit exposer son dénominateur. Exemples :

`certified_active_cells / active_cells`

et non :
`certified_cells / all_rows_currently_generated`

Le dénominateur ne peut pas diminuer pour améliorer artificiellement le score sans une décision documentée.

## 6. Couverture minimale des frontières

Conformément au Compendium, chaque domaine de smart paradigm, classe exceptionnelle ou frontière active doit avoir un test de frontière ou négatif.

## 7. Matrices produites

La finalisation devra produire au minimum :

- `coverage_by_phenomenon.csv`
- `coverage_by_category.csv`
- `coverage_morphology_cells.csv`
- `coverage_by_abstract_function.csv`
- `coverage_lexicon_sampling.csv`
- `coverage_summary.md`

Les CSV sont la source machine; le MD est une projection lisible.
