# Pipeline de construction et de promotion

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Pipeline evidence-first

```text
source lock + source universe
→ ingestion candidate
→ normalisation
→ feature mapping
→ pré-déduplication
→ résolution de classe P3 / irrégulier
→ candidat GF
→ compilation ciblée
→ introspection table
→ table_signature
→ evidence matching
→ review
→ C6
→ génération canonique
→ validation globale
→ campaign report
```

Chaque flèche a un artifact machine-readable ; aucun état important ne vit seulement dans une conversation.

## 2. Étapes et sorties

| Étape | Sortie obligatoire |
|---|---|
| source | `SOURCE_REGISTRY` + hash + rôle/licence |
| ingestion | `CANDIDATES` C0 |
| normalisation | transformations tracées |
| mapping | `EVIDENCE` avec traits GF compatibles |
| classe | `paradigm_id` + version/hash |
| compile | résultat GF + log locator |
| introspection | table canonique |
| signature | `table_signature` |
| matching | matrice evidence↔cellules |
| review | `REVIEW_RECORD` |
| certification | statut C6 / blocker |
| génération | `MorphoDictSqi*.gf` déterministes |
| release | metrics + Wordbench + manifest |

## 3. Normalisation autorisée

Unicode NFC, encodage, espace/punctuation technique explicitement défini, mapping POS documenté, normalisation de lemma déterministe. Interdit sans décision : corriger une forme, convertir Geg→Tosk, inventer principal parts, deviner genre/classe.

## 4. Résolution de paradigme

Ordre : analyse Albanian C6 existante → irrégulier explicite → classe P3 → constructeur plus explicite/principal parts → escalade core → blocage.

Le fichier `MorphoDictSqi.config` courant est un **bootstrap**, pas une autorité de certification. Les lignes `N : N mkN 0`, `A : A mkA 0`, `V : V mkV 0` ne prouvent pas que la seule forme citationnelle suffit à identifier correctement toutes les classes.

## 5. Lot homogène

Un lot de promotion partage : catégorie, `paradigm_id`, provenance/source role et règle de mapping. Chaque lot publie candidats, C6 gagnés, blockers, exclusions, diff de tables/signatures, tests et impact baseline.

## 6. Génération déterministe

Mêmes source locks + mêmes schémas + même registry + même générateur → mêmes artifacts canoniques, hors métadonnées déclarées non déterministes. Les règles exactes sont dans `21_SCALE_AND_REPRODUCIBILITY_CONTRACT.md`.

## 7. Réconciliation

Après chaque campagne : code, provenance, signatures, dépendances, registry, queues, métriques, decisions et tests doivent converger vers le même état. Une entrée générée sans record de données correspondant est une erreur de pipeline.
