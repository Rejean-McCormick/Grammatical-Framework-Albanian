---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 16 — Inventaire linguistique minimum à certifier

Ce document est un inventaire de **couverture**, pas un remplacement des sources.

## A. Cas

- Nom
- Acc
- Dat
- Gen (fonction syntaxique distincte)
- Abl
- mapping Gen/Dat morphologique explicitement documenté.

## B. Pronoms forts

Tables obligatoires : 1sg/1pl/2sg/2pl × Nom/Acc/Gen-Dat/Abl; distal 3e personne; proximal.

## C. Weak pronouns

- Acc : `më, të, e, na, ju, i` selon personne/nombre.
- Dat : `më, të, i, na, ju, u`.
- Refl : `u`.
- rôle stocké séparément de surface.

## D. Doubles clitiques

Les 18 cellules de `03_CLITIC_SYSTEM_SPEC.md` sont exhaustives pour la matrice Dat × `{e,i,u}` fournie par la source et doivent être testées individuellement.

## E. `të` + cluster

Au minimum : `ta`, `t'i`, `t'jua`, `të m'i`, `të na`; puis couverture systématique de tous les clusters produits par les tests C5.

## F. Relatif `cili`

16 cellules genre × nombre × quatre lignes morphologiques (Nom/Acc/Gen-Dat/Abl), plus règle génitive du nyje.

## G. Interrogatifs

Source actuellement certifiée explicitement : `kush` sujet, `kë` après `me`, marker polar `a`. Les autres cellules du code courant restent `UNASSESSED` jusqu'à source précise; elles ne sont pas supprimées pour autant.

## H. Prépositions

Noyau source-attesté :

- Acc : `në me pa për mbi nën`;
- Nom : `nga tek`;
- Abl : `prej brenda gjatë para midis sipas`.

Inventaire RGL Structural à classifier : `above`, `after`, `before`, `behind`, `between`, `by8agent`, `by8means`, `during`, `for`, `from`, `in8front`, `in`, `on`, `part`, `possess`, `through`, `to`, `under`, `with`, `without`, `except`.

Chaque entrée reçoit : lexicalisation Albanian, cas, source, sémantique RGL, statut de revue, tests.

## I. Contextes de placement

- indicatif simple;
- indicatif composé;
- négatif indicatif;
- subjonctif +/-;
- futur/conditionnel;
- futur/perfect relevant;
- impératif +/-;
- progressif;
- non-finis utilisés par RGL;
- interface non-actif;
- questions/relatives/slash.

## J. Critère d'exhaustivité

« Complet » signifie que chaque ligne de cet inventaire a un statut final `CERTIFIED` ou un `NOT_APPLICABLE` justifié. Une cellule simplement héritée du code n'est pas certifiée.
