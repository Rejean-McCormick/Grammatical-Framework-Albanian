# Dépendances et règles d’invalidation

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Graphe

Un C6 dépend au minimum de :

`source lock → evidence → feature mapping → paradigm implementation → table introspection/signature → review → global gates`.

Le graphe doit être machine-readable ; chaque lemgramme stocke un `dependency_fingerprint`.

## 2. Événements d'invalidation

| Changement | Effet minimal |
|---|---|
| hash d'une source | revalider preuves issues de cette source |
| normalisation | revalider candidats/preuves concernés |
| `feature_map_version` | C4+ concernés → stale |
| implémentation/hash `paradigm_id` | tous utilisateurs → stale |
| `table_signature_version` | recalcul global signatures/dedup |
| contrat de catégorie | reintrospection/revalidation catégorie |
| générateur sans changement sémantique | rebuild + V17 |
| GF version | recompilation/reintrospection complète avant nouvelle certification |
| Wordbench gate semantics | rerun gates affectés |

## 3. `STALE_REVALIDATION`

Un ancien C6 invalidé garde son historique mais n'entre plus dans `certified_C6_current`. Il ne revient C6 qu'après les checks associés à l'événement.

## 4. Invalidation transitive

Si un paradigme change, recalculer table_signature ; si celle-ci change, rerun evidence match, homograph/dedup, golds et revue selon risque. Ne pas supposer qu'un compile pass suffit.

## 5. Impact report avant merge

Tout E2 doit pouvoir répondre : combien de lemgrammes touchés, lesquels, quelles catégories/classes, combien de C6 deviennent stale, quels golds et review records doivent être rejoués.

## 6. Fingerprint recommandé

SHA-256 canonique de : `source/evidence hashes + feature_map_version + paradigm_id/hash + category_contract_version + table_signature_version + generator_semantic_version`.
