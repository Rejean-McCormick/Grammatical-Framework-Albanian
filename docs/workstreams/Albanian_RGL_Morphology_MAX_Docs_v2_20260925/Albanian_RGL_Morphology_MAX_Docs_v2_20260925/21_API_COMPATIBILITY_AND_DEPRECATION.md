# API compatibility and deprecation policy

## 1. Default rule

La baseline verte est conservée. Une meilleure API ne justifie pas de casser immédiatement les appels existants.

## 2. Lifecycle

`EXPERIMENTAL → SUPPORTED → DEPRECATED → REMOVED`

Un symbole public ne passe à `DEPRECATED` qu'avec remplaçant documenté, migration mécanique possible et tests de compatibilité.

## 3. Smart constructors

`regN/reg2N/regA/reg2A/regV/reg2V` peuvent changer **leur validation** seulement si :

- le domaine accepté est documenté ;
- les anciennes entrées certifiées continuent de produire les mêmes tables ;
- une ancienne entrée hors domaine devient une erreur uniquement avec inventaire des callers et plan de migration ;
- aucun fallback ne jette une principal part.

## 4. Record migrations

Un changement de `Noun`, `Adj`, `Verb`, `Agr`, `Case`, `Gender` est breaking interne même si GF masque une partie des détails. Il exige :

1. producer/consumer map ;
2. adapters temporaires si possible ;
3. migration de tous les `lin`/records ;
4. tests de tables avant/après ;
5. full Wordbench ;
6. retrait de l'adapter dans un patch séparé si utile.

## 5. Numbered classes

Les `mkN###/mkA###/mkV###` sont **INTERNAL-COMPAT**. Les lexiques publics doivent migrer vers des constructeurs nommés/principal-parts. Aucun nouvel appel direct hors `MorphoSqi`/`ParadigmsSqi`.

## 6. Deprecation ledger

Chaque deprecation doit apparaître dans `23_DECISION_LEDGER.md` avec : ancien symbole, nouveau symbole, callers restants, date de retrait/gate, tests.
