# RGL parity and model-language comparison policy

**Status:** canonical comparison policy.

## 1. Meaning of “equivalent to English RGL”

Parity means:

- complete accounting for the public abstract API;
- stable category contracts;
- productive paradigms plus explicit irregular handling;
- compositional VP/clause architecture;
- deep regression tests and inspectable evidence;
- mature public facades and `Extend`/`Extra` integration;
- release-quality documentation.

It does not mean English tense semantics, English infinitives, English passive, English auxiliary selection or English progressive distribution.

## 2. Model roles

| Model | Architectural value | Must not be copied as Albanian fact |
|---|---|---|
| English | API completeness, mature finite assembly, regression depth | tense semantics, `to` infinitive, `be` passive/progressive |
| Greek | structured voice/aspect/mood and Balkan finite complementation | Greek particles/forms/exact aspect system |
| Macedonian | Balkan finite complement strategies; present/aorist/imperfect resources | Macedonian aspect/endings |
| Bulgarian | complement strategy; structured passive/reflexive/clitic handling | Bulgarian `да` and aspect specifics |
| Romanian | reflexive/clitic state carried through VP operations | Romanian clitic order/passive auxiliary |
| Italian | auxiliary/passive architecture comparison | lexical `essere/avere` selection without Albanian evidence |

## 3. Compendium patterns adopted as engineering constraints

- `EP019` — single clause assembly point;
- `EP021` — polarity propagation;
- `EP030` — preserve selected non-finite/embedded complement forms;
- `EP033` — modal composition by subclass only if Albanian evidence requires subclasses;
- `EP042` — auxiliary selection discipline, without importing another language’s selector.

## 4. Admission rule for a model-language idea

```yaml
albanian_problem: ...
albanian_evidence_or_open_gap: ...
required_distinction: ...
model_source: ...
contract_compatibility: ...
proposed_albanian_adaptation: ...
tests: ...
```

A model analogy with no Albanian evidence can justify a representation experiment, never a certified Albanian surface form.
