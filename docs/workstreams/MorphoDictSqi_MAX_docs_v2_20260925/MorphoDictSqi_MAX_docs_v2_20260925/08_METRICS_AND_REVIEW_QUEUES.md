# Métriques et queues de revue

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Tableau de bord obligatoire

### Taille / certification

`active_lemgrams`, `certified_C6`, `candidate_C0_C5`, `placeholder_active`, `stale_revalidation`, blockers par type, `excluded`.

### Qualité

`variants_count`, `unprovenanced_count`, `unwaived_multiword_count`, `duplicate_lemgram_count`, `semantic_or_valence_duplicate_count`, `table_conflict_count`, `open_source_conflict_count`.

### Couverture

Par catégorie, classe P3 et source : active/C6/candidate/blocked/placeholder/excluded.

## 2. KPI principaux

Afficher ensemble :

- `certified_C6` absolu ;
- `certified_ratio = certified_C6 / active_lemgrams` ;
- `source_universe_processed_ratio = terminally_classified / eligible_candidates` ;
- `source_certified_yield = C6 / eligible_candidates` ;
- `evidence_density` : distribution du nombre de preuves distinctes par C6 ;
- `stale_ratio` ;
- `placeholder_ratio`.

Aucun KPI unique ne suffit à décrire la qualité.

## 3. Queue de revue morphologique

Champs : `case_id, lemgram_id, base, category, source_ids, evidence_ids, dialect, observed_forms, mapped_features, paradigm_id, expression, current_level, blocker, risk, review_action, decision, reviewer, review_date, decision_id`.

## 4. Queue des classes manquantes

Une ligne par classe, pas par mot : `missing_class_id, category, observed_pattern, examples, discriminating_forms, current_behavior, required_api_shape, source_evidence, impact_count, owner_conversation, status`.

## 5. Queue de conflits

`conflict_id, lemgram_id, evidence_a, evidence_b, conflict_type, materiality, resolution_status, review_record_id`.

## 6. Queue dialectale

Les données Geg restent séparées des KPI C6 standard ; publier correspondances potentielles sans les fusionner.

## 7. Rapport de campagne

Avant/après : C6, placeholders, stale, blockers, classes P3, changements de signatures, conflits, golds, source-universe accounting, baseline globale.
