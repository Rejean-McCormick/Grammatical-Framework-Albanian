# Source lock, provenance et ordre d’autorité

> **Document version**: 2.0  
> **Document status**: NORMATIVE  
> **Baseline evidence authority**: `19_BASELINE_EVIDENCE_LOCK.md`  
> **Source/provenance authority**: `02_SOURCE_LOCK_AND_AUTHORITY.md`  

> **Projet**: Albanian RGL — domaine nominal complet  
> **Date de verrouillage documentaire**: 2026-09-25  
> **Baseline d’intégration fournie par le mainteneur**: `albanian-s02-green-20260925`  
> **GF**: 3.12  
> **GF Wordbench**: 1.3.4  
> **Gate d’intégration**: voir `19_BASELINE_EVIDENCE_LOCK.md`  
> **Certification linguistique globale**: non établie  
> **Principe**: compilation verte ≠ certification linguistique.  

## 1. Archives fournies et hashes

| Source | SHA-256 de l’archive fournie | Rôle dans ce chantier |
|---|---|---|
| `Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip` | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` | source Albanian courante + docs + validation |
| `gf-rgl-master.zip` | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` | abstract/API/RGL amont et modèles complets |
| `Code_snapshot_GF_RGL_AI_Compendium(4).zip` | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` | contrats, workflows, patterns, test protocol |
| `Code_snapshot_GF_Wordbench(20260925-123301).zip` | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` | infrastructure de validation 1.3.4 |
| `GF_Dict_Morph_Models_Curated_20260924(1).zip` | `16f1022cf3e3b537aac2e2445c70d118eb840adb5ba5f215c731fef28f348cf2` | modèles morpho/dict ciblés |
| `ModelLanguageGF(5).zip` | `dd29e09151ff70e364d5fa228c90ec04bc2396994d505f57fe788d7247b63a05` | dumps comparatifs de langues modèles |
| `Albanian_ref(8).zip` | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` | références linguistiques albanaises fournies |

Le roadmap Albanian fourni enregistre en outre :

- run Wordbench de baseline : `20260925_112639` ;
- source-lock interne : `6834fc8975ce82a6c4984280bff1000dae644f134fec457996abb9f25888ef37` ;
- référence English enregistrée au moment du status : commit `bfc0a89f9912e5db7567c955e0114437643c6eeb`.

Le ZIP `gf-rgl-master.zip` ne contient pas `.git`. Le commit ci-dessus est donc une information du roadmap, pas une identité Git prouvée par les métadonnées du ZIP lui-même.

## 2. Ordre d’autorité pour une décision nominale

1. signature abstraite exacte du RGL fourni ;
2. preuve GF 3.12 / test reproductible sur le source lock courant ;
3. source Albanian courant ;
4. référence linguistique albanaise applicable au phénomène ;
5. décision d’architecture Albanian déjà acceptée ;
6. tests/golds albanais revus ;
7. modèle RGL typologiquement compatible ;
8. English pour couverture/API/maturité ;
9. commentaires historiques et DRAFT-MAX.

Pour **la forme linguistique elle-même**, la référence albanaise et les golds validés priment sur l’analogie avec les modèles. Pour **la signature permise**, l’abstract RGL reste la contrainte première.

## 3. Corpus linguistique utilisé dans cette première version du dossier

### `Albanian_Complete_Grammar.html`

Utilisé pour le cadrage général : système nominal complexe, genres, cinq cas, syncrétisme génitif/datif, définitude suffixée, rôle des *nyje*.

### `Lesson_10.html` — Tosk / Standard Albanian

Source principale actuelle pour :

- genre grammatical ;
- noms ambigénériques ;
- catégories flexionnelles ;
- déclinaisons masculine/féminine ;
- défini/indéfini ;
- *nyje* ;
- adjectifs articulés/non articulés.

### `Lesson_30.html` — Tosk

Source principale actuelle pour :

- démonstratifs distaux/proximaux ;
- pronoms personnels ;
- pronoms faibles ;
- possessifs et leur placement.

### `Lesson_50.html` — **Lesson 5: Geg**

Source comparative actuelle pour :

- formation des cardinaux présentée dans la leçon ;
- ordinaux présentés dans la leçon.

**Restriction v2:** ce fichier est explicitement Geg. Il peut révéler des capacités/gaps et fournir des candidats de test, mais ne suffit pas seul pour certifier une sortie Standard Albanian. Voir `15_LINGUISTIC_EVIDENCE_LEDGER.md`.

### Glossaires/dictionnaire Tosk

Utiles comme preuve lexicale/contextuelle et pour sélectionner des exemples, mais une entrée de glossaire ne remplace pas une règle grammaticale explicite.

## 4. Gaps documentaires actuels

Les sources fournies dans cette première passe ne suffisent pas encore à certifier complètement :

- toutes les règles de déclinaison des noms propres modernes ;
- les contraintes exactes de comparison/superlatif dans tous les contextes ;
- les effets syntaxiques de chaque classe de numéral sur le nom et l’accord ;
- la portée de certains résidus/neutres en Standard Albanian moderne ;
- les règles exhaustives d’accord en coordination ;
- toutes les conditions des possessifs prénominalisés de parenté.

Ces points restent `GAP` jusqu’à preuve supplémentaire. Ils ne doivent pas être complétés par analogie avec Romanian/Greek/etc.

## 5. Règle de mise à jour

Toute nouvelle source linguistique doit être ajoutée ici avec : nom, hash ou provenance, portée dialectale/standard, sections utilisées, décisions qu’elle affecte et tests qu’elle justifie.

## 6. Granular evidence authority

Les hashes/sections/dialect scopes détaillés sont maintenus dans `15_LINGUISTIC_EVIDENCE_LEDGER.md`. Les signatures abstraites exactes sont maintenues dans `12_EXACT_RGL_CONTRACT_LOCK.md`. Les counts de baseline ne sont normatifs que dans `19_BASELINE_EVIDENCE_LOCK.md`.
