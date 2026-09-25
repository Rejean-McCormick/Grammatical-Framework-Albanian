# Politique de conflits de sources et de revue

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Types de conflit

- `FORM_CONFLICT` — mêmes traits, surfaces différentes ;
- `FEATURE_CONFLICT` — même surface/lemme, analyses différentes ;
- `LEMMA_CONFLICT` — baseform différente ;
- `GENDER_CONFLICT` ;
- `CATEGORY_CONFLICT` ;
- `DIALECT_CONFLICT` — standard vs Geg/mixte ;
- `ORTHOGRAPHY_CONFLICT` — variation pouvant être normative ou éditoriale ;
- `SOURCE_ERROR_SUSPECTED` — anomalie possible, jamais corrigée silencieusement.

## 2. Matérialité

Un conflit est `material` s'il peut changer catégorie, trait inhérent, choix de classe, cellule de table ou identité du lemgramme. Aucun conflit material ouvert n'est compatible avec C6.

## 3. Résolution

1. conserver les deux preuves ;
2. vérifier locator/hash ;
3. déterminer dialecte, époque, convention orthographique et niveau d'analyse ;
4. chercher une troisième preuve si nécessaire ;
5. décider : coexistence morphologique, standard vs dialectal, variante de paradigme, erreur source suspectée, ou blocage ;
6. enregistrer `REV` et décision si règle généralisable.

## 4. Pas de vote simple

Deux sources contre une ne suffisent pas automatiquement. La qualité, précision des traits, statut standard et proximité avec le phénomène comptent. Les modèles étrangers n'entrent pas dans un vote sur une forme albanaise.

## 5. Revue par risque

- faible : entrée régulière sous classe P3 avec preuves exactes ; revue stratifiée possible ;
- moyen : forme partielle/ambigüe, normalisation non triviale ; revue explicite ;
- élevé : irrégulier, homographe, classe nouvelle, conflit, dialecte, changement de genre/catégorie ; revue individuelle obligatoire.

## 6. Résultat

`resolved_accept`, `resolved_split_lemgrams`, `resolved_dialectal_only`, `resolved_source_error_not_corrected`, `blocked_conflict`.

La source originale reste inchangée ; les corrections sont des décisions du pipeline, jamais des réécritures de preuve.
