# Albanian RGL — Conversation 10 certification runtime

This directory is the machine-readable implementation of the canonical C10 workstream: linguistic review, gold promotion, coverage, English/common-RGL parity, bug handoff, dashboard and release evidence.

## Non-negotiable boundary

`scenario OK`, compilation success and PGF construction are execution evidence only. They never become linguistic evidence automatically. C10 does not patch Albanian grammar modules; defects are routed to Conversations 1–9.

## Baseline

- Required GF: 3.12.
- Required Wordbench: 1.3.4.
- Declared project baseline: `albanian-s02-green-20260925`, 58/58 targets + 52/52 required scenarios.
- Last archived run in the supplied source snapshot: 56/58 strict + 52/52; lock-safe source correction is present, but a fresh GF 3.12 run is still required to establish the corrected 58/58 result.
- Target variety: `Standard Albanian`.

## Materialized campaigns

- `campaigns/g1`: 569 CASEs (the 500 core CASEs + 39 Dict smoke + 30 MorphoDict smoke).
- `campaigns/g2`: exactly 5,000 curated CASEs. It is a strict superset of G1 and adds stratified Dict/MorphoDict lexical probes.
- `campaigns/g3`: exactly 20,000 curated CASEs. It is a strict superset of G2 and adds 15,000 detailed morphology cells from high-evidence Dict/MorphoDict entries. Placeholder morphology is deliberately not used for the detailed protected-depth selection.

The generated G2/G3 scenarios are registered as **optional** Wordbench scenarios. The historical 52-scenario baseline remains the required suite.

## Workflow

1. Run Wordbench/GF externally and export a `gf-wordbench-linguistic-review-request-v1` file containing normalized scenario outputs.
2. Split scenario output into hash-bound CASE outputs:

   `python tools/certification/c10_certification.py ingest-wordbench --level g1 --request REQUEST.json`

3. Fill verdict/confidence/rationale/evidence fields in the resulting CASE ledger. Allowed verdicts: `valid`, `valid_variant`, `questionable`, `invalid`.
4. Validate reviews:

   `python tools/certification/c10_certification.py validate-reviews --reviewed-cases REVIEWED.tsv --require-all-executed-reviewed`

5. Record the reviewed ledger as canonical C10 evidence and refresh projections:

   `python tools/certification/c10_certification.py record-reviews --level g1 --reviewed-cases REVIEWED.tsv`

6. Aggregate CASE decisions back to the native Wordbench response contract when needed:

   `python tools/certification/c10_certification.py build-wordbench-response ...`

7. Promote golds only through the explicit command requiring a decision reference and reviewer identity:

   `python tools/certification/c10_certification.py promote-golds ...`

8. Materialize handoffs for `invalid` / `questionable` cases:

   `python tools/certification/c10_certification.py build-handoffs --reviewed-cases REVIEWED.tsv`

9. Import a fresh structural run when available using `record-structural`; it must carry the exact `working_tree_lock_sha256` printed by `source-lock`.

10. Run the C10 linter:

   `python tools/certification/c10_certification.py lint`

## Gold rule

`validate` never creates or rewrites a gold. A scenario gold is promotable only when every reviewed CASE in that scenario is `valid` or `valid_variant`, has confidence `high` or `medium`, and is bound to the exact request source-lock and scenario output hash. Every promotion writes metadata and a unified diff under `reviews/gold_promotions/`. A gold without promotion metadata + diff is a blocking linter error.

## Current state

The supplied snapshot does not contain the normalized outputs required to review the 569 CASEs, and this build environment has no `gf` executable. Therefore the generated dashboard and release packet correctly remain `NOT_ESTABLISHED`/`not_executed`; no verdict or gold is fabricated.

## Integrated project documentation

GF Wordbench 1.3.4 requires a fixed active-project documentation surface. The final C10 snapshot satisfies this contract through thin router documents under `docs/` and `validation/`, while the consolidated project authority is stored once under `docs/canonical/`. This keeps Wordbench compatibility without creating a second normative doctrine.

`native_wordbench_static_check.json` records a native Wordbench project and scenario-contract check against the supplied full RGL root. It is static evidence only and does not substitute for GF execution.
