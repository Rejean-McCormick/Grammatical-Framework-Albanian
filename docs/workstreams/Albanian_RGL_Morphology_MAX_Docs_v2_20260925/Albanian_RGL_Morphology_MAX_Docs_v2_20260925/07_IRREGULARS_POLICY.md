# Politique `IrregSqi`

## 1. Définition

`IrregSqi` contient les lexèmes dont le paradigme ne peut pas être décrit proprement par une famille productive de `MorphoSqi` + principal parts normales.

Un mot rare n'est pas nécessairement irrégulier. Un mot qui fait échouer le smart constructor n'est pas automatiquement irrégulier : cela peut révéler une classe productive manquante.

## 2. Règle d'admission

Un lexème entre dans `IrregSqi` seulement si au moins une condition est satisfaite :

- suppletion ;
- alternance lexicale non productive ;
- plusieurs séries impossibles à prédire à partir des principal parts normales ;
- comportement morphologique unique suffisamment important pour justifier une entrée nommée.

## 3. Source et statut

Chaque irrégulier final doit enregistrer :

```text
lemma
category
principal parts / full tables
source(s)
reason_irregular
forms_tested
status: reviewed | provisional
```

## 4. Situation CURRENT verbale

Le code contient déjà un ensemble d'irréguliers et un constructeur `irregVFull`. C'est la direction préférée lorsque la totalité des séries doit être spécifiée.

L'ancien `irregV` compact ne doit pas être utilisé comme preuve que Past, Aorist, Imperfect, Optative ou Admirative sont identiques au présent : sa compatibilité historique n'est pas une certification linguistique.

## 5. Interaction avec smart paradigms

Le dispatcher générique ne doit pas contenir une liste croissante d'exceptions lexicales si celles-ci sont réellement irrégulières. À l'inverse, `IrregSqi` ne doit pas absorber une famille entière simplement parce que le dispatcher n'a pas encore de bon guard.

Décision type :

```text
plusieurs lexèmes + règle stable -> MorphoSqi
un lexème / suppletion -> IrregSqi
forme prévisible avec principal part supplémentaire -> ParadigmsSqi smart overload
forme non certifiée -> OPEN, jamais placeholder prétendu final
```

## 6. Tests

Chaque irrégulier doit avoir un test de table complet pour toutes les dimensions réellement stockées et au moins un test de syntaxe qui sélectionne une forme non triviale.
