# Albanian linguistic evidence ledger

**Status:** source-derived claims from the supplied `Albanian_ref(6).zip`. Model languages cannot override this ledger.

## Evidence records

| ID | Claim supported by supplied references | Stable locator | Primary design consumer |
|---|---|---|---|
| `VE-PRES-01` | Standard Albanian has active and non-active present morphology | `Lesson_20.html`, Grammar §9.2–9.3 | simple finite morphology / `MorphVoice` |
| `VE-IMPF-01` | imperfect is a distinct finite past series | `Lesson_20.html`, Grammar §10 | simple finite morphology; VQ-001 |
| `VE-PART-01` | participles are productive verbal forms used in compound constructions | `Lesson_20.html`, Grammar §11 | participle ownership |
| `VE-PERF-01` | active present perfect uses finite `kam` + participle | `Lesson_20.html`, Grammar §12.1–12.2 | `VR-PRES-ANT-ACT` |
| `VE-SUBJ-01` | finite subjunctive complementation uses `të`; weak-pronoun combinations with `të` have dedicated behavior | `Lesson_30.html`, Grammar §14.2 and §17.4 | embedded realizer / clitic slot |
| `VE-FUT-01` | Tosk/Standard future uses invariant `do` + present subjunctive (`do të ...`) | `Lesson_30.html`, Grammar §19.1; `Albanian_Complete_Grammar.html`, morphosyntactic variation | `VR-FUT-SIM-*` |
| `VE-FUT-02` | future perfect uses `do` + `të` + perfect-subjunctive strategy | `Lesson_30.html`, Grammar §19.2 | `VR-FUT-ANT-*` |
| `VE-COND-01` | present/past conditional are dedicated `do + të` constructions | `Lesson_30.html`, Grammar §20.1–20.2 | `VR-COND-*` |
| `VE-AOR-01` | past definite/aorist is a distinct finite series | `Lesson_40.html`, Grammar §21 | simple finite morphology; VQ-001 |
| `VE-PAST-01` | pluperfect and past perfect are distinct past-anterior constructions; `kisha + participle` and `pata + participle` are described separately | `Lesson_40.html`, Grammar §22.1–22.2 | VQ-002 / Albanian extension |
| `VE-NA-01` | non-active has present-stem forms, aorist-stem forms including `u`, and compound forms | `Lesson_40.html`, Grammar §23.1–23.3 | `MorphVoice`, `VR-NA-*` |
| `VE-NA-02` | compound non-active uses `jam` where active compound uses `kam` | `Lesson_40.html`, Grammar §23.3 | auxiliary selection |
| `VE-NF-01` | Tosk/Standard Albanian has participial formations including `për të + participle` and gerundive `duke + participle`; Geg infinitive is a dialect boundary | `Lesson_40.html`, Grammar §24.1–24.3; `Albanian_Complete_Grammar.html` | non-finite extension API |
| `VE-IMP-01` | imperative has dedicated 2sg/2pl morphology; negative imperative uses `mos` | `Lesson_50.html`, Grammar §26–26.2 | imperative realizer |
| `VE-OPT-01` | optative is a distinct mood; perfect optative uses optative `kam` or `jam` if non-active + participle | `Lesson_50.html`, Grammar §27.1–27.3 | `VX-OPTATIVE` |
| `VE-ADM-01` | admirative is distinct; present/imperfect and compound admiratives are described; compound auxiliary is `kam` or `jam` if non-active | `Lesson_50.html`, Grammar §28.1–28.4 | `VX-ADMIRATIVE` |
| `VE-PROG-01` | present progressive `po + finite` is directly described; supplied lesson text also contains imperfect progressive `po vinte` | `Albanian_Complete_Grammar.html`; `Lesson_20.html` lesson text | `VX-PROGRESSIVE`; VQ-003 |
| `VE-DIALECT-01` | Tosk future uses `do të`; Geg future uses `kam me + infinitive`, and Tosk lacks the older infinitive preserved in Geg | `Albanian_Complete_Grammar.html`; `Lesson_30.html` §19.3 | Standard/Tosk scope boundary |

## Evidence interpretation rules

1. A source attesting one example does not automatically license an entire combinatorial matrix.
2. A description of morphological non-active does not prove that every semantic passive/reflexive maps to the same form.
3. Dialectal Geg evidence must not silently enter the Standard/Tosk concrete syntax.
4. Section-level evidence is sufficient for design planning; a gold-changing narrow ordering claim must cite the closest heading/example available.
5. Any conflict among supplied Albanian references is recorded as an OPEN question before code changes.

## Current evidence gaps

The supplied references do not yet close:

- the common-RGL default choice for `TPast + ASimul`;
- which Albanian past-anterior series should be the common default;
- the full `po` compatibility matrix outside directly attested environments;
- generic `PassV2` mapping across all TAM cells;
- reciprocal realization;
- complete clitic/particle ordering in every negative future/conditional/non-active/imperative combination;
- final public API shape for optative/admirative and Tosk non-finite constructions.

These gaps map to `VQ-*` records in `06_DECISIONS_AND_OPEN_QUESTIONS.md`.
