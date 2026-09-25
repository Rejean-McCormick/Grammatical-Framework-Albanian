# Current baseline and verbal debt

**Status:** descriptive source inventory. This file records what the supplied 2026-09-25 Albanian snapshot currently does; it does not prescribe the final architecture.

## 1. Current structural strengths

- `TenseSqi` inherits the public `TenseX` contract unchanged.
- `CatSqi` keeps public RGL clause tables over `ParamX.Tense × Anteriority × Polarity`.
- `ResSqi` separates public `ParamX.Tense` from Albanian internal `ResSqi.Tense`.
- `Verb` already exposes present/other indicative tables, subjunctive, imperative, participle, optative and admirative data.
- `VP` defers finite realization and preserves complement/postmaterial.
- `ClauseSqiRes` is already a shared realization resource consumed below higher syntax modules.
- weak pronoun forms and `të`-clitic contractions are already centralized in `ResSqi` tables.

These are valuable baseline properties to preserve.

## 2. Exact current shortcuts that are non-final

### `DEBT-V-001` — public past mapping

Current `ResSqi.sqiTense` maps:

```text
TPres -> Pres
TPast -> Aorist
TFut  -> Pres
TCond -> Imperfect
```

The upstream abstract `Tense.gf` glosses common `TPast` as past/“imperfect”. That does not by itself prove the Albanian mapping, but it makes the current `TPast -> Aorist` choice a deliberate parity question that must be resolved and documented, not inherited silently.

### `DEBT-V-002` — overloaded internal `Past`

`ResSqi.Tense = Pres | Past | Imperfect | Aorist`, while current `MorphoSqi` paradigms include `Past` cells populated by `kam + participle`. Therefore the label `Past` is not a clean simple-morphological tense name and must not survive as ambiguous final semantics.

### `DEBT-V-003` — active-only anterior auxiliary

`ClauseSqiRes.realizeVP` currently builds anterior forms from global `haveAux`/`haveSubj`, i.e. active `kam` strategies. The realizer has no first-class morphological voice input from which to select non-active `jam` compound strategies.

### `DEBT-V-004` — shallow passive

Current `VerbSqi.PassV2` is structurally `jam` plus participle as postmaterial. It does not dispatch by tense/anteriority and cannot select simple non-active/aorist strategies.

### `DEBT-V-005` — shallow reflexive

Current `ReflVP` inserts `u` / `t'u` strings into clitic slots. This is useful baseline behavior but conflates semantic reflexive use with a marker that also participates in morphological non-active constructions.

### `DEBT-V-006` — no typed progressivity

`po` is not represented as a grammatical state in `VP`/clause context. Therefore the system cannot centrally license or reject progressive interactions.

### `DEBT-V-007` — subjunctive depth

The lexical `Verb.Subjunctive` table is present-oriented. Anterior subjunctive is assembled separately with `haveSubj + participle`; richer mood/voice interactions are not first-class.

### `DEBT-V-008` — non-active paradigm incompleteness

The lexical `Verb` record has no full active/non-active dimension. Current syntax therefore cannot request a morphological non-active paradigm uniformly across present/imperfect/aorist/compound strategies.

## 3. What must not regress

During migration, preserve:

- public RGL types/signatures;
- existing working active realization until a reviewed replacement exists;
- clitic contractions already validated by current scenarios;
- optative/admirative morphology already present in the source;
- current green baseline as rollback anchor;
- all 58 census targets and 52 original scenarios.
