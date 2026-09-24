# Albanian documentation synchronization — 2026-09-24

## Evidence boundary

Accepted baseline: GF 3.12 run `20260923_214430`.

- 54/54 GF targets compile.
- 50/50 scenarios execute successfully.
- zero direct/downstream/ambiguous failures.
- zero structural-lock warnings.
- 50/50 scenarios are reviewable.
- linguistic certification remains `NOT ESTABLISHED`.

This baseline accepts the earlier surface-hygiene and ParamX-scope repairs.  It is not
an acceptance result for ALB-DEC-057, which is assembled after that run.

## ALB-DEC-057 candidate synchronized areas

The source candidate now centralizes the next proven linguistic defect families:

1. auxiliary + participle token boundaries in `MorphoSqi`;
2. explicit irregular/high-alternation verb paradigms in `IrregSqi`;
3. worst-case noun tables in `ParadigmsSqi`/`LexiconSqi`;
4. articulated-adjective linking articles in `ResSqi`;
5. typed dative V3 government in `LexiconSqi`;
6. pre/post nominal determinant placement and possessive morphology in
   `ResSqi`/`CatSqi`/`NounSqi` plus affected record constructors.

The validation scenario tree is intentionally unchanged.  Existing scenarios remain
the execution harness; new linguistic acceptance must come from reviewed expected
forms, not from rewriting scenarios to match candidate output.

## Required next evidence

1. compile the smallest changed modules and their dependency chain with GF 3.12;
2. recover the full 54/54 compile census;
3. recover 50/50 scenario execution with no empty CASE or visible `&+`;
4. compare changed CASE output against independently reviewed Albanian expectations;
5. only then approve/version golden output and advance linguistic maturity.
