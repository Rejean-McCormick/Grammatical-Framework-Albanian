# Audit de régression — checkpoint 2 vs snapshot 20260924-181818

## Conclusion

**Pas de perte massive de code ou de modules lors d'une application en overlay**, mais **régression d'intégration majeure** : le checkpoint 2 modifie plusieurs contrats centraux (`Case`, `Noun.g`, `Verb`, `VP`) sans propager ces changements à tout le snapshot complet.

Le checkpoint 2 ne doit donc **pas être considéré compilable/sûr en l'état** sur le snapshot `20260924-181818`.

## Conservation du contenu

Comparaison du snapshot complet avec le snapshot obtenu en appliquant uniquement les 10 fichiers du checkpoint 2 :

- fichiers de référence : **241**
- fichiers inchangés byte-for-byte : **231**
- fichiers modifiés : **10**
- fichiers supprimés : **0**
- fichiers ajoutés dans l'arbre cible : **0**
- fichiers `validation/` conservés byte-for-byte : **154 / 154**

Dans les 10 fichiers remplacés :
- aucun symbole top-level métier n'a disparu selon l'extraction structurale ;
- aucune suppression brute de grand bloc n'a été détectée ;
- les suppressions visibles de `cl` / `subjcl` sont des changements volontaires de représentation vers `CliticCluster`.

## Bloqueurs majeurs détectés

### 1. `VP.cl` / `VP.subjcl` supprimés mais consommateurs non migrés

Après application de l'overlay, il reste **12 accès** aux anciens champs :

- `VerbSqi.gf` : 8 accès
- `ExtendSqiVPBridge.gf` : 4 accès

Ces références sont incompatibles avec le nouveau `ResSqi.VP`.

### 2. `Verb` enrichi, mais `MorphoSqi.gf` n'est pas propagé

Le nouveau `ResSqi.Verb` exige :
- `voice`
- `voiceUse`
- `perfAux`

Or `MorphoSqi.gf` contient **84 constructions directes `lin V { ... }`** qui ne fournissent aucun de ces trois champs.

C'est un bloqueur de compilation de grande ampleur.

### 3. Ajout de `Gen` non propagé dans `MorphoSqi.gf`

`Case` passe de 4 à 5 valeurs avec `Gen`.

Dans `MorphoSqi.gf` :
- **61 constructions directes `lin N`** restent sur des tables Nom/Acc/Dat/Ablat sans `Gen`;
- **18 constructions directes `lin A`** restent sur des tables à 4 cas;
- l'audit structurel trouve **1736 blocs de tables imbriquées** utilisant les quatre anciens cas sans branche `Gen` (ce chiffre inclut des sous-tables imbriquées et n'est pas un nombre de paradigmes uniques).

C'est un autre bloqueur de compilation.

### 4. `Noun.g : Gender` → `Number => Gender` non propagé

Dans `MorphoSqi.gf`, les **61 constructions directes `lin N`** gardent encore un `g = Masc` ou `g = Fem` scalaire.

Des consommateurs hors overlay utilisent aussi encore `cn.g` comme un `Gender`, notamment :
- `QuestionSqi.gf`
- `ExtendSqiHelpers.gf`
- `ExtendSqiRNP.gf`
- `ExtendSqiScaffolding.gf`

Ces usages doivent devenir `cn.g ! n` avec le nombre approprié.

### 5. Risques sémantiques après migration mécanique

Même après correction des erreurs de type, il faudra préserver la sémantique du nouveau système :
- `ReflVP` doit alimenter le slot réflexif typé et marquer la voix réflexive;
- `PassV2` doit marquer la voix/passif et sélectionner `AuxJam`;
- le progressif `po` dans `ExtendSqiVPBridge` doit passer par `preverb`, pas être concaténé dans l'ancien `cl`;
- les compléments subjonctifs doivent utiliser les helpers de réalisation centralisée pour conserver les contractions de `të`.

## Validation

Le script statique du checkpoint 2 passe 36/36, mais il ne vérifie que les dix fichiers de l'overlay et ne détecte pas les consommateurs du snapshot complet.

Le linter `gf_morphosqi_lint.py` du snapshot retourne 0 finding, mais il est heuristique et ne contrôle ni l'exhaustivité du nouveau `Case`, ni les nouveaux champs de `Verb`, ni le nouveau type de `Noun.g`.

Le compilateur `gf` n'est pas installé dans l'environnement, donc aucune certification `gf -make` n'a pu être effectuée.

## Recommandation

Ne pas publier/appliquer le checkpoint 2 comme overlay final.

La bonne suite est une passe de propagation sur le snapshot complet, au minimum :
1. `MorphoSqi.gf`
2. `VerbSqi.gf`
3. `ExtendSqiVPBridge.gf`
4. `QuestionSqi.gf`
5. `ExtendSqiHelpers.gf`
6. `ExtendSqiRNP.gf`
7. `ExtendSqiScaffolding.gf`
8. `DocumentationSqi.gf`

Puis relancer une validation structurelle globale et, dès qu'un binaire GF est disponible, `gf -make`.
