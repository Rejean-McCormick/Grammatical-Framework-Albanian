# Delivery and change protocol

Every C8 delivery must include these sections, in this order:

1. **Scope** - exact functions/phenomena changed.
2. **Files modified** - production, tests, docs.
3. **Reason/evidence** - decision and evidence IDs.
4. **Contract delta** - types/fields/semantics changed or explicitly "none".
5. **Compatibility** - why existing lexical entries remain valid or what migration is required.
6. **Focused validation** - commands/results or explicit not-run limitation.
7. **Full validation** - 58/58 and 52/52 results when executable.
8. **Linguistic status** - what is reviewed vs still provisional.
9. **Risks/open questions**.
10. **Overlay/snapshot** - exact files and hashes if a patch artifact is delivered.

## Patch size policy

Prefer one semantic boundary per patch. Do not combine, for example, coordinated-subject agreement and V2A controller migration unless they require the same shared representation and are tested together.

## Rollback policy

Each patch must be reversible without deleting unrelated later work. Shared-type migrations require a before/after field map.
