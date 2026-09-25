---
doc_id: DICTMAX-011
title: "Plan de réalisation et handoffs"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Stratégie générale

Le travail avance par lots **petits, mesurables et régressables**. Aucun mega-overlay DRAFT-MAX n’est activé.

## Phase D0 — verrouillage et outils

- fixer source lock ;
- rendre générateur repository-relative ;
- enrichir le schéma de provenance ;
- automatiser métriques ;
- ajouter les validateurs négatifs.

**Sortie** : rebuild déterministe de la baseline sans changement sémantique.

## Phase D1 — LexiconSqi canonique

- auditer 348/348 ;
- prioriser valence structurée ;
- valider morphologie ;
- ajouter tests manquants ;
- établir statut par fonction.

**Sortie** : Lexicon 100 % canonique/revu.

## Phase D2 — verbes Dict à forte valeur

Priorité parce que l’état actuel contient 2 175 V mais très peu de catégories riches.

- sélectionner verbes fréquents/attestés ;
- analyser intransitif/transitif/ditransitif/clausal/control ;
- promouvoir vers V2/V3/VS/VQ/VV/V2* lorsque justifié ;
- remplacer `invariantV` par paradigmes réels.

**Sortie** : réduction forte de la dette verbale, nouveaux scénarios de valence.

## Phase D3 — noms et adjectifs

- N -> N/N2/N3 selon relation ;
- A -> A/A2 ;
- genre/pluriel/definiteness vérifiés via paradigmes publics ;
- remplacer invariant N/A par analyses réelles.

## Phase D4 — adverbes, prépositions, fonctionnels, PN

- étendre couverture ;
- aligner closed class sur `StructuralSqi` ;
- gouvernement explicite des prépositions ;
- politique de noms propres séparée.

## Phase D5 — multiwords

Trier les 1 830 multiwords actuels en : lexicalisés, composés flexionnels, compositionnels, noms propres, artefacts, locutions à valence.

Aucun batch massif de promotion sans stratégie par classe.

## Phase D6 — expansion de sources

Ajouter de nouveaux inventaires seulement après :

- licence/provenance ;
- normalisation ;
- stratégie d’identifiants ;
- déduplication ;
- séparation attestation/analyse ;
- capacité de revue.

## Phase D7 — English-scale breadth

Comparer les trous de couverture par catégorie et domaine au benchmark English, sans forcer les proportions.

## Phase D8 — certification finale

- placeholders actifs -> 0 dans distribution certifiée ;
- source lock final ;
- rebuild clean ;
- 58/58 + 52/52 ;
- golds stables ;
- checklist finale.

# Handoffs obligatoires

Ce workstream ne modifie pas la morphologie fondamentale pour une entrée.

## Vers paradigmes/morphologie

Créer un handoff si :

- aucun constructeur public ne couvre une classe productive ;
- principal parts nécessaires ne sont pas représentables ;
- smart paradigm rejette une forme pourtant régulière d’une classe identifiée ;
- un type morphologique core est insuffisant.

## Vers système verbal / TAM / voix / clitiques

Créer un handoff si la réalisation correcte dépend d’un comportement core non modélisé :

- non-active/passive/reflexive ;
- placement/fusion clitique ;
- complément subjunctif/non-fini ;
- contrôle/raising non représentable ;
- auxiliaire/TAM nécessaire.

## Vers syntaxe/valence core

Créer un handoff si la catégorie GF existe mais que le contrat concret Albanian ne peut pas porter le gouvernement nécessaire sans modification architecturale.

## Format de handoff

Toujours fournir :

- `gf_id`/lemme ;
- analyse souhaitée ;
- preuve albanaise ;
- constructeur/type manquant ;
- test qui échouerait aujourd’hui ;
- aucune solution placeholder proposée comme final.

## Phase D0.5 — fermer les invariants d'échelle

Avant D6/D7 :

- appliquer les politiques `14`–`20` ;
- refactorer le générateur pour GEN-01 ;
- versionner le schéma ;
- établir les baselines de performance ;
- créer les rapports automatiques de collision/merge/split.

D6 « expansion de sources » est bloquée si D0.5 n'est pas satisfait.
