# Public API completion plan

## Goal

Make the Albanian public API behaviorally trustworthy and source-compatible for application authors, not merely compilable.

The normative static comparison is in `19_PUBLIC_API_EXPORT_MATRIX.md`; compatibility rules are in `20_API_COMPATIBILITY_CONTRACT.md`.

## Current facade assessment

| Facade | Static composition | C9 status | Required closure action |
|---|---|---|---|
| `SyntaxSqi` | mirrors mature composition pattern | `implemented` | facade-only construction smoke suite |
| `ConstructorsSqi` | generic Constructors + `GrammarSqi` | `implemented` | verify all intended generic constructors remain usable |
| `CombinatorsSqi` | generic Combinators; no Albanian override | `needs_review` | prove generic `appCN/appCNc` semantics or add Albanian-specific override for demonstrated need |
| `TrySqi` | Syntax + Lexicon + reduced Paradigms; no English-style overload block | `needs_review` | export/collision census, ergonomic overload decision, compatibility tests |
| `SymbolicSqi` | Symbolic + SymbolSqi + GrammarSqi | `implemented` | numeric/symbolic facade smoke suite |
| `BrowseSqi` | absent | `needs_review/tooling_optional` | explicit release-scope decision; do not hide inside another facade |

## Required work

### Syntax / Constructors

- compile a grammar that imports only `SyntaxSqi`;
- construct NP, VP, Cl/S, QS, relatives, coordination and advanced terms without opening `ResSqi`;
- verify no facade-specific patch compensates for an owner-module defect.

### Combinators

English overrides `appCN/appCNc`; Albanian currently uses generic behavior. The decision must be empirical:

1. define representative Albanian relational/possessive CN use cases;
2. test generic behavior;
3. only specialize if the generic result is wrong or materially unusable;
4. if specialized, preserve the public type/signature and record compatibility impact.

### Try

`TrySqi` is the highest API-drift risk. Before editing:

- generate a name/export census from the exact active RGL;
- record excluded `ParadigmsSqi` names;
- detect collisions among Syntax/Lexicon/Paradigms;
- design safe overloads with examples;
- test old accepted Try expressions plus new ergonomic cases;
- reject changes that merely imitate English overloads without Albanian benefit.

### Symbolic

Test numeric/symbolic PN/NP constructions and mixed symbolic grammar through `SymbolicSqi`, including case/agreement propagation.

## API done criteria

- every facade has a row in the API matrix and a documented disposition;
- facade-only smoke grammars compile under GF 3.12;
- `TrySqi` has a versioned export/collision register;
- `CombinatorsSqi` has a documented generic-vs-specialized decision;
- no common application-level construction requires internal `ResSqi` access;
- compatibility contract in `20_API_COMPATIBILITY_CONTRACT.md` is satisfied.
