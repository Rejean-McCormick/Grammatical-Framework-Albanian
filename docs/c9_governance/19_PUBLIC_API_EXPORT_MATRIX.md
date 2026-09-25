# Public API export/composition matrix

This is a **static source-composition audit**. A resolved GF export-name census is still required for Try/collision-sensitive closure.

| API ID | Surface | English supplied reference | Albanian current composition | Status | Required proof |
|---|---|---|---|---|---|
| `C9-API-SYN-001` | Syntax | `ConstructorsEng, CatEng, StructuralEng, CombinatorsEng` | `ConstructorsSqi, CatSqi, StructuralSqi, CombinatorsSqi` | implemented_not_run | `validation/c9/api` facade-only smoke |
| `C9-API-CON-001` | Constructors | generic `Constructors` with `GrammarEng` | generic `Constructors` with `GrammarSqi` | implemented_not_run | `validation/c9/api` representative constructor calls |
| `C9-API-CMB-001` | Combinators base | English specializes generic Combinators | Albanian now specializes generic Combinators with `NounSqi` | implemented_not_run | focused facade smoke + full regression |
| `C9-API-CMB-002` | `appCN` | English overrides with possessive CN strategy | Albanian override uses `mkNP the_Art (PossNP cn x)` | implemented_not_run | `T-C9-API-COMBINATORS` |
| `C9-API-CMB-003` | `appCNc` | English overrides coordinated possessor strategy | Albanian override coordinates possessor NP then routes through `PossNP` | implemented_not_run | `T-C9-API-COMBINATORS` |
| `C9-API-TRY-001` | Try composition | Syntax + Lexicon + reduced Paradigms | Syntax + Lexicon + reduced Paradigms + safe overload block | implemented_not_run | resolved export/collision smoke |
| `C9-API-TRY-002` | `mkAdv` convenience overload | English defines explicit overload | Albanian adds `Str -> Adv` beside Syntax overloads | implemented_not_run | `T-C9-API-TRY` |
| `C9-API-TRY-003` | `mkAdN` convenience overload | English combines Syntax `CAdv -> AdN` and string paradigm | Albanian now exposes both overloads | implemented_not_run | `T-C9-API-TRY` |
| `C9-API-TRY-004` | `mkOrd` convenience overload | English adds `Str -> Ord` | Albanian adds `Str -> Ord` beside Syntax overloads | implemented_not_run | `T-C9-API-TRY` |
| `C9-API-TRY-005` | additional Albanian exclusions | English excludes a smaller low-level set | Albanian retains `mkCard,mkDet,mkIAdv,mkIDet,mkIP,mkPConj,mkQuant,mkVoc` exclusions intentionally | intentional_policy_not_run | duplicate/low-level/case-erasure rationale + smoke |
| `C9-API-SYM-001` | Symbolic | Symbolic + SymbolEng + GrammarEng | Symbolic + SymbolSqi + GrammarSqi | implemented_not_run | public API + release-surface smoke |
| `C9-API-BRW-001` | Browse | `BrowseEng` exists | no `BrowseSqi` | out_of_common_scope | C9-DEC-017 / GLOB-022 |

## Assembly surfaces

| API ID | Surface | Albanian current role | Closure requirement |
|---|---|---|---|
| `C9-API-ASM-001` | `GrammarSqi` | core grammar composition | source composition accepted; exact-current compile/full regression pending |
| `C9-API-ASM-002` | `LangSqi` | Grammar + Lexicon + Construction + Documentation + Markup | composition accepted; Documentation change requires exact-current compile |
| `C9-API-ASM-003` | `AllSqi` | Lang + Extend + Irreg, opening Extra | intended composition accepted; namespace/full regression pending |

## GF-resolved export census requirement

Before finalizing Try/API ergonomics, capture from the **exact active RGL/GF 3.12 environment** a reproducible export/name census for:

- `SyntaxSqi`;
- `ConstructorsSqi`;
- `CombinatorsSqi`;
- `TrySqi`;
- `SymbolicSqi`.

Static source comparison cannot fully prove overload/name-resolution behavior. The candidate now contains the facade-only smoke suite, but it has not executed. Until the exact GF 3.12 export census and smoke run succeed, all candidate API rows remain execution-uncertified (`*_not_run`).
