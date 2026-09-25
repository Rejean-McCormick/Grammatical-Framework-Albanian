# Anti-Drift Rules — Clause Syntax v2

## 1. Non-negotiable invariants

1. The locked Albanian source, not memory, is the implementation baseline.
2. Compilation is structural evidence, not linguistic certification.
3. English is a coverage/maturity benchmark, not a surface template.
4. Model-language majority does not establish Albanian grammar.
5. Ordinary finite clause assembly has one authoritative owner.
6. `c2`, agreement, clitic, TAM and complement metadata survive until their final consumer.
7. DRAFT-MAX is mined incrementally, never activated as a bundle.
8. Every changed output has a traceable evidence/decision status.
9. Every open decision remains open in code; no convenient default may masquerade as a linguistic conclusion.
10. The green integration baseline remains recoverable.

## 2. Prohibited shortcuts

### “Question = prefix `a` everywhere”

`a` is supported for direct yes/no questions. It is not yet evidence for embedded polar questions.

### “Relative = `që` everywhere”

The references establish both invariant `që` and declined `cili/e`. Role/case/head agreement cannot be erased prematurely.

### “Embedded question = direct QS”

Current `EmbedQS = identity` is an implementation fact, not an established Albanian rule.

### “Flexible order = free scrambling”

Neutral SVO + unspecified flexibility does not justify arbitrary constituent permutations.

### `defaultAgr` as semantic substitute

A fallback agreement value cannot replace missing control/expletive/head agreement information. E-C07-013 specifically warns against universal masculine defaulting.

### Clause-level clitic reconstruction

Do not build `ta`, `t'i`, dative+accusative clusters, etc. in question/relative/sentence constructors.

### Clause-level TAM reconstruction

Do not independently re-create future, anteriority or subjunctive morphology in each public module.

### Surface-string movement/repair

Do not linearize a clause and then search/move/strip tokens to obtain a question, relative, focus order or clitic position.

### Silent `variants`

Do not add GF `variants` just to make more strings parse or to avoid choosing a policy. Every alternative must have a documented grammatical status and ambiguity impact.

### Test weakening

Do not delete/replace failing cases or golds to recover green status.

## 3. Mandatory traceability

Every behavior-changing patch must link:

```text
abstract function(s)
  ↔ current code site(s)
  ↔ evidence ID or open decision
  ↔ target owner/helper
  ↔ focused tests
  ↔ Wordbench result
  ↔ linguistic review/gold status
```

If any link is missing, the patch may be experimental but is not final.

## 4. Type-expansion gate

No new clause parameter/field/category dimension is allowed unless the change record provides:

- distinct Albanian values;
- producer for each value;
- consumer for each value;
- failure of the current representation to preserve the distinction;
- contrastive tests;
- migration impact.

“Other RGLs do it” does not satisfy the gate.

## 5. Change-size rule

Prefer one grammatical family per patch. Examples:

- direct polar-question centralization;
- `se/që` embedding policy;
- prepositional-relative strategy;
- agreement fallback correction.

Do not combine a category migration, focus system, complementizer redesign and relative rewrite unless a single representation invariant genuinely requires them together.

## 6. Documentation synchronization

A patch that changes clause behavior must update at minimum:

- `04_FUNCTIONAL_COVERAGE_MATRIX.md`;
- `13_CURRENT_IMPLEMENTATION_AUDIT.md` if ownership/sites changed;
- `14_EVIDENCE_TRACEABILITY_MATRIX.md`;
- `10_OPEN_DECISIONS.md` if a decision closes/changes;
- `18_CERTIFICATION_DASHBOARD.md`;
- a `11_CHANGE_RECORD_TEMPLATE.md` instance.

## 7. Rollback triggers

Rollback or split the patch if:

- unrelated gold outputs change;
- c2/government disappears;
- a clitic/TAM rule is duplicated at clause level;
- a new field has no complete producer/consumer path;
- an open decision becomes encoded without evidence;
- compile/scenario census regresses without intentional target change;
- parser ambiguity or table size grows materially without an explained benefit;
- source and documentation no longer describe the same architecture.
