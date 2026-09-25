# Certification Dashboard — Clause Syntax v2

**This is a status dashboard, not a claim that implementation work has been completed.**

## 1. Structural baseline

| Item | Current documented state | Final C07 requirement |
|---|---|---|
| GF census | 58/58 in roadmap baseline | no regression / intentional growth only |
| required scenarios | 52/52 | no regression + additive clause scenarios |
| CASE corpus | 569 reviewable CASEs | all relevant changed families reviewed; stable gold growth |
| Sentence API | 19/19 present | architecturally reconciled + tested + certified |
| Question API | 17/17 present | architecturally reconciled + tested + certified |
| Relative API | 5/5 present | architecturally reconciled + tested + certified |
| linguistic gold corpus | not established in baseline roadmap | clause-specific accepted golds established |

## 2. Family status

| Family | Evidence state | Implementation state | Certification state | Main blocker |
|---|---|---|---|---|
| neutral declaratives | SVO supported | canonical `mkClause` exists | not gold-certified | systematic review |
| indicative negation | `nuk/s'` supported | `nuk` implemented | partial | OD-013 variant policy |
| non-indicative negation | `mos` supported | subj/imp paths exist | partial | negative imperative/subj tests |
| finite subjunctive complements | strong support | core/control paths exist | partial | OD-008 control/agreement |
| future `do të` | supported | core path exists | partial | clitic/TAM interaction certification |
| indicative `se/që` complements | both supported | mostly `që` hardcoded | open | OD-003 |
| direct polar questions | `a` supported | implemented | behavioral only | gold + interaction matrix |
| direct wh questions | case behavior supported | implemented | behavioral only | broader case/copular/multiple-wh review |
| embedded questions | evidence gap | identity/finalized QS paths exist | open | OD-001/002 |
| subject/object relatives | declined + invariant strategies supported | implemented paths exist | behavioral only | strategy/head agreement golds |
| prepositional relatives | declined RP theory supports case; detailed strategy incomplete | paths exist | open/partial | OD-005/015 |
| sentence subordination | some subordinator structures present | flat concatenation | behavioral only | placement/semantic review |
| pro-drop | not established in current evidence set | extension helper exists | open | OD-007 |
| focus/topicalization/scrambling | insufficient evidence | ad-hoc extension paths exist | open | OD-006 |
| adverb placement classes | insufficient | mixed pre/post concatenation | open | OD-009 |
| clausal/expletive agreement | one relevant feminine clue | masculine fallback used in places | open | OD-014 |
| existentials/clefts | not yet sourced here | specialist code exists | open/partial | targeted evidence/tests |

## 3. Phase status

| Phase | Status at v2 documentation generation |
|---|---|
| 0 freeze/inventory | documented |
| 1 ordinary declarative canonicalization | not started by this doc package |
| 2 embedding/subordination | not started |
| 3 direct questions | not started |
| 4 embedded questions | evidence-gated |
| 5 relatives | not started |
| 6 modifiers/subordination order | not started |
| 7 extension/construction/idiom reconciliation | not started |
| 8 information structure/order | evidence-gated |
| 9 typed lincat migration | not justified yet |
| 10 linguistic certification | not started as a completed program |

## 4. Final exit gate

Conversation 7 may be marked final only when:

- no unexplained `open`/`transitional` core function remains in `04`;
- all clause-level sites in `15` have a final disposition;
- every behavior-changing decision has an evidence/decision record;
- all applicable structural/scenario gates pass;
- clause-specific reviewed golds cover the supported contrasts and interactions;
- parse/generation variant policy is resolved for exposed alternatives;
- any remaining unsupported behavior is explicit, not hidden behind a string fallback.
