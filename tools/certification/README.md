# C10 certification toolkit

`c10_certification.py` is a standard-library-only CLI for the Albanian RGL C10 workstream.

Commands:

- `bootstrap`: deterministically materialize G1/G2/G3, optional Wordbench scenarios, English/common-RGL parity inventory, paradigm registry, coverage projections, dashboard and release packet.
- `source-lock`: compute the deterministic C10 working-tree lock.
- `ingest-wordbench`: split a Wordbench review request's normalized scenario text into individual CASE outputs.
- `validate-reviews`: enforce verdict/confidence/hash/variety/gold-eligibility rules.
- `build-wordbench-response`: aggregate CASE reviews back to `gf-wordbench-linguistic-review-response-v1`.
- `promote-golds`: explicit, decision-bound gold promotion with a stored unified diff. Never called by validation/bootstrap.
- `record-reviews`: validate and persist a canonical case-level review ledger, then recompute coverage/dashboard/release evidence.
- `record-structural`: ingest a fresh external GF 3.12 / Wordbench 1.3.4 structural run bound to the current working-tree lock.
- `refresh`: recompute evidence projections without regenerating campaigns.
- `build-handoffs`: create minimal evidence-bound C1–C9 bug handoffs for `invalid`/`questionable` CASEs without inventing an expected form.
- `lint`: run blocking internal consistency checks.

Regeneration example:

```sh
python tools/certification/c10_certification.py bootstrap \
  --abstract-signatures /path/to/GF_RGL_AI_Compendium/contracts/ABSTRACT_SIGNATURES.jsonl \
  --rgl-src /path/to/gf-rgl/src
python tools/certification/c10_certification.py lint
```

The canonical documentation bundle, not this README, owns semantic policy. This code implements that policy conservatively and emits `not_executed` instead of inventing evidence.

## Native Wordbench integration

The final C10 package includes the GF Wordbench 1.3.4 active-project document facades required by `project check --strict`. The consolidated doctrine is imported once under `docs/canonical/` and the rigid Wordbench document names route to it.

Run the native static checks against a full supplied RGL root:

```text
python tools/certification/native_wordbench_static_check.py --wordbench-src PATH_TO_GF_WORDBENCH_SRC --rgl-root PATH_TO_GF_RGL --output validation/certification/native_wordbench_static_check.json
```

Run a materialized campaign through a real GF 3.12 environment:

```text
python tools/certification/run_external_wordbench.py --level g1 --gf-exe PATH_TO_GF --rgl-root PATH_TO_GF_RGL --wordbench-src PATH_TO_GF_WORDBENCH_SRC
```

The campaign runner supports `g1`, `g2`, and `g3`, performs a strict Wordbench project check first, executes only the scenario IDs declared by the campaign manifest, and ingests the resulting linguistic-review request. It never assigns verdicts or promotes golds.
