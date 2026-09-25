# Architecture morphologique finale visée

## 1. Principe directeur

La morphologie finale doit séparer quatre responsabilités :

```text
ResSqi
  = dimensions grammaticales + types de records + opérations transversales

MorphoSqi
  = classes flexionnelles + dérivations + morphophonologie productive

ParadigmsSqi
  = API publique à partir de formes observables + guards + wrappers de valence

IrregSqi
  = inventaire sourcé des lexèmes réellement irréguliers
```

La syntaxe doit **sélectionner** des formes, pas reconstruire des paradigmes à partir de chaînes finies.

## 2. État courant à préserver

`ResSqi` courant encode notamment :

- `Species = Indef | Def` ;
- `Case = Nom | Acc | Dat | Ablat` ;
- `Gender = Masc | Fem` ;
- `GenNum = GSg Gender | GPl` ;
- `Noun.s : Species => Case => Number => Str` ;
- `Noun.g : Gender` ;
- `Adj.s : Case => Gender => Number => Str` ;
- `Tense = Pres | Past | Imperfect | Aorist` ;
- une table verbale avec indicatif, subjonctif, impératif, participe, optatif et admiratif.

Cette réalité ne doit pas être réécrite rétrospectivement dans la documentation avant migration.

## 3. Architecture TARGET

### 3.1 Dimensions

Chaque dimension finale doit être classée :

- **stored** : index réel d'une table lexicale ;
- **derived** : calculée de façon sûre depuis principal parts / classe ;
- **virtual** : distinction morphosyntaxique sans cellule distincte obligatoire ;
- **metadata** : propriété lexicale utilisée par un consommateur.

Aucune dimension n'est ajoutée « pour être complète ». Elle doit avoir un consommateur.

### 3.2 Nom

La représentation finale doit pouvoir exprimer correctement :

- nombre ;
- définitude ;
- cas ;
- genre nécessaire à l'accord ;
- variation de genre selon le nombre **si et seulement si** la revue albanaise confirme que cette propriété est nécessaire pour le standard couvert ;
- syncrétismes sans supprimer les distinctions grammaticales qui restent nécessaires à la syntaxe.

### 3.3 Adjectif

La représentation finale doit porter les dimensions morphologiquement réelles de l'adjectif et conserver séparément ce qui relève du nyje / de la syntaxe. L'accord ne doit pas être aplati dans une forme de citation.

### 3.4 Verbe

Le record verbal final doit permettre de représenter :

- les systèmes morphologiques nécessaires à la dérivation des formes finies ;
- personne et nombre ;
- impératif ;
- participe(s) requis ;
- formes synthétiques des moods nécessaires ;
- distinctions de voix réellement lexicales/morphologiques ;
- assez d'information pour que les formes analytiques soient assemblées par la syntaxe sans deviner à partir de chaînes.

### 3.5 Frontière synthétique / analytique

Principe TARGET :

> `MorphoSqi` produit les formes lexicalement/morphologiquement déterminées. Les particules, auxiliaires, négation, clitiques et assemblages analytiques appartiennent à la couche de réalisation appropriée, sauf lorsqu'un allomorphe est réellement conditionné morphologiquement et doit être conservé dans le lexème.

## 4. Compression interne vs table publique

La table publique peut être complète tout en étant construite depuis une représentation comprimée :

```text
formes observables / principal parts
        ↓ validation
classe/stem descriptor interne
        ↓ dérivation
record complet N/A/V
        ↓ lock-safe wrapper
catégorie RGL
```

Les codes de classes (`mkN001`…`mkN563`, etc.) sont des détails de `MorphoSqi`, pas une API lexicographique finale.

## 5. Classes existantes

Le `MorphoSqi` courant contient exactement, par noms de constructeurs numérotés :

- 563 classes nominales `mkN001`–`mkN563` ;
- 36 classes adjectivales `mkA001`–`mkA036` ;
- 135 classes verbales `mkV001`–`mkV135`.

TARGET : transformer cette richesse brute en familles linguistiquement documentées, testables et accessibles par principal parts. Une réduction du nombre de classes internes est acceptable si elle préserve exactement les paradigmes certifiés et améliore l'auditabilité.

## 6. Anti-objectifs

La version finale ne doit pas :

- exposer 734 identifiants de classes numérotées aux utilisateurs comme seule méthode d'entrée ;
- utiliser une heuristique finale basée seulement sur la dernière lettre lorsqu'une forme principale supplémentaire résout l'ambiguïté ;
- remplir des cellules absentes par la forme de citation pour faire compiler ;
- recopier des patterns English lorsque la structure albanaise est différente ;
- déplacer dans `IrregSqi` des classes productives simplement difficiles à analyser ;
- stocker dans `MorphoDictSqi` la sémantique ou la valence qui appartient à `DictSqi`.

## 7. Closure references v2

La conformité à cette architecture est mesurée par `14_CURRENT_MORPHOLOGY_INVENTORY.md`, `15_RES_PRODUCER_CONSUMER_MAP.md`, `19_QUANTITATIVE_RELEASE_GATES.md` et `20_CROSS_WORKSTREAM_CONTRACTS.md`.
