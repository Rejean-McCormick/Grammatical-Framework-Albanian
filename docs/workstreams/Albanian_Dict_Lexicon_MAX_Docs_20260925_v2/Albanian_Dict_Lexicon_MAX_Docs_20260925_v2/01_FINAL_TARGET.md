---
doc_id: DICTMAX-001
title: "Objectif final — équivalence fonctionnelle avec English RGL"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Définition de la cible

La cible finale est constituée de **deux produits lexicaux complémentaires**, avec des responsabilités strictement séparées.

## A. `LexiconSqi` final

`LexiconSqi` est le **petit lexique RGL canonique**.

Le `abstract/Lexicon.gf` fourni contient 348 fonctions. Le snapshot `LexiconSqi.gf` courant couvre déjà 348/348. La tâche finale n’est donc pas d’augmenter arbitrairement sa taille, mais de certifier chaque réalisation.

Répartition du contrat abstrait actuel :

| Catégorie | Fonctions |
|---|---:|
| N | 182 |
| V2 | 53 |
| A | 48 |
| V | 34 |
| V3 | 5 |
| Adv | 4 |
| VS | 4 |
| N2 | 3 |
| A2 | 2 |
| PN | 2 |
| VQ | 2 |
| Ord | 2 |
| Interj | 1 |
| V2S | 1 |
| V2Q | 1 |
| VA | 1 |
| V2V | 1 |
| N3 | 1 |
| V2A | 1 |

### Critère final Lexicon

Chaque fonction abstraite requise doit avoir :

- un lemme/lexème albanais approprié ;
- une catégorie GF exacte ;
- une construction morphologique réelle ;
- la valence et le gouvernement nécessaires ;
- une provenance linguistique ;
- au moins un test ciblé lorsque la réalisation n’est pas triviale ;
- aucune dépendance à un placeholder compile-safe ;
- aucune divergence non documentée entre la sémantique abstraite et la réalisation albanaise.

`LexiconSqi` final est une **référence de confiance**, pas un entrepôt massif.

## B. `DictSqi` final

`DictSqi` est le **grand dictionnaire syntaxique/morphosyntaxique**.

Il doit fournir un inventaire lexical à grande échelle réellement utilisable dans les constructions GF. Une entrée n’est pas mature parce qu’un mot est attesté ou parce qu’une fonction compile : elle doit porter le niveau d’analyse requis par sa catégorie.

### Benchmark English fourni

Le `DictEngAbs` du snapshot RGL fourni contient 64 931 fonctions. Principales catégories :

| Catégorie | DictEngAbs |
|---|---:|
| N | 36 239 |
| A | 12 919 |
| V2 | 6 730 |
| V | 4 016 |
| PN | 2 750 |
| Adv | 1 190 |
| VS | 261 |
| V2V | 198 |
| Prep | 186 |
| VV | 112 |
| V3 | 75 |
| Interj | 40 |
| VA | 38 |
| Subj | 22 |
| V2A | 15 |
| Det | 14 |
| VQ | 7 |
| A2 | 7 |
| V2S | 4 |
| N2 | 3 |
| V2Q | 1 |

Ce tableau sert à détecter des **dimensions lexicales potentiellement sous-développées**. Il ne fixe pas la distribution correcte de l’albanais.

### Cible de maturité

La version finale doit avoir :

1. **large couverture** : un ordre de grandeur lexical comparable à un grand RGL, sous réserve des sources albanaises disponibles et licenciées ;
2. **profondeur catégorielle** : pas seulement N/A/V, mais N2/N3, A2, V2/V3, VA/VS/VQ/VV, V2A/V2S/V2Q/V2V, Adv, PN, Prep et autres catégories lorsque l’albanais et les contrats GF les justifient ;
3. **valence réelle** : arguments et compléments correctement typés ;
4. **gouvernement réel** : prépositions/cas sélectionnés explicitement lorsque lexicalement gouvernés ;
5. **morphologie réelle** : paradigmes publics ou irréguliers attestés ;
6. **provenance totale** : aucune entrée sans origine et statut ;
7. **génération reproductible** : rebuild déterministe à source lock identique ;
8. **revue mesurable** : la dette non revue est quantifiée, jamais cachée ;
9. **certification distincte** : compilation, scénario et gold sont des niveaux différents.

## C. Ce que la version finale contient matériellement

### Code GF

- `LexiconSqi.gf` — lexique canonique 348/348 revu ;
- `DictSqiAbs.gf` — grand inventaire de fonctions lexicales ;
- `DictSqi.gf` — réalisations correspondantes ;
- aucun changement de morphologie fondamentale introduit seulement pour « faire passer » une entrée.

### Sources de vérité lexicales

- tables normalisées des sources lexicales ;
- registre de provenance enrichi ;
- registre de décisions de typage/valence ;
- exclusions/quarantaine explicites ;
- mapping des identifiants historiques et migrations éventuelles.

### Outils

- générateur repository-relative et déterministe ;
- validateurs statiques stricts ;
- génération des métriques ;
- vérification des hashes et de la reproductibilité ;
- contrôles de cohérence abstrait/concret/provenance.

### Validation

- tests de familles lexicales ;
- scénarios de valence/gouvernement ;
- régression 58/58 + 52/52 ;
- golds revus uniquement ;
- rapport de couverture/parité.

## D. Définition de « équivalent à English »

L’équivalence est **fonctionnelle et de maturité**, pas isomorphique.

Est attendu :

- même capacité à chercher et utiliser un lexème courant ;
- même profondeur de catégories lorsque pertinente ;
- même discipline de paradigmes et d’irréguliers ;
- même qualité de compilation/reproductibilité ;
- couverture lexicale de grande échelle ;
- documentation des exceptions et limites.

N’est pas attendu :

- même nombre exact d’entrées ;
- même proportion de V2, N2, A2, etc. ;
- mêmes prépositions ou mêmes structures de complément ;
- imitation de l’anglais quand l’albanais encode le phénomène autrement.

## E. Sortie finale stricte

Une version « final/parity » ne doit plus émettre dans le dictionnaire certifié de **placeholder compile-safe non analysé**. Les items encore incertains peuvent rester dans les ressources/queues de travail, mais ne comptent pas comme couverture certifiée et ne doivent pas être présentés comme entrées finales analysées.

## F. Conditions de complétude v2

La cible finale n'est atteinte que si les dimensions suivantes sont toutes gouvernées par une politique normative :

- identité/sens/homonymie : `14_IDENTITY_SENSE_HOMONYMY_POLICY.md` ;
- ingestion/déduplication : `15_INGESTION_DEDUPLICATION_MERGE_POLICY.md` ;
- orthographe/IDs : `16_ORTHOGRAPHY_NORMALIZATION_ID_POLICY.md` ;
- couverture des 35 catégories de référence : `17_FULL_CATEGORY_COVERAGE_POLICY.md` ;
- priorisation de l'expansion : `18_COVERAGE_PRIORITIZATION_AND_EXPANSION.md` ;
- QA/adjudication : `19_REVIEW_QA_SAMPLING_AND_ADJUDICATION.md` ;
- compatibilité/schema/performance : `20_COMPATIBILITY_SCHEMA_VERSIONING_AND_SCALE.md`.

Une croissance lexicale massive avant fermeture des politiques P0 est considérée comme du staging, pas comme une progression de maturité.
