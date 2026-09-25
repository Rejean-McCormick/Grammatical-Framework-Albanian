# Release gate — Conversation 4 verbal subsystem

**Status:** blocking checklist. This file is intentionally concise; detailed rules live in their canonical owner documents.

## Contract and architecture

- [ ] `00_MASTER_CONTRACT.md` invariants are satisfied.
- [ ] current source/debt ledger is reconciled with implementation.
- [ ] one central finite realizer owns TAM/polarity/voice/particle ordering.
- [ ] morphology/VP/clause-request ownership boundaries are reflected in code.
- [ ] no orphan fields, duplicate realization services or string-recovery hacks remain.

## Morphology and TAM

- [ ] simple present, imperfect, aorist and compound-perfect ownership is unambiguous.
- [ ] VQ-001 common `TPast` default is closed or explicitly deferred with a non-misleading supported mapping.
- [ ] VQ-002 past-anterior default is closed or explicitly deferred.
- [ ] active/non-active compound auxiliary strategy is centralized and tested.
- [ ] future, future perfect, conditional and past conditional have named strategies.
- [ ] progressive exposes only licensed cells.

## Voice and syntax

- [ ] morphological non-active and passive/reflexive/reciprocal semantic use are not conflated.
- [ ] `PassV2` is TAM-sensitive rather than a fixed final string.
- [ ] `ReflVP` is structured and clitic-safe.
- [ ] reciprocal is documented/certified or explicitly OPEN/deferred.
- [ ] all 29 public `Verb` rows have final status.
- [ ] shared clitic/valency/Extend boundaries have no duplicated private workaround.

## Mood and non-finite

- [ ] finite subjunctive and anterior subjunctive are tested.
- [ ] negative subjunctive and imperative strategies are tested.
- [ ] optative/admirative source forms remain correct; public exposure, if any, has reviewed tests.
- [ ] Tosk non-finite extension policy is explicit and does not import Geg infinitive semantics.

## Validation

- [ ] focused static/morphology/TAM/voice tests pass.
- [ ] mandatory `VT-ANTI-*` tests pass.
- [ ] fresh GF 3.12 / Wordbench 1.3.4 census = 58/58.
- [ ] original scenarios = 52/52.
- [ ] existing reviewed golds have no unreviewed regression.
- [ ] new asserted linguistic outputs have `VE-*` evidence and review records.
- [ ] no placeholder count increase hides a verbal-core defect.

## Documentation reconciliation

- [ ] `VDEC-*` and `VQ-*` reflect current code.
- [ ] `ALBANIAN_DECISION_LOG.md`, `ALBANIAN_OPEN_QUESTIONS.md` and parity/status docs are synchronized.
- [ ] source hashes and run IDs are stored.
- [ ] limitations/non-certified cells are enumerated.

## Permitted release statement

Only after all blocking items pass:

```text
The Conversation 4 Albanian verbal subsystem is compiler- and regression-validated
on GF 3.12 / Wordbench 1.3.4 at 58/58 + 52/52. Behaviors explicitly marked
CERTIFIED have Albanian evidence and linguistic review. Remaining OPEN/deferred
cells are enumerated, and no compile-safe placeholder is presented as linguistic
certification.
```
