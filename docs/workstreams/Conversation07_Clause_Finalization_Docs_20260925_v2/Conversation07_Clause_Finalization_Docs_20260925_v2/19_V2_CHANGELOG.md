# v2 Changelog — Clause Finalization Documentation

## Why v2 was required

The first documentation pack correctly established the architectural direction, but it still left several instructions as future work. In particular, it said to inventory assembly sites and create traceability without actually containing those inventories. That gap could allow implementation drift.

## v2 additions

- `13_CURRENT_IMPLEMENTATION_AUDIT.md`: exact current assembly/hotspot map.
- `14_EVIDENCE_TRACEABILITY_MATRIX.md`: stable evidence IDs linked to code, tests and decisions.
- `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md`: prevents 41/41 core API coverage from hiding extension-level clause forks.
- `16_PARSE_GENERATION_VARIANT_POLICY.md`: separates attested alternatives, canonical generation and parsing effects.
- `17_BASELINE_EVIDENCE_LOCK.md`: distinguishes documented green baseline from raw evidence not currently supplied.
- `18_CERTIFICATION_DASHBOARD.md`: makes structural vs linguistic progress explicit.

## Existing files strengthened

- source lock now inventories all supplied linguistic files and all scenario hashes;
- functional matrix now gives each of the 41 functions a current and target disposition;
- linguistic rules now have stable evidence IDs and explicit evidence gaps;
- implementation sequence now has phase entry/exit gates and a separate typed-migration phase;
- test plan now covers parsing, ambiguity and performance when relevant;
- interface/anti-drift rules now explicitly constrain `defaultAgr`, variants and cross-workstream duplication;
- open decisions expanded to cover `nuk/s'`, impersonal agreement, stranding, imperative-clitic variants and construction questions.

## Important new cautions

1. The current branch's `defaultAgr` is a technical fallback, not certified Albanian agreement.
2. Existing stranding/focus/fronting code is not linguistic evidence.
3. Direct `a` questions are sourced; embedded question behavior is not.
4. `se` and `që` are both sourced for indicative subordination; hardcoded `që` is not yet a complete selection policy.
5. The supplied project roadmap records a green Wordbench run, but the raw run artifact is not in the source ZIP and is therefore not assigned an invented hash.

## Supersession

This v2 package supersedes the first `Conversation07_Clause_Finalization_Docs_20260925` pack for planning and anti-drift purposes. The v1 pack remains historical evidence of the documentation evolution.
