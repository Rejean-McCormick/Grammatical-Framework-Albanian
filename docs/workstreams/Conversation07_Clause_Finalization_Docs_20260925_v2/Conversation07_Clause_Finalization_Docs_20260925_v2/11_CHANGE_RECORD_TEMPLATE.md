# Clause Syntax Change Record Template v2

Create one record per coherent grammatical patch family.

```yaml
clause_change:
  id: C07-CHANGE-YYYYMMDD-NNN
  date: YYYY-MM-DD
  status: proposed|implemented|gf_validated|linguistically_reviewed|gold_certified

  scope:
    family: declarative|negation|embedding|polar_question|wh_question|relative|subordination|order|specialist
    abstract_functions: []
    extension_functions: []
    evidence_ids: []
    open_decisions_closed: []
    open_decisions_touched: []
    files_modified: []
    files_intentionally_unchanged: []

  source_lock:
    albanian_zip_sha256: 961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829
    rgl_zip_sha256: e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d
    references_zip_sha256: 15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc
    gf_version: 3.12
    wordbench_version: 1.3.4
    baseline_tag_declared: albanian-s02-green-20260925
    source_lock_before: ...
    source_lock_after: ...
    file_hashes_before: {}
    file_hashes_after: {}

  problem:
    observed_behavior: ...
    structural_or_linguistic: structural|linguistic|both
    why_current_owner_is_wrong_or_insufficient: ...
    earliest_correct_owner: ...

  evidence:
    abstract_signatures: []
    albanian_reference_sections: []
    accepted_golds: []
    existing_decisions: []
    model_languages_consulted: []
    what_models_do_not_prove: ...

  architecture:
    canonical_assembler_used: true|false
    specialist_reason: null
    category_representation_changed: false
    new_fields_or_parameters: []
    producers_updated: []
    consumers_updated: []
    c2_preserved: true
    clitic_owner_preserved: true
    tam_owner_preserved: true
    valency_owner_preserved: true
    nominal_owner_preserved: true

  behavior:
    canonical_generation_before: []
    canonical_generation_after: []
    accepted_variants: []
    parsing_effect: ...
    ambiguity_effect: ...
    still_uncertified: []

  validation:
    static_checks: []
    focused_compile: ...
    full_census: ...
    lock_warnings: ...
    required_scenarios: ...
    focused_cases: []
    reviewed_cases: []
    golds_added: []
    golds_changed: []
    parse_checks: []
    performance_checks: []

  risk:
    known_risks: []
    cross_workstream_dependencies: []
    rollback_point: ...

  documentation:
    functional_matrix_updated: true
    implementation_audit_updated: true|not_needed
    traceability_updated: true
    open_decisions_updated: true|not_needed
    certification_dashboard_updated: true
```

## Mandatory narrative questions

1. What grammatical information was previously lost, duplicated, defaulted or realized at the wrong boundary?
2. What exact Albanian evidence supports the new behavior, or why is the patch purely architectural/output-preserving?
3. Why is this the earliest correct owner?
4. Which model languages were consulted and what did they **not** prove about Albanian?
5. Which test fails if the old defect returns?
6. What happens to generation, parsing and ambiguity?
7. What remains intentionally uncertified?
8. Which cross-workstream contract is consumed rather than duplicated?

No patch reaches `gold_certified` with unanswered items that affect its behavior.
