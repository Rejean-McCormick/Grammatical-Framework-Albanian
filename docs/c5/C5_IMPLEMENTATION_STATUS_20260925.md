# C5 implementation status — final local delivery — 2026-09-25

## Status

**FINALIZED LOCALLY / NOT GF 3.12 CERTIFIED**

Conversation 5 implements the Albanian RGL subsystem for clitics, pronouns, grammatical case and prepositional government against the supplied consolidated Compendium-aligned C5 contract.

## Implemented

- five-valued syntactic `Case = Nom | Acc | Gen | Dat | Ablat`;
- syncretic `MorphCase = MNom | MAcc | MDat | MAblat`, with `Gen -> MDat` at nominal morphology boundary;
- gender-preserving plural agreement (`GPl Gender`);
- typed `CliticCluster` with separate Dat, Acc and Refl roles;
- one central `flattenClitics` service with the 18 source-locked Dat × `{e,i,u}` combinations;
- central `të` + cluster contraction;
- `po` kept outside the pronominal cluster;
- removal of active `acc_clit`, `dat_clit`, `VP.cl` and `VP.subjcl` string authorities;
- clitic-bearing realization across ordinary, future, conditional, anterior, subjunctive, progressive and imperative contexts;
- strong personal pronoun case paradigms and weak forms derived by grammatical role;
- explicit preposition government in `Compl/Prep`;
- source-backed core government for 14 Albanian prepositions;
- all 21 common Structural prepositions classified, with no `UNASSESSED` row;
- declined `cili` relative/interrogative paradigms with preserved plural gender;
- genitive nyje service and explicit `GenitiveCompl`;
- kinship `N2` relations (`brother/father/mother`) migrated from lexical `i/e` pseudo-prepositions to typed genitive complements;
- `RelativeSqi.FunRP` corrected so the head NP bears the outer case and the embedded RP bears preposition government;
- Albanian pied-piping as neutral strategy rather than English-like preposition stranding;
- all 21 C5 RGL API parity rows statically assessed;
- five new Wordbench C5 scenarios, adding 199 reviewable cases to the 52 historical scenarios.

## Local validation performed

- `python validation/c5/static_validate_c5.py`: **167/167 PASS**;
- every explicit active `Case`/`MorphCase` table audited for exhaustiveness: PASS;
- exact GF census shape: **51 + 5 + 2 = 58**;
- Dict static validator: PASS;
- MorphoDict static validator: PASS;
- combined Dict+MorphoDict validator: PASS;
- `gf_morphosqi_lint.py`: 0 findings;
- Python `compileall`: PASS; caches removed before packaging;
- C5 scenario SHA locks: PASS;
- scenario inventory: **57 = 52 historical + 5 C5**;
- Structural preposition classification: **21/21**, comprising 15 source-locked and 6 `REVIEW_REQUIRED`;
- API parity static registry: **21/21 STATIC_ASSESSED**.

A concrete audit defect (`sc_UttDatIP` accidentally selecting `Gen`) was found and corrected before the first candidate packaging. Final hardening then corrected `FunRP` routing and the three kinship genitive complements.

## Exact source lock

The exact 58 GF targets in this delivery have aggregate SHA-256:

`e15d7abd7c99510a438cc90b682b55c7ef7e1f17f3b49e8aae791e90c2adb49b`

See `C5_SOURCE_LOCK_SHA256.txt` for per-file hashes.

## Certification boundary

No GF executable is available in the present environment. Therefore this delivery does **not** claim a post-migration GF 3.12 compile result or Wordbench scenario result.

The authoritative external gate is:

```text
GF census:              58/58
historical scenarios:   52/52
C5 scenarios:            5/5
combined scenarios:     57/57
```

Only after the runtime output is reviewed may new C5 golds be promoted.

## Remaining non-local gates

- GF 3.12 compilation and Wordbench execution;
- runtime review of 199 C5 CASEs;
- linguistic resolution/certification of the 6 Structural mappings still marked `REVIEW_REQUIRED`;
- final policy decisions explicitly kept open by canonical governance (positive imperative variation, `nuk/s'`, detailed `po` ordering, selected non-active `u` interactions);
- promotion of C5 golds with provenance/reviewer status.

These are not hidden implementation gaps; they are explicit runtime/reviewer gates.
