# Evidence Traceability Matrix — Clause Syntax v2

This matrix is the anti-drift bridge between linguistic sources, code, tests and open decisions. A source fact is not considered “implemented and certified” until its row's certification gap is closed.

| Evidence ID | Phenomenon | Source locator | Current code sites | Existing tests | Current gap |
| --- | --- | --- | --- | --- | --- |
| E-C07-001 | Neutral word order | Lesson_10, §1 General Syntactic Concerns | Neutral order is generally S–V–O; source also states some flexibility. | `mkClause` currently emits subject before finite VP. | C0251–C0280; C0471–C0480 |
| E-C07-002 | Indicative negation | Lesson_30, §13 Negation | Indicative verbs are negated with `nuk` or `s'`; source treats them as synonymous. | `ResSqi.negation` currently generates only `nuk`. | C0280,C0309,C0341–C0350,C0386,C0471–C0473 |
| E-C07-003 | Non-indicative negation | Lesson_30, §13 Negation | `mos` is used with subjunctive, imperative, optative and participial formations. | `realizeSubjVP`/`realizeImpVP` use `mos`. | partial; no dedicated negative-imperative matrix |
| E-C07-004 | Subjunctive marker | Lesson_10 verb section; Lesson_20 §9; Lesson_30 §14.2 | Subjunctive forms are introduced by `të`; Standard/Tosk verbal complementation often uses finite subjunctives. | `VP.subjcl`; `realizeSubjVP`; `ComplVV`; control helpers. | C0101–C0200 morphology; C0371–C0380 control |
| E-C07-005 | Future formation | Lesson_10 verb section | Standard/Tosk future uses invariant `do` plus `të` + present subjunctive form. | `realizeVP` future branches use `do` + `subjcl` + subjunctive. | C0384,C0472,C0482 + verb/cross cases |
| E-C07-006 | Indicative complementizers | Lesson_30 §14.1 Indicative Subordination | `se` and `që` are both common indicative subordinators translating “that”. | `EmbedS`, `ComplVS`, `SlashV2S`, `sc_CompS` currently hardcode `që`. | C0281–C0283,C0289,C0291,C0295,C0300 |
| E-C07-007 | Finite complement instead of infinitive | Lesson_30 §14.2 Subjunctive Subordination | Standard/Tosk uses finite `të`-subjunctive where many languages use an infinitive; overt subject may occur with `që SUBJECT të ...`. | `EmbedVP`, `ComplVV`, VPI/VPS helpers. | C0293,C0297,C0371–C0380,C0479 |
| E-C07-008 | Relative pronoun paradigm and position | Lesson_30 §14.3 Relative Clauses | Standard relative pronoun is declined, clause-initial, case follows its role, gender/number follow head noun. | `RP : Case => GenNum => Str`; `RelVP`; `RelSlash`; nominal `cili` tables exist. | C0401–C0420,C0486–C0490 |
| E-C07-009 | Invariant `që` relative | Lesson_30 §14.3 Relative Clauses | Invariant `që` is reported as more common in spoken Albanian than declined `cili/e`. | `IdRP = që`; `RelCl`/`EmptyRelSlash` use `që`. | relative campaigns |
| E-C07-010 | Weak-pronoun placement | Lesson_30 §17.2 Position of weak pronouns | Outside imperatives, weak pronouns precede the verb; with `të`/`do të` they remain directly before the verb; positive imperative allows more than one placement. | VP `cl`/`subjcl`; clitic tables; `realizeVP`/`realizeImpVP`. | C0331–C0370 + cross |
| E-C07-011 | Clitic doubling/obligation | Lesson_30 §17.3 Use of clitic pronouns | Overt direct object may occur with or without object clitic; indirect-object weak pronoun is required even with overt indirect object. | `VerbSqi.saturateSlash`; `ExtendSqiVPS.lexicalObjectVP`. | C0271–C0280,C0351–C0360 |
| E-C07-012 | Direct questions | Lesson_50 §29 Questions | Wh forms show case alternations; direct yes/no questions require marker `a`. | `QuestCl` prefixes `a`; `IP` is case-indexed; `PrepIP` uses governed case. | C0381–C0400,C0481–C0485 |
| E-C07-013 | Impersonal/clausal-complement agreement clue | Lesson_30 after §14.3 (impersonal construction example) | Source notes feminine adjective agreement with an unexpressed expletive in an impersonal construction with a clausal complement. | Several clause helpers use masculine `defaultAgr`. | no dedicated contrast |
| E-C07-014 | Information structure evidence gap | Supplied reference bundle search | Supplied clause sections state neutral SVO + flexibility but do not specify a productive inventory/licensing of focus, topicalization or scrambling. | `ExtraSqi` contains `Foc*`; Front/InvFront functions are present. | no dedicated certified matrix |
| E-C07-015 | Embedded-question evidence gap | Supplied reference bundle search | No supplied section found that establishes whether polar/wh embedded questions retain direct marker/order. | `EmbedQS` is identity; `ComplVQ` embeds a finalized QS. | C0284,C0285,C0290,C0292,C0296,C0299 |

## Expanded status and intended owner

| ID | Supported claim / limitation | Target owner | Decision linkage | Certification target |
| --- | --- | --- | --- | --- |
| E-C07-001 | Neutral SVO; unspecified flexibility | ordinary clause assembler | OD-006/011 for marked orders | gold neutral declaratives + later evidence-backed marked orders |
| E-C07-002 | `nuk` or `s'` indicative | polarity interface + clause realizer | OD-013 | canonical/variant policy + negative matrix |
| E-C07-003 | `mos` non-indicative | subjunctive/imperative realizer | OD-016 for imperative variants | negative subj/imp golds |
| E-C07-004 | `të` subjunctive | VP/TAM + embedding boundary | OD-008 | control/subj complement golds |
| E-C07-005 | `do të` future | TAM + clitic interface | WS06/WS08 dependency | future + clitic cross-golds |
| E-C07-006 | indicative `se/që` | embedding policy | OD-003 | sourced canonical/variant behavior |
| E-C07-007 | finite `të` complement | valency/control + embedding | OD-008 | VV/V2V subject/control tests |
| E-C07-008 | declined RP case/head agreement | WS10 RP + relative assembler | OD-004/005 | case/gender/number relative matrix |
| E-C07-009 | spoken invariant `që` strategy | relative strategy | OD-004/005 | register/role policy |
| E-C07-010 | weak-pronoun placement | WS06; clause consumes | OD-016 | clitic × TAM × clause-kind matrix |
| E-C07-011 | object-clitic doubling/obligation | WS06/WS09 | cross-workstream | V2/V3 clause regression |
| E-C07-012 | direct Q marker + wh case | question assembler + nominal IP | OD-001/002 | direct Q golds; embedded separately |
| E-C07-013 | impersonal feminine agreement clue | construction/agreement owner | OD-014 | mapped construction-specific test |
| E-C07-014 | no sufficient focus/scrambling inventory | none until evidence | OD-006 | new sources + minimal pairs before implementation |
| E-C07-015 | no embedded-Q rule found | none until evidence | OD-001/002 | new Albanian evidence |

## Evidence registration rule

When new linguistic material is supplied, do not merely edit prose. Add a new `E-C07-XXX` row containing:

```yaml
evidence:
  id: E-C07-XXX
  source_file: ...
  source_section: ...
  dialect/register: Standard|Tosk|Geg|mixed|unknown
  claim: ...
  limitations: ...
  affected_functions: []
  affected_open_decisions: []
  tests_required: []
```

If two sources disagree, record both and the scope difference; do not silently reconcile them.
