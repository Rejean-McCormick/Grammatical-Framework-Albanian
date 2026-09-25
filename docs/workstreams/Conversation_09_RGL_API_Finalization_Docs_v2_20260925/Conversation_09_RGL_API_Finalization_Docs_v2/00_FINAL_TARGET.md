# Final target — Albanian RGL advanced coverage + public API

**Document status:** normative target for Conversation 9  
**Pack version:** 2.0  
**Principle:** English-equivalent maturity means equivalent usable capability where relevant, never English-shaped Albanian.

## 1. Product-level outcome

The final Albanian RGL must let an application author select `Sqi` with the practical expectations attached to a mature RGL language: stable grammar contracts, certified closed-class vocabulary, advanced constructions, usable public facades, symbol/markup/documentation support, predictable parse/linearization behavior, and regression-backed linguistic quality.

The release target is **functional parity with the common/mature RGL surface plus justified Albanian-specific capability**. File-count symmetry, source-code symmetry and English word-order symmetry are explicitly out of scope.

## 2. Surfaces that must be closed

The final release must account for all of these surfaces:

1. **core owners used by C9** — `CatSqi`, `ResSqi`, Noun/Verb/Clause/Adjective/Relative/etc. whenever advanced features expose a defect there;
2. **Structural** — every common `Structural` function, including government/valency and closed-class semantics;
3. **Construction** — high-level constructions that C9 depends on;
4. **Extend** — every common `Extend` function, including retained defaults;
5. **Extra compatibility** — common `Extra` plus any explicitly justified Albanian additions;
6. **assembly** — `GrammarSqi`, `LangSqi`, `AllSqi`;
7. **public API** — `SyntaxSqi`, `ConstructorsSqi`, `CombinatorsSqi`, `TrySqi`, `SymbolicSqi` and an explicit decision on `BrowseSqi`;
8. **release surfaces** — `DocumentationSqi`, `SymbolSqi`, `MarkupSqi`;
9. **English-only/tooling/compatibility surface review** — every mature-English extra module receives a disposition rather than being silently ignored;
10. **validation** — focused scenarios, linguistic evidence and accepted gold protection.

## 3. Stable final statuses

For every function/capability row, final coverage must be one of:

- `implemented` — Albanian owns a suitable implementation;
- `equivalent` — inherited/shared behavior is demonstrated suitable for Albanian;
- `neutralized_equivalent` — the common abstract distinction exists, but Albanian does not grammatically distinguish it in the same way; the required contract is satisfied by a documented, tested Albanian neutralization/equivalence;
- `out_of_common_scope` — only for English-specific/tooling surfaces that are **not** part of the common contract, with an explicit disposition.

Development-only statuses `partial`, `missing`, `needs_review`, `version_blocked` and `evidence_blocked` cannot remain unexplained at closure.

> A function in a common abstract is never “not applicable” in the sense of being omitted. The concrete must still satisfy the abstract. Linguistic non-applicability can only justify a **neutralized equivalent realization**, not a missing contract.

## 4. Final certification outcome

A function is not complete merely because it exists. The release target requires the relevant progression:

`structural_green → scenario_checked → linguistic_reviewed → gold_certified → regression_certified`

Not every mechanically trivial Markup/Symbol row requires a separate linguistic gold, but every output-sensitive/high-risk family must have explicit review evidence and regression coverage.

## 5. Final release invariants

Conversation 9 closes only when:

- the exact active RGL revision is locked or all version-sensitive rows remain explicitly blocked;
- the parity matrix has no unexplained common-RGL `missing`/`partial` rows;
- retained `ExtendFunctor` defaults are explicitly promoted to `equivalent`/`neutralized_equivalent` or replaced;
- Structural government/valency-bearing items have reviewed tests;
- `CombinatorsSqi` and `TrySqi` have an explicit API compatibility decision;
- facade-only smoke grammars exercise the public API without internal `ResSqi` access;
- Documentation/Symbol/Markup match current rich category contracts;
- full Wordbench remains at least 58/58 + 52/52 unless the census/scenario count intentionally grows;
- accepted golds do not regress without an evidence-backed decision;
- all open release-blocking decisions are closed or formally deferred with a declared scope limitation;
- known non-certified behavior is listed, not hidden.

## 6. Definition of “equivalent to English”

English is the **coverage and maturity benchmark**. Albanian linguistic references determine Albanian realization. Typologically relevant languages may support architectural choices only after subsystem compatibility is shown.

The desired final state is therefore not “English translated into Albanian”; it is **an Albanian RGL whose user-facing capability, auditability, stability and test maturity are comparable to English for the linguistically relevant RGL surface**.
