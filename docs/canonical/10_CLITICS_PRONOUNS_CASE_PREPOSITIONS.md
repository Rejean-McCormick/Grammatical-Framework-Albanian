# Clitiques, pronoms, cas et prépositions

## Architecture cible

`Compl/Prep` transporte un `Case` grammatical 5-valeurs. `CliticCluster` transporte les rôles faibles. La clause/verbal realizer combine contexte TAM/polarité/impératif/voix/progressive et réalise le cluster une seule fois.

## Décisions retenues

- rôles Acc/Dat/Refl restent typés jusqu'au flattening ;
- Gen syntaxique distinct de Dat ;
- représentation choisie globalement : `Case` 5 valeurs + `MorphCase` syncrétique ;
- gouvernement `Prep` explicite et centralisé ;
- `po` n'est pas un clitique pronominal ;
- `u` reflexive argumental / Dat3pl / non-active distincts ;
- IO overt conserve son clitique datif dans les contextes attestés ;
- l'ancien `VP.cl/subjcl` est migration debt, pas architecture finale ;
- nouveau cluster -> shim ancien permis temporairement, inverse interdit.

## Questions ouvertes

- canonical DO doubling (variation de registre) ;
- politique proclise/enclise à l'impératif positif ;
- détail `from_Prep` vs `by8agent_Prep` ;
- embedded relatives/questions et choix `që/cili` par fonction ;
- ordre `po` + double object + négation ;
- `nuk` vs `s'` comme génération canonique/variant ;
- paradigme interrogatif personnel complet ;
- interactions détaillées avec non-active `u`.
