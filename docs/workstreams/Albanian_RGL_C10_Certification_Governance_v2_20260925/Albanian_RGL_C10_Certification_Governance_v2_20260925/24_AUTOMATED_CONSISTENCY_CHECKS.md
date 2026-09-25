---
document_role: consistency_check_spec
status: normative_spec
version: 1.0
date: 2026-09-25
---

# Vérifications automatiques de cohérence

Ce document spécifie le futur linter de certification.

## 1. Checks bloquants

### Identité
- source-lock présent;
- GF/Wordbench versions présentes;
- IDs uniques;
- output hashes présents pour reviews.

### Revue
- verdict dans le vocabulaire canonique;
- confiance valide;
- `questionable`/`invalid` jamais `gold_promoted=true`;
- `low` jamais gold-éligible sous policy par défaut;
- variété présente.

### Gold
- review et output hash compatibles;
- gold update possède reviewer/rationale/decision;
- aucun gold créé par `validate`;
- normalizer version compatible.

### Couverture
- dénominateurs > 0 quand métrique publiée;
- aucune cellule `golded` sans CASE;
- aucune cellule `certified` sans evidence;
- N/A possède rationale et evidence.

### Parité
- statut dans les six valeurs autorisées;
- `linguistically_not_applicable` possède justification;
- `missing` core bloque R4;
- `needs_review` core bloque R4.

### Dette
- tout placeholder connu a un debt ID;
- dette supprimée exige resolution reference;
- aucun placeholder compté comme gold-certified paradigm.

## 2. Checks de traçabilité

Détecter :
- evidence orpheline;
- CASE orphelin;
- gold sans review;
- bug fermé sans rerun;
- parity row sans source-lock;
- dashboard pointant sur campagne inexistante.

## 3. Checks de variété

Bloquer :
- gold Standard construit uniquement depuis preuve Geg/Tosk non qualifiée;
- mélange de campaigns de variétés différentes dans un même taux;
- review sans `language_variety`.

## 4. Checks de paradigmes

- chaque surcharge publique enregistrée;
- chaque smart paradigm possède test d'entrée invalide;
- chaque famille productive possède canonical/boundary/orthographic/irregular quand applicable;
- toutes les cellules déclarées du lexème témoin apparaissent dans la table testée.

## 5. Checks de release

Un packet READY ne doit pas avoir :
- blocker ouvert;
- mismatch gold requis;
- `invalid`/`questionable` requis;
- source-lock incohérent;
- missing artifact;
- stale required evidence.

## 6. Sévérités

- `ERROR` : invalide une certification/release;
- `WARN` : dette ou risque à examiner;
- `INFO` : différence historique/documentaire.

Le linter ne doit jamais transformer un `WARN` en preuve linguistique.
