# V2 Documentation Audit

> **Document version**: 2.0  
> **Document status**: REVIEW CHECKLIST  

## Improvements over v1

- mutable baseline facts have one authority: `19_BASELINE_EVIDENCE_LOCK.md`;
- exact RGL abstract signatures are locked in `12_EXACT_RGL_CONTRACT_LOCK.md`;
- abstract surface coverage and Paradigms API maturity are separated in `13_ENGLISH_PARITY_LEDGER.md`;
- `ResSqi/CatSqi` migrations have a source-derived impact inventory in `14_PRODUCER_CONSUMER_IMPACT_MATRIX.md`;
- linguistic evidence has file hashes, section locators and dialect scope in `15_LINGUISTIC_EVIDENCE_LEDGER.md`;
- concrete test seeds and non-gold gaps are explicit in `16_CANONICAL_NOMINAL_TEST_VECTORS.md`;
- N0–N9 now have mechanical entry/exit/rollback contracts in `17_MIGRATION_CONTRACTS.md`;
- Dict/MorphoDict debt is quantitatively baselined in `18_LEXICAL_DEBT_AND_PROMOTION.md`;
- the existing `link_clitic` service is recognized as CURRENT rather than reinvented as a future feature;
- `Lesson_50.html` is correctly scoped as **Geg**, preventing automatic promotion of its numeral/ordinal forms to Standard-Albanian gold.

## Residual gaps deliberately left open

These are not documentation defects; the supplied sources do not yet close them:

1. productive/residual neuter policy for Standard Albanian;
2. exact modern Standard comparative/superlative inventory and nyje behavior in every construction;
3. exhaustive kinship class licensing prenominal possessives;
4. numeral government/nominal agreement in Standard Albanian;
5. modern Standard inflection classes for personal names/surnames/toponyms;
6. mixed-gender/number coordination agreement;
7. policy for headless `DetNP` agreement where the abstract supplies no noun.

They remain blocking for **certification of those capabilities**, not for unrelated stages.

## Completeness criterion for the documentation itself

The documentation is operationally complete when a new session can answer, without guessing:

- which source version and baseline is being changed;
- which abstract signature constrains the change;
- which Albanian evidence justifies it and with what dialect scope;
- what current representation exists;
- every known producer/consumer that may break;
- which migration stage owns the change;
- which tests/golds prove success;
- what lexical debt can be promoted;
- what remains explicitly uncertified;
- how to rollback independently.

V2 satisfies this criterion for beginning N0/N1. Later stages still require closure of their explicitly listed linguistic gaps before certification.
