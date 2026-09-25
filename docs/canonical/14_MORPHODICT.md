# MorphoDictSqi

## Contrat

Un lemgramme = une identité morphologique / table flexionnelle. Pas de sens, pas de valence si elle ne change pas la morphologie, pas de duplication sémantique, pas de `variants` pour cacher une incertitude.

## Baseline

592 lemgrammes au point de départ déclaré.

## Cible finale

- grande couverture Standard Albanian ;
- `variants_count = 0` ;
- `unprovenanced_active = 0` ;
- `unwaived_multiword = 0` ;
- `placeholder_counted_as_C6 = 0` ;
- conflits de table non résolus parmi C6 = 0 ;
- stale C6 = 0 ;
- fallback smart non borné = 0 ;
- deux rebuilds propres donnent les mêmes artifacts canoniques ;
- 100% du `source_universe` est terminalement classé : C6, blocked ou excluded-with-reason.

## Catégories

Le contrat courant expose 18 catégories. Elles peuvent rester pour compatibilité ; la **couverture morphologique** doit distinguer les catégories réellement inflectionnelles des tables invariantes. Une catégorie invariante n'est pas un placeholder si l'invariance est linguistiquement justifiée.

## Escalade

Si une entrée standard ordinaire exige une table manuelle parce qu'une classe productive manque, escalader à C1 `MorphoSqi/ParadigmsSqi`; ne pas multiplier les records bas niveau dans MorphoDict.

## Échelle

Les grands MorphoDict fournis montrent que des dizaines de milliers de lemgrammes sont plausibles. Aucun quota ne remplace le contrat de preuve.
