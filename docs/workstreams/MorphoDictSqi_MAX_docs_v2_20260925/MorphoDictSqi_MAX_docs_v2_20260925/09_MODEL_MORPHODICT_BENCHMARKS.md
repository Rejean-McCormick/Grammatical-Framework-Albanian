# Benchmarks — grands MorphoDict RGL fournis

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Échelle observée dans le snapshot RGL fourni

| MorphoDict | Fonctions | Répartition principale |
|---|---:|---|
| Eng | ~56 577 | N ~36k ; A ~12,9k ; V ~6,2k ; Adv ~1,2k ; Prep ~0,2k |
| Fin | ~50 915 | N ~34,6k ; V ~9,4k ; Adv ~5,4k ; A ~1,5k |
| Fre | ~92 645 | N ~59,7k ; A ~22,6k ; V ~8,8k ; Adv ~1,6k |
| Ger | ~44 227 | N ~30,9k ; A ~7,9k ; V ~4,7k ; Adv ~0,7k |
| Ita | ~39 495 | A/N/V dominants ; catégories additionnelles |
| Spa | ~42 654 | N/A/V dominants ; PN/Adv et autres |
| Swe | ~121 690 | N ~90k ; A ~21k ; V ~8,5k ; autres |

Ces nombres sont des benchmarks d'échelle seulement.

## 2. Leçon structurelle de `MkMorphodict.hs`

Le générateur de référence impose : 1 fonction par lemgramme, sans sens, sans sous-catégorisation, sans `variants`, merge morphologique et noms désambiguïsés par formes différentes.

## 3. Leçon des configs

`MorphoDictEng.config` utilise plusieurs formes caractéristiques pour N/A/V (`mkN 0 2`, `mkA 0 2 4 6`, `mkV 0 4 2`) ; Finnish en utilise encore davantage. Cela illustre un principe de maturité : **une forme citationnelle seule n'est pas nécessairement suffisante pour sélectionner une table**.

Le `MorphoDictSqi.config` courant (`mkN/mkA/mkV 0`) est explicitement un bootstrap. MAX doit apprendre/encoder les principal parts ou classes nécessaires plutôt que généraliser cette simplification.

## 4. Ce que les modèles peuvent inspirer

- architecture de génération ;
- scaling ;
- sélection de formes caractéristiques ;
- traitement des irréguliers ;
- conventions de naming ;
- mécanismes de déduplication.

Ils ne décident jamais genre, flexion, standard/dialecte ou alternance albanaise.
