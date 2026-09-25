# Current Implementation Audit — Clause Syntax v2

**Snapshot:** `Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip`.  
**Purpose:** replace the vague instruction “centralize clause assembly” with an exact map of current owners and drift hotspots. Line numbers below refer to this locked snapshot.

## 1. Category shapes

| Category | Current shape | Consequence |
|---|---|---|
| `Cl` | `Tense => Anteriority => Polarity => Str` | no order or embedding dimension survives in `Cl` |
| `QCl` | same three dimensions | direct/embedded question distinction cannot currently survive inside `QCl` |
| `RCl` | `Agr => Tense => Anteriority => Polarity => Str` | retains head/agreement input |
| `ClSlash` | `Cl` table + `c2 : Compl` | governed missing complement remains explicit |
| `S`, `QS` | final `Str` | all distinctions are flattened at `Use*` |
| `RS` | `Agr => Str` | head agreement remains through final relative sentence |
| `VP` | morphology tables + `cl`, `subjcl`, `post` | mutable finite/clitic/post material remains structured enough for current kernel |
| `VPSlash` | `VP + c2` | slash government is preserved |

## 2. Canonical kernel strengths

`ClauseSqiRes.gf` currently provides the strongest architecture in the branch:

- lines 10–51: structure-preserving VP/slash conversions;
- lines 53–64: post/clitic-preserving record updates;
- lines 68–92: one main finite VP realizer;
- lines 96–109: subjunctive realization including `të mos`;
- lines 112–117: imperative realization;
- lines 125–126: ordinary subject + finite VP `mkClause`.

These functions are **not presumed linguistically complete**, but they are the preferred ownership boundary to evolve.

## 3. Core public-module audit

| Site | Snapshot lines | Current behavior | Classification | Target action |
|---|---:|---|---|---|
| `SentenceSqi.PredVP` | 5–7 | delegates to `mkClause` | canonical | retain |
| `PredSCVP` | 9–11 | delegates but uses `defaultAgr` | hotspot | resolve OD-014 |
| `SlashVP` | 13–16 | delegates and preserves `c2` | canonical | retain |
| `AdvSlash` | 18–20 | appends Adv to realized slash string | transitional | centralize only if placement evidence requires |
| `SlashVS` | 24–29 | hardcodes `që`, then delegates | hotspot | embedding policy |
| `EmbedS` | 34 | hardcodes `që` | hotspot | OD-003 |
| `EmbedQS` | 35 | identity | hotspot | OD-001/002 |
| `EmbedVP` | 36 | subjunctive with `defaultAgr` | hotspot | OD-008/014 |
| `SSubjS` | 48 | flat `S Subj S` | transitional | preserve until order/scope evidence |
| `RelS` | 49 | comma + RS with `defaultAgr` | hotspot | OD-010/014 |
| `QuestionSqi.QuestCl` | 8 | `a` + finished Cl | evidence-backed for direct polar only | specialize/direct helper |
| `QuestVP` | 10–12 | fronted IP + `realizeVP` | transitional | shared wh helper/tests |
| `QuestSlash` | 14–16 | prep + case IP + finished ClSlash | promising | certify prepositional behavior |
| `QuestIAdv` | 18–20 | IAdv + Cl | promising | direct/embedded separation |
| `QuestIComp` | 22–25 | custom copular order | specialist candidate | OD-018/tests |
| `RelativeSqi.RelCl` | 5 | `që` + Cl | hotspot | strategy policy |
| `RelVP` | 7–9 | RP nom + finite VP | promising | certify RP strategy/agreement |
| `RelSlash` | 11–14 | prep + case RP + finished ClSlash | promising | prep-relative tests |
| `IdRP` | 16 | invariant `që` | evidence-backed strategy, not universal policy | OD-004 |
| `FunRP` | 18–20 | prep + NP + RP concatenation | review | semantic/relative tests |

## 4. Duplicate/specialist assembly sites outside core

### `ConstructionSqi.gf`

- `mkPred` lines 25–27 correctly delegates to `mkClause`.
- `have_name_Cl` lines 60–63 manually composes subject + `realizeVP` + name.
- `what_name_QCl`, `how_old_QCl`, `how_far_QCl` lines 65–77 implement custom interrogative orders.
- `weather_adjCl` lines 94–97 has a fixed impersonal subject/agreement choice.
- `few_X_short_of_Y` lines 129–134 produces a final clause-like string directly.

Disposition: construction-specific behavior may be legitimate, but every Q/impersonal path needs targeted evidence and should reuse shared clause helpers where semantics match.

### `IdiomSqi.gf`

- `ImpersCl`/`GenericCl` lines 19–20 use `realizeVP` directly.
- `CleftNP`/`CleftAdv` lines 22–27 manually assemble copula + focus/material; `CleftAdv` hardcodes `që`.
- `ExistNP`/`ExistIP` lines 29–34 have an independent existential tense/negation realizer (`existWord`).
- `ProgrVP` and imperative persons are specialists.

Disposition: existential/cleft can remain specialist, but must be documented/tested and not silently diverge in polarity/TAM semantics.

### `ExtendSqiScaffolding.gf`

High-risk clause sites:

- 54–60 pied-piping question/relative;
- 65–74 “strand” and empty-relative implementations;
- 85–89 `CompS`/`CompQS`/`CompVP` embedding;
- 109–115 direct-speech/fronted and interrogative VP constructors;
- 123–124 generalized VV complement.

The comments asserting Albanian preposition behavior are not themselves linguistic evidence. “Strand” realizations remain uncertified under OD-C07-015.

### `ExtendSqiVPS.gf`

- `vps_PredVPS` lines 47–49 assembles NP + finalized VPS string;
- `vps_SQuestVPS` lines 50–52 prefixes `a`;
- `vps_QuestVPS` lines 53–55 fronts IP;
- `vps_RelVPS` lines 56–58 fronts RP.

These are parallel S/QS/RS assemblers and must be reconciled with the same direct/embedded/relative policies as core constructors.

### `ExtraSqi.gf`

- `FocObj`, `FocAdv`, `FocAdV`, `FocVP` lines 47–52 directly impose marked orders;
- `FrontExtPredVP` and `InvFrontExtPredVP` lines 72–73 both reduce to `PredVP`.

These are **implementation placeholders/uncertified behaviors**, not evidence of a completed Albanian information-structure system.

### `VerbSqi.gf`

- `ComplVV`, `ComplVS`, `ComplVQ` and slash variants determine complement realization before clause assembly.
- `ComplVS`/`SlashV2S` hardcode `që`.
- this is a cross-workstream boundary: valency selects complement type; C07 owns clause embedding policy but should not rewrite lexical valency locally.

## 5. Current architecture risks

### RISK-C07-001 — competing clause finalization

Several extension/construction modules can output `Cl`, `QCl`, `RCl`, `S`, `QS`, or `RS` without using the same high-level helpers. Future fixes can drift across them.

### RISK-C07-002 — early flattening of question form

`QCl` lacks a direct/embedded dimension and `QS` is `Str`. If Albanian distinguishes them, current types flatten too early. Evidence is currently insufficient to justify a migration.

### RISK-C07-003 — hardcoded complementizer family

`që` appears independently in `SentenceSqi`, `VerbSqi`, `ExtendSqiScaffolding`, `IdiomSqi` and VP bridge code. E-C07-006 establishes `se/që`, so one coherent policy is required.

### RISK-C07-004 — universal fallback agreement

`defaultAgr` is used where semantic agreement information is unavailable. E-C07-013 makes universal masculine default unsafe as an assumed linguistic rule.

### RISK-C07-005 — uncertified marked order

Focus/front/strand functions encode surface orders with no supplied targeted evidence. They must not be treated as mature just because they compile.

### RISK-C07-006 — relative strategy fragmentation

Core and extension paths mix invariant `që`, declined RP, pied-piping, empty relative and “strand” patterns without one documented strategy selector.

## 6. Phase-0 conclusion

The branch already has the right **kernel direction**, so a wholesale category redesign is not warranted at the start. The first implementation patches should centralize equivalent assembly and add contrastive tests while keeping current lincats stable. Typed enrichment is reserved for evidence-backed distinctions that cannot survive the current category shapes.
