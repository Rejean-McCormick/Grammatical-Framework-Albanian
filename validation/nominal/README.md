# Nominal validation

`static_validate_nominal_architecture.py` is a static guardrail for Conversation 6. It is deliberately not a replacement for GF 3.12 or Wordbench.

It checks the representation boundaries most likely to drift after the nominal refactor, exact target/scenario census, scenario/input hash freshness, and availability of linearization symbols used by scenarios.

Run:

```text
python validation/nominal/static_validate_nominal_architecture.py
```

Then perform the external request in `WORD_BENCH_REQUEST.md` before making any compile/regression-safe claim.
