# Conversation 9 — known limitations after finalization candidate

These are not silently hidden by the API layer.

1. **No local GF executable**: exact-current GF 3.12 compilation and Wordbench execution remain pending.
2. **Plural-gender collapse in `Agr.GenNum`**: `GPl` loses feminine-vs-masculine information. This prevents fully correct synthesis of a declined relative pronoun for `EmptyRelSlash` with feminine plural antecedents. The C9 compatibility default is masculine plural `të cilët`; this row is not linguistically certified for feminine plural until the core agreement migration lands.
3. **Genitive/nyje architecture migration**: `PossNP` is the best current owner and is now used by Combinators, but the canonical five-case / centralized-nyje target belongs to the nominal-core workstream and can require a later coordinated migration.
4. **Voice, clitic placement, focus, existentials and RNP semantics**: C9 exposes/retains these common Extend functions, but final linguistic certification of the high-risk families still depends on their owning core/workstream contracts.
5. **Browse tooling**: deliberately outside core C9 release scope under canonical GLOB-022; absence is not a common-contract omission.
6. **Historical RGL Git identity**: this patch targets the supplied RGL archive by SHA-256. It does not prove the Git commit used by the earlier protected baseline run.

## Common non-gendered pronoun API

`it_Pron` and `they_Pron` are common-RGL functions without a gender argument. The supplied reference gives feminine as the unspecified-gender default, so this candidate uses `ajo` / `ato`. Explicitly gendered referents must continue through gender-aware Albanian structures; this neutralization is not a productive neuter category.
