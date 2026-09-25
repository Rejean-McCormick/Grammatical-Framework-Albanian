# Source Lock and Authority — Clause Syntax v2

**Status:** normative  
**Rule:** never implement from recalled behavior when an exact supplied source exists.

## 1. Locked inputs

| Input | Bytes | SHA-256 | Role |
|---|---:|---|---|
| `Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip` | 1261630 | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` | current Albanian working snapshot |
| `gf-rgl-master.zip` | 46535093 | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` | supplied full RGL comparison snapshot |
| `Albanian_ref(20260925-125548).zip` | 909703 | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` | supplied Albanian linguistic/reference bundle |

The supplied `gf-rgl-master.zip` contains no `.git` metadata. Its filename must not be treated as an immutable Git revision. The project roadmap separately records an English reference commit; that identity is coordination metadata, not proven to be identical to the supplied ZIP.

## 2. Integration baseline documented by the Albanian snapshot

`docs/status/ALBANIAN_ENGLISH_PARITY_ROADMAP_20260925.md` records:

- GF `3.12`;
- Wordbench `1.3.4`;
- run `20260925_112639`;
- `58/58` GF files OK;
- `52/52` scenarios OK;
- `0` structural lock warnings;
- source-lock SHA-256 `6834fc8975ce82a6c4984280bff1000dae644f134fec457996abb9f25888ef37`;
- linguistic certification `NOT ESTABLISHED`;
- `569` reviewable generated CASEs.

The project context supplied by the maintainer names baseline/tag `albanian-s02-green-20260925`. That tag is a declared integration identifier; no Git tag object is present in the supplied ZIP, so this package does not invent a Git object hash for it.

## 3. Authority order by claim type

### RGL contract claims

1. exact abstract signature in supplied RGL source;
2. exact current Albanian category/resource type consumed by the code;
3. GF compiler/type evidence from the locked source;
4. Compendium contract records and workflows.

### Albanian linguistic claims

1. supplied Albanian linguistic references;
2. accepted Albanian golds/review records once established;
3. accepted Albanian decision records;
4. current output only as evidence of implementation behavior;
5. model-language code only as architectural comparison.

### Build-state claims

1. exact Wordbench/GF evidence for the same source lock;
2. current source snapshot and hash manifests;
3. earlier runs as historical regression evidence only.

### Architecture claims

1. target-language producer/consumer requirements;
2. current Albanian category contracts;
3. Compendium pattern applicability gates;
4. compatible model-language architecture.

## 4. Evidence-status vocabulary

| Status | Meaning |
|---|---|
| `SOURCE_FACT` | directly supported by supplied exact source/reference |
| `IMPLEMENTED` | code path exists; no correctness claim implied |
| `GF_VALIDATED` | compiled/executed in locked GF evidence |
| `BEHAVIOR_OBSERVED` | scenario output exists but is not yet linguistically accepted |
| `LINGUISTICALLY_REVIEWED` | human/explicit linguistic review has accepted the behavior |
| `GOLD_CERTIFIED` | accepted behavior is locked by stable regression gold |
| `OPEN` | evidence/decision insufficient; implementation must not silently settle it |
| `SPECIALIST` | legitimate non-canonical path with documented reason and tests |

## 5. Current clause-source hashes

| File | Bytes | SHA-256 |
| --- | --- | --- |
| `ClauseSqiRes.gf` | 4396 | `34ec8dc40f03a240a2369f62e58c4eda7392d9395b7040c488fbca51afe0cb36` |
| `SentenceSqi.gf` | 1480 | `ad7d4a1530e5a97516964a05bebbd3e2ca31acf2a5f2fc31608096aa6a17ae87` |
| `QuestionSqi.gf` | 1486 | `16db9f278ad007e736295f65409f748dff3569e5ec36e6fa4e0cb1f77c4c9e94` |
| `RelativeSqi.gf` | 512 | `0cf99fc89948f01a987d99c0c4adaee0d2ed545bcf396afa4e903dde37905b70` |
| `CatSqi.gf` | 2744 | `8fb7b05b7ad8af60f19894cafdfdc878a885467d969e9e308fb4efae86199210` |
| `ResSqi.gf` | 14477 | `0ce1f35dcedb68d6084d30e781d013b5aa1376526095d7659f5b640ce8e23727` |
| `VerbSqi.gf` | 6200 | `cf11e0294eed6f893ec137bc8db24b1bb40b50b1ea5dd2fd8e3e776c73eb8589` |
| `ConjunctionSqi.gf` | 2449 | `bb9cd704c812e1e98741b86c05fa0a1cf50901de90f6114eacb474be3d7620ac` |
| `StructuralSqiClause.gf` | 3499 | `4d7b2df5a215cf4b3e7c421ec6fddac690a653348d4b442e162509fe1bb9b748` |
| `StructuralSqiNominal.gf` | 3519 | `f1291088e6e36c05bf282e6ab628328b89640bac098a0d2cd73bbfb557fb0946` |
| `IdiomSqi.gf` | 1712 | `960eef4064513d988ca345fb993fddb0a37e1453ba8f76f5e54c5cd3a2089b73` |
| `ConstructionSqi.gf` | 7642 | `0d666b86e05ca4d3e789b5a05169eaf1ff8940b0ecbcac8ae67330839d0b0fa7` |
| `ExtendSqi.gf` | 15614 | `8b37ec20a88403b82da6bf0fb46f2412bf92a96d757e8a4f9c852aa62461545e` |
| `ExtendSqiScaffolding.gf` | 6110 | `e8070c9c5e0598e73d91bcdfb8d779a94e63c3100686ca1e1831969925d76a8c` |
| `ExtendSqiVPBridge.gf` | 2619 | `afef170ca46b7120249372a73b08c79c87c5ecb666ddeef3b6e97b5b847b820f` |
| `ExtendSqiVPS.gf` | 4463 | `b611bc72468d349d9a175cf67da24b3f1a7878bdd195dee9140bbcac2d6d6b66` |
| `ExtraSqi.gf` | 4175 | `8b4d54d573f64fe1554d67ff37a9acbee6db0348d156710a6b871d4a1d6e8583` |
| `PhraseSqi.gf` | 699 | `0aa65b0fc48aa6a806a3418c3f753cf9413b816c05ad7691c11a37dad4483b88` |

Every implementation patch must record before/after hashes for each modified GF file.

## 6. Scenario corpus lock

- Total required scenarios in supplied snapshot: **52**.
- Total CASE markers: **569**.
- Scenario success in the roadmap baseline: **52/52**.
- Scenario success does not mean these 569 outputs are linguistically certified.

The full per-scenario hashes are intentionally stored here so a future test edit cannot be mistaken for an unchanged baseline:

| Scenario | CASEs | SHA-256 |
| --- | --- | --- |
| `alb-adj-01.gfs` | 10 | `9e173b4a8b9726313ba32ac338066c3a1cbccf2dab0d8be4c198d9017f629c8d` |
| `alb-adj-02.gfs` | 10 | `a88498eaff40635962486e0e34e583863df1bbfe7064173b20e333caa9022f39` |
| `alb-adj-03.gfs` | 10 | `9fa12e0dd924672f52d573b177b97a1b66fbb73c9907a0702072a8b817909ce1` |
| `alb-adj-04.gfs` | 10 | `f9a43d651907ef45510d8aed7eb99478cbf4efa192e292121f68ef881e98a950` |
| `alb-adj-05.gfs` | 10 | `56363a03e8d63c9c9354706655793951cf03807eacd70d98925ae9c49c2159ae` |
| `alb-clitic-ditransitive.gfs` | 10 | `6c095bfad0cdcecbddfd9270ec7916299a91eb933c29aa2067fa4c4f5fb18600` |
| `alb-clitic-negative.gfs` | 10 | `8e3de978d6bb5ef2a3445f4b1ec5424c51b646005e0d3f02716588ea260c5802` |
| `alb-clitic-objects.gfs` | 10 | `f97b10e07d79e0b5912042037fd03c049d2aafd28a932b0b57223afe15f08c81` |
| `alb-clitic-vp.gfs` | 10 | `09eb9785fd24610a981d875cd29b9d91bf2af143c2c50b0dabb8aed1d0b7ce2b` |
| `alb-complement-control.gfs` | 10 | `05a7bdfad2745865bf5f0ad8409de8dc450623101e300d0a5e2abc4615c7796d` |
| `alb-construction-01.gfs` | 10 | `04ae0c941a997df7e1fedb53ccc2f5b958ad8c8bd73bfd51d7f9b6686ed5d565` |
| `alb-construction-02.gfs` | 10 | `2012ec9c2b1bacd3ea41028397fbde615ee057d548bdd97be02ff76bc8f6c951` |
| `alb-cross-01.gfs` | 10 | `2dd8ff568c157d28e9dbe479e927fec106fd5fcc3caef36050f7ef9d9f9e2d4b` |
| `alb-cross-02.gfs` | 10 | `c3f4096d551ee0444c7b3dbdff09abffbbf7fcd83895cb0407df11b6325c5f04` |
| `alb-cross-03.gfs` | 10 | `b46563466dddb16696d84e9b975a9f8e2c63f64e3e39f32a32ac86daf960a4ca` |
| `alb-dict-smoke.gfs` | 39 | `6045b82a4908c53a161ec48072200d77e59c92964375aa62a46a5148095f5c7d` |
| `alb-morphodict-smoke.gfs` | 30 | `b98cc913f78b64732185256d71604f1bd8b0102a832c9ec3c34e63b33f73baa6` |
| `alb-names-preps.gfs` | 10 | `75c17cfe808192f07d2a92539f9a9f2ea3b2355fbbde40678d30c9519f03c07c` |
| `alb-noun-01.gfs` | 10 | `33e73328c6915ddd121e7fe9fe03fb59d801299e05977e8367ad8fee495c8973` |
| `alb-noun-02.gfs` | 10 | `dce183f4c9f51e3be99aea3fd20c4f64d7ad14393fb300abc4cf385f347f7593` |
| `alb-noun-03.gfs` | 10 | `4d9cc124d926e5b734346dd4877897a51d529120c42347ced52180e140539f8a` |
| `alb-noun-04.gfs` | 10 | `7f8e547dfce8b3029c9ea92d0e357d6c3aa1003df7925ada0f7722ad110ea9fb` |
| `alb-noun-05.gfs` | 10 | `94a17b6b9931f1aee43262e7e611fcdb3c0fee5fe8bfb35d1a4cefe54ccbae2f` |
| `alb-noun-06.gfs` | 10 | `4a20f2085dbaa50523b92cbca7619e2855915d12fe8441c5ecdfa98cdda8e9ca` |
| `alb-noun-07.gfs` | 10 | `18b8e689618984ab8b18eb3c50aa087353e612bd581dcc182c7d22e73e1dd3b4` |
| `alb-noun-08.gfs` | 10 | `0f337b8efeebbc34a31335ab6a0bb91d19dcc89c983ab219504c910847a599a8` |
| `alb-noun-09.gfs` | 10 | `b5950cfd906718d18c8a46ea967bfbee6e5f695dc012571a1a9f29dc2f3decfc` |
| `alb-noun-10.gfs` | 10 | `7c3ee6feedeec9d394db01c5563b78b734dde41ada57b244c7ddc9c2da8177e3` |
| `alb-numerals.gfs` | 10 | `d65e620a44ca7739b828c234632ebbbeeb4a4a9fdd047d2f4803e2210d797f24` |
| `alb-question-wh.gfs` | 10 | `655f4296a6b4cd900ae802bc9e7c7931cec341898c22df82dded7542cac8956a` |
| `alb-question-yesno.gfs` | 10 | `69e227c509b64642b48d0d1be6e1122320df69b38a75f8d1c83d5baff0b01f50` |
| `alb-relative-object.gfs` | 10 | `0d9e8d282374a3ff55d019b1a216e84a9a36c4864e619bbf6f555d4d9a509e5d` |
| `alb-relative-subject.gfs` | 10 | `7559d40e8f78e876eda481515c9721e2860b61e4aae41f10ad8f066f06d88bda` |
| `alb-subordination.gfs` | 10 | `97c986e862a49054a24cb15de9415054b3bf3877023fcaf79f6bf471e11dbaea` |
| `alb-syntax-adverbial.gfs` | 10 | `63ac5f495e12fab604bc6674917c944df58676c14747fa838821f3c0510c8e96` |
| `alb-syntax-basic.gfs` | 10 | `e6665d167b57813f4dedda5289d7e899d2f8f6d56c8f7610b32ff051d6d8caac` |
| `alb-syntax-complements-a.gfs` | 10 | `8e1000150d3aff892d9172f008c7c11a187d70de39ca721d434a508622bf5618` |
| `alb-syntax-complements-b.gfs` | 10 | `b2e93be8bf9964b086dfda33e6d6a57f7633406c737d120ca22a79facf2f8482` |
| `alb-syntax-coordination.gfs` | 10 | `46bf7da8420a62dac54441b3da905a4bd772c83b5c894522573a2190630cbdde` |
| `alb-syntax-copular.gfs` | 10 | `c7bc4fb5d749170cd82d2425b6cfb38c119033b980896d7fc396d7c6b24993ec` |
| `alb-syntax-v2.gfs` | 10 | `bddfdd9e8a69d00636f66b4e69f8d494ba1fa53232c6ba6930e98f07d784f74c` |
| `alb-syntax-v3.gfs` | 10 | `c9ed75a4fd87733fa37bfe70ccd1f85c17157d35365b4f351f96f63bb83580e7` |
| `alb-verb-01.gfs` | 10 | `8d5e6fbd43c2b15b0673061703f520ac9ac73c1be3f1730a198d17ab1fe076fb` |
| `alb-verb-02.gfs` | 10 | `9a00745d8c1a567240a1416897047457678692874ffc85e179167416e10e1f03` |
| `alb-verb-03.gfs` | 10 | `21365d79334fc5a25f5a06c104db2c843b9fa101e42076020cc6e695c59f7c0e` |
| `alb-verb-04.gfs` | 10 | `6ff42ebb9344a13f67072af36d1eacd8ef2fad837cf7e1882c23f7e7fbda2208` |
| `alb-verb-05.gfs` | 10 | `56de4b61661a0770d561f6733d29ea8cadd2db3e3272ed69363616af9a3c8321` |
| `alb-verb-06.gfs` | 10 | `0baf05e24d59c2b5b84955e1bc6ecc911b7d42caf0229d7469d16fbb39e591e7` |
| `alb-verb-07.gfs` | 10 | `dd309f00ce30730cee2f9533efe8d517f9d9fb2d5fac56575ae6add405b19ffc` |
| `alb-verb-08.gfs` | 10 | `c19ec56d803efdb187a8d5b0e78efe53244c2784d15fa923506f0edb73e3a8c9` |
| `alb-verb-09.gfs` | 10 | `62b818b04c5694498841b1d3c782e4b161d2d81aee3ef132bd0ae4631db5c2f7` |
| `alb-verb-10.gfs` | 10 | `99fd4cb71b189363aeba21b4ae4093bb7dfa35637ae4a3b0a5170ae5341baa83` |

## 7. Supplied Albanian reference corpus

All files are inventoried, including those not currently used to justify clause decisions:

| Reference | Bytes | SHA-256 |
| --- | --- | --- |
| `Albanian_ref/Albanian.pdf` | 736185 | `189526590748a3bc921d46cfbac907632376caf0cc9a27903844b191ec2812ad` |
| `Albanian_ref/Albanian_Complete_Grammar.html` | 88453 | `39afeeb3d2fd90e70d41ba9bbcab1a27f64ea2addfec115ce8d784f0bd342a30` |
| `Albanian_ref/Geg_Glossary_Master.html` | 163621 | `38042fd683606fe52f855f6b2c1c2300e02f68ca3f782213b9744a06da82a3cf` |
| `Albanian_ref/Lesson_10.html` | 238832 | `3dbec8b21edb4091e329acc0e1a12ef4358955f6dfce67d3d877af10eae7f5fe` |
| `Albanian_ref/Lesson_20.html` | 257942 | `bc4cea05b4b3af552ea79b4b04890369f85e14f42ab79ea56e2815266bcb3405` |
| `Albanian_ref/Lesson_30.html` | 239908 | `ad971ebf9d999e984397cb308730db1dedca50c7836b722db9465b61590d10f0` |
| `Albanian_ref/Lesson_40.html` | 237126 | `983851068e33ad74927640e366f5ae2b60e1c65b294da7a342c74c5e708e1ace` |
| `Albanian_ref/Lesson_50.html` | 235194 | `636736e973486b2535f404434fc1f246b7f55c665cf1097dcd9efe2805445f5b` |
| `Albanian_ref/Tosk_Dictionary_Master.html` | 175423 | `fae38b11308bb8c3779fc84457fc3881218a2cd064283ae2412ddd8f561107f8` |
| `Albanian_ref/Tosk_Glossary_Master.html` | 216782 | `2574a6e86fa4bf1b891bbba0b85d33ba7eab13a9bbdef4660526ca8abf5b34df` |

### Current clause evidence actually used

- `Lesson_10.html`: general SVO/flexibility; subjunctive marker; analytic future.
- `Lesson_20.html`: present/subjunctive system and subordinate-clause use.
- `Lesson_30.html`: negation, indicative/subjunctive subordination, relative clauses, weak-pronoun placement/doubling, impersonal clausal-complement agreement example.
- `Lesson_50.html`: direct questions, interrogative case forms, required polar marker `a`.
- `Albanian_Complete_Grammar.html`: high-level corroboration only unless a claim is specifically located there.

`Lesson_40`, glossaries, dictionary and the PDF remain available but are **not silently treated as supporting evidence** for a clause claim unless a change record cites a specific section.

## 8. Compendium materials selected for this workstream

- `workflows/SYNTAX_IMPLEMENTATION.md`
- EP019 `single_clause_assembly_point`
- EP021 `polarity_propagation`
- EP023 `order_as_a_dimension`
- EP005 `segmented_clause_vp_slots`
- EP010 `inplace_vs_extraposed_material`
- Bulgarian, Greek, Macedonian and Romanian architecture profiles.

Pattern selection is conditional. The existence of EP023/EP005/EP010 is not evidence that Albanian needs an order parameter or extra slots.

## 9. Version-drift rule

If any locked input changes:

1. recompute hashes;
2. regenerate `13_CURRENT_IMPLEMENTATION_AUDIT.md` where line/site claims changed;
3. re-evaluate model comparisons if the RGL snapshot changed;
4. re-evaluate linguistic evidence only if the reference bundle changed;
5. mark previous compile/scenario evidence as belonging to the old source lock until rerun.
