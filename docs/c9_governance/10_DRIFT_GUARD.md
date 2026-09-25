# Drift guard — invariants that must remain true

## 1. Protected baseline invariants

- GF 3.12 remains the compiler reference until an explicit migration decision.
- Wordbench floor remains 58/58 + 52/52 unless census/scenario counts intentionally grow.
- compilation and linguistic certification are separate facts.
- current exact source/compiler evidence outranks historical prose for build status.
- English defines maturity/coverage, not Albanian syntax.
- model languages are subsystem evidence, not templates.
- DRAFT-MAX is mined incrementally only.
- DictSqi and MorphoDictSqi remain separate concerns.

## 2. Identity invariants

Never conflate:

- outer archive SHA;
- Wordbench source-lock;
- Git/RGL revision identity;
- linguistic evidence version.

Every patch references the identities it actually used.

## 3. Ownership invariants

- fix information at its owning representation/constructor boundary;
- Structural aggregator stays thin;
- Extend coordinator stays thin; subsystem modules own substantive logic;
- Extra does not become a parallel grammar;
- API facades do not redefine category representation;
- Documentation/Symbol/Markup migrate with category contracts;
- no downstream string surgery to recover discarded grammatical information.

## 4. Anti-placeholder invariant

A compile-safe placeholder may remain visible debt, but can never justify paradigm, valency, Structural, Extend or gold certification. If a true paradigm/type/construction is required and feasible, repair the owner.

## 5. Stable-ID invariant

Do not rewrite history by renumbering accepted row/evidence/test/decision IDs. New items receive new IDs. Superseded records point to replacements.

## 6. Common-contract invariant

A common abstract function cannot be dropped because a distinction is “not applicable”. It must be implemented, inherited equivalently, or neutralized through a documented Albanian realization that still satisfies the contract.

## 7. Mandatory patch record

Every C9 patch records the template in `25_PATCH_RECORD_TEMPLATE.md`, including:

- base source lock and RGL identity;
- matrix rows;
- owner modules;
- evidence/decision/test IDs;
- focused validation;
- full Wordbench status;
- gold impact;
- compatibility impact;
- known uncertainty.

## 8. Reconciliation order

After an accepted patch:

1. source change and focused tests;
2. exact compile/run evidence;
3. matrix rows;
4. evidence/decision/test registers;
5. golds if reviewed;
6. source-lock/run overlay;
7. maturity prose last.

A stale status document never overrides newer exact compiler evidence, and a compiler run never silently overrides a linguistic decision.
