# Réintégration contrôlée de DRAFT-MAX

## 1. Statut

DRAFT-MAX est **HISTORICAL / CANDIDATE SOURCE**, pas une branche à merger en bloc.

Le checkpoint 2 a proposé des idées importantes :

- `Gen` explicite ;
- `Noun.g` / `CN.g` dépendant du nombre ;
- `CliticCluster` typé ;
- `Voice`, `VoiceUse`, `PerfectAux` ;
- propagation structurée de la voix et des clitiques.

Son propre rapport indique que la validation fournie était statique, pas une compilation GF complète.

## 2. Pourquoi le merge global est interdit

L'audit historique `checkpoint2_vs_snapshot` a trouvé une propagation incomplète de contrats centraux. Il signale notamment, pour le snapshot audité à l'époque :

- consommateurs restant sur les anciens champs VP ;
- de nombreux `lin V` non migrés vers les nouveaux champs ;
- de nombreux `lin N`/`lin A` non migrés après ajout de `Gen` ;
- changements transversaux du type de genre nominal.

Conclusion durable : **les idées peuvent être bonnes alors que l'overlay complet est dangereux**.

## 3. Items pertinents pour Conversation 1

### DM-M01 — `Gen` explicite

**État : CANDIDATE.**

Expérience à mener : ajouter le cas d'abord dans une branche dédiée avec propagation exhaustive du cœur morphologique et tests Dat/Gen, avant tout changement syntaxique plus large.

Critère : la distinction doit simplifier/fiabiliser le génitif sans inventer une forme nominale distincte là où la langue est syncrétique.

### DM-M02 — genre dépendant du nombre

**État : CANDIDATE.**

Expérience : corpus ciblé de noms standard avec accord singulier/pluriel. Ne pas généraliser depuis les seules attestations Geg historiques.

### DM-M03 — voix / auxiliaire dans `Verb`

**État : DEFERRED-CROSS-WORKSTREAM.**

Conversation 1 doit documenter les formes morphologiques du non-actif, mais l'introduction de champs dans `Verb` doit être coordonnée avec les workstreams voix/TAM/syntaxe pour éviter une migration partielle.

### DM-M04 — clitic cluster

**État : OUT-OF-SCOPE DIRECT / dependency.**

La morphologie peut fournir les formes/allomorphes nécessaires, mais la structure de cluster appartient à la conversation clitique/syntaxe.

## 4. Méthode de réintégration

Pour chaque idée DRAFT-MAX :

1. définir le problème actuel reproductible ;
2. citer l'idée DRAFT-MAX correspondante ;
3. vérifier l'évidence albanaise ;
4. tracer tous les producteurs/consommateurs ;
5. faire le plus petit patch sémantique ;
6. compiler localement les modules touchés ;
7. tests morphologiques ciblés ;
8. full 58/58 + 52/52 ;
9. revue linguistique ;
10. seulement ensuite marquer `ACCEPTED`.

## 5. Règle de migration de record

Une migration `ResSqi` n'est mergeable que si le même change-set contient ou coordonne :

- tous les constructeurs directs du record ;
- toutes les projections du champ ;
- tous les retypages `lin` ;
- toutes les fonctions de copie/update ;
- tests de préservation ;
- note de migration.
