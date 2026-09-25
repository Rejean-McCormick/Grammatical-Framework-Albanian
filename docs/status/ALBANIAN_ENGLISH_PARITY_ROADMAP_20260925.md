# Albanian RGL — English Parity Roadmap and Workstream Registry

**Status date:** 2026-09-25  
**Project:** `Grammatical_Framework-Albanian`  
**Target:** bring the Albanian RGL as close as practical to the maturity, coverage, maintainability, and lexical depth of the English RGL, while preserving Albanian-specific linguistic structure.  
**Role of this document:** authoritative coordination/status file for parallel development branches and merge gates.

---

## 1. Current baseline

The current Albanian baseline is structurally green under GF Wordbench.

| Measure | Current baseline |
|---|---:|
| GF | `3.12` |
| GF Wordbench | `1.3.4` |
| Wordbench run | `20260925_112639` |
| Overall status | `OK` |
| GF files included | `58` |
| GF files OK | `58/58` |
| Direct failures | `0` |
| Downstream failures | `0` |
| Required scenarios | `52` |
| Scenarios OK | `52/52` |
| Structural lock warnings | `0` |
| Complete GF target census | `58 = 51 language + 5/5 API facades + 2/2 MorphoDict` |
| Evidence-derived state floor | `S02_BASELINE_ESTABLISHED` |
| Linguistic certification | `NOT ESTABLISHED` |
| Reviewable generated CASEs | `569` |
| Gold corpus | not yet established |

**Source-lock SHA-256:** `6834fc8975ce82a6c4984280bff1000dae644f134fec457996abb9f25888ef37`

This baseline is the integration floor. No workstream may be merged if it regresses the compile census, required scenarios, or previously accepted gold evidence.

---

## 2. English comparison baseline

Reference repository: `GrammaticalFramework/gf-rgl`  
Reference branch: `master`  
Reference commit at status creation: `bfc0a89f9912e5db7567c955e0114437643c6eeb`

Measured from the current English RGL sources:

| Area | Albanian | English reference | Gap / interpretation |
|---|---:|---:|---|
| `Dict*Abs` functions | `6,720` | `64,931` | English is ~9.7× larger |
| `MorphoDict*Abs` lemgrams | `592` | `56,577` | English is ~95.6× larger |
| Dict concrete size | ~0.23 MB | ~2.99 MB | large lexical-depth gap |
| MorphoDict concrete size | ~0.02 MB | ~2.82 MB | very large morphological-dictionary gap |
| `Paradigms` source | ~54 KB | ~26 KB | Albanian already has substantial morphological machinery |
| `Extend` source | ~15.6 KB | ~17.5 KB | similar order of magnitude, not yet equivalent in coverage |
| Structural compilation | `58/58` | mature RGL baseline | structural integration gap largely closed |
| Linguistic gold certification | not established | mature long-lived implementation | major remaining quality gap |

The goal is **not** to copy English analyses where Albanian differs linguistically. English is the maturity/coverage benchmark; typologically closer RGL languages should be used when they provide better structural models.

---

## 3. Strategic principle

Development is split into specialized workstreams. Every workstream starts from this green baseline and must produce:

1. source changes isolated to its declared ownership area;
2. tests/scenarios or morphological evidence appropriate to the change;
3. provenance for lexical data;
4. documentation of representation decisions;
5. a Wordbench-compatible merge artifact or clean commit series;
6. no regression of the integration floor.

The master/integration branch does not invent new linguistic analyses. It merges validated work from specialist branches and maintains the source lock, status ledger, and release gates.

---

## 4. Workstream registry

### WS01 — DictSqi MAX / syntactic lexicon

**Suggested Git branch:** `feat/sqi-dict-max`  
**Primary ownership:** `DictSqi.gf`, `DictSqiAbs.gf`, dictionary resources/generator/provenance.  
**Goal:** grow from 6,720 entries toward English-scale lexical coverage while replacing compile-safe placeholders with linguistically typed entries.

Priority categories include `N`, `N2`, `N3`, `A`, `A2`, `Adv`, `V`, `V2`, `V3`, `VA`, `VS`, `VQ`, `VV`, `V2A`, `V2S`, `V2Q`, `V2V`, structural categories, multiword lexical units where justified, and proper names.

**Definition of done:** every imported entry has explicit provenance/review status; nontrivial verb valency is represented; placeholders are measurable and continuously reduced; generator rebuilds are reproducible.

### WS02 — MorphoDictSqi MAX / morphological lexicon

**Suggested Git branch:** `feat/sqi-morphodict-max`  
**Primary ownership:** `src/morphodict/MorphoDictSqi*`, MorphoDict resources and coverage manifests.  
**Goal:** grow from 592 lemgrams toward large-scale national lexical coverage, following the RGL MorphoDict principle of one source per lemgram.

**Definition of done:** no unmarked compile-safe placeholders; inflectional alternatives are represented as distinct lemgrams; no sense duplication; no `variants` used as a substitute for analysis; provenance is retained.

### WS03 — ParadigmsSqi MAX

**Suggested Git branch:** `feat/sqi-paradigms-max`  
**Primary ownership:** `ParadigmsSqi.gf` and dedicated paradigm tests.  
**Goal:** make productive Albanian inflection classes first-class constructors so Dict/MorphoDict do not need ad-hoc records.

**Definition of done:** major noun/adjective/verb classes have stable constructors, documented principal parts, and exhaustive representative tests.

### WS04 — nominal morphology

**Suggested Git branch:** `feat/sqi-nominal-morphology`  
**Goal:** stabilize number, gender, definiteness, case, agreement, ambigeneric nouns, adjective agreement, and relative/interrogative nominal morphology.

Includes controlled reconsideration of DRAFT-MAX ideas such as explicit Genitive and number-sensitive gender, but only through compile-certified incremental changes.

### WS05 — verbal system MAX

**Suggested Git branch:** `feat/sqi-verbal-system`  
**Goal:** complete verb classes, principal parts, tense/mood forms, participles, imperatives, subjunctive forms, active/non-active morphology, irregulars, and auxiliary selection.

### WS06 — clitic system MAX

**Suggested Git branch:** `feat/sqi-clitics`  
**Goal:** replace flat/ad-hoc clitic strings with an explicit cluster representation covering accusative/dative combinations, fusion, ordering, negation, imperative/subjunctive placement, and `të` interactions.

### WS07 — voice / non-active / passive / reflexive

**Suggested Git branch:** `feat/sqi-voice`  
**Goal:** distinguish active, Albanian non-active, analytical passive, reflexive/reciprocal uses, agent realization, auxiliary choice, and `u` constructions.

### WS08 — tense / aspect / mood / auxiliaries

**Suggested Git branch:** `feat/sqi-tam`  
**Goal:** formalize legal combinations of tense, aspect, mood, polarity, voice, future particles and progressivity. Eliminate impossible combinations by representation rather than post-hoc string fixes.

### WS09 — valency and complements

**Suggested Git branch:** `feat/sqi-valency`  
**Goal:** mature the `V/V2/V3/VA/VS/VQ/VV/V2A/V2S/V2Q/V2V` system, governed prepositions, object cases, control/raising, and clausal complements.

This workstream defines the contracts that WS01 must use for large-scale verb lexicography.

### WS10 — nominal syntax / relatives / coordination

**Suggested Git branch:** `feat/sqi-nominal-syntax`  
**Goal:** mature `NP`, `CN`, `AP`, `Det`, `Quant`, pronouns, possession, relative clauses, overt `cili` paradigms, and agreement in coordination.

### WS11 — sentence syntax MAX

**Suggested Git branch:** `feat/sqi-sentence-syntax`  
**Goal:** main clauses, questions, subordination, word order, negation, focus, topicalization, existential/copular clauses, secondary predication, and construction-level correctness.

### WS12 — StructuralSqi completeness

**Suggested Git branch:** `feat/sqi-structural-max`  
**Goal:** certify articles, determiners, pronouns, quantifiers, prepositions, conjunctions, subordinators, interrogatives, relatives and structural adverbs.

### WS13 — ExtendSqi / ExtraSqi parity

**Suggested Git branch:** `feat/sqi-extend-extra-max`  
**Goal:** build a function-by-function coverage matrix against English `Extend/Extra`, implement Albanian equivalents where linguistically meaningful, and mark genuine N/A cases explicitly.

### WS14 — IrregSqi MAX

**Suggested Git branch:** `feat/sqi-irreg-max`  
**Goal:** exhaustive, sourced inventory of genuinely irregular Albanian paradigms and principal parts. Irregulars must not silently fall through generic smart paradigms.

### WS15 — gold corpus / linguistic certification

**Suggested Git branch:** `test/sqi-gold-certification`  
**Goal:** review the current 569 CASEs, assign `valid / valid_variant / questionable / invalid`, fix the grammar by linguistic family, and promote only confirmed outputs to gold.

Milestones:
- G1: 569 reviewed CASEs;
- G2: 5,000 curated CASEs;
- G3: 20,000 curated CASEs;
- G4: release gates based on stable gold regression.

### WS16 — exhaustive morphological generation tests

**Suggested Git branch:** `test/sqi-morphology-exhaustive`  
**Goal:** test full paradigms, not merely successful constructor compilation. Cover all relevant case/number/definiteness/gender cells and all important verbal person/number/TAM/voice cells.

### WS17 — English parity matrix

**Suggested Git branch:** `docs/sqi-english-parity-matrix`  
**Goal:** maintain a machine-readable and human-readable matrix of English RGL functions/modules against Albanian status:

- `implemented`;
- `equivalent`;
- `partial`;
- `missing`;
- `linguistically_not_applicable`;
- `needs_review`.

This is the principal progress dashboard toward the project target.

### WS18 — multi-language typological comparison

**Suggested Git branch:** `research/sqi-model-languages`  
**Goal:** use Bulgarian, Macedonian, Greek, Romanian, Italian, German, French, Spanish, Finnish, Swedish and English selectively as structural models.

English is the maturity benchmark; the best typological model should be used for each Albanian phenomenon.

### WS19 — documentation / formal linguistic specification

**Suggested Git branch:** `docs/sqi-linguistic-spec`  
**Goal:** keep morphology, syntax, category contracts, valency, clitics, voice, TAM, case/agreement, evidence and known limitations synchronized with the implementation.

### WS20 — integration / release

**Suggested Git branch:** `integration/sqi-parity`  
**Goal:** merge only validated workstreams, maintain the source lock, run the full Wordbench campaign, resolve cross-workstream contracts, and create release checkpoints.

No new linguistic feature should originate here unless it is needed purely to resolve an integration conflict.

---

## 5. Immediate priority set

The first parallel wave should be:

1. `WS01 DictSqi MAX`
2. `WS02 MorphoDictSqi MAX`
3. `WS03 ParadigmsSqi MAX`
4. `WS05 verbal system MAX`
5. `WS06 clitic system MAX`
6. `WS07 voice/non-active/passive`
7. `WS08 TAM/auxiliaries`
8. `WS09 valency/complements`
9. `WS15 gold certification`
10. `WS17 English parity matrix`

Dependencies must be respected. In particular, large-scale Dict verb typing should follow stable valency contracts, and large-scale MorphoDict expansion should follow stable paradigms whenever possible.

---

## 6. Merge gates

Every merge into the integration branch must satisfy all applicable gates.

### Gate A — structural

- GF 3.12 compile census does not regress from `58/58` unless the target census intentionally grows.
- all expected API facades compile;
- Dict and MorphoDict compile natively;
- structural lock warnings remain `0`.

### Gate B — scenarios

- required scenarios do not regress from `52/52`;
- new features add scenarios rather than replacing unrelated tests;
- scenario output changes are explained.

### Gate C — linguistic evidence

- existing accepted golds remain stable unless a documented correction changes them;
- changed gold output requires a linguistic rationale and evidence;
- no gold file is moved merely to make a test pass.

### Gate D — lexical provenance

For generated dictionaries:

- source/provenance is retained;
- confidence/review status is retained;
- placeholder status is explicit;
- generators are deterministic;
- generated GF and manifests agree.

### Gate E — preservation

Unrelated green-core files should remain byte-for-byte unchanged whenever practical. Broad refactors require an explicit contract/migration note.

---

## 7. Branch handoff contract

Every specialist conversation/workstream should return at least:

- base source-lock or base commit;
- list of modified files;
- rationale;
- static checks performed;
- Wordbench result or exact requested campaign;
- known limitations;
- linguistic evidence/provenance;
- overlay or commit range suitable for integration.

Recommended handoff summary:

```text
WORKSTREAM:
BASE COMMIT / SOURCE LOCK:
FILES CHANGED:
GF COMPILE:
WORDBENCH:
GOLD IMPACT:
LEXICAL COUNTS:
PLACEHOLDERS REMAINING:
KNOWN ISSUES:
MERGE ORDER / DEPENDENCIES:
```

---

## 8. Release progression

### R0 — structural baseline — ACHIEVED

- `58/58` compile;
- `52/52` scenarios execute;
- Dict + MorphoDict included in the census;
- no structural lock warnings.

### R1 — first linguistic certification

- all current 569 CASEs reviewed;
- invalid families corrected;
- first stable gold corpus committed;
- Wordbench still structurally green.

### R2 — core maturity

- high-impact syntax families certified: clitics, voice, TAM, valency, nominal agreement, questions/relatives;
- thousands of gold CASEs;
- no known systematic malformed-generation family in the covered core.

### R3 — lexical maturity

- DictSqi substantially expanded and typed;
- MorphoDictSqi expanded by orders of magnitude;
- placeholder ratios reduced to explicitly accepted exceptions;
- exhaustive morphology tests for major paradigms.

### R4 — English-parity candidate

- English parity matrix has no unexplained `missing` core RGL functionality;
- all N/A differences are linguistically justified;
- large gold corpus is stable;
- lexical/morphological coverage is comparable in practical use, even if raw counts differ because Albanian and English lexical resources differ.

---

## 9. Non-negotiable rules

1. Compilation is not linguistic certification.
2. A placeholder that compiles is not a completed lexical analysis.
3. Gold follows linguistic correctness; grammar is never bent to preserve a wrong gold.
4. English is a coverage/maturity benchmark, not a template for Albanian grammar.
5. Typologically appropriate RGL implementations should be consulted for Albanian-specific phenomena.
6. DRAFT-MAX work is reintroduced incrementally, never wholesale.
7. The green integration baseline must remain recoverable at every stage.

---

## 10. Master status

**Current phase:** transition from structural completion to linguistic certification and scale.  
**Structural baseline:** GREEN.  
**Lexical scale:** far below English, active expansion required.  
**Morphological dictionary scale:** far below English, active expansion required.  
**Core linguistic certification:** not yet established.  
**Next program action:** open the immediate-priority workstreams and merge only through `integration/sqi-parity` after Wordbench gates.

