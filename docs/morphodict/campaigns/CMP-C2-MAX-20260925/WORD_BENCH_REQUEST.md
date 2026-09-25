# External acceptance request — CMP-C2-MAX-20260925

Run this candidate with the declared project toolchain: GF 3.12 + Wordbench 1.3.4 native sibling `src/morphodict` discovery.

Required evidence:

1. complete expected census, including both MorphoDict targets;
2. `MorphoDictSqi.gf` native compile and load;
3. all 52 required scenarios, including updated `alb-morphodict-smoke`;
4. raw stderr retained for any failure; direct/downstream classification must not override raw GF cause;
5. native table introspection for the 560 entries in `validation/morphodict/GF_TABLE_INTROSPECTION_REQUEST.tsv`;
6. no regression of existing accepted golds;
7. return outputs to C2/C10 for table signatures, feature-level evidence matching and C5/C6 review.

Acceptance target: **58/58 + 52/52** under the declared baseline semantics. If Wordbench's native census evolves, report both the historical 58-target baseline subset and the new census explicitly.
