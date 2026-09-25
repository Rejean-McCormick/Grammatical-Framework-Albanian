---
doc_id: DICTMAX-010
title: "Métriques et dashboard de maturité"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Pourquoi ces métriques

Le nombre total d’entrées est nécessaire mais insuffisant. Le dashboard doit empêcher qu’une croissance de placeholders soit présentée comme progrès de maturité.

## Baseline Conversation 3

### DictSqi

| Mesure | Baseline |
|---|---:|
| total | 6 720 |
| baseline exact aliases | 337 |
| imported unreviewed | 6 339 |
| reference attested unreviewed | 44 |
| multiword | 1 830 |
| compile-safe N | 4 134 |
| compile-safe A | 64 |
| compile-safe V | 2 141 |

### Catégories DictSqi

| Catégorie | Albanian current | English benchmark |
|---|---:|---:|
| N | 4 310 | 36 239 |
| A | 110 | 12 919 |
| V | 2 175 | 4 016 |
| V2 | 50 | 6 730 |
| V3 | 5 | 75 |
| VS | 4 | 261 |
| VV | 0 | 112 |
| V2V | 1 | 198 |
| Adv | 19 | 1 190 |
| PN | 2 | 2 750 |
| Prep | 12 | 186 |
| VA | 1 | 38 |
| A2 | 2 | 7 |
| N2 | 3 | 3 |
| V2S | 1 | 4 |
| V2Q | 1 | 1 |

Ces nombres n’impliquent pas qu’Albanian doit reproduire la distribution English. Ils montrent où une investigation de couverture est justifiée.

## Métriques obligatoires à chaque milestone

### Volume

- `dict_total_entries`
- `new_entries_since_baseline`
- `active_entries`
- `quarantined_entries`

### Qualité

- `% Q0/Q1/Q2/Q3/Q4/Q5/Q6/Q7`
- `compile_safe_placeholder_count`
- `placeholder_share_of_active_dict`
- `provenance_complete_count`
- `morphology_analyzed_count`
- `category_analyzed_count`
- `valency_verified_count`
- `gold_certified_count`

### Structure

- count par catégorie GF ;
- count par valency frame ;
- governed-preposition count ;
- multiword count par classe de traitement ;
- proper-name count séparé.

### Reproductibilité

- source lock match ;
- generator roundtrip clean ;
- unexpected generated diff count ;
- static validator status.

### Régression

- GF targets pass / total ;
- scenarios pass / total ;
- gold regressions ;
- new warnings.

## Gates de maturité proposés

### M0 — baseline preserved

58/58 + 52/52 ; métriques exactes établies.

### M1 — canonical Lexicon certified

348/348 fonctions Lexicon revues selon politique ; 0 placeholder canonique.

### M2 — Dict de travail majoritairement analysé

Le volume actif ne provient plus principalement de placeholders. Les catégories à valence ont un taux de revue mesurable et croissant.

### M3 — Dict MAX candidate

- provenance 100 % ;
- placeholders résiduels explicitement séparés de la couverture mature ;
- principaux champs lexicaux couverts à grande échelle ;
- tests de familles stables ;
- générateur reproductible.

### M4 — English-parity lexical candidate

- couverture à une échelle comparable pour le lexique courant et spécialisé visé ;
- profondeur catégorielle démontrée ;
- aucune grande famille absente sans justification ;
- dette explicitement quantifiée ;
- release gates complets.

### M5 — final certified distribution

- 0 placeholder compile-safe dans le Dict distribué comme certifié ;
- les entrées non résolues sont conservées hors distribution certifiée/queue de travail ;
- 58/58 + 52/52 ;
- golds stables ;
- source + generator + outputs reproductibles.

## Anti-gaming

Interdit de :

- gonfler `dict_total_entries` avec noms propres pour prétendre à la parité ;
- compter les sens WordNet identiques comme nouvelles analyses si la fonction GF n’apporte rien ;
- compter une entrée placeholder comme morphology/category analyzed ;
- compter une compilation comme revue linguistique ;
- comparer les counts English sans expliquer les différences typologiques.

## Métriques v2 supplémentaires

### Identité / ingestion

- `source_records_total`
- `canonical_lexemes_total`
- `merge_count`
- `split_count`
- `unresolved_collision_count`
- `unresolved_source_conflict_count`

### Couverture utile

- `active_analyzed_total`
- `certified_total`
- `staged_raw_total`
- `reviewable_backlog_total`
- `category_coverage_matrix_complete` (35/35 décisions documentées, pas 35/35 nécessairement peuplées)

### QA

- `sampled_entries`
- `sample_error_rate`
- `adjudication_count`
- `reopened_certified_count`

### Compatibilité / scale

- `deprecated_id_count`
- `breaking_id_changes`
- `generation_seconds`
- `static_validation_seconds`
- `gf_dict_compile_seconds`
- `wordbench_global_scan_seconds`
- `generated_dict_bytes`

## Definition of done mesurable

Une milestone ne publie jamais un seul nombre de taille. Elle publie au minimum : volume brut, volume analysé, volume certifié, placeholders, distribution catégorielle, backlog de revue et statut des gates.
