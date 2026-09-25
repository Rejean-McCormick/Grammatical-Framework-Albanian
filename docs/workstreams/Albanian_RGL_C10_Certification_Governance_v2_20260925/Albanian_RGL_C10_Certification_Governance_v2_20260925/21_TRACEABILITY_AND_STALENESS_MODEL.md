---
document_role: traceability_and_staleness
status: normative
version: 1.0
date: 2026-09-25
---

# Modèle de traçabilité et de staleness

## 1. Chaîne obligatoire

Toute assertion de maturité doit pouvoir remonter :

`SOURCE`
→ `EVIDENCE CLAIM`
→ `FEATURE / CONTRACT`
→ `TEST / CASE`
→ `RUN + SOURCE LOCK`
→ `OUTPUT HASH`
→ `REVIEW`
→ `GOLD (si applicable)`
→ `COVERAGE / PARITY ROW`
→ `RELEASE PACKET`

Une rupture de chaîne signifie « non établi ».

## 2. Identifiants stables

Conserver :
- source ID;
- evidence ID;
- decision ID;
- feature ID;
- paradigm ID;
- case ID;
- bug ID;
- gold ID;
- release ID.

Les IDs ne sont jamais recyclés.

## 3. Invalidation par source

Si un fichier source pertinent change :
- les compiler facts de ce source-lock deviennent historiques;
- les tests doivent être rerun selon impact;
- une revue reste une revue de l'ancien output, pas du nouveau;
- tout gold reste une attente mais doit être comparé au nouvel output;
- les claims générés dépendants sont `stale` jusqu'à recalcul.

## 4. Invalidation par normalisation

Si la normalisation change :
- les hashes normalisés antérieurs ne sont plus directement comparables;
- les golds doivent être revus sous la nouvelle version;
- la cause doit être distinguée d'un changement linguistique.

## 5. Invalidation par décision linguistique

Si une décision change (ex. variété, acceptabilité d'une variante, analyse d'un cas) :
- les CASEs dépendants sont recherchés;
- leurs verdicts deviennent `stale` ou `needs_review`;
- les golds dépendants sont reconsidérés;
- les métriques historiques restent intactes mais sont marquées selon l'ancien régime.

## 6. Invalidation par référence

Une nouvelle source ne rend pas automatiquement les anciennes preuves fausses. En cas de conflit :
- claim = `disputed`;
- promotion gold suspendue;
- résolution explicite.

## 7. Impact scope

Chaque changement doit déclarer :
- `direct_symbols`;
- `dependent_modules`;
- `affected_features`;
- `affected_cases`;
- `affected_golds`;
- `affected_parity_rows`.

## 8. Règle de conservation

L'évidence stale n'est pas supprimée. Elle est conservée pour audit avec :
- raison;
- date;
- superseding source/decision;
- remplacement éventuel.
