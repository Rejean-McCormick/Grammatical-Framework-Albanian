# Public API export/composition matrix

This is a **static source-composition audit**. A resolved GF export-name census is still required for Try/collision-sensitive closure.

| API ID | Surface | English supplied reference | Albanian current composition | Status | Required proof |
|---|---|---|---|---|---|
| `C9-API-SYN-001` | Syntax | `ConstructorsEng, CatEng, StructuralEng, CombinatorsEng` | `ConstructorsSqi, CatSqi, StructuralSqi, CombinatorsSqi` | implemented | facade-only smoke |
| `C9-API-CON-001` | Constructors | generic `Constructors` with `GrammarEng` | generic `Constructors` with `GrammarSqi` | implemented | representative generic constructor calls |
| `C9-API-CMB-001` | Combinators base | English specializes generic Combinators | Albanian uses generic Combinators | needs_review | prove generic behavior suitable |
| `C9-API-CMB-002` | `appCN` | English overrides with possessive CN strategy | no Albanian override | needs_review | C9-DEC-015 + semantic tests |
| `C9-API-CMB-003` | `appCNc` | English overrides coordinated possessor strategy | no Albanian override | needs_review | C9-DEC-015 + semantic tests |
| `C9-API-TRY-001` | Try composition | Syntax + Lexicon + reduced Paradigms | Syntax + Lexicon + differently reduced Paradigms | needs_review | resolved export/collision census |
| `C9-API-TRY-002` | `mkAdv` convenience overload | English defines explicit overload | Albanian excludes `ParadigmsSqi.mkAdv`, no replacement overload | needs_review | C9-DEC-016 |
| `C9-API-TRY-003` | `mkAdN` convenience overload | English combines Syntax `CAdv -> AdN` and string paradigm | Albanian excludes `mkAdN`, no replacement overload | needs_review | C9-DEC-016 |
| `C9-API-TRY-004` | `mkOrd` convenience overload | English adds `Str -> Ord` | Albanian excludes `mkOrd`, no replacement overload | needs_review | C9-DEC-016 |
| `C9-API-TRY-005` | additional Albanian exclusions | English excludes `mkAdv,mkAdN,mkOrd,mkQuant,mkVoc` from Paradigms (and Syntax `mkAdN`) | Albanian additionally excludes `mkCard,mkDet,mkIAdv,mkIDet,mkIP,mkPConj` | needs_review | collision rationale per name |
| `C9-API-SYM-001` | Symbolic | Symbolic + SymbolEng + GrammarEng | Symbolic + SymbolSqi + GrammarSqi | implemented | facade smoke + case/agreement tests |
| `C9-API-BRW-001` | Browse | `BrowseEng` exists | no `BrowseSqi` | tooling_optional / needs_review | C9-DEC-017 |

## Assembly surfaces

| API ID | Surface | Albanian current role | Closure requirement |
|---|---|---|---|
| `C9-API-ASM-001` | `GrammarSqi` | core grammar composition | compare included common grammar capabilities against active RGL; no accidental omission |
| `C9-API-ASM-002` | `LangSqi` | Grammar + Lexicon + Construction + Documentation + Markup | verify mature public language surface and start category |
| `C9-API-ASM-003` | `AllSqi` | Lang + Extend + Irreg, opening Extra | verify intended advanced/irregular assembly and no namespace collision |

## GF-resolved export census requirement

Before finalizing Try/API ergonomics, capture from the **exact active RGL/GF 3.12 environment** a reproducible export/name census for:

- `SyntaxSqi`;
- `ConstructorsSqi`;
- `CombinatorsSqi`;
- `TrySqi`;
- `SymbolicSqi`.

Static source comparison cannot fully prove overload/name-resolution behavior. Until that census and smoke suite exist, Try/Combinators remain `needs_review` even though they compile in the protected baseline.
