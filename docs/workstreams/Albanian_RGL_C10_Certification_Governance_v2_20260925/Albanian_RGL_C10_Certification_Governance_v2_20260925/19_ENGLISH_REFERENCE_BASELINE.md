---
document_role: english_reference_baseline
status: source_grounded_baseline
version: 1.0
date: 2026-09-25
---

# Baseline English de référence

## 1. Source

Archive fournie : `gf-rgl-master.zip`.

Commentaire ZIP :
`bfc0a89f9912e5db7567c955e0114437643c6eeb`

Le roadmap Albanian fourni cite le même identifiant comme baseline English. Ce double signal permet de l'utiliser comme identifiant pratique du snapshot, sans prétendre reconstruire l'historique Git absent du ZIP.

## 2. Mesures vérifiées dans le snapshot fourni

- fichiers `.gf` directement sous `src/english/` : **41**;
- `DictEngAbs.gf` : **64 931** déclarations `fun`;
- `src/morphodict/MorphoDictEngAbs.gf` : **56 577** déclarations `fun`.

Baseline Albanian de travail :
- `DictSqi` : **6 720** fonctions;
- `MorphoDictSqi` : **592** lemgrammes.

Ces écarts mesurent la profondeur lexicale, pas une obligation d'égalité numérique.

## 3. Upstream Albanian vs branche de travail

Le snapshot upstream fourni contient une Albanian RGL plus petite que la branche de travail actuelle. L'inventaire déjà généré montre :
- 27 modules `.gf` Albanian upstream correspondants;
- 26 modifiés dans la branche de travail;
- 1 byte-identique;
- 24 modules `.gf` ajoutés côté branche de travail.

Conséquence :
English/upstream servent de **référence de contrat et de provenance**, pas de remplacement de l'état Albanian courant.

## 4. Axes de comparaison English

La matrice finale doit mesurer séparément :

1. abstract/core function coverage;
2. modules core;
3. `Extend`/`Extra`;
4. public `Paradigms`;
5. catégories et représentations nécessaires;
6. constructions;
7. `Dict`;
8. `MorphoDict`;
9. irréguliers;
10. documentation;
11. tests/scénarios;
12. golds/régression;
13. release discipline.

## 5. Source de signatures

Pour les signatures exactes, utiliser les fichiers `src/abstract/*.gf` du snapshot upstream courant.

Le Compendium contient `ABSTRACT_SIGNATURES.jsonl` et `PARADIGM_API.jsonl`, mais son manifest de Paradigm API déclare un autre commit documentaire (`62c5030...`) et une provenance principalement documentaire. Ces index sont utiles pour navigation/patterns, mais ne doivent pas écraser le source upstream courant.

## 6. Sens de la parité

Parité signifie :
- même classe de capacité quand elle est pertinente;
- équivalent Albanian correct lorsque l'architecture diffère;
- N/A linguistique explicitement justifié;
- profondeur de tests et de régression comparable;
- profondeur lexicale comparable en usage pratique.

Parité ne signifie pas :
- copier les lincats English;
- adopter les paradigmes English;
- même nombre de lignes;
- même nombre exact d'entrées lexicales;
- traiter une différence linguistique comme déficit.
