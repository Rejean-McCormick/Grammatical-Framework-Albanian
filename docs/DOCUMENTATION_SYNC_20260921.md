# Albanian documentation synchronization — 2026-09-21

This note records the documentation-only synchronization performed after the post-FIX22C mega-update and Wordbench Global Scan `20260921_151446`.

## Why the documentation changed

The previous bundle mixed three different states:

- historical pre-FIX22C repair chronology (fix17/fix18 and the old PMCFG blocker);
- the FIX22C compiler-stable milestone;
- the later mega-update, which is currently blocked by lower-level GF syntax corruption.

It also contained an unconditional inherited-VPS-family rule that no longer matched the current source, where `ExtendSqi.gf` subtracts and locally implements the VPS/VPI/VPS2/VPI2 family.

## Normative result

The active order is now:

```text
syntax-integrity recovery
  -> exhaustive compile census
  -> DIRECT vs DOWNSTREAM classification
  -> root-cause compiler repair
  -> restore FIX22C + public-facade compiler gates
  -> linguistic scenarios / reviewed goldens
  -> capability completion
  -> release validation
```

`ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md` owns that order. `CURRENT_REPAIR_STATE.md` owns the live blocker. `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md` owns the final-state destination.

## Syntax invariant synchronized across the bundle

```gf
\x -> expr       -- ordinary function abstraction
\\x => expr      -- table abstraction
"" => expr       -- empty Str pattern
_ => []          -- empty surface result
```

Static-scan findings must be checked against the local expected type or scrutinee type; no blind replacement is authorized.

## VPS/VPI ownership synchronization

The old inheritance-only rule remains historical evidence but is no longer an unconditional current prescription. The mega-update has reopened the family, but its coordinator-local implementation is not automatically accepted.

After compiler recovery, the final family-wide choice is:

- coherent inheritance, if `ExtendFunctor` is category-correct and behaviorally sufficient; or
- coherent local ownership in a dedicated companion such as `ExtendSqiVPS.gf`, if exact Albanian evidence requires richer structure.

`ExtendSqi.gf` remains a thin coordinator in either case.

## Model-language synchronization

`ALBANIAN_MODEL_LANGUAGE_COMPARISON.md` now records the supplied model-language evidence and its limits. Model languages can corroborate GF engineering idioms; they do not decide Albanian linguistic realization or VPS-family ownership.

## Bundle integrity

Active normative documents no longer require companion files that are absent from this bundle. Historical decision-log entries may still mention older files as provenance; those references are explicitly non-required.
