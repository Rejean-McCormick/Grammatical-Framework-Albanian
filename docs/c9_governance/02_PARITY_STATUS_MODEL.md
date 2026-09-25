# Parity and certification status model

**Document status:** normative vocabulary

## 1. Three independent axes

Every tracked capability has three independent facts:

1. **contract scope** — common RGL vs English-only/tooling;
2. **coverage status** — how Albanian satisfies the capability;
3. **certification status** — what has actually been tested/reviewed.

Keeping these axes separate prevents compiler green from being mistaken for linguistic maturity.

## 2. Contract scope

| Scope | Meaning |
|---|---|
| `common_contract` | Function/category belongs to the common abstract/API and must be satisfied by Albanian. |
| `common_generated_api` | Generated list constructor or API surface implied by a common category/list contract. |
| `english_specific` | English-only addition; Albanian needs an explicit disposition, not automatic copying. |
| `tooling_optional` | Browse/parse/documentation tooling that requires a release-scope decision. |
| `albanian_specific` | Albanian extension justified by Albanian capability, not English parity. |

## 3. Coverage status

| Status | Meaning |
|---|---|
| `implemented` | Albanian has a local implementation/wiring owned by the appropriate module. |
| `equivalent` | Shared/inherited behavior has been reviewed and is suitable as-is. |
| `neutralized_equivalent` | The common abstract distinction is not independently grammaticalized in Albanian; the contract is still implemented through a documented Albanian-neutralized realization. |
| `partial` | Something exists but is default, incomplete, provisional, or only partly owned. |
| `missing` | Required common behavior has no implementation/equivalent. |
| `needs_review` | Presence is known, but linguistic/ownership/API disposition is unresolved. |
| `version_blocked` | Exact active RGL contract cannot yet be established. |
| `evidence_blocked` | Implementation choice depends on unresolved Albanian evidence. |
| `out_of_common_scope` | Valid only for English-specific/tooling rows intentionally excluded from the Albanian target. |

### Critical rule

`linguistically_not_applicable` from pack v1 is retired as a terminal status for common contracts. A common abstract function cannot simply disappear. If Albanian lacks the English/common distinction, use `neutralized_equivalent` and document the realization and tests.

## 4. Certification status

| Status | Meaning |
|---|---|
| `not_run` | No exact-current compiler evidence. |
| `structural_green` | Compiles within an exact full integration state. |
| `scenario_checked` | Focused executable scenario passed. |
| `linguistic_reviewed` | Output/contrast reviewed against Albanian evidence. |
| `gold_certified` | Accepted expected output protects the behavior. |
| `regression_certified` | Full relevant regression set remains green after subsequent changes. |
| `not_gold_applicable` | Mechanically transparent behavior where a linguistic gold adds no value; requires rationale and regression smoke coverage. |

## 5. Promotion rules

- `partial → equivalent`: exact inherited behavior + Albanian evidence + focused scenario.
- `partial → implemented`: local implementation + focused compile/scenario.
- `missing → neutralized_equivalent`: only when the common contract is still satisfied and evidence shows no separate Albanian distinction is needed.
- `implemented → linguistic_reviewed`: review of representative contrasts, not just an example that “looks plausible”.
- `linguistic_reviewed → gold_certified`: stable expected output accepted and stored.
- any change in category/record contracts can demote downstream rows until consumers are rerun.
- compile-safe placeholders cannot confer linguistic certification on affected lexical/morphological behavior.

## 6. Row completeness rule

A matrix row is audit-ready only when it has: stable row ID, exact signature, owner, contract source, coverage status, certification status, evidence ID(s), test-family ID, relevant decision ID(s), and current source-lock context.
