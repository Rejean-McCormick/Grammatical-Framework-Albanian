# C8 static validation report — 2026-09-25

## Scope
Static validation of the Conversation 8 final implementation candidate. This is not GF 3.12 compiler certification or linguistic gold certification.

## Diff summary
- Changed/new files relative to supplied Albanian snapshot: **21**.
- Production `.gf` files changed: **20**.
- Baseline scenarios are intentionally unchanged.

### Changed files
- `AlbanianSQI/GF/lib/src/albanian/CatSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/ClauseSqiRes.gf`
- `AlbanianSQI/GF/lib/src/albanian/ConjunctionSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/ConstructionSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/ExtendSqiFocusPrep.gf`
- `AlbanianSQI/GF/lib/src/albanian/ExtendSqiRNP.gf`
- `AlbanianSQI/GF/lib/src/albanian/ExtendSqiScaffolding.gf`
- `AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPBridge.gf`
- `AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPS.gf`
- `AlbanianSQI/GF/lib/src/albanian/IdiomSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/NounSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/QuestionSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/RelativeSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/ResSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/SentenceSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/StructuralSqiNominal.gf`
- `AlbanianSQI/GF/lib/src/albanian/SymbolSqi.gf`
- `AlbanianSQI/GF/lib/src/albanian/VerbSqi.gf`
- `docs/conversation8/C8_FINAL_IMPLEMENTATION_20260925.md`

## Checks
- PASS: 52 baseline scenarios present — 52
- PASS: 52 baseline scenarios byte-identical
- PASS: 51 language-folder GF files present — 51
- PASS: 5 API facades present — 5
- PASS: 2 MorphoDict GF files present — 2
- PASS: VPSlash gapPost contract
- PASS: VS/V2S lexical scomp contract
- PASS: object-control V2V realization
- PASS: V2A object agreement accusative
- PASS: coordinated NP agreement helper
- PASS: existential 3sg helper
- PASS: progressive VP copular helper
- PASS: VerbSqi.gf:23 VPSlash initializes gapPost
- PASS: VerbSqi.gf:195 VPSlash initializes gapPost
- PASS: VerbSqi.gf:215 VPSlash initializes gapPost
- PASS: VerbSqi.gf:231 VPSlash initializes gapPost

## Additional static validators
- DictSqi static validator: PASS.
- MorphoDictSqi static validator: PASS.
- Combined Dict + MorphoDict validator: PASS.
- MorphoSqi heuristic lint: 0 findings.

## External gates still required
- Fresh GF 3.12 compile / Wordbench Global Scan: expected 58/58.
- Fresh execution of the existing 52 scenarios: expected 52/52.
- C8 linguistic review and promotion of accepted outputs to golds.
- `ProgrVPSlash` remains an explicit cross-workstream limitation: unresolved-object progressive currently keeps `po + finite V` to preserve clitic placement; a fully unified `jam + duke` slash representation requires a richer clitic-site contract.
- Secondary-predicate accusative agreement and lexical `që`/`se` selection require entry-by-entry linguistic review.

Overall static result: **PASS**.
