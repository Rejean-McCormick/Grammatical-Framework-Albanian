# CURRENT_REPAIR_STATE

Status: **live repair state — update after every evidence-changing Wordbench run**  
Last evidence update: **2026-09-21**  
Current phase: **PMCFG/root-cause recovery at the Verb → VP morphology boundary**  
Operational sequence: `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md`

This file records the latest reproducible working-state facts. FIX22C remains the last historical compiler-stable baseline for its exact earlier snapshot; later runs supersede it only as evidence about the current source.

## 1. Source / tool lock

- GF: `3.12`
- GF executable in latest Wordbench artifact: `C:/mycode/Grammatical_Framework/gf-3.12-windows/gf.exe`
- RGL root in latest Wordbench artifact: `C:/mycode/Grammatical_Framework/gf-rgl`
- historical last-known compiler-stable Albanian baseline: **FIX22C / `albanian-rgl-core-v0.1.0`**
- latest locally validated source before the current patch: **candidate (11)**
- latest Wordbench evidence: run `20260921_201720`, mode `diagnostic`, Global Scan
- current working source after that evidence: **candidate (12), pending local GF validation**

If the source snapshot, GF version, RGL revision, or search paths change, compiler claims must be rerun.

## 2. Latest Wordbench Global Scan

Run: `20260921_201720`  
Mode: `diagnostic` / Global Scan  
GF: `3.12`  
Scenarios: `0`

```text
Files included:       47
Files OK:             27
Files failed:         20
Files errored:         0
Files skipped:         0
Direct failures:      19
Downstream failures:   0
Ambiguous failures:    1
```

This run confirms that ALB-DEC-046 removed the former `CProj ... "cl"` PMCFG family: the backend now advances beyond that representation. The dominant remaining crash instead descends through the nested lexical-verb projection:

```text
CProj "Indicative" (CProj "v" ...)
  -> Pres
  -> Sg
  -> P1
```

The crash is reproduced at `ComplVV` and then by consumers such as `GenericCl`, `UttVP`, `QuestQVP`, `RelVP`, and `EmbedVP`. The common source is the old `subjunctiveFinite` strategy, which reconstructs the Albanian subjunctive in syntax by inspecting present-indicative surface strings.

The automatic scan still does **not** represent the complete source census. The language folder contains 48 Albanian `.gf` modules while Wordbench included 47. The four parent-directory API facades also require supplemental compilation:

```text
SyntaxSqi.gf
ConstructorsSqi.gf
SymbolicSqi.gf
TrySqi.gf
```

Therefore the complete current validation target remains **52 GF files**.

## 3. Current independent failure families from candidate (11)

### 3.1 GeneratePMCFG / late subjunctive reconstruction

The old representation was:

```gf
VP = {
  v : Verb ;
  cl : Str ;
  subjcl : Str ;
  post : Agr => Str
} ;
```

and embedded/subjunctive realization eventually called:

```gf
subjunctiveFinite vp.v a
```

`subjunctiveFinite` projected `vp.v.Indicative ! Pres ! Sg ! P1` and then performed `case` analysis on that surface string to infer 2sg/3sg subjunctive forms. Run `20260921_201720` proves that this is too late in the representation: GF 3.12 PMCFG generation crashes while descending that nested projection.

Candidate (12) moves the decision to the morphology boundary:

```gf
Verb = {
  Indicative  : Tense => Number => Person => Str ;
  Subjunctive : Number => Person => Str ;
  ...
} ;
```

All existing generated/paradigm `Verb` records now populate `Subjunctive` when the verb is built. The current productive/irregular derivation rules are preserved, but they are evaluated in morphology rather than in PMCFG-facing syntax.

`VP`/`VPSlash` no longer retain `v : Verb`. They copy the structured morphosyntactic tables required downstream:

```gf
indicative        : Tense => Number => Person => Str ;
subjunctive       : Number => Person => Str ;
imperative        : Number => Str ;
participle        : Str ;
pres_optative     : Number => Person => Str ;
perf_optative     : Number => Person => Str ;
pres_admirative   : Number => Person => Str ;
imperf_admirative : Number => Person => Str ;
cl, subjcl        : Str ;
post              : Agr => Str ;
```

This is **not** a flatten-to-`Str` workaround: all currently represented verbal distinctions remain structured. It removes only the nested `VP -> Verb -> Indicative` traversal and the late string-based mood inference.

`subjunctiveFinite` remains only as a compatibility selector over `Verb.Subjunctive`; it no longer reconstructs morphology or performs `case Str`.

### 3.2 Independent Lexicon overload failure

The one ambiguous failure in run `20260921_201720` is `LexiconSqi.distance_N3`:

```text
no overload instance of ParadigmsSqi.mkPrep
with value type Prep
for argument list Str
```

Candidate (12) makes government explicit:

```gf
mkPrep "nga" R.Ablat
mkPrep "deri në" R.Acc
```

and opens `ResSqi` under alias `R`. This both resolves overload selection and preserves typed case government.

## 4. Status of ALB-DEC-045 / 046

- **ALB-DEC-045:** retained for the useful narrowing `cl : Str`; its claim that this alone was sufficient was already superseded.
- **ALB-DEC-046:** **confirmed for its stated clitic problem**. Candidate (11) removed the `CProj "cl"` crash family. `subjcl : Str` remains because it represents a grammatical clitic/future-subjunctive surface decision made when the object is introduced.
- **ALB-DEC-047:** new current decision. Subjunctive morphology is explicit at `Verb` construction and copied into `VP`; syntax may select it but may not infer it from indicative strings.

## 5. Syntax-integrity / preflight status for candidate (12)

The Wordbench static-scanning service was run locally over all **52 `.gf` files** in the snapshot:

```text
files scanned: 52
findings:       0
scan errors:    0
```

`gf_morphosqi_lint.py` reports:

```text
findings: 0
```

The candidate-(12) preflight also detected and repaired 51 malformed extra record openings introduced while bulk-populating `Subjunctive` in legacy `lin V` blocks. The linter now checks whole-file delimiter balance and the ALB-DEC-047 `lin V` contract. Final structural census:

```text
lin V blocks in MorphoSqi: 135
missing Indicative/Subjunctive/Imperative fields: 0
whole-file brace delta: 0
whole-file parenthesis delta: 0
```

The separate inference detector still reports heuristic candidates in generated morphology. They are **not** treated as compiler defects and are not changed without GF or linguistic evidence.

The following corruption families remain absent:

```text
single-backslash table abstraction (\x =>): 0
[] used as a case-pattern:                   0
teWithClitic definition/use:                  0
VP.v field / nested VP.v.Indicative access:  0
```

## 6. Current work order

1. validate candidate (12) with GF 3.12 Global Scan;
2. verify that the `CProj "Indicative" (CProj "v" ...)` family disappears;
3. classify any newly exposed compiler errors by independent root cause;
4. continue until all 48 language-folder modules compile;
5. compile the four parent API facades;
6. restore/exceed the historical FIX22C compiler gate;
7. only then run Albanian behavioral scenarios/goldens.

Do not reintroduce late string inspection, do not flatten rich categories merely to advance PMCFG, and do not count importer failures as independent bugs when they share the same first failing declaration.

## 7. Current status of earlier repair topics

| Topic | Current meaning |
|---|---|
| FIX22C | historical compiler-stable baseline |
| syntax corruption (`[] =>`, `\x =>`) | repaired; static gate clean |
| candidate (10) | 24 PASS / 23 FAIL; proved `cl : Str` alone was insufficient |
| candidate (11) | 27 PASS / 20 FAIL; confirmed `subjcl` removed `CProj "cl"`; exposed nested `VP.v.Indicative` as next root cause |
| candidate (12) | explicit `Verb.Subjunctive` + structured Verb→VP boundary; pending local GF validation |
| `subjunctiveFinite` | compatibility selector only; no string inference |
| VPS/VPI/VPS2/VPI2 | local companion ownership remains provisional until clean GF/PMCFG validation |
| linguistic scenarios | still blocked until compiler gate is green |

## 8. Documentation synchronization rule

After each evidence-changing run update, at minimum:

- this file;
- `ALBANIAN_DECISION_LOG.md` when reasoning is accepted/rejected/superseded;
- `ALBANIAN_SYMBOL_STATUS_LEDGER.md` when a public symbol contract changes;
- `ALBANIAN_OPEN_QUESTIONS.md` when priorities change;
- `ALBANIAN_MODEL_LANGUAGE_COMPARISON.md` when model evidence changes the engineering recommendation;
- `ALBANIAN_RECOVERY_AND_COMPLETION_SEQUENCE.md` only if the operational method itself changes.
