# Albanian documentation synchronization — 2026-09-22

This note records the documentation synchronization against source snapshot `Code_snapshot_Grammatical_Framework-Albanian(20260922-123534).zip` and Wordbench run `20260922_123316`.

## Evidence changes since 2026-09-21

The previous live documentation described a 52-file tree and a 45/47 run whose remaining blocker was `LangSqi` helper namespace composition. The current source has moved beyond that exact state.

Current facts:

```text
full source census:        54 GF files
language-folder sources:   49
parent API facades:          5
Wordbench included:         49
PASS:                       22
FAIL:                       27
scenarios:                   0
Compendium highest level:   T0
aggregate compile T8:       FAIL
```

The two new public-surface files relative to the former 52-file contract are:

```text
albanian/MarkupSqi.gf
CombinatorsSqi.gf
```

`MarkupSqi` is included in the automatic 49-file language scan. `CombinatorsSqi` belongs to the five parent-directory facades, none of which were included by automatic discovery.

## Root-cause synchronization

The current 27 FAILs are not documented as 27 independent bugs. Raw GF stderr identifies the shared first proven blocker:

```text
ParadigmsSqi.gf:
  circular definitions: mkA2
```

The Wordbench summary labels `Voc`, `Int`, and similar tokens are not accepted as root diagnostics. `ALB-DEC-050` records the importer/downstream grouping rule for this run.

## Paradigms policy synchronization

`ALB-DEC-051` extends the already-established typed-helper discipline to public overload families: an overload must not redispatch through its own overloaded public name. `mkA2` is the proven failure; sibling constructor families are audited preventively in the next upgrade.

## Census synchronization

All operational compiler-gate documents now use **54/54** as the complete current gate:

- 49 language-folder files;
- 5 public API facades: `CombinatorsSqi`, `ConstructorsSqi`, `SymbolicSqi`, `SyntaxSqi`, `TrySqi`.

The old 52-file count remains valid only as historical evidence for earlier snapshots.

## Lock-field synchronization

The 2026-09-22 run exposes nine structural lock warnings:

```text
lock_NP       x2
lock_VP       x6
lock_VPSlash  x1
```

Existing Albanian policy already defines unexplained `missing lock_*` warnings as structural defects rather than cosmetic warnings. The current operational docs now make their closure part of the next compiler/structural upgrade.

## Compendium synchronization

The current Compendium state is recorded without promotion:

- T0 `environment_and_source_integrity`: PASS;
- T8 `aggregate_language_compile`: FAIL;
- T1-T7 and T9-T11: NOT ASSESSED;
- linguistic certification: not established.

No intermediate level is inferred from module compilation alone.

## Next upgrade synchronization

A new normative file, `ALBANIAN_NEXT_UPGRADE_20260922.md`, defines the next coherent cycle:

```text
U1  Paradigms overload hardening
U2  dependency ladder / root-cause grouping
U3  lock-field closure
U4  54-file public-surface compiler gate
U5  Wordbench diagnostic + source-lock hardening
U6  reviewed Albanian scenarios/goldens
```

This sequence does not redefine the final mature-RGL target. It defines the next implementation cycle needed to reach that target safely.

## Files synchronized

At minimum this synchronization updates:

- `README.md`
- `CURRENT_REPAIR_STATE.md`
- `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`
- `ALBANIAN_MINIMAL_TEST_SUITE_SPEC.md`
- `ALBANIAN_OPEN_QUESTIONS.md`
- `ALBANIAN_DECISION_LOG.md`
- `ALBANIAN_RGL_COMPLETION_EXPANSION_PLAN.md`
- `status/ALBANIAN_IMPLEMENTATION_STATUS.md`
- new `ALBANIAN_NEXT_UPGRADE_20260922.md`
- this synchronization note
