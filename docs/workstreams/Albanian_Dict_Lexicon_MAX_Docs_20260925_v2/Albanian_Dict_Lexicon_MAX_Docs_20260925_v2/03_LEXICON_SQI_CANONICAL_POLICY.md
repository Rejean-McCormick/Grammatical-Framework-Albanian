---
doc_id: DICTMAX-003
title: "LexiconSqi — politique du lexique canonique"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Rôle

`LexiconSqi` est la couche lexicale **canonique, petite et hautement certifiée** de la RGL albanaise.
Il implémente le contrat `abstract/Lexicon.gf`; il ne sert pas à maximiser le nombre de mots.

## Invariant de couverture

Le contrat abstrait fourni compte 348 fonctions et le snapshot courant de `LexiconSqi` couvre 348/348.
Ce niveau de couverture doit rester à 100 %.

## Standard de qualité d’une entrée canonique

Une fonction `LexiconSqi` n’est finale que si les points applicables sont établis :

- **sens abstrait** : correspondance appropriée au concept du `Lexicon` RGL ;
- **lemme** : forme standard albanaise choisie explicitement ;
- **catégorie** : catégorie GF exacte ;
- **morphologie** : paradigme réel, principal parts ou irrégulier attesté ;
- **valence** : nombre/type des compléments corrects ;
- **gouvernement** : cas/préposition sélectionnés si requis ;
- **construction** : contrôle/complémentation traités si pertinents ;
- **preuve** : source linguistique ou décision documentée ;
- **test** : cas de régression proportionné au risque.

## Règles

### LEX-01 — Aucun placeholder

Un helper `invariantN/A/V` conçu comme échafaudage de compilation n’est pas une réalisation canonique admissible.

### LEX-02 — Pas d’anglicisation silencieuse

Le fait que `LexiconEng` utilise V2, V3, VS, etc. ne suffit pas à attribuer le même type en albanais. Le type est déterminé par le comportement albanais et le contrat abstrait.

### LEX-03 — Richesse de type conservée

Une réalisation ne doit pas être abaissée de `V2S` vers `V`, ou de `N2` vers `N`, pour faciliter la compilation.

### LEX-04 — Réutilisation dans Dict

Lorsqu’une entrée `DictSqi` correspond exactement au même lexème/catégorie canonique, le générateur peut aliaser la réalisation `LexiconSqi` plutôt que reconstruire un paradigme parallèle.

L’alias ne doit pas effacer la provenance Dict ; il doit enregistrer `exact_lexicon_function`.

### LEX-05 — Changement sensible

Toute modification d’une entrée canonique exige :

- justification linguistique ;
- impact sur les alias `DictSqi` ;
- compilation ciblée ;
- régression des scénarios concernés ;
- mise à jour des golds uniquement après revue.

## Programme de finalisation

1. auditer les 348 fonctions par famille ;
2. classer chacune `certified`, `needs_morphology_review`, `needs_valency_review`, `needs_semantic_review` ;
3. traiter en priorité les catégories à forte structure (`V2/V3/VS/VQ/VA/V2*`, `N2/N3`, `A2`) ;
4. tester les fonctionnels lexicaux sensibles ;
5. atteindre 348/348 `certified`.

## Sortie attendue

`LexiconSqi` final est assez stable pour servir :

- de base de régression ;
- de source prioritaire pour `DictSqi` ;
- de source prioritaire pour les entrées correspondantes de `MorphoDictSqi` côté morphologie ;
- d’exemple de bonne pratique pour les nouvelles analyses lexicales.
