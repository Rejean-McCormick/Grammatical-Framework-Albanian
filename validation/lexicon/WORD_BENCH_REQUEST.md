# Wordbench request — DictSqi + MorphoDictSqi

Required validation after this update:

1. Keep the existing Albanian language source root:
   `AlbanianSQI/GF/lib/src/albanian`.
2. Add the sibling `morphodict` directory to the GF path.
3. Compile the normal Albanian census, including `DictSqi.gf` / `DictSqiAbs.gf`.
4. Treat `DictSqi.gf` as an entrypoint/checkpoint.
5. Run all 50 existing core scenarios.
6. Run required scenario `alb-dict-smoke`.
7. Run required scenario `alb-morphodict-smoke`; this imports and therefore
   compiles `MorphoDictSqi.gf` from `src/morphodict`.
8. Preserve the source lock and distinguish direct failures from downstream failures.
9. Do not promote lexical outputs to gold until linguistic review accepts them.

The dictionaries remain additive resources. They are not imported by
`GrammarSqi`, `AllSqi`, or `LangSqi`.
