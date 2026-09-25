# Modèle de données canonique et schémas

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Objectif

Empêcher que l'état réel soit reconstruit à partir du texte GF. Le GF est un artifact généré/validé ; la provenance, certification et dépendances vivent dans des records machine-readable.

## 2. Identifiants stables

Préfixes recommandés :

- `SRC-...` source ;
- `EVD-...` preuve atomique ;
- `CAN-...` candidat ingéré ;
- `LGM-...` lemgramme canonique ;
- `PAR-SQI-...` classe/paradigme ;
- `REV-...` revue ;
- `BLK-...` blocker ;
- `CMP-...` campagne ;
- `MD-SQI-DEC-...` décision.

Les IDs ne doivent pas dépendre d'un numéro de ligne mutable. Les locators, eux, peuvent changer avec re-lock.

## 3. `SourceRecord`

```yaml
source_id: SRC-...
title: ""
kind: rgl_source | linguistic_reference | lexicon | corpus | derived_dataset
archive_or_url: ""
sha256: ""
dialect_scope: standard_tosk | geg | mixed | n_a
license_status: identified | unknown | restricted
redistribution_role: code_source | evidence_only | derivation_allowed | no_bulk_copy
source_universe_id: SU-...
```

## 4. `EvidenceRecord`

```yaml
evidence_id: EVD-...
source_id: SRC-...
locator: ""
lemmas: []
surface: ""
source_analysis: ""
normalized_surface: ""
normalization_rule_ids: []
dialect: standard_tosk | geg | unknown
role: lemma | category | gender | surface_form | principal_part | government | irregularity | negative_evidence
mapped_gf_features: []
mapping_status: exact | ambiguous | unmapped | incompatible
```

## 5. `CandidateRecord`

```yaml
candidate_id: CAN-...
base: ""
source_category: ""
proposed_morphodict_category: ""
evidence_ids: []
normalization_trace: []
status: C0
```

## 6. `LemgramRecord`

```yaml
lemgram_id: LGM-...
gf_function: ""
base: ""
category: N
inherent_features: {}
evidence_ids: []
paradigm_id: PAR-SQI-...
paradigm_hash: ""
expression: ""
table_signature: ""
certification_level: C0|C1|C2|C3|C4|C5|C6
lateral_status: null
review_record_ids: []
blocker_ids: []
dependency_fingerprint: ""
```

## 7. `ParadigmRecord`

Défini en détail dans `19`; doit contenir id/version/hash, domaine positif/négatif, required inputs, examples, maturity P0–P3.

## 8. `ReviewRecord`

```yaml
review_record_id: REV-...
lemgram_ids: []
review_type: entry | class | source_conflict | campaign_sample
reviewer: ""
date: ""
evidence_ids: []
decision: accept | reject | block | revise
notes: ""
```

## 9. `BlockerRecord`

```yaml
blocker_id: BLK-...
type: missing_paradigm | insufficient_evidence | source_conflict | license | implementation
lemgram_ids: []
missing_class_id: null
opened_by_campaign: CMP-...
resolution_condition: ""
status: open | resolved
```

## 10. Versionnement

Chaque dataset machine-readable porte `schema_version`. Une modification de sémantique exige migration ; l'ajout d'un champ optionnel compatible peut rester E1.
