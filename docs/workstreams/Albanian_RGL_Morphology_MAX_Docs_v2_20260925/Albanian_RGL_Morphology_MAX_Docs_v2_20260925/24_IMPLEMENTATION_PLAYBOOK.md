# Implementation playbook

## 1. Unit of work

Une unité de travail est une **famille morphologique ou une décision de représentation**, jamais “modifier MorphoSqi en général”.

## 2. Family workflow

1. sélectionner famille/classe IDs ;
2. extraire tables CURRENT ;
3. collecter ≥3 lexèmes si possible ;
4. localiser preuve albanaise ;
5. proposer principal parts ;
6. identifier règle morphophonologique ou irrégularité ;
7. écrire tests CURRENT/gold candidate ;
8. implémenter nouveau family constructor/guard ;
9. démontrer équivalence sur tables déjà certifiées ;
10. ajouter negative tests ;
11. migrer callers pilotes ;
12. full Wordbench ;
13. revue linguistique ;
14. accepter décision ;
15. régénérer inventaires.

## 3. Representation workflow

Pour `Case/Gender/Noun/Adj/Verb/Agr` :

1. requirement externe ;
2. producer/consumer map ;
3. preuve linguistique ;
4. alternatives minimales ;
5. prototype isolé ;
6. migration atomique ;
7. tests exhaustive branches ;
8. full regression ;
9. décision ACCEPTED seulement après preuve.

## 4. Stop conditions

Arrêter et documenter `OPEN` si : preuve dialectale seulement, principal parts non discriminantes, consumer inconnu, changement requiert syntaxe non coordonnée, output plausible mais non sourcé, ou GF compile mais gold linguistic absent.

## 5. Delivery packet

Chaque livraison contient : source-lock, decision IDs, files changed, family IDs, API diff, table diffs, tests positifs/négatifs, GF result, Wordbench result, gold impact, placeholders removed/remaining, risks, rollback.
