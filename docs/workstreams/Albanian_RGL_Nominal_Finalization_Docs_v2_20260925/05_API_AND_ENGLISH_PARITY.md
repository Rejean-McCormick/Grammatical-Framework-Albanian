# Surface RGL, API et parité avec English

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

## 1. Définition de la parité

English est la référence de **capacité** : si une application RGL mature peut construire une classe nominale abstraite, l’Albanais doit soit :

- l’implémenter de façon linguistiquement correcte ;
- ou la marquer `N/A` avec justification linguistique.

Le nombre brut de constructeurs ou d’entrées lexicales n’est pas une métrique suffisante.

## 2. Surface abstraite `Noun` à préserver

Le snapshot RGL fourni exige notamment :

### NP
`DetCN`, `UsePN`, `UsePron`, `PredetNP`, `PPartNP`, `AdvNP`, `ExtAdvNP`, `RelNP`, `DetNP`.

### Déterminants / nombres / ordinaux
`DetQuant`, `DetQuantOrd`, `NumSg`, `NumPl`, `NumCard`, `NumDigits`, `NumDecimal`, `NumNumeral`, `AdNum`, `OrdDigits`, `OrdNumeral`, `OrdSuperl`, `OrdNumeralSuperl`, `IndefArt`, `DefArt`, `MassNP`, `PossPron`.

### CN / relational nouns
`UseN`, `ComplN2`, `ComplN3`, `UseN2`, `Use2N3`, `Use3N3`, `AdjCN`, `RelCN`, `AdvCN`, `SentCN`, `ApposCN`, `PossNP`, `PartNP`, `CountNP`, `AdjDAP`, `DetDAP`, `QuantityNP`.

**CURRENT** — `NounSqi.gf` possède des linéarisations pour cette surface.  
**NOT CERTIFIED** — leur présence ne prouve pas que toutes les réalisations albanaises sont correctes.

## 3. Surface abstraite `Adjective`

Doit rester couverte :

`PositA`, `ComparA`, `ComplA2`, `ReflA2`, `UseA2`, `UseComparA`, `CAdvAP`, `AdjOrd`, `SentAP`, `AdAP`, `AdvAP`.

**CURRENT** — toutes sont présentes dans `AdjectiveSqi`.  
**TARGET** — supprimer les fallback sémantiquement douteux au profit de réalisations attestées et tests contrastifs.

## 4. `Numeral`

Le concrete actuel couvre la grammaire productive jusqu’aux catégories élevées (`pot0…pot5`, digits, decimals). La finalisation nominale doit ajouter la **validation linguistique** des formes, des ordinaux et des interactions avec le nom ; la simple construction du nombre n’est pas le critère final. Les formes de `Lesson_50.html` proviennent d’une leçon Geg et restent candidates tant que leur applicabilité Standard n’est pas corroborée.

## 5. `Names`

La surface requise est :

`GivenName`, `MaleSurname`, `FemaleSurname`, `PlSurname`, `FullName`, `UseLN`, `PlainLN`, `InLN`, `AdjLN`.

**CURRENT** — toutes sont présentes et les catégories Names conservent cas/accord.  
**TARGET** — certifier les formes de cas et supprimer les conventions de genre/forme qui ne seraient qu’un fallback.

## 6. API `ParadigmsSqi` cible

L’API finale doit offrir au moins les familles suivantes :

### Noms

- smart constructor depuis la forme citationnelle lorsque la classe est détectable sans ambiguïté dangereuse ;
- constructeur depuis singulier + pluriel principal ;
- constructeur explicite pour genre stable ;
- constructeur explicite pour genre sg/pl différent ;
- constructeur de paradigme complet pour irréguliers ;
- `mkN2`/`mkN3` avec `Prep/Case` typés ;
- zéro record bas niveau dans Dict/MorphoDict lorsqu’un constructeur de paradigme peut exprimer l’analyse.

### Adjectifs

- constructeur articulé régulier ;
- constructeur non articulé régulier ;
- constructeur 2/3/4 formes selon classe ;
- constructeur explicite irrégulier ;
- `mkA2` avec complément typé ;
- l’articulatedness doit être un trait, pas une convention de chaîne.

### Proper names / language names / surnames

- raccourci invariant ;
- constructeur casuel explicite ;
- constructeur depuis un `N` lorsque cette dérivation est linguistiquement correcte ;
- agreement explicite.

### Déterminants/quantifieurs

Les helpers publics doivent conserver cas/genre/nombre/définitude/placement nécessaires ; aucune API ne doit forcer l’appelant à écrire un record de 16 cellules pour un lexème structurel régulier.

## 7. Modèles à consulter

- **English** : surface publique, ergonomie de `Paradigms`, coverage discipline.
- **Romanian/Italian** : nominal roman/balkanique et détermination lorsque compatible.
- **Greek/Macedonian/Bulgarian** : accord/définitude et phénomènes balkaniques comparables.
- **German/Finnish** : propagation de cas et discipline des tables, sans transférer leurs catégories linguistiques.

Tout emprunt de pattern doit indiquer : dimension compatible, différence Albanian, adaptation, tests.

## 8. Ledger normatif v2

Le suivi fonction-par-fonction et le gap distinct de `ParadigmsSqi` sont dans `13_ENGLISH_PARITY_LEDGER.md`. Les signatures exactes sont dans `12_EXACT_RGL_CONTRACT_LOCK.md`.
