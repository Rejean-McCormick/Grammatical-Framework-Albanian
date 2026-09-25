---
document_role: english_parity_specification
status: normative
date: 2026-09-25
---

# Matrice de parité English

> Baseline source actuelle : `19_ENGLISH_REFERENCE_BASELINE.md`. Les signatures exactes viennent du snapshot RGL courant, jamais de mémoire.

## 1. Rôle d'English

English RGL est :
- benchmark de couverture;
- benchmark de maturité d'API;
- benchmark de profondeur lexicale et d'écosystème de tests.

English n'est pas :
- une grammaire modèle à copier;
- une preuve de la morphologie ou syntaxe albanaise;
- une obligation d'égalité brute de compteurs.

## 2. Baseline comparative documentée

Le roadmap du 2026-09-25 enregistre :

| Mesure | Albanian baseline | English reference |
|---|---:|---:|
| Dict abstract functions | 6 720 | 64 931 |
| MorphoDict lemgrams | 592 | 56 577 |
| Dict concrete | ~0.23 MB | ~2.99 MB |
| MorphoDict concrete | ~0.02 MB | ~2.82 MB |
| Paradigms source | ~54 KB | ~26 KB |
| Extend source | ~15.6 KB | ~17.5 KB |

Le même roadmap enregistre English `master` au commit :
`bfc0a89f9912e5db7567c955e0114437643c6eeb`.

Le ZIP `gf-rgl-master.zip` ne transporte pas `.git`, mais son commentaire ZIP contient le même identifiant `bfc0a89f...` que le roadmap. On le traite comme identifiant corroboré du snapshot fourni, sans prétendre reconstruire indépendamment l'historique Git.

## 3. Granularité

La matrice doit couvrir :
- modules;
- fonctions abstraites core;
- Extend/Extra;
- paradigmes publics;
- familles de constructions;
- Dict;
- MorphoDict;
- tests/golds;
- documentation/contrats publics utiles.

## 4. Statuts autorisés

### `implemented`
La même obligation RGL est implémentée directement.

### `equivalent`
La capacité fonctionnelle existe mais via une architecture albanaise différente.

### `partial`
Une sous-partie utile existe mais le contrat fonctionnel cible n'est pas entièrement couvert.

### `missing`
Capacité pertinente non implémentée.

### `linguistically_not_applicable`
La fonction/forme n'a pas d'équivalent pertinent pour l'albanais. **Justification obligatoire.**

### `needs_review`
Implémentation présente mais équivalence ou correction non certifiée.

Aucun autre statut ne doit apparaître sans modifier cette spécification.

## 5. Champs

Chaque ligne conserve :
- `english_module`
- `english_symbol_or_capability`
- `english_kind`
- `albanian_module`
- `albanian_symbol_or_strategy`
- `status`
- `linguistic_rationale`
- `evidence_refs`
- `test_ids`
- `gold_ids`
- `owner`
- `last_verified_source_lock`

## 6. Règle de R4

Le statut R4 exige :
- aucun `missing` core sans explication;
- tout N/A justifié;
- les `partial` core bornés et décidés;
- les `needs_review` core résolus ou explicitement exclus du périmètre de release;
- les capacités importantes soutenues par tests et, lorsque déterministes et confirmées, golds.

## 7. Comparaison lexicale

Les ratios English/Albanian sont des indicateurs de profondeur, pas des quotas.

Le dashboard doit comparer :
- taille brute;
- distribution par catégories;
- valence;
- classes morphologiques;
- proportion revue;
- proportion placeholder;
- échantillon certifié.

Une hausse de taille sans meilleure analyse ne constitue pas un gain de maturité.
