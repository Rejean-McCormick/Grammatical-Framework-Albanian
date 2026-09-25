# Échelle de certification morphologique C0–C6

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## Principe

La certification est une chaîne de preuve. Elle ne peut pas être déduite d'un ancien champ `quality`, du fait qu'une entrée compile, ni du fait qu'elle provient du RGL historique.

## C0 — INVENTORIED

Le candidat existe. Minimum : base, catégorie candidate, source localisable.

## C1 — PROVENANCE_LOCKED

Source et locator verrouillés ; normalisation déterministe enregistrée ; dialecte/statut de standard connu ou explicitement inconnu.

Un placeholder reste au maximum C1.

## C2 — PARADIGM_RESOLVED

La construction morphologique est résolue :

- classe P3 de `19_PARADIGM_CLASS_REGISTRY.md`, ou
- irrégulier/constructeur explicite dont les principal parts nécessaires sont fournis.

`mkN lemma`, `mkA lemma`, `mkV lemma` ne suffisent pas à C2 si leur dispatch interne n'est pas démontré pour ce lexème.

## C3 — GF_COMPILED

L'entrée, le MorphoDict et son harness compilent sous GF 3.12 dans l'environnement verrouillé. C3 est uniquement une preuve de compilation.

## C4 — EVIDENCE_MATCHED

Toutes les observations enregistrées et applicables sont compatibles avec la table GF selon `18_EVIDENCE_TO_GF_FEATURE_MAPPING.md`. Les observations ambiguës peuvent matcher plusieurs cellules, mais ne deviennent pas artificiellement plus précises.

## C5 — LINGUISTIC_REVIEWED

La décision de classe, les traits inhérents et les divergences ont été revus selon le niveau de risque. La revue doit être enregistrée (`review_record_id`). Pour les classes productives, la revue porte aussi sur le domaine P3 ; pour les irréguliers/homographes/conflits, elle est entrée-spécifique.

## C6 — CERTIFIED

C0–C5 satisfaits + V01–V19 applicables verts + aucune dépendance stale + aucune contradiction matérielle + baseline globale verte.

**Seul C6 entre dans `certified_count`.**

## États latéraux

- `PLACEHOLDER_ACTIVE`
- `BLOCKED_MISSING_PARADIGM`
- `BLOCKED_INSUFFICIENT_EVIDENCE`
- `BLOCKED_SOURCE_CONFLICT`
- `DIALECTAL_GEG_ONLY`
- `EXCLUDED_MULTIWORD`
- `EXCLUDED_CATEGORY`
- `REJECTED_ANALYSIS`
- `STALE_REVALIDATION`

## Invalidation

Une entrée C6 dont une dépendance change n'est pas silencieusement maintenue C6. Elle passe `STALE_REVALIDATION` jusqu'à exécution des checks prescrits par `20_DEPENDENCY_AND_INVALIDATION_RULES.md`. Son ancien C6 reste historique, pas courant.

## Promotion massive

Une entrée peut être promue en masse uniquement si : classe P3, mapping de preuves stable, dépendances verrouillées, validations automatiques 100% et revue stratifiée selon `07_VALIDATORS_AND_GATES.md`.
