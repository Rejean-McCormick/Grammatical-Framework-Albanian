# Exact API parity matrix

Source of abstract signatures: supplied `gf-rgl-master.zip`. Block-comment-postponed Construction functions are excluded from the active count.

This matrix separates **surface presence** from **linguistic maturity**. A `DIRECT` implementation may still be wrong or underpowered.

## Verb

Observed direct coverage: **29/29** active abstract functions.

| function | abstract signature | Sqi implementation | finalization state |
| --- | --- | --- | --- |
| UseV | `V   -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ComplVV | `VV  -> VP -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ComplVS | `VS  -> S  -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ComplVQ | `VQ  -> QS -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ComplVA | `VA  -> AP -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SlashV2a | `V2        -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| Slash2V3 | `V3  -> NP -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| Slash3V3 | `V3  -> NP -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SlashV2V | `V2V -> VP -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SlashV2S | `V2S -> S  -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SlashV2Q | `V2Q -> QS -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SlashV2A | `V2A -> AP -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ComplSlash | `VPSlash -> NP -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SlashVV | `VV  -> VPSlash -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SlashV2VNP | `V2V -> NP -> VPSlash -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ReflVP | `VPSlash -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| UseComp | `Comp -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| PassV2 | `V2 -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| AdvVP | `VP -> Adv -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ExtAdvVP | `VP -> Adv -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| AdVVP | `AdV -> VP -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| AdvVPSlash | `VPSlash -> Adv -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| AdVVPSlash | `AdV -> VPSlash -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| VPSlashPrep | `VP -> Prep -> VPSlash` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| CompAP | `AP  -> Comp` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| CompNP | `NP  -> Comp` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| CompAdv | `Adv -> Comp` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| CompCN | `CN  -> Comp` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| UseCopula | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
## Conjunction

Observed direct coverage: **9/9** active abstract functions.

| function | abstract signature | Sqi implementation | finalization state |
| --- | --- | --- | --- |
| ConjS | `Conj -> ListS -> S` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjRS | `Conj -> ListRS -> RS` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjAP | `Conj -> ListAP -> AP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjNP | `Conj -> ListNP -> NP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjAdv | `Conj -> ListAdv -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjAdV | `Conj -> ListAdV -> AdV` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjIAdv | `Conj -> ListIAdv -> IAdv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjCN | `Conj -> ListCN -> CN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ConjDet | `Conj -> ListDAP -> Det` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
## Construction

Observed direct coverage: **68/68** active abstract functions.

| function | abstract signature | Sqi implementation | finalization state |
| --- | --- | --- | --- |
| hungry_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| thirsty_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| tired_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| scared_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ill_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ready_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| has_age_VP | `Card -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| have_name_Cl | `NP -> NP -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| married_Cl | `NP -> NP -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| what_name_QCl | `NP -> QCl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| how_old_QCl | `NP -> QCl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| how_far_QCl | `NP -> QCl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| weather_adjCl | `AP -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| is_right_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| is_wrong_VP | `VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| n_units_AP | `Card -> CN -> A  -> AP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| n_units_of_NP | `Card -> CN -> NP -> NP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| n_unit_CN | `Card -> CN -> CN -> CN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| bottle_of_CN | `NP -> CN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| cup_of_CN | `NP -> CN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| glass_of_CN | `NP -> CN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| few_X_short_of_Y | `NP -> CN -> CN -> S` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| timeunitAdv | `Card -> Timeunit -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| timeunitRange | `Card -> Card -> Timeunit -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| oneHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| twoHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| threeHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| fourHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| fiveHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| sixHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| sevenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| eightHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| nineHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| tenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| elevenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| twelveHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| thirteenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| fourteenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| fifteenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| sixteenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| seventeenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| eighteenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| nineteenHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| twentyHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| twentyOneHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| twentyTwoHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| twentyThreeHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| twentyFourHour | `Hour` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| timeHour | `Hour -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| timeHourMinute | `Hour -> Card -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| weekdayPunctualAdv | `Weekday -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| weekdayHabitualAdv | `Weekday -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| weekdayLastAdv | `Weekday -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| weekdayNextAdv | `Weekday -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| monthAdv | `Month -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| yearAdv | `Year -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| dayMonthAdv | `Monthday -> Month -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| monthYearAdv | `Month -> Year -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| dayMonthYearAdv | `Monthday -> Month -> Year -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| intYear | `Int -> Year` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| intMonthday | `Int -> Monthday` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| InLanguage | `Language -> Adv` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| weekdayN | `Weekday -> N` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| monthN | `Month -> N` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| weekdayPN | `Weekday -> PN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| monthPN | `Month -> PN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| languageNP | `Language -> NP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| languageCN | `Language -> CN` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
## Idiom

Observed direct coverage: **14/14** active abstract functions.

| function | abstract signature | Sqi implementation | finalization state |
| --- | --- | --- | --- |
| ImpersCl | `VP -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| GenericCl | `VP -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| CleftNP | `NP  -> RS -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| CleftAdv | `Adv -> S  -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ExistNP | `NP -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ExistIP | `IP -> QCl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ExistNPAdv | `NP -> Adv -> Cl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ExistIPAdv | `IP -> Adv -> QCl` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ProgrVP | `VP -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ImpPl1 | `VP -> Utt` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| ImpP3 | `NP -> VP -> Utt` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SelfAdvVP | `VP -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SelfAdVVP | `VP -> VP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |
| SelfNP | `NP -> NP` | DIRECT | CLASSIFY_LINGUISTIC_STATUS |

## Scoped Extend surface

Only Extend functions materially coupled to C8 are tracked here; the entire `Extend` module remains governed by its own subsystem documentation.

| function | abstract signature | implementation path | C8 status |
| --- | --- | --- | --- |
| MkVPS | `Temp -> Pol -> VP -> VPS` | LOCAL | C8_SCOPED_REVIEW |
| ConjVPS | `Conj -> [VPS] -> VPS` | LOCAL | C8_SCOPED_REVIEW |
| PredVPS | `NP   -> VPS -> S` | LOCAL | C8_SCOPED_REVIEW |
| SQuestVPS | `NP   -> VPS -> QS` | LOCAL | C8_SCOPED_REVIEW |
| QuestVPS | `IP   -> VPS -> QS` | LOCAL | C8_SCOPED_REVIEW |
| RelVPS | `RP   -> VPS -> RS` | LOCAL | C8_SCOPED_REVIEW |
| ExistS | `Temp -> Pol -> NP -> S` | LOCAL | C8_SCOPED_REVIEW |
| ExistNPQS | `Temp -> Pol -> NP -> QS` | LOCAL | C8_SCOPED_REVIEW |
| ExistIPQS | `Temp -> Pol -> IP -> QS` | LOCAL | C8_SCOPED_REVIEW |
| MkVPI | `VP -> VPI` | LOCAL | C8_SCOPED_REVIEW |
| ConjVPI | `Conj -> [VPI] -> VPI` | LOCAL | C8_SCOPED_REVIEW |
| ComplVPIVV | `VV   -> VPI -> VP` | LOCAL | C8_SCOPED_REVIEW |
| MkVPS2 | `Temp -> Pol -> VPSlash -> VPS2` | LOCAL | C8_SCOPED_REVIEW |
| ConjVPS2 | `Conj -> [VPS2] -> VPS2` | LOCAL | C8_SCOPED_REVIEW |
| ComplVPS2 | `VPS2 -> NP -> VPS` | LOCAL | C8_SCOPED_REVIEW |
| ReflVPS2 | `VPS2 -> RNP -> VPS` | LOCAL | C8_SCOPED_REVIEW |
| MkVPI2 | `VPSlash -> VPI2` | LOCAL | C8_SCOPED_REVIEW |
| ConjVPI2 | `Conj -> [VPI2] -> VPI2` | LOCAL | C8_SCOPED_REVIEW |
| ComplVPI2 | `VPI2 -> NP -> VPI` | LOCAL | C8_SCOPED_REVIEW |
| ProDrop | `Pron -> Pron` | LOCAL | C8_SCOPED_REVIEW |
| FocusObj | `NP  -> SSlash  -> Utt` | LOCAL | C8_SCOPED_REVIEW |
| FocusAdv | `Adv -> S       -> Utt` | LOCAL | C8_SCOPED_REVIEW |
| FocusAdV | `AdV -> S       -> Utt` | LOCAL | C8_SCOPED_REVIEW |
| FocusAP | `AP  -> NP      -> Utt` | LOCAL | C8_SCOPED_REVIEW |
| ProgrVPSlash | `VPSlash -> VPSlash` | LOCAL | C8_SCOPED_REVIEW |
| ExistsNP | `NP -> Cl` | LOCAL | C8_SCOPED_REVIEW |
| ExistCN | `CN -> Cl` | LOCAL | C8_SCOPED_REVIEW |
| ExistMassCN | `CN -> Cl` | LOCAL | C8_SCOPED_REVIEW |
| ExistPluralCN | `CN -> Cl` | LOCAL | C8_SCOPED_REVIEW |
| AdvIsNP | `Adv -> NP -> Cl` | LOCAL | C8_SCOPED_REVIEW |
| AdvIsNPAP | `Adv -> NP -> AP -> Cl` | LOCAL | C8_SCOPED_REVIEW |
| PurposeVP | `VP -> Adv` | LOCAL | C8_SCOPED_REVIEW |
| ComplBareVS | `VS  -> S  -> VP` | LOCAL | C8_SCOPED_REVIEW |
| SlashBareV2S | `V2S -> S  -> VPSlash` | FUNCTOR_OR_COMPANION | C8_SCOPED_REVIEW |
| PredAPVP | `AP -> VP -> Cl` | LOCAL | C8_SCOPED_REVIEW |
| ComplGenVV | `VV -> Ant -> Pol -> VP  -> VP` | LOCAL | C8_SCOPED_REVIEW |
| CompS | `S -> Comp` | LOCAL | C8_SCOPED_REVIEW |
| CompQS | `QS -> Comp` | LOCAL | C8_SCOPED_REVIEW |
| CompVP | `Ant -> Pol -> VP -> Comp` | LOCAL | C8_SCOPED_REVIEW |

## Interpretation

The main C8 problem is not missing public function names. Verb/Conjunction/Construction/Idiom have direct active-function coverage in the current concrete modules. Finalization therefore focuses on preserving distinctions, Albanian realization, metadata flow and certification.
