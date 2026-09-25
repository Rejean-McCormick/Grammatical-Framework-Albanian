---
doc_id: DICTMAX-009
title: "Tests, validation et certification"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Principe

Le pipeline doit distinguer au moins quatre notions :

1. **validation statique** ;
2. **compilation GF** ;
3. **validation constructionnelle/scénarios** ;
4. **certification linguistique/gold**.

Aucune ne remplace la suivante.

## Gate 0 — intégrité des sources

- source lock conforme ;
- provenance parseable ;
- inputs présents ;
- generator/version connus ;
- pas de mélange de snapshots.

## Gate 1 — validation statique Dict

Doit passer avant GF :

- inventaire 1:1 `DictSqiAbs` ↔ `DictSqi` ;
- IDs uniques ;
- catégories valides ;
- syntaxe structurelle basique ;
- aliases existants ;
- provenance complète ;
- aucune contradiction statut/placeholder ;
- règles multiword/quarantaine respectées.

## Gate 2 — compilation ciblée

Pour un lot :

- compiler les modules Dict concernés ;
- conserver stdout/stderr ;
- classifier la première erreur réelle ;
- ne pas corriger en abaissant l’analyse linguistique.

## Gate 3 — baseline Wordbench

Après modification GF générée/canonique :

- cible : 58/58 ;
- scénarios : 52/52 ;
- aucune régression de gold existant ;
- warnings nouveaux expliqués ou zéro warning bloquant selon mode strict.

## Gate 4 — tests de valence

Une entrée promue vers une catégorie structurée doit avoir un usage qui exerce le complément pertinent.

Exemples de familles à tester :

- V2 : objet ;
- V3 : deux compléments ;
- VS/VQ : clause déclarative/interrogative ;
- VV : complément verbal + contrôle si applicable ;
- V2A/V2S/V2Q/V2V : objet + second complément ;
- N2/N3/A2 : complément nominal/prépositionnel attendu.

## Gate 5 — revue linguistique

Les 569 CASEs reviewables constituent une baseline de campagne, pas une certification automatique.

Pour chaque nouvelle famille :

- output reviewable ;
- statut `valid`, `valid_variant`, `questionable` ou `invalid` selon protocole de revue du projet ;
- gold uniquement pour résultats acceptés ;
- une modification de gold doit être expliquée.

## Gate 6 — certification d’entrée

Une entrée `gold_certified` doit avoir :

- provenance ;
- morphologie justifiée ;
- catégorie/valence justifiée ;
- compilation ;
- scénario pertinent ;
- revue linguistique.

Toutes les entrées n’exigent pas un gold individuel si elles appartiennent à une famille productive déjà testée. Dans ce cas, la certification doit pointer vers le paradigme/frame et ses tests représentatifs.

## Tests négatifs

Le système doit aussi vérifier que :

- un placeholder ne peut pas être marqué certified ;
- une catégorie riche sans metadata requise échoue au validateur ;
- une nouvelle entrée sans provenance échoue ;
- une collision d’ID échoue ;
- un multiword non revu ne passe pas la gate finale ;
- un rebuild avec source lock différent est détecté.

## Livrable de chaque lot

Chaque livraison indique :

- fichiers modifiés ;
- nombre d’entrées touchées ;
- promotions/démotions de statut ;
- tests exécutés ;
- résultat GF/Wordbench ;
- golds changés ou inchangés ;
- risques ;
- entrées bloquées et handoffs.

## Gate 7 — QA de batch

Pour tout batch non trivial :

- échantillon de revue documenté ;
- cas limites inclus ;
- taux d'erreur observé ;
- conflits/adjudications listés ;
- familles/règles touchées identifiées.

Voir `19_REVIEW_QA_SAMPLING_AND_ADJUDICATION.md`.

## Gate 8 — compatibilité et performance

Pour un changement d'identité, de schéma, de normalisation ou un gros saut de volume :

- migration testée ;
- diff d'IDs ;
- manifest de release ;
- mesures de génération/compilation avant/après ;
- aucune optimisation ne change silencieusement les surfaces linguistiques.

Voir `20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md`.
