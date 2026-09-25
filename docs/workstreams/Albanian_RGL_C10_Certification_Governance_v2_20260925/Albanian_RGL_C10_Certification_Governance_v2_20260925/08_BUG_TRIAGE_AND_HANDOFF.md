---
document_role: bug_routing_protocol
status: normative
date: 2026-09-25
---

# Triage des bugs et handoff vers les conversations 1–9

## 1. Principe

La Conversation 10 découvre et mesure les défauts. Elle ne les masque pas par un placeholder, une réécriture de gold ou un hack de compilation.

Tout `invalid` et tout `questionable` systémique doit devenir :
- bug;
- investigation;
- ou décision documentée de variation/portée.

## 2. Reproduction minimale obligatoire

Chaque bug contient :

```text
BUG ID:
SOURCE LOCK:
GF VERSION:
WORDBENCH RUN:
LANGUAGE VARIETY:
SCENARIO / CASE:
GF EXPRESSION OR MINIMAL INPUT:
OBSERVED OUTPUT:
EXPECTED OUTPUT / CONSTRAINT:
VERDICT:
CONFIDENCE:
PHENOMENON:
EVIDENCE:
LIKELY OWNER:
GOLD IMPACT:
REGRESSION TEST REQUIRED:
```

Si la sortie attendue exacte n'est pas établie, écrire une **contrainte attendue** et conserver `questionable` plutôt qu'inventer une forme.

## 3. Classification de cause

- `morphology_nominal`
- `morphology_adjectival`
- `morphology_verbal`
- `paradigm_api`
- `clitic_system`
- `voice_nonactive`
- `tam_auxiliary`
- `valency_complements`
- `nominal_syntax`
- `clause_syntax`
- `question_relative`
- `structural_closed_class`
- `extend_extra`
- `dict_lexical_typing`
- `morphodict_lemgram`
- `normalization_or_test_harness`
- `source_or_reference_uncertainty`
- `other_explicit`

## 4. Routage

Le champ `owner_conversation` est obligatoire pour un bug envoyé.

Le mapping exact Conversation 1–9 doit rester dans **un seul registre partagé**. Il ne doit pas être recopié dans plusieurs documents, afin d'éviter le drift lorsque les responsabilités changent.

Tant que ce mapping n'est pas fourni comme table explicite, la Conversation 10 route par **domaine** et marque `owner_conversation: unresolved` plutôt que d'inventer un numéro.

## 5. Retour attendu du propriétaire

Le propriétaire retourne :
- cause racine;
- fichiers modifiés;
- justification linguistique;
- tests ajoutés;
- effet sur CASE(s);
- nouveau run/source-lock;
- risques;
- éléments non certifiés.

Conversation 10 revalide ensuite la sortie. Le simple message « fixed » ne change aucun verdict.

## 6. Fermeture

Un bug linguistique est fermé seulement lorsque :
- le correctif est intégré;
- la reproduction minimale passe techniquement;
- le CASE corrigé est revu;
- la revue est liée au nouveau hash;
- les régressions associées passent;
- un gold est promu uniquement si les règles de gold le permettent.
