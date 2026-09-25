# Albanian RGL — Conversation 4 verbal finalization

**Date:** 2026-09-25
**Scope:** `VerbSqi`, `TenseSqi` mapping boundary, `ResSqi`, relevant `MorphoSqi` / `ParadigmsSqi` / `IrregSqi`, `ClauseSqiRes`, `IdiomSqi`, `ExtendSqiVPBridge`, `ExtraSqi`, and verbal validation.
**Structural baseline to preserve:** `albanian-s02-green-20260925`, GF 3.12, Wordbench 1.3.4, expected census 58 = 51 language + 5 API + 2 MorphoDict, 52 required baseline scenarios.

## 1. Resulting architecture

The implementation now has one explicit flow:

```text
Verb morphology
  ResSqi.Verb / MorphoSqi / ParadigmsSqi
  -> exact finite tables + participle + MorphVoice

VP construction
  VerbSqi / ExtendSqiVPBridge
  -> arguments + clitic cluster + VoiceUse + Progressivity

finite realization
  ClauseSqiRes
  -> polarity + do/të/po + auxiliary + finite form/participle + post material
```

`MorphVoice` and semantic `VoiceUse` are distinct:

```gf
MorphVoice = ActiveMorph | NonActiveMorph ;
VoiceUse = PlainUse | PassiveUse | ReflexiveUse | ReciprocalUse ;
Progressivity = NeutralProgressive | Progressive ;
```

This prevents a semantic passive/reflexive operation from silently changing the lexical inflection class, while allowing true Albanian non-active verbs to select their own morphology and compound auxiliary.

## 2. Common RGL TAM mapping

The common public RGL contract remains `ParamX.Tense × Anteriority × Polarity`.

- `TPres + ASimul` -> Albanian present.
- `TPast + ASimul` -> Albanian imperfect.
- `TFut + ASimul` -> `do + të/subj-clitic + present subjunctive`.
- `TCond + ASimul` -> `do + të/subj-clitic + imperfect`.
- `TPres + AAnter` -> `kam/jam + participle`.
- `TPast + AAnter` -> `kisha/isha + participle`.
- `TFut + AAnter` -> `do + të/subj-clitic + ketë/jetë + participle`.
- `TCond + AAnter` -> `do + të/subj-clitic + kishte/ishte + participle`.

The internal resource constructor formerly named `Past` was renamed `Perfect`. `ParamX.Past` no longer maps to Albanian aorist.

## 3. Albanian-specific series

The following are exposed through `ExtraSqiAbs` rather than by changing common RGL tense semantics:

- `AlbAoristS`
- `AlbAoristAnteriorS`
- `AlbOptativeS`
- `AlbPerfectOptativeS`
- `AlbAdmirativeS`
- `AlbImperfectAdmirativeS`
- `AlbGerundAdv`
- `AlbPurposeAdv`

The explicit aorist-anterior auxiliary series is:

- active: `pata/pate/pati/patëm/patët/patën + participle`;
- non-active: `qeshë/qe/qe/qemë/qetë/qenë + participle`.

## 4. Auxiliary selection

For Standard Albanian compound verbal realization:

- `ActiveMorph` -> `kam` series;
- `NonActiveMorph` -> `jam` series.

This is selected from lexical/morphological voice. It is not an Italian-style lexical `essere/avere` class copied into Albanian.

All 135 `lin V { ... }` morphology records in `MorphoSqi.gf` now carry an explicit `morphVoice`. The supplied non-active morphology families are marked `NonActiveMorph`; exact irregular `bëhem` uses the explicit `irregVFullNA` constructor.

## 5. Progressive and impossible combinations

`ProgrVP` and `ProgrVPSlash` no longer insert the literal string `po`. They only set `Progressivity = Progressive`.

The finite realizer currently licenses source-supported progressive cells:

- present: `po + clitics + present`;
- common `TPast`: `po + clitics + imperfect`.

It deliberately returns `nonExist` for progressive future, conditional, anterior, imperative/subjunctive/nonfinite strategies not established by the supplied Albanian evidence. This prevents mechanical outputs such as `*do të po ...`.

## 6. Clitics, subjunctive and imperative

The realizer preserves these source-backed orders:

- future: `do + të/clitic contraction + verb` (`do ta hajë`);
- negative future: `nuk + do + të/clitic contraction + verb`;
- positive subjunctive: `të/clitic contraction + verb`;
- negative subjunctive: `të + mos + clitics + verb`;
- positive imperative: preverbal weak clitic strategy;
- negative imperative: `mos + clitics + imperative`;
- purpose: `për + të/clitic contraction + participle`;
- negative purpose: `për të mos + clitics + participle`;
- gerund: `duke + clitics + participle`;
- negative gerund: `duke mos + clitics + participle`.

## 7. Voice

### Lexical/morphological non-active

True non-active paradigms retain non-active present/imperfect inflection, `u`-based aorist/marked forms where encoded by the morphology, and `jam` in compounds.

### Common `PassV2`

`PassV2` is kept as an analytic copular passive (`jam + participle`) and marked `PassiveUse`. The `Extend` `PassVPSlash` bridge is marked the same way. This remains separate from lexical `NonActiveMorph`.

### Common `ReflVP`

`ReflVP` uses the existing weak reflexive-clitic strategy and is marked `ReflexiveUse`; it does not relabel the lexical verb as `NonActiveMorph`.

### Reciprocal interpretation

The supplied lesson bundle does not define a separate productive reciprocal constructor. External linguistic evidence (Rivero, *The Location of Nonactive Voice in Albanian and Modern Greek*) documents that Albanian non-active morphology can carry passive, middle, reflexive and reciprocal readings; the example `Burrat lahen` has a reciprocal reading among its interpretations. Therefore no unsupported active-to-reciprocal string derivation was added. The advanced matrix includes the non-active `lahen` surface as a reciprocal-capable test cell; semantic `ReciprocalUse` remains a distinct internal value for future source-grounded consumers.

## 8. Existentials

`IdiomSqi` no longer owns a second hard-coded TAM implementation for existential `kam`. `ClauseSqiRes.realizeExist` now owns its present, imperfect/common-past, future, conditional and anterior realizations, preserving the single finite-realization boundary.

## 9. Validation added

The advanced campaign is registered as an **optional** Wordbench scenario, while the 52 required baseline scenarios remain unchanged. Its assets are split between canonical Wordbench locations and the expectation/audit directory:

- `validation/inputs/AlbVerbAdvanced.gf`
- `validation/inputs/AlbVerbAdvancedSqi.gf`
- `validation/scenarios/alb-verb-advanced.gfs`
- `validation/verbal_advanced/VERBAL_MATRIX_EXPECTATIONS.tsv`
- `validation/verbal_advanced/NEGATIVE_CONSTRAINTS.md`
- `validation/verbal_advanced/static_validate_verbal.py`

The matrix currently has **98 cells**, covering:

- active/non-active common TAM;
- Simul/Anter;
- positive/negative polarity;
- progressive present/imperfect;
- subjunctive and imperative;
- explicit aorist/aorist-anterior;
- optative/admirative families;
- clitic ordering;
- purpose and gerund;
- analytic passive and reflexive review cells;
- existential TAM;
- reciprocal-capable non-active surface.

No new `.gold` is promoted before a real GF 3.12 run and linguistic review.

## 10. Local verification completed

Passed locally:

- Conversation 4 structural validator;
- 135/135 `MorphoSqi` V records carry `MorphVoice`;
- common `Verb` API: 29/29 operations present;
- census unchanged: 51 language + 5 API + 2 MorphoDict = 58;
- required scenarios unchanged: 52;
- SHA-256 locks in the 52 existing scenarios match their inputs;
- advanced scenario source locks match;
- Dict + MorphoDict unified static validator;
- MorphoDict static validator;
- Dict static validator;
- `gf_morphosqi_lint.py`: 0 findings;
- Python validator compilation;
- no malformed `\\x ->` GF function abstractions in the working tree;
- `alb-verb-advanced` registered as an optional Wordbench scenario without changing the 52 required scenarios;
- Wordbench language probe on a reconstructed supplied RGL layout: PASS;
- Wordbench scenario contract check: PASS, 0 errors / 0 warnings;
- Wordbench `alb-verb-advanced` scenario contract check: PASS, 0 errors / 0 warnings.

## 11. Certification boundary

This environment does **not** contain a `gf` executable. Therefore this delivery does **not** claim a fresh GF 3.12 compilation result or a Wordbench 58/58 + 52/52 run.

Required external acceptance run:

1. run Wordbench 1.3.4 strict Global Scan against the delivered tree;
2. require 58/58 compile acceptance;
3. require the original 52/52 scenarios;
4. execute `validation/scenarios/alb-verb-advanced.gfs` separately;
5. compare its 98 cells to `VERBAL_MATRIX_EXPECTATIONS.tsv`;
6. promote only reviewed outputs to gold;
7. investigate any analytic passive/reflexive review cell before certification.

## 12. Remaining non-certification vs remaining implementation

The core architecture and source-supported TAM/voice mechanisms are implemented. The following are **not silently invented** and therefore remain review boundaries rather than hidden code gaps:

- future/conditional/anterior progressive combinations not licensed by supplied evidence;
- a dedicated productive active→reciprocal derivation (non-active morphology already carries reciprocal readings; no independent common RGL constructor exists);
- broad linguistic certification of analytic `PassV2` and weak-clitic `ReflVP` across lexical classes;
- compact legacy `irregV` entries whose complete aorist/imperfect/marked paradigms were never supplied—this is lexical morphology debt, not a reason to falsify the central TAM realizer.

These boundaries are explicit so later work cannot convert absence of evidence into a mechanical form.

## 13. Primary evidence used

Supplied Albanian reference archive:

- Lesson 10: subjunctive `të`, Standard/Tosk future `do + të + present subjunctive`.
- Lesson 20: active/non-active system; present/imperfect; participial compounds; Standard active `kam`, non-active `jam`.
- Lesson 30: weak-pronoun placement; future/perfect future; conditional/past conditional; imperative and subjunctive clitic order.
- Lesson 40: present-stem non-active; aorist-system `u`; compound non-active auxiliary switch; Tosk `për të + participle`; `duke + participle`.
- Lesson 50: optative and admirative families.
- `Albanian_Complete_Grammar`: progressive `po`, passive/non-active examples.

RGL/API source:

- supplied `gf-rgl-master/src/abstract/Verb.gf` (29 common operations);
- common `Tense`/`ParamX` semantics from the supplied RGL snapshot.

External corroboration used only for the reciprocal-reading boundary:

- María Luisa Rivero, “The Location of Nonactive Voice in Albanian and Modern Greek”.
