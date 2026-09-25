# C9 public API smoke

Compile/type-check probe for the application-facing Albanian resources:
`SyntaxSqi`, `ConstructorsSqi`, `CombinatorsSqi`, `TrySqi`, `SymbolicSqi`, plus the normal public `LexiconSqi` vocabulary source.

The concrete deliberately avoids `ResSqi`, `CatSqi`, and Albanian implementation helpers.  It therefore detects facade/export regressions that can be hidden by internal imports.

Status in the 2026-09-25 candidate: **added, not executed**.  The current environment has no GF 3.12 executable.  Run this script in the locked GF/Wordbench environment before promoting any API row beyond `not_run`.
