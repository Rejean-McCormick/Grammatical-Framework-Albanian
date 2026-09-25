# Manifeste du contenu final — Morphologie fondamentale MAX

## 1. Livrable final de Conversation 1

La sortie finale n'est pas un seul fichier. Elle est un sous-système cohérent composé de code, API, preuves et tests.

## 2. `ResSqi.gf`

Doit finalement contenir :

- l'inventaire minimal et suffisant des paramètres morphologiques albanais ;
- les records `Noun`, `Adj`, `Verb` et auxiliaires nécessaires ;
- les helpers d'accord et conversions de dimensions ;
- aucune dimension spéculative sans consommateur ;
- aucune règle lexicale spécifique à quelques mots si elle appartient à `MorphoSqi`/`IrregSqi`.

Doit documenter explicitement :

- sens de chaque valeur de `Case` ;
- sens de chaque valeur de `Gender` ;
- statut du genre au pluriel ;
- distinction forme stockée / distinction virtuelle ;
- sémantique exacte de chaque série verbale.

## 3. `MorphoSqi.gf`

Doit finalement fournir :

- familles nominales productives documentées ;
- familles adjectivales productives documentées ;
- familles verbales productives documentées ;
- morphophonologie centralisée lorsque productive ;
- dérivation déterministe depuis principal parts ;
- erreurs explicites lorsque les données ne déterminent pas une classe ;
- aucune nécessité pour l'utilisateur public de connaître les IDs `mkN###/mkA###/mkV###`.

Les 563/36/135 classes actuelles peuvent être conservées, générées, regroupées ou réduites, mais aucune transformation ne doit perdre une table certifiée.

## 4. `ParadigmsSqi.gf`

Doit finalement exposer :

- `mkN`, `mkA`, `mkV` ergonomiques pour les classes dominantes sûres ;
- overloads à principal parts pour les classes ambiguës ;
- constructeurs spécialisés pour grandes familles ;
- escape hatches complets (`NForms`/équivalents et tables verbales exactes) ;
- wrappers de valence/gouvernement qui ne réparent pas la morphologie ;
- guards et messages d'erreur compréhensibles ;
- compatibilité documentée avec les appels RGL existants.

## 5. `IrregSqi.gf` / `IrregSqiAbs.gf`

Doivent finalement contenir :

- seulement des irréguliers justifiés ;
- principal parts/tables exactes ;
- provenance ;
- tests complets ;
- aucun lexème déplacé ici uniquement parce que le smart paradigm est incomplet.

## 6. `DocumentationSqi.gf`

Conversation 1 doit fournir ou préparer les données nécessaires pour que la documentation RGL puisse afficher les paradigmes importants de façon lisible et cohérente avec l'API publique.

## 7. Tests morphologiques dédiés

La version finale doit inclure :

- inspection de tables nominales ;
- inspection de tables adjectivales ;
- inspection de tables verbales ;
- tests de smart paradigms ;
- tests négatifs ;
- cas limites morphophonologiques ;
- tests d'irréguliers ;
- tests de sélection via syntaxe ;
- golds revus et sourcés.

## 8. Documentation mainteneur

Doit permettre de répondre sans lire `MorphoSqi` ligne par ligne :

- comment ajouter un nom régulier ?
- quand fournir le pluriel ?
- comment fournir un genre non déductible ?
- comment représenter un paradigme nominal atypique ?
- comment ajouter un adjectif ?
- quelles principal parts verbales fournir ?
- quand utiliser `IrregSqi` ?
- que signifie un échec de smart constructor ?

## 9. Effet attendu sur `DictSqi`

Conversation 1 ne grossit pas massivement `DictSqi`. Elle doit néanmoins permettre ensuite de remplacer des placeholders par :

```text
lemme + catégorie/valence + constructeur morphologique certifié
```

La catégorie et la valence restent la responsabilité lexicale de `DictSqi`.

## 10. Effet attendu sur `MorphoDictSqi`

`MorphoDictSqi` doit pouvoir référencer un lemgramme par table flexionnelle à l'aide de l'API morphologique, sans :

- sens ;
- subcatégorie sémantique ;
- `variants` comme cache d'incertitude ;
- duplications sémantiques ;
- records bas niveau lorsque `ParadigmsSqi` peut exprimer le paradigme.

## 11. Gates de sortie

Le manifeste final n'est satisfait que si :

- les décisions centrales sont `ACCEPTED` ou explicitement `DEFERRED` avec justification ;
- les familles majeures ont des golds de tables ;
- les smart constructors ont des tests négatifs ;
- les placeholders peuvent être réduits sur un échantillon réel sans hacks ;
- GF 3.12 est vert ;
- Wordbench est au moins 58/58 + 52/52 ;
- les golds existants ne régressent pas sans correction linguistique documentée ;
- la documentation correspond exactement aux signatures livrées.

## 12. Équivalence avec English — définition opérationnelle

Conversation 1 atteint l'équivalence de maturité morphologique avec English lorsque l'Albanais possède une **surface publique aussi utilisable et robuste pour ses propres phénomènes**, avec :

- constructeurs simples ;
- principal parts ;
- familles spécialisées ;
- irréguliers propres ;
- escape hatches complets ;
- documentation ;
- tests ;
- intégration Dict/MorphoDict.

L'équivalence n'exige ni les mêmes paramètres, ni les mêmes paradigmes, ni les mêmes nombres de classes.

## 13. Final verification v2

Le manifeste est vérifié par les inventaires `14–18`, les gates `19`, les contrats `20–22`, le ledger `23` et le playbook/checklist `24–25`.
