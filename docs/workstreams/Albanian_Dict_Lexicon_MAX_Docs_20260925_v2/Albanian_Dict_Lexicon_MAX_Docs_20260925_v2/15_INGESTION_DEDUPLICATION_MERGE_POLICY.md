---
doc_id: DICTMAX-015
title: "Ingestion, déduplication et fusion multi-sources"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Objectif

Permettre une expansion de plusieurs dizaines de milliers d'entrées sans transformer `DictSqi` en agrégat opaque de listes lexicales.

Le pipeline final doit être **ETL lexical reproductible** : acquisition → normalisation → staging → rapprochement → analyse → revue → émission.

## Stages obligatoires

### I0 — source raw immuable

Conserver une copie/hash du matériau source. Aucun nettoyage destructif à ce niveau.

### I1 — extraction structurée

Chaque record extrait reçoit : source, version/hash, localisateur, `source_record_id`, lemma original, POS source, gloss/synset disponibles, dialecte/période si fournis.

### I2 — normalisation non sémantique

Unicode, espaces, ponctuation technique et encodage sont normalisés selon [16_ORTHOGRAPHY_NORMALIZATION_ID_POLICY.md](16_ORTHOGRAPHY_NORMALIZATION_ID_POLICY.md). Aucun changement de catégorie ou de sens ici.

### I3 — rapprochement candidat

Créer des candidats de fusion à partir de clés explicites. Le fuzzy matching peut **proposer** une revue mais ne doit jamais fusionner automatiquement deux unités lexicales.

### I4 — décision de déduplication

Appliquer [14_IDENTITY_SENSE_HOMONYMY_POLICY.md](14_IDENTITY_SENSE_HOMONYMY_POLICY.md). Chaque merge/split est explicable.

### I5 — analyse GF

Catégorie, morphologie, valence et gouvernement sont ajoutés seulement avec preuve suffisante.

### I6 — revue/certification

Promotion par les états Q0–Q7 définis dans `05_PROVENANCE_AND_REVIEW_STATES.md`.

## Priorité des sources

Il n'existe pas une priorité globale unique pour toutes les dimensions.

| Dimension | Autorité principale |
|---|---|
| contrat GF | snapshot RGL verrouillé |
| compilation | GF 3.12 / Wordbench même source lock |
| lemme attesté | source lexicale albanaise tracée |
| morphologie | paradigmes/source albanaise + tests |
| valence/gouvernement | évidence grammaticale/usage albanais |
| maturité/couverture | benchmark English + métriques Albanian |

Une source qui atteste un lemme n'est pas automatiquement autorité sur sa valence.

## Conflits de sources

Les conflits ne sont pas résolus par ordre de chargement.

Le record doit pouvoir stocker :

- `claims[]` ;
- source de chaque claim ;
- statut `accepted/rejected/unresolved` ;
- justification de l'adjudication ;
- date/reviewer lorsque nécessaire.

Un conflit non résolu bloque la certification de la dimension concernée, mais n'oblige pas à supprimer l'entrée du staging.

## Déduplication

### Autorisé automatiquement

Uniquement pour des identités strictement démontrables : même `source_record_id`, répétition byte-identique, mapping stable déjà approuvé.

### Revue obligatoire

- lemme identique mais POS différent ;
- même lemma avec plusieurs synsets ;
- formes avec/sans diacritiques ;
- multiwords très proches ;
- Tosk/Geg apparentés ;
- variantes orthographiques ;
- doublons provenant de dictionnaires différents.

## Traçabilité des merges

Chaque unité canonique conserve la liste complète :

```text
source_members = [source_record_id...]
merge_rule = <stable rule id>
merge_decision = <decision id or automatic exact rule>
```

## Licence et redistribution

Avant ingestion :

- licence ou conditions d'utilisation connues ;
- droit de redistribuer le dérivé clarifié ;
- notice tierce si nécessaire ;
- séparation possible entre preuve consultable et donnée redistribuable.

Une source utile linguistiquement mais non redistribuable peut justifier une analyse sans être recopiée dans les ressources distribuées.

## Gate d'un nouveau corpus

Un nouveau corpus ne rejoint la génération active que si :

- source lock enregistré ;
- extracteur reproductible ;
- schéma validé ;
- taux de collisions calculé ;
- échantillon de QA passé ;
- stratégie de déduplication documentée ;
- capacité de revue réaliste ;
- métriques avant/après produites.
