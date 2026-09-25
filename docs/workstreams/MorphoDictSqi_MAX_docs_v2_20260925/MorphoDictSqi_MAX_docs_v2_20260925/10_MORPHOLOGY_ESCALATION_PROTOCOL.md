# Protocole d’escalade vers la morphologie fondamentale

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Quand escalader

Vers `MorphoSqi` / `ParadigmsSqi` si plusieurs lexèmes partagent une flexion non exprimable, un smart dispatch est systématiquement faux, une distinction nécessaire manque du type, des records ad hoc se répètent, des principal parts nécessaires ne sont pas exposés ou une classe fréquente reste placeholder faute d'API.

## 2. Ne pas escalader pour

Faute d'entrée unique, irrégularité isolée déjà exprimable, problème de provenance, multiword lexical, catégorie sémantique sans conséquence morphologique.

## 3. Paquet minimal

`missing_class_id, category, examples, observed_forms, feature_mapping, current_result, insufficiency, proposed_api(optional), principal_parts_required, negative_cases, estimated_unblocked, evidence_ids`.

## 4. Cycle de retour

Une nouvelle classe revient d'abord P0/P1 dans le registre. Elle doit compiler, passer contrastes et cas négatifs, matcher les exemples, obtenir un domaine explicite, atteindre P3, puis être appliquée à un lot pilote avant expansion.

## 5. Smart paradigm ladder

Préférer une échelle : citation → citation + trait/classe → formes caractéristiques → principal parts → irrégulier/table explicite. Une classe non inférable à partir du lemme ne doit pas être forcée dans `mkN/mkA/mkV`.

## 6. Error guards

Hors domaine, un smart constructor doit échouer explicitement ou orienter vers une API plus précise. Un fallback plausible détruit la capacité du MorphoDict à détecter les classes manquantes.
