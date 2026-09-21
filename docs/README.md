# Albanian GF documentation — maintainer entry point

This directory separates **operational order**, **live compiler state**, **stable architecture**, **historical decisions**, and **linguistic validation** so that a current compiler experiment is not mistaken for a permanent language rule.

## Read in this order now

1. [`ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`](ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md) — normative order from a broken snapshot back to compiler stability, then linguistic completion.
2. [`CURRENT_REPAIR_STATE.md`](CURRENT_REPAIR_STATE.md) — latest reproducible GF/Wordbench facts and the current first independent blocker.
3. [`ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`](ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md) — normative description of the finished Albanian RGL; **not** an implementation order.
4. [`ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md`](ALBANIAN_OVERRIDE_AND_INHERITANCE_POLICY.md) — authority, category preservation, inheritance, helper, constructor, and model-language policy.
5. [`ALBANIAN_MODEL_LANGUAGE_COMPARISON.md`](ALBANIAN_MODEL_LANGUAGE_COMPARISON.md) — bounded engineering comparison of the supplied model languages; never Albanian linguistic authority.
6. [`ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`](ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md) — minimum compiler, structural, Global Scan, and linguistic regression gates.
7. [`ALBANIAN_SYMBOL_STATUS_LEDGER.md`](ALBANIAN_SYMBOL_STATUS_LEDGER.md) — symbol/pattern maturity and current compiler/linguistic status.
8. [`ALBANIAN_OPEN_QUESTIONS.md`](ALBANIAN_OPEN_QUESTIONS.md) — unresolved design questions after the current blocker is accounted for.
9. [`ALBANIAN_DECISION_LOG.md`](ALBANIAN_DECISION_LOG.md) — chronological evidence and why earlier experiments were accepted, rejected, or superseded.

Use `ALBANIAN_EXTENDSQI_*` and `albanian_extend_specifics_lockfield_and_boundary.md` as subsystem references. They do **not** override the current recovery sequence or current compiler evidence.

## Current development phase

FIX22C established the historical compiler-stable baseline `albanian-rgl-core-v0.1.0`. The later mega-update changed the source and the latest Global Scan no longer compiles the working tree. Therefore the current phase is:

```text
syntax-integrity recovery
  -> global compile census
  -> direct/downstream root-cause repair
  -> restore FIX22C + public API facade gates
  -> linguistic scenarios/goldens
  -> capability completion
```

Do not resume PMCFG/VPS/VPI or higher semantic completion while a lower parse/syntax blocker masks the compiler graph.

## Authority model

Do not use one flat authority list for every kind of claim.

### Contract / source authority

For what a function or category **is allowed to mean or contain**:

1. exact current abstract signature or type declaration;
2. exact current Albanian source/category/resource contract;
3. exact inherited/functor/interface source;
4. accepted Albanian architecture decisions;
5. target-language linguistic evidence where semantics/realization are at issue;
6. architecture-compatible model languages as corroboration only;
7. comments and historical notes last.

### Empirical build authority

For what **actually compiles in the current state**:

1. compiler/test output from the exact current source state and GF/RGL revision;
2. current source dump that produced that output;
3. earlier runs only as historical evidence.

Compiler success establishes build facts, not linguistic correctness. Compiler failure in the current snapshot invalidates claims that the current snapshot compiles, but it does not erase historical FIX22C evidence.

## GF syntax-integrity rule

Before category or linguistic reasoning, distinguish these GF constructs:

```gf
\x -> expr       -- ordinary function abstraction
\\x => expr      -- table abstraction
"" => expr       -- empty Str pattern in a case over Str
_ => []          -- empty surface result
```

Never convert `\x =>` or `[] =>` mechanically without checking the local expected/scrutinee type.

## Document-role rule

- **Operational order** belongs in `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`.
- **Live changing state** belongs in `CURRENT_REPAIR_STATE.md`.
- **Final architecture/capability truth** belongs in the completion plan and stable policy docs.
- **Why a decision changed** belongs in the decision log.
- **Current symbol maturity** belongs in the symbol status ledger.
- **Unresolved design questions** belong in `ALBANIAN_OPEN_QUESTIONS.md`.
- **Historical milestone evidence** belongs under `docs/status/`.
- Historical repair chronology must not become current priority merely because it is detailed.

When a new Wordbench run changes the first independent blocker, update `CURRENT_REPAIR_STATE.md` first, then only the stable documents whose truth actually changed.

## Bundle integrity note

Some older documents mention companion files such as helper registries, constructor matrices, stale-comment trackers, or extraction-coverage files that are **not present in this documentation bundle**. Those references are not active authority unless the named file is actually supplied for the same source snapshot. This bundle is self-sufficient through the documents listed above.
