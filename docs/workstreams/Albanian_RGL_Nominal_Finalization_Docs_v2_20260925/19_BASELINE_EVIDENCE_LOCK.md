# Baseline Evidence Lock — Albanian nominal workstream
> **Document version**: 2.0  
> **Document status**: GENERATED BASELINE AUTHORITY  
> **This file is the single source of truth for mutable baseline counts in this documentation set.**  
## 1. Evidence reported by the supplied Albanian roadmap

From `docs/status/ALBANIAN_ENGLISH_PARITY_ROADMAP_20260925.md` in the supplied snapshot:

- GF `3.12`
- GF Wordbench `1.3.4`
- Wordbench run `20260925_112639`
- overall `OK`
- GF files `58/58`
- direct/downstream failures `0/0`
- required scenarios `52`, scenarios `52/52`
- structural lock warnings `0`
- census `51 language + 5 API facades + 2 MorphoDict`
- evidence-derived state floor `S02_BASELINE_ESTABLISHED`
- linguistic certification `NOT ESTABLISHED`
- reviewable generated CASEs `569`
- gold corpus: not yet established
- Wordbench source-lock SHA-256 `6834fc8975ce82a6c4984280bff1000dae644f134fec457996abb9f25888ef37`

**Maintainer coordination label:** `albanian-s02-green-20260925`. This label was supplied in the conversation; it is not found as a literal tag in the archived source, so it must not be confused with a Git tag proven by the ZIP.

Supplied Albanian archive SHA-256: `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829`.
Generated 58-target manifest aggregate SHA-256: `2ecf9027c3460c0752fbe4d50f5940e692ee6c53f8c4fe5dacdda7d60d92539a`.
Generated 52-scenario manifest aggregate SHA-256: `ab998901f3213030ad82a7eaf678cbd7ec0fbb4c5317824a4eb8b67570700540`.

## 2. Exact 58-target census

| Target | SHA-256 | Bytes |
|---|---|---:|
| `AlbanianSQI/GF/lib/src/CombinatorsSqi.gf` | `f7421fbe296ee520f18eb991e4ddbbc01e770d0936187d12ed1a7d9b955b868a` | 180 |
| `AlbanianSQI/GF/lib/src/ConstructorsSqi.gf` | `f53cc1fb3c6a14c962793c12c1482b7a6da08c2a50dd2695d1c1cd5b85a526bf` | 120 |
| `AlbanianSQI/GF/lib/src/SymbolicSqi.gf` | `5ca94698737674e446ebea7c68e83784e1e34ae04d65b13a371a2479ad7920ce` | 125 |
| `AlbanianSQI/GF/lib/src/SyntaxSqi.gf` | `b1d9a967ab05380039cc0885808f94e59566bdc401d53e861b87306b749273d2` | 140 |
| `AlbanianSQI/GF/lib/src/TrySqi.gf` | `6b64275078d77f7675c9073495559d35bb3f193d9359a303ecb2b6c75fe37f8c` | 246 |
| `AlbanianSQI/GF/lib/src/albanian/AdjectiveSqi.gf` | `f7998b574626622b06ffc5014d6c340e0b2aeb153865bc25186955a4cf555328` | 1647 |
| `AlbanianSQI/GF/lib/src/albanian/AdverbSqi.gf` | `0758ed3b728ff4976ad28f15a28749f8ec29c2983c73dac67e233d27c6a58534` | 834 |
| `AlbanianSQI/GF/lib/src/albanian/AllSqi.gf` | `c15b24a3ddc60f0c5ac9d162a3b421f60ac6153bdfc18bf7cedae9089b876fc7` | 148 |
| `AlbanianSQI/GF/lib/src/albanian/AllSqiAbs.gf` | `8846ea36330556c347c9fb00cc6ba16bae7e5c5d3a7dc11430aa9d17c6a6baf7` | 61 |
| `AlbanianSQI/GF/lib/src/albanian/CatSqi.gf` | `8fb7b05b7ad8af60f19894cafdfdc878a885467d969e9e308fb4efae86199210` | 2744 |
| `AlbanianSQI/GF/lib/src/albanian/ClauseSqiRes.gf` | `34ec8dc40f03a240a2369f62e58c4eda7392d9395b7040c488fbca51afe0cb36` | 4396 |
| `AlbanianSQI/GF/lib/src/albanian/ConjunctionSqi.gf` | `bb9cd704c812e1e98741b86c05fa0a1cf50901de90f6114eacb474be3d7620ac` | 2449 |
| `AlbanianSQI/GF/lib/src/albanian/ConstructionSqi.gf` | `0d666b86e05ca4d3e789b5a05169eaf1ff8940b0ecbcac8ae67330839d0b0fa7` | 7642 |
| `AlbanianSQI/GF/lib/src/albanian/DictSqi.gf` | `b3c3986e8105aa878d1d6a3e0a7dfffab181b27ebc9001c81f8a3c824e7d84ca` | 278709 |
| `AlbanianSQI/GF/lib/src/albanian/DictSqiAbs.gf` | `6f435488586784c2f82adaae001a3c58729aa99467305bb49b6038cd3ddad97d` | 134858 |
| `AlbanianSQI/GF/lib/src/albanian/DocumentationSqi.gf` | `32015778d2d69f0a8c9900a4fb2db307990be4745391bfdf8c839b68b53d0b4d` | 9602 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqi.gf` | `8b37ec20a88403b82da6bf0fb46f2412bf92a96d757e8a4f9c852aa62461545e` | 15614 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiAPCN.gf` | `19ca0891e1bb1ee1e57c5c4b39cfd737919736c19b9bfa49553544e9a3f72f3c` | 808 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiExistential.gf` | `5c3efa9dec862f0cff196931d7462c699d5d2584182c7970fc2fb1031c93ebcf` | 1193 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiFocusPrep.gf` | `0979070dc17af8b72cb2abfb27366fa1d45278bee4d26a2c5c272d30a8e1658a` | 1388 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiHelpers.gf` | `2fc5ad9880d997ae21921d132a5cfb8331967ee5e2d7cff5201ffb07ca4ec3a5` | 2073 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiLexicon.gf` | `30e5ff71557e42629351184cf4586eda07d859d782f8efe76a9d62b41de5cf85` | 1327 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiRNP.gf` | `738701c97a5feb36cf8ab7f047b6330bcd6b372e1b1b79d019473ed790614af6` | 2655 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiScaffolding.gf` | `e8070c9c5e0598e73d91bcdfb8d779a94e63c3100686ca1e1831969925d76a8c` | 6110 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPBridge.gf` | `afef170ca46b7120249372a73b08c79c87c5ecb666ddeef3b6e97b5b847b820f` | 2619 |
| `AlbanianSQI/GF/lib/src/albanian/ExtendSqiVPS.gf` | `b611bc72468d349d9a175cf67da24b3f1a7878bdd195dee9140bbcac2d6d6b66` | 4463 |
| `AlbanianSQI/GF/lib/src/albanian/ExtraSqi.gf` | `8b4d54d573f64fe1554d67ff37a9acbee6db0348d156710a6b871d4a1d6e8583` | 4175 |
| `AlbanianSQI/GF/lib/src/albanian/ExtraSqiAbs.gf` | `ec8fd7bbeff3d6692fa8814d5695dab8255f247f9b427293ed63dbc7b0138595` | 249 |
| `AlbanianSQI/GF/lib/src/albanian/GrammarSqi.gf` | `25a1415d6be38a4ebb34aba7b2a95ed25e731ec3b2f39fa6eaf8f499f439a8e2` | 293 |
| `AlbanianSQI/GF/lib/src/albanian/IdiomSqi.gf` | `960eef4064513d988ca345fb993fddb0a37e1453ba8f76f5e54c5cd3a2089b73` | 1712 |
| `AlbanianSQI/GF/lib/src/albanian/IrregSqi.gf` | `f96cfc6aa0a8c7719f44c4ab2e5ef62969c14154b199e0c79403b8ba1dd4aa05` | 10602 |
| `AlbanianSQI/GF/lib/src/albanian/IrregSqiAbs.gf` | `9d883b2c0346cfae7303e63b35ea03dfcb188c56c9c1132c4c1542f1d4ae7fe0` | 371 |
| `AlbanianSQI/GF/lib/src/albanian/LangSqi.gf` | `6fc7e4864c1c0774e857c1a5ada785d6c949aedecd8196d8572ea8586d0ad4d7` | 342 |
| `AlbanianSQI/GF/lib/src/albanian/LexiconSqi.gf` | `b724d800c49efda27b75333c4d72c990e4f824d679a19cc6922fcc02e377dec6` | 19015 |
| `AlbanianSQI/GF/lib/src/albanian/MarkupSqi.gf` | `75f4cd82aecff30cfb2fd0b869891324ed835ba90510203ef10afd0899c20649` | 594 |
| `AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf` | `729706f857ae4b3e31934b218ffb775d2b2386618b5e5ddf3b822edda8702a42` | 1074832 |
| `AlbanianSQI/GF/lib/src/albanian/NamesSqi.gf` | `6238d02d77f0ed38331c8d2f7df0c5c83b2d169c219a4e72b6010a383a3e5319` | 796 |
| `AlbanianSQI/GF/lib/src/albanian/NounSqi.gf` | `36bd0c213d2c538abdb66ebf1c7517cb952331f97a45bb6d994b1b2d66f19c70` | 6727 |
| `AlbanianSQI/GF/lib/src/albanian/NumeralSqi.gf` | `6e42bed324fc8a6d3419c6b5cd9f036fdfc5f006170273bd1cb049784a0b1f9f` | 3607 |
| `AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf` | `b65f668abd6dc093d5a3eb58ed4eeb44917aa0f4ee97560775f3e4090811cc51` | 54260 |
| `AlbanianSQI/GF/lib/src/albanian/PhraseSqi.gf` | `0aa65b0fc48aa6a806a3418c3f753cf9413b816c05ad7691c11a37dad4483b88` | 699 |
| `AlbanianSQI/GF/lib/src/albanian/QuestionSqi.gf` | `16db9f278ad007e736295f65409f748dff3569e5ec36e6fa4e0cb1f77c4c9e94` | 1486 |
| `AlbanianSQI/GF/lib/src/albanian/RelativeSqi.gf` | `0cf99fc89948f01a987d99c0c4adaee0d2ed545bcf396afa4e903dde37905b70` | 512 |
| `AlbanianSQI/GF/lib/src/albanian/ResSqi.gf` | `0ce1f35dcedb68d6084d30e781d013b5aa1376526095d7659f5b640ce8e23727` | 14477 |
| `AlbanianSQI/GF/lib/src/albanian/SentenceSqi.gf` | `ad7d4a1530e5a97516964a05bebbd3e2ca31acf2a5f2fc31608096aa6a17ae87` | 1480 |
| `AlbanianSQI/GF/lib/src/albanian/StructuralSqi.gf` | `f41c5f14229add8891ef594452d185092d118cbfa556d8d8203dcf41c73dcb86` | 3954 |
| `AlbanianSQI/GF/lib/src/albanian/StructuralSqiClause.gf` | `4d7b2df5a215cf4b3e7c421ec6fddac690a653348d4b442e162509fe1bb9b748` | 3499 |
| `AlbanianSQI/GF/lib/src/albanian/StructuralSqiNominal.gf` | `f1291088e6e36c05bf282e6ab628328b89640bac098a0d2cd73bbfb557fb0946` | 3519 |
| `AlbanianSQI/GF/lib/src/albanian/StructuralSqiRes.gf` | `d10734d0fb341211a002c0dfa38ca343bfc14996aca82e85417df4712b51838b` | 1491 |
| `AlbanianSQI/GF/lib/src/albanian/StructuralSqiVerbal.gf` | `1c6d5c304c057702d327b1677b4c11d51e973512b0a5fb291cc99cc67c7b82c6` | 842 |
| `AlbanianSQI/GF/lib/src/albanian/SymbolSqi.gf` | `198b6debe7481749c316095aa0951358eca31490a0cca6a38c4659557236ba40` | 2591 |
| `AlbanianSQI/GF/lib/src/albanian/TenseSqi.gf` | `6151ea201b403c6f7376af9130c1af1c5bd343e69bad645a0f13e1f5760ed2fe` | 301 |
| `AlbanianSQI/GF/lib/src/albanian/TestAbs.gf` | `246586665bee347c3fbf00982d214d72e962d9e154b0d8101989d607141264f0` | 42 |
| `AlbanianSQI/GF/lib/src/albanian/TestSqi.gf` | `2b8fd5cb64ead40c56d6571fbee4da77a8c5049d2ef6b524c7bb749a4ef25978` | 114 |
| `AlbanianSQI/GF/lib/src/albanian/TextSqi.gf` | `040ad087a26fe7d5df7d3be48bca8463abe5ad763fe4193e552b4994717f4c22` | 230 |
| `AlbanianSQI/GF/lib/src/albanian/VerbSqi.gf` | `cf11e0294eed6f893ec137bc8db24b1bb40b50b1ea5dd2fd8e3e776c73eb8589` | 6200 |
| `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf` | `3bbdbcc386cb928639ddd51cd04f562f8d4816a3ac2465da2b7055f14f85b6a5` | 23878 |
| `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf` | `e2ac38e5fc9b192782f9efa59a6b20025e4d37e4a41c929ae7c83caa9a72d353` | 10759 |

## 3. Exact required-scenario inventory in supplied snapshot

| Scenario | SHA-256 | Bytes |
|---|---|---:|
| `validation/scenarios/alb-adj-01.gfs` | `9e173b4a8b9726313ba32ac338066c3a1cbccf2dab0d8be4c198d9017f629c8d` | 775 |
| `validation/scenarios/alb-adj-02.gfs` | `a88498eaff40635962486e0e34e583863df1bbfe7064173b20e333caa9022f39` | 765 |
| `validation/scenarios/alb-adj-03.gfs` | `9fa12e0dd924672f52d573b177b97a1b66fbb73c9907a0702072a8b817909ce1` | 765 |
| `validation/scenarios/alb-adj-04.gfs` | `f9a43d651907ef45510d8aed7eb99478cbf4efa192e292121f68ef881e98a950` | 825 |
| `validation/scenarios/alb-adj-05.gfs` | `56363a03e8d63c9c9354706655793951cf03807eacd70d98925ae9c49c2159ae` | 765 |
| `validation/scenarios/alb-clitic-ditransitive.gfs` | `6c095bfad0cdcecbddfd9270ec7916299a91eb933c29aa2067fa4c4f5fb18600` | 767 |
| `validation/scenarios/alb-clitic-negative.gfs` | `8e3de978d6bb5ef2a3445f4b1ec5424c51b646005e0d3f02716588ea260c5802` | 817 |
| `validation/scenarios/alb-clitic-objects.gfs` | `f97b10e07d79e0b5912042037fd03c049d2aafd28a932b0b57223afe15f08c81` | 727 |
| `validation/scenarios/alb-clitic-vp.gfs` | `09eb9785fd24610a981d875cd29b9d91bf2af143c2c50b0dabb8aed1d0b7ce2b` | 760 |
| `validation/scenarios/alb-complement-control.gfs` | `05a7bdfad2745865bf5f0ad8409de8dc450623101e300d0a5e2abc4615c7796d` | 731 |
| `validation/scenarios/alb-construction-01.gfs` | `04ae0c941a997df7e1fedb53ccc2f5b958ad8c8bd73bfd51d7f9b6686ed5d565` | 773 |
| `validation/scenarios/alb-construction-02.gfs` | `2012ec9c2b1bacd3ea41028397fbde615ee057d548bdd97be02ff76bc8f6c951` | 732 |
| `validation/scenarios/alb-cross-01.gfs` | `2dd8ff568c157d28e9dbe479e927fec106fd5fcc3caef36050f7ef9d9f9e2d4b` | 823 |
| `validation/scenarios/alb-cross-02.gfs` | `c3f4096d551ee0444c7b3dbdff09abffbbf7fcd83895cb0407df11b6325c5f04` | 798 |
| `validation/scenarios/alb-cross-03.gfs` | `b46563466dddb16696d84e9b975a9f8e2c63f64e3e39f32a32ac86daf960a4ca` | 845 |
| `validation/scenarios/alb-dict-smoke.gfs` | `6045b82a4908c53a161ec48072200d77e59c92964375aa62a46a5148095f5c7d` | 1785 |
| `validation/scenarios/alb-morphodict-smoke.gfs` | `b98cc913f78b64732185256d71604f1bd8b0102a832c9ec3c34e63b33f73baa6` | 1457 |
| `validation/scenarios/alb-names-preps.gfs` | `75c17cfe808192f07d2a92539f9a9f2ea3b2355fbbde40678d30c9519f03c07c` | 686 |
| `validation/scenarios/alb-noun-01.gfs` | `33e73328c6915ddd121e7fe9fe03fb59d801299e05977e8367ad8fee495c8973` | 780 |
| `validation/scenarios/alb-noun-02.gfs` | `dce183f4c9f51e3be99aea3fd20c4f64d7ad14393fb300abc4cf385f347f7593` | 770 |
| `validation/scenarios/alb-noun-03.gfs` | `4d9cc124d926e5b734346dd4877897a51d529120c42347ced52180e140539f8a` | 780 |
| `validation/scenarios/alb-noun-04.gfs` | `7f8e547dfce8b3029c9ea92d0e357d6c3aa1003df7925ada0f7722ad110ea9fb` | 790 |
| `validation/scenarios/alb-noun-05.gfs` | `94a17b6b9931f1aee43262e7e611fcdb3c0fee5fe8bfb35d1a4cefe54ccbae2f` | 800 |
| `validation/scenarios/alb-noun-06.gfs` | `4a20f2085dbaa50523b92cbca7619e2855915d12fe8441c5ecdfa98cdda8e9ca` | 780 |
| `validation/scenarios/alb-noun-07.gfs` | `18b8e689618984ab8b18eb3c50aa087353e612bd581dcc182c7d22e73e1dd3b4` | 770 |
| `validation/scenarios/alb-noun-08.gfs` | `0f337b8efeebbc34a31335ab6a0bb91d19dcc89c983ab219504c910847a599a8` | 790 |
| `validation/scenarios/alb-noun-09.gfs` | `b5950cfd906718d18c8a46ea967bfbee6e5f695dc012571a1a9f29dc2f3decfc` | 810 |
| `validation/scenarios/alb-noun-10.gfs` | `7c3ee6feedeec9d394db01c5563b78b734dde41ada57b244c7ddc9c2da8177e3` | 820 |
| `validation/scenarios/alb-numerals.gfs` | `d65e620a44ca7739b828c234632ebbbeeb4a4a9fdd047d2f4803e2210d797f24` | 682 |
| `validation/scenarios/alb-question-wh.gfs` | `655f4296a6b4cd900ae802bc9e7c7931cec341898c22df82dded7542cac8956a` | 731 |
| `validation/scenarios/alb-question-yesno.gfs` | `69e227c509b64642b48d0d1be6e1122320df69b38a75f8d1c83d5baff0b01f50` | 743 |
| `validation/scenarios/alb-relative-object.gfs` | `0d9e8d282374a3ff55d019b1a216e84a9a36c4864e619bbf6f555d4d9a509e5d` | 759 |
| `validation/scenarios/alb-relative-subject.gfs` | `7559d40e8f78e876eda481515c9721e2860b61e4aae41f10ad8f066f06d88bda` | 730 |
| `validation/scenarios/alb-subordination.gfs` | `97c986e862a49054a24cb15de9415054b3bf3877023fcaf79f6bf471e11dbaea` | 815 |
| `validation/scenarios/alb-syntax-adverbial.gfs` | `63ac5f495e12fab604bc6674917c944df58676c14747fa838821f3c0510c8e96` | 732 |
| `validation/scenarios/alb-syntax-basic.gfs` | `e6665d167b57813f4dedda5289d7e899d2f8f6d56c8f7610b32ff051d6d8caac` | 688 |
| `validation/scenarios/alb-syntax-complements-a.gfs` | `8e1000150d3aff892d9172f008c7c11a187d70de39ca721d434a508622bf5618` | 779 |
| `validation/scenarios/alb-syntax-complements-b.gfs` | `b2e93be8bf9964b086dfda33e6d6a57f7633406c737d120ca22a79facf2f8482` | 768 |
| `validation/scenarios/alb-syntax-coordination.gfs` | `46bf7da8420a62dac54441b3da905a4bd772c83b5c894522573a2190630cbdde` | 713 |
| `validation/scenarios/alb-syntax-copular.gfs` | `c7bc4fb5d749170cd82d2425b6cfb38c119033b980896d7fc396d7c6b24993ec` | 702 |
| `validation/scenarios/alb-syntax-v2.gfs` | `bddfdd9e8a69d00636f66b4e69f8d494ba1fa53232c6ba6930e98f07d784f74c` | 756 |
| `validation/scenarios/alb-syntax-v3.gfs` | `c9ed75a4fd87733fa37bfe70ccd1f85c17157d35365b4f351f96f63bb83580e7` | 759 |
| `validation/scenarios/alb-verb-01.gfs` | `8d5e6fbd43c2b15b0673061703f520ac9ac73c1be3f1730a198d17ab1fe076fb` | 773 |
| `validation/scenarios/alb-verb-02.gfs` | `9a00745d8c1a567240a1416897047457678692874ffc85e179167416e10e1f03` | 753 |
| `validation/scenarios/alb-verb-03.gfs` | `21365d79334fc5a25f5a06c104db2c843b9fa101e42076020cc6e695c59f7c0e` | 773 |
| `validation/scenarios/alb-verb-04.gfs` | `6ff42ebb9344a13f67072af36d1eacd8ef2fad837cf7e1882c23f7e7fbda2208` | 773 |
| `validation/scenarios/alb-verb-05.gfs` | `56de4b61661a0770d561f6733d29ea8cadd2db3e3272ed69363616af9a3c8321` | 793 |
| `validation/scenarios/alb-verb-06.gfs` | `0baf05e24d59c2b5b84955e1bc6ecc911b7d42caf0229d7469d16fbb39e591e7` | 773 |
| `validation/scenarios/alb-verb-07.gfs` | `dd309f00ce30730cee2f9533efe8d517f9d9fb2d5fac56575ae6add405b19ffc` | 783 |
| `validation/scenarios/alb-verb-08.gfs` | `c19ec56d803efdb187a8d5b0e78efe53244c2784d15fa923506f0edb73e3a8c9` | 783 |
| `validation/scenarios/alb-verb-09.gfs` | `62b818b04c5694498841b1d3c782e4b161d2d81aee3ef132bd0ae4631db5c2f7` | 773 |
| `validation/scenarios/alb-verb-10.gfs` | `99fd4cb71b189363aeba21b4ae4093bb7dfa35637ae4a3b0a5170ae5341baa83` | 803 |

## 4. Nominal core source hashes

| File | SHA-256 | Bytes |
|---|---|---:|
| `ResSqi.gf` | `0ce1f35dcedb68d6084d30e781d013b5aa1376526095d7659f5b640ce8e23727` | 14477 |
| `CatSqi.gf` | `8fb7b05b7ad8af60f19894cafdfdc878a885467d969e9e308fb4efae86199210` | 2744 |
| `MorphoSqi.gf` | `729706f857ae4b3e31934b218ffb775d2b2386618b5e5ddf3b822edda8702a42` | 1074832 |
| `ParadigmsSqi.gf` | `b65f668abd6dc093d5a3eb58ed4eeb44917aa0f4ee97560775f3e4090811cc51` | 54260 |
| `NounSqi.gf` | `36bd0c213d2c538abdb66ebf1c7517cb952331f97a45bb6d994b1b2d66f19c70` | 6727 |
| `AdjectiveSqi.gf` | `f7998b574626622b06ffc5014d6c340e0b2aeb153865bc25186955a4cf555328` | 1647 |
| `NumeralSqi.gf` | `6e42bed324fc8a6d3419c6b5cd9f036fdfc5f006170273bd1cb049784a0b1f9f` | 3607 |
| `NamesSqi.gf` | `6238d02d77f0ed38331c8d2f7df0c5c83b2d169c219a4e72b6010a383a3e5319` | 796 |
| `StructuralSqiNominal.gf` | `f1291088e6e36c05bf282e6ab628328b89640bac098a0d2cd73bbfb557fb0946` | 3519 |

## 5. Regression semantics

A patch is a regression if, without an explicitly approved baseline migration, it causes any of:

- one of the required targets/scenarios to disappear;
- compile/scenario status below the locked green floor;
- new structural lock warnings;
- previously accepted gold to change without linguistic review;
- source census to expand while new targets are not included in the full gate.

Changing a file hash is **not** itself a regression; it is a signal that the corresponding generated locks/docs must be regenerated.
