# Conversation 9 closure checklist

Mark an item complete only with linked evidence. This checklist is the final release gate, not a planning wish list.

## A. Identity and provenance

- [ ] `C9-DEC-001` exact active RGL revision/search path closed.
- [ ] final Albanian source-lock recorded.
- [ ] GF 3.12 and Wordbench version recorded.
- [ ] all source/package hashes current.

## B. Common-contract coverage

- [ ] no unexplained `missing` common-contract rows.
- [ ] no unexplained `partial` common-contract rows.
- [ ] no release-scope `needs_review`/`version_blocked`/`evidence_blocked` rows.
- [ ] every retained ExtendFunctor default explicitly promoted.
- [ ] every neutralized distinction still satisfies the abstract and is tested.

## C. Structural

- [ ] preposition government reviewed.
- [ ] pronoun/interrogative case behavior reviewed.
- [ ] determiners/quantifiers/nyje interactions reviewed.
- [ ] coordination/subordination reviewed.
- [ ] deictic/adverbial inventory reviewed.
- [ ] modal/structural verb complement semantics reviewed.

## D. Extend / Extra

- [ ] genitive family certified.
- [ ] slash relative/question strategy certified.
- [ ] VPS/VPI/VPS2/VPI2 certified for intended Albanian interpretation.
- [ ] existentials certified.
- [ ] focus/fronting disposition certified.
- [ ] voice/participle/passive bridge certified or explicitly blocked by dependency.
- [ ] RNP/reflexive possession certified.
- [ ] Extra contains no unexplained duplicate grammar.

## E. Public API

- [ ] Syntax facade-only smoke passes.
- [ ] Constructors facade-only smoke passes.
- [ ] Combinators generic/specialized decision closed.
- [ ] Try export/collision policy closed and tested.
- [ ] Symbolic facade smoke passes.
- [ ] Browse decision closed.
- [ ] compatibility contract has no unexplained break.

## F. Documentation / Symbol / Markup

- [ ] exact Documentation abstract reconciled.
- [ ] representative inflection tables verified.
- [ ] Symbol case/agreement/list behavior tested.
- [ ] Markup rich-table preservation and nested markup tested.

## G. Linguistic evidence

- [ ] dialect policy closed.
- [ ] all closed linguistic decisions contain exact source locators.
- [ ] high-risk outputs reviewed against evidence.
- [ ] accepted golds identify their evidence/decision context.
- [ ] no placeholder-dependent behavior is linguistically certified.

## H. Regression

- [ ] full GF census ≥ protected 58/58 (or intentionally enlarged and fully green).
- [ ] protected 52/52 scenarios remain green.
- [ ] all new required C9 scenarios green.
- [ ] zero structural lock warnings.
- [ ] accepted golds have no unexplained regressions.

## I. Final reporting

- [ ] final parity counts published.
- [ ] English-only/tooling disposition inventory closed.
- [ ] known limitations listed.
- [ ] external dependencies listed with status.
- [ ] final patch/snapshot/overlay and checksums delivered.
- [ ] documentation reconciled after final run, not before it.
