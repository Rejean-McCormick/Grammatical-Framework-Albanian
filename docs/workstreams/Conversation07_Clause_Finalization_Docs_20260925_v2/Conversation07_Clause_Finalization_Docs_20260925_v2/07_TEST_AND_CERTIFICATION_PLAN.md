# Test and Certification Plan — Clause Syntax v2

## 1. Locked integration floor

The roadmap documents GF 3.12 / Wordbench 1.3.4 with `58/58` GF targets and `52/52` scenarios. The supplied scenario corpus contains **569 CASE markers**.

Conversation 7 currently touches or depends strongly on this working subset: **240 CASEs across 24 scenarios**.

| Scenario | CASEs | First CASE | Last CASE |
| --- | --- | --- | --- |
| `alb-syntax-basic.gfs` | 10 | C0251 I come | C0260 I am ready |
| `alb-syntax-v2.gfs` | 10 | C0261 read_V2 object 1 | C0270 close_V2 object 10 |
| `alb-syntax-v3.gfs` | 10 | C0271 give book to him | C0280 negative give |
| `alb-syntax-complements-a.gfs` | 10 | C0281 say that she comes | C0290 know wh embedded |
| `alb-syntax-complements-b.gfs` | 10 | C0291 answer him that she comes | C0300 past answer |
| `alb-syntax-copular.gfs` | 10 | C0301 he good | C0310 past doctor |
| `alb-syntax-adverbial.gfs` | 10 | C0311 come in house | C0320 past come with her |
| `alb-syntax-coordination.gfs` | 10 | C0321 S and S | C0330 CN adjective |
| `alb-clitic-objects.gfs` | 10 | C0331 love object 1 | C0340 love object 10 |
| `alb-clitic-negative.gfs` | 10 | C0341 negative love object 1 | C0350 negative love object 10 |
| `alb-clitic-ditransitive.gfs` | 10 | C0351 give it to him | C0360 negative past sell it him |
| `alb-clitic-vp.gfs` | 10 | C0361 reflexive love | C0370 negative progressive |
| `alb-complement-control.gfs` | 10 | C0371 want come | C0380 beg him come |
| `alb-question-yesno.gfs` | 10 | C0381 does she come | C0390 does John live |
| `alb-question-wh.gfs` | 10 | C0391 who comes | C0400 which city exists |
| `alb-relative-subject.gfs` | 10 | C0401 who comes | C0410 who is in city |
| `alb-relative-object.gfs` | 10 | C0411 whom I love | C0420 friend whom we love |
| `alb-subordination.gfs` | 10 | C0421 when she comes I live | C0430 conditional main with if |
| `alb-cross-01.gfs` | 10 | C0471 past negative love him | C0480 past paint it red |
| `alb-cross-02.gfs` | 10 | C0481 past wh who came | C0490 friend we will love relative |
| `alb-cross-03.gfs` | 10 | C0491 if she comes we will go | C0500 the man who loves her comes |
| `alb-construction-01.gfs` | 10 | C0451 exist house | C0460 predet only him |
| `alb-construction-02.gfs` | 10 | C0461 mass beer | C0470 every city |
| `alb-names-preps.gfs` | 10 | C0431 John nom | C0440 without him |

These are regression assets, not automatically gold-certified outputs.

## 2. Certification ladder

### C0 — source/static

- source-lock matches;
- no accidental edits outside declared scope;
- helper/category contracts are syntactically coherent;
- documentation matrices updated.

### C1 — focused GF compile

Compile every modified module and its immediate high-value consumers. No claim of linguistic correctness.

### C2 — full structural integration

- expected census ≥ baseline (`58/58` unless intentionally expanded);
- structural lock warnings `0`;
- required scenarios `52/52` or larger if additive;
- API facades + Dict/MorphoDict remain included.

### C3 — targeted behavioral review

For every changed constructor family, record before/after output and expected invariants. A scenario that merely executes is insufficient if its output was not examined.

### C4 — linguistic review

Each changed/added CASE receives `valid`, `valid_variant`, `questionable`, or `invalid`, with evidence IDs/source locations. Systematic invalid families are fixed at the owning boundary.

### C5 — gold regression

Only reviewed outputs become gold. Gold changes require a correction rationale; grammar is never distorted to preserve a wrong gold.

### C6 — parse/generation quality

Where the grammar is used bidirectionally:

- parse the intended certified surface where feasible;
- linearize the intended tree;
- record unwanted competing parses/linearizations if material;
- check that variants/order dimensions do not cause uncontrolled ambiguity;
- compare compile/runtime/PGF size when representation changes materially increase tables or alternatives.

## 3. Required new scenario families

### Declarative and agreement

- positive/negative × Pres/Past/Fut/Cond × Simul/Anter representative matrix;
- lexical NP and pronoun subjects;
- clausal/sentential subject constructions;
- explicit test motivated by E-C07-013 so `defaultAgr` is not silently universal.

### Negation

- indicative `nuk` baseline;
- `s'` only after OD-C07-013 policy closes;
- negative subjunctive `të mos`;
- negative singular/plural imperative with object clitics;
- negative future/conditional + clitic.

### Polar questions

- `a` + positive/negative;
- `a` + present/past/future/conditional;
- `a` + clitic object/ditransitive;
- embedded polar question after OD-C07-001 closes.

### Wh questions

- subject `kush`;
- object governed case;
- prepositional `me kë`-type;
- where/why/when;
- copular IComp;
- multi-wh/QVP;
- embedded wh after OD-C07-002 closes.

### Relative clauses

- subject/object with masculine/feminine and singular/plural heads;
- declined relative pronoun case cells used in real clauses;
- invariant `që` strategy;
- prepositional relatives with governed case;
- negative/TAM relatives;
- extension pied-pipe/empty strategies only if certified;
- no stranding gold until OD-C07-015 is closed.

### Sentential complements/subordination

- `VS` indicative complement;
- `VQ` embedded question;
- `VV/V2V` subjunctive/control;
- `se/që` policy once closed;
- `if/when/because/although` with TAM/polarity interaction;
- overt embedded subject + `të` pattern if mapped to an RGL constructor.

### Order/focus/topic

No new gold for marked order until OD-C07-006 has evidence. When it closes, every proposed order requires a minimal pair showing grammatical/discourse contrast.

## 4. Cross-workstream interaction matrix

Every clause patch that touches the relevant boundary should sample:

| Dimension | Minimum interaction |
|---|---|
| TAM | Pres, Past, Fut, Cond; anteriority where implemented |
| polarity | positive + negative; `mos` contexts separately |
| clitics | Acc, Dat, Acc+Dat representative cases |
| voice | active plus certified passive/non-active path |
| valency | V, V2, V3, VS, VQ, VV and one slash family where relevant |
| subject | lexical NP, pronoun, person/number contrasts; clausal subject if applicable |
| clause kind | declarative, question, relative, embedded where applicable |

## 5. Anti-test-gaming rules

- Do not replace a failing linguistic CASE with an easier tree.
- Do not update a gold merely to match new output.
- Do not treat empty output as pass.
- Do not add a placeholder to bypass a real clause defect.
- Do not remove a required scenario to restore `52/52`.
- Do not assert parse support because generation succeeds.
- Do not assert a variant is “accepted” without explicit review status.

## 6. Performance/ambiguity gate

Required only when a patch introduces new table dimensions, broad `variants`, or large alternative order spaces. Record before/after:

- GF compile success and any material compile-time change;
- PGF/artifact size when available;
- number of linearizations for selected trees;
- parse count for selected certified strings;
- any new ambiguity family that could affect practical use.

No fixed numeric budget is invented in this package; establish one from measured baseline before enforcing thresholds.

## 7. Exit test report

Every phase handoff reports:

```yaml
clause_test_report:
  source_lock: ...
  gf_version: 3.12
  wordbench_version: 1.3.4
  census: ...
  lock_warnings: ...
  required_scenarios: ...
  clause_cases_executed: ...
  clause_cases_reviewed: ...
  valid: ...
  valid_variant: ...
  questionable: ...
  invalid: ...
  golds_added: []
  golds_changed: []
  parse_checks: ...
  ambiguity_notes: []
  performance_notes: []
  open_decisions: []
```
