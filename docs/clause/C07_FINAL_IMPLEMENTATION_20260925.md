# C07 — Clause syntax final implementation candidate

**Date:** 2026-09-25
**Scope owner:** Conversation 7 — clause syntax
**Primary Compendium route:** R05 `SYNTAX_IMPLEMENTATION`
**Secondary routes:** R07 `EXTEND_EXTRA_AND_MISSING`, R10 `REPAIR_LINGUISTIC_OUTPUT`, R11 testing
**GF target:** 3.12
**Declared project baseline:** `albanian-s02-green-20260925`, 58/58 targets, 52/52 required scenarios
**Baseline source archive SHA-256:** `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829`
**Supplied RGL archive SHA-256:** `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d`
**Albanian reference archive SHA-256:** `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc`
**Compendium archive SHA-256:** `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe`
**Consolidated normative documentation SHA-256:** `9e10d077a7d18e2d2b21b874e12ed24d20314f356153ca0d36ec409026870b4c`

## 1. Finalization objective

This candidate finishes the evidence-supported part of C07 without changing the shared category/resource representations. The public `Sentence`, `Question`, and `Relative` APIs remain complete at **41/41** shared functions while ordinary clause realization is routed through `ClauseSqiRes`.

The implementation follows the Compendium single-clause-assembly principle: TAM, polarity, agreement and clitic placement remain owned by the VP/clause realizer; sentence/question/relative modules only select clause type, government and surface framing.

## 2. Linguistic evidence applied

The supplied Albanian references support the following changes:

- `Lesson_10.html`, general syntactic concerns: neutral Albanian order is SVO, while marked alternatives exist; this patch keeps SVO as the canonical ordinary order and does **not** add a free permutation system.
- `Lesson_30.html`, §13: indicative negation uses `nuk`/`s'`; non-indicative negation uses `mos`. Existing centralized realizers are preserved.
- `Lesson_30.html`, §14.1: `se` and `që` are both indicative subordinators. Existing canonical generation remains `që`; the `se/që` generation policy stays open rather than adding uncontrolled variants.
- `Lesson_30.html`, §14.2: Standard/Tosk finite subjunctive is introduced by `të`; existing `realizeSubjVP` remains authoritative.
- `Lesson_30.html`, §14.3: ordinary spoken relatives commonly use invariant `që`; the standard `cili/e` relative is case-inflected and agrees with its head in gender/number. `që` remains the ordinary relative marker. Preposition stranding is not promoted as canonical.
- `Lesson_30.html`, post-§14.3 impersonal/extraposed discussion: the attested clausal-subject adjectival family uses feminine singular agreement. A dedicated `clausalSubjectAgr` is introduced instead of changing the global fallback agreement.
- `Lesson_50.html`, questions: direct polar questions use `a`; wh pronouns preserve case/government.

## 3. Architecture implemented

`ClauseSqiRes` now exposes semantic helpers without changing any lincat:

- `fallbackAgr` — compatibility agreement only for genuinely subjectless/fragments;
- `clausalSubjectAgr` — feminine singular agreement for the attested clausal-subject family;
- `embedIndicative` — current canonical indicative embedding with `që`;
- `markPolarQuestion` — direct polar `a`;
- `markRelativeClause` — ordinary invariant relative `që`;
- `frontWh` — evidence-supported wh fronting primitive;
- `frontGovernedIP` / `frontGovernedRP` — preserve preposition/case government;
- `assembleFinalPredicate` — single subject + already-finalized-predicate assembly point;
- existing `mkClause`, `realizeVP`, `realizeSubjVP`, `realizeSubjAntVP`, imperative/participle/gerund realizers remain authoritative for TAM/clitics.

No `ClauseOrder`, `QForm`, new VP slot system, or new category representation is introduced.

## 4. Correctness repairs

### 4.1 Clausal subject agreement

`SentenceSqi.PredSCVP` now uses `clausalSubjectAgr` instead of the generic masculine fallback. This is intentionally narrow: it does not redefine agreement for all impersonal clauses.

### 4.2 SC complementizer ownership

`AdjectiveSqi.SentAP` no longer inserts its own `që`. `SC` already carries the required embedding surface via `EmbedS`, `EmbedQS`, or `EmbedVP`. The old composition could produce `që që` for sentential complements and `që të` mechanically even where the SC itself already encoded the correct boundary.

`SentenceSqi.EmbedS`, `VerbSqi.ComplVS`, `VerbSqi.SlashV2S`, `SentenceSqi.SlashVS`, `ExtendSqiScaffolding.sc_CompS`, and the cleft sentence boundary now share `embedIndicative`.

### 4.3 Direct questions and wh government

`QuestionSqi` delegates direct polar marking to `markPolarQuestion`, ordinary subject questions to `mkClause`, and object/oblique wh placement to the governed fronting helpers. No embedded-question particle is invented.

### 4.4 Relative clauses

`RelativeSqi` delegates ordinary marker insertion and governed RP placement to the common kernel. Invariant `që` remains the ordinary public `IdRP` strategy.

The English-named `StrandQuestSlash` and `StrandRelSlash` operations are neutralized to pied-piping whenever the shared API supplies an explicit IP/RP, preserving case and preposition while avoiding unsupported postposed prepositions.

`EmptyRelSlash` remains explicitly **uncertified compatibility debt**. The abstract function supplies no RP, while the current Albanian `Agr/GenNum` representation loses plural head gender; the supplied standard `cili/e` paradigm requires that distinction. This cannot be made fully correct inside C07 without a cross-workstream representation migration. The historical behavior is therefore preserved and mechanically marked as non-canonical instead of fabricating a false “final” form.

## 5. Specialized clause assemblers retained intentionally

The following are not collapsed into ordinary `mkClause`, because their information structure or semantics is construction-specific or evidence-open:

- `IdiomSqi`: clefts and existentials;
- `ConstructionSqi`: `what_name_QCl`, `how_old_QCl`, `how_far_QCl`;
- `ExtraSqi`: focus/fronting constructors;
- `PhraseSqi`: utterance/fragments;
- `ExtendSqiVPBridge`: embedded slash/question/purpose specializations.

Ordinary duplicates in `ConstructionSqi.have_name_Cl`, `ConstructionSqi.weather_adjCl`, `IdiomSqi.GenericCl`, and `ExtendSqiVPS` were routed through the canonical assembly helpers.

## 6. Files modified

Core C07:
- `AlbanianSQI/GF/lib/src/albanian/ClauseSqiRes.gf`
- `SentenceSqi.gf`
- `QuestionSqi.gf`
- `RelativeSqi.gf`

Cross-workstream consumers, changed only at the clause boundary:
- `VerbSqi.gf` (C8-owned valence consumer)
- `AdjectiveSqi.gf` (C6-owned AP consumer)
- `ExtendSqiScaffolding.gf`, `ExtendSqiVPS.gf` (C9 surface consumers)
- `ConstructionSqi.gf`, `IdiomSqi.gf` (C8 construction consumers)

Validation/config:
- `project.toml` — adds one **optional**, not required, C07 scenario;
- `validation/clause/static_validate_clause.py`;
- `validation/inputs/AlbClauseFinal.gf`;
- `validation/inputs/AlbClauseFinalSqi.gf`;
- `validation/scenarios/alb-clause-final.gfs`.

No `CatSqi.gf` or `ResSqi.gf` change is part of this patch.

## 7. Validation status

Executed locally in the supplied environment:

- C07 static validator: PASS;
- shared Sentence/Question/Relative coverage: 41/41;
- baseline required scenario catalog remains 52;
- new optional C07 campaign contains 18 SHA-locked CASEs;
- Dict static validator: PASS;
- MorphoDict static validator: PASS;
- combined Dict + MorphoDict validator: PASS;
- `MorphoSqi` heuristic lint: 0 findings;
- Python compileall for validation/tools: PASS;
- whitespace/diff check: PASS;
- Wordbench 1.3.4 direct scenario-contract validation: PASS for all 53 registered scripts (52 required + `alb-clause-final`), including input SHA locks and expected marker sections;
- Wordbench strict profile check was run against both the untouched baseline and the candidate with the same supplied RGL root: both report the same pre-existing 18 missing profile-authority assets, with 0 warnings. C07 adds no project-contract diagnostic.

**Not executed here:** GF 3.12 compilation, Wordbench 58/58 compiler census, or scenario execution, because no GF executable is installed in this execution environment. Therefore this is a **final evidence-supported implementation candidate under the current locked representation**, not a fresh compiler or linguistic certification claim.

## 8. Exit gate

Before merging/tagging as a fresh C07-green state:

1. run GF 3.12 Wordbench strict Global Scan: target 58/58;
2. run all 52 required scenarios: target 52/52;
3. run optional `alb-clause-final`: target executable 18/18;
4. review C7F001–C7F014 linguistically and promote stable outputs to golds only after review;
5. inspect C7F015–C7F018 as explicit open-boundary probes, not automatic gold candidates;
6. compare all existing golds and require zero unintended regression.

## 9. Representation-bound closure limits

Two residual corners cannot be honestly closed inside C07 without changing shared representations or exceeding the evidence supplied:

1. **Fully standard governed `cili/e` relatives.** The shared `RP` can select case and `GenNum`, but `GenNum = GSg Gender | GPl` loses plural head gender. Standard Albanian distinguishes at least masculine/feminine plural nominative/accusative `cili/e` forms. Explicit-IP/RP stranding APIs have been neutralized to pied-piping, but `EmptyRelSlash` remains compatibility debt and governed `IdRP = që` is not certified as the standard prepositional strategy.
2. **Controller-sensitive `EmbedVP : VP -> SC`.** The inherited `SC` surface is flat (`s : Str`), so it cannot carry the controller person needed by fully person-sensitive finite subjunctive realization in every Standard-Albanian control context. The historical third-singular fallback is retained and made explicit. Closing this requires a cross-workstream representation decision (or a separately evidenced nonfinite strategy), not a hidden C07 guess.

The supplied DRAFT-MAX material contains relevant representation ideas (including richer agreement), but those ideas are **not activated wholesale**. Any future migration must be isolated, propagated to all consumers, and re-established through GF 3.12 evidence.
