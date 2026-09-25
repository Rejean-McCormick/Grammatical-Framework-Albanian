# Mapping des preuves linguistiques vers les traits GF

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Principe

Une source externe peut utiliser une terminologie plus pauvre, différente ou ambiguë. Le pipeline ne complète jamais silencieusement les traits manquants.

Version initiale : `feature_map_version = FMAP-1`.

## 2. Résultat d'un mapping

Chaque observation reçoit :

- `exact` : une feature path GF déterminée ;
- `ambiguous` : ensemble fini de feature paths compatibles ;
- `unmapped` : information insuffisante ;
- `incompatible` : analyse source contredit le contrat/entrée.

## 3. Matching

- `exact` passe si la cellule exacte produit la surface normalisée ;
- `ambiguous` passe si au moins une cellule de l'ensemble la produit, mais l'observation ne peut pas servir seule à distinguer les classes qui restent compatibles ;
- `unmapped` peut soutenir l'existence du lemme, pas C4 pour une cellule précise ;
- `incompatible` ouvre un blocker ou conflit.

## 4. Normalisation linguistique

Autorisé : Unicode NFC et transformations explicitement répertoriées. Interdit par défaut : accent stripping, case folding linguistique, conversion dialectale, reconstruction d'une forme absente.

## 5. Noms

Mapper quand la source le permet : `Species`, `Case`, `Number`, `Gender`. Une forme donnée seulement comme « plural » reste ambiguë sur case/species si la source ne précise pas davantage.

## 6. Adjectifs

Mapper `Case×Gender×Number`; `clit` est un trait structurel/lexical de l'analyse GF et doit être prouvé par l'analyse Albanian ou une classe P3, pas déduit de l'orthographe sans règle documentée.

## 7. Verbes

Mapper explicitement mood/tense/person/number vers les tables du contrat V. Une étiquette source « past » non désambiguïsée ne doit pas être forcée vers `Past`, `Aorist` ou `Imperfect` sans preuve.

Les principal parts peuvent être enregistrés comme rôle de preuve même s'ils ne correspondent pas directement à une seule cellule finale.

## 8. Sources dialectales

Toute observation porte `dialect`. Une observation Geg ne matche pas automatiquement une cellule standard_tosk. Une correspondance comparative doit être un lien distinct, pas une normalisation.

## 9. Versionnement

Toute modification du mapping qui change les cellules compatibles est E2 et invalide les C4–C6 concernés selon `20`.
