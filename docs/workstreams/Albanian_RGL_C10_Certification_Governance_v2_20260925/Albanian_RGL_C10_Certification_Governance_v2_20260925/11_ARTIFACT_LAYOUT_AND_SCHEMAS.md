---
document_role: artifact_layout
status: normative
date: 2026-09-25
---

# Layout des artefacts de certification

> Toute relation entre ces artefacts doit respecter `21_TRACEABILITY_AND_STALENESS_MODEL.md`.

## 1. Arborescence cible

```text
validation/
  linguistic/
    campaigns/
      <campaign_id>/
        request.json
        response.json
        evaluation.json
        case_ledger.tsv
        evidence_manifest.json
        dashboard.md
        bugs/
  gold/
    ...
  coverage/
    coverage_by_phenomenon.csv
    coverage_by_category.csv
    coverage_morphology_cells.csv
    coverage_by_abstract_function.csv
    coverage_lexicon_sampling.csv
    coverage_summary.md
  parity/
    english_parity.csv
    english_parity.md
  certification/
    debt_register.tsv
    release_packet_<id>.md
    release_manifest_<id>.json
```

Le chemin exact peut être adapté au layout Wordbench existant; les rôles des artefacts restent stables.

## 2. `case_ledger.tsv`

Colonnes minimales :

```text
case_id
campaign_id
run_id
source_lock_sha256
scenario_id
language_variety
output_sha256
phenomenon_primary
phenomena_secondary
category
morphological_cells
lexeme_or_function
verdict
confidence
rationale
evidence_refs
reviewer_kind
reviewer_name
reviewer_model
bug_id
owner_conversation
gold_eligible
gold_promoted
reviewed_at
```

## 3. `evidence_manifest.json`

Chaque preuve :
- `evidence_id`
- `class`
- `source`
- `locator`
- `claim`
- `scope`
- `variety`
- `source_hash` si applicable
- `notes`

## 4. `debt_register.tsv`

```text
debt_id
kind
subsystem
description
severity
scope
source_lock
owner
blocking_level
evidence_needed
planned_resolution
status
```

`kind` inclut au moins :
- placeholder
- uncertified_output
- missing_coverage
- questionable_case
- known_invalid
- parity_gap
- provenance_gap
- dialect_scope_uncertainty

## 5. IDs stables

Les IDs de CASEs, bugs, preuves et décisions ne doivent pas être recyclés. Une nouvelle exécution crée une nouvelle observation liée à l'ancien CASE stable si le test logique est le même.

## 6. Machine-readable d'abord

Les tableaux CSV/TSV/JSON sont la source de vérité pour les agrégations. Les `.md` sont des projections lisibles générées ou vérifiables à partir des données.

## 7. Reproductibilité

Chaque artefact de campagne doit enregistrer :
- générateur/version;
- timestamps;
- source-lock;
- GF version;
- Wordbench version;
- schéma;
- inputs;
- hashes des sorties pertinentes.

## Registres additionnels v2

Le système complet doit aussi conserver :

```text
validation/
  certification/
    decisions/
    evidence/
    open_questions/
    owner_routing/
```

Les décisions et evidence records sont append-only/superseding; ils ne sont pas réécrits pour faire disparaître l'historique.
