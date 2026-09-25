---
doc_id: DICTMAX-002
title: "Autorité des sources et source lock"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Principe

Toute décision lexicale doit être traçable à un état de source précis. Mélanger un `DictSqi` d’un snapshot avec un registre de provenance ou un générateur d’un autre snapshot est interdit.

## Source lock initial — 2026-09-25

### Archives fournies

| Source | SHA-256 |
|---|---|
| Albanian snapshot | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` |
| Albanian Smart Dumper index | `d7d69910e65a627b4a39f9703898ce5232e0caa2b95dc0a7fb776508f42696af` |
| GF RGL AI Compendium | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` |
| GF Wordbench snapshot | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` |
| `gf-rgl-master.zip` fourni | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` |
| Curated Dict/Morph models | `16f1022cf3e3b537aac2e2445c70d118eb840adb5ba5f215c731fef28f348cf2` |
| ModelLanguageGF | `dd29e09151ff70e364d5fa228c90ec04bc2396994d505f57fe788d7247b63a05` |
| Albanian linguistic references | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` |

### Fichiers critiques Albanian

| Fichier | SHA-256 |
|---|---|
| `DictSqiAbs.gf` | `6f435488586784c2f82adaae001a3c58729aa99467305bb49b6038cd3ddad97d` |
| `DictSqi.gf` | `b3c3986e8105aa878d1d6a3e0a7dfffab181b27ebc9001c81f8a3c824e7d84ca` |
| `LexiconSqi.gf` | `b724d800c49efda27b75333c4d72c990e4f824d679a19cc6922fcc02e377dec6` |
| `DictSqi_provenance.tsv` | `08b4569e36b314b0bac2a2edee78a9b77e699ec76fa98748f1838f7a58df282d` |
| `build_complete_dict.py` | `9879d1e046dd8880e3c928aeeb6de2d45c4aeb296a65372083593ee7b25cefc8` |
| `static_validate_dict.py` | `e746c2feacf3e5635b9ac41307730e226ecac2943cc0c91157175af909e0b6fa` |
| `DICT_SQI_VALIDATION.json` | `df0b75f8d0daceaec10221886bf0d9590ac8acb1e0eb96a4c8436b4f6c68ff6f` |

### Fichiers benchmark RGL

| Fichier | SHA-256 |
|---|---|
| `abstract/Lexicon.gf` | `90ad758824aacb561d9fdd2c89b4569e4c13b1667c2105aa24a23156f037afda` |
| `english/DictEngAbs.gf` | `963747e3ac07833b648a36c973628383b2f7b2167ae2d8d182f78809e4b9e915` |
| `english/DictEng.gf` | `448b3fcd5fc4134a479b5b5e34b0a69b8314dd64281febd1631da0b43fcf6491` |
| `english/LexiconEng.gf` | `4c7aa24e3e129dea94e9eccd5798f6868592af2a867762e5fdca9d353d850323` |


## Reconciliation item connu au moment de création

Le contexte de projet fourni déclare la baseline `albanian-s02-green-20260925` à **58/58 + 52/52**.
Dans le snapshot source fourni, les documents historiques les plus récents inclus (`WORDBENCH_RUN_20260925_032810_FIX.md`, `V4_README.md`) décrivent encore l'étape immédiatement précédente : **56/58 strict + 52/52**, puis un correctif statique v4 nécessitant un rerun externe pour établir 58/58.

Conséquence anti-drift :

- pour le **contrat de travail**, la baseline déclarée 58/58 + 52/52 est l'invariant à préserver ;
- pour une **affirmation de preuve archivée**, ne pas prétendre que ce ZIP contient lui-même le run final 58/58 tant que son rapport n'est pas fourni ;
- `DICT_SQI_VALIDATION.json` contient également des champs de certification antérieurs au dernier correctif et doit être considéré comme partiellement historique pour ces champs ;
- lors de la prochaine livraison, ajouter le run final/summary correspondant au tag vert et synchroniser les rapports générés.

Cette divergence documentaire est un item de réconciliation, pas une raison pour modifier le code lexical.

## Ordre d’autorité pour ce workstream

En cas de conflit, utiliser :

1. contrat abstrait exact du snapshot RGL verrouillé ;
2. résultat GF 3.12/Wordbench produit sur le même état de source ;
3. source Albanian courante ;
4. décisions Albanian acceptées et tests/golds revus ;
5. référence linguistique albanaise pertinente ;
6. modèle de langue typologiquement approprié ;
7. English comme benchmark de couverture/maturité ;
8. commentaires historiques et hypothèses.

La position 5/6 peut varier selon la question : une source linguistique albanaise tranche le comportement de l’albanais ; une langue modèle peut seulement montrer une architecture GF plausible.

## Règle « current »

Un état est considéré courant seulement si sont cohérents :

- le snapshot source ;
- son index ;
- les fichiers générés ;
- les tables de provenance ;
- le générateur ;
- les rapports de validation ;
- le run GF/Wordbench cité.

Si l’un de ces éléments provient d’un autre état, la tâche commence par un **rebase documentaire**, pas par du code.

## Nouvelle source ou nouveau snapshot

Lors d’un changement de snapshot :

1. recalculer les hashes ;
2. comparer `DictSqiAbs`, `DictSqi`, `LexiconSqi`, provenance, générateur et validateur ;
3. recalculer les métriques de `10_METRICS_AND_PARITY_DASHBOARD.md` ;
4. identifier les décisions devenues stale ;
5. relancer les contrôles statiques ;
6. ne réutiliser un résultat GF antérieur que comme historique.

## Provenance externe

Aucune nouvelle source lexicale externe ne peut être intégrée sans :

- identification précise de la source ;
- version/date ou hash ;
- licence/conditions d’utilisation connues ;
- format d’extraction reproductible ;
- distinction entre forme attestée, sens, POS, morphologie et valence ;
- conservation du lien vers l’élément source.

## Règle v2 — manifest interne stale

Un manifest embarqué qui décrit un état plus ancien ne prévaut jamais sur les octets réellement présents dans le snapshot courant. La priorité pour identifier **le contenu du snapshot** est :

1. hash du conteneur fourni ;
2. hash calculé du membre réellement extrait ;
3. index généré avec le même snapshot, s'il concorde ;
4. manifest/report interne comme metadata historique.

Une divergence doit être enregistrée dans le changelog et corrigée à la livraison suivante, sans réécrire le rapport historique.

## Règle v2 — rôles des sources

Ne pas appliquer une seule hiérarchie à toutes les questions. Les contrats GF, l'attestation d'un lemme, la morphologie, la valence et la couverture ont des autorités différentes. Voir `15_INGESTION_DEDUPLICATION_MERGE_POLICY.md` et `08_LINGUISTIC_REFERENCE_POLICY.md`.
