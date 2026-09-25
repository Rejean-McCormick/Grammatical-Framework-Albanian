# FINAL STATIC AUDIT — Conversation 6 nominal system

Date: 2026-09-25
Baseline commit: `963b925`

## Executed checks

```text
PASS five grammatical cases including Gen
PASS four morphological noun cases
PASS Gen maps to MDat only at morphology boundary
PASS Noun stores MorphCase and number-sensitive gender
PASS CN carries grammatical Case
PASS CatSqi CN uses grammatical CNoun
PASS Adj lexical table is Gender x Number with typed class
PASS typed articulated/unarticulated adjective class
PASS single typed nyje service
PASS legacy GenNum/GSg/GPl removed
PASS legacy adjective .clit flag removed
PASS PossNP selects grammatical Gen on possessor
PASS public ambigeneric noun constructors
PASS PN API exposes five-case explicit constructor
PASS LN API exposes five-case explicit constructor
PASS GN API exposes five-case explicit constructor
PASS proximal demonstrative accusative plurals match supplied Lesson 30
PASS 1SG feminine possessive matches supplied table
PASS 2SG masculine possessive matches supplied table
PASS unresolved agreement fallbacks are centralized and named
PASS no NumeralGov invented without Albanian minimal pairs
PASS compound lexical N remains in MorphCase space
PASS documentation handles number-sensitive noun gender
PASS noun documentation table spans all five grammatical cases
PASS language target census remains 51 (got 51)
PASS API facade census remains 5 (got 5)
PASS MorphoDict target census remains 2 (got 2)
PASS scenario census remains 52 (got 52)
PASS all embedded Wordbench input hashes are current
PASS all scenario linearization symbols exist in abstract and concrete inputs

PASS nominal architecture guardrails
PASS entry count
PASS unique abstract IDs
PASS abstract/concrete inventory
PASS balanced braces
PASS no MorphoDict module
PASS baseline preservation recorded
PASS legacy suffix types normalized
PASS unreviewed imports use lock-safe placeholders
PASS abstract funcs unique 592
PASS concrete lin coverage fun=592 lin=592
PASS no variants keyword 
PASS coverage entry count 592
PASS all 22 IrregSqi verbs included 
PASS Tosk reference represented 242
PASS cilido explicit declined derivation 
PASS Prelude boolean scope 
PASS Tosk smart entries compile-safe {'exact': 367, 'compile-safe-placeholder': 155, 'rgl-derived-explicit': 1, 'exact-normalized': 10, 'direct-invariant': 23, 'rgl+reference-characteristic': 11, 'direct-with-government': 3, 'exact-irregular': 22}
PASS lock-safe placeholder constructors 
PASS entry count substantial 592
PASS exists AlbanianSQI/GF/lib/src/albanian/DictSqiAbs.gf
PASS exists AlbanianSQI/GF/lib/src/albanian/DictSqi.gf
PASS exists AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf
PASS exists AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf
PASS unified DictSqi + MorphoDictSqi static validation
PASS abstract funcs unique 592
PASS concrete lin coverage fun=592 lin=592
PASS no variants keyword 
PASS coverage entry count 592
PASS all 22 IrregSqi verbs included 
PASS Tosk reference represented 242
PASS cilido explicit declined derivation 
PASS Prelude boolean scope 
PASS Tosk smart entries compile-safe {'exact': 367, 'compile-safe-placeholder': 155, 'rgl-derived-explicit': 1, 'exact-normalized': 10, 'direct-invariant': 23, 'rgl+reference-characteristic': 11, 'direct-with-government': 3, 'exact-irregular': 22}
PASS lock-safe placeholder constructors 
PASS entry count substantial 592
== MorphoSqi lint ==
Findings: 0

No issues found by this heuristic lint.
PASS no obvious 4-case grammatical enumerations without Gen
PASS GF delimiter heuristic across 51 language modules
```

## Result

**PASS — all checks available in this environment are green.**

These checks establish source/repository consistency only. They do not establish GF compilation, scenario execution, or linguistic certification.

## Toolchain limitation

`gf` and GF Wordbench executables are not present in the current execution environment. Under the canonical development state model this delivery therefore cannot claim W05/W06/W07 or S09+.

## Required external closeout

- GF 3.12 strict compile: 58/58 targets.
- Wordbench 1.3.4: 52/52 scenarios.
- zero lock warnings.
- no gold regressions.
- targeted linguistic review for newly exercised nominal cells.
