# MorphoDictSqi MAX — corpus documentaire anti-drift

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## Statut

Ce dossier est la **spécification normative v2** du chantier `MorphoDictSqi MAX`. Il ne remplace ni le code GF, ni GF 3.12, ni les références linguistiques ; il fixe les contrats qui permettent de faire croître le dictionnaire sans dérive sémantique, morphologique ou de provenance.

La v2 est conçue pour rester valable lorsque le dictionnaire passe de centaines à des dizaines de milliers de lemgrammes. Les changements de politique ne peuvent plus être absorbés silencieusement dans un générateur : ils doivent être identifiables, versionnés, testés et réconciliés.

## Hiérarchie des documents

### Constitution / objectifs

| Fichier | Rôle |
|---|---|
| `01_SOURCE_LOCK.md` | sources, hashes, baseline, univers de sources |
| `02_FINAL_TARGET_AND_DEFINITION_OF_DONE.md` | produit final et définition de terminé |
| `03_LEMGRAM_CONTRACT.md` | identité d'un lemgramme et politique de déduplication |
| `04_SOURCE_AUTHORITY_AND_PROVENANCE.md` | hiérarchie de preuve et provenance |
| `05_CERTIFICATION_LADDER.md` | niveaux C0–C6 et états latéraux |

### Pipeline / validation

| Fichier | Rôle |
|---|---|
| `06_BUILD_AND_PROMOTION_PIPELINE.md` | pipeline déterministe et artifacts par étape |
| `07_VALIDATORS_AND_GATES.md` | V01–V19 et gates de lot/release |
| `08_METRICS_AND_REVIEW_QUEUES.md` | métriques et queues de revue |
| `10_MORPHOLOGY_ESCALATION_PROTOCOL.md` | transfert vers MorphoSqi/ParadigmsSqi |
| `12_RELEASE_DELIVERY_CHECKLIST.md` | checklist de livraison |

### Spécifications exécutables

| Fichier | Rôle |
|---|---|
| `15_DATA_MODEL_AND_SCHEMAS.md` | modèle canonique des données et IDs |
| `16_CATEGORY_TABLE_CONTRACTS.md` | forme des tables par catégorie |
| `17_TABLE_SIGNATURE_AND_DEDUP_SPEC.md` | canonicalisation/hash/déduplication |
| `18_EVIDENCE_TO_GF_FEATURE_MAPPING.md` | mapping preuve linguistique → traits GF |
| `19_PARADIGM_CLASS_REGISTRY.md` | registre P0–P3 des classes productives |
| `20_DEPENDENCY_AND_INVALIDATION_RULES.md` | dépendances et revalidation automatique |
| `21_SCALE_AND_REPRODUCIBILITY_CONTRACT.md` | build à grande échelle et reproductibilité |
| `22_SOURCE_CONFLICT_AND_REVIEW_POLICY.md` | conflits de sources et revue |

### Gouvernance / références

| Fichier | Rôle |
|---|---|
| `09_MODEL_MORPHODICT_BENCHMARKS.md` | benchmarks Eng/Fin/Fre/Ger/Ita/Spa/Swe |
| `11_DRIFT_CONTROL_AND_CHANGE_PROTOCOL.md` | contrôle du drift et migrations |
| `13_DECISION_RECORD_TEMPLATE.md` | template de décision |
| `14_DOCUMENTATION_MANIFEST.md` | hashes du corpus documentaire |
| `23_DOCUMENTATION_CHANGELOG.md` | évolution v1 → v2 |

## Ordre de lecture par type de tâche

- **Ajouter des entrées :** `01 → 03 → 04 → 05 → 15 → 18 → 19 → 06 → 07 → 08 → 12`.
- **Créer/réparer un paradigme :** `16 → 18 → 19 → 10 → 20 → 07`.
- **Modifier un générateur :** `15 → 17 → 20 → 21 → 11 → 07`.
- **Traiter un conflit linguistique :** `04 → 18 → 22 → 05`.
- **Faire une release :** `02 → 07 → 08 → 11 → 12 → 14`.

## Invariants non négociables

- `MorphoDictSqi` décrit des **lemgrammes / tables flexionnelles**, pas des sens.
- La valence syntaxique est collapsée quand elle ne change pas la morphologie.
- `DictSqi` et `MorphoDictSqi` restent séparés.
- `variants` = 0 dans la cible finale.
- Un placeholder compile-safe n'est jamais une preuve linguistique et ne compte jamais C6.
- Aucun smart paradigm ne reçoit de fallback silencieux hors de son domaine démontré.
- Tosk/standard est la cible active ; Geg reste étiqueté comparatif/dialectal sauf décision contraire.
- Un modèle étranger peut justifier architecture et méthode, jamais une forme albanaise.
- Toute entrée active a une provenance ; toute entrée C6 a une chaîne de preuve complète.
- Toute classe productive utilisée massivement est enregistrée P3 dans `19_PARADIGM_CLASS_REGISTRY.md`.
- Toute modification d'une dépendance d'un C6 déclenche la règle d'invalidation de `20_DEPENDENCY_AND_INVALIDATION_RULES.md`.

## Définition courte du succès

Le chantier est réussi lorsque `MorphoDictSqi` devient un dictionnaire morphologique albanais standard de grande couverture, reconstructible et auditable, où les formes ordinaires peuvent être analysées/générées via des paradigmes albanais démontrés, et où **100 % de l'univers de sources verrouillé est terminalement classé** : certifié C6, bloqué explicitement ou exclu avec raison.
