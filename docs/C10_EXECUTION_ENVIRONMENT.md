# C10 external execution environment

C10 is fully materialized in this snapshot, but genuine linguistic certification requires a native GF execution environment.

## Required runtime

- GF 3.12 exactly.
- GF Wordbench 1.3.4.
- A full RGL checkout/root containing `src/abstract`, `src/api`, `src/common`, and `src/prelude`.
- This Albanian project snapshot as the selected external language source.

The official GF 3.12 release is tagged `release-3.12`. The published Ubuntu 24.04 package asset is `gf-3.12-ubuntu-24.04.deb`; its GitHub release metadata reports SHA-256 `17aa5452b713f1e00a0755a1bad998a926acbffb96eefde2c3800ca72536b4d8`.

## One-command campaign execution

Use the cross-platform Python runner:

```text
python tools/certification/run_external_wordbench.py --level g1 --gf-exe PATH_TO_GF --rgl-root PATH_TO_GF_RGL --wordbench-src PATH_TO_GF_WORDBENCH_SRC
```

Levels `g2` and `g3` execute the 5,000-case and 20,000-case materialized campaigns respectively. The runner first performs a strict Wordbench project check, then runs the selected campaign and ingests the generated `LINGUISTIC_REVIEW_REQUEST.json` into the C10 case ledger.

PowerShell and POSIX shell wrappers are provided alongside the Python runner.

## Evidence boundary

The runner does not assign linguistic verdicts and does not create golds. After execution, C10 still requires explicit evidence-backed review, canonical recording, handoff of questionable/invalid cases, and separate gold promotion.
