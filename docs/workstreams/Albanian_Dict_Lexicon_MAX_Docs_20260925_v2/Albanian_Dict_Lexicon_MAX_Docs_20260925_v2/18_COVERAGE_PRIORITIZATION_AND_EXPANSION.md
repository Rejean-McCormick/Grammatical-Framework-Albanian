---
doc_id: DICTMAX-018
title: "Priorisation de couverture et stratégie d'expansion"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Objectif

Empêcher l'expansion de `DictSqi` de devenir une course au nombre brut d'entrées.

Le dictionnaire doit d'abord devenir **utile**, puis **large**, puis **profondément certifié**.

## Axes de priorité

Chaque candidat peut être scoré pour planification, mais jamais pour certification linguistique, sur :

- fréquence/usage général si une source fiable est disponible ;
- présence dans plusieurs références albanaises ;
- valeur constructionnelle (verbes à valence, prépositions, noms relationnels, adjectifs à complément) ;
- couverture d'un trou catégoriel ;
- représentativité d'une famille morphologique ;
- importance pour les 348 concepts du Lexicon canonique ;
- impact sur des scénarios réels ;
- coût de revue ;
- dépendance à un blocker core.

## Vagues recommandées

### P0 — infrastructure et vérité

- source lock ;
- générateur repo-relative ;
- schéma versionné ;
- IDs stables ;
- dashboard exact.

### P1 — LexiconSqi 348/348 certifié

Haute valeur : chaque concept canonique devient une référence de confiance.

### P2 — verbes à forte valeur

Promouvoir en priorité les `V` importés pour lesquels une valence riche est attestable : V2/V3/VS/VQ/VV/VA/V2*.

### P3 — noms/adjectifs relationnels

Identifier N2/N3/A2 et familles morphologiques fréquentes.

### P4 — adverbiaux et fonctionnels

Fermer les trous de catégories utiles sans dupliquer `StructuralSqi`.

### P5 — multiwords

Traiter par classes, jamais en bloc.

### P6 — breadth lexical

Ajouter de nouvelles sources après maturation du pipeline et QA.

### P7 — long tail

Lexique rare/spécialisé seulement une fois les grandes lacunes usuelles maîtrisées.

## Budget de placeholders

Le nombre absolu de placeholders peut temporairement augmenter lors d'une nouvelle ingestion **seulement dans le staging**, jamais dans la couverture annoncée comme mature.

Le dashboard doit afficher séparément :

- `staged_raw_total` ;
- `active_analyzed_total` ;
- `certified_total` ;
- `placeholder_total` ;
- `placeholder_share_active`.

## Critère « beaucoup plus grand »

Aucun seuil numérique unique n'est suffisant. Une milestone d'expansion doit publier :

- total ;
- % analysé ;
- % certifié ;
- couverture par catégorie ;
- couverture par fréquence/domaine si mesurable ;
- trous majeurs ;
- comparaison English descriptive.

## Stop conditions

Suspendre l'expansion et corriger l'infrastructure si :

- collisions d'IDs non déterministes ;
- provenance incomplète ;
- taux d'échec GF augmente ;
- revue ne suit plus le rythme d'ingestion ;
- placeholders deviennent majoritaires dans la surface « active » ;
- générateur produit des diffs non expliqués.

## Principe de valeur

> Une nouvelle entrée Q1 n'est pas équivalente à une entrée Q6/Q7. Les métriques de volume doivent toujours être accompagnées d'une métrique de maturité.
