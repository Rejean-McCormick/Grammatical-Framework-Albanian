# C07 final test matrix

The original 52 scenarios remain required. `alb-clause-final` is additive and optional until a fresh GF 3.12 run proves it executable.

| Case | Phenomenon | Expected status before linguistic review |
|---|---|---|
| C7F001 | neutral declarative SVO | certification candidate |
| C7F002 | negative declarative | certification candidate |
| C7F003 | negative future | certification candidate |
| C7F004 | direct polar `a` | certification candidate |
| C7F005 | wh subject | certification candidate |
| C7F006 | wh object | certification candidate |
| C7F007 | wh oblique with preposition/case | certification candidate |
| C7F008 | relative subject | certification candidate |
| C7F009 | relative object | certification candidate |
| C7F010 | subordinate adverbial clause | certification candidate |
| C7F011 | indicative sentential complement | certification candidate |
| C7F012 | AP + sentential SC, one embedding marker | regression repair candidate |
| C7F013 | AP + VP/subjunctive SC, no forced indicative marker | regression repair candidate |
| C7F014 | clausal subject + adjectival predicate agreement | linguistic correction candidate |
| C7F015 | prepositional relative | **review-only / representation blocker** |
| C7F016 | embedded polar question | **review-only / evidence-open** |
| C7F017 | embedded wh question | **review-only / evidence-open** |
| C7F018 | neutral postverbal adverb placement | **review-only / broader ordering evidence needed** |

## Gold policy

No new `.gold` file is created by this patch. Compilation/execution is not linguistic certification. Promote C7F001–C7F014 only after output review against the supplied Albanian references. Keep C7F015–C7F018 out of gold certification until their corresponding open decisions are closed.


## Wordbench contract validation

Wordbench 1.3.4 directly validated the registered scenario contracts for **53/53 scripts**: the 52 required baseline scenarios plus optional `alb-clause-final`. All referenced input SHA-256 locks and expected marker sections are valid. This proves the profile/scenario metadata added by C07 is internally coherent; it is **not** a substitute for GF scenario execution.

The full Wordbench `project check --strict` currently stops before execution because the supplied project baseline lacks 18 documentation/authority assets expected by Wordbench 1.3.4. The untouched baseline and C07 candidate produce the same 18 diagnostics, so this is recorded as a pre-existing packaging limitation, not a C07 regression.
