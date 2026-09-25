---
document_role: reviewer_policy
status: normative
version: 1.0
date: 2026-09-25
---

# Politique reviewer et certification humaine

## 1. Principe

Wordbench documente explicitement la revue ChatGPT comme **AI-reviewed linguistic validation**, pas comme certification humaine indépendante.

Conversation 10 conserve cette distinction.

## 2. Types de reviewer

### `AI`
Reviewer/model identifié; sortie conforme au contrat hash-bound.

### `human`
Personne identifiée ou rôle qualifié enregistré; décision attribuable et auditable.

### `dual`
Même périmètre satisfait une revue AI et une revue humaine, avec conflits résolus.

## 3. Labels autorisés

- `AI_reviewed_in_scope`
- `human_reviewed_in_scope`
- `dual_reviewed_in_scope`

Ne pas écrire simplement « linguistically certified » sans qualifier.

## 4. Quand la revue humaine est requise pour un label humain

Pour déclarer `human_reviewed_in_scope`, tous les CASEs requis du périmètre doivent satisfaire la policy humaine applicable ou appartenir à un batch explicitement accepté par cette policy.

Pour `human-certified release`, au minimum les strates critiques suivantes doivent avoir une revue humaine explicite :

- paradigmes canoniques qui définissent des tables;
- cas Standard vs Tosk/Geg litigieux;
- `valid_variant` à impact gold core;
- corrections de gold core;
- décisions de N/A linguistique;
- phénomènes où les sources sont disputées;
- échantillon stratifié des lexiques certifiés;
- toute exception utilisée pour fermer un blocker R4.

## 5. Batch review

Une revue humaine par batch est permise seulement si :
- famille homogène définie;
- règles d'acceptation explicites;
- sorties inspectables;
- échantillonnage/coverage enregistré;
- aucun conflit masqué.

## 6. Conflit AI/humain

En cas de désaccord :
- CASE → `questionable`;
- gold promotion suspendue;
- preuve additionnelle recherchée;
- décision documentée.

La revue humaine n'efface pas automatiquement l'évidence AI; elle la supersède seulement par décision enregistrée.

## 7. Reviewer provenance

Enregistrer :
- nom/identifiant;
- rôle;
- expertise ou contexte pertinent quand disponible;
- date;
- périmètre;
- méthode;
- conflits d'intérêt éventuels si pertinents;
- evidence/decision IDs.
