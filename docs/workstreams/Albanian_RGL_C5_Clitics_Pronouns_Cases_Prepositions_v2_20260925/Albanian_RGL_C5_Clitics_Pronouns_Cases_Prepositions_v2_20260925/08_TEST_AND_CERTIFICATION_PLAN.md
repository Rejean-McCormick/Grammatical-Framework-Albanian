---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 08 — Plan de tests et certification

## Niveaux

1. **Unit/contract** — helpers typés et mappings.
2. **GF compile ciblé** — modules touchés.
3. **Scenario C5** — comportement surface.
4. **Regression historique** — 52/52.
5. **Global Scan** — 58/58.
6. **Linguistic review** — golds/promotions.

## Obligations minimales

### Pronoms et morphologie nominale

- 16 cellules distal `ai/ajo`.
- 16 cellules proximal `ky/kjo`.
- 16 cellules relatif `cili`.
- 16 cellules fortes 1/2 personnes (4 personnes-nombres × 4 fonctions morphologiques affichées).
- faibles Acc/Dat pour 1sg,2sg,3sg,1pl,2pl,3pl.

### Clitiques

- 18 cellules Dat+Acc attestées.
- tests de commutativité de construction : `addDat(addAcc)` vs `addAcc(addDat)`.
- contraction `të`: `ta`, `t'i`, `t'jua`, cas sans contraction (`të m'i`, `të na`).
- distinctions de rôle pour les surfaces ambiguës `i`, `u`, `të`.
- IO overt avec doubling obligatoire.
- DO overt avec politique canonique explicitement testée lorsqu'elle est décidée.

### Prépositions

- 14 entrées source-attestées minimales.
- chaque `Structural.*_Prep` C5-relevant reçoit un statut dans l'inventaire.
- test négatif empêchant `nga` d'utiliser une forme nominale incompatible avec le gouvernement retenu.

### Contextes

Matrice complète au minimum pour indicatif simple, temps composé, subjonctif positif/négatif, futur, impératif négatif avec : zéro/Acc/Dat/Dat+Acc/Refl.

`po`, enclise impérative, non-actif complexe, optatif/admiratif passent de tests ciblés à matrice complète avant certification de leur sous-domaine.

## Gold policy

Une sortie peut devenir gold seulement si :

- le CASE est reproductible;
- la construction RGL est identifiée;
- la source ou justification linguistique est localisée;
- le reviewer marque `LINGUISTIC_REVIEWED`;
- aucune autre sortie contradictoire du même paradigme n'est laissée non résolue.

## Aucun nombre final de scénarios inventé

Le total de scénarios augmentera au fil de la migration. Le gate est : **52 historiques restent verts + 100% des scénarios C5 requis par les matrices actives**. Le compteur final est enregistré seulement après génération du plan de tests, pas fixé arbitrairement dans cette doc.
