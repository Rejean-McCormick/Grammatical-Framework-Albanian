# Change control et livraison — superset du Compendium

Ce protocole est obligatoire pour chaque patch Albanian. Il **inclut** les exigences de `protocols/AI_PATCH_PROTOCOL.md`; un template local ne peut jamais les réduire.

## 1. Mandatory Task Header

```yaml
language: Albanian
language_code: Sqi
route: R01-R14
target_module: <module|unknown>
target_symbols: []
gf_version: 3.12
rgl_revision: <archive-hash|commit|unknown>
source_lock: locked | incomplete | unknown
language_state: S00-S11
subsystem_state: S00-S11
blockers: []
```

Aucune édition tant que le route, le source-lock et le premier unresolved decision ne sont pas explicites.

## 2. Patch entry

```yaml
patch_entry:
  task_id:
  task_class: new_implementation | morphology_change | category_representation_change | syntax_change | family_or_functor_change | extension_change | compilation_repair | linguistic_output_repair | behavior_preserving_refactor
  target_language: Albanian
  target_modules: []
  gf_compiler_version: 3.12
  rgl_revision:
  source_hashes: {}
  build_entrypoint:
  selected_workflow:
  reproducible_problem_or_requirement: true
```

## 3. Scope declaration

```yaml
scope:
  changed_files: []
  changed_symbols: []
  affected_abstract_functions: []
  affected_categories: []
  affected_parameters: []
  affected_record_fields: []
  inherited_modules_touched: []
  family_members_potentially_affected: []
  public_paradigm_api_changed: false
  category_contract_changed: false
  expected_surface_changes: []
  outputs_expected_to_remain_stable: []
```

Tout fichier/symbole édité hors scope doit être ajouté avec justification avant completion.

## 4. Contracts and field flow

Pour chaque abstract function touchée : exact type, owner, inherited default, override/subtraction status, argument/result categories. Pour chaque catégorie : exact `lincat`, producers, carriers, consumers, finalization boundary, invariants et simplifications interdites.

Aucun champ nouveau sans consumer final identifié. Aucun champ supprimé avant audit complet producer/carrier/consumer/tests.

## 5. Evidence and patterns

Chaque claim grammaticale/architecture a un evidence item avec source + locator + status + confidence. Si un Engineering Pattern s'applique : exactement un primary, au plus deux supporting, applicability reasons, rejected patterns et contraintes Albanian. Les patterns sont des guides de représentation, jamais des templates de code.

## 6. Causal analysis and hypotheses

```yaml
causal_analysis:
  observed_problem_or_requirement:
  required_facts: []
  current_behavior:
  expected_behavior:
  first_incorrect_or_missing_boundary:
  downstream_symptoms: []
  representation_adequate: true
  representation_change_required: false

hypotheses:
  - id: H1
    cause:
    predicted_effects: []
    evidence_for: []
    evidence_against: []
    required_changes: []
    status: selected | rejected | unresolved
```

Toute hypothèse sélectionnée décrit aussi le **predicted regression scope**. Si une representation change est nécessaire, router par R04 avant un patch local.

## 7. Patch design envelope

```yaml
patch_design:
  patch_id:
  change_id:
  workstream_owner:
  decision_ids: []
  task_class:
  selected_hypothesis:
  exact_signatures: []
  target_modules: []
  target_symbols: []
  affected_categories: []
  primary_pattern:
  supporting_patterns: []
  decision_boundary:
  fields_preserved: []
  fields_added: []
  fields_changed: []
  fields_removed: []
  fields_consumed: []
  current_behavior:
  intended_behavior:
  selected_change:
  inherited_behavior:
  local_override_reason:
  subtraction_required: false
  rejected_alternatives: []
  assumptions: []
  expected_surface_changes: []
  expected_stable_outputs: []
  predicted_risks: []
  predicted_regression_scope: []
  tests_to_add_or_update: []
  linguistic_evidence_ids: []
```

Code interdit avant cohérence de ce record.

## 8. Patch artifact

Format : `unified_diff | new_file | bounded_replacement`. L'artifact liste files, generated files exclus et unrelated changes. Les inventaires générés sont régénérés, jamais édités à la main.

## 9. Compilation increasing scope

1. smallest changed resource/concrete module ;
2. direct dependent module ;
3. complete target language ;
4. affected family members si shared change ;
5. aggregate/release entrypoint si présent.

Chaque run stocke command, cwd, GF version, exit, warnings/errors, artifacts et source hash. Un compile partiel n'est jamais rapporté comme full-language validation. `not_run` n'autorise pas promotion.

## 10. Tests

Minimum : positive direct, nearest contrastive, chaque dimension modifiée, sibling constructor si fields partagés, full regression, negative/rejection pour smart/unsupported domain. Ajouter les interaction tests touchés. `expected` doit être défini avant observation du nouveau résultat et lié à une preuve.

Chaque output changé est classé : `intended_correction | newly_accepted_variant | removed_ungrammatical_variant | behavior_preserving_reordering | unintended_regression | unresolved`. Un output non classé bloque completion.

## 11. Albanian-specific fields

```yaml
albanian_delivery:
  public_api_changes: []
  type_contract_changes: []
  wordbench_run:
  census_result:
  scenario_result:
  gold_impact:
  placeholders_removed:
  placeholders_added:
  known_uncertified_behavior: []
  risks: []
  rollback:
  consumer_signoff: []
```

## 12. Reconciliation / completion

Un patch n'est complet qu'à `W08 RECONCILED` : code, tests, decisions, evidence, contracts, open questions, implementation status, generated indexes et docs sont synchronisés.

### Mandatory rules

- changement type partagé -> producer/consumer audit + sign-off ;
- changement gold -> decision + reviewer + rationale ;
- nouveau placeholder -> waiver temporaire avec owner/date/exit condition ;
- common API status -> parity matrix update ;
- source change -> staleness pass ;
- migration incompatible -> shim unidirectionnel + date de retrait ;
- final claim -> release evidence packet ;
- blocking release requirement -> **aucun waiver**.
