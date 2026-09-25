# Source lock — MorphoDictSqi MAX

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Archives de référence verrouillées

| Source | SHA-256 | Rôle |
|---|---|---|
| `Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip` | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` | source Albanian de travail, MorphoDict courant, couverture, validateurs |
| `gf-rgl-master.zip` | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` | baseline RGL fournie, API, modèles MorphoDict, `MkMorphodict.hs` |
| `Code_snapshot_GF_RGL_AI_Compendium(4).zip` | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` | contrats/workflows/patterns/gates RGL |
| `Code_snapshot_GF_Wordbench(20260925-123301).zip` | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` | validation, diagnostics, scénarios, reporting |
| `Albanian_ref(5).zip` | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` | références linguistiques fournies : grammaire, Tosk, Geg |

`gf-rgl-master.zip` ne contient pas de `.git`; son hash d'archive est l'identifiant reproductible de cette conversation.

## 2. Baseline fonctionnelle mainteneur

- GF 3.12.
- Wordbench 1.3.4 avec découverte native de `src/morphodict`.
- Baseline : 58/58 cibles = 51 language + 5 API + 2 MorphoDict.
- Baseline scénarios : 52/52.
- Tag : `albanian-s02-green-20260925`.
- `MorphoDictSqi` : 592 lemgrammes au départ.
- `DictSqi` : 6 720 fonctions, hors périmètre morphologique sauf mapping de provenance.
- 569 CASEs de revue déclarés dans le contexte global ; ce nombre n'est pas un compteur C6.

## 3. État MorphoDict verrouillé au départ

Le manifeste du snapshot annonce 592 entrées dans 18 catégories et les quality counts suivants :

- `exact`: 367
- `compile-safe-placeholder`: 155
- `rgl-derived-explicit`: 1
- `exact-normalized`: 10
- `direct-invariant`: 23
- `rgl+reference-characteristic`: 11
- `direct-with-government`: 3
- `exact-irregular`: 22

Ces labels historiques **ne sont pas** des niveaux C0–C6. En particulier, les 155 placeholders sont actifs structurellement mais non certifiés.

## 4. Univers de sources — `SU-20260925-01`

L'univers de sources est l'ensemble versionné des données que la campagne prétend avoir exploitées. Il est distinct du dictionnaire généré.

### Inclus maintenant

1. analyses Albanian déjà présentes dans `LexiconSqi`, `IrregSqi`, `StructuralSqi*` et MorphoDict courant ;
2. `resources/morphodict/TOSK_REFERENCE_LEMMAS.tsv` dérivé du matériel Tosk fourni ;
3. références linguistiques du paquet `Albanian_ref(5).zip` **comme preuves/revue**, selon leur droit d'usage ;
4. mappings RGL déjà documentés (`RGL_LEXICON_MAPPING.csv`, exclusions, couverture).

### Hors univers par défaut

- données Geg comme candidats standard ;
- sources web non verrouillées ;
- formes générées par le modèle sans source ;
- inférences non reliées à une preuve ;
- corpus externes dont provenance/licence ne sont pas enregistrées.

Une nouvelle source modifie l'identifiant `source_universe_id` et exige re-lock.

## 5. Références linguistiques fournies

Le paquet contient notamment : `Albanian.pdf`, `Albanian_Complete_Grammar.html`, trois leçons Tosk, deux leçons Geg, `Tosk_Dictionary_Master.html`, `Tosk_Glossary_Master.html`, `Geg_Glossary_Master.html`.

Le matériel Tosk sert à la preuve standard ; le matériel Geg reste étiqueté dialectal/comparatif. Une conversion Geg→Tosk n'est jamais une normalisation automatique.

### Licence / redistribution

Le paquet ne fournit pas de licence explicite autorisant une extraction massive redistribuable. Tant que ce point n'est pas clarifié, ces références peuvent soutenir revue, locators et décisions, mais ne doivent pas être recopiées massivement dans le dépôt.

## 6. Fichiers Albanian sensibles

Les fichiers suivants doivent être re-hashés dans chaque livraison qui les modifie :

- `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqi.gf`
- `AlbanianSQI/GF/lib/src/morphodict/MorphoDictSqiAbs.gf`
- `.config` / `.header`
- `docs/morphodict/COVERAGE.*`
- `docs/morphodict/MANIFEST.json`
- données de provenance et preuves
- générateur(s) MorphoDict MAX
- validateurs MorphoDict
- registre de paradigmes et feature mapping

## 7. Déclencheurs de re-lock

Re-lock obligatoire si change : snapshot Albanian, archive RGL/API, version GF, sémantique Wordbench des gates, univers de sources, générateur, schéma de données, algorithme de `table_signature`, mapping source→GF, ou politique C0–C6.
