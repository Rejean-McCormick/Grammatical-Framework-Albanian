# Clause Architecture Contract v2

## 1. Existing architecture to preserve

The current branch already made an important improvement over the supplied upstream Albanian snapshot: `ClauseSqiRes` is a shared resource below `SentenceSqi`, `QuestionSqi`, `RelativeSqi` and several extension helpers. It centralizes:

- `vpFromSlash`, `emptyVP`, `slashFromVP`;
- VP post-material operations;
- clitic-slot updates through `appendClitic`;
- `realizeVP` for public TAM/anteriority/polarity;
- `realizeSubjVP` / `realizeSubjAntVP`;
- `realizeImpVP`;
- gerund/participle realization;
- ordinary `mkClause` subject + finite VP assembly.

This direction is retained. The finalization task is to remove competing ordinary clause assemblers and make specialist boundaries explicit.

## 2. Current category boundary

The locked current lincats are intentionally shallow at clause level:

```gf
S       = {s : Str} ;
QS      = {s : Str} ;
RS      = {s : Agr => Str} ;
Cl      = {s : ParamX.Tense => Anteriority => Polarity => Str} ;
QCl     = {s : ParamX.Tense => Anteriority => Polarity => Str} ;
RCl     = {s : Agr => ParamX.Tense => Anteriority => Polarity => Str} ;
ClSlash = {s : ParamX.Tense => Anteriority => Polarity => Str ; c2 : Compl} ;
```

`VP`/`VPSlash` are richer resource types containing morphology tables plus `cl`, `subjcl`, `post`, and `c2` for slashes.

**v2 rule:** do not enrich clause lincats until a documented Albanian contrast cannot be expressed safely by helper centralization with these types.

## 3. Canonical ownership invariant

Ordinary finite clause realization has one owner: `ClauseSqiRes` (or a future replacement resource introduced by an explicit migration decision).

A public constructor may:

- choose a grammatical context (declarative/question/relative/embedding);
- provide structured constituents;
- preserve slash/government information;
- select a specialized realizer when its domain is genuinely different.

It may not independently reproduce the ordinary matrix of subject + negation + TAM + clitics + verb + complements + postmaterial.

## 4. Conceptual clause plan

The final design should be reasoned about as if it had the following conceptual state, even if Stage A does not materialize it as a GF record:

```text
ClausePlan
  subject: structured surface + agreement
  predicate: VP or VPSlash
  slash/government: optional Compl
  tam: public tense + anteriority
  polarity: requested polarity
  clause_kind: declarative | polar_q | wh_q | relative | embedded | specialist
  interrogative/relative fronted material: structured, case-governed
  sentence-level modifiers: only if their placement remains unresolved
  discourse/order choice: only when independently evidenced
```

The point is ownership, not a requirement to create this exact type.

## 5. Realization layers

### Layer A — morphology / VP

Owns finite verb tables, subjunctive forms, participles, imperative forms, clitic cluster representation, selected complements and VP-internal material.

### Layer B — clause resource

Owns ordinary finite realization: agreement selection, public TAM/anteriority/polarity routing, finite predicate placement, and any clause-order dimension that is eventually proven necessary.

### Layer C — constructor semantics

`SentenceSqi`, `QuestionSqi`, `RelativeSqi` decide which construction is being built and supply the correct structured arguments. They remain thin.

### Layer D — final sentence/utterance

`Use*`, `PhraseSqi`, punctuation and coordination fix remaining public parameters and surface formatting. They must not reconstruct internal syntax.

## 6. Additive-first migration

### Stage A — no lincat migration

First introduce/extend resource helpers that centralize behavior while preserving all current public category shapes. Suitable targets include conceptual operations such as:

- ordinary predication;
- polar-question realization from a `Cl`;
- wh-subject and wh-slash realization;
- relative subject/slash realization;
- indicative/subjunctive embedding wrappers;
- sentence subordination/attachment helpers where order is already known.

Names are not normative; ownership and tests are.

### Stage B — typed enrichment only when forced

A new `Order`, `QForm`, clause slot, embedding mode or richer `SC` is permitted only when a change record proves:

1. at least two Albanian behaviors must remain distinguishable after the current type would collapse them;
2. the distinction has identified producers and consumers;
3. supplied/added Albanian evidence supports it;
4. current callers are inventoried;
5. migration can be tested incrementally;
6. the new dimension is not copied merely because English/Greek/Bulgarian/Romanian uses one.

## 7. Question contract

Direct polar `a` is evidence-backed. What is **not** yet evidence-backed is whether an embedded polar clause has the same form. Therefore:

- direct polar realization may remain a specialized wrapper around a canonical declarative clause;
- embedded-question behavior must not be derived by `EmbedQS = identity` as a linguistic assumption;
- if direct and embedded forms diverge, represent the distinction before final `QS` flattening or by another evidence-backed boundary.

Wh questions must preserve the interrogative constituent's case/government. `PrepIP` and slash `c2` are structural information, not punctuation/string decoration.

## 8. Relative contract

Relative realization must preserve:

- head agreement where the relative strategy needs it;
- grammatical role/case of the relative element;
- slash government until the relative is formed;
- strategy choice (`që`, declined `cili/e`, or another certified form) until enough context exists.

`RelCl`, `RelVP`, `RelSlash`, `IdRP`, and extension relative constructors must not independently encode conflicting strategies.

## 9. Slash invariant

`c2 : Compl` is never dropped or replaced by a default merely to make a constructor compile. Every path from `VPSlash`/`ClSlash` to a question/relative must state whether the complement is:

- saturated;
- pied-piped;
- omitted under a licensed relative strategy;
- or handled by a specialist construction.

The current extension “strand” helpers are **not certified** merely because they exist; see OD-C07-015.

## 10. Polarity invariant

Clause code passes typed polarity to the owner. It does not search a surface string for `nuk`, `mos`, `s'`, or negative lexical items. Non-indicative `mos` remains a mood/contextual decision in the appropriate VP/clause realizer.

## 11. Agreement/default invariant

`defaultAgr` is a technical fallback, not a linguistic category. Any public path that uses it must be audited and either:

- justified as semantically fixed 3SG masculine;
- replaced by construction-specific agreement;
- or kept open pending evidence.

The supplied reference's impersonal clausal-complement example is sufficient to reject a universal “unknown = masculine 3SG” assumption.

## 12. Order invariant

Neutral SVO may be represented by the current assembler. Marked orders require explicit evidence and a named grammatical condition. No constructor may obtain topicalization/focus by moving substrings of a completed clause.

A future `Order` dimension is acceptable only after OD-C07-006/011 is closed with real Albanian contrasts.

## 13. Legitimate specialist realizers

The following domains may remain separate when their contract differs from ordinary finite predication:

- imperatives;
- fragments/utterances;
- direct speech;
- existential/impersonal constructions;
- non-finite/gerund/participial constructions;
- construction-specific lexicalized clauses.

Each specialist must still reuse lower-level TAM/clitic/morphology owners where applicable and appear in `15_EXTEND_CONSTRUCTION_IDIOM_COVERAGE.md`.

## 14. Acceptance test for an architecture change

Before a new field/helper/category is accepted, reviewers must be able to state:

- producer;
- preserved meaning;
- propagation path;
- final consumer;
- Albanian contrast it enables;
- test that fails if it is dropped;
- why the existing simpler architecture cannot express the contrast.
