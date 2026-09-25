# Albanian RGL linguistic campaign — core + lexical validation

- Core scenarios: **50**
- Core cases: **500**
- Lexical scenarios: **2 required smoke scenarios**
- Lexical smoke cases: **69** (39 DictSqi + 30 MorphoDictSqi)
- Total required scenarios: **52**
- Initial lexical gold files: **none by design**
- First objective: compile/run + AI linguistic review
- Second objective: reviewed gold promotion + rerun

## Core coverage
- noun-morphology: 100
- verb-morphology: 100
- adjective-agreement: 50
- syntax-core: 80
- clitics-negation: 50
- questions-relatives: 50
- names-preps-numerals: 20
- construction-stress: 20
- cross-feature-stress: 30

## Lexical coverage
- `alb-dict-smoke`: loads `DictSqi.gf` and linearizes 39 representative entries.
- `alb-morphodict-smoke`: loads `MorphoDictSqi.gf` through the additional
  `morphodict` GF path and linearizes 30 representative lemgrams.

The source census remains rooted at `AlbanianSQI/GF/lib/src/albanian`, which
preserves the existing campaign's module resolution. `MorphoDictSqi` remains in
the standard sibling `src/morphodict` directory and is validated through a
required scenario rather than being moved into the language directory.

Each `.gfs` script binds at least one GF input file by SHA-256 comments.
Wordbench verifies those hashes before execution. No lexical output becomes a
gold merely because GF produced it; gold promotion requires linguistic review.
