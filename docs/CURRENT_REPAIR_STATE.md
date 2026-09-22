# Albanian current repair state

**Updated:** 2026-09-21  
**Compiler:** GF 3.12  
**Validation tool:** GF Wordbench Diagnostic / Global Scan

## 1. Evidence lock

- current source snapshot supplied by the maintainer: `Code_snapshot_Grammatical_Framework-Albanian(20260921-213419).zip`
- latest Wordbench run: `20260921_213424`
- GF executable recorded by the run: `C:/mycode/Grammatical_Framework/gf-3.12-windows/gf.exe`
- RGL root recorded by the run: `C:/mycode/Grammatical_Framework/gf-rgl`
- historical compiler-stable baseline: FIX22C / `albanian-rgl-core-v0.1.0`

Compiler claims below apply only to this source/run combination.

## 2. Latest Global Scan

```text
Files included:       47
Files OK:             45
Files failed:          2
Files errored:         0
Files skipped:         0
Scenarios seen:        0
GF:                  3.12
```

The automatic scan is now **45/47 green**. The two reported failures are:

- `LangSqi.gf`
- `AllSqi.gf`

They are not two independent linguistic/compiler defects. Both fail while composing `LangSqi`, with the same GF diagnostic:

```text
LangSqi.gf:
  cannot unify the information
    oper addPost = ClauseSqiRes.appendVP ;
  in module ConstructionSqi with
    oper addPost = \vp,x -> ...
  in module VerbSqi
```

All 45 other automatically discovered modules compile, including:

- `ConstructionSqi`
- `LexiconSqi`
- `ExtendSqiRNP`
- `ExtendSqiVPBridge`
- `ExtendSqi`
- `ExtraSqi`
- the full verbal/morphological core.

Therefore ALB-DEC-048's three repairs are compiler-confirmed individually. The remaining automatic-scan blocker is a **module-composition namespace collision**, not a PMCFG or Albanian morphology regression.

## 3. PMCFG architecture status

ALB-DEC-047 remains compiler-confirmed.

Across runs `20260921_212128` and `20260921_213424`:

- no `GeneratePMCFG` crash remains;
- no `CProj "cl"` trace remains;
- no `CProj "Indicative" (CProj "v" ...)` trace remains;
- `MorphoSqi`, `ParadigmsSqi`, `IrregSqi`, `VerbSqi`, `SentenceSqi`,
  `QuestionSqi`, `RelativeSqi`, `IdiomSqi`, and `ConstructionSqi` compile.

Normative representation invariant:

```text
morphology owns mood/form distinctions
→ VP/VPSlash carry structured tables needed by syntax
→ syntax selects forms
→ syntax does not infer grammatical distinctions from realized strings
```

Do not reopen this architecture unless new compiler or linguistic evidence points back to it.

## 4. Current direct repair — ALB-DEC-049

`ConstructionSqi` declared local helpers named `baseVP` and `addPost`.
`VerbSqi`, already present through `GrammarSqi`, exports helpers with the same names.

`addPost` is the first collision GF reports when `LangSqi` merges:

```text
GrammarSqi,
LexiconSqi,
ConstructionSqi,
DocumentationSqi
```

The current working source therefore renames the Construction-only helpers:

```text
baseVP  → constructionBaseVP
addPost → constructionAddPost
```

and updates all local uses in `ConstructionSqi`.

The rename is deliberately broader than the first emitted error: a static namespace audit shows that after these two renames there are no remaining top-level `oper` name collisions between `ConstructionSqi` and the modules already composed into `GrammarSqi`.

This is a namespace repair only. It does not change Albanian surface realization or category structure.

## 5. Static/source preflight

Current working source after ALB-DEC-049:

- `.gf` files in complete current census: **52**
- malformed single-backslash table abstractions: none known
- `[] =>` used as a `Str` pattern: none known
- `gf_morphosqi_lint.py`: **0 findings**
- duplicated Construction-vs-Grammar top-level helper names after the rename: **0**

Static checks are not a substitute for GF compiler acceptance.

## 6. Complete compiler census still required

The language folder contains 48 `.gf` files, but Wordbench Global Scan currently discovers only 47. It still omits:

```text
AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPS.gf
```

The four public facades in the parent `src` directory are also outside the automatic 47-target scan:

```text
AlbanianSQI/GF/lib/src/SyntaxSqi.gf
AlbanianSQI/GF/lib/src/ConstructorsSqi.gf
AlbanianSQI/GF/lib/src/SymbolicSqi.gf
AlbanianSQI/GF/lib/src/TrySqi.gf
```

Required complete compiler census: **52 GF files**.

A green `47/47` automatic scan is necessary but not sufficient; the five omitted targets must also be compiled and recorded.

## 7. Current work order

1. rerun GF 3.12 after ALB-DEC-049 and confirm `LangSqi` / `AllSqi` clear;
2. establish a green **47/47** automatic Global Scan;
3. compile the five omitted targets explicitly (or fix Wordbench discovery) to establish **52/52**;
4. only after the 52-file compiler gate is green, run Albanian behavioral scenarios/goldens;
5. then resume capability/completion expansion.

Do not treat importer failures as independent root causes when stderr identifies a shared dependency or merge conflict.

## 8. Historical progression

| Snapshot/run | Evidence |
|---|---|
| FIX22C | historical compiler-stable core baseline |
| early post-mega scan | 5 PASS / 42 FAIL; syntax corruption/root parse blocker |
| candidate (9/10 era) | syntax repaired; type/PMCFG defects exposed |
| run `20260921_201720` | 27 PASS / 20 FAIL; nested `VP.v.Indicative` root identified |
| ALB-DEC-047 | explicit `Verb.Subjunctive` and structured Verb→VP boundary |
| run `20260921_212128` | 40 PASS / 7 FAIL; no PMCFG crash; ALB-DEC-047 confirmed |
| ALB-DEC-048 | Prelude visibility + typed `distance_N3` prepositions |
| run `20260921_213424` | **45 PASS / 2 FAIL; ALB-DEC-048 fixes compile; final blocker is `LangSqi` helper-name collision** |
| current ALB-DEC-049 working source | Construction helper namespace isolated; pending GF rerun |

## 9. Documentation synchronization rule

After each evidence-changing run update, update at minimum:

- this file;
- `ALBANIAN_DECISION_LOG.md`;
- `ALBANIAN_OPEN_QUESTIONS.md`;
- `status/ALBANIAN_IMPLEMENTATION_STATUS.md`;
- `DOCUMENTATION_SYNC_20260921.md`;
- symbol/test ledgers when their specific evidence changes.
