# English/common RGL → Albanian traceability matrix

**Generated from:** supplied `gf-rgl-master.zip` + current Albanian snapshot.  
**Pack version:** 2.0  
**Purpose:** this is the authoritative C9 function traceability register. Presence is not linguistic certification.

## Summary

| Area | Rows | Implemented | Partial | Missing |
|---|---:|---:|---:|---:|
| Structural | 102 | 102 | 0 | 0 | 0 |
| Extend | 140 | 139 | 1 | 0 | 0 |
| Extra | 56 | 56 | 0 | 0 | 0 |
| Markup | 8 | 8 | 0 | 0 | 0 |
| Symbol | 13 | 13 | 0 | 0 | 0 |
| Documentation | 31 | 30 | 0 | 1 | 0 |

## Row schema

Every row has a stable `C9-*` ID. `Evidence` points to `17_LINGUISTIC_EVIDENCE_LEDGER.md`; `Test family` points to `18_TEST_COVERAGE_REGISTER.md`; `Decision` points to `22_DECISION_REGISTER.md`. Empty (`—`) means no special linguistic decision has yet been attached, not that evidence is unnecessary.

## Structural

**Contract source:** `src/abstract/Structural.gf` in the supplied RGL snapshot.

| Row ID | Function | Exact signature | Albanian owner/evidence | Coverage | Certification | Evidence | Test family | Decision |
|---|---|---|---|---|---|---|---|---|
| `C9-STR-001` | `above_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-002` | `after_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-003` | `all_Predet` | `Predet` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-004` | `almost_AdA` | `AdA` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-005` | `almost_AdN` | `AdN` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-006` | `although_Subj` | `Subj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-007` | `always_AdV` | `AdV` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-008` | `and_Conj` | `Conj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-009` | `because_Subj` | `Subj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-010` | `before_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-011` | `behind_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-012` | `between_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-013` | `both7and_DConj` | `Conj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-014` | `but_PConj` | `PConj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-015` | `by8agent_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-016` | `by8means_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-017` | `can8know_VV` | `VV` | StructuralSqiVerbal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-STR-VERBAL` | C9-DEC-006, C9-DEC-012 |
| `C9-STR-018` | `can_VV` | `VV` | StructuralSqiVerbal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-STR-VERBAL` | C9-DEC-006, C9-DEC-012 |
| `C9-STR-019` | `during_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-020` | `either7or_DConj` | `Conj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-021` | `every_Det` | `Det` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-022` | `everybody_NP` | `NP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-023` | `everything_NP` | `NP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-024` | `everywhere_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-025` | `few_Det` | `Det` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-026` | `for_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-027` | `from_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-028` | `he_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-029` | `here_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-030` | `here7to_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-031` | `here7from_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-032` | `how_IAdv` | `IAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-033` | `how8many_IDet` | `IDet` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-034` | `how8much_IAdv` | `IAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-035` | `i_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-036` | `if_Subj` | `Subj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-037` | `in8front_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-038` | `in_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-039` | `it_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-040` | `less_CAdv` | `CAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-041` | `many_Det` | `Det` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-042` | `more_CAdv` | `CAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-043` | `most_Predet` | `Predet` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-044` | `much_Det` | `Det` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-045` | `must_VV` | `VV` | StructuralSqiVerbal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-STR-VERBAL` | C9-DEC-006, C9-DEC-012 |
| `C9-STR-046` | `no_Utt` | `Utt` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-047` | `on_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-048` | `only_Predet` | `Predet` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-049` | `or_Conj` | `Conj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-050` | `otherwise_PConj` | `PConj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-051` | `part_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-052` | `please_Voc` | `Voc` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-053` | `possess_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-054` | `quite_Adv` | `AdA` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-055` | `she_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-056` | `so_AdA` | `AdA` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-057` | `someSg_Det` | `Det` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-058` | `somePl_Det` | `Det` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-059` | `somebody_NP` | `NP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-060` | `something_NP` | `NP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-061` | `somewhere_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-062` | `that_Quant` | `Quant` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-063` | `that_Subj` | `Subj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-064` | `there_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-065` | `there7to_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-066` | `there7from_Adv` | `Adv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-067` | `therefore_PConj` | `PConj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-068` | `they_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-069` | `this_Quant` | `Quant` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-070` | `through_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-071` | `to_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-072` | `too_AdA` | `AdA` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-073` | `under_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-074` | `very_AdA` | `AdA` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-075` | `want_VV` | `VV` | StructuralSqiVerbal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-STR-VERBAL` | C9-DEC-006, C9-DEC-012 |
| `C9-STR-076` | `we_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-077` | `whatPl_IP` | `IP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-078` | `whatSg_IP` | `IP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-079` | `when_IAdv` | `IAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-080` | `when_Subj` | `Subj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-081` | `where_IAdv` | `IAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-082` | `which_IQuant` | `IQuant` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-083` | `whoPl_IP` | `IP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-084` | `whoSg_IP` | `IP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-085` | `why_IAdv` | `IAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-086` | `with_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-087` | `without_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-088` | `yes_Utt` | `Utt` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-089` | `youSg_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-090` | `youPl_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-091` | `youPol_Pron` | `Pron` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-STR-NOMINAL` | — |
| `C9-STR-092` | `no_Quant` | `Quant` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-093` | `not_Predet` | `Predet` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-STR-DETQUANT` | — |
| `C9-STR-094` | `if_then_Conj` | `Conj` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-LINKING` | — |
| `C9-STR-095` | `at_least_AdN` | `AdN` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-096` | `at_most_AdN` | `AdN` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-097` | `nobody_NP` | `NP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-098` | `nothing_NP` | `NP` | StructuralSqiNominal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |
| `C9-STR-099` | `except_Prep` | `Prep` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-STR-PREP` | — |
| `C9-STR-100` | `as_CAdv` | `CAdv` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-ADVERBIAL` | — |
| `C9-STR-101` | `have_V2` | `V2` | StructuralSqiVerbal.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-STR-VERBAL` | — |
| `C9-STR-102` | `language_title_Utt` | `Utt` | StructuralSqiClause.gf via StructuralSqi.gf | **implemented** | structural_green | E-C9-ALG-009 | `T-C9-STR-MISC` | — |

## Extend

**Contract source:** `src/abstract/Extend.gf` in the supplied RGL snapshot.

| Row ID | Function | Exact signature | Albanian owner/evidence | Coverage | Certification | Evidence | Test family | Decision |
|---|---|---|---|---|---|---|---|---|
| `C9-EXT-001` | `GenNP` | `NP -> Quant` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-EXT-002` | `GenIP` | `IP -> IQuant` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-EXT-003` | `GenRP` | `Num -> CN -> RP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-EXT-004` | `GenModNP` | `Num -> NP -> CN -> NP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-EXT-005` | `GenModIP` | `Num -> IP -> CN -> IP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-EXT-006` | `CompBareCN` | `CN -> Comp` | ExtendSqiAPCN.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-007` | `PiedPipingQuestSlash` | `IP -> ClSlash -> QCl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-EXT-008` | `PiedPipingRelSlash` | `RP -> ClSlash -> RCl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-EXT-009` | `StrandQuestSlash` | `IP -> ClSlash -> QCl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-EXT-010` | `StrandRelSlash` | `RP -> ClSlash -> RCl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-EXT-011` | `EmptyRelSlash` | `ClSlash -> RCl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-EXT-012` | `MkVPS` | `Temp -> Pol -> VP -> VPS` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-013` | `ConjVPS` | `Conj -> [VPS] -> VPS` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-014` | `PredVPS` | `NP -> VPS -> S` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-015` | `SQuestVPS` | `NP -> VPS -> QS` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-008 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-016` | `QuestVPS` | `IP -> VPS -> QS` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-008 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-017` | `RelVPS` | `RP -> VPS -> RS` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-008 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-018` | `ExistS` | `Temp -> Pol -> NP -> S` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-019` | `ExistNPQS` | `Temp -> Pol -> NP -> QS` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-020` | `ExistIPQS` | `Temp -> Pol -> IP -> QS` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-021` | `MkVPI` | `VP -> VPI` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-022` | `ConjVPI` | `Conj -> [VPI] -> VPI` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-023` | `ComplVPIVV` | `VV -> VPI -> VP` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-024` | `MkVPS2` | `Temp -> Pol -> VPSlash -> VPS2` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-025` | `ConjVPS2` | `Conj -> [VPS2] -> VPS2` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-026` | `ComplVPS2` | `VPS2 -> NP -> VPS` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-027` | `ReflVPS2` | `VPS2 -> RNP -> VPS` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-028` | `MkVPI2` | `VPSlash -> VPI2` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-029` | `ConjVPI2` | `Conj -> [VPI2] -> VPI2` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-030` | `ComplVPI2` | `VPI2 -> NP -> VPI` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-031` | `ConjComp` | `Conj -> ListComp -> Comp` | ExtendSqi.gf (boundary/direct wiring) | **implemented** | structural_green | — | `T-C9-EXT-LISTS` | — |
| `C9-EXT-032` | `ConjImp` | `Conj -> ListImp -> Imp` | ExtendSqi.gf (boundary/direct wiring) | **implemented** | structural_green | — | `T-C9-EXT-LISTS` | — |
| `C9-EXT-033` | `ProDrop` | `Pron -> Pron` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-SCAFFOLD` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-034` | `ICompAP` | `AP -> IComp` | ExtendSqiAPCN.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-035` | `IAdvAdv` | `Adv -> IAdv` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-036` | `CompIQuant` | `IQuant -> IComp` | ExtendSqiAPCN.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-037` | `PrepCN` | `Prep -> CN -> Adv` | ExtendSqiFocusPrep.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-038` | `FocusObj` | `NP -> SSlash -> Utt` | ExtendSqiFocusPrep.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-EXT-039` | `FocusAdv` | `Adv -> S -> Utt` | ExtendSqiFocusPrep.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-EXT-040` | `FocusAdV` | `AdV -> S -> Utt` | ExtendSqiFocusPrep.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-EXT-041` | `FocusAP` | `AP -> NP -> Utt` | ExtendSqiFocusPrep.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-EXT-042` | `PresPartAP` | `VP -> AP` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | C9-DEC-007 |
| `C9-EXT-043` | `EmbedPresPart` | `VP -> SC` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | C9-DEC-007 |
| `C9-EXT-044` | `PastPartAP` | `VPSlash -> AP` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | C9-DEC-007 |
| `C9-EXT-045` | `PastPartAgentAP` | `VPSlash -> NP -> AP` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | C9-DEC-007 |
| `C9-EXT-046` | `PassVPSlash` | `VPSlash -> VP` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-005 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012, C9-DEC-007 |
| `C9-EXT-047` | `PassAgentVPSlash` | `VPSlash -> NP -> VP` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-005 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012, C9-DEC-007 |
| `C9-EXT-048` | `NominalizeVPSlashNP` | `VPSlash -> NP -> NP` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-049` | `ProgrVPSlash` | `VPSlash -> VPSlash` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-005 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012, C9-DEC-007 |
| `C9-EXT-050` | `A2VPSlash` | `A2 -> VPSlash` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-051` | `N2VPSlash` | `N2 -> VPSlash` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-052` | `ExistsNP` | `NP -> Cl` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-053` | `ExistCN` | `CN -> Cl` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-054` | `ExistMassCN` | `CN -> Cl` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-055` | `ExistPluralCN` | `CN -> Cl` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-056` | `AdvIsNP` | `Adv -> NP -> Cl` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-057` | `AdvIsNPAP` | `Adv -> NP -> AP -> Cl` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-EXT-058` | `PurposeVP` | `VP -> Adv` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-059` | `ComplBareVS` | `VS -> S -> VP` | ExtendSqi.gf (boundary/direct wiring) | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-060` | `SlashBareV2S` | `V2S -> S -> VPSlash` | common/ExtendFunctor.gf (inherited/default) | **partial** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-061` | `ComplDirectVS` | `VS -> Utt -> VP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-062` | `ComplDirectVQ` | `VQ -> Utt -> VP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-063` | `FrontComplDirectVS` | `NP -> VS -> Utt -> Cl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-064` | `FrontComplDirectVQ` | `NP -> VQ -> Utt -> Cl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-065` | `PredAPVP` | `AP -> VP -> Cl` | ExtendSqiAPCN.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-066` | `AdjAsCN` | `AP -> CN` | ExtendSqiAPCN.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-067` | `AdjAsNP` | `AP -> NP` | ExtendSqiAPCN.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-068` | `PredIAdvVP` | `IAdv -> VP -> QCl` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-069` | `EmbedSSlash` | `SSlash -> SC` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-070` | `ReflRNP` | `VPSlash -> RNP -> VP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-071` | `ReflPron` | `RNP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-072` | `ReflPoss` | `Num -> CN -> RNP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-073` | `PredetRNP` | `Predet -> RNP -> RNP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-074` | `AdvRNP` | `NP -> Prep -> RNP -> RNP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-075` | `AdvRVP` | `VP -> Prep -> RNP -> VP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-076` | `AdvRAP` | `AP -> Prep -> RNP -> AP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-077` | `ReflA2RNP` | `A2 -> RNP -> AP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-078` | `PossPronRNP` | `Pron -> Num -> CN -> RNP -> NP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-001, E-C9-ALG-006 | `T-C9-EXT-GENITIVE` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-079` | `ConjRNP` | `Conj -> RNPList -> RNP` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-080` | `Base_rr_RNP` | `RNP -> RNP -> RNPList` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-081` | `Base_nr_RNP` | `NP -> RNP -> RNPList` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-082` | `Base_rn_RNP` | `RNP -> NP -> RNPList` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-083` | `Cons_rr_RNP` | `RNP -> RNPList -> RNPList` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-084` | `Cons_nr_RNP` | `NP -> RNPList -> RNPList` | ExtendSqiRNP.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-085` | `ReflPossPron` | `Quant` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-086` | `ComplGenVV` | `VV -> Ant -> Pol -> VP -> VP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-SCAFFOLD` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-087` | `CompoundN` | `N -> N -> N` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-088` | `CompoundAP` | `N -> A -> AP` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-089` | `GerundCN` | `VP -> CN` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-090` | `GerundNP` | `VP -> NP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-091` | `GerundAdv` | `VP -> Adv` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-092` | `WithoutVP` | `VP -> Adv` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-093` | `ByVP` | `VP -> Adv` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-094` | `InOrderToVP` | `VP -> Adv` | ExtendSqiVPBridge.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-095` | `ApposNP` | `NP -> NP -> NP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-096` | `AdAdV` | `AdA -> AdV -> AdV` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-097` | `UttAdV` | `AdV -> Utt` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-098` | `PositAdVAdj` | `A -> AdV` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-099` | `CompS` | `S -> Comp` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-100` | `CompQS` | `QS -> Comp` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-101` | `CompVP` | `Ant -> Pol -> VP -> Comp` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-102` | `UncontractedNeg` | `Pol` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-103` | `UttVPShort` | `VP -> Utt` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-104` | `ComplSlashPartLast` | `VPSlash -> NP -> VP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | — |
| `C9-EXT-105` | `DetNPMasc` | `Det -> NP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-LEXTAIL` | — |
| `C9-EXT-106` | `DetNPFem` | `Det -> NP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-LEXTAIL` | — |
| `C9-EXT-107` | `UseComp_estar` | `Comp -> VP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-108` | `SubjRelNP` | `NP -> RS -> NP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-109` | `iFem_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-110` | `youFem_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-111` | `weFem_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-112` | `youPlFem_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-113` | `theyFem_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-114` | `theyNeutr_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-004, C9-DEC-009, C9-DEC-014 |
| `C9-EXT-115` | `youPolFem_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-116` | `youPolPl_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-117` | `youPolPlFem_Pron` | `Pron` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-LEXTAIL` | C9-DEC-009, C9-DEC-014 |
| `C9-EXT-118` | `UttAccNP` | `NP -> Utt` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-119` | `UttDatNP` | `NP -> Utt` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-120` | `UttAccIP` | `IP -> Utt` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-121` | `UttDatIP` | `IP -> Utt` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-122` | `UseDAP` | `DAP -> NP` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-LEXTAIL` | — |
| `C9-EXT-123` | `UseDAPMasc` | `DAP -> NP` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-LEXTAIL` | — |
| `C9-EXT-124` | `UseDAPFem` | `DAP -> NP` | ExtendSqiExistential.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-LEXTAIL` | — |
| `C9-EXT-125` | `UseComp_ser` | `Comp -> VP` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-126` | `CardCNCard` | `Card -> CN -> Card` | ExtendSqiAPCN.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-127` | `TPastSimple` | `Tense` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-128` | `SubjunctRelCN` | `CN -> RS -> CN` | ExtendSqiScaffolding.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-008 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-EXT-129` | `BaseVPS` | `VPS -> VPS -> [VPS]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-130` | `ConsVPS` | `VPS -> [VPS] -> [VPS]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-131` | `BaseVPI` | `VPI -> VPI -> [VPI]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-132` | `ConsVPI` | `VPI -> [VPI] -> [VPI]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-133` | `BaseVPS2` | `VPS2 -> VPS2 -> [VPS2]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-134` | `ConsVPS2` | `VPS2 -> [VPS2] -> [VPS2]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-135` | `BaseVPI2` | `VPI2 -> VPI2 -> [VPI2]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-136` | `ConsVPI2` | `VPI2 -> [VPI2] -> [VPI2]` | ExtendSqiVPS.gf via ExtendSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-EXT-137` | `BaseComp` | `Comp -> Comp -> [Comp]` | ExtendSqi.gf (boundary/direct wiring) | **implemented** | structural_green | — | `T-C9-EXT-LISTS` | — |
| `C9-EXT-138` | `ConsComp` | `Comp -> [Comp] -> [Comp]` | ExtendSqi.gf (boundary/direct wiring) | **implemented** | structural_green | — | `T-C9-EXT-LISTS` | — |
| `C9-EXT-139` | `BaseImp` | `Imp -> Imp -> [Imp]` | ExtendSqi.gf (boundary/direct wiring) | **implemented** | structural_green | — | `T-C9-EXT-LISTS` | — |
| `C9-EXT-140` | `ConsImp` | `Imp -> [Imp] -> [Imp]` | ExtendSqi.gf (boundary/direct wiring) | **implemented** | structural_green | — | `T-C9-EXT-LISTS` | — |

## Extra

**Contract source:** `src/abstract/Extra.gf` in the supplied RGL snapshot.

| Row ID | Function | Exact signature | Albanian owner/evidence | Coverage | Certification | Evidence | Test family | Decision |
|---|---|---|---|---|---|---|---|---|
| `C9-XTR-001` | `GenNP` | `NP -> Quant` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-XTR-002` | `GenIP` | `IP -> IQuant` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-XTR-003` | `GenRP` | `Num -> CN -> RP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-001 | `T-C9-EXT-GENITIVE` | C9-DEC-003, C9-DEC-005 |
| `C9-XTR-004` | `CompBareCN` | `CN -> Comp` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-005` | `PiedPipingRelSlash` | `RP -> ClSlash -> RCl` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-XTR-006` | `StrandRelSlash` | `RP -> ClSlash -> RCl` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-XTR-007` | `EmptyRelSlash` | `ClSlash -> RCl` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-XTR-008` | `StrandQuestSlash` | `IP -> ClSlash -> QCl` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-XTR-009` | `PiedPipingQuestSlash` | `IP -> ClSlash -> QCl` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SLASH` | C9-DEC-010 |
| `C9-XTR-010` | `MkVPI` | `VP -> VPI` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-011` | `ConjVPI` | `Conj -> [VPI] -> VPI` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-012` | `ComplVPIVV` | `VV -> VPI -> VP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-013` | `MkVPS` | `Temp -> Pol -> VP -> VPS` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-014` | `ConjVPS` | `Conj -> [VPS] -> VPS` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-015` | `PredVPS` | `NP -> VPS -> S` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-016` | `ProDrop` | `Pron -> Pron` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-SCAFFOLD` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-017` | `ICompAP` | `AP -> IComp` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-018` | `IAdvAdv` | `Adv -> IAdv` | ExtraSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-019` | `CompIQuant` | `IQuant -> IComp` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-020` | `PrepCN` | `Prep -> CN -> Adv` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-021` | `FocObj` | `NP -> ClSlash -> Foc` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-022` | `FocAdv` | `Adv -> Cl -> Foc` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-023` | `FocAdV` | `AdV -> Cl -> Foc` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-024` | `FocAP` | `AP -> NP -> Foc` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-025` | `FocNeg` | `Cl -> Foc` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-026` | `FocVP` | `VP -> NP -> Foc` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-027` | `FocVV` | `VV -> VP -> NP -> Foc` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-028` | `UseFoc` | `Temp -> Pol -> Foc -> Utt` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-FOCUS` | C9-DEC-011 |
| `C9-XTR-029` | `PartVP` | `VP -> AP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | — |
| `C9-XTR-030` | `EmbedPresPart` | `VP -> SC` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | C9-DEC-007 |
| `C9-XTR-031` | `PassVPSlash` | `VPSlash -> VP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-005 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012, C9-DEC-007 |
| `C9-XTR-032` | `PassAgentVPSlash` | `VPSlash -> NP -> VP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-005 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012, C9-DEC-007 |
| `C9-XTR-033` | `PastPartAP` | `VPSlash -> AP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | C9-DEC-007 |
| `C9-XTR-034` | `PastPartAgentAP` | `VPSlash -> NP -> AP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-005 | `T-C9-EXT-VPBRIDGE` | C9-DEC-007 |
| `C9-XTR-035` | `NominalizeVPSlashNP` | `VPSlash -> NP -> NP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-036` | `ExistsNP` | `NP -> Cl` | ExtraSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-EXISTENTIAL` | C9-DEC-013 |
| `C9-XTR-037` | `PurposeVP` | `VP -> Adv` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPBRIDGE` | — |
| `C9-XTR-038` | `ComplBareVS` | `VS -> S -> VP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-039` | `SlashBareV2S` | `V2S -> S -> VPSlash` | ExtraSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-040` | `FrontExtPredVP` | `NP -> VP -> Cl` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-041` | `InvFrontExtPredVP` | `NP -> VP -> Cl` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-008 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-042` | `AdjAsCN` | `AP -> CN` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002 | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-043` | `ReflRNP` | `VPSlash -> RNP -> VP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-044` | `ReflPron` | `RNP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-SCAFFOLD` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-045` | `ReflPoss` | `Num -> CN -> RNP` | ExtraSqi.gf | **implemented** | structural_green | — | `T-C9-EXT-SCAFFOLD` | — |
| `C9-XTR-046` | `PredetRNP` | `Predet -> RNP -> RNP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-002, E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-047` | `ConjRNP` | `Conj -> RNPList -> RNP` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-048` | `Base_rr_RNP` | `RNP -> RNP -> RNPList` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-049` | `Base_nr_RNP` | `NP -> RNP -> RNPList` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-050` | `Base_rn_RNP` | `RNP -> NP -> RNPList` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-051` | `Cons_rr_RNP` | `RNP -> RNPList -> RNPList` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-052` | `Cons_nr_RNP` | `NP -> RNPList -> RNPList` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-006 | `T-C9-EXT-RNP` | C9-DEC-009, C9-DEC-014 |
| `C9-XTR-053` | `BaseVPI` | `VPI -> VPI -> [VPI]` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-054` | `ConsVPI` | `VPI -> [VPI] -> [VPI]` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-055` | `BaseVPS` | `VPS -> VPS -> [VPS]` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |
| `C9-XTR-056` | `ConsVPS` | `VPS -> [VPS] -> [VPS]` | ExtraSqi.gf | **implemented** | structural_green | E-C9-ALG-003 | `T-C9-EXT-VPSVPI` | C9-DEC-006, C9-DEC-012 |

## Markup

**Contract source:** `src/abstract/Markup.gf` in the supplied RGL snapshot.

| Row ID | Function | Exact signature | Albanian owner/evidence | Coverage | Certification | Evidence | Test family | Decision |
|---|---|---|---|---|---|---|---|---|
| `C9-MRK-001` | `MarkupCN` | `Mark -> CN -> CN` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |
| `C9-MRK-002` | `MarkupNP` | `Mark -> NP -> NP` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |
| `C9-MRK-003` | `MarkupAP` | `Mark -> AP -> AP` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |
| `C9-MRK-004` | `MarkupAdv` | `Mark -> Adv -> Adv` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |
| `C9-MRK-005` | `MarkupS` | `Mark -> S -> S` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |
| `C9-MRK-006` | `MarkupUtt` | `Mark -> Utt -> Utt` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |
| `C9-MRK-007` | `MarkupPhr` | `Mark -> Phr -> Phr` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |
| `C9-MRK-008` | `MarkupText` | `Mark -> Text -> Text` | MarkupSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-MARKUP` | — |

## Symbol

**Contract source:** `src/abstract/Symbol.gf` in the supplied RGL snapshot.

| Row ID | Function | Exact signature | Albanian owner/evidence | Coverage | Certification | Evidence | Test family | Decision |
|---|---|---|---|---|---|---|---|---|
| `C9-SYM-001` | `SymbPN` | `Symb -> PN` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-002` | `IntPN` | `Int -> PN` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-003` | `FloatPN` | `Float -> PN` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-004` | `NumPN` | `Card -> PN` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-005` | `CNNumNP` | `CN -> Card -> NP` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-006` | `CNSymbNP` | `Det -> CN -> [Symb] -> NP` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-007` | `SymbS` | `Symb -> S` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-008` | `SymbNum` | `Symb -> Card` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-009` | `SymbOrd` | `Symb -> Ord` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-010` | `MkSymb` | `String -> Symb` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-011` | `CNIntNP` | `CN -> Int -> NP` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-012` | `BaseSymb` | `Symb -> Symb -> [Symb]` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |
| `C9-SYM-013` | `ConsSymb` | `Symb -> [Symb] -> [Symb]` | SymbolSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-SYMBOL` | — |

## Documentation

**Contract source:** `src/abstract/Documentation.gf` in the supplied RGL snapshot.

| Row ID | Function | Exact signature | Albanian owner/evidence | Coverage | Certification | Evidence | Test family | Decision |
|---|---|---|---|---|---|---|---|---|
| `C9-DOC-001` | `InflectionN` | `N -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-002` | `InflectionN2` | `N2 -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-003` | `InflectionN3` | `N3 -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-004` | `InflectionPN` | `PN -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-005` | `InflectionLN` | `LN -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-006` | `InflectionGN` | `GN -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-007` | `InflectionSN` | `SN -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-008` | `InflectionA` | `A -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-009` | `InflectionA2` | `A2 -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-010` | `InflectionV` | `V -> Inflection` | DocumentationSqi.gf (grouped lin declaration) | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-011` | `InflectionV2` | `V2 -> Inflection` | DocumentationSqi.gf (grouped lin declaration) | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-012` | `InflectionVV` | `VV -> Inflection` | DocumentationSqi.gf (grouped lin declaration) | **implemented** | structural_green | E-C9-ALG-003, E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-013` | `InflectionVS` | `VS -> Inflection` | DocumentationSqi.gf (grouped lin declaration) | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-014` | `InflectionVQ` | `VQ -> Inflection` | DocumentationSqi.gf (grouped lin declaration) | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-015` | `InflectionVA` | `VA -> Inflection` | DocumentationSqi.gf (grouped lin declaration) | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-016` | `InflectionV3` | `V3 -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-017` | `InflectionV2V` | `V2V -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-018` | `InflectionV2S` | `V2S -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-019` | `InflectionV2Q` | `V2Q -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-020` | `InflectionV2A` | `V2A -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-021` | `InflectionAdv` | `Adv -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-022` | `InflectionAdV` | `AdV -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-023` | `InflectionAdA` | `AdA -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-024` | `InflectionAdN` | `AdN -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-025` | `InflectionPrep` | `Prep -> Inflection` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-026` | `InflectionCl` | `Cl -> Inflection` | — | **version_blocked** | not_run | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | C9-DEC-001, C9-DEC-002 |
| `C9-DOC-027` | `NoDefinition` | `String -> Definition` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-028` | `MkDefinition` | `String -> String -> Definition` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-029` | `MkDefinitionEx` | `String -> String -> String -> Definition` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-030` | `MkDocument` | `Definition -> Inflection -> String -> Document` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |
| `C9-DOC-031` | `MkTag` | `Inflection -> Tag` | DocumentationSqi.gf | **implemented** | structural_green | E-C9-ALG-010 | `T-C9-DOCUMENTATION` | — |

## Interpretation locks

- Direct source wiring = `implemented`, never automatically `linguistic_reviewed`.
- An `ExtendFunctor` default remains `partial` until explicitly promoted.
- `Documentation.InflectionCl` remains a version-lock issue until the active RGL revision is proven.
- Generated list constructors are tracked because they are user-visible generated API.
- Public API facade composition is tracked separately in `19_PUBLIC_API_EXPORT_MATRIX.md`.
