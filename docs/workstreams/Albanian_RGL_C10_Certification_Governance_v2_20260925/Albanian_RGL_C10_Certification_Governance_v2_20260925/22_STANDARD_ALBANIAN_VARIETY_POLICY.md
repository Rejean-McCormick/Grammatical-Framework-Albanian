---
document_role: target_variety_policy
status: normative
version: 1.0
date: 2026-09-25
target_variety: Standard Albanian
---

# Politique de variété — Standard Albanian

## 1. Cible

La cible par défaut des golds de la RGL `Sqi` est :

`Standard Albanian`

Chaque campagne doit répéter cette valeur dans son metadata.

## 2. Standard ≠ Tosk pur

La référence générale fournie indique :
- division traditionnelle Geg / Tosk;
- Standard Albanian principalement basé sur Tosk;
- présence également de certains traits Geg dans le standard.

Conséquence :
une forme « Tosk » n'est pas automatiquement gold Standard, et une forme d'origine Geg n'est pas automatiquement non standard.

## 3. Ressources dialectales fournies

Le corpus contient explicitement :
- leçons Tosk;
- leçons Geg;
- dictionnaire/glossaire Tosk;
- glossaire Geg.

Ces labels doivent être conservés dans les evidence records.

## 4. Hiérarchie pratique pour un gold Standard

Préférence :
1. source explicitement Standard Albanian;
2. source générale moderne décrivant le Standard;
3. concordance de sources compatibles + code déjà revu;
4. preuve Tosk/Geg seulement si son statut Standard est établi séparément.

Une seule attestation dialectale ne suffit pas à normaliser une forme.

## 5. Exemple de contraste sensible

La référence fournie décrit :
- futur Tosk avec `do` + présent subjonctif;
- futur Geg avec forme de « have » + infinitif;
- infinitif maintenu en Geg, perdu en Tosk;
- Standard principalement basé sur Tosk.

Une campagne Standard doit donc vérifier la réalisation Standard elle-même plutôt que mélanger les deux futurs.

## 6. Variantes

`valid_variant` exige :
- variété Standard établie;
- contexte/registre décrit;
- preuve;
- pas seulement « attesté quelque part en Albanian ».

## 7. Orthographe et phonologie

La certification gold porte sur la **forme orthographique produite par GF**, sauf campagne phonologique explicite.

Les différences de prononciation dialectale ne doivent pas provoquer de changement de gold orthographique sans preuve pertinente.

## 8. Emprunts, doublets et registre

Pour les entrées lexicales :
- distinguer forme standard, variante, dialectalisme, archaïsme, emprunt;
- ne pas rejeter un emprunt uniquement pour son origine;
- ne pas promouvoir une forme rare comme unique gold si plusieurs variantes standard existent.

## 9. Campagnes dialectales futures

Une campagne Tosk ou Geg doit avoir :
- `language_variety` distinct;
- CASE IDs ou campaign IDs distincts;
- gold namespace distinct;
- dashboard distinct.

Aucun gold dialectal n'est fusionné dans Standard sans décision.
