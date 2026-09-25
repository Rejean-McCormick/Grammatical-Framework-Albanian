# Cible finale et définition de « terminé »

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Mission finale

`MorphoDictSqi MAX` doit devenir un **dictionnaire morphologique albanais standard de grande couverture**, comparable aux grands MorphoDict RGL en maturité d'usage, mais avec une traçabilité explicite par lemgramme.

La parité avec English signifie : grande couverture, tables utilisables pour analyse/génération, convention stable de lemgrammes, génération reproductible, API de paradigmes mature, exceptions explicites et auditabilité. Elle ne signifie pas copier les classes anglaises ni reproduire leur distribution de catégories.

## 2. Benchmark quantitatif, pas quota

`MorphoDictEng` du RGL fourni contient ~56,6k fonctions ; les grands modèles fournis se situent approximativement entre 39k et 122k. Une couverture albanaise de plusieurs dizaines de milliers de C6 est donc une cible d'échelle plausible.

**Aucun seuil numérique n'autorise une baisse de preuve.** La définition de terminé repose sur l'exploitation du `source_universe_id`, pas sur un quota arbitraire.

## 3. Cible qualitative

À la release finale :

- `variants_count = 0` ;
- `unprovenanced_active = 0` ;
- `unwaived_multiword = 0` ;
- `placeholder_counted_as_C6 = 0` ;
- duplications de sens/valence = 0 ;
- conflits de table non résolus parmi C6 = 0 ;
- dépendances C6 stale = 0 ;
- fallback smart non borné = 0 ;
- régression baseline Wordbench/golds = 0.

## 4. Produit final

Le produit final comprend :

1. `MorphoDictSqiAbs.gf` ;
2. `MorphoDictSqi.gf` ;
3. headers/config lorsque requis ;
4. source universe et source locks ;
5. candidats normalisés ;
6. provenance et preuves par lemgramme ;
7. tables GF canonicalisées + signatures ;
8. exclusions ;
9. queues de revue / blockers ;
10. registre de paradigmes ;
11. mapping source→traits GF ;
12. graphe de dépendances ;
13. générateur déterministe ;
14. validateurs ;
15. golds morphologiques ;
16. métriques/campagnes ;
17. décisions/migrations ;
18. preuves GF 3.12 + Wordbench.

## 5. Catégories

Le contrat courant expose 18 catégories : `N, A, V, Adv, Prep, PN, Interj, Conj, Subj, Det, IDet, IAdv, IP, NP, Pron, Quant, IQuant, Predet`.

Le détail des tables et métadonnées est normatif dans `16_CATEGORY_TABLE_CONTRACTS.md`. Toute modification de cet ensemble ou de sa sémantique exige decision record + migration.

## 6. Définition de terminé

Le chantier peut être déclaré finalisé lorsque :

- `source_universe_processed_ratio = 100%` : chaque candidat éligible est C6, bloqué explicitement ou exclu avec raison ;
- toutes les entrées comptées certifiées satisfont C6 et ne sont pas stale ;
- aucun placeholder n'est compté certifié ;
- les classes productives nécessaires sont P3 ou les exceptions sont explicitement lexicales ;
- les principaux paradigmes disposent de golds et cas négatifs ;
- les mappings source→GF sont versionnés et sans conflit matériel ouvert pour C6 ;
- la génération est reproductible à partir des locks ;
- deux rebuilds propres produisent les mêmes artifacts canoniques ;
- GF 3.12 et Wordbench maintiennent au moins 58/58 + 52/52 et les golds ;
- les limites de couverture restantes sont attribuées aux sources disponibles, pas masquées par des placeholders.

## 7. Critère utilisateur

Pour un mot albanais standard ordinaire rencontré dans un texte couvert par l'univers de sources, il doit être courant que GF retrouve le lemgramme et génère/analyse sa table sans reconstruction manuelle. Les absences doivent être diagnostiquables : source absente, preuve insuffisante ou paradigme manquant.
