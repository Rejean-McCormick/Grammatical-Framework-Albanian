# C8 test-case catalog

## Existing scenarios that already touch C8

- `validation/scenarios/alb-clitic-ditransitive.gfs`
- `validation/scenarios/alb-clitic-negative.gfs`
- `validation/scenarios/alb-clitic-objects.gfs`
- `validation/scenarios/alb-clitic-vp.gfs`
- `validation/scenarios/alb-complement-control.gfs`
- `validation/scenarios/alb-construction-01.gfs`
- `validation/scenarios/alb-construction-02.gfs`
- `validation/scenarios/alb-cross-01.gfs`
- `validation/scenarios/alb-cross-02.gfs`
- `validation/scenarios/alb-cross-03.gfs`
- `validation/scenarios/alb-subordination.gfs`
- `validation/scenarios/alb-syntax-complements-a.gfs`
- `validation/scenarios/alb-syntax-complements-b.gfs`
- `validation/scenarios/alb-syntax-coordination.gfs`
- `validation/scenarios/alb-syntax-copular.gfs`
- `validation/scenarios/alb-syntax-v2.gfs`
- `validation/scenarios/alb-syntax-v3.gfs`

These scenarios are preservation evidence. They are not automatically linguistic golds.

## Planned focused C8 cases

| ID | phenomenon | API/category | gate | evidence | status |
| --- | --- | --- | --- | --- | --- |
| C8-VAL-001 | VV Standard/Tosk subjunctive complement | VV | STRUCT+LING | E-C8-001/E-C8-002 | REVIEW_REQUIRED |
| C8-VAL-002 | VV tense-sequence desiderative pair | VV | LING | E-C8-006 | REVIEW_REQUIRED |
| C8-VAL-003 | VS që complement | VS | STRUCT+LING | E-C8-005 | REVIEW_REQUIRED |
| C8-VAL-004 | VS se/që lexical contrast candidate | VS | LING | E-C8-005 | EVIDENCE_REQUIRED |
| C8-VAL-005 | VQ embedded question | VQ | STRUCT+LING | TBD | EVIDENCE_REQUIRED |
| C8-VAL-006 | V2 accusative object with pronoun clitic | V2 | STRUCT+LING | E-C8-003/E-C8-009 | REVIEW_REQUIRED |
| C8-VAL-007 | V2 dative object/doubling | V2 | STRUCT+LING | E-C8-003 | REVIEW_REQUIRED |
| C8-VAL-008 | V3 direct+indirect slot order/government | V3 | STRUCT+LING | E-C8-003 | REVIEW_REQUIRED |
| C8-VAL-009 | V2S object + finite clause | V2S | STRUCT+LING | E-C8-005 | REVIEW_REQUIRED |
| C8-VAL-010 | V2Q object + embedded question | V2Q | STRUCT+LING | TBD | EVIDENCE_REQUIRED |
| C8-VAL-011 | V2V subject-control lexical example | V2V | LING | TBD | EVIDENCE_REQUIRED |
| C8-VAL-012 | V2V object-control lexical example | V2V | LING | TBD | EVIDENCE_REQUIRED |
| C8-COP-001 | NP copular predicate | CompNP | STRUCT+LING | TBD | REVIEW_REQUIRED |
| C8-COP-002 | AP copular predicate masc/fem sg/pl | CompAP | STRUCT+LING | TBD | REVIEW_REQUIRED |
| C8-COP-003 | Adv/PP copular predicate | CompAdv | STRUCT+LING | TBD | REVIEW_REQUIRED |
| C8-COP-004 | impersonal AP + të clause | PredAPVP | LING | E-C8-008 | REVIEW_REQUIRED |
| C8-SP-001 | object secondary predicate `e lyeva i kuq` family | V2A | STRUCT+LING | E-C8-011 | REVIEW_REQUIRED |
| C8-SP-002 | resultative/depictive contrast | V2A | LING | TBD | EVIDENCE_REQUIRED |
| C8-CONJ-001 | NP 3sg+3sg -> subject agreement | ConjNP | STRUCT+LING | TBD | EVIDENCE_REQUIRED |
| C8-CONJ-002 | NP 1st+3rd person resolution | ConjNP | LING | TBD | EVIDENCE_REQUIRED |
| C8-CONJ-003 | NP mixed gender resolution | ConjNP | LING | TBD | EVIDENCE_REQUIRED |
| C8-CONJ-004 | AP coordination inflection table | ConjAP | STRUCT | RGL contract | REVIEW_REQUIRED |
| C8-CONJ-005 | CN mixed-gender coordination | ConjCN | LING | TBD | EVIDENCE_REQUIRED |
| C8-CONJ-006 | finite predicate coordination | ConjVPS | STRUCT+LING | TBD | REVIEW_REQUIRED |
| C8-CONSTR-001 | age construction | has_age_VP | LING | TBD | REVIEW_REQUIRED |
| C8-CONSTR-002 | name construction/question pair | have_name_Cl | LING | TBD | REVIEW_REQUIRED |
| C8-CONSTR-003 | weather adjective construction | weather_adjCl | LING | TBD | REVIEW_REQUIRED |
| C8-ID-001 | existential positive/negative present | ExistNP | STRUCT+LING | TBD | REVIEW_REQUIRED |
| C8-ID-002 | existential past/future | ExistNP | LING | TBD | REVIEW_REQUIRED |
| C8-ID-003 | existential + locative Adv | ExistNPAdv | LING | TBD | REVIEW_REQUIRED |
| C8-ID-004 | progressive `duke` interaction | ProgrVP | LING | TBD | REVIEW_REQUIRED |

## Test record format

Every executable new test must record:

```yaml
id: C8-...
abstract_expression: ...
lexical_items: ...
expected_structure: ...
expected_surface: null | reviewed string
forbidden_or_contrastive_surface: null | ...
evidence_ids: [...]
structural_status: pass|fail|not_run
linguistic_status: review_required|accepted|rejected
```

## Promotion to gold

A surface string becomes a gold only after linguistic review. Compilation output is never promoted automatically.
