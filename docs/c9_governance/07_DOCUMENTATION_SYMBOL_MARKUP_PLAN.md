# Documentation, Symbol and Markup completion plan

## DocumentationSqi

Purpose: make the documentation grammar accurately expose Albanian inflection and category behavior.

Current source already renders rich noun/adjective/verb paradigms including case, number, definiteness, subjunctive, imperative, participle, optative and admirative fields. Finalization tasks:

- verify every function required by the exact locked `Documentation` abstract;
- ensure N/N2/N3, A/A2, all verb valencies, names and prepositions render the same underlying forms used by the grammar;
- add/repair clause documentation if required by the locked abstract;
- keep generated HTML terminology consistent and test escaped markup;
- treat a discrepancy against the supplied master (for example a function present in a newer abstract) as a **version-lock question first**, not an immediate code defect.

## SymbolSqi

Purpose: symbolic and numeric material must preserve Albanian NP agreement/case behavior.

Finalization tasks:

- test `SymbPN`, `IntPN`, `FloatPN`, `NumPN`;
- test CN + integer/cardinal/symbolic NP construction in all relevant cases;
- verify determinant placement and species/definiteness interaction;
- verify list punctuation/conjunction behavior;
- protect lock fields and rich NP agreement metadata.

## MarkupSqi

Purpose: markup must wrap realized strings without destroying Albanian tables/metadata.

Finalization tasks:

- exercise CN, NP, AP across their table dimensions;
- ensure markup is applied at the final string cell, not by flattening a rich category;
- verify Adv/S/Utt/Phr/Text;
- add nested-markup regression tests and HTML-safe examples where appropriate.

## Final rule

Documentation/Symbol/Markup are not decorative extras. They are release surfaces that detect stale category assumptions. Any category migration in core must update these modules and their tests in the same patch or explicitly block merge.

## Traceability additions (v2)

- `C9-DOC-*`, `C9-SYM-*`, and `C9-MRK-*` are stable matrix IDs.
- Formatting tests use `T-C9-DOCUMENTATION`, `T-C9-SYMBOL`, and `T-C9-MARKUP`.
- `Documentation.InflectionCl` is tracked as `version_blocked` (not `missing`) until C9-DEC-001/C9-DEC-002 establish the exact abstract contract.
- A category migration automatically triggers revalidation of all three surfaces.
