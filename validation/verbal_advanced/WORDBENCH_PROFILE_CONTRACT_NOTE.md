# Wordbench profile-contract note

The supplied GF Wordbench 1.3.4 snapshot exposes `project check` / `scenarios check` contract commands in addition to executable validation.

A standalone `project check --profile project.toml` was run locally against both:

1. the supplied `albanian-s02-green-20260925` baseline snapshot; and
2. this Conversation 4 final candidate.

Both report the **same 18 pre-existing errors**: `Required active-project authority or validation guide is missing.`

Therefore those 18 documentation-contract findings are inherited profile debt and were **not introduced by Conversation 4**. They are not silently repaired here because that would broaden this workstream into project-wide documentation/profile governance.

Conversation 4 changes `project.toml` only by registering `alb-verb-advanced` in `optional_scenarios`; the 52 required baseline scenarios remain unchanged.

The authoritative acceptance gate for this delivery remains the actual GF 3.12 / Wordbench strict diagnostic run requested in `WORD_BENCH_REQUEST.md`.
