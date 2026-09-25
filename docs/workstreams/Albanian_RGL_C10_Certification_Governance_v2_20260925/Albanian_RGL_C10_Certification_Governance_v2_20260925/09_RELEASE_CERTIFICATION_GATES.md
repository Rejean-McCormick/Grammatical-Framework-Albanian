---
document_role: certification_release_gates
status: normative
date: 2026-09-25
---

# Gates de certification et release

> Les niveaux R0–R4 et les seuils normatifs sont centralisés dans `20_CERTIFICATION_THRESHOLDS_AND_LEVELS.md`. Ce fichier décrit l'assemblage des preuves de release.

## 1. Séparer deux verdicts

La release doit toujours afficher deux dimensions :

### `structural_status`
Le projet compile et exécute les validations techniques requises.

### `linguistic_status`
Le périmètre annoncé dispose d'une preuve de revue/gold suffisante.

Un `structural_status=GREEN` avec `linguistic_status=NOT_ESTABLISHED` est un état valide et explicite.

## 2. Gate S — structure

Minimum actuel :
- GF 3.12;
- census 58/58 ou census intentionnellement augmenté et entièrement passé;
- 5/5 façades API attendues;
- 2/2 MorphoDict;
- 0 failure direct/downstream;
- 0 warning structurel bloquant;
- source-lock courant enregistré.

## 3. Gate E — exécution

- 52/52 scénarios baseline ou suite requise intentionnellement augmentée;
- aucun scénario required `SKIPPED`;
- markers et artefacts complets;
- outputs normalisés disponibles.

Ce gate n'affirme rien sur la correction linguistique.

## 4. Gate L — revue linguistique

Pour le périmètre certifié :
- 100 % des CASEs requis ont une revue hash-bound;
- pas de `invalid` non résolu;
- pas de `questionable` non résolu dans le périmètre déclaré certifié;
- les faibles confiances sont exclues du statut gold-certifié;
- variété explicitement `Standard Albanian` sauf campagne distincte.

## 5. Gate G — régression gold

- tous les golds requis existent;
- version de normalisation compatible;
- chaque comparaison requise est `OK`;
- aucun gold modifié pendant le run de release;
- tout changement antérieur de gold possède diff + reviewer + rationale + decision reference.

## 6. Gate C — couverture

La release annonce ses pourcentages avec dénominateurs :
- fonctions core;
- dimensions morphologiques actives;
- phénomènes core;
- lexique échantillonné;
- paradigmes avec frontières testées.

Une release ne peut pas annoncer « certifié » sans préciser le périmètre.

## 7. Gate P — parité

Pour R4 :
- aucun `missing` core inexpliqué;
- N/A justifiés;
- `partial`/`needs_review` core explicitement bornés;
- écarts architecturaux documentés;
- profondeur lexicale jugée sur distribution et usage pratique, pas seulement le nombre d'entrées.

## 8. Gate D — dette

Le paquet de release liste :
- placeholders;
- zones non goldées;
- CASEs exclus;
- variantes non résolues;
- bugs ouverts;
- fonctions partielles;
- preuves insuffisantes.

Une dette connue et visible peut être compatible avec une release de niveau inférieur; une dette cachée ne l'est pas.

## 9. Packet de release

Le packet contient :
- source-lock;
- versions GF/Wordbench;
- résultats 58/58 et 52/52 ou leurs nouveaux dénominateurs;
- verdict counts;
- confidence counts;
- gold regression;
- coverage summary;
- parity summary;
- bugs bloquants/non bloquants;
- debt register;
- changement depuis la release précédente.
