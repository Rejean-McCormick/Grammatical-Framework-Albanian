# Registre des classes/paradigmes morphologiques

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Pourquoi un registre

Le nom `mkN/mkA/mkV` ne dit pas quelle branche interne a été choisie. Pour une expansion massive, chaque lemgramme doit référencer une **classe morphologique explicite et versionnée**.

## 2. Maturité P0–P3

- **P0 PROPOSED** — motif suspecté, non utilisé pour C6.
- **P1 IMPLEMENTED** — code existe/compile localement, domaine non encore borné.
- **P2 EVIDENCE_TESTED** — exemples positifs et formes attestées concordent ; limites en cours.
- **P3 PRODUCTION** — domaine positif/négatif documenté, tests de frontière, GF 3.12, golds, revue ; autorisé pour bulk C2/C6.

## 3. Record canonique

```yaml
paradigm_id: PAR-SQI-N-...
category: N
maturity: P0|P1|P2|P3
public_constructor: mkN
internal_route_or_class: ""
implementation_file: ""
implementation_hash: ""
required_inputs: []
domain_positive: []
domain_negative: []
discriminating_features: []
positive_evidence_lemgrams: []
negative_examples: []
gold_ids: []
known_exceptions: []
supersedes: null
```

## 4. Smart paradigms

Une entrée utilisant un smart constructor doit stocker le `paradigm_id` de la branche résolue, pas seulement `mkN`. Si le dispatch ne peut pas être prouvé avant/après introspection, C2 n'est pas atteint.

## 5. Principal parts

Le registre indique les inputs minimaux nécessaires à l'identification sûre de la classe. L'objectif n'est pas de minimiser artificiellement le nombre de formes, mais de rendre la sélection non ambiguë.

## 6. Changement de classe

Toute modification d'implémentation/hash d'une classe P3 invalide les C6 dépendants selon `20`, même si son interface publique ne change pas.

## 7. Promotion P3

Exige : ≥3 exemples lorsque disponibles, formes discriminantes, au moins un cas frontière/négatif, tests GF, evidence matching, aucun fallback hors domaine et decision record pour toute exception structurelle.
