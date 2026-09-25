# Test, certification and release gate

## Gate ladder

| Gate | Requirement | Blocking? |
|---|---|---|
| C8-G0 Source lock | hashes match intended baseline or documented migration | yes |
| C8-G1 Contract | exact abstract signature + ownership resolved | yes |
| C8-G2 Focused compile | edited module and direct consumers compile | yes |
| C8-G3 Structural C8 | relevant C8 structural tests pass | yes |
| C8-G4 Full compile | 58/58 | yes |
| C8-G5 Baseline scenarios | 52/52 | yes |
| C8-G6 Linguistic review | changed output and relevant items from the 569-CASE review baseline classified against Albanian evidence | yes for certification |
| C8-G7 Gold | reviewed stable outputs promoted where appropriate | yes for final linguistic certification |
| C8-G8 Dict handoff | relevant lexical promotions use real categories and pass tests | yes for declared Dict maturity |
| C8-G9 Documentation reconciliation | decision/evidence/traceability/risk updated | yes |

## Final C8 release criteria

- no unexplained public API function in scope;
- no untracked hard-coded grammatical choice introduced by C8;
- no unresolved `EVIDENCE_REQUIRED` item represented as final/certified behavior;
- all representation changes have complete producer/carrier/consumer audit;
- no known regression against baseline hashes without migration record;
- 58/58 + 52/52 after final patch set;
- C8 gold suite exists and passes for all behaviors claimed linguistically certified;
- DictSqi valence improvements are evidence-backed rather than semantic guessing.

## Stop conditions

Stop implementation and return to evidence/architecture if:

- the needed controller cannot be represented without changing a shared type;
- two plausible Albanian analyses lead to different category contracts;
- a model language is the only support for an Albanian behavior;
- a fix requires discarding case/agreement/clitic information before its final consumer;
- full baseline breaks and the failure cannot be causally localized.
