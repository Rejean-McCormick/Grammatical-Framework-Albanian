# Apply instructions

1. Start from the exact `20260925-153041` Albanian snapshot.
2. Make a backup or branch.
3. Extract the consolidated overlay at repository root, allowing replacement of existing files.
4. Run `python validation/consolidation/static_validate_consolidation.py`.
5. Run GF 3.12 / Wordbench against the normal project configuration.
6. Keep the historical 52 required scenarios as the baseline gate; run optional campaigns separately.
7. Return the compiler/Wordbench diagnostics before attempting broad cleanup.

After applying, a catalog check should no longer raise `FileNotFoundError` for `c9-public-api-smoke.gfs`.
