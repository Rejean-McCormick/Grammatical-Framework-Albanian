---
doc_id: DICTMAX-008
title: "Politique d’usage des références linguistiques albanaises"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Références actuellement fournies

Le paquet `Albanian_ref` contient :

- `Albanian.pdf` ;
- `Albanian_Complete_Grammar.html` ;
- `Tosk_Dictionary_Master.html` ;
- `Tosk_Glossary_Master.html` ;
- `Geg_Glossary_Master.html` ;
- cinq ensembles de leçons (`Lesson_10` à `Lesson_50`).

Les pages HTML proviennent du matériel **Albanian Online** du Linguistics Research Center, University of Texas at Austin.

## Ce que ces sources apportent

### Complete Grammar / leçons

Utiles pour :

- descriptions grammaticales ;
- exemples contextualisés ;
- morphologie observable ;
- cas et prépositions ;
- comportement des pronoms/fonctionnels ;
- indices de valence et de complémentation.

### Tosk Base Form Dictionary

La source se présente comme un index de formes de base sous-jacentes aux formes de surface rencontrées dans les textes de leçon. Elle est particulièrement utile pour :

- attestation du lemme ;
- liens vers usages réels dans le corpus de leçons ;
- observation de formes fléchies ;
- vérification de genre/POS lorsque fourni.

Elle ne constitue pas automatiquement un dictionnaire syntaxique RGL complet.

### Tosk Glossary

Utile pour formes de surface annotées et contexte Tosk/standard pertinent.

### Geg Glossary

Utile comme preuve dialectale/historique comparative. Une forme Geg ne doit pas être promue comme forme standard sans preuve séparée.

## Dialecte et période

Les références incluent du standard moderne, du Tosk, du Geg et des textes de périodes variées. Chaque preuve utilisée pour une entrée doit donc indiquer si possible :

- `standard` ;
- `Tosk` ;
- `Geg` ;
- `historical` ;
- `unknown`.

La langue officielle moderne est fortement basée sur le Tosk, mais « attesté en Tosk » ne signifie pas automatiquement « forme canonique moderne unique ».

## Niveaux de preuve

| Preuve | Ce qu’elle peut justifier |
|---|---|
| entrée de dictionnaire/base form | existence/lemme/sens général |
| forme annotée dans leçon | cellule morphologique/contextualisation |
| plusieurs exemples constructionnels | hypothèse de valence/gouvernement |
| description grammaticale explicite | règle ou distinction grammaticale |
| `LexiconSqi` déjà certifié | réutilisation canonique dans même contrat |
| modèle étranger | architecture GF possible, jamais vérité albanaise |

## Règle de triangulation

Pour une décision sensible (V2/V3/V2V, gouvernement, N2/N3, A2, multiword complexe) :

- préférer une description grammaticale ou plusieurs exemples cohérents ;
- enregistrer les exemples/source IDs ;
- distinguer faits observés et interprétation GF ;
- ajouter un test.

## English et langues modèles

English : benchmark de couverture/API/maturité.

Bulgarian, Macedonian, Greek, Romanian, Italian, German, French, Spanish, Finnish, Swedish : exemples ciblés lorsque leur architecture aide à résoudre une question précise.

Ne charger/comparer que les modèles nécessaires au phénomène ; ne jamais décider par vote majoritaire entre langues.

## Ajout futur de références

Toute nouvelle référence doit être enregistrée avec :

- titre/auteur/éditeur ou dépôt ;
- version/date ;
- dialecte/période ;
- portée ;
- licence/conditions ;
- hash du fichier fourni ;
- types de décisions pour lesquelles elle est admissible.
