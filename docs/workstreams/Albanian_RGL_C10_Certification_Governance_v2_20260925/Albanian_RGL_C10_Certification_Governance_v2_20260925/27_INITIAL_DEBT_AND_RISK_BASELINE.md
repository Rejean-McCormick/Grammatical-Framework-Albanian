---
document_role: initial_debt_baseline
status: snapshot_fact_register
version: 1.0
date: 2026-09-25
baseline: albanian-s02-green-20260925
---

# Dette et risques — baseline initiale

Ce document fige les dettes connues au départ de Conversation 10. Il ne doit pas être réécrit pour montrer un état futur; les releases futures produisent leur propre snapshot de dette.

## 1. Structure

Baseline déclarée :
- GF 3.12;
- Wordbench 1.3.4;
- 58/58 targets;
- 52/52 scenarios;
- 569 CASEs reviewables.

Linguistic certification : **NOT_ESTABLISHED**.

## 2. `DictSqi`

Rapports du snapshot :
- 6 720 fonctions;
- 337 `baseline_lexicon_exact`;
- 6 339 `imported_unreviewed`;
- 44 `reference_attested_unreviewed`;
- 1 830 entrées Albanet multiword.

Le remediation record 2026-09-25 indique que les 6 339 N/A/V `imported_unreviewed` ont été converties en réalisations invariantes compile-safe après échecs de smart paradigms :
- N : 4 134
- A : 64
- V : 2 141

**Dette critique : ces 6 339 entrées ne sont pas des paradigmes linguistiquement certifiés.**

Les 337 aliases de LexiconSqi réutilisent l'analyse baseline existante; ils restent néanmoins soumis à la portée de certification du source actuel.

## 3. `MorphoDictSqi`

Manifest :
- 592 lemgrammes;
- 18 catégories;
- `variants`: 0.

Quality counts après remediation :
- exact : 367
- compile-safe-placeholder : 155
- rgl-derived-explicit : 1
- exact-normalized : 10
- direct-invariant : 23
- rgl+reference-characteristic : 11
- direct-with-government : 3
- exact-irregular : 22

Total : 592.

**Dette critique : 155 lemgrammes sont explicitement compile-safe placeholders.**

## 4. Morphologie core

Risques de certification :
- très grand `MorphoSqi` avec nombreuses classes;
- `mkN`, `mkA`, `mkV` infèrent des paradigmes;
- des échecs réels de smart inference ont déjà déclenché les placeholders;
- le subjonctif lexical du record `Verb` peut être dérivé du présent dans certains constructeurs.

Conclusion :
le core morphologique doit être certifié par tables et classes avant de réactiver massivement les smart paradigms dans les dictionnaires.

## 5. Représentation vs description linguistique

Questions ouvertes :
- 4 cases GF vs 5 cas linguistiques avec datif/génitif syncrétiques;
- 2 genres GF vs statut linguistique du neutre décrit comme disputé;
- architecture exacte du non-actif/voix;
- frontières Standard/Tosk/Geg pour certaines formes.

## 6. Gold

Gold linguistique à grande échelle : non établi.

Un éventuel scénario exécuté antérieurement n'est pas reclassé automatiquement comme gold.

## 7. Risque de Goodhart

Le plus grand risque de maturité artificielle est :
- compter les 6 720 Dict comme « lexical coverage certifiée »;
- compter les 592 MorphoDict comme « morphologie certifiée »;
- compter les 58/58 + 52/52 comme « Albanian correct ».

Ces trois interprétations sont interdites.

## 8. Source anchors

- `docs/dictionary/DICT_SQI_REPORT.md`
- `docs/dictionary/DICT_SQI_VALIDATION.json`
- `docs/morphodict/BUILD_REPORT.md`
- `docs/morphodict/MANIFEST.json`
- `docs/status/ALBANIAN_ENGLISH_PARITY_ROADMAP_20260925.md`
- `validation/README.md`

Si ces fichiers changent, ce document reste un **snapshot historique** de la baseline `albanian-s02-green-20260925`; il n'est pas réécrit.
