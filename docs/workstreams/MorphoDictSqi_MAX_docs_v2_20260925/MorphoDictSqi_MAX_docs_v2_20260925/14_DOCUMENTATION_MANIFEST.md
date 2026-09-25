# Documentation manifest — v2.0

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## Corpus

La présence d'un fichier dans ce manifest signifie qu'il appartient à la révision documentaire 2.0. Les hashes détectent toute modification accidentelle. Après un changement accepté, régénérer le manifest.

| File | Bytes | SHA-256 |
|---|---:|---|
| `00_README.md` | 4998 | `cfa8eabe45ae43dd29b424ee612ec33c401926cc78dcbce69d09256457559092` |
| `01_SOURCE_LOCK.md` | 4964 | `1c2b6f605d265d575000c0100239d5db9d64271ccd7aea6591aa10ddc5fe8588` |
| `02_FINAL_TARGET_AND_DEFINITION_OF_DONE.md` | 4038 | `7c537b8104f5deafff4b4218da62a6e851316cf90a84bfe996044d356ac1ccb0` |
| `03_LEMGRAM_CONTRACT.md` | 3554 | `c630748a46ca080bb80e12c3320ac5ba7a0d909204c42e85b9901f9e3a618297` |
| `04_SOURCE_AUTHORITY_AND_PROVENANCE.md` | 2755 | `6972b7289562479819b70117a14fbe5e4235ae0176923797a282ba2ede22a750` |
| `05_CERTIFICATION_LADDER.md` | 3056 | `ae27c6be3a124178a6be131d9de40785df51d8ebffa5da448241bfef18a69d9f` |
| `06_BUILD_AND_PROMOTION_PIPELINE.md` | 3108 | `2738f1f02bc9b1144ce4d54bb98c02ebca9698e64d14ba560cea2c39b09d56c7` |
| `07_VALIDATORS_AND_GATES.md` | 3552 | `0eaeb2a03a7bcc90d4799ba61e5fa4e49ca7a211c5c728810e9c193e60fadafd` |
| `08_METRICS_AND_REVIEW_QUEUES.md` | 2378 | `082a701bed67597a1d998d18a0f130b399ada15ff4b573861ee3fae61d197fd3` |
| `09_MODEL_MORPHODICT_BENCHMARKS.md` | 2162 | `632c5215a277f1a424a83e2460be3108f242823b5dca309946405d2f05b51dc2` |
| `10_MORPHOLOGY_ESCALATION_PROTOCOL.md` | 2008 | `bddf625e17e0643921132597e6102946a2ffa5f6945a39a0037fb7bd53ec1416` |
| `11_DRIFT_CONTROL_AND_CHANGE_PROTOCOL.md` | 2469 | `7ab0f5f2e1bdf213b17b41a83d8cec2c941241b960763314ea37e9b9ac1650b7` |
| `12_RELEASE_DELIVERY_CHECKLIST.md` | 2263 | `8272ae01ce3bb9e676f6b65ae40249e808fb8f0870267a9679c20c7f42fce7b0` |
| `13_DECISION_RECORD_TEMPLATE.md` | 1826 | `1339b5950bcb1460eace9d3d04203d3d0e49a776ded34d703eeea6c72ce4cc81` |
| `15_DATA_MODEL_AND_SCHEMAS.md` | 3249 | `f9264aa4c71fb1174799d8213a4e096f1533d369665c246357633103a60d5d7d` |
| `16_CATEGORY_TABLE_CONTRACTS.md` | 3792 | `9ca055ab5b346fa43d10c7bb580119c8c14f74658b5543dbbbf200602412d95d` |
| `17_TABLE_SIGNATURE_AND_DEDUP_SPEC.md` | 2689 | `4b29b3e6f42c93bb3349f51ff2f80412abec5e1aa2251405f0adaa1bb4640464` |
| `18_EVIDENCE_TO_GF_FEATURE_MAPPING.md` | 2759 | `85bed1b06572ac91eedfb003193b99d3a1ac61380994d218fc8bb9969ccc1f24` |
| `19_PARADIGM_CLASS_REGISTRY.md` | 2362 | `21b5711b0e0cdfce7fb22f9e6075ea84d3f2f5270ed1512e73c851e4692c6a6d` |
| `20_DEPENDENCY_AND_INVALIDATION_RULES.md` | 2235 | `98539e55786d78c2a6ae966bf0ebbeea3147d362aef971f135cfdad6d5a2dd8d` |
| `21_SCALE_AND_REPRODUCIBILITY_CONTRACT.md` | 2362 | `d21f9e45bb313783dd72a8b18f3203f273fa87fbdd20f540623e26c106843258` |
| `22_SOURCE_CONFLICT_AND_REVIEW_POLICY.md` | 2423 | `aa399d071480bd8993acfb1b7d842227c7f1ec96cedd499dda76643691d9dcb3` |
| `23_DOCUMENTATION_CHANGELOG.md` | 1584 | `1ea261d34482ec2f3b67532f0ba8fc71e4fc200766850401fbcee6d5fcc6d761` |

## Règle

Le manifest lui-même n'est pas inclus dans sa propre table de hash. Le ZIP de livraison est hashé séparément dans le message/manifest de release afin d'éviter une dépendance récursive.
