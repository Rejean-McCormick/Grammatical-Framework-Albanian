# Conversation 6 — Nominal system finalization delivery

Date: 2026-09-25
Baseline: `albanian-s02-green-20260925` / local baseline commit `963b925`
Scope: `NounSqi`, `AdjectiveSqi`, `NumeralSqi`, `NamesSqi`, `StructuralSqiNominal`, shared nominal resources and all direct consumers required by representation changes.

## Delivery status

This delivery implements the maximal source-level finalization that can be justified by the supplied Albanian references and checked in the current environment.

**Implementation status:** W04 IMPLEMENTED + static/repository validation complete.

**Not claimed:** W05 COMPILES_LOCALLY, W06 TESTED_LOCALLY, W07 REGRESSION_SAFE, S09 REGRESSION_VALIDATED, release candidate, or linguistic certification. The current execution environment has no GF 3.12 executable and no GF Wordbench executable, so the required external compilation/scenario run remains mandatory.

## Implemented architecture

1. `Case` is grammatical and has five values: `Nom | Acc | Gen | Dat | Ablat`.
2. `MorphCase` is nominal morphology and has four values: `MNom | MAcc | MDat | MAblat`.
3. `morphCase Gen = MDat` makes the attested Gen/Dat syncretism explicit only at the morphology boundary.
4. lexical `Noun` stores `Species => MorphCase => Number => Str` and `g : Number => Gender`.
5. syntactic `CNoun` stores `Species => Case => Number => Str` and is produced centrally by `useNoun`.
6. agreement is an explicit record preserving gender and number through plural agreement.
7. lexical `Adj` stores gender×number forms plus a typed articulated/unarticulated class; case is no longer a fake lexical adjective dimension.
8. *nyje* selection is centralized through one typed service (`nyje`, exposed as `link_clitic`).
9. `PossNP` selects grammatical `Gen` on the possessor.
10. public paradigms include explicit full noun, ambigeneric noun, five-case PN/LN/GN constructors and compatibility shortcuts.
11. demonstrated structural forms were corrected from the supplied Lesson 30 evidence, including proximal demonstrative accusative plurals and selected possessive cells.
12. no Albanian-specific `NumeralGov` was invented because the supplied Standard/Tosk evidence does not establish the required minimal pairs.

## Deliberately unresolved / not linguistically certified

The supplied sources do not support a complete Standard Albanian rule for all of the following, so this delivery keeps them explicit rather than inventing behavior:

- numeral government and full Standard ordinal system (systematic supplied Lesson 50 material is Geg);
- complete modern anthroponym/toponym inflection classes;
- mixed-gender/mixed-number coordination agreement;
- headless `DetNP` agreement when the abstract syntax supplies no nominal head;
- exhaustive restrictions on prenominal kinship possessives;
- full comparative/superlative interaction with *nyje*;
- productive status of residual neuter items.

The corresponding fallbacks are centralized and named; they are not certified Albanian rules.

## Regression/test changes

- Language/API/MorphoDict target census is statically checked as 51 + 5 + 2 = 58.
- Scenario census is statically checked as 52.
- Existing scenario files were deepened rather than increasing the scenario count.
- Added guardrails for explicit Gen paths, number-sensitive noun gender, *nyje* cells, demonstrative forms and five-case proper-name constructors.
- All embedded Wordbench input hashes are checked for freshness by the nominal validator.

## Local validations actually executed

- `python validation/nominal/static_validate_nominal_architecture.py` — PASS.
- `python validation/lexicon/static_validate_dict_and_morphodict.py` — PASS.
- `python validation/morphodict/static_validate_morphodict.py` — PASS.
- `python gf_morphosqi_lint.py AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf` — 0 findings.
- `git diff --check` — must pass before packaging.

## Mandatory external acceptance run

Run GF 3.12 + GF Wordbench 1.3.4 on the delivered snapshot and require:

- exact census: 58/58 accepted strict;
- scenarios: 52/52 OK;
- zero structural lock warnings;
- no regression of existing golds;
- targeted review of new nominal CASEs;
- no promotion of generated output to linguistic gold without human/reference review.

If the compiler reveals an error, repair the producer/consumer contract; do not add a compile-safe placeholder to hide a core nominal defect.

## Merge/rollback model

The implementation history is intentionally segmented:

- N1a — MorphCase boundary;
- N1b — explicit grammatical Gen;
- N2 — number-sensitive gender and agreement;
- N3 — lexical adjective architecture;
- N4 — grammatical CN boundary + centralized *nyje*;
- N5 — public APIs and sourced structural forms;
- N6 — architecture guardrails;
- N7 — regression scenario deepening;
- N8 — documentation reconciliation;
- N9 — delivery audit/package.

Rollback can therefore stop at the last green migration rather than reverting one monolithic patch.
