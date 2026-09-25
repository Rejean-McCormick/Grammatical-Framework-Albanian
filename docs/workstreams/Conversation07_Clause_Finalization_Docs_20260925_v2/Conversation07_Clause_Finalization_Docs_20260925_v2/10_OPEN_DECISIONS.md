# Open Decisions — Clause Syntax v2

**Rule:** an `OPEN` item is not a defect to “fix from intuition”. It is a prohibition on silently choosing a permanent grammar analysis.

| ID | Question | Known evidence | Current code pressure | Closure requirement |
|---|---|---|---|---|
| OD-C07-001 | Direct vs embedded polar questions | E-C07-012 proves direct `a`; E-C07-015 says embedded behavior not supplied | `QuestCl` adds `a`; `EmbedQS` identity | Albanian embedded polar examples/grammar rule + tests |
| OD-C07-002 | Embedded wh questions | direct wh case evidence; no supplied embedded-Q rule | `EmbedQS`; `ComplVQ` | Albanian embedded wh evidence + direct/embedded contrast tests |
| OD-C07-003 | Canonical `se` vs `që` in indicative complements | E-C07-006 supports both | multiple hardcoded `që` sites | sourced distribution or explicit canonical/variant policy |
| OD-C07-004 | Relative strategy selection | E-C07-008/009 | `IdRP=që`; declined nominal tables also exist | Standard generation policy by role/register/context |
| OD-C07-005 | Prepositional relatives with invariant `që` | supplied source does not characterize it | `RelSlash`, `EmptyRelSlash`, pied-pipe helpers | targeted Albanian evidence |
| OD-C07-006 | Topic/focus/scrambling inventory | E-C07-001 + E-C07-014 only | `ExtraSqi.Foc*`, Front/InvFront | examples with discourse conditions + minimal pairs |
| OD-C07-007 | Pro-drop policy | not established by current supplied clause evidence | `sc_ProDrop` exists | Albanian evidence + emphasis/agreement interaction tests |
| OD-C07-008 | `EmbedVP`/control subject semantics | E-C07-007 supports finite subjunctive; control mapping incomplete | `defaultAgr` in `EmbedVP`; VV paths | WS09 control contract + Albanian evidence |
| OD-C07-009 | Adverb placement classes | not fully characterized | `AdvS`, `AdvSlash`, VP post/pre helpers | targeted evidence by adverb class/scope |
| OD-C07-010 | Nonrestrictive sentential-relative punctuation/agreement | not established | `RelS` comma + `defaultAgr` | evidence + mapping to abstract semantics |
| OD-C07-011 | Need for typed `ClauseOrder` | no certified order inventory | current `Cl` has no order dimension | close OD-006 with >1 productive order that must coexist |
| OD-C07-012 | Need for named in-place/extraposed slots | no proven clause discontinuity requiring them | current VP has one `post` field | concrete Albanian producer/consumer + EP005/010 gate |
| OD-C07-013 | Canonical/variant `nuk` vs `s'` | E-C07-002 supports both | `negation` emits `nuk` only | generation/register policy + parse/ambiguity tests |
| OD-C07-014 | Agreement for clausal/expletive subjects | E-C07-013 shows a feminine impersonal example | `PredSCVP`, `EmbedVP`, `RelS` use masculine default in places | map relevant RGL constructions to Albanian agreement evidence |
| OD-C07-015 | Preposition stranding | no supplied evidence establishes productive Albanian stranding | `sc_StrandQuestSlash`, `sc_StrandRelSlash` postpose prep | Albanian evidence or mark linguistically N/A/deferred |
| OD-C07-016 | Positive imperative clitic variant policy | E-C07-010 shows pre/post variants | current realizer only models a preverb cluster path | WS06 representation + canonical/variant decision + tests |
| OD-C07-017 | Purpose/in-order-to clause strategy | source supports `të` complement system; exact helper choices need review | `vp_PurposeVP`, `vp_InOrderToVP` use different formulas | targeted evidence for purpose clauses and ownership |
| OD-C07-018 | Construction-specific Q word order | direct general question evidence is limited | `what_name_QCl`, `how_old_QCl`, `how_far_QCl` custom order | targeted idiomatic evidence/tests |

## Closure record

When an item closes, record:

```yaml
open_decision: OD-C07-XXX
status: closed|deferred|linguistically_not_applicable
evidence_ids: []
new_sources: []
abstract_contracts: []
current_source_sites: []
model_languages_consulted: []
decision: ...
representation_effect: ...
functions_affected: []
tests_added: []
parse_generation_policy: ...
wordbench_result: ...
linguistic_review: ...
golds: []
```

A deferred item remains visible in `18_CERTIFICATION_DASHBOARD.md`; it is not silently treated as complete.
