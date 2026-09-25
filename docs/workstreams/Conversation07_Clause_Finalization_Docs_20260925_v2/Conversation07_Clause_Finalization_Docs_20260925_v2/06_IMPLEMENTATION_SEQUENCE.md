# Implementation Sequence — Green-Baseline-Preserving Clause Finalization v2

## Core rule

Each phase is a mergeable slice. A later phase does not justify skipping an earlier evidence or architecture gate. DRAFT-MAX material may be mined for individual ideas only after the same gates.

## Phase 0 — Freeze, inventory, classify — DOCUMENTED

**Artifacts:** `01`, `13`, `14`, `15`, `17`.  
**Goal:** know every current clause assembly site before moving code.

Exit conditions:

- source hashes recorded;
- 41 core functions inventoried;
- clause-level extension assemblers inventoried;
- evidence gaps/open decisions explicit;
- green baseline identity recorded.

No source code change belongs to Phase 0.

## Phase 1 — Canonicalize ordinary declarative assembly

**Primary files:** `ClauseSqiRes.gf`, `SentenceSqi.gf`, selected `ConstructionSqi`/`IdiomSqi` helpers.  
**Goal:** remove duplicate ordinary finite SVO assembly without changing lincats.

Tasks:

1. define thin resource helpers where multiple modules currently build equivalent ordinary finite clauses;
2. keep `PredVP`, `SlashVP`, ordinary construction predication on the same finite path;
3. audit every use of `defaultAgr` and classify it as justified/open/specialist;
4. preserve `c2` and VP metadata;
5. do not change output unless a change record cites evidence.

Exit gate: focused compile + full `58/58`/`52/52` floor + unchanged accepted outputs.

## Phase 2 — Embedding and subordination

**Primary sites:** `EmbedS`, `EmbedVP`, `SlashVS`, `ComplVS`, `SlashV2S`, `sc_CompS`, `sc_CompVP`, `SSubjS`.  
**Goal:** centralize embedding wrappers and distinguish indicative vs subjunctive complement types without inventing lexical selection rules.

Tasks:

- preserve `të`-subjunctive architecture;
- make hardcoded `që` sites explicit members of one complementizer policy;
- leave `se/që` selection open until evidence closes OD-C07-003;
- coordinate `EmbedVP`/control with WS09;
- add tests for negative and anterior subjunctive complements.

## Phase 3 — Direct questions

**Primary files:** `QuestionSqi.gf`, shared clause resource, extension question helpers.  
**Goal:** make direct polar and wh realizations use named shared helpers while preserving Albanian case/government.

Required coverage:

- polar positive/negative across TAM;
- wh subject/object/oblique;
- copular interrogatives;
- multiple-wh/QVP constructors;
- clitic interactions.

Do **not** add `QForm` solely because model languages use one.

## Phase 4 — Embedded questions

Entry gate: OD-C07-001/002 has Albanian evidence or is explicitly deferred.  
**Goal:** stop `EmbedQS`/`ComplVQ` from silently assuming direct=embedded if the evidence says otherwise.

If evidence shows no contrast, document that and retain the simpler shape. If it shows a contrast, introduce the smallest typed distinction with producer/consumer migration tests.

## Phase 5 — Relative architecture

**Primary files:** `RelativeSqi.gf`, nominal relative resources, extension relative helpers.  
**Goal:** unify subject/object/prepositional relative formation and strategy selection.

Required work:

- test declined `cili/e` role case + head agreement;
- test invariant `që` strategy;
- test prepositional relatives;
- classify or remove uncertified stranding paths only with evidence;
- coordinate with WS10 for the relative-pronoun paradigm.

## Phase 6 — Sentence modifiers and subordinate order

**Primary sites:** `AdvS`, `ExtAdvS`, `SSubjS`, `RelS`, adverbial/subordinator helpers.  
**Goal:** preserve currently valid simple order while identifying any placement/scope contrasts that require structure.

Do not introduce generic slots until a specific Albanian contrast satisfies EP005/EP010 applicability gates.

## Phase 7 — Clause-level extensions and constructions

Use `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md` as the checklist. Reconcile:

- VPS/VPI clause outputs;
- pied-piping/stranding/empty relatives;
- focus/fronting functions;
- existentials/clefts/impersonals;
- construction questions;
- fragments and direct speech.

Each path becomes canonical delegation, a documented specialist, or explicit deferred/N/A.

## Phase 8 — Information structure/order (evidence-gated)

Entry gate: OD-C07-006 has sufficient Albanian evidence.  
Only then decide whether:

- helper-level deterministic ordering is enough;
- a typed `ClauseOrder` is required;
- named clause slots are required;
- `Foc*`/fronting constructors have distinct Albanian realizations.

No “future flexibility” fields are allowed.

## Phase 9 — Typed category migration, only if required

Potential examples: `QForm`, `ClauseOrder`, richer `SC`, richer `QS`/`QCl`.  
Entry gate: a certified contrast is impossible to preserve with current types.

Migration protocol:

1. decision record;
2. producer/consumer graph;
3. minimal type change;
4. update all producers;
5. update all final consumers;
6. focused compile;
7. full integration run;
8. behavior/gold review.

## Phase 10 — Linguistic certification

- review all clause-relevant existing CASEs;
- add missing contrastive cases;
- assign `valid / valid_variant / questionable / invalid`;
- fix systematic invalid families at their owner;
- promote accepted outputs to gold;
- run parse/linearization checks where supported;
- update `18_CERTIFICATION_DASHBOARD.md`.

## Rollback rule

Rollback to the last green slice if a patch:

- loses `c2`/agreement/clitic/TAM metadata;
- broadens lincats without the recorded contrast;
- makes scenario/gold output changes unrelated to the patch;
- creates unexplained parse ambiguity/performance growth;
- cannot identify the Albanian evidence for changed generation.
