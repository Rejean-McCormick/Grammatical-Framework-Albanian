# Apply — Albanian DRAFT-MAX checkpoint 2

Base attendue : **Albanian linguistic completion overlay 20260924 applied to snapshot 20260923-194448**, identique à celle du checkpoint 1.

## Application

Copier `payload/` à la racine du dépôt cible en conservant les chemins.

```sh
cp -a payload/. /path/to/repository/
```

Ce checkpoint change le contrat interne de `ResSqi.Verb`, `ResSqi.VP` et `ResSqi.VPSlash` : faire l'application dans une branche/worktree séparée.

## Vérification statique fournie

```sh
python validation/static_validate.py
```

Le résultat de la génération fournie est enregistré dans `STATIC_VALIDATION.txt`.

## Vérification GF requise dans le dépôt complet

Après application au snapshot exact, compiler le RGL albanais avec l'installation GF du projet (par exemple le target/commande de build déjà utilisé par le dépôt). Rechercher ensuite les anciens accès directs :

```sh
grep -RInE '\bsubjcl\b|\.cl\b|cl[[:space:]]*:[[:space:]]*Str' AlbanianSQI/GF/lib/src/albanian
```

Tout consommateur restant doit utiliser le cluster typé et les helpers de `ClauseSqiRes`.

Voir `REPORT.md` et `MIGRATION_NOTES.md` pour les limites de certification liées au snapshot complet absent.
