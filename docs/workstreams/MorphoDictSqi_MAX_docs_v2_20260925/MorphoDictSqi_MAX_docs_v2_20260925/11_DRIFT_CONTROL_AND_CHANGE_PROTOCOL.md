# Contrôle du drift et protocole de changement

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Classes de changement

- **E0 éditorial** : formulation/liens, aucun contrat changé.
- **E1 opérationnel** : outil/rapport sans changement de sémantique des données.
- **E2 sémantique** : identité lemgramme, catégorie, mapping, signature, certification, classe, normalisation ou source universe.

Tout E2 exige decision record, migration et invalidation ciblée.

## 2. Invariants majeurs

Lemgramme≠sens ; valence collapsée ; `variants=0` ; provenance obligatoire ; placeholder≠C6 ; Tosk/Geg séparés ; smart fallback borné ; baseline protégée ; Dict/MorphoDict séparés.

## 3. Changements à décision obligatoire

Catégories, définition du lemgramme, multiwords, naming, classe productive, normalisation, source promotion, C-level semantics, table signature, feature mapping, licence, source universe, règle d'invalidation.

## 4. Anti-drift campaign diff

Comparer : comptes/catégories/C-levels, placeholders/stale/exclusions, variants/multiwords/duplicates, distributions de classes, signatures changées, fonctions renommées/supprimées, source hashes, mapping version, registry version, Wordbench/golds.

Une variation massive non expliquée bloque la livraison.

## 5. Invalidation obligatoire

Les règles de `20_DEPENDENCY_AND_INVALIDATION_RULES.md` ont priorité : un changement de paradigme, mapping ou preuve peut rendre des C6 `STALE_REVALIDATION` même si le code compile encore.

## 6. Migration, pas réécriture opaque

Une règle touchant N entrées doit fournir population ciblée, before/after, reason, tests, dependency impact, rollback/reconstruction et campagne de revalidation.

## 7. DRAFT-MAX

Jamais activé en bloc. Toute idée récupérée doit répondre à un besoin démontré, être minimale, propagée complètement, testée et rétablir la baseline.

## 8. Mise à jour documentaire

Decision record → contrat/schema touché → pipeline/validator → dependency rules → metrics/checklist → README → manifest/changelog.
