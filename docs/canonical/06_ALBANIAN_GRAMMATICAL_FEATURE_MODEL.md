# Modèle grammatical cible — décisions globales

## Nominal

### Cas
**Décision optimale : séparer cas grammatical et cellule morphologique.**

```gf
param Case = Nom | Acc | Dat | Gen | Ablat ;
param MorphCase = MNom | MAcc | MDat | MAblat ;
oper morphCase : Case -> MorphCase = ... -- Gen -> MDat
```

- `Compl/Prep` transporte `Case` (5 valeurs).
- les tables nominales stockent `MorphCase` lorsque Dat/Gen sont syncrétiques.
- la *nyje* et la syntaxe voient `Gen` explicitement.
- aucune fausse cellule segmentale Gen n'est inventée.

### Genre et accord

Référence fournie : noms ambigénériques attestés, avec accord masculin au singulier et féminin au pluriel.

**TARGET :**

```gf
Noun.g : Number => Gender
Agr = {g : Gender ; n : Number ; p : Person}
Gender = Masc | Fem
```

Le core ne reçoit pas un `Neut` productif tant que des contrastes modernes productifs de flexion/accord Standard ne sont pas démontrés. Les reliques neutres restent lexicalisées/à traiter explicitement.

### Adjectif

Les références fournies décrivent l'adjectif comme fléchi pour **genre et nombre**, pas pour cas ; le cas/définitude conditionne surtout la *nyje*.

**TARGET :**

```gf
param AdjClass = Articulated | Unarticulated ;
Adj = {s : Gender => Number => Str ; cls : AdjClass}
```

La *nyje* est calculée séparément depuis le contexte grammatical.

### Nyje

Un seul service central :

```text
nyje/species × case × gender × number -> surface
```

Il remplace à terme les duplications `link_clitic` / `genitiveLink` et les conditions locales.

## Verbal

- common RGL `Tense × Anteriority × Polarity` reste le contrat public ;
- morphologie interne conserve présent, imparfait, aoriste et séries nécessaires ;
- `TPast + ASimul` cible l'imparfait comme mapping neutral/common ; l'aoriste reste une stratégie albanaise explicite ;
- `TPast + AAnter` cible `kisha + participle` comme pluperfect neutral ; toute série alternative reste explicitement marquée/testée ;
- auxiliaire perfectif Standard : Active → `kam`, NonActive → `jam`, sauf exception sourcée ;
- `MorphVoice` et `VoiceUse` restent distincts ;
- progressive est une stratégie typée, jamais un simple préfixe libre `po` ;
- optatif/admiratif sont conservés morphologiquement et exposés via extension albanaise si le common RGL ne les porte pas.

## Clitiques

`CliticCluster` conserve au minimum rôles `Acc`, `Dat`, `Refl` et leurs traits. Le flattening/fusion arrive à la frontière verbale. `u` argumental, `u` datif 3pl et `u` non-actif ne partagent jamais une identité interne par homophonie.

## Clause

- ordre neutre SVO comme stratégie canonique tant que le contexte ne demande pas autre chose ;
- questions/relatives/slash préservent government/case jusqu'à réalisation ;
- invariant `që` est la stratégie relative ordinaire par défaut ; `cili` reste disponible comme relatif fléchi/explicite, notamment lorsque le cas/préposition doit être visible ;
- preposition stranding n'est pas une stratégie canonique : les fonctions RGL concernées doivent recevoir un équivalent albanais (pied-piping/relatif explicite/etc.) ou rester `needs_review` jusqu'à preuve ;
- accord impersonal/extraposed adjectival : cible féminin singulier pour les constructions attestées par la référence fournie ; autres familles restent testées séparément.
