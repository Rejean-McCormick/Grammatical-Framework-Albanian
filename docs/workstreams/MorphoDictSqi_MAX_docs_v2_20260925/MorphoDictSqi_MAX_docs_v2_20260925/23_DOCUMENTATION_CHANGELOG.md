# Changelog documentaire

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## v2.0 — 2026-09-25

Optimisation de la v1 pour développement à grande échelle.

### Ajouts structurants

- univers de sources versionné et définition de terminé basée sur son traitement intégral ;
- modèle de données canonique et IDs stables ;
- contrats exacts de tables Albanian par catégorie ;
- `table_signature` TSIG-1 et déduplication compilée ;
- mapping preuve→traits GF FMAP-1 ;
- registre de paradigmes P0–P3 ;
- graphe de dépendances + `STALE_REVALIDATION` ;
- build déterministe / double rebuild ;
- politique de conflits ;
- revue de lots massifs déterministe et stratifiée ;
- V01–V19 ;
- métriques source-universe, stale et evidence density.

### Corrections de cadrage

- `MorphoDictSqi.config` est explicitement traité comme bootstrap et non comme preuve de classe ;
- 50–60k devient benchmark d'échelle, pas quota ;
- la certification C6 dépend désormais de la fraîcheur des dépendances ;
- déduplication définie sur la table GF canonicalisée, pas le texte source ;
- la complétude des cellules est définie par catégorie, pas par interdiction globale des chaînes vides.
