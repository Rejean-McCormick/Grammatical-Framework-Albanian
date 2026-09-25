# Apply — Albanian RGL C07 Clause Syntax Final Candidate

Apply this overlay to the exact Albanian snapshot locked by the C07 patch record.

## Scope

The overlay finalizes the evidence-supported clause-syntax workstream without changing shared `CatSqi`/`ResSqi` representations. It modifies 10 GF consumers/kernel files, adds C07 validation/documentation, and registers one optional scenario.

## Required post-apply gate

Run with GF 3.12 + Wordbench 1.3.4:

- strict compile census: 58/58;
- required scenarios: 52/52;
- optional `alb-clause-final`: 18/18;
- no unintended existing-gold regression.

Do not interpret successful compilation alone as linguistic certification. See `docs/clause/C07_UNCERTIFIED_BOUNDARIES.md`.
