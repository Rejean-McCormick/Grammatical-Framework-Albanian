---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 03 — Spécification du système de clitiques

## Inventaire faible attesté

| Personne | Acc | Dat |
|---|---|---|
| 1sg | `më` | `më` |
| 2sg | `të` | `të` |
| 3sg | `e` | `i` |
| 1pl | `na` | `na` |
| 2pl | `ju` | `ju` |
| 3pl | `i` | `u` |

Réflexif : `u`.

**C5-REQ-014** — le rôle doit rester typé car une même chaîne peut avoir plusieurs fonctions.

## Doubling

**SOURCE_FACT** : objet direct overt -> clitique facultatif; objet direct non overt -> faible obligatoire; objet indirect -> faible obligatoire même si le complément fort est overt.

Politique C5 :

- IO overt : le chemin canonique doit conserver le clitique datif obligatoire;
- DO overt : la stratégie canonique RGL reste **PROVISIONAL** tant qu'un choix de registre/documentation n'est pas fixé;
- argument pronominal non prépositionnel : la forme faible est disponible comme réalisation canonique, sans supprimer la forme forte de la représentation.

## Double clitique

**SOURCE_FACT** — Dat précède l'objet Acc faible. Matrice attestée :

| Dat \\ Acc | `e` | `i` | `u` |
|---|---|---|---|
| `më` | `ma` | `m'i` | `m'u` |
| `të` | `ta` | `t'i` | `t'u` |
| `i` | `ia` | `ia` | `iu` |
| `na` | `na e` | `na i` | `na u` |
| `ju` | `jua` | `jua` | `ju` |
| `u` | `ua` | `ua` | `ju` |

**C5-REQ-015** — les **18 cellules** de cette matrice sont des obligations de test; aucune ne peut être remplacée par un fallback générique.

## Contraction avec `të`

- `të + e -> ta`;
- cluster commençant par voyelle ou `j` -> `t'...`;
- sinon pas de contraction spéciale (`të m'i`, `të na`, etc.).

Pipeline obligatoire : `roles -> fusion cluster -> adjacency -> contraction të -> surface`.

## Impératif

**SOURCE_FACT** — négatif : `mos + clitique + verbe`; positif : proclise ou enclise possibles; au pluriel enclitique, insertion avant `-ni`.

**PROVISIONAL** — le core peut choisir une sortie canonique proclitique correcte; l'enclise ne sera implémentée que si elle peut être segmentée morphologiquement sans découpage arbitraire de chaîne.

## `u`

Trois informations doivent rester distinctes :

- Dat 3pl faible `u`;
- réflexif argumental `u`;
- marqueur de non-actif `u` dans certains contextes verbaux.

Une fusion de surface n'autorise jamais une fusion des rôles internes.

## Interdictions

- ordre dépendant de l'ordre d'appel;
- `subjcl` calculé indépendamment du cluster final;
- déduction de rôle depuis la chaîne;
- `extra : Str` durable;
- nouveau placeholder pour une cellule de fusion inconnue.
