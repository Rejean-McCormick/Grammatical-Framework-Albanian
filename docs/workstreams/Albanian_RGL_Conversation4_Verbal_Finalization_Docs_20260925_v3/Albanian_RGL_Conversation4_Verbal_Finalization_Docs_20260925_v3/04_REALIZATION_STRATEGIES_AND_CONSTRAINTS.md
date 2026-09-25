# Verbal realization strategies and constraints

**Status:** canonical owner for TAM/voice realization, particle slots and impossible combinations. A strategy is a complete construction, not a bag of optional prefixes.

## 1. Common RGL strategy matrix

| Request | Active target | Non-active target | Strategy status |
|---|---|---|---|
| `TPres + ASimul` | simple present | synthetic non-active present | ESTABLISHED family |
| `TPres + AAnter` | present `kam` + participle | present `jam` + participle | ESTABLISHED |
| `TPast + ASimul` | documented common past default | corresponding non-active strategy | OPEN default, VQ-001 |
| `TPast + AAnter` | selected past `kam` auxiliary + participle | corresponding `jam` auxiliary + participle | TARGET default, VQ-002 |
| `TFut + ASimul` | `do` + present-subjunctive strategy | `do` + non-active subjunctive strategy | ESTABLISHED construction family; gold required for non-active breadth |
| `TFut + AAnter` | `do` + perfect-subjunctive `kam` + participle | `do` + perfect-subjunctive `jam` + participle | active ESTABLISHED; non-active TARGET/gold |
| `TCond + ASimul` | `do` + imperfect-subjunctive strategy | corresponding non-active strategy | active ESTABLISHED; non-active TARGET/gold |
| `TCond + AAnter` | `do` + past-perfect-subjunctive auxiliary + participle | corresponding `jam` strategy | active ESTABLISHED; non-active TARGET/gold |

Common `Tense × Anteriority × Polarity` yields 16 abstract combinations. The 8 temporal/anteriority cells above each require both positive and negative strategy tests.

## 2. Strategy IDs

### Common RGL

- `VR-PRES-SIM-ACT`, `VR-PRES-SIM-NA`
- `VR-PRES-ANT-ACT`, `VR-PRES-ANT-NA`
- `VR-PAST-SIM-ACT`, `VR-PAST-SIM-NA`
- `VR-PAST-ANT-ACT`, `VR-PAST-ANT-NA`
- `VR-FUT-SIM-ACT`, `VR-FUT-SIM-NA`
- `VR-FUT-ANT-ACT`, `VR-FUT-ANT-NA`
- `VR-COND-SIM-ACT`, `VR-COND-SIM-NA`
- `VR-COND-ANT-ACT`, `VR-COND-ANT-NA`

### Albanian extension strategies

- `VX-AORIST`, `VX-IMPERFECT` — whichever simple past is not the common default remains explicitly selectable.
- `VX-PAST-ANT-KISHA`, `VX-PAST-ANT-PATA` — distinct past-anterior series if both remain exposed.
- `VX-PROGRESSIVE` — only for evidence-licensed environments.
- `VX-OPTATIVE`, `VX-ADMIRATIVE` — Albanian moods outside common `Tense`.
- `VX-GERUNDIVE`, `VX-PURPOSE-NONFINITE` — `duke ...`, `për të ...` extension families.

## 3. Canonical slot model

The realizer conceptually owns ordered slots; not every strategy fills every slot:

```text
[negation/mood frame]
[future/conditional do]
[subjunctive frame / licensed të-clitic contraction]
[progressive frame]
[voice/non-active material]
[weak-pronoun cluster]
[finite auxiliary OR finite lexical head]
[participle/non-finite head]
[postmaterial/complements]
```

This is an ownership model, not a universal linear template. A named strategy may fuse, reorder or omit slots according to Albanian evidence.

## 4. Polarity and mood constraints

- ordinary finite negative uses `nuk` where licensed;
- negative imperative uses `mos`, not a generic `nuk` substitution;
- negative subjunctive uses a dedicated `të mos` strategy;
- future/conditional negative ordering with clitics remains VQ-007 until source-tested;
- optative/admirative negative realization remains OPEN if publicly exposed.

## 5. Voice strategy constraints

| Semantic/morphological state | Simple present/imperfect | Aorist/non-present-stem | Compound/anterior |
|---|---|---|---|
| plain active | active finite | active finite | `kam + participle` |
| non-active morphology | synthetic non-active | `u` strategy where licensed | `jam + participle` |
| semantic passive | choose validated passive/non-active strategy | choose validated strategy | `jam + participle` where licensed |
| reflexive | structured reflexive state + licensed morphology/clitic realization | context-dependent | context-dependent |
| reciprocal | OPEN | OPEN | OPEN |

`ReflVP` and non-active `u` are not the same data type merely because the same surface token may occur.

## 6. Progressive constraints

| Context | Status |
|---|---|
| present indicative | ESTABLISHED `po + finite` |
| imperfect indicative | ESTABLISHED attested example |
| future | `do të po ...` mechanical composition FORBIDDEN; actual progressive future OPEN |
| conditional | OPEN |
| subjunctive | OPEN |
| imperative | OPEN |
| anterior/perfect | OPEN |
| non-active | OPEN interaction |

A future-progressive meaning may use another strategy; this pack does not invent one.

## 7. Mandatory anti-overgeneration rules

The realizer must reject or make unreachable:

- mechanical `do + të + po + ...` unless the exact construction is independently established;
- duplicate `të` created by treating the subjunctive marker and contracted weak-pronoun form as independent strings;
- duplicate `u` from treating reflexive and non-active morphology as unrelated free prefixes;
- two finite heads in a strategy licensing only one;
- `nuk` as universal imperative negation;
- a bare participle where the selected construction requires an auxiliary/frame;
- automatic non-active present/imperfect synthesis from an active surface string.

## 8. Ordering questions that remain OPEN

`VQ-007` and related tests must close:

- negative future/conditional + weak-pronoun order;
- progressive + clitic ordering across persons;
- non-active aorist `u` + accusative/dative cluster interactions;
- imperative clitic placement;
- combined accusative+dative contraction behavior;
- passive-agent interaction with cliticized objects.
