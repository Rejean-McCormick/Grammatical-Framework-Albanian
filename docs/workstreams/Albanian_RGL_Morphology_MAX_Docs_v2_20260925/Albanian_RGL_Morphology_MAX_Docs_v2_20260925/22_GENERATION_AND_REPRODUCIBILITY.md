# Generation and reproducibility policy

## 1. Current fact

`MorphoSqi.gf` est un fichier très volumineux contenant 734 constructeurs numérotés. Le snapshot fourni ne fournit pas, dans le cœur actif, un générateur déclaré comme source unique de ces 734 définitions. Les scripts d'analyse/lint ne doivent donc pas être confondus avec une source génératrice autoritative.

## 2. Decision required

Avant un refactor massif, choisir explicitement l'un de ces modèles :

### A — source GF manuelle autoritative

`MorphoSqi.gf` est édité/reviewé directement. Les outils ne font qu'analyser/valider.

### B — source de données + générateur autoritatif

Les familles/principal parts résident dans un format source versionné et `MorphoSqi.gf` est généré de manière déterministe.

### C — hybride

Helpers/familles manuels + tables répétitives générées, avec frontières explicites.

**État : OPEN.** Aucun générateur nouveau ne devient autoritatif implicitement.

## 3. Requirements if generated

- input source versionné ;
- generator versionné ;
- commande reproductible ;
- output deterministic byte-for-byte ou normalisation définie ;
- hashes input/output ;
- CI qui régénère et diff ;
- mapping ancien class_id → family_id ;
- aucun gold produit automatiquement sans revue.

## 4. Derived inventories

Les fichiers sous `generated/` de ce pack sont analytiques et régénérables ; ils **ne génèrent pas le code GF** et ne constituent pas une nouvelle source de vérité linguistique.
