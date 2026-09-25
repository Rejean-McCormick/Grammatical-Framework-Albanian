# Albanian RGL Conversation 8 - Combined normative context v2


---

<!-- BEGIN 00_README.md -->

# Albanian RGL - Conversation 8 Finalization Pack v2

**Date:** 2026-09-25  
**Scope:** valence + complementation + copula + secondary predication + coordination + `ConstructionSqi` + `IdiomSqi`  
**Baseline tag supplied by maintainer:** `albanian-s02-green-20260925`  
**Status of this pack:** normative engineering specification; linguistic certification remains evidence-driven.

## Purpose

This pack is the anti-drift contract for Conversation 8. It is designed to survive parallel development, not merely describe intentions.

Every substantive C8 change must be traceable through:

```text
RGL abstract/API contract
-> Albanian linguistic evidence
-> architecture/ownership decision
-> producer/carrier/consumer contract
-> implementation
-> focused test
-> 58/58 + 52/52 preservation gate
-> linguistic review/gold promotion
-> DictSqi valence promotion when applicable
```

## Non-negotiable distinction

- **Compiles** = GF accepts the program.
- **Structurally validated** = contracts, locks and regressions are preserved.
- **Linguistically reviewed** = an Albanian realization has been checked against evidence.
- **Certified** = the relevant test/gold gate has passed and provenance is recorded.

These terms are never interchangeable.

## v2 additions over v1

1. exact baseline hashes for all 58 GF census targets and 52 scenarios;
2. exact abstract API parity inventory for Verb/Conjunction/Construction/Idiom plus scoped Extend;
3. inter-conversation collision/ownership protocol;
4. producer -> carrier -> consumer map for valence and agreement metadata;
5. quantitative DictSqi valence baseline;
6. concrete C8 test-case catalog with evidence states;
7. phenomenon-specific model-language selection policy;
8. explicit release gate and stop conditions;
9. risk register and change protocol;
10. source locator discipline for linguistic evidence.

## Reading order

1. `01_DEFINITION_OF_DONE.md`
2. `02_AUTHORITY_EVIDENCE_AND_MODEL_POLICY.md`
3. `03_BASELINE_LOCK.md`
4. `04_PARALLEL_CONVERSATION_OWNERSHIP_LOCK.md`
5. `05_API_PARITY_MATRIX.md`
6. `06_VALENCY_DATAFLOW_CONTRACT.md`
7. `07_VALENCY_AND_COMPLEMENTATION_CONTRACT.md`
8. `08_COPULA_SECONDARY_PREDICATION_CONTRACT.md`
9. `09_COORDINATION_AND_AGREEMENT_CONTRACT.md`
10. `10_CONSTRUCTION_AND_IDIOM_CONTRACT.md`
11. `11_LINGUISTIC_EVIDENCE_LEDGER.md`
12. `12_MODEL_LANGUAGE_SELECTION_MATRIX.md`
13. `13_DICTSQI_VALENCY_AUDIT.md`
14. `14_TEST_CASE_CATALOG.md`
15. `15_TEST_CERTIFICATION_RELEASE_GATE.md`
16. `16_IMPLEMENTATION_SEQUENCE.md`
17. `17_DECISIONS_AND_OPEN_QUESTIONS.md`
18. `18_TRACEABILITY_MATRIX.md`
19. `19_DELIVERY_CHANGE_PROTOCOL.md`
20. `20_ANTI_DRIFT_RULES.md`
21. `21_RISK_REGISTER.md`
22. `22_GLOSSARY.md`

`99_COMBINED_CONTEXT.md` concatenates the normative documents for fast context loading.

## Status vocabulary

`LOCKED` - may not change without an explicit migration record.  
`OBSERVED` - fact extracted from supplied current source/evidence.  
`TARGET` - intended final behavior.  
`PROVISIONAL` - implementation/evidence exists but is not yet certified.  
`EVIDENCE_REQUIRED` - no implementation decision may be finalized yet.  
`REVIEW_REQUIRED` - executable output exists but requires Albanian linguistic review.  
`CERTIFIED` - acceptance evidence is stored and linked.

## Hard rule

A future patch that cannot identify its affected row in `18_TRACEABILITY_MATRIX.md` must first update the documentation before code is changed.

<!-- END 00_README.md -->


---

<!-- BEGIN 01_DEFINITION_OF_DONE.md -->

# Definition of done - Conversation 8

## Final objective

Reach English-RGL-comparable **coverage and engineering maturity** for the C8 scope while preserving Albanian-specific grammar. English is a coverage/API reference, not a linguistic template.

The final C8 subsystem must make rich lexical categories usable in ordinary Albanian syntax, so `DictSqi` can promote verbs from generic `V` to real valence categories without compensating strings or placeholder semantics.

## Required final surface

### Valence

`V`, `V2`, `V3`, `VS`, `VQ`, `VV`, `VA`, `V2A`, `V2S`, `V2Q`, `V2V` must have:

- explicit lexical construction support;
- complement government preserved to final realization;
- clitic behavior integrated at the argument boundary;
- finite/non-finite/subjunctive complement strategy justified per category;
- controller/agreement behavior represented where linguistically required;
- direct and slash realizers that agree on the same contracts.

### Copula and secondary predication

The system must distinguish and correctly realize at least NP, AP, CN and Adv/PP complements. Secondary predicates such as the user-supplied family `e lyeva i kuq` must not accidentally agree with the matrix subject when Albanian evidence requires object control.

### Coordination

Public RGL coordination for S/RS/AP/NP/Adv/AdV/IAdv/CN/Det must be structurally complete. NP/CN agreement resolution must be evidence-backed. Predicate coordination is handled through the appropriate VPS/VPI families, not by inventing an abstract `ConjVP` absent from the locked API.

### Construction and Idiom

Every active abstract `Construction` and `Idiom` function must be classified as `CERTIFIED`, `REVIEW_REQUIRED`, `PROVISIONAL`, or `EVIDENCE_REQUIRED`; nothing may silently remain a plausible-looking literal string.

## Quantitative exit gates

1. GF structural census remains **58/58**.
2. Existing scenario baseline remains **52/52**.
3. All new C8 structural scenarios pass.
4. The current project roadmap records **569 reviewable generated CASEs**; C8-relevant cases must be classified during the review campaign, and no reviewed failure may be hidden by a compile-only fix.
5. Existing `validation/gold/` currently contains no approved gold beyond `.gitkeep`; therefore C8 must not claim gold regression certification until reviewed C8 golds are actually promoted.
7. 100% of active public functions in the C8 API matrix are classified.
7. 100% of C8 lexical valence constructors are mapped to producer/carrier/consumer contracts.
8. No `EVIDENCE_REQUIRED` item may be marked final.
9. No new compile-safe lexical placeholder may be introduced to hide a C8 core weakness.
10. Every DictSqi promotion records lemma, old category, new category, valence evidence, constructor, focused test and review status.
11. The final report separates structural green status from linguistic certification.

## Maturity comparison with English

"Equivalent to English" means comparable public coverage, maintainability, testability and lexical usability. It does **not** mean identical internal types, identical complement syntax, identical infinitival strategy, identical word order, or identical idioms.

<!-- END 01_DEFINITION_OF_DONE.md -->


---

<!-- BEGIN 02_AUTHORITY_EVIDENCE_AND_MODEL_POLICY.md -->

# Authority, evidence and model-language policy

## Authority by claim type

### RGL/API claim
1. exact abstract/API source in supplied `gf-rgl-master.zip`;
2. compiler behavior under the locked GF/RGL environment;
3. Compendium contract indexes.

### Current Albanian implementation claim
1. current Albanian snapshot;
2. exact current Wordbench evidence;
3. historical snapshots only as regression history.

### Albanian linguistic claim
1. supplied Albanian reference evidence with exact locator;
2. additional Albanian scholarly evidence supplied/approved later;
3. current Albanian source only as implementation evidence, never proof of correctness;
4. model languages only as architecture/comparison evidence.

## Model-language rule

English answers **what public coverage exists**. It does not answer how Albanian realizes it.

Balkan/Romance/model sources may answer **how another implementation preserves a comparable distinction**, but a copied decision is forbidden unless Albanian evidence independently licenses the behavior.

## Evidence record minimum

Every linguistic decision must contain:

```yaml
evidence_id: E-C8-...
phenomenon: ...
source_file: ...
locator: page/section/example or exact searchable phrase
dialect_scope: Standard/Tosk/Geg/unclear
claim: ...
implementation_consequence: ...
confidence: high|medium|low
status: accepted|provisional|quarantined
```

## Supplied linguistic package

`Albanian_ref(10).zip` contains a 66-page PDF reference plus Standard/Tosk/Geg lessons, grammar, glossaries and dictionaries. This v2 uses exact PDF page/phrase locators for the high-impact complement/clitic/coordination claims and leaves unsupported secondary-predication/coordination-agreement claims open.

<!-- END 02_AUTHORITY_EVIDENCE_AND_MODEL_POLICY.md -->


---

<!-- BEGIN 03_BASELINE_LOCK.md -->

# Baseline lock - `albanian-s02-green-20260925`

## Snapshot identities

| artifact | SHA-256 |
| --- | --- |
| Albanian current snapshot | 961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829 |
| supplied gf-rgl-master | e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d |
| GF RGL AI Compendium | 73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe |
| GF Wordbench snapshot | 1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd |
| Albanian linguistic refs | 15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc |

## Structural census lock

Observed snapshot shape: **51 language GF + 5 API facades + 2 MorphoDict = 58 GF targets**.

| # | target | bytes | SHA-256 |
| --- | --- | --- | --- |
| 1 | AlbanianSQI/GF/lib/src/albanian/AdjectiveSqi.gf | 1647 | f7998b574626622b06ffc5014d6c340e0b2aeb153865bc25186955a4cf555328 |
| 2 | AlbanianSQI/GF/lib/src/albanian/AdverbSqi.gf | 834 | 0758ed3b728ff4976ad28f15a28749f8ec29c2983c73dac67e233d27c6a58534 |
| 3 | AlbanianSQI/GF/lib/src/albanian/AllSqi.gf | 148 | c15b24a3ddc60f0c5ac9d162a3b421f60ac6153bdfc18bf7cedae9089b876fc7 |
| 4 | AlbanianSQI/GF/lib/src/albanian/AllSqiAbs.gf | 61 | 8846ea36330556c347c9fb00cc6ba16bae7e5c5d3a7dc11430aa9d17c6a6baf7 |
| 5 | AlbanianSQI/GF/lib/src/albanian/CatSqi.gf | 2744 | 8fb7b05b7ad8af60f19894cafdfdc878a885467d969e9e308fb4efae86199210 |
| 6 | AlbanianSQI/GF/lib/src/albanian/ClauseSqiRes.gf | 4396 | 34ec8dc40f03a240a2369f62e58c4eda7392d9395b7040c488fbca51afe0cb36 |
| 7 | AlbanianSQI/GF/lib/src/albanian/ConjunctionSqi.gf | 2449 | bb9cd704c812e1e98741b86c05fa0a1cf50901de90f6114eacb474be3d7620ac |
| 8 | AlbanianSQI/GF/lib/src/albanian/ConstructionSqi.gf | 7642 | 0d666b86e05ca4d3e789b5a05169eaf1ff8940b0ecbcac8ae67330839d0b0fa7 |
| 9 | AlbanianSQI/GF/lib/src/albanian/DictSqi.gf | 278709 | b3c3986e8105aa878d1d6a3e0a7dfffab181b27ebc9001c81f8a3c824e7d84ca |
| 10 | AlbanianSQI/GF/lib/src/albanian/DictSqiAbs.gf | 134858 | 6f435488586784c2f82adaae001a3c58729aa99467305bb49b6038cd3ddad97d |
| 11 | AlbanianSQI/GF/lib/src/albanian/DocumentationSqi.gf | 9602 | 32015778d2d69f0a8c9900a4fb2db307990be4745391bfdf8c839b68b53d0b4d |
| 12 | AlbanianSQI/GF/lib/src/albanian/ExtendSqi.gf | 15614 | 8b37ec20a88403b82da6bf0fb46f2412bf92a96d757e8a4f9c852aa62461545e |
| 13 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiAPCN.gf | 808 | 19ca0891e1bb1ee1e57c5c4b39cfd737919736c19b9bfa49553544e9a3f72f3c |
| 14 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiExistential.gf | 1193 | 5c3efa9dec862f0cff196931d7462c699d5d2584182c7970fc2fb1031c93ebcf |
| 15 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiFocusPrep.gf | 1388 | 0979070dc17af8b72cb2abfb27366fa1d45278bee4d26a2c5c272d30a8e1658a |
| 16 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiHelpers.gf | 2073 | 2fc5ad9880d997ae21921d132a5cfb8331967ee5e2d7cff5201ffb07ca4ec3a5 |
| 17 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiLexicon.gf | 1327 | 30e5ff71557e42629351184cf4586eda07d859d782f8efe76a9d62b41de5cf85 |
| 18 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiRNP.gf | 2655 | 738701c97a5feb36cf8ab7f047b6330bcd6b372e1b1b79d019473ed790614af6 |
| 19 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiScaffolding.gf | 6110 | e8070c9c5e0598e73d91bcdfb8d779a94e63c3100686ca1e1831969925d76a8c |
| 20 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPBridge.gf | 2619 | afef170ca46b7120249372a73b08c79c87c5ecb666ddeef3b6e97b5b847b820f |
| 21 | AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPS.gf | 4463 | b611bc72468d349d9a175cf67da24b3f1a7878bdd195dee9140bbcac2d6d6b66 |
| 22 | AlbanianSQI/GF/lib/src/albanian/ExtraSqi.gf | 4175 | 8b4d54d573f64fe1554d67ff37a9acbee6db0348d156710a6b871d4a1d6e8583 |
| 23 | AlbanianSQI/GF/lib/src/albanian/ExtraSqiAbs.gf | 249 | ec8fd7bbeff3d6692fa8814d5695dab8255f247f9b427293ed63dbc7b0138595 |
| 24 | AlbanianSQI/GF/lib/src/albanian/GrammarSqi.gf | 293 | 25a1415d6be38a4ebb34aba7b2a95ed25e731ec3b2f39fa6eaf8f499f439a8e2 |
| 25 | AlbanianSQI/GF/lib/src/albanian/IdiomSqi.gf | 1712 | 960eef4064513d988ca345fb993fddb0a37e1453ba8f76f5e54c5cd3a2089b73 |
| 26 | AlbanianSQI/GF/lib/src/albanian/IrregSqi.gf | 10602 | f96cfc6aa0a8c7719f44c4ab2e5ef62969c14154b199e0c79403b8ba1dd4aa05 |
| 27 | AlbanianSQI/GF/lib/src/albanian/IrregSqiAbs.gf | 371 | 9d883b2c0346cfae7303e63b35ea03dfcb188c56c9c1132c4c1542f1d4ae7fe0 |
| 28 | AlbanianSQI/GF/lib/src/albanian/LangSqi.gf | 342 | 6fc7e4864c1c0774e857c1a5ada785d6c949aedecd8196d8572ea8586d0ad4d7 |
| 29 | AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf | 19015 | b724d800c49efda27b75333c4d72c990e4f824d679a19cc6922fcc02e377dec6 |
| 30 | AlbanianSQI/GF/lib/src/albanian/MarkupSqi.gf | 594 | 75f4cd82aecff30cfb2fd0b869891324ed835ba90510203ef10afd0899c20649 |
| 31 | AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf | 1074832 | 729706f857ae4b3e31934b218ffb775d2b2386618b5e5ddf3b822edda8702a42 |
| 32 | AlbanianSQI/GF/lib/src/albanian/NamesSqi.gf | 796 | 6238d02d77f0ed38331c8d2f7df0c5c83b2d169c219a4e72b6010a383a3e5319 |
| 33 | AlbanianSQI/GF/lib/src/albanian/NounSqi.gf | 6727 | 36bd0c213d2c538abdb66ebf1c7517cb952331f97a45bb6d994b1b2d66f19c70 |
| 34 | AlbanianSQI/GF/lib/src/albanian/NumeralSqi.gf | 3607 | 6e42bed324fc8a6d3419c6b5cd9f036fdfc5f006170273bd1cb049784a0b1f9f |
| 35 | AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf | 54260 | b65f668abd6dc093d5a3eb58ed4eeb44917aa0f4ee97560775f3e4090811cc51 |
| 36 | AlbanianSQI/GF/lib/src/albanian/PhraseSqi.gf | 699 | 0aa65b0fc48aa6a806a3418c3f753cf9413b816c05ad7691c11a37dad4483b88 |
| 37 | AlbanianSQI/GF/lib/src/albanian/QuestionSqi.gf | 1486 | 16db9f278ad007e736295f65409f748dff3569e5ec36e6fa4e0cb1f77c4c9e94 |
| 38 | AlbanianSQI/GF/lib/src/albanian/RelativeSqi.gf | 512 | 0cf99fc89948f01a987d99c0c4adaee0d2ed545bcf396afa4e903dde37905b70 |
| 39 | AlbanianSQI/GF/lib/src/albanian/ResSqi.gf | 14477 | 0ce1f35dcedb68d6084d30e781d013b5aa1376526095d7659f5b640ce8e23727 |
| 40 | AlbanianSQI/GF/lib/src/albanian/SentenceSqi.gf | 1480 | ad7d4a1530e5a97516964a05bebbd3e2ca31acf2a5f2fc31608096aa6a17ae87 |
| 41 | AlbanianSQI/GF/lib/src/albanian/StructuralSqi.gf | 3954 | f41c5f14229add8891ef594452d185092d118cbfa556d8d8203dcf41c73dcb86 |
| 42 | AlbanianSQI/GF/lib/src/albanian/StructuralSqiClause.gf | 3499 | 4d7b2df5a215cf4b3e7c421ec6fddac690a653348d4b442e162509fe1bb9b748 |
| 43 | AlbanianSQI/GF/lib/src/albanian/StructuralSqiNominal.gf | 3519 | f1291088e6e36c05bf282e6ab628328b89640bac098a0d2cd73bbfb557fb0946 |
| 44 | AlbanianSQI/GF/lib/src/albanian/StructuralSqiRes.gf | 1491 | d10734d0fb341211a002c0dfa38ca343bfc14996aca82e85417df4712b51838b |
| 45 | AlbanianSQI/GF/lib/src/albanian/StructuralSqiVerbal.gf | 842 | 1c6d5c304c057702d327b1677b4c11d51e973512b0a5fb291cc99cc67c7b82c6 |
| 46 | AlbanianSQI/GF/lib/src/albanian/SymbolSqi.gf | 2591 | 198b6debe7481749c316095aa0951358eca31490a0cca6a38c4659557236ba40 |
| 47 | AlbanianSQI/GF/lib/src/albanian/TenseSqi.gf | 301 | 6151ea201b403c6f7376af9130c1af1c5bd343e69bad645a0f13e1f5760ed2fe |
| 48 | AlbanianSQI/GF/lib/src/albanian/TestAbs.gf | 42 | 246586665bee347c3fbf00982d214d72e962d9e154b0d8101989d607141264f0 |
| 49 | AlbanianSQI/GF/lib/src/albanian/TestSqi.gf | 114 | 2b8fd5cb64ead40c56d6571fbee4da77a8c5049d2ef6b524c7bb749a4ef25978 |
| 50 | AlbanianSQI/GF/lib/src/albanian/TextSqi.gf | 230 | 040ad087a26fe7d5df7d3be48bca8463abe5ad763fe4193e552b4994717f4c22 |
| 51 | AlbanianSQI/GF/lib/src/albanian/VerbSqi.gf | 6200 | cf11e0294eed6f893ec137bc8db24b1bb40b50b1ea5dd2fd8e3e776c73eb8589 |
| 52 | AlbanianSQI/GF/lib/src/CombinatorsSqi.gf | 180 | f7421fbe296ee520f18eb991e4ddbbc01e770d0936187d12ed1a7d9b955b868a |
| 53 | AlbanianSQI/GF/lib/src/ConstructorsSqi.gf | 120 | f53cc1fb3c6a14c962793c12c1482b7a6da08c2a50dd2695d1c1cd5b85a526bf |
| 54 | AlbanianSQI/GF/lib/src/SymbolicSqi.gf | 125 | 5ca94698737674e446ebea7c68e83784e1e34ae04d65b13a371a2479ad7920ce |
| 55 | AlbanianSQI/GF/lib/src/SyntaxSqi.gf | 140 | b1d9a967ab05380039cc0885808f94e59566bdc401d53e861b87306b749273d2 |
| 56 | AlbanianSQI/GF/lib/src/TrySqi.gf | 246 | 6b64275078d77f7675c9073495559d35bb3f193d9359a303ecb2b6c75fe37f8c |
| 57 | AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf | 23878 | 3bbdbcc386cb928639ddd51cd04f562f8d4816a3ac2465da2b7055f14f85b6a5 |
| 58 | AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf | 10759 | e2ac38e5fc9b192782f9efa59a6b20025e4d37e4a41c929ae7c83caa9a72d353 |

## Scenario lock

Observed current scenario inventory: **52 `.gfs` files**.

| # | scenario | bytes | SHA-256 |
| --- | --- | --- | --- |
| 1 | validation/scenarios/alb-adj-01.gfs | 775 | 9e173b4a8b9726313ba32ac338066c3a1cbccf2dab0d8be4c198d9017f629c8d |
| 2 | validation/scenarios/alb-adj-02.gfs | 765 | a88498eaff40635962486e0e34e583863df1bbfe7064173b20e333caa9022f39 |
| 3 | validation/scenarios/alb-adj-03.gfs | 765 | 9fa12e0dd924672f52d573b177b97a1b66fbb73c9907a0702072a8b817909ce1 |
| 4 | validation/scenarios/alb-adj-04.gfs | 825 | f9a43d651907ef45510d8aed7eb99478cbf4efa192e292121f68ef881e98a950 |
| 5 | validation/scenarios/alb-adj-05.gfs | 765 | 56363a03e8d63c9c9354706655793951cf03807eacd70d98925ae9c49c2159ae |
| 6 | validation/scenarios/alb-clitic-ditransitive.gfs | 767 | 6c095bfad0cdcecbddfd9270ec7916299a91eb933c29aa2067fa4c4f5fb18600 |
| 7 | validation/scenarios/alb-clitic-negative.gfs | 817 | 8e3de978d6bb5ef2a3445f4b1ec5424c51b646005e0d3f02716588ea260c5802 |
| 8 | validation/scenarios/alb-clitic-objects.gfs | 727 | f97b10e07d79e0b5912042037fd03c049d2aafd28a932b0b57223afe15f08c81 |
| 9 | validation/scenarios/alb-clitic-vp.gfs | 760 | 09eb9785fd24610a981d875cd29b9d91bf2af143c2c50b0dabb8aed1d0b7ce2b |
| 10 | validation/scenarios/alb-complement-control.gfs | 731 | 05a7bdfad2745865bf5f0ad8409de8dc450623101e300d0a5e2abc4615c7796d |
| 11 | validation/scenarios/alb-construction-01.gfs | 773 | 04ae0c941a997df7e1fedb53ccc2f5b958ad8c8bd73bfd51d7f9b6686ed5d565 |
| 12 | validation/scenarios/alb-construction-02.gfs | 732 | 2012ec9c2b1bacd3ea41028397fbde615ee057d548bdd97be02ff76bc8f6c951 |
| 13 | validation/scenarios/alb-cross-01.gfs | 823 | 2dd8ff568c157d28e9dbe479e927fec106fd5fcc3caef36050f7ef9d9f9e2d4b |
| 14 | validation/scenarios/alb-cross-02.gfs | 798 | c3f4096d551ee0444c7b3dbdff09abffbbf7fcd83895cb0407df11b6325c5f04 |
| 15 | validation/scenarios/alb-cross-03.gfs | 845 | b46563466dddb16696d84e9b975a9f8e2c63f64e3e39f32a32ac86daf960a4ca |
| 16 | validation/scenarios/alb-dict-smoke.gfs | 1785 | 6045b82a4908c53a161ec48072200d77e59c92964375aa62a46a5148095f5c7d |
| 17 | validation/scenarios/alb-morphodict-smoke.gfs | 1457 | b98cc913f78b64732185256d71604f1bd8b0102a832c9ec3c34e63b33f73baa6 |
| 18 | validation/scenarios/alb-names-preps.gfs | 686 | 75c17cfe808192f07d2a92539f9a9f2ea3b2355fbbde40678d30c9519f03c07c |
| 19 | validation/scenarios/alb-noun-01.gfs | 780 | 33e73328c6915ddd121e7fe9fe03fb59d801299e05977e8367ad8fee495c8973 |
| 20 | validation/scenarios/alb-noun-02.gfs | 770 | dce183f4c9f51e3be99aea3fd20c4f64d7ad14393fb300abc4cf385f347f7593 |
| 21 | validation/scenarios/alb-noun-03.gfs | 780 | 4d9cc124d926e5b734346dd4877897a51d529120c42347ced52180e140539f8a |
| 22 | validation/scenarios/alb-noun-04.gfs | 790 | 7f8e547dfce8b3029c9ea92d0e357d6c3aa1003df7925ada0f7722ad110ea9fb |
| 23 | validation/scenarios/alb-noun-05.gfs | 800 | 94a17b6b9931f1aee43262e7e611fcdb3c0fee5fe8bfb35d1a4cefe54ccbae2f |
| 24 | validation/scenarios/alb-noun-06.gfs | 780 | 4a20f2085dbaa50523b92cbca7619e2855915d12fe8441c5ecdfa98cdda8e9ca |
| 25 | validation/scenarios/alb-noun-07.gfs | 770 | 18b8e689618984ab8b18eb3c50aa087353e612bd581dcc182c7d22e73e1dd3b4 |
| 26 | validation/scenarios/alb-noun-08.gfs | 790 | 0f337b8efeebbc34a31335ab6a0bb91d19dcc89c983ab219504c910847a599a8 |
| 27 | validation/scenarios/alb-noun-09.gfs | 810 | b5950cfd906718d18c8a46ea967bfbee6e5f695dc012571a1a9f29dc2f3decfc |
| 28 | validation/scenarios/alb-noun-10.gfs | 820 | 7c3ee6feedeec9d394db01c5563b78b734dde41ada57b244c7ddc9c2da8177e3 |
| 29 | validation/scenarios/alb-numerals.gfs | 682 | d65e620a44ca7739b828c234632ebbbeeb4a4a9fdd047d2f4803e2210d797f24 |
| 30 | validation/scenarios/alb-question-wh.gfs | 731 | 655f4296a6b4cd900ae802bc9e7c7931cec341898c22df82dded7542cac8956a |
| 31 | validation/scenarios/alb-question-yesno.gfs | 743 | 69e227c509b64642b48d0d1be6e1122320df69b38a75f8d1c83d5baff0b01f50 |
| 32 | validation/scenarios/alb-relative-object.gfs | 759 | 0d9e8d282374a3ff55d019b1a216e84a9a36c4864e619bbf6f555d4d9a509e5d |
| 33 | validation/scenarios/alb-relative-subject.gfs | 730 | 7559d40e8f78e876eda481515c9721e2860b61e4aae41f10ad8f066f06d88bda |
| 34 | validation/scenarios/alb-subordination.gfs | 815 | 97c986e862a49054a24cb15de9415054b3bf3877023fcaf79f6bf471e11dbaea |
| 35 | validation/scenarios/alb-syntax-adverbial.gfs | 732 | 63ac5f495e12fab604bc6674917c944df58676c14747fa838821f3c0510c8e96 |
| 36 | validation/scenarios/alb-syntax-basic.gfs | 688 | e6665d167b57813f4dedda5289d7e899d2f8f6d56c8f7610b32ff051d6d8caac |
| 37 | validation/scenarios/alb-syntax-complements-a.gfs | 779 | 8e1000150d3aff892d9172f008c7c11a187d70de39ca721d434a508622bf5618 |
| 38 | validation/scenarios/alb-syntax-complements-b.gfs | 768 | b2e93be8bf9964b086dfda33e6d6a57f7633406c737d120ca22a79facf2f8482 |
| 39 | validation/scenarios/alb-syntax-coordination.gfs | 713 | 46bf7da8420a62dac54441b3da905a4bd772c83b5c894522573a2190630cbdde |
| 40 | validation/scenarios/alb-syntax-copular.gfs | 702 | c7bc4fb5d749170cd82d2425b6cfb38c119033b980896d7fc396d7c6b24993ec |
| 41 | validation/scenarios/alb-syntax-v2.gfs | 756 | bddfdd9e8a69d00636f66b4e69f8d494ba1fa53232c6ba6930e98f07d784f74c |
| 42 | validation/scenarios/alb-syntax-v3.gfs | 759 | c9ed75a4fd87733fa37bfe70ccd1f85c17157d35365b4f351f96f63bb83580e7 |
| 43 | validation/scenarios/alb-verb-01.gfs | 773 | 8d5e6fbd43c2b15b0673061703f520ac9ac73c1be3f1730a198d17ab1fe076fb |
| 44 | validation/scenarios/alb-verb-02.gfs | 753 | 9a00745d8c1a567240a1416897047457678692874ffc85e179167416e10e1f03 |
| 45 | validation/scenarios/alb-verb-03.gfs | 773 | 21365d79334fc5a25f5a06c104db2c843b9fa101e42076020cc6e695c59f7c0e |
| 46 | validation/scenarios/alb-verb-04.gfs | 773 | 6ff42ebb9344a13f67072af36d1eacd8ef2fad837cf7e1882c23f7e7fbda2208 |
| 47 | validation/scenarios/alb-verb-05.gfs | 793 | 56de4b61661a0770d561f6733d29ea8cadd2db3e3272ed69363616af9a3c8321 |
| 48 | validation/scenarios/alb-verb-06.gfs | 773 | 0baf05e24d59c2b5b84955e1bc6ecc911b7d42caf0229d7469d16fbb39e591e7 |
| 49 | validation/scenarios/alb-verb-07.gfs | 783 | dd309f00ce30730cee2f9533efe8d517f9d9fb2d5fac56575ae6add405b19ffc |
| 50 | validation/scenarios/alb-verb-08.gfs | 783 | c19ec56d803efdb187a8d5b0e78efe53244c2784d15fa923506f0edb73e3a8c9 |
| 51 | validation/scenarios/alb-verb-09.gfs | 773 | 62b818b04c5694498841b1d3c782e4b161d2d81aee3ef132bd0ae4631db5c2f7 |
| 52 | validation/scenarios/alb-verb-10.gfs | 803 | 99fd4cb71b189363aeba21b4ae4093bb7dfa35637ae4a3b0a5170ae5341baa83 |

## Reviewable CASE baseline

The current Albanian parity roadmap records **569 reviewable generated CASEs** as the active linguistic-review workload. This number is a review baseline, distinct from the 52 scenario-file count and from gold certification.

## Gold lock

Current snapshot contains only `validation/gold/.gitkeep`. Therefore the baseline has scenario execution coverage but no stored linguistic gold corpus in that directory. A future C8 gold is a **promotion event**, not an assumed existing baseline.

## Migration rule

Any intentional change to a locked hash must be accompanied by:

1. reason;
2. affected contract/decision ID;
3. focused test result;
4. full 58/58 + 52/52 rerun result;
5. updated hash row;
6. review status.

<!-- END 03_BASELINE_LOCK.md -->


---

<!-- BEGIN 04_PARALLEL_CONVERSATION_OWNERSHIP_LOCK.md -->

# Parallel-conversation ownership lock

## Why this exists

Ten Albanian-RGL conversations are being developed in parallel. A patch can be locally correct and still conflict with another subsystem. This document prevents silent cross-thread architectural drift.

## C8 ownership classes

| Class | Files/subsystems | Rule |
|---|---|---|
| `C8_PRIMARY` | `VerbSqi.gf`, `ConjunctionSqi.gf`, `ConstructionSqi.gf`, `IdiomSqi.gf` | C8 may change behavior after evidence + tests. |
| `SHARED_CONTRACT` | `CatSqi.gf`, `ResSqi.gf`, `ClauseSqiRes.gf`, `ParadigmsSqi.gf` | Any representation/signature change requires an explicit migration record and consumer audit. |
| `SHARED_EXTEND` | `ExtendSqi.gf`, `ExtendSqiVPS.gf`, `ExtendSqiVPBridge.gf`, `ExtendSqiScaffolding.gf`, related Extend companions | Change only the C8-owned behavior; preserve companion ownership boundaries. |
| `HANDOFF` | `DictSqi*`, `LexiconSqi.gf`, `StructuralSqi*` | C8 proposes/promotes entries only after core constructors are proven. |
| `OUT_OF_SCOPE_DEFAULT` | `MorphoSqi.gf`, noun/adjective morphology internals | Do not modify to solve a syntax/valence problem unless evidence proves morphology is the root cause. |
| `QUARANTINED_REFERENCE` | `development/draftmax/**` | Mine one demonstrated idea at a time; never overlay wholesale. |

## Collision protocol

Before editing a `SHARED_*` file:

1. identify the exact record field/type/function to change;
2. enumerate producers and consumers;
3. record whether another conversation has changed the same boundary;
4. if the other conversation ownership is unknown, mark `PARALLEL_OWNER_TBD` and avoid irreversible representation changes;
5. prefer an additive field/helper over destructive reinterpretation;
6. compile focused consumers before full validation;
7. update `18_TRACEABILITY_MATRIX.md`.

## Forbidden parallel-development behavior

- changing `Agr`, `VP`, `VPSlash`, `Compl`, `NP` or lexical category shape only because one local function is awkward;
- changing a shared field's meaning without changing all producers/consumers;
- importing DRAFT-MAX type changes as a block;
- solving a C8 failure by adding a placeholder in DictSqi;
- treating a concurrent patch as authoritative until it is merged into the same source lock.

## Missing input

The exact ownership map of Conversations 1-7 and 9-10 has not been supplied here. This document therefore deliberately does **not** invent those owners. Once supplied, add a table mapping each shared file/field to all conversation IDs before a shared representation migration.

<!-- END 04_PARALLEL_CONVERSATION_OWNERSHIP_LOCK.md -->


---

<!-- BEGIN 05_API_PARITY_MATRIX.md -->

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

<!-- END 05_API_PARITY_MATRIX.md -->


---

<!-- BEGIN 06_VALENCY_DATAFLOW_CONTRACT.md -->

# Valency dataflow contract

## Observed current representations

```gf
V, VA, VV, VS, VQ = Verb
V2 = Verb ** {c2 : Compl}
V2S, V2Q, V3, V2A, V2V = Verb ** {c2,c3 : Compl}
Compl = {s : Str ; c : Case}
```

`NP` currently carries case forms, accusative/dative clitics, agreement and `isPron`. `VP` carries finite/subjunctive/imperative/participle morphology plus `cl`, `subjcl` and agreement-indexed `post`; `VPSlash` adds the unsaturated complement `c2`.

## Required producer -> carrier -> consumer chains

| Information | Producer | Carrier | Final consumer | Invariant |
|---|---|---|---|---|
| object case/preposition | `ParadigmsSqi.mkV2*`, lexical entry | `V2.c2`, then `VPSlash.c2` | `ComplSlash` / `saturateSlash` | case is not flattened before NP realization |
| second/third argument government | `mkV3`, `mkV2*` | `c2`, `c3` | `Slash2V3`, `Slash3V3`, V2X slash functions | slot identity must not swap silently |
| NP clitic form | pronoun/NP constructor | `NP.acc_clit/dat_clit/isPron/a` | slash saturation | clitic choice is driven by object + governed case |
| embedded subjunctive marker | VP construction | `VP.subjcl` | `vpiStr` / `realizeSubjVP` | no caller should recreate clitic contraction ad hoc |
| embedded predicate agreement | controller analysis | explicit controller metadata or correct argument | `ComplVA` / `SlashV2A` | never default to matrix subject merely because only subject `Agr` is available |
| finite declarative complementizer | lexical/construction policy | **target metadata TBD** | `ComplVS` / `SlashV2S` | current hard-coded `që` is not automatically universal |
| V2V controller | lexical valence | **target metadata TBD** | `SlashV2V`, `SlashV2VNP`, VPI realization | subject-control vs object-control must be explicit when Albanian distinguishes them |

## Current proven implementation facts

- `ComplVV` realizes the embedded VP through its `subjcl + subjunctive + post` path.
- `ComplVS` currently hard-codes `që`.
- `SlashV2S` currently combines `c3.s + që + S`.
- `SlashV2A` currently selects AP agreement from the `Agr` passed to the matrix VP, exposing the known secondary-predicate controller risk.
- `SlashV2V` and `SlashV2VNP` preserve `c2/c3`, but no explicit lexical controller field exists in the current category representation.

## Migration rule

Do not add a new field until all four are named:

```text
semantic meaning -> producer -> every carrier -> final consumer
```

A field with no final consumer is rejected. A consumer that reconstructs information discarded earlier is a design defect.

<!-- END 06_VALENCY_DATAFLOW_CONTRACT.md -->


---

<!-- BEGIN 07_VALENCY_AND_COMPLEMENTATION_CONTRACT.md -->

# Valency and complementation contract

## Target category semantics

| Category | Required distinction |
|---|---|
| V | no selected object/complement in the RGL valence sense |
| V2 | one selected NP/PP object with government |
| V3 | two selected nominal/prepositional complements with distinct slots |
| VS | finite declarative/clausal complement |
| VQ | embedded question complement |
| VV | verbal complement; Standard/Tosk strategy must not be assumed to be English infinitival syntax |
| VA | adjectival predicate complement controlled by matrix subject unless evidence establishes another analysis |
| V2S | object plus clausal complement |
| V2Q | object plus embedded question |
| V2A | object plus secondary adjectival predicate; controller must be explicit/correct |
| V2V | object plus verbal complement; control relation must be evidence-backed |

## Standard/Tosk complement evidence already locked

The supplied PDF states that the subjunctive is a chief marker of subordination and gives intention/modal examples with `të` + subjunctive. It also states that Tosk/Standard uses subjunctive subordinate clauses in many contexts where Geg uses `me` + participle. The UT lessons independently give `dua të ...`, tense-sequenced subjunctive examples, and finite-clause strategies corresponding to English infinitival complements.

Consequence: C8 must treat English `VP`/infinitival labels as abstract API semantics, not as an instruction to manufacture an English-like infinitive.

## Lexical constructor requirements

Final `ParadigmsSqi` must expose enough constructor distinctions to build every valence category without raw record surgery. Current observed constructors already include `mkV2`, `mkVV`, `mkVS`, `mkVQ`, `mkVA`, `mkV2V`, `mkV2S`, `mkV2Q`, `mkV2A`, `mkV3`.

The next question is not constructor existence but whether the constructors carry enough Albanian-specific metadata. Add overloads/metadata only when a reviewed lexical contrast demands them.

## Required lexical evidence per promoted verb

- lemma and sense relevant to the GF function;
- selected category;
- complement case/preposition for every nominal slot;
- finite vs subjunctive/verbal complement behavior;
- control relation for V2V/VV where applicable;
- clitic compatibility/doubling implications when relevant;
- at least one positive realization test;
- a contrastive negative/alternative test when the distinction could collapse.

## Anti-patterns

- `V` plus manually appended object string instead of V2/V3;
- V2/V3 whose case is ignored at saturation;
- all VS hard-coded identically without lexical evidence;
- interpreting every RGL `VV` as an English infinitive;
- using V2A subject agreement because the current function happens to receive subject `Agr`;
- creating a DictSqi placeholder instead of fixing a core constructor/realizer.

<!-- END 07_VALENCY_AND_COMPLEMENTATION_CONTRACT.md -->


---

<!-- BEGIN 08_COPULA_SECONDARY_PREDICATION_CONTRACT.md -->

# Copula and secondary predication contract

## Copular families

The public `Verb` API requires `CompNP`, `CompAP`, `CompCN`, `CompAdv`, `UseComp`, `UseCopula`. Current Sqi realizes them through `jam` with deferred complement material.

Finalization requires separate tests for:

- identity/classification (`NP`, `CN`);
- adjectival predication (`AP`) with agreement;
- locative/adverbial/PP predication (`Adv`);
- polarity and tense;
- subject number/gender/person interactions where the complement is agreement-sensitive.

## Secondary predication

`V2A` is not simply `V2 + AP string`. It encodes an object plus a predicative AP. The user-supplied regression family `e lyeva i kuq` is a mandatory design test.

### Protected invariant

The AP agreement controller must be the Albanian syntactic controller justified by evidence. Current code in `SlashV2A` realizes the AP using the `Agr` passed into the matrix VP, which is normally the matrix subject channel. This is explicitly **PROVISIONAL/RISK** until corrected or linguistically justified.

### Required architecture outcome

If object-controlled agreement is required, the solution must carry the object agreement to the secondary-predicate realization boundary. Do not patch the final string with a hard-coded article/adjective form.

## Resultative vs depictive

No final claim is made from the supplied evidence that Albanian uses one uniform construction for all English-style resultatives/depictives. Keep these as separate test/evidence families. A successful `V2A` example does not certify the full semantic class.

## Evidence gate

Secondary-predication decisions remain `EVIDENCE_REQUIRED` unless supported by an Albanian reference/example beyond the user-provided regression family.

<!-- END 08_COPULA_SECONDARY_PREDICATION_CONTRACT.md -->


---

<!-- BEGIN 09_COORDINATION_AND_AGREEMENT_CONTRACT.md -->

# Coordination and agreement contract

## Active public surface

Current Sqi directly implements all 9 active public conjunction functions: `ConjS`, `ConjRS`, `ConjAP`, `ConjNP`, `ConjAdv`, `ConjAdV`, `ConjIAdv`, `ConjCN`, `ConjDet`.

## Current risks

- NP list agreement is currently hard-coded to `{gn=GPl; p=P3}`.
- CN coordination propagates a stored gender from list members rather than proving a coordinated-gender resolution rule.
- These facts compile but are not equivalent to a linguistic agreement analysis.

## Final target

### NP
Store/derive enough information to compute the agreement required by Albanian coordinated subjects. Person resolution, number and gender must be evidence-backed. Do not import English resolution rules by default.

### AP/CN
Coordinate full inflectional tables without losing case/species/number/gender distinctions. Any resolved gender metadata must reflect Albanian evidence rather than whichever conjunct was easiest to copy.

### S/RS/Adv/AdV/IAdv/Det
Preserve constituent type and punctuation/conjunction ordering without semantic loss.

### VP-like coordination
The locked RGL does not provide ordinary `ConjVP` in `Conjunction.gf`; C8 therefore uses the scoped `Extend` families (`VPS/VPI/VPS2/VPI2`) for predicate coordination where appropriate. This boundary must stay explicit.

## Linguistic evidence state

The supplied PDF explicitly lists common coordinating conjunctions (`dhe/e/edhe`, alternatives such as `a/apo/ose`, adversatives), but the current supplied evidence does **not** establish a complete coordinated-subject agreement resolution algorithm. That algorithm remains `EVIDENCE_REQUIRED`.

<!-- END 09_COORDINATION_AND_AGREEMENT_CONTRACT.md -->


---

<!-- BEGIN 10_CONSTRUCTION_AND_IDIOM_CONTRACT.md -->

# ConstructionSqi and IdiomSqi final contract

## Surface status

All 68 active abstract `Construction` functions and all 14 abstract `Idiom` functions have direct definitions in the current Sqi modules. Presence is not certification.

## Construction classification

Each function must be classified into one of:

1. compositional reuse of certified core grammar;
2. lexicalized but linguistically evidenced expression;
3. provisional literal/string realization requiring review;
4. N/A only if the abstract contract permits/needs a language-specific non-equivalent strategy and the decision is documented.

High-risk families:

- age/name/distance;
- stative predicates such as hungry/thirsty/right/wrong;
- weather;
- measurement/container constructions;
- date/time expressions;
- language expressions;
- any helper using invariant nouns/NPs solely for convenience.

## Idiom classification

Mandatory review families:

- impersonal and generic clauses;
- clefts;
- existentials with/without locative Adv;
- progressive;
- first-person plural and third-person imperatives;
- emphatic/reflexive `Self*` constructions.

## Existential contract

Current `IdiomSqi` uses a dedicated existential word path (`ka/pati/do të ketë/...`) rather than simply `jam`. This is an implementation fact, not yet blanket linguistic certification. Test number, polarity, tense, locative extension and interrogative counterparts independently.

## Progressive contract

Do not infer English `be + -ing` architecture. The supplied references identify Albanian gerundive formations (`duke` + participle in Standard/Tosk descriptions), but the exact RGL progressive realization must be tested for tense/polarity/argument interactions.

## Composition rule

`ConstructionSqi` and `IdiomSqi` should reuse certified core constructors whenever possible. A special string is acceptable only when the construction is genuinely lexicalized and evidence records that fact.

<!-- END 10_CONSTRUCTION_AND_IDIOM_CONTRACT.md -->


---

<!-- BEGIN 11_LINGUISTIC_EVIDENCE_LEDGER.md -->

# Albanian linguistic evidence ledger

The following entries are the high-impact evidence already localized in the supplied package. They are evidence records, not a complete grammar.

| ID | Phenomenon | Source locator | Dialect/scope | Supported claim | Status |
|---|---|---|---|---|---|
| E-C8-001 | subjunctive subordination | `Albanian.pdf`, PDF page 32 (printed p.35), phrase "The subjunctive is the chief mark of subordination" | general/standard examples | `të` + subjunctive is central in subordinate complements; examples include intention, begin, modal can/must | ACCEPTED |
| E-C8-002 | Standard/Tosk vs Geg verbal complement | `Albanian.pdf`, PDF page 34 (printed p.37), section `4.2.8 The infinite forms of the verb` | Standard/Tosk vs Geg | Geg `me + participle` corresponds in many constructions to Tosk/Standard subjunctive subordinate clauses | ACCEPTED |
| E-C8-003 | clitic doubling | `Albanian.pdf`, PDF page 35 (printed p.38), phrase `clitic doubling` | Albanian | direct/indirect objects may be represented by full NP plus agreeing case/person/number clitic | ACCEPTED |
| E-C8-004 | coordinating conjunction inventory | `Albanian.pdf`, PDF page 40 (printed p.43), `4.7 The Conjunctions and the subordinators` | Albanian | common coordinators include `dhe/e/edhe`, `a/apo/ose`, adversatives | ACCEPTED |
| E-C8-005 | complementizer/subordinator inventory | same PDF page/section as E-C8-004 | Albanian | `se` and `që` introduce subordinate clauses with epistemic verbs in supplied examples | ACCEPTED, lexical selection scope not exhaustive |
| E-C8-006 | tense sequence in desiderative complement | `Lesson_20.html`, paragraph containing `dua të shkosh ... desha të shkoje` | Tosk/Standard lesson | present vs past matrix desiderative is illustrated with present vs imperfect subjunctive complement | ACCEPTED example; general rule scope requires care |
| E-C8-007 | finite strategy instead of English infinitive | `Lesson_30.html`, paragraph `Instead of an infinitive, a finite verb is used` | Tosk/Standard | finite/subjunctive clauses cover functions that English often expresses infinitivally | ACCEPTED |
| E-C8-008 | expletive/impersonal adjectival predication | `Lesson_30.html`, paragraph beginning `When the object being described is not specified for gender` | Tosk/Standard lesson | example `është e vështirë të mësoni shqip` uses feminine adjective with understood expletive | ACCEPTED example; architectural generalization provisional |
| E-C8-009 | clitic position with subjunctive/future particles | `Lesson_30.html`, paragraph `When using a verb form obligatorily preceded by a particle...` | Tosk/Standard | clitics occur between `të` and verb; contractions such as `të + e` are described | ACCEPTED |
| E-C8-010 | Tosk infinitive statement | `Albanian_Complete_Grammar.html`, phrase `Tosk lacks infinitives altogether` | Tosk | source explicitly contrasts Tosk with Geg infinitive | ACCEPTED source claim; reconcile terminology with PDF's `për të + participle` before naming RGL forms |
| E-C8-011 | V2A object secondary-predicate agreement | user-provided regression family `e lyeva i kuq` | user-provided example | motivates object-controlled secondary-predicate tests | PROVISIONAL until independent Albanian source is linked |
| E-C8-012 | coordinated-subject agreement resolution | no sufficient supplied locator found yet | — | no final algorithm licensed | EVIDENCE_REQUIRED |
| E-C8-013 | raising vs control lexical classes | no sufficient supplied locator found yet | — | do not finalize lexical controller classes by analogy | EVIDENCE_REQUIRED |
| E-C8-014 | full resultative vs depictive distinction | no sufficient supplied locator found yet | — | one V2A example does not certify the whole family | EVIDENCE_REQUIRED |

## Terminology conflict rule

The supplied materials use "infinitive" differently in places: the PDF describes a `për të + participle` infinitive-like formation while the UT grammar states that Tosk lacks infinitives and has a newer formation fulfilling some infinitival roles. C8 must preserve this source distinction instead of collapsing it into one English-style `Inf` type. For RGL implementation, name the actual Albanian form/strategy, not the English translation label.

## Evidence expansion priorities

1. independent secondary-predication examples;
2. coordinated subject agreement with person/gender combinations;
3. lexical control/raising contrasts for VV/V2V;
4. VS complementizer selection (`që`/`se`/zero if attested);
5. existential/progressive tense and polarity distributions.

<!-- END 11_LINGUISTIC_EVIDENCE_LEDGER.md -->


---

<!-- BEGIN 12_MODEL_LANGUAGE_SELECTION_MATRIX.md -->

# Model-language selection matrix

Model code is consulted only after the Albanian question and exact RGL contract are identified.

| Phenomenon | Primary coverage reference | Comparative candidates | What may be borrowed | What may NOT be borrowed without Albanian evidence |
|---|---|---|---|---|
| public valence/API breadth | English | German/French/Spanish/Italian | constructor/API coverage patterns | complement form, case, controller |
| subjunctive verbal complements | English for API only | Bulgarian, Macedonian, Greek, Romanian | metadata/deferred-realization architecture | actual particles/mood distribution |
| clitic object realization | English only for abstract category | Romanian/Italian/French/Spanish; Balkan candidates | carrier/slot architecture | clitic inventory/order/doubling rule |
| V3 government | English | German/Romanian/Balkan candidates | c2/c3 separation | actual Albanian cases/prepositions |
| V2A/secondary predication | English API | Romance/Balkan candidates | keeping controller metadata | agreement morphology/controller rule |
| copular complements | English | Romance/Balkan | separation of Comp types | copula choice/distribution |
| coordination | English API | Balkan/Romance as evidence candidates | list architecture, delayed agreement | person/gender resolution |
| existential/progressive | English API | Balkan/Romance | separation from ordinary copula | lexical verb/particle choice |
| Construction/Idiom completeness | English | all mature languages selectively | coverage checklist, compositionality patterns | literal idiom translation |

## Comparison procedure

For every borrowed pattern record:

```text
Albanian problem -> exact RGL signature -> Albanian evidence -> candidate model -> representation compatibility -> minimal patch
```

Never start from "English does X, therefore Sqi should do X".

<!-- END 12_MODEL_LANGUAGE_SELECTION_MATRIX.md -->


---

<!-- BEGIN 13_DICTSQI_VALENCY_AUDIT.md -->

# DictSqi valency audit - quantitative baseline

## Current abstract category counts

Total functions parsed from `DictSqiAbs.gf`: **6720**.

| category | count |
| --- | --- |
| V | 2175 |
| V2 | 50 |
| V3 | 5 |
| VS | 4 |
| VQ | 2 |
| VV | 0 |
| VA | 1 |
| V2A | 1 |
| V2S | 1 |
| V2Q | 1 |
| V2V | 1 |

For context: `N=4310`, `A=110`, `Adv=19`.

## Placeholder pressure

Observed constructor-token occurrences in current `DictSqi.gf`:

| helper | occurrences including definition |
| --- | --- |
| invariantN | 4135 |
| invariantA | 65 |
| invariantV | 2142 |

The provenance ledger contains:

| validation_status | rows |
| --- | --- |
| imported_unreviewed | 6339 |
| baseline_lexicon_exact | 337 |
| reference_attested_unreviewed | 44 |

## Interpretation

The exit criterion is **not** to maximize non-`V` counts mechanically. It is to promote entries only when lexical evidence establishes valence. However, the current distribution is a strong signal that C8 must make rich categories practical: `VV` is currently absent and the high-valence families are represented by only a handful of functions.

## Promotion protocol

Each promotion row must record:

| field | requirement |
|---|---|
| `gf_id` | exact DictSqi function |
| `lemma/sense` | lexical identity being classified |
| `old_category` | usually `V` or provisional category |
| `new_category` | one of the justified valence categories |
| `c2/c3` | case/preposition where applicable |
| `embedding` | finite/question/subjunctive/verbal/adjectival strategy |
| `controller` | where VV/V2V/V2A requires one |
| `evidence_id` | Albanian lexical/grammar evidence |
| `constructor` | public `ParadigmsSqi` constructor; no low-level record unless justified |
| `test_id` | focused C8 case |
| `review_status` | REVIEW_REQUIRED/CERTIFIED |

## Safety rule

Do not convert imported unreviewed verbs from `V` to richer categories by WordNet-like semantic guess alone. Richer category = stronger grammatical claim.

<!-- END 13_DICTSQI_VALENCY_AUDIT.md -->


---

<!-- BEGIN 14_TEST_CASE_CATALOG.md -->

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

<!-- END 14_TEST_CASE_CATALOG.md -->


---

<!-- BEGIN 15_TEST_CERTIFICATION_RELEASE_GATE.md -->

# Test, certification and release gate

## Gate ladder

| Gate | Requirement | Blocking? |
|---|---|---|
| C8-G0 Source lock | hashes match intended baseline or documented migration | yes |
| C8-G1 Contract | exact abstract signature + ownership resolved | yes |
| C8-G2 Focused compile | edited module and direct consumers compile | yes |
| C8-G3 Structural C8 | relevant C8 structural tests pass | yes |
| C8-G4 Full compile | 58/58 | yes |
| C8-G5 Baseline scenarios | 52/52 | yes |
| C8-G6 Linguistic review | changed output and relevant items from the 569-CASE review baseline classified against Albanian evidence | yes for certification |
| C8-G7 Gold | reviewed stable outputs promoted where appropriate | yes for final linguistic certification |
| C8-G8 Dict handoff | relevant lexical promotions use real categories and pass tests | yes for declared Dict maturity |
| C8-G9 Documentation reconciliation | decision/evidence/traceability/risk updated | yes |

## Final C8 release criteria

- no unexplained public API function in scope;
- no untracked hard-coded grammatical choice introduced by C8;
- no unresolved `EVIDENCE_REQUIRED` item represented as final/certified behavior;
- all representation changes have complete producer/carrier/consumer audit;
- no known regression against baseline hashes without migration record;
- 58/58 + 52/52 after final patch set;
- C8 gold suite exists and passes for all behaviors claimed linguistically certified;
- DictSqi valence improvements are evidence-backed rather than semantic guessing.

## Stop conditions

Stop implementation and return to evidence/architecture if:

- the needed controller cannot be represented without changing a shared type;
- two plausible Albanian analyses lead to different category contracts;
- a model language is the only support for an Albanian behavior;
- a fix requires discarding case/agreement/clitic information before its final consumer;
- full baseline breaks and the failure cannot be causally localized.

<!-- END 15_TEST_CERTIFICATION_RELEASE_GATE.md -->


---

<!-- BEGIN 16_IMPLEMENTATION_SEQUENCE.md -->

# Implementation sequence

The order is dependency-driven. Do not implement the most visible string first.

## C8-0 Freeze and measure

- verify source hashes;
- rerun/confirm 58/58 + 52/52 when execution environment permits;
- record current Dict valence distribution;
- classify existing C8 tests and outputs.

## C8-1 Evidence closure for high-risk semantics

Resolve, in this order:

1. V2A controller/secondary predication;
2. V2V/VV control classes;
3. VS/V2S complementizer selection;
4. coordinated-subject agreement;
5. existential/progressive details.

No shared representation migration before the relevant evidence is sufficient.

## C8-2 Minimal metadata extension

If evidence proves current types insufficient:

- add only the minimum metadata;
- update producer/carrier/consumer map;
- add constructors in `ParadigmsSqi`;
- keep default/backward-compatible path for existing lexicon where semantically valid;
- test direct consumers.

## C8-3 Realizers

Update `VerbSqi`/`ClauseSqiRes` and scoped Extend helpers. Keep clitic/tense realization centralized.

## C8-4 Coordination

Only after agreement evidence is available, replace hard-coded/copy-through agreement with an explicit resolver.

## C8-5 Construction/Idiom cleanup

Rebuild high-risk constructions on certified core machinery; review lexicalized leftovers individually.

## C8-6 DictSqi promotion campaign

Promote selected verbs from generic `V` to richer categories in evidence-backed batches. Each batch has its own rollback boundary.

## C8-7 Certification

Focused tests -> 58/58 -> 52/52 -> linguistic review -> gold promotion -> documentation reconciliation.

<!-- END 16_IMPLEMENTATION_SEQUENCE.md -->


---

<!-- BEGIN 17_DECISIONS_AND_OPEN_QUESTIONS.md -->

# Decisions and open questions

## Locked decisions

| ID | Decision |
|---|---|
| C8-D001 | English is coverage/API reference, not Albanian realization authority. |
| C8-D002 | Standard/Tosk verbal complementation must not be modeled as English infinitive syntax by default. |
| C8-D003 | Government remains typed (`Compl` with case) until nominal realization. |
| C8-D004 | DRAFT-MAX is a quarantined idea source; no whole-overlay activation. |
| C8-D005 | DictSqi valence promotion follows core capability, never precedes it with placeholders. |
| C8-D006 | Structural green status and linguistic certification are separate states. |
| C8-D007 | Predicate coordination uses the locked API/Extend boundary rather than inventing incompatible public functions. |

## Open questions

| ID | Question | Blocking target | Evidence needed |
|---|---|---|---|
| C8-Q001 | What is the correct agreement controller and form inventory for object secondary predicates? | V2A | independent Albanian examples/reference |
| C8-Q002 | Which Albanian verbs are subject-control vs object-control vs raising-like? | VV/V2V | lexical/syntactic evidence |
| C8-Q003 | When do VS/V2S select `që`, `se`, another strategy, or allow variation? | VS/V2S | lexical complement evidence |
| C8-Q004 | How is person resolved in coordinated subjects? | ConjNP | Albanian agreement examples |
| C8-Q005 | How is gender resolved for coordinated NP/CN where downstream agreement is gender-sensitive? | ConjNP/ConjCN | Albanian agreement examples |
| C8-Q006 | Which English/RGL resultative/depictive distinctions are grammatical/productive in Albanian? | V2A/Extend | Albanian construction evidence |
| C8-Q007 | What exact tense/polarity distribution should existential `ka` use? | Idiom | Albanian examples/reference |
| C8-Q008 | What is the final Standard-Albanian progressive mapping for RGL `ProgrVP`? | Idiom/Extend | Albanian aspect/progressive evidence |

## Decision update rule

An open question becomes a locked decision only when evidence ID(s), implementation consequence and test ID(s) are recorded together.

<!-- END 17_DECISIONS_AND_OPEN_QUESTIONS.md -->


---

<!-- BEGIN 18_TRACEABILITY_MATRIX.md -->

# Traceability matrix

| ID | capability | code owner | critical metadata | evidence | tests | state |
| --- | --- | --- | --- | --- | --- | --- |
| C8-T001 | VV complement | VerbSqi ComplVV; ClauseSqiRes | VP.subjcl/subjunctive/post | E-C8-001/002/006 | C8-VAL-001/002 | PROVISIONAL |
| C8-T002 | VS complement | VerbSqi ComplVS | currently hard-coded që | E-C8-005 | C8-VAL-003/004 | PROVISIONAL |
| C8-T003 | V2 saturation/clitics | VerbSqi saturateSlash | Compl.c; NP clitics/agreement | E-C8-003/009 | C8-VAL-006/007 | PROVISIONAL |
| C8-T004 | V3 slots | ParadigmsSqi mkV3; VerbSqi Slash2/3V3 | c2/c3 | E-C8-003 | C8-VAL-008 | PROVISIONAL |
| C8-T005 | V2V control | VerbSqi SlashV2V/SlashV2VNP | controller metadata TBD | E-C8-013 | C8-VAL-011/012 | EVIDENCE_REQUIRED |
| C8-T006 | V2A secondary predicate | VerbSqi SlashV2A | object controller channel TBD | E-C8-011/014 | C8-SP-001/002 | EVIDENCE_REQUIRED |
| C8-T007 | copular AP | VerbSqi CompAP/UseComp | subject Agr | TBD | C8-COP-002 | REVIEW_REQUIRED |
| C8-T008 | impersonal AP complement | Extend PredAPVP / core | default/expletive agreement | E-C8-008 | C8-COP-004 | PROVISIONAL |
| C8-T009 | NP coordination agreement | ConjunctionSqi BaseNP/ConsNP/ConjNP | list Agr | E-C8-012 | C8-CONJ-001/002/003 | EVIDENCE_REQUIRED |
| C8-T010 | CN coordination gender | ConjunctionSqi BaseCN/ConsCN/ConjCN | list gender | E-C8-012 | C8-CONJ-005 | EVIDENCE_REQUIRED |
| C8-T011 | predicate coordination | ExtendSqiVPS family | VPS/VPI metadata | TBD | C8-CONJ-006 | PROVISIONAL |
| C8-T012 | existential | IdiomSqi Exist* | existWord | TBD | C8-ID-001/002/003 | REVIEW_REQUIRED |
| C8-T013 | progressive | IdiomSqi ProgrVP; Extend ProgrVPSlash | VP morphology/post | TBD | C8-ID-004 | REVIEW_REQUIRED |
| C8-T014 | Dict valence handoff | DictSqi/ParadigmsSqi | category+c2/c3+metadata | per-entry | promotion batch tests | TARGET |

## Rule

No code change in C8 is complete unless at least one traceability row is updated or a new row is added.

<!-- END 18_TRACEABILITY_MATRIX.md -->


---

<!-- BEGIN 19_DELIVERY_CHANGE_PROTOCOL.md -->

# Delivery and change protocol

Every C8 delivery must include these sections, in this order:

1. **Scope** - exact functions/phenomena changed.
2. **Files modified** - production, tests, docs.
3. **Reason/evidence** - decision and evidence IDs.
4. **Contract delta** - types/fields/semantics changed or explicitly "none".
5. **Compatibility** - why existing lexical entries remain valid or what migration is required.
6. **Focused validation** - commands/results or explicit not-run limitation.
7. **Full validation** - 58/58 and 52/52 results when executable.
8. **Linguistic status** - what is reviewed vs still provisional.
9. **Risks/open questions**.
10. **Overlay/snapshot** - exact files and hashes if a patch artifact is delivered.

## Patch size policy

Prefer one semantic boundary per patch. Do not combine, for example, coordinated-subject agreement and V2A controller migration unless they require the same shared representation and are tested together.

## Rollback policy

Each patch must be reversible without deleting unrelated later work. Shared-type migrations require a before/after field map.

<!-- END 19_DELIVERY_CHANGE_PROTOCOL.md -->


---

<!-- BEGIN 20_ANTI_DRIFT_RULES.md -->

# Anti-drift rules

1. Never redefine an RGL abstract function locally; use the locked signature.
2. Never infer Albanian grammar from English surface syntax.
3. Never treat a compiler-green placeholder as linguistic evidence.
4. Never flatten case/government before the NP realization boundary.
5. Never choose a secondary-predicate controller because it is the only `Agr` currently in scope.
6. Never hard-code one complementizer for all lexical classes without evidence.
7. Never collapse V2/V3/V2X into V merely to avoid constructor work.
8. Never promote DictSqi valence from semantic intuition alone.
9. Never import a DRAFT-MAX overlay wholesale.
10. Never change a shared record field without producer/consumer audit.
11. Never let a model-language pattern outrank Albanian evidence.
12. Never call a behavior certified without a linked reviewed test/gold.
13. Never change the baseline hash silently.
14. Never invent ownership for another parallel conversation; mark it unknown and coordinate.
15. Never let documentation claim a run that was not executed on the described source state.

<!-- END 20_ANTI_DRIFT_RULES.md -->


---

<!-- BEGIN 21_RISK_REGISTER.md -->

# Risk register

| ID | risk | severity | failure mode | mitigation |
| --- | --- | --- | --- | --- |
| R-C8-01 | V2A agreement uses subject channel | high | wrong secondary predicate morphology | E-C8-011 + independent evidence; controller-aware patch |
| R-C8-02 | VV/V2V controller absent | high | incorrect embedded agreement/control | lexical evidence + minimal controller metadata if needed |
| R-C8-03 | VS/V2S hard-coded që | medium-high | wrong complementizer selection | lexical evidence; defer selection |
| R-C8-04 | ConjNP hard-coded P3 plural | high | wrong coordinated-subject agreement | agreement evidence before resolver |
| R-C8-05 | ConjCN gender copied | medium-high | downstream gender mismatch | evidence-backed resolution or representation change |
| R-C8-06 | Construction literals | medium | surface plausibility hides non-compositional grammar | classify/rebuild on core |
| R-C8-07 | Parallel shared-type edits | high | cross-conversation breakage | ownership lock + migration protocol |
| R-C8-08 | Dict over-promotion | high | false valence claims at scale | evidence-backed batches only |
| R-C8-09 | No current gold corpus | medium | scenario green mistaken for linguistic regression proof | build reviewed C8 golds |
| R-C8-10 | Terminology: Tosk infinitive | medium | wrong RGL category mapping | preserve source distinction; model actual forms |

<!-- END 21_RISK_REGISTER.md -->


---

<!-- BEGIN 22_GLOSSARY.md -->

# C8 glossary

**Complement government** - lexical selection of case/adposition for an argument.  
**Controller** - argument whose syntactic/semantic features determine an embedded subject or secondary predicate relation.  
**Raising** - dependency where a matrix argument is not semantically selected in the same way as a control argument; no Albanian class is assumed until evidenced.  
**Secondary predicate** - AP/other predicate predicated of an argument in addition to the matrix verb.  
**Resultative** - secondary predicate interpreted as a result state; productivity in Albanian remains evidence-sensitive.  
**Depictive** - secondary predicate describing a state concurrent with the matrix event.  
**`Compl`** - current Sqi record `{s : Str ; c : Case}` carrying adposition string plus governed case.  
**`VP.post`** - current deferred agreement-indexed material appended at VP realization.  
**`VP.cl` / `VP.subjcl`** - current clitic/subjunctive-prefix channels.  
**Structural green** - compiler/test success without a claim of linguistic correctness.  
**Reviewed** - checked against Albanian evidence by the agreed review process.  
**Gold** - reviewed expected output stored as a regression oracle.  
**Placeholder** - compile-safe form deliberately not claimed as linguistically correct.  
**Model language** - comparative engineering reference, never Albanian linguistic authority.

<!-- END 22_GLOSSARY.md -->
