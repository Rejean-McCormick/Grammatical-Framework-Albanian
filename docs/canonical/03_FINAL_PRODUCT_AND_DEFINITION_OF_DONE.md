# Produit final et définition globale de « terminé »

## Produit final

Une Albanian RGL mature contient :

- une morphologie productive N/A/V avec principal parts et irréguliers sourcés ;
- un système nominal complet (cas grammatical, syncrétisme morphologique, définitude, genre, accord, nyje, pronoms, numéraux, noms propres) ;
- un système verbal compositional (TAM, auxiliaires, non-actif, voix, polarité, clitiques, non-fini) ;
- une syntaxe de clause complète (déclaratives, questions, relatives, subordination, ordre canonique et variantes sourcées) ;
- valence, compléments, copule, prédication secondaire, coordination, Construction/Idiom ;
- Structural/Extend/Extra et façades publiques closes par rapport au common RGL ;
- `LexiconSqi` canonique et `DictSqi` de grande couverture ;
- `MorphoDictSqi` de grande couverture, un lemgramme par table ;
- documentation utilisateur et mainteneur ;
- validation structurale, golds, matrices de couverture/parité et release evidence packet.

## Definition of Done globale

Le projet atteint la cible de maturité comparable à English lorsque :

1. le census requis est entièrement vert sur GF 3.12 ;
2. toute la suite scénario requise est verte ;
3. aucun common-RGL row core n'est `missing` ou `needs_review` dans le périmètre annoncé ;
4. chaque neutralisation est explicitement justifiée ;
5. les familles morphologiques core ont tables complètes, negative tests et golds ;
6. les 569 CASEs initiaux sont tous classifiés, puis les campagnes G2/G3 apportent couverture de stress et cross-product ;
7. les placeholders restants ne sont pas comptés dans la couverture certifiée ;
8. le final `DictSqi` certifié ne contient plus de placeholder non analysé dans son périmètre ;
9. `MorphoDictSqi` a `variants=0`, provenance complète, table signatures, reproductibilité et 100% de son univers de sources terminalement classé ;
10. les sorties critiques sont `gold_protected_in_scope` ;
11. la matrice English/common-RGL est complète et toute différence est `implemented`, `equivalent` ou explicitement justifiée ;
12. le packet de release donne source-lock, runs, reviewer level, dette, limitations et rollback.

La cible de gouvernance la plus forte est un **`R4_candidate_dual_reviewed`** si une revue humaine indépendante est effectivement disponible. Sans cela, employer le suffixe reviewer réellement atteint.
