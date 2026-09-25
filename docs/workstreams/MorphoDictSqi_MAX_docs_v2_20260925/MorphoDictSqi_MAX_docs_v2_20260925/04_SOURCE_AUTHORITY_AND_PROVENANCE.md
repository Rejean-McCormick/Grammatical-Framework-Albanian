# Autorité des sources et provenance

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Deux axes d'autorité

### A. Contrats GF / architecture

1. signatures/API exactes du RGL verrouillé ;
2. résultats GF 3.12 reproductibles ;
3. source Albanian courante ;
4. ressources/paradigmes réellement importés ;
5. décisions Albanian acceptées ;
6. tests/golds ;
7. modèles RGL compatibles ;
8. commentaires/historique.

### B. Vérité morphologique albanaise

1. preuves albanaises explicites et traçables ;
2. analyses/golds Albanian déjà certifiés ;
3. classe productive P3 démontrée ;
4. source Albanian actuelle comme implémentation à tester ;
5. modèles typologiques comme aide architecturale seulement.

Un modèle étranger ne certifie jamais une forme albanaise.

## 2. Rôle des références Tosk/Geg fournies

- Tosk : preuve/revue pour la cible standard lorsque l'analyse est explicite et traçable ;
- Geg : comparaison dialectale/historique, étiquetée `DIALECTAL_GEG_ONLY` sauf décision de support dialectal.

Une forme Geg ne peut pas être normalisée automatiquement en Tosk.

## 3. Provenance obligatoire

Le modèle complet est défini dans `15_DATA_MODEL_AND_SCHEMAS.md`. Chaque lemgramme actif doit être relié à un ou plusieurs `evidence_id` et à un `source_id` verrouillé.

Les rôles de preuve incluent au minimum : `lemma`, `category`, `gender`, `number`, `surface_form`, `principal_part`, `government`, `irregularity`, `dialect`, `negative_evidence`.

## 4. Observation vs calcul

Toujours distinguer :

- `observed` : explicitement source ;
- `normalized` : transformation déterministe ;
- `derived` : cellule calculée par classe déjà validée ;
- `inferred` : choix de classe proposé à partir de preuves partielles ;
- `assumed` : hypothèse non certifiable.

Une forme dérivée est normale dans un paradigme. Ce qui ne peut pas être caché est l'inférence du **choix** du paradigme.

## 5. Conflits

Tout conflit matériel suit `22_SOURCE_CONFLICT_AND_REVIEW_POLICY.md`. Un C6 ne peut avoir de conflit matériel ouvert.

## 6. Licence / redistribution

Pour chaque source : propriétaire/auteur, locator, hash/date, licence/statut, rôle autorisé, droit de redistribution et droit de dérivation si connu. Une source peut être autorisée pour revue sans être autorisée pour extraction massive dans le dépôt.
