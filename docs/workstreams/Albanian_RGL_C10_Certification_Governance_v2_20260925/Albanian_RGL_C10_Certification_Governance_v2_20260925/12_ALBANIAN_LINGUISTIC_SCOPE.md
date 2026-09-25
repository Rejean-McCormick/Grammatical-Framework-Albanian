---
document_role: albanian_linguistic_scope
status: normative_scope
version: 2.0
date: 2026-09-25
target_variety: Standard Albanian
---

# Périmètre linguistique à certifier

## 1. Fonction

Ce document définit les **familles de phénomènes** à couvrir. Les dimensions et cellules exactes du code courant sont dans `17_ALBANIAN_GRAMMATICAL_FEATURE_MODEL.md`; les constructeurs sont dans `18_PARADIGM_AND_MORPHOLOGICAL_CELL_REGISTRY.md`.

Il ne transforme jamais une description linguistique générale en assertion sur une cellule GF sans preuve supplémentaire.

## 2. Morphologie nominale

À couvrir :
- nombre;
- définitude;
- cas;
- genre et accord;
- classes flexionnelles;
- noms propres;
- syncrétismes;
- génitif/possessif comme morphologie + construction;
- exceptions et frontières des smart paradigms.

Point critique : la référence linguistique distingue cinq cas tandis que le type `ResSqi.Case` courant en expose quatre. Cette différence est modélisée comme **question d'équivalence de représentation**, pas comme verdict automatique.

## 3. Adjectifs et article attributif (`nyje`)

À couvrir :
- accord en cas/genre/nombre;
- article de liaison;
- formes articulées vs non articulées;
- interactions avec définitude;
- adjectifs relationnels/complémentés si supportés;
- position et comportement dans AP/CN.

Les homographies de petits mots sont certifiées par fonction et contexte, jamais par chaîne brute.

## 4. Pronoms et clitiques

À couvrir :
- formes casuelles;
- clitiques accusatif/datif;
- personne/nombre/genre pertinents;
- cliticisation simple;
- clusters;
- interaction avec négation, TAM, impératif, subjonctif et constructions;
- pronoms possessifs et autres formes structurales.

## 5. Verbes

À couvrir :
- indicatif;
- subjonctif;
- impératif;
- participes;
- optatif;
- admiratif;
- temps/formes synthétiques et analytiques;
- auxiliaires;
- futur/conditionnel;
- actif/non-actif/passif/réfléchi lorsque représentés;
- irréguliers;
- classes productives;
- frontières des smart paradigms.

La présence d'une table dans `MorphoSqi` n'est pas un gold.

## 6. Syntaxe nominale et gouvernement

À couvrir :
- détermination;
- quantification;
- numéraux;
- génitif/possessif;
- partitif;
- prépositions;
- cas gouverné;
- N2/N3;
- adjectifs complémentés;
- apposition;
- noms propres et lieux.

## 7. Syntaxe verbale et clause

À couvrir :
- V/V2/V3;
- VV/VS/VQ/VA;
- V2V/V2S/V2Q/V2A;
- compléments;
- ordre;
- négation;
- temps/antériorité;
- auxiliaires;
- clitiques;
- contrôle et argument structure lorsque supportés.

## 8. Questions, relatives et subordination

À couvrir :
- interrogatives polaires;
- interrogatives wh;
- relatives;
- subordonnées;
- compléments phrastiques;
- interactions avec cas, clitiques et ordre.

## 9. Coordination, constructions et extensions

À couvrir :
- coordination;
- `ConstructionSqi`;
- `ExtendSqi`;
- `ExtraSqi`;
- phénomènes explicitement supportés par l'abstract RGL courant.

## 10. Variété

La variété de gold par défaut est `Standard Albanian`. La politique détaillée est dans `22_STANDARD_ALBANIAN_VARIETY_POLICY.md`.

## 11. Non-extrapolation

Une zone sans preuve reste `untested`, `questionable`, `partial` ou `needs_review`. Elle n'est jamais complétée par analogie avec English, Bulgarian, Macedonian, Greek, Romanian ou une autre langue modèle.
