# Wordbench scenario catalog fix — consolidated overlay v2

The first consolidated overlay registered C9/Morphology scenario ids whose `.gfs` files remained under workstream-specific directories. GF Wordbench resolves registered ids under `validation/scenarios/`, so the catalog raised `FileNotFoundError`.

Fix:
- publish `c9-public-api-smoke.gfs`, `c9-release-surface-smoke.gfs`, `c9-resource-smoke.gfs`, and `morphology-max-positive.gfs` under `validation/scenarios/`;
- publish their GF inputs under `validation/inputs/`;
- add exact `GF_WORDBENCH_INPUT_SHA256` declarations;
- normalize morphology-positive section markers to `GF_WORDBENCH_BEGIN/END`;
- remove `morphology-max-negative` from the normal optional catalog because it is an expected-failure suite and remains runnable manually from `validation/morphology_max/`.

Required baseline remains 52 scenarios. Optional catalog is 90 scenarios.
