# Morphologie fondamentale — contrat global

## CURRENT

Le snapshot fourni contient :

- `ResSqi.gf` ;
- `MorphoSqi.gf` (~1.07 MiB) ;
- `ParadigmsSqi.gf` ;
- `IrregSqi.gf` ;
- 563 classes nominales numérotées ;
- 36 classes adjectivales ;
- 135 classes verbales ;
- total 734 classes internes.

## TARGET

### MorphoSqi
- regrouper les classes numérotées en familles linguistiquement décrites ;
- centraliser les alternances morphophonologiques productives ;
- garder les numéros comme implementation/generated compatibility layer si utile ;
- aucune classe productive ne doit être remplacée par un placeholder.

### ParadigmsSqi
Ladder public :

1. forme de citation seulement quand non ambiguë ;
2. principal parts observables ;
3. famille spécialisée ;
4. full observed forms escape hatch ;
5. vrai irrégulier.

Un input hors domaine échoue explicitement. Les anciens `reg2* -> reg*` qui ignorent une seconde forme sont à éliminer ou à prouver équivalents.

### IrregSqi
Seulement suppletion/alternance non productive/exception réellement lexicale. Une classe manquante n'est pas un irrégulier.

## Principales décisions

- `Gen` n'augmente pas artificiellement les cellules segmentales du nom : `MorphCase` gère le syncrétisme.
- `Noun.g` devient dépendant du nombre.
- `Adj` cesse de dupliquer le cas.
- `Gender` core reste Masc/Fem.
- les principal parts verbales sont dérivées par analyse des 135 classes ; l'hypothèse présent + aoriste + participe reste un bon point de départ mais doit être mesurée.

## Certification d'une famille

Domaine documenté + principal parts + table complète + ≥3 lexèmes revus + boundary/negative test + intégration syntaxique + full gate + provenance.
