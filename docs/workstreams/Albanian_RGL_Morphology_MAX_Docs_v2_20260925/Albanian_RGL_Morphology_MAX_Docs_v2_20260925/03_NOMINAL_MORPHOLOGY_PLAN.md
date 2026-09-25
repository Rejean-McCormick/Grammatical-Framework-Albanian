# Plan de morphologie nominale

## 1. Situation CURRENT

`ResSqi.Noun` est actuellement :

```gf
{s : Species => Case => Number => Str ; g : Gender}
```

avec :

```gf
Species = Indef | Def
Case = Nom | Acc | Dat | Ablat
Gender = Masc | Fem
```

Le système conserve donc déjà explicitement 2 × 4 × 2 = 16 cellules de surface par nom, plus un genre scalaire.

`ParadigmsSqi` possède déjà :

- `NForms` comme record complet de 16 formes observables ;
- `mkNFull : NForms -> Gender -> N` ;
- `mkN : Str -> N` ;
- `mkN : Str -> Str -> N` ;
- `mkN2`, `mkN3`, `mkPN`, `mkLN`, `mkGN`, `mkSN`.

## 2. Evidence linguistique à respecter

Les références fournies décrivent :

- nominatif, accusatif, datif, génitif, ablatif ;
- syncrétisme morphologique datif/génitif ;
- rôle du nyje dans la distinction génitive ;
- flexion en définitude ;
- article défini postposé ;
- genre masculin/féminin et un neutre dont le statut est disputé ;
- attestations de noms étiquetés `ambigeneric` dans les matériaux Geg.

Aucune de ces observations ne suffit, seule, à imposer immédiatement un nouveau `Case` ou un troisième constructeur de `Gender` dans la RGL standard moderne. Elles définissent des questions à résoudre avec données Tosk/standard ciblées.

## 3. TARGET — représentation nominale

### N-01 — Cas

Objectif : la syntaxe doit pouvoir distinguer toutes les fonctions casuelles nécessaires à l'albanais standard, même quand deux cas sont syncrétiques morphologiquement.

Candidat prioritaire : rendre `Gen` explicite au niveau de type si les consommateurs RGL et les tests de possession/génitif bénéficient réellement de cette distinction. La forme peut rester identique au datif là où le nom n'a pas de différence segmentale, tandis que le nyje est réalisé à la frontière appropriée.

**État : CANDIDATE, pas CURRENT.**

### N-02 — Genre dépendant du nombre

DRAFT-MAX propose `Noun.g : Number => Gender`. C'est une représentation plausible pour les noms dont le comportement d'accord change au pluriel.

Conditions de promotion :

1. corpus standard albanais montrant des familles productives ou lexicalement stables ;
2. identification des consommateurs (`CN`, `NP`, adjectifs, déterminants, coordination, symboles) ;
3. audit de tous les constructeurs de `N`/`CN` ;
4. migration incrémentale compilable ;
5. tests d'accord singulier/pluriel.

**État : CANDIDATE.**

### N-03 — Neutre

Le neutre est mentionné dans la référence avec statut disputé. Il ne sera pas ajouté au type public tant que l'on n'aura pas établi :

- son rôle productif dans le standard ciblé ;
- ses contrastes d'accord et de flexion ;
- les lexèmes qui l'exigent ;
- les effets RGL en aval.

**État : OPEN.**

## 4. API nominale finale

Échelle de constructeurs requise :

1. `mkN lemma` — seulement pour le domaine où le lemme suffit de manière sûre ;
2. `mkN lemma plural` — principal part supplémentaire pour désambiguïser la classe ;
3. constructeur avec genre explicite lorsque le genre ne peut être déduit de façon fiable ;
4. constructeur par principal parts observables pour les familles où deux formes ne suffisent pas ;
5. `mkNFull` — escape hatch complet pour paradigme attesté non productif ;
6. constructeurs spécialisés nommés pour grandes familles réellement productives si leur domaine est linguistiquement clair.

Les noms exacts des nouveaux overloads ne seront figés qu'après l'inventaire des classes.

## 5. Refactor des 563 classes

Chaque classe interne doit être reliée à :

```text
class_id
input pattern / principal parts
singular gender
plural agreement gender (si applicable)
all 16 current cells (+ Gen si adopté)
phonological alternation
examples certified
source evidence
status: productive | restricted | lexicalized | duplicate | obsolete
```

But : obtenir un ensemble de **familles productives compréhensibles** et garder les classes numérotées comme implémentation générée ou table de compatibilité, pas comme connaissance implicite.

## 6. Guards

Les fallbacks actuels `reg2N -> regN form1` doivent être audités. Si `form2` contredit la classe déduite de `form1`, l'API finale ne doit pas ignorer silencieusement la seconde principal part.

Principe :

```text
principal parts compatibles -> classe
principal parts incompatibles -> erreur explicite
classe ambiguë -> demander une principal part supplémentaire / constructeur explicite
```

## 7. Tests minimaux par famille nominale

Pour chaque famille productive :

- table complète indéfini/défini × cas × nombre ;
- au moins 3 lexèmes représentatifs ;
- une frontière orthographique ;
- une entrée qui ne doit pas matcher ;
- accord avec adjectif/déterminant ;
- si genre pluriel pertinent : contraste singulier/pluriel ;
- si Gen adopté : paire Dat/Gen montrant le syncrétisme nominal et la distinction structurale.

## 8. Promotion gate v2

Aucune décision `Gen`, plural-gender ou neutre n'est implémentable durablement avant satisfaction du producer/consumer audit (`15_*`), evidence IDs (`17_*`) et décision append-only (`23_*`).
