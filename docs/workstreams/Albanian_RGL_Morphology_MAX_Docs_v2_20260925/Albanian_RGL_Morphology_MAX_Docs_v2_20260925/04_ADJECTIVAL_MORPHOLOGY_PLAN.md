# Plan de morphologie adjectivale

## 1. Situation CURRENT

`ResSqi.Adj` contient :

```gf
{s : Case => Gender => Number => Str ; clit : Bool}
```

Le code courant représente donc déjà cas × genre × nombre, ainsi qu'un booléen indiquant le comportement lié à l'article/nyje.

`MorphoSqi` contient 36 classes `mkA001`–`mkA036` et `ParadigmsSqi` expose :

- `regA : Str -> A` ;
- `reg2A : Str -> Str -> A` ;
- `mkA : Str -> A` ;
- `mkA : Str -> Str -> A` ;
- `mkA2` et wrappers de complément.

## 2. Evidence cible

Les références fournies montrent que le nyje attributif est central et varie selon des propriétés grammaticales. Elles attestent aussi des adjectifs annotés par genre/nombre dans les analyses de leçons.

TARGET : séparer clairement :

- la **forme flexionnelle de l'adjectif** ;
- l'**article de liaison / nyje** ;
- le **choix syntaxique** de position et de contexte.

## 3. Problèmes à auditer

### A-01 — `clit : Bool`

Déterminer si le booléen suffit pour la version finale ou si l'adjectif doit porter une classe de comportement plus informative. Aucun enrichissement ne sera accepté sans consommateurs concrets.

### A-02 — `reg2A` ignore parfois la seconde forme

Le fallback actuel de `reg2A` est `regA form1`. Dans une API de principal parts, ignorer silencieusement `form2` peut cacher une contradiction.

TARGET :

- vérifier que `form2` est compatible avec la classe choisie ;
- sinon échouer explicitement ou sélectionner un constructeur plus explicite.

### A-03 — degré

La comparaison/superlatif doit rester à la bonne frontière. Ne pas gonfler `Adj` avec une dimension de degré si le RGL albanais réalise le degré compositionnellement et si aucune forme lexicale irrégulière ne l'exige.

## 4. API finale souhaitée

Ladder :

1. forme de citation unique pour classes sûres ;
2. masculin singulier + principal part plurielle ou féminine selon ce qui maximise le pouvoir discriminant ;
3. formes principales supplémentaires pour alternances non prédictibles ;
4. record complet pour adjectifs irréguliers / lexicalisés ;
5. constructeurs `A2` séparant morphologie adjectivale et gouvernement.

Le choix exact des principal parts sera établi par analyse des 36 classes et des données Tosk/standard.

## 5. Tests

Pour chaque classe productive :

- Nom/Acc/Dat/Ablat (et Gen si adopté) ;
- Masc/Fem ;
- Sg/Pl ;
- présence/absence et forme du nyje dans des phrases complètes ;
- accord avec noms de genres différents ;
- cas de coordination et plural agreement ;
- tests négatifs pour inputs incompatibles.

## 6. Promotion gate v2

Les principal parts adjectivales finales doivent être dérivées de l'inventaire des 36 classes et mesurées contre `19_QUANTITATIVE_RELEASE_GATES.md`; le nyje reste une frontière partagée décrite dans `20_CROSS_WORKSTREAM_CONTRACTS.md`.
