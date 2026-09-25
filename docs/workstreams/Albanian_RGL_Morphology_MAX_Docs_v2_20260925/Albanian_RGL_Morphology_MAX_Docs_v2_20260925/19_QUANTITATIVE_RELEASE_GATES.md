# Quantitative release gates — Morphologie MAX

## 1. Principle

Les mots “large”, “important”, “réduit” ou “mature” n'autorisent aucune promotion. Les gates ci-dessous sont mesurables.

## 2. G0 — Source integrity

- core hashes connus pour 4/4 fichiers ;
- tag/run vert du dépôt entier relié à un source-lock avant certification finale ;
- aucun fichier généré modifié à la main.

## 3. G1 — Inventory closure

- 100% des 734 classes N/A/V présentes dans l'inventaire ;
- 100% des références actives aux IDs numériques détectées ;
- **0 référence non-waivée à `mkN###/mkA###/mkV###` hors `MorphoSqi`/`ParadigmsSqi`** à l'API stable (baseline actuelle : 3 mentions) ;
- 100% des signatures publiques `mkN/mkA/mkV` documentées.

## 4. G2 — Family analysis

Pour chaque classe active : statut obligatoire parmi

`PRODUCTIVE_FAMILY / RESTRICTED_FAMILY / LEXICALIZED / IRREGULAR / DUPLICATE / OBSOLETE / UNRESOLVED`.

Final : **0 `UNRESOLVED` parmi les classes utilisées par des lexèmes reviewables/certifiés**. Les classes inutilisées peuvent rester `UNRESOLVED` uniquement avec dette enregistrée.

## 5. G3 — Principal parts

Pour chaque famille certifiée :

- 100% des principal parts documentées ;
- 0 principal part ignorée silencieusement ;
- ≥3 lexèmes revus par famille productive quand le corpus le permet ;
- ≥1 negative test par smart constructor/famille.

## 6. G4 — Table certification

- N : 100% des cellules actives `Species × Case × Number` par famille certifiée ;
- A : 100% `Case × Gender × Number` + tests syntaxiques de nyje ;
- V : 100% des séries stockées par famille certifiée ;
- chaque irrégulier final : full-table test + au moins 1 test syntaxique non trivial.

## 7. G5 — Reviewable corpus

Baseline mainteneur : **569 CASEs reviewables**.

Final morphology gate :

- 569/569 classés (`CERTIFIED_PARADIGM`, `JUSTIFIED_IRREGULAR`, `JUSTIFIED_INVARIANT/INDECLINABLE`, ou `DEFERRED_WITH_EVIDENCE`) ;
- **0 compile-safe placeholder présenté comme certifié** ;
- pour les CASEs ordinaires inflecting déclarés reviewables : objectif final **0 placeholder non-waivé** ;
- chaque `DEFERRED` porte une raison et ne compte pas comme certification linguistique.

## 8. G6 — Placeholder trend

Baseline textuelle active : `invariantN`=4233, `invariantA`=101, `invariantV`=2173 mentions.

Ces counts sont des indicateurs de tendance. Une livraison ne peut pas revendiquer une amélioration morphologique si elle augmente ces compteurs sans waiver ou déplace simplement le placeholder ailleurs.

## 9. G7 — API maturity

- `mkN`, `mkA`, `mkV` : simple + principal-parts + specialized + full escape hatch ;
- 100% des overloads publics ont au moins un test positif et un négatif lorsque smart ;
- 0 API anglaise pertinente laissée sans statut dans `16_ENGLISH_PARITY_MATRIX.md`.

## 10. G8 — Global regression

- GF 3.12 ;
- 58/58 ou census supérieur intentionnel documenté ;
- 52/52 scénarios existants ;
- 0 régression de gold accepté sans décision linguistique explicite ;
- 0 lock warning bloquant ;
- performance comparée à baseline pour les refactors majeurs.

## 11. Definition of MAX complete

`MAX COMPLETE` exige G0–G8. Une étape peut être `STRUCTURALLY GREEN` ou `FAMILY CERTIFIED` sans être `MAX COMPLETE`.
