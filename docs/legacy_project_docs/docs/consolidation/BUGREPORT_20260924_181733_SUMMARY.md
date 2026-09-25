# GF Wordbench Audit Summary

## Run Summary

| Field | Value |
|---|---|
| Run ID | `20260924_181733` |
| GF Wordbench | `1.3.3` |
| Project | `albanian-rgl-linguistic` — Albanian RGL Linguistic Campaign 500 |
| Language code | `albanian` |
| Mode | `diagnostic` |
| Target | `Unknown` |
| Started | `2026-09-24T18:17:33.999051Z` |
| Finished | `2026-09-24T18:18:48.069603Z` |
| Duration | 74.070 s |
| GF version | `3.12` |
| Run directory | `C:/mycode/Grammatical_Framework/GF_Wordbench/GF_Wordbench/.wordbench-runs/run_20260924_181733` |
| Strict mode | Yes |
| GF executable | `C:/mycode/Grammatical_Framework/gf-3.12-windows/gf.exe` |
| RGL root | `C:/mycode/Grammatical_Framework/gf-rgl` |
| Output root | `C:/mycode/Grammatical_Framework/GF_Wordbench/GF_Wordbench/.wordbench-runs` |
| Project schema | `1.0` |
| Summary soft schema | `1.0` |

## Outcome

**Overall status: `FAIL`**

Required validation completed, but one or more checks failed.

| Measure | Count |
|---|---:|
| Files included | 54 |
| Files OK | 50 |
| Files failed | 4 |
| Files errored | 0 |
| Files skipped | 0 |
| Direct failures | 1 |
| Downstream failures | 3 |
| Ambiguous failures | 0 |
| Scenarios seen | 50 |
| Scenarios OK | 0 |
| Scenarios failed | 50 |
| Scenarios errored | 0 |
| Scenarios skipped | 0 |

### Main Blockers

- `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf` — `TYPE`: `constant not found: Dat`

## RGL Certification (Compendium)

| Field | Value |
|---|---|
| Protocol | `TEST_RGL` |
| Source lock SHA-256 | `24ec08e102cbc8a66683a1d3031527a71c71452d1e5a9d1e55d5d45788c27536` |
| Structural compile census | `NOT PASSING` |
| Complete GF target census | `54 = 49 language + 5/5 API facades` |
| Evidence-derived state floor | `S01 SOURCE_LOCKED` |
| Linguistic scenario evidence | `BLOCKED` |
| Reviewable scenarios | `0/50` |
| Linguistic certification | `NOT ESTABLISHED` |

Compilation establishes structural consistency only. Reviewed scenario/golden evidence is still required for linguistic correctness and release maturity. BLOCKED means scenarios were attempted but none produced reviewable normalized output.

## Compiler Warnings

| Measure | Count |
|---|---|
| Total compiler warnings | 2135 |
| Structural lock warnings | 0 |
| Unique structural lock sites | 0 |
| Namespace-conflict warnings | 2135 |
| Other warnings | 0 |

Namespace-conflict warnings are reported as compiler hygiene evidence but do not fail Strict mode. Structural lock warnings are blocking in Strict mode.

## File Results

### Direct Failures

#### `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf`

- Module: `LexiconSqi`
- Status: `FAIL`
- Error kind: `TYPE`
- First error: `constant not found: Dat`
- Duration: 0.913 s
- Timed out: No
- Evidence:
  - [stdout](raw/compile/albanian_LexiconSqi.out.txt)
  - [stderr](raw/compile/albanian_LexiconSqi.err.txt)
  - [scan](raw/scan/albanian_LexiconSqi.scan.txt)

### Downstream Failures

#### `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/AllSqi.gf`

- Status: `FAIL`
- Blocked by:
  - `LexiconSqi`
- First error: `constant not found: Dat`
- Evidence:
  - [stdout](raw/compile/albanian_AllSqi.out.txt)
  - [stderr](raw/compile/albanian_AllSqi.err.txt)
  - [scan](raw/scan/albanian_AllSqi.scan.txt)

#### `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/LangSqi.gf`

- Status: `FAIL`
- Blocked by:
  - `LexiconSqi`
- First error: `constant not found: Dat`
- Evidence:
  - [stdout](raw/compile/albanian_LangSqi.out.txt)
  - [stderr](raw/compile/albanian_LangSqi.err.txt)
  - [scan](raw/scan/albanian_LangSqi.scan.txt)

#### `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/TrySqi.gf`

- Status: `FAIL`
- Blocked by:
  - `LexiconSqi`
- First error: `constant not found: Dat`
- Evidence:
  - [stdout](raw/compile/TrySqi.out.txt)
  - [stderr](raw/compile/TrySqi.err.txt)
  - [scan](raw/scan/TrySqi.scan.txt)

### Successful Files

| File | Module | Duration | Scan hits |
|---|---|---:|---:|
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/AdjectiveSqi.gf` | `AdjectiveSqi` | 0.158 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/AdverbSqi.gf` | `AdverbSqi` | 0.159 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/AllSqiAbs.gf` | `AllSqiAbs` | 0.359 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/CatSqi.gf` | `CatSqi` | 0.157 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ClauseSqiRes.gf` | `ClauseSqiRes` | 0.160 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ConjunctionSqi.gf` | `ConjunctionSqi` | 0.158 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ConstructionSqi.gf` | `ConstructionSqi` | 1.064 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/DocumentationSqi.gf` | `DocumentationSqi` | 0.414 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqi.gf` | `ExtendSqi` | 2.374 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiAPCN.gf` | `ExtendSqiAPCN` | 1.466 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiExistential.gf` | `ExtendSqiExistential` | 1.314 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiFocusPrep.gf` | `ExtendSqiFocusPrep` | 1.316 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiHelpers.gf` | `ExtendSqiHelpers` | 1.417 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiLexicon.gf` | `ExtendSqiLexicon` | 1.416 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiRNP.gf` | `ExtendSqiRNP` | 1.418 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiScaffolding.gf` | `ExtendSqiScaffolding` | 1.314 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPBridge.gf` | `ExtendSqiVPBridge` | 1.366 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPS.gf` | `ExtendSqiVPS` | 1.315 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtraSqi.gf` | `ExtraSqi` | 1.566 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ExtraSqiAbs.gf` | `ExtraSqiAbs` | 0.108 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/GrammarSqi.gf` | `GrammarSqi` | 1.519 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/IdiomSqi.gf` | `IdiomSqi` | 0.913 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/IrregSqi.gf` | `IrregSqi` | 0.862 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/IrregSqiAbs.gf` | `IrregSqiAbs` | 0.107 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/MarkupSqi.gf` | `MarkupSqi` | 0.158 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf` | `MorphoSqi` | 1.015 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/NamesSqi.gf` | `NamesSqi` | 0.158 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/NounSqi.gf` | `NounSqi` | 0.862 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/NumeralSqi.gf` | `NumeralSqi` | 0.159 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf` | `ParadigmsSqi` | 0.912 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/PhraseSqi.gf` | `PhraseSqi` | 0.158 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/QuestionSqi.gf` | `QuestionSqi` | 1.014 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/RelativeSqi.gf` | `RelativeSqi` | 0.158 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/ResSqi.gf` | `ResSqi` | 0.108 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/SentenceSqi.gf` | `SentenceSqi` | 0.160 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/StructuralSqi.gf` | `StructuralSqi` | 0.913 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/StructuralSqiClause.gf` | `StructuralSqiClause` | 0.913 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/StructuralSqiNominal.gf` | `StructuralSqiNominal` | 0.865 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/StructuralSqiRes.gf` | `StructuralSqiRes` | 0.157 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/StructuralSqiVerbal.gf` | `StructuralSqiVerbal` | 0.862 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/SymbolSqi.gf` | `SymbolSqi` | 1.015 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/TenseSqi.gf` | `TenseSqi` | 0.109 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/TestAbs.gf` | `TestAbs` | 0.058 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/TestSqi.gf` | `TestSqi` | 0.913 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/TextSqi.gf` | `TextSqi` | 0.209 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/albanian/VerbSqi.gf` | `VerbSqi` | 1.115 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/CombinatorsSqi.gf` | `CombinatorsSqi` | 1.566 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/ConstructorsSqi.gf` | `ConstructorsSqi` | 1.668 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/SymbolicSqi.gf` | `SymbolicSqi` | 2.175 s | 0 |
| `C:/mycode/Grammatical_Framework/Grammatical_Framework-Albanian/AlbanianSQI/GF/lib/src/SyntaxSqi.gf` | `SyntaxSqi` | 1.769 s | 0 |

## Scenario Results

| Scenario | Required | Status | Execution | Gold | Duration |
|---|:---:|---|---|---|---:|
| `alb-noun-01` | Yes | `FAIL` | `completed` | — | 0.211 s |
| `alb-noun-02` | Yes | `FAIL` | `completed` | — | 0.259 s |
| `alb-noun-03` | Yes | `FAIL` | `completed` | — | 0.259 s |
| `alb-noun-04` | Yes | `FAIL` | `completed` | — | 0.209 s |
| `alb-noun-05` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-noun-06` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-noun-07` | Yes | `FAIL` | `completed` | — | 0.261 s |
| `alb-noun-08` | Yes | `FAIL` | `completed` | — | 0.259 s |
| `alb-noun-09` | Yes | `FAIL` | `completed` | — | 0.261 s |
| `alb-noun-10` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-verb-01` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-verb-02` | Yes | `FAIL` | `completed` | — | 0.262 s |
| `alb-verb-03` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-verb-04` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-verb-05` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-verb-06` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-verb-07` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-verb-08` | Yes | `FAIL` | `completed` | — | 0.219 s |
| `alb-verb-09` | Yes | `FAIL` | `completed` | — | 0.210 s |
| `alb-verb-10` | Yes | `FAIL` | `completed` | — | 0.269 s |
| `alb-adj-01` | Yes | `FAIL` | `completed` | — | 0.209 s |
| `alb-adj-02` | Yes | `FAIL` | `completed` | — | 0.209 s |
| `alb-adj-03` | Yes | `FAIL` | `completed` | — | 0.209 s |
| `alb-adj-04` | Yes | `FAIL` | `completed` | — | 0.270 s |
| `alb-adj-05` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-syntax-basic` | Yes | `FAIL` | `completed` | — | 0.209 s |
| `alb-syntax-v2` | Yes | `FAIL` | `completed` | — | 0.259 s |
| `alb-syntax-v3` | Yes | `FAIL` | `completed` | — | 0.270 s |
| `alb-syntax-complements-a` | Yes | `FAIL` | `completed` | — | 0.209 s |
| `alb-syntax-complements-b` | Yes | `FAIL` | `completed` | — | 0.210 s |
| `alb-syntax-copular` | Yes | `FAIL` | `completed` | — | 0.311 s |
| `alb-syntax-adverbial` | Yes | `FAIL` | `completed` | — | 0.311 s |
| `alb-syntax-coordination` | Yes | `FAIL` | `completed` | — | 0.259 s |
| `alb-clitic-objects` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-clitic-negative` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-clitic-ditransitive` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-clitic-vp` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-complement-control` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-question-yesno` | Yes | `FAIL` | `completed` | — | 0.259 s |
| `alb-question-wh` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-relative-subject` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-relative-object` | Yes | `FAIL` | `completed` | — | 0.311 s |
| `alb-subordination` | Yes | `FAIL` | `completed` | — | 0.261 s |
| `alb-names-preps` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-numerals` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-construction-01` | Yes | `FAIL` | `completed` | — | 0.261 s |
| `alb-construction-02` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-cross-01` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-cross-02` | Yes | `FAIL` | `completed` | — | 0.260 s |
| `alb-cross-03` | Yes | `FAIL` | `completed` | — | 0.259 s |

### Failed Scenarios

#### `alb-noun-01`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-01.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-01.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-01.stderr.txt)

#### `alb-noun-02`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-02.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-02.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-02.stderr.txt)

#### `alb-noun-03`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-03.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-03.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-03.stderr.txt)

#### `alb-noun-04`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-04.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-04.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-04.stderr.txt)

#### `alb-noun-05`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-05.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-05.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-05.stderr.txt)

#### `alb-noun-06`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-06.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-06.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-06.stderr.txt)

#### `alb-noun-07`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-07.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-07.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-07.stderr.txt)

#### `alb-noun-08`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-08.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-08.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-08.stderr.txt)

#### `alb-noun-09`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-09.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-09.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-09.stderr.txt)

#### `alb-noun-10`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-noun-10.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-noun-10.stdout.txt)
  - [stderr](raw/scenarios/alb-noun-10.stderr.txt)

#### `alb-verb-01`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-01.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-01.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-01.stderr.txt)

#### `alb-verb-02`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-02.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-02.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-02.stderr.txt)

#### `alb-verb-03`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-03.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-03.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-03.stderr.txt)

#### `alb-verb-04`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-04.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-04.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-04.stderr.txt)

#### `alb-verb-05`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-05.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-05.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-05.stderr.txt)

#### `alb-verb-06`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-06.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-06.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-06.stderr.txt)

#### `alb-verb-07`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-07.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-07.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-07.stderr.txt)

#### `alb-verb-08`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-08.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-08.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-08.stderr.txt)

#### `alb-verb-09`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-09.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-09.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-09.stderr.txt)

#### `alb-verb-10`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-verb-10.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-verb-10.stdout.txt)
  - [stderr](raw/scenarios/alb-verb-10.stderr.txt)

#### `alb-adj-01`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-adj-01.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-adj-01.stdout.txt)
  - [stderr](raw/scenarios/alb-adj-01.stderr.txt)

#### `alb-adj-02`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-adj-02.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-adj-02.stdout.txt)
  - [stderr](raw/scenarios/alb-adj-02.stderr.txt)

#### `alb-adj-03`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-adj-03.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-adj-03.stdout.txt)
  - [stderr](raw/scenarios/alb-adj-03.stderr.txt)

#### `alb-adj-04`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-adj-04.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-adj-04.stdout.txt)
  - [stderr](raw/scenarios/alb-adj-04.stderr.txt)

#### `alb-adj-05`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-adj-05.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-adj-05.stdout.txt)
  - [stderr](raw/scenarios/alb-adj-05.stderr.txt)

#### `alb-syntax-basic`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-basic.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-basic.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-basic.stderr.txt)

#### `alb-syntax-v2`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-v2.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-v2.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-v2.stderr.txt)

#### `alb-syntax-v3`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-v3.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-v3.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-v3.stderr.txt)

#### `alb-syntax-complements-a`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-complements-a.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-complements-a.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-complements-a.stderr.txt)

#### `alb-syntax-complements-b`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-complements-b.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-complements-b.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-complements-b.stderr.txt)

#### `alb-syntax-copular`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-copular.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-copular.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-copular.stderr.txt)

#### `alb-syntax-adverbial`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-adverbial.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-adverbial.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-adverbial.stderr.txt)

#### `alb-syntax-coordination`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-syntax-coordination.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-syntax-coordination.stdout.txt)
  - [stderr](raw/scenarios/alb-syntax-coordination.stderr.txt)

#### `alb-clitic-objects`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-clitic-objects.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-clitic-objects.stdout.txt)
  - [stderr](raw/scenarios/alb-clitic-objects.stderr.txt)

#### `alb-clitic-negative`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-clitic-negative.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-clitic-negative.stdout.txt)
  - [stderr](raw/scenarios/alb-clitic-negative.stderr.txt)

#### `alb-clitic-ditransitive`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-clitic-ditransitive.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-clitic-ditransitive.stdout.txt)
  - [stderr](raw/scenarios/alb-clitic-ditransitive.stderr.txt)

#### `alb-clitic-vp`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-clitic-vp.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-clitic-vp.stdout.txt)
  - [stderr](raw/scenarios/alb-clitic-vp.stderr.txt)

#### `alb-complement-control`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-complement-control.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-complement-control.stdout.txt)
  - [stderr](raw/scenarios/alb-complement-control.stderr.txt)

#### `alb-question-yesno`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-question-yesno.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-question-yesno.stdout.txt)
  - [stderr](raw/scenarios/alb-question-yesno.stderr.txt)

#### `alb-question-wh`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-question-wh.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-question-wh.stdout.txt)
  - [stderr](raw/scenarios/alb-question-wh.stderr.txt)

#### `alb-relative-subject`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-relative-subject.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-relative-subject.stdout.txt)
  - [stderr](raw/scenarios/alb-relative-subject.stderr.txt)

#### `alb-relative-object`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-relative-object.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-relative-object.stdout.txt)
  - [stderr](raw/scenarios/alb-relative-object.stderr.txt)

#### `alb-subordination`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-subordination.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-subordination.stdout.txt)
  - [stderr](raw/scenarios/alb-subordination.stderr.txt)

#### `alb-names-preps`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-names-preps.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-names-preps.stdout.txt)
  - [stderr](raw/scenarios/alb-names-preps.stderr.txt)

#### `alb-numerals`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-numerals.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-numerals.stdout.txt)
  - [stderr](raw/scenarios/alb-numerals.stderr.txt)

#### `alb-construction-01`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-construction-01.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-construction-01.stdout.txt)
  - [stderr](raw/scenarios/alb-construction-01.stderr.txt)

#### `alb-construction-02`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-construction-02.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-construction-02.stdout.txt)
  - [stderr](raw/scenarios/alb-construction-02.stderr.txt)

#### `alb-cross-01`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-cross-01.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-cross-01.stdout.txt)
  - [stderr](raw/scenarios/alb-cross-01.stderr.txt)

#### `alb-cross-02`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-cross-02.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-cross-02.stdout.txt)
  - [stderr](raw/scenarios/alb-cross-02.stderr.txt)

#### `alb-cross-03`

- Required: Yes
- Status: `FAIL`
- Diagnostic class: `downstream`
- Error kind: `SCRIPT`
- Message: GF shell reported an execution error: constant not found: Dat
- Gold: —
- Script: `validation/scenarios/alb-cross-03.gfs`
- Blocked by:
  - `LexiconSqi`
- Evidence:
  - [stdout](raw/scenarios/alb-cross-03.stdout.txt)
  - [stderr](raw/scenarios/alb-cross-03.stderr.txt)

## Top Errors

| Count | Kind | Message |
|---:|---|---|
| 1 | `TYPE` | `constant not found: Dat` |

## Regression Comparison

No compatible baseline was available.

## Artifacts

| Role | Path |
|---|---|
| Machine summary | [summary.json](summary.json) |
| Human summary | `summary.md` |
| AI packet | [AI_READY.md](AI_READY.md) |
| Manifest | [manifest.json](manifest.json) |
| Top errors | [top_errors.txt](top_errors.txt) |
| Master log | [raw/master.log](raw/master.log) |
| Aggregate scan log | [raw/ALL_SCAN_LOGS.TXT](raw/ALL_SCAN_LOGS.TXT) |
| Aggregate execution log | [raw/ALL_LOGS.TXT](raw/ALL_LOGS.TXT) |
| Details | [details](details) |
| Raw evidence | [raw](raw) |
| Compile logs | [raw/compile](raw/compile) |
| Scan logs | [raw/scan](raw/scan) |
| Scenario logs | [raw/scenarios](raw/scenarios) |
| GFO artifacts | [artifacts/gfo](artifacts/gfo) |
| Output artifacts | [artifacts/out](artifacts/out) |
| PGF artifacts | [artifacts/pgf](artifacts/pgf) |
