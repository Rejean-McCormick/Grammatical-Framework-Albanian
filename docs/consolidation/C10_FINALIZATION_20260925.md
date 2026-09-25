# C10 finalization — certification / gold / English parity

Date: 2026-09-25

## Change envelope

Conversation 10 has been implemented as a validation-only layer. The Albanian grammar and MorphoDict code are byte-preserved relative to the supplied snapshot.

Changed/added surfaces:

- `project.toml`: 79 C10 scenarios registered as optional; the historical 52 remain required.
- `tools/certification/`: deterministic C10 CLI, library, unit tests and usage documentation.
- `validation/certification/`: campaign ledgers, coverage/parity inventories, schemas, evidence registry, dashboard, release packet, decisions and bug routing.
- `validation/scenarios/alb-c10-*`: optional G2/G3 scenario scripts.
- `validation/inputs/AlbC10G3*`: typed G3 probe modules.

## Why the implementation is additive

C10 owns expected-output review, gold policy, coverage and release evidence. It does not own grammatical repair. Any linguistic defect is emitted as an evidence-bound handoff to C1–C9 using the canonical ownership map.

## Current status

- Campaign infrastructure: complete.
- Review/gold/evidence lifecycle: complete.
- Wordbench configuration integration: complete.
- Structural/linguistic certification: not established because fresh GF execution and normalized CASE outputs are not present in the supplied evidence.

See `validation/certification/VALIDATION_REPORT.md` and `validation/certification/release/CURRENT_RELEASE_PACKET.md`.
