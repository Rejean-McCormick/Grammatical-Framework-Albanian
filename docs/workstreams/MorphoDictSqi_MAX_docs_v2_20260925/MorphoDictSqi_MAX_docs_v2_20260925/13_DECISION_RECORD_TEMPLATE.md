# Template — MorphoDictSqi decision record

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


Copier pour tout changement durable E2.

```yaml
decision_id: MD-SQI-DEC-XXX
date: YYYY-MM-DD
status: proposed | accepted | superseded | rejected
change_class: E2
scope: lemgram | category | paradigm | source | mapping | validator | naming | pipeline | release

problem:
  statement: ""
  affected_population_query: ""
  evidence_of_problem: []

locks:
  source_universe_id: ""
  albanian_snapshot_sha256: ""
  rgl_snapshot_sha256: ""
  gf_version: "3.12"
  schema_version: ""
  feature_map_version: ""
  table_signature_version: ""

linguistic_evidence:
  evidence_ids: []
  dialect: standard_tosk | geg | mixed_needs_resolution
  gaps: []

options_considered:
  - option: ""
    advantages: []
    risks: []
    rejected_because: ""

decision:
  rule: ""
  rationale: ""
  migration_required: false

impact:
  paradigm_ids: []
  estimated_lemgrams: 0
  dependency_nodes_invalidated: []
  c6_to_stale: 0

implementation:
  files: []
  generator_changes: []
  migration_command: ""

tests:
  static: []
  gf_compile: []
  morphology_golds: []
  wordbench: []
  reproducibility: []

certification_effect:
  promoted_to_C6: 0
  demoted_or_stale: 0
  placeholders_removed: 0
  blockers_created: 0

risks_remaining: []
followups: []
supersedes: null
```

Une décision devient `accepted` seulement lorsque preuves, code, migration et tests cités existent.
