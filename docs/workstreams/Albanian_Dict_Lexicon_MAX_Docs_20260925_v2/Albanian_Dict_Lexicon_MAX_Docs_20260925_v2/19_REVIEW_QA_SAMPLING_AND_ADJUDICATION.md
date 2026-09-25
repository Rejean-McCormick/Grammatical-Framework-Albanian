---
doc_id: DICTMAX-019
title: "QA de revue linguistique, échantillonnage et adjudication"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Objectif

Rendre la revue linguistique **répétable, auditable et scalable**. Une file de 569 CASEs ou plusieurs milliers d'entrées ne peut pas être certifiée par impression générale.

## Unité de revue

Une revue porte sur une ou plusieurs dimensions explicites :

- attestation du lemme ;
- forme canonique ;
- catégorie GF ;
- morphologie/paradigme ;
- valence ;
- gouvernement ;
- dialecte/registre ;
- surface générée ;
- compatibilité sémantique avec la fonction abstraite.

Une entrée peut être validée sur certaines dimensions et rester ouverte sur d'autres.

## Types de revue

### Revue individuelle

Obligatoire pour : irréguliers, catégories rares, conflits de sources, splits/merges, valence complexe, multiwords atypiques.

### Revue de famille

Permise pour une famille productive lorsque :

- règle morphologique/lexicale explicite ;
- critères d'appartenance machine-checkables ;
- exemples positifs et négatifs ;
- échantillon représentatif revu ;
- exceptions explicitement exclues ;
- scénario/gold de famille disponible.

## Échantillonnage

Pour chaque batch important, produire un échantillon comprenant au minimum :

- cas centraux ;
- cas limites ;
- collisions/ambiguïtés ;
- chaque catégorie concernée ;
- chaque règle de génération modifiée ;
- entrées de plusieurs sources si fusion multi-sources.

Le taux exact dépend du risque ; il doit être enregistré dans le batch report et ne peut pas être réduit silencieusement.

## Double revue / adjudication

Exiger une deuxième revue ou adjudication pour :

- changement d'un gold existant ;
- changement de type d'une entrée canonique Lexicon ;
- nouvelle politique de valence ;
- conflit entre références albanaises ;
- split/merge d'un ID publié ;
- règle appliquée à un grand nombre d'entrées.

## Désaccords

Un désaccord produit un état `needs_adjudication`, jamais une moyenne implicite.

Le record d'adjudication contient :

```text
entry_or_family
claim_a + evidence
claim_b + evidence
decision
rationale
reviewer/adjudicator
date
reopen_condition
```

## Réouverture

Une entrée/famille certifiée est réouverte si :

- nouvelle référence plus forte ;
- régression de gold ;
- changement de paradigme/core ;
- changement de contrat abstrait ;
- bug de générateur ;
- preuve qu'une règle de famille sur-génère/sous-génère.

## QA du reviewer

Le dashboard suit :

- volume revu ;
- taux d'adjudication ;
- taux de réouverture ;
- erreurs découvertes après certification ;
- couverture des catégories/familles ;
- provenance des décisions.

Ces métriques évaluent le processus, pas les personnes.

## Certification Q7

Q7 nécessite :

- toutes dimensions requises fermées ;
- GF/scénario approprié vert ;
- gold lorsque le comportement de surface mérite un oracle stable ;
- evidence refs ;
- pas de blocker ouvert ;
- compatibilité/migration traitée si l'entrée était déjà publiée.
