---
document_role: owner_routing_registry
status: incomplete_until_conversations_1_9_are_declared
version: 1.0
date: 2026-09-25
---

# Registre canonique de routage vers Conversations 1–9

## 1. Règle

Ce fichier est l'unique endroit où le mapping Conversation → domaine est maintenu.

Les responsabilités exactes 1–9 n'ont pas été fournies dans cette conversation. **Aucun numéro n'est donc inventé.**

## 2. Registre à compléter

| Conversation | Domaine propriétaire | Modules/fichiers | Types de bugs | Statut |
|---:|---|---|---|---|
| 1 | TBD | TBD | TBD | unassigned |
| 2 | TBD | TBD | TBD | unassigned |
| 3 | TBD | TBD | TBD | unassigned |
| 4 | TBD | TBD | TBD | unassigned |
| 5 | TBD | TBD | TBD | unassigned |
| 6 | TBD | TBD | TBD | unassigned |
| 7 | TBD | TBD | TBD | unassigned |
| 8 | TBD | TBD | TBD | unassigned |
| 9 | TBD | TBD | TBD | unassigned |
| 10 | certification / gold / parity | validation artifacts, dashboard, matrices | revue, preuve, gold, métriques | assigned |

## 3. Routage temporaire par domaine

En attendant :
- morphology_nominal
- morphology_adjectival
- morphology_verbal
- paradigm_api
- clitic_system
- voice_nonactive
- tam_auxiliary
- valency_complements
- nominal_syntax
- clause_syntax
- question_relative
- structural_closed_class
- extend_extra
- dict_lexical_typing
- morphodict_lemgram
- normalization_or_test_harness
- source_or_reference_uncertainty

Le bug porte `owner_conversation: unresolved` et `owner_domain: <value>`.

## 4. Modification

Quand le mapping 1–9 est fourni :
- remplir ce fichier;
- ne pas recopier le mapping ailleurs;
- migrer les bugs `unresolved` mécaniquement;
- conserver l'ancien owner dans l'historique.
