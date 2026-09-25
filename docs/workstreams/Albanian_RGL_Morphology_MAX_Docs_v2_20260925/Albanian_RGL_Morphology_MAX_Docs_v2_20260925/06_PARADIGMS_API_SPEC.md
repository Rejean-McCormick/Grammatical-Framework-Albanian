# Spécification cible de `ParadigmsSqi`

## 1. Mission

`ParadigmsSqi` doit être la seule API normale dont `LexiconSqi`, `DictSqi`, `MorphoDictSqi`, `StructuralSqi` et les utilisateurs RGL ont besoin pour créer des lexèmes flexionnels.

Un utilisateur ne devrait connaître ni `mkN317`, ni la disposition interne des tables de `ResSqi`.

## 2. Surface CURRENT importante

La surface courante comprend déjà :

- types publics/alias `Gender`, `Case` et constantes ;
- `regN`, `reg2N`, `regA`, `reg2A`, `regV`, `reg2V` ;
- overloads `mkN`, `mkA`, `mkV` ;
- `NForms` + `mkNFull` ;
- `irregVFull` ;
- wrappers `mkN2`, `mkN3`, `mkA2`, `mkV2`, `mkV3`, `mkVV`, `mkVS`, `mkVQ`, `mkVA`, etc. ;
- `mkPrep` avec gouvernement casuel.

Cette surface doit rester compatible par défaut pendant la migration.

## 3. Ladder TARGET

Pour N/A/V :

### Niveau 1 — simple

Une forme de citation lorsque le domaine est réellement non ambigu.

### Niveau 2 — smart + principal part

Deux ou plusieurs formes observables permettant de sélectionner une classe de façon fiable.

### Niveau 3 — famille spécialisée

Constructeur explicitement nommé lorsque la famille est productive mais nécessite un traitement propre.

### Niveau 4 — formes complètes observables

Record structuré servant d'escape hatch sans exposition des records bas niveau.

### Niveau 5 — irrégulier

Entrée dans `IrregSqi` ou constructeur complet exact lorsque le paradigme est lexicalement exceptionnel.

## 4. Guards obligatoires

Chaque smart constructor doit avoir un domaine documenté.

Il doit :

- accepter des entrées attestées de sa classe ;
- vérifier la compatibilité des principal parts fournies ;
- refuser les entrées hors domaine ;
- ne jamais ignorer silencieusement une principal part ;
- ne jamais fabriquer des formes via un placeholder constant comme stratégie de succès.

## 5. Compatibilité

Les overloads existants ne seront pas supprimés sans :

1. inventaire des appels dans tout le snapshot ;
2. remplacement automatique ou mécanique prouvé ;
3. période de compatibilité si nécessaire ;
4. full compile + scénarios ;
5. preuve que les sorties certifiées ne régressent pas.

## 6. Valence

`mkV2`, `mkV3`, `mkVV`, etc. doivent rester des wrappers de **catégorie/valence** au-dessus d'un `V` morphologiquement correct. Ils ne doivent pas devenir des endroits où l'on répare une conjugaison.

Même principe pour `N2/N3` et `A2` : la morphologie du head et le gouvernement du complément sont des décisions distinctes.

## 7. Government et cas

`mkPrep : Str -> Case -> Prep` est la voie explicite pour le gouvernement. Les overloads de commodité peuvent conserver un défaut seulement quand ce défaut est une convention RGL documentée et sûre.

## 8. Documentation utilisateur requise

Pour chaque constructeur public final :

```text
nom
catégorie retournée
formes d'entrée attendues
classe(s) couvertes
hypothèses
erreurs possibles
exemples certifiés
fallback recommandé
```

## 9. Critère de stabilité de l'API

L'API est considérée stable lorsque :

- toutes les classes importantes sont accessibles sans identifiant numérique ;
- chaque overload est testé ;
- les inputs ambigus sont rejetés ou désambiguïsés ;
- `DictSqi` et `MorphoDictSqi` peuvent remplacer une grande part des placeholders par ces constructeurs ;
- aucune modification de record interne ne force la réécriture massive des lexiques publics.

## 10. Measurable API gate v2

Voir `16_ENGLISH_PARITY_MATRIX.md`, `19_QUANTITATIVE_RELEASE_GATES.md` et `21_API_COMPATIBILITY_AND_DEPRECATION.md`. La surface n'est stable que quand toute absence anglaise pertinente est explicitement classée et que les callers numériques hors zones autorisées sont à zéro.
