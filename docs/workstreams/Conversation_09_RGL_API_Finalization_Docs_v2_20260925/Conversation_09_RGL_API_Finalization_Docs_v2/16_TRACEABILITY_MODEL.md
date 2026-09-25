# Traceability model — anti-drift backbone

## 1. Required chain

Every high-risk capability must be traceable through:

`RGL contract → C9 matrix row → Albanian owner → decision (if needed) → evidence → test family/case → accepted result/gold → source-lock/run`

No prose maturity claim outranks this chain.

## 2. Stable ID namespaces

| Namespace | Meaning |
|---|---|
| `C9-STR-*` | Structural function rows |
| `C9-EXT-*` | Extend function rows |
| `C9-XTR-*` | Extra common compatibility rows |
| `C9-MRK-*` | Markup rows |
| `C9-SYM-*` | Symbol rows |
| `C9-DOC-*` | Documentation rows |
| `C9-API-*` | Public API surface rows |
| `C9-SURF-*` | English/module-surface dispositions |
| `C9-DEC-*` | Decisions |
| `E-C9-ALG-*` | Albanian linguistic evidence families/records |
| `T-C9-*` | Test families/cases |

IDs are append-only. A superseded record keeps its ID and points to the replacement.

## 3. Minimum row fields

A function/capability row is complete only with:

- stable ID;
- contract scope and exact signature;
- contract source/revision;
- Albanian owner;
- coverage status;
- certification status;
- evidence ID(s);
- test ID(s);
- decision ID(s), when applicable;
- current source-lock/run evidence.

## 4. Change propagation

| Change | Mandatory downstream reconciliation |
|---|---|
| abstract/API signature | matrix, API contract, tests, source lock |
| Cat/Res record | all producers/consumers, Extend, Documentation/Symbol/Markup |
| Structural lexical/government choice | Structural row, evidence, focused test/gold |
| Extend owner/default | Extend row, decision, focused test |
| Try/Combinators exports | API matrix, compatibility contract, smoke tests |
| linguistic decision | evidence ledger, affected rows, tests/golds |
| gold update | evidence + decision/rationale + regression record |

## 5. Drift detection questions

Before accepting any patch ask:

1. Which stable row IDs changed?
2. Did the owner change?
3. Did a common distinction get silently dropped?
4. Did a compile-safe placeholder gain an unjustified maturity status?
5. Did a category change leave release surfaces stale?
6. Did an API export/collision change without compatibility review?
7. Did a dialect-specific form enter the core without a scope decision?
8. Are prose claims newer than their run/source-lock evidence?
