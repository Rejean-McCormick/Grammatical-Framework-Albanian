# C07 post-implementation audit — clause assembly ownership

**Date:** 2026-09-25
**Purpose:** freeze the post-patch ownership map so later work does not reintroduce ad-hoc clause assembly.

## 1. Canonical ordinary-clause paths

| Surface | Owner after C07 | Status |
|---|---|---|
| finite VP TAM/polarity/clitics | `ClauseSqiRes.realizeVP` | canonical |
| finite subject + VP | `ClauseSqiRes.mkClause` | canonical |
| finite SC-subject + VP | `SentenceSqi.PredSCVP` → `mkClause` with `clausalSubjectAgr` | canonical for evidenced family |
| slash subject realization | `SentenceSqi.SlashVP` → `mkClause` | canonical |
| VS + embedded slashed sentence | `SentenceSqi.SlashVS` → `embedIndicative` + `mkClause` | canonical current indicative strategy |
| direct polar question | `markPolarQuestion` | canonical direct question |
| wh subject | `QuestVP` / `QuestQVP` → `mkClause` | canonical |
| wh object/oblique | `frontGovernedIP` | canonical for supplied case/government evidence |
| ordinary relative marker | `markRelativeClause` / `invariantRelativeMarker` | canonical ordinary `që` route |
| relative subject | `RelVP` → `mkClause` | canonical |
| explicit governed relative | `frontGovernedRP` | structurally canonical; lexical RP strategy still partly uncertified |
| indicative sentential embedding | `embedIndicative` | canonical current `që` generation |
| subjunctive VP realization | existing `realizeSubjVP` / `realizeSubjAntVP` | canonical verbal owner |
| finalized VPS predicate | `assembleFinalPredicate` | canonical C9/C07 bridge |

## 2. Specialized assemblers deliberately retained

These are not ordinary duplicates and must not be collapsed mechanically:

- `IdiomSqi.CleftNP`, `CleftAdv`, `ExistNP`, `ExistIP`: construction-specific information structure/existential semantics.
- `ConstructionSqi.what_name_QCl`, `how_old_QCl`, `how_far_QCl`: lexicalized/special interrogative constructions.
- `ExtraSqi.Foc*`, `FrontExtPredVP`, `InvFrontExtPredVP`: focus/fronting surfaces; linguistically evidence-open.
- `PhraseSqi`: utterance/fragments, outside ordinary clause ownership.
- `ExtendSqiVPBridge`: purpose, nonfinite and specialized embedded bridges; do not rewrite as ordinary indicative embedding.
- `ExtendSqiRNP`: RNP-specific realization and government.

## 3. Remaining direct assembly sites and classification

| Site | Classification | Action |
|---|---|---|
| `SentenceSqi.AdvSlash` | sentence-level modifier | retain |
| `SentenceSqi.AdvImp` | imperative modifier | retain |
| `SentenceSqi.AdvS` / `ExtAdvS` | S-level discourse composition | retain |
| `SentenceSqi.SSubjS` | S-level subordination composition | retain pending richer ordering evidence |
| `SentenceSqi.RelS` | evidence-open sentential-relative agreement | retain + block certification |
| `QuestionSqi.QuestIComp` | specialized copular interrogative | retain; needs output review |
| `QuestionSqi.ComplSlashIP` | VP completion, not clause assembly | retain under VP owner |
| `RelativeSqi.FunRP` | RP construction, not clause assembly | retain |
| `IdiomSqi.ImpersCl` | subjectless specialization | retain with explicit fallback |
| `ExtendSqiScaffolding.EmptyRelSlash` | compatibility debt | do not certify |
| `ExtraSqi.Foc*` | evidence-open information structure | do not certify yet |
| generic `EmbedQS` consumers | evidence-open indirect-question boundary | preserve existing surface |
| generic `EmbedVP` | representation-limited controller agreement | preserve explicit fallback; cross-workstream closure required |

## 4. Drift guard

A future C07/C08/C09 patch that introduces a new raw finite-clause concatenation must answer all four questions before merge:

1. Why can the form not be expressed through `mkClause`, `realizeVP`, `frontWh`, a governed fronting helper, or an embedding helper?
2. Is the site a genuinely specialized construction or merely a duplicate?
3. Which Albanian evidence requires the different boundary/order?
4. Which contrastive scenario prevents the ordinary path and the specialized path from drifting apart?

Absent those answers, the new assembly site is a regression in architecture even if GF compiles.
