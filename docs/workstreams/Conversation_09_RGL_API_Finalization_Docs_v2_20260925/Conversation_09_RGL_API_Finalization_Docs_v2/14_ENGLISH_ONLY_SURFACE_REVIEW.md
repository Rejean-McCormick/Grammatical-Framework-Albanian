# English-only function/capability review

This file prevents “English parity” from becoming “copy English-only API”. The all-module surface inventory is `23_ENGLISH_SURFACE_INVENTORY.md`.

## English `ExtraEngAbs` additions

Each item must finish with one of: `albanian_analogue_required`, `covered_elsewhere`, `neutralized_equivalent`, or `out_of_common_scope`.

| English-only function | Current disposition | Closure evidence required |
|---|---|---|
| `UncNeg` | needs_review | Albanian negation/contraction analysis; likely no direct English analogue |
| `CompoundCN` | needs_review | compare core/Extend compounding capability |
| `which_who_RP` | needs_review | Albanian relative-pronoun evidence |
| `that_RP` | needs_review | Albanian relative-pronoun evidence |
| `which_RP` | needs_review | Albanian relative-pronoun evidence |
| `who_RP` | needs_review | Albanian relative-pronoun evidence |
| `emptyRP` | needs_review | zero/relative strategy evidence |
| `each_Det` | needs_review | Structural inventory/use case |
| `any_Quant` | needs_review | Structural inventory/use case |
| `UttVPShort` | needs_review | compare current common Extend capability |
| `do_VV` | likely English-specific | Albanian modal/support-verb semantics, not English copying |
| `may_VV` | needs_review | Albanian modal inventory |
| `shall_VV` | likely English-specific | Albanian future/modal inventory |
| `ought_VV` | needs_review | Albanian modal inventory |
| `used_VV` | likely English-specific | Albanian aspect/habitual capability |
| `ComplSlashPartLast` | needs_review | compare current Extend capability |
| `ContractedUseCl` | likely English-specific | Albanian contraction analysis |
| `UncNegCl` | likely English-specific | Albanian negation analysis |
| `UncNegQCl` | likely English-specific | Albanian negation analysis |
| `UncNegRCl` | likely English-specific | Albanian negation analysis |
| `UncNegImpSg` | likely English-specific | Albanian imperative negation |
| `UncNegImpPl` | likely English-specific | Albanian imperative negation |

## Tooling and compatibility surfaces

English also carries `BackwardEng`, `CompatibilityEng`, `OverloadEng`, `ParseEngAbs`, `MakeStructuralEng`, `TerminologyEng`, documentation functors/localizations, and `BrowseEng`. These are not automatically common Albanian deliverables. Their release dispositions are tracked in `23_ENGLISH_SURFACE_INVENTORY.md`.

## Browse

`BrowseSqi` remains `tooling_optional + needs_review` under `C9-DEC-017`. If adopted, it is a separate API deliverable with its own tests; it cannot be hidden inside Syntax/Try.

## Promotion rule

No English-only item becomes an Albanian requirement until owner, use case, Albanian/API rationale, compatibility impact and test are recorded.
