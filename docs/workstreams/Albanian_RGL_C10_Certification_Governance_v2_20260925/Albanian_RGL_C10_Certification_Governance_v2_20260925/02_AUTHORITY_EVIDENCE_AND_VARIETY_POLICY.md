---
document_role: evidence_policy
status: normative
version: 2.0
date: 2026-09-25
---

# Autorités et politique de preuve

## 1. Principe

Il n'existe pas une seule hiérarchie valable pour tous les types de questions.

- Le source GF exact gouverne les signatures, catégories et contrats.
- Le compilateur gouverne les faits de compilation/type pour le source-lock exécuté.
- Les tests gouvernent uniquement le comportement qu'ils ont effectivement exercé.
- Les sources Albanian gouvernent les faits linguistiques.
- Les golds gouvernent une attente de régression déjà revue.
- Les langues modèles ne prouvent jamais un fait Albanian.

Cette séparation suit la politique d'autorité du Compendium fourni.

## 2. Signatures abstraites et ownership

Ordre :

1. abstract `.gf` courant;
2. graphe de modules/héritage courant;
3. diagnostics compilateur;
4. indexes générés liés au même source;
5. documentation.

Ne jamais rappeler une signature de mémoire si le source est disponible.

## 3. Représentation des catégories concrètes

Ordre :

1. `CatSqi.gf` courant;
2. resources Albanian courantes (`ResSqi`, etc.);
3. producteurs/consommateurs de la représentation;
4. décisions/contrats acceptés;
5. résultat compilateur;
6. langues modèles architecturales.

Exemple : le fait que `Case` possède quatre valeurs dans `ResSqi` est un `source_fact`. Il ne prouve pas que l'analyse linguistique Albanian ne distingue que quatre cas.

## 4. Faits linguistiques

Ordre :

1. preuves Albanian acceptées : grammaires, dictionnaires, corpus, validation qualifiée;
2. décisions linguistiques Albanian acceptées;
3. exemples Albanian vérifiés et golds;
4. source Albanian lorsqu'il est déjà linguistiquement revu;
5. comparaison cross-language;
6. inference AI.

**Le compilateur n'apparaît pas dans cette hiérarchie comme preuve linguistique.**

## 5. Réalisation de surface

Ordre :

1. exemples Albanian vérifiés;
2. golds morphologiques/syntaxiques revus;
3. décisions Albanian acceptées;
4. implémentation target courante;
5. modèle compatible;
6. attente linguistique générale.

Une chaîne générée est une preuve du comportement courant, pas de sa correction.

## 6. Architecture

Ordre :

1. besoins des catégories target + consommateurs downstream;
2. décisions d'architecture acceptées;
3. évidence Albanian;
4. implémentation target existante;
5. mesures compilateur/complexité;
6. patterns du Compendium;
7. modèles compatibles;
8. simple proximité généalogique.

## 7. Evidence classes

Utiliser les classes du Compendium :

- `normative`
- `source_fact`
- `compiler_fact`
- `test_fact`
- `linguistic_evidence`
- `accepted_decision`
- `generated_fact`
- `inference`
- `provisional`
- `rejected`
- `stale`

Une inference n'est jamais enregistrée comme `source_fact`.

## 8. Granularité

Chaque evidence record soutient une proposition atomique, par exemple :
- « PossNP réalise le possesseur avec `np.s ! Dat` dans ce source-lock »;
- « cette forme est attestée Standard Albanian dans telle source »;
- « ce CASE produit tel hash »;
- « tel public overload compile ».

Éviter « la grammaire confirme le système nominal » sans locator.

## 9. Variété

La cible par défaut est `Standard Albanian`. La policy détaillée appartient à `22_STANDARD_ALBANIAN_VARIETY_POLICY.md`.

Une attestation Tosk/Geg conserve son label. Elle ne devient pas automatiquement preuve Standard.

## 10. Conflits

Lorsqu'une preuve crédible entre en conflit :
- claim → `disputed` ou CASE → `questionable`;
- aucune promotion gold;
- sources concurrentes enregistrées;
- variété/registre/contexte précisés;
- résolution par nouvelle preuve ou `DECISION`.

## 11. Source-lock

Tout compiler/test/review fact doit être lié au source-lock pertinent. Les règles de staleness sont dans `21_TRACEABILITY_AND_STALENESS_MODEL.md`.
