# Plan de tests, golds et certification nominale

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

## 1. Test pyramid

### T1 — Resource/morphology unit tests

Tester directement les tables et opérations de `ResSqi/MorphoSqi`.

### T2 — Paradigm constructor tests

Chaque constructeur public doit démontrer ses principal parts, sa classe et ses erreurs/limites.

### T3 — Category construction tests

Tester `UseN`, `AdjCN`, `DetCN`, `PossNP`, `ComplN2`, `UsePN`, etc.

### T4 — Interaction tests

Les interactions sont obligatoires :

- définitude × nom ;
- définitude × *nyje* × adjectif ;
- nombre × genre ambigénérique × adjectif ;
- cas × génitif × *nyje* ;
- possessif × genre/nombre/cas du possédé ;
- numéral × nom × accord ;
- relative × accord nominal ;
- coordination × accord ;
- proper name × cas/preposition.

### T5 — Wordbench regression/global

La suite existante ne doit jamais régresser ; les nouveaux scénarios deviennent requis lorsqu’ils sont stables.

## 2. Matrices minimales

### Noms

Pour chaque classe représentative :

```text
Species: Indef, Def
Case: Nom, Acc, Gen, Dat, Ablat
Number: Sg, Pl
= 20 chemins de sélection
```

Même lorsque `Gen == Dat` en surface, les deux chemins doivent être testés pour empêcher leur reconfusion syntaxique.

Classes minimales : féminin régulier, masculin régulier, pluriel en -e, -a, -ë, -nj/-inj, alternance consonantique, invariant, irrégulier, ambigénérique.

### Adjectifs

Tester séparément :

1. **radical/formes** : `Gender × Number` pour chaque classe ;
2. **réalisation AP articulée** : `Species × Case × Gender × Number` pour la *nyje* + forme ;
3. non articulé : aucune *nyje* ;
4. comparatif/superlatif/ordinal avec exemples attestés.

### Démonstratifs

`ai/ajo` et `ky/kjo` : genre × nombre × cinq contextes de cas.

### Possessifs

Couverture minimale :

- possesseur P1/P2/P3 ;
- possesseur sg/pl et genre P3 lorsque pertinent ;
- possédé masc/fem × sg/pl ;
- Nom/Acc/Gen/Dat/Ablat ;
- ordre postnominal ordinaire ;
- exceptions prénominales uniquement lorsque certifiées.

### Numéraux

Boundaries de génération : 1–11, 12–19, 20, 21, 30, 40, 41, 99, 100, 101, centaines composées, 1000, milliers composés, million, milliard, digits et decimals.

Si une classe de gouvernement existe, tester chaque frontière de classe et des nombres composés dont le dernier élément pourrait tromper une heuristique de chaîne.

### Noms propres

Au moins : prénom masc/fem, nom complet, surnom, forme plurielle de surname, toponyme/langue (`LN`), Nom/Acc/Gen/Dat/Ablat, préposition + nom.

## 3. Sélection des exemples

Priorité :

1. formes explicitement données dans les références ;
2. exemples du glossaire/dictionnaire Tosk avec analyse morphologique ;
3. exemples validés par le mainteneur/linguiste ;
4. seulement ensuite, exemples construits pour combler une cellule, marqués `review_required`.

## 4. Politique gold

Une sortie ne devient gold que si :

- son arbre/constructeur est connu ;
- la forme attendue possède une preuve linguistique ;
- le contexte (cas, nombre, définitude, genre, dialecte) est explicite ;
- elle a été revue `valid` ou `valid_variant` ;
- son hash/fixture est enregistré.

`questionable` ou `invalid` ne doivent jamais être promus pour faire passer un test.

## 5. Nommage suggéré des nouveaux scénarios

- `alb-nom-case-genitive.gfs`
- `alb-nom-ambigeneric-agreement.gfs`
- `alb-nom-nyje-adjective.gfs`
- `alb-nom-nyje-genitive.gfs`
- `alb-nom-possessive.gfs`
- `alb-nom-demonstratives.gfs`
- `alb-nom-numeral-agreement.gfs`
- `alb-nom-proper-names.gfs`

On peut regrouper si Wordbench préfère maintenir 52 scénarios plus larges, mais chaque invariant doit rester identifiable dans les CASEs.

## 6. Gates de chaque patch

Minimum avant merge :

- validation statique ciblée ;
- compilation des modules directement touchés ;
- compilation des consommateurs majeurs ;
- scénarios nominaux ciblés ;
- suite complète Wordbench ;
- pas de régression gold ;
- documentation réconciliée.

## Vecteurs et baseline v2

Les IDs/test seeds normatifs sont dans `16_CANONICAL_NOMINAL_TEST_VECTORS.md`. Le full gate et ses manifests/hashes sont dans `19_BASELINE_EVIDENCE_LOCK.md`.
