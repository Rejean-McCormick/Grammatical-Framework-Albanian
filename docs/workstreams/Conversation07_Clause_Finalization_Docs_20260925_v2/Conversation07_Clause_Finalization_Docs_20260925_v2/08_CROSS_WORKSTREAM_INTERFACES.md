# Cross-Workstream Interfaces — Clause Syntax v2

## 1. Interface principle

Conversation 7 owns **clause composition**, not every grammatical phenomenon visible in a clause. A clause patch may request richer structured information from another workstream; it may not duplicate that workstream's rules locally.

## 2. WS05 verbal system

**WS05 owns:** inflection tables, subjunctive forms, participles, imperative morphology, irregular finite forms.  
**C07 consumes:** a VP/Verb interface whose forms are already grammatically constructed.

Forbidden: reconstructing a subjunctive from an indicative surface string in `SentenceSqi`/`QuestionSqi`.

## 3. WS06 clitic system

**WS06 owns:** cluster membership/order, contractions (`të` + clitic etc.), object-clitic morphology, imperative placement alternatives, combinations.  
**C07 owns:** the clause context in which the clitic-aware VP is realized.

Current `VP.cl`, `VP.subjcl` and the weak-pronoun helpers are transitional interfaces. If WS06 replaces them with a richer cluster, C07 must consume that representation rather than reimplement its strings.

## 4. WS07 voice/non-active

Voice owns morphological/auxiliary voice distinctions and agent structure. C07 ensures the resulting VP participates correctly in declarative/question/relative/subordinate contexts.

## 5. WS08 TAM/auxiliaries

**WS08 owns:** legal TAM/mood/auxiliary combinations and the morphology/resources that realize them.  
**C07 owns:** passing `Temp`/polarity/anteriority into the correct finite/subjunctive/specialist realizer and preserving clause ordering.

`ClauseSqiRes.realizeVP` is a current shared boundary. If WS08 changes its internal representation, public clause modules should stay thin.

## 6. WS09 valency/control/complements

WS09 owns:

- `V/V2/V3/VA/VS/VQ/VV/V2A/V2S/V2Q/V2V` lexical contracts;
- governed case/preposition selection;
- control/raising semantics;
- which clausal complement type a verb selects.

C07 owns the final clause embedding/ordering of those typed complements.

High-risk interfaces: `EmbedVP`, `ComplVV`, `SlashV2V`, `ComplVS`, `SlashV2S`, `ComplVQ`, `SlashV2Q`.

## 7. WS10 nominal syntax/relatives

WS10 owns full `IP/RP` paradigms, head agreement, case realization and relative/interrogative nominal morphology. C07 consumes `IP/RP` structurally and places them in question/relative clauses.

The evidence for declined relative `cili/e` makes this interface mandatory: clause syntax must not replace a declined RP with an invariant string before case/head agreement is consumed.

## 8. WS12 Structural

Structural owns lexical forms for `Subj`, `IAdv`, `IQuant`, prepositions and related closed-class items. C07 may identify that a form is missing/wrong but should not hide the defect by hardcoding an unrelated string in a clause helper.

## 9. WS13 Extend/Extra

Extend/Extra may expose clause-level functions not present in the shared core. C07 and WS13 must agree which helper owns their finite realization. `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md` is the handoff inventory.

## 10. Agreement fallback protocol

`defaultAgr = 3SG masculine` is not an inter-workstream contract. Any use must name why the construction lacks a semantic agreement source. If another workstream can supply agreement, the fallback must not mask that missing information.

## 11. Interface-change protocol

A cross-workstream type change requires:

1. owner workstream;
2. producer/consumer list;
3. old/new contract;
4. migration order;
5. compatibility period if needed;
6. focused tests from both workstreams;
7. full Wordbench integration gate;
8. documentation reconciliation.
