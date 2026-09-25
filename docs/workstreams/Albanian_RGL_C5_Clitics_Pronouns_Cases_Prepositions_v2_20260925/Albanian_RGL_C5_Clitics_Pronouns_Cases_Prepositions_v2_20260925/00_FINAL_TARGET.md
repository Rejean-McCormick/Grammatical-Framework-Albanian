---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 00 — Cible finale

## Définition de maturité

**C5-REQ-001 — NORMATIVE_TARGET** — La version finale C5 est un sous-système compositionnel dans lequel les faits grammaticaux suivants restent structurés jusqu'à leur dernier consommateur : rôle casuel, forme forte/faible, rôle Dat/Acc/Refl, gouvernement prépositionnel, environnement `të/do/po/mos/nuk`, et position du cluster.

« Comparable à English RGL » signifie ici :

- couverture complète des constructeurs RGL pertinents;
- API publique stable et non provisoire;
- absence de chemins cassés/placeholder dans le core certifié;
- tests et documentation à granularité constructeur/phénomène;
- régression détectable et source-lockée.

Cela ne signifie jamais copier la morphosyntaxe anglaise.

## Propriétés obligatoires de la cible

- **C5-REQ-002** — formes fortes et capacités faibles des pronoms sont conservées simultanément jusqu'à la saturation appropriée.
- **C5-REQ-003** — Dat, Acc et Refl restent des rôles distincts dans un `CliticCluster` avant flattening.
- **C5-REQ-004** — ordre/fusion du cluster dépend de ses rôles, jamais de l'ordre d'appel des constructeurs abstraits.
- **C5-REQ-005** — gouvernement des `Prep/Compl` est explicite et testé; aucun cas n'est deviné depuis la chaîne.
- **C5-REQ-006** — le génitif syntaxique peut être distingué du datif même lorsque les cellules morphologiques sont syncrétiques.
- **C5-REQ-007** — `të`, `do`, `po`, négation, auxiliaires, impératif et formes composées sont combinés dans une frontière de réalisation centrale.
- **C5-REQ-008** — `u` argument-réflexif et `u` de voix/non-actif ne deviennent jamais la même information interne par simple identité de surface.
- **C5-REQ-009** — questions, relatives, slash et saturation ordinaire partagent les mêmes services de cas/clitiques.
- **C5-REQ-010** — pronoms personnels, démonstratifs, interrogatifs et relatif `cili` ont des tables révisées et testées.
- **C5-REQ-011** — toutes les prépositions Structural pertinentes ont une politique de gouvernement explicitement enregistrée.
- **C5-REQ-012** — aucun gold C5 n'est promu sans source/revue linguistique identifiable.

## Surface fonctionnelle finale

La cible doit couvrir : pronoms forts; clitiques Acc/Dat; doubling; doubles clitiques et fusions; réflexif; démonstratifs proximal/distal; interrogatifs casuels; relatif `që` et `cili`; Prep/Compl et cas; génitif/nyje; questions/relatives/slash; présent/past/futur/conditionnel; subjonctif; antériorité; impératif positif/négatif; progressif `po`; formes non finies pertinentes; interaction avec non-actif/voix via interface inter-workstream.

## Critère de sortie

Le critère normatif détaillé est `17_MACHINE_CHECKABLE_DEFINITION_OF_DONE.md`. Aucune phrase du type « semble complet », « compile donc correct » ou « similaire à Romanian/Greek » ne peut remplacer ces gates.
