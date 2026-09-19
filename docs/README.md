# Albanian GF documentation — maintainer entry point

This directory separates **frozen release history**, **live Completion state**, **governing architecture**, **historical decisions**, and **linguistic validation** so that a compiler experiment is not mistaken for a permanent Albanian rule.

## Read in this order during Albanian RGL Completion

1. [`CURRENT_REPAIR_STATE.md`](CURRENT_REPAIR_STATE.md) — live development state, active work package, and next evidence gate. The filename is historical; the file now tracks Completion rather than compiler survival.
2. [`ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`](ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md) — normative **total final-state specification** for the completed Albanian RGL: architecture, category contracts, linguistic capabilities, public API coverage, validation obligations, and release definition. It deliberately does not prescribe implementation order.
3. [`status/ALBANIAN_IMPLEMENTATION_STATUS.md`](status/ALBANIAN_IMPLEMENTATION_STATUS.md) — living maturity/status view for the whole Albanian RGL.
4. [`ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md`](ALBANIAN_EXTENDSQI_OVERRIDE_MATRIX.md) — normative ownership and inheritance map for the current phase.
5. [`ALBANIAN_EXTENDSQI_FINAL_TARGET.md`](ALBANIAN_EXTENDSQI_FINAL_TARGET.md) — stable thin-coordinator target and subsystem ownership rules.
6. [`ALBANIAN_FUTURE_EXTENDSQI_STRUCTURE.md`](ALBANIAN_FUTURE_EXTENDSQI_STRUCTURE.md) — detailed future physical/functional structure of the extension layer.
7. [`ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`](ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md) — compile, structural, behavioral, and golden regression requirements.
8. [`ALBANIAN_OPEN_QUESTIONS.md`](ALBANIAN_OPEN_QUESTIONS.md) — unresolved Completion design and linguistic questions.
9. [`ALBANIAN_SYMBOL_STATUS_LEDGER.md`](ALBANIAN_SYMBOL_STATUS_LEDGER.md) — per-symbol/family maturity and risk.
10. [`ALBANIAN_DECISION_LOG.md`](ALBANIAN_DECISION_LOG.md) — chronological evidence and explicit supersession of earlier cycle-specific decisions.

For the published baseline, use [`status/ALBANIAN_CORE_V0.1.0.md`](status/ALBANIAN_CORE_V0.1.0.md). That file is a frozen milestone snapshot and should not be rewritten for post-release Completion work.

The tactical file [`albanian_extend_specifics_lockfield_and_boundary.md`](albanian_extend_specifics_lockfield_and_boundary.md) remains useful for lock/retyping and boundary debugging, but its stabilization-cycle VPS inheritance statements are historical wherever they conflict with the Completion expansion plan.

## Authority model

Do not use one flat authority list for every kind of claim.

### Contract / source authority

For what a function or category **is allowed to mean or contain**:

1. exact current abstract signature or type declaration;
2. current Albanian category/resource contract and producer/consumer graph;
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

### Behavioral authority

For what is claimed to be **linguistically implemented**:

1. explicit Albanian analysis/reference evidence;
2. deterministic Wordbench scenario output;
3. reviewed golden output when the capability is release-required;
4. parse/control evidence where relevant.

Model-language output is never a substitute for Albanian linguistic evidence.

## Document-role rule

- **Frozen release truth** belongs in `status/ALBANIAN_CORE_V0.1.0.md`.
- **Live changing state** belongs in `CURRENT_REPAIR_STATE.md` and `status/ALBANIAN_IMPLEMENTATION_STATUS.md`.
- **Completed-system target architecture and behavior** belong in `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`; current implementation order/cursor belongs in `CURRENT_REPAIR_STATE.md`.
- **Stable coordinator/ownership truth** belongs in the target/override architecture docs.
- **Why a decision changed** belongs in the decision log.
- **Current symbol/family maturity** belongs in the symbol status ledger.
- **Unresolved design questions** belong in `ALBANIAN_OPEN_QUESTIONS.md`.
- **Historical repair chronology must not accumulate in normative architecture documents.**

When a new Wordbench run changes evidence, update the live state first, then only the stable documents whose truth actually changed.
