# Plan de morphologie verbale MAX

## 1. Situation CURRENT

`ResSqi.Verb` stocke actuellement :

- indicatif : `Pres`, `Past`, `Aorist`, `Imperfect` × nombre × personne ;
- subjonctif × nombre × personne ;
- impératif × nombre ;
- participe ;
- optatif présent et parfait ;
- admiratif présent et imparfait.

`MorphoSqi` contient 135 classes `mkV001`–`mkV135`.

`ParadigmsSqi` fournit notamment :

- `regV : Str -> V` ;
- `reg2V : Str -> Str -> V` ;
- `mkV` à un ou deux arguments ;
- wrappers `V2`, `V3`, `VV`, `VS`, `VQ`, `VA`, etc. ;
- `irregVFull`, qui accepte explicitement les tables complètes ;
- un ancien `irregV` compact.

## 2. Evidence linguistique structurante

Les références fournies décrivent trois systèmes utiles pour raisonner sur les principal parts :

1. **système du présent** — base du présent, de l'imparfait et de formes analytiques/subordonnées liées au présent ;
2. **système de l'aoriste** — base du passé défini et, dans beaucoup de cas, de l'optatif ;
3. **système participial** — lié au participe et à diverses formes analytiques/admiratives.

Elles indiquent également :

- un présent/subjonctif ;
- un imparfait et imparfait subjonctif ;
- un futur analytique ;
- des formes non-actives ;
- des temps composés avec auxiliaire ;
- un inventaire riche de formes synthétiques.

Cela soutient une stratégie de **principal parts** plutôt qu'une dépendance excessive à la seule 1re personne du présent.

## 3. Problèmes CURRENT prioritaires

### V-01 — heuristique à une forme

`regV` déduit une classe à partir de la forme de présent fournie. C'est ergonomique mais insuffisant lorsque plusieurs classes partagent la même terminaison.

TARGET : garder le constructeur simple uniquement pour un domaine prouvé non ambigu.

### V-02 — `reg2V` fallback

Le fallback actuel revient à `regV form1`, ce qui peut ignorer un participe contradictoire. TARGET : une principal part fournie doit être **validée**, jamais jetée.

### V-03 — ancien `irregV`

Le constructeur compact courant remplit plusieurs séries (Past/Aorist/Imperfect/Optative/Admirative) à partir des formes du présent. C'est un constructeur de compatibilité, pas une représentation satisfaisante de l'irrégularité complète.

TARGET :

- `irregVFull` ou un ladder de principal parts exacts pour les véritables irréguliers ;
- déprécier l'utilisation de `irregV` lorsque les cellules qu'il synthétise ne sont pas linguistiquement garanties.

### V-04 — `subjunctiveFromPresent`

Le code courant contient des exceptions lexicales (`jam`, `kam`, `dua`, `di`, `ha`, `pi`, `vij`, `them`) et des heuristiques. Elles doivent être reclassées : règle productive, allomorphie de classe ou irrégularité lexicale. Les exceptions lexicales durables doivent migrer vers la couche appropriée plutôt que rester cachées dans une fonction globale.

## 4. TARGET — principal parts

L'API finale devra déterminer, à partir du corpus des 135 classes, le plus petit ensemble de formes observables qui discrimine correctement les familles.

Hypothèse de travail à tester :

```text
présent principal
+ forme d'aoriste pertinente
+ participe
(+ autre principal part quand nécessaire)
```

Ce n'est **pas encore une signature acceptée**. Le choix doit être dérivé par analyse des classes et validé contre les références.

## 5. Voix et non-actif

DRAFT-MAX propose des métadonnées typées `Voice`, `VoiceUse` et `PerfectAux`. Cette direction est intéressante mais touche la syntaxe et l'assemblage de VP.

Conversation 1 doit d'abord répondre à une question plus locale :

> Quelles formes du non-actif sont lexicalement/morphologiquement stockées ou dérivées dans le paradigme verbal, et lesquelles relèvent de l'assemblage syntaxique ?

Aucune dérivation heuristique de formes synthétiques non-actives à partir de l'actif ne sera ajoutée sans règle linguistique attestée.

## 6. Formes analytiques

Le futur, les temps composés, la progressivité et plusieurs constructions de voix sont décrits comme analytiques dans les références. TARGET : ne pas dupliquer dans chaque `Verb` des chaînes complètes que la syntaxe peut construire systématiquement à partir :

- d'une forme verbale sélectionnée ;
- d'un auxiliaire ;
- d'une particule ;
- des informations de voix/TAM nécessaires.

La frontière exacte sera coordonnée avec les conversations TAM/voix/clitiques.

## 7. Classes et spécialisation

Les 135 classes seront regroupées en familles :

```text
family_id
principal parts
rules
alternations
imperative strategy
participle strategy
aorist strategy
non-active behavior
exceptions
certified lexemes
```

Les grandes familles productives doivent obtenir des constructeurs spécialisés ou des descripteurs internes stables. Les vrais suppletifs restent `IrregSqi`.

## 8. Tests verbaux obligatoires

Chaque famille productive doit couvrir :

- 6 personnes au présent ;
- imparfait ;
- aoriste ;
- subjonctif ;
- impératif sg/pl ;
- participe ;
- optatif/admiratif lorsque la famille les produit synthétiquement ;
- frontière active/non-active si applicable ;
- un input invalide ;
- au moins un consommateur syntaxique complet.

## 9. Promotion gate v2

Le triplet présent/aoriste/participe reste une hypothèse jusqu'à analyse de discriminabilité des 135 classes. Toute décision de voice/TAM doit suivre `20_CROSS_WORKSTREAM_CONTRACTS.md`.
