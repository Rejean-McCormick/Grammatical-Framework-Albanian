---
document_role: gold_policy
status: normative
date: 2026-09-25
---

# Politique de promotion et correction des golds

## 1. Principe

Un gold est une attente de régression **revue**, pas une capture automatique de la sortie courante.

Le contrat Wordbench compare exactement les octets normalisés :

`current normalized bytes == reviewed gold bytes`

Le passage d'un gold prouve la stabilité par rapport à cette attente. Il ne prouve ni correction universelle ni couverture complète.

## 2. Éligibilité minimale

Un scénario peut être candidat à un gold seulement si :

- sa revue correspond au même `request_id`, source-lock et `output_sha256`;
- verdict `valid`, ou `valid_variant` si la policy l'autorise;
- confiance au moins au seuil configuré (par défaut `medium`);
- sortie complète, déterministe et correctement normalisée;
- compatibilité GF/RGL connue;
- le diff candidat a été explicitement revu;
- reviewer, rationale et decision reference sont enregistrés.

`questionable`, `invalid` et `low` ne sont jamais promus silencieusement.

## 3. `valid_variant`

Un gold portant une sortie `valid_variant` signifie :

> cette sortie déterministe particulière est acceptée dans le contexte déclaré.

Il ne signifie pas :
> toutes les autres variantes sont fausses.

La justification doit indiquer pourquoi la variante est acceptable et son marquage éventuel.

## 4. Interdictions

- `validate` ne crée pas de gold.
- `validate` ne réécrit pas de gold.
- un mismatch n'est jamais une invitation automatique à « accepter le nouveau résultat »;
- une grammaire ne doit jamais être tordue pour conserver un gold linguistiquement erroné;
- un gold obsolète doit être corrigé avec preuve, diff et décision explicite.

## 5. Changement de normalisation

Une modification de version/profil de normalisation invalide la comparabilité directe jusqu'à revue sous la nouvelle version.

Le dashboard doit séparer :
- changement linguistique;
- changement de normalisation;
- changement de formatting/artefact;
- changement de source.

## 6. Promotion batch

Pour les campagnes massives, une promotion batch est acceptable seulement si chaque CASE du batch :
- a son propre hash et verdict;
- satisfait l'éligibilité;
- appartient à une famille homogène explicitement définie;
- reste inspectable individuellement.

Une règle générale ne remplace pas l'évidence individuelle.

## 7. Correction d'un gold existant

Toute correction enregistre :
- ancien hash gold;
- nouveau hash;
- diff;
- cause (`grammar_fix`, `lexical_fix`, `normalization_change`, `previous_gold_wrong`, etc.);
- preuve linguistique;
- bug/decision reference;
- reviewer;
- source-lock de la validation post-correction.

## 8. Gate

Aucun corpus gold n'est considéré stable tant que :
- tous les golds requis ne sont pas présents;
- tous les comparateurs requis ne sont pas `OK`;
- aucune mise à jour de gold n'a eu lieu pendant le run de release.
