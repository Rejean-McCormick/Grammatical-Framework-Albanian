# Albanian GF documentation — maintainer entry point

This directory separates **stable architecture**, **live repair state**, **historical decisions**, and **linguistic validation** so that a current compiler experiment is not mistaken for a permanent language rule.

## Read in this order during active `ExtendSqi` repair

1. [`CURRENT_REPAIR_STATE.md`](CURRENT_REPAIR_STATE.md) — current GF/RGL/run state, first hard blocker, warnings, and next evidence gate.
2. [`ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md`](ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md) — normative ownership and inheritance map for the current development cycle.
3. [`albanian_extend_specifics_lockfield_and_boundary.md`](albanian_extend_specifics_lockfield_and_boundary.md) — tactical coordinator/lock/boundary repair procedure.
4. [`ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md`](ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md) — general authority, helper, constructor, and inheritance rules.
5. [`ALBANIAN_SYMBOL_STATUS_LEDGER.md`](ALBANIAN_SYMBOL_STATUS_LEDGER.md) — current per-symbol maturity/risk, including compiler and linguistic status for active repairs.
6. [`ALBANIAN_DECISION_LOG.md`](ALBANIAN_DECISION_LOG.md) — chronological evidence and why earlier experiments were accepted, rejected, or superseded.
7. [`ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`](ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md) — required compile, structural, and linguistic regression checks.

Use the remaining category, syntax, morphology, helper, model-language, stale-comment, and open-question documents as subsystem references.

## Authority model

Do not use one flat authority list for every kind of claim.

### Contract / source authority

For what a function or category **is allowed to mean or contain**:

1. exact current abstract signature or type declaration;
2. current Albanian category contract (`CatSqi`, relevant resources, producers, consumers, public constructors);
3. exact inherited/functor/interface source;
4. accepted Albanian ownership/architecture decisions;
5. target-language linguistic evidence where semantics/realization are at issue;
6. architecture-compatible model languages as corroboration only;
7. comments and historical notes last.

### Empirical build authority

For what **actually compiles in the current state**:

1. compiler/test output from the exact current source state and GF/RGL revision;
2. current source dump that produced that output;
3. earlier runs only as historical evidence.

Compiler success establishes build facts, not linguistic correctness.

## Document-role rule

- **Stable current truth** belongs in the override matrix, architecture/policy docs, category contracts, and test spec.
- **Live changing state** belongs in `CURRENT_REPAIR_STATE.md`.
- **Why a decision changed** belongs in the decision log.
- **Current symbol maturity** belongs in the symbol status ledger.
- **Unresolved design questions** belong in `ALBANIAN_OPEN_QUESTIONS.md`.
- **Historical repair chronology must not accumulate in the normative matrix.**

When a new Wordbench run changes the first hard blocker, update `CURRENT_REPAIR_STATE.md`, then only the stable documents whose truth actually changed.
