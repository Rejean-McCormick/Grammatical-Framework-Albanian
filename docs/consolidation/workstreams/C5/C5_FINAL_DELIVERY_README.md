# Albanian RGL C5 — final local delivery

Date: 2026-09-25

This tree is the most complete C5 implementation that could be produced and checked locally without GF 3.12 execution.

## Implemented

- typed `CliticCluster` with Dat/Acc/Refl roles;
- centralized 18-cell Dat×{e,i,u} fusion;
- centralized `të` contraction;
- separate progressive `po` slot;
- five-valued syntax `Case` plus syncretic `MorphCase`;
- plural agreement retains gender;
- strong/weak personal-pronoun architecture;
- full declined `cili` path;
- typed preposition government and `GenitiveCompl`;
- contextual genitive nyje;
- C5 realization paths across ordinary/future/conditional/anterior/subjunctive/progressive/imperative contexts;
- Albanian pied-piping, with no canonical English-style stranding;
- source-locked/prepared C5 validation campaign.

## Final local hardening

- fixed `sc_UttDatIP` Dat/Gen audit defect;
- corrected `RelativeSqi.FunRP` case/order routing to common RGL semantics;
- converted `brother_N2`, `father_N2`, `mother_N2` from pseudo-preposition `i/e` to typed genitive complement;
- exhaustive structural audit of active Case/MorphCase tables;
- classified all 21 Structural prepositions;
- statically assessed all 21 C5 API-parity rows;
- C5 validator now passes 167/167 checks.

## Start here

- `docs/c5/C5_IMPLEMENTATION_STATUS_20260925.md`
- `docs/c5/C5_CANONICAL_RECONCILIATION_20260925.md`
- `docs/c5/C5_LOCAL_RELEASE_EVIDENCE_20260925.md`
- `validation/c5/C5_STATIC_VALIDATION.txt`
- `docs/c5/C5_SOURCE_LOCK_SHA256.txt`

## Certification boundary

This is not labelled GF-certified because GF 3.12 is unavailable in the present runtime. The required external evidence is 58/58 GF targets and 57/57 required scenarios, followed by linguistic review of C5 outputs.
