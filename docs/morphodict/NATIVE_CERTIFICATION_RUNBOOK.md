# MorphoDictSqi MAX — native certification runbook

Campaign: `CMP-C2-MAX-20260925`

This runbook is the last executable handoff after the C2 static engineering candidate. It does **not** grant C6 by itself. It produces native GF/Wordbench evidence for C2/C10 review.

## Preconditions

- GF **3.12** executable.
- Extracted RGL snapshot whose root contains `src/`.
- GF Wordbench **1.3.4** source tree whose root contains `src/gf_wordbench`.
- This Albanian candidate tree.

The runner fails closed if the GF or Wordbench version does not match the locked toolchain.

## Command

```bash
python tools/morphodict/run_native_certification.py \
  --gf /path/to/gf \
  --rgl-root /path/to/gf-rgl-master \
  --wordbench-root /path/to/GF_Wordbench \
  --output docs/morphodict/campaigns/CMP-C2-MAX-20260925/native_gate
```

The runner performs:

1. GF version lock (`3.12`);
2. Wordbench version lock (`1.3.4`);
3. C2 static gate (`27/27`);
4. Wordbench Diagnostic Global Scan on the path-resolved Albanian source with the supplied RGL root;
5. Wordbench release validation only after diagnostic success;
6. machine-readable `native_gate_summary.json` plus raw console logs.

## Required acceptance interpretation

A successful process run is still **not** sufficient to label all active lemgrammes C6. C6 additionally requires the table-introspection / evidence-cell match and C10 linguistic-review obligations in the canonical documentation.

After Wordbench succeeds, execute the table-introspection request in `validation/morphodict/GF_TABLE_INTROSPECTION_REQUEST.tsv`, store the native tables, run `compute_table_signatures.py`, reconcile evidence mappings, and promote only individually eligible records.

Never repair a native failure with a new compile-safe placeholder.
