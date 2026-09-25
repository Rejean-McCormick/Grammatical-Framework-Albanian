# Morphophonology specification — controlled scope

## 1. Goal

Centraliser les alternances **productives** au lieu de les disperser entre centaines de classes. Ce document ne déclare aucune alternance productive sans preuve.

## 2. CURRENT implementation facts

`MorphoSqi` construit aujourd'hui les paradigmes par combinaison de :

- concaténation de suffixes ;
- patterns GF `case <base : Str>` ;
- captures de segments (`stem + "..."`) ;
- quelques opérations de troncation/`init` ;
- classes qui portent directement des tables complètes dérivées.

Ces mécanismes de code ne sont **pas automatiquement des règles phonologiques de l'albanais**.

## 3. Required rule record

Chaque règle promue doit avoir :

```text
RULE-ID
LEVEL: orthographic | morphophonological | allomorphic
DOMAIN: N | A | V + family
INPUT CONDITION
OPERATION
OUTPUT
BLOCKING CONDITIONS
EXAMPLES >= 3 when productive
COUNTEREXAMPLES
ALBANIAN EVIDENCE
CLASSES REPLACED/SHARED
TESTS
STATUS
```

## 4. Prohibited shortcuts

- déduire une règle productive d'un seul `mkN###` ;
- transformer une suite fréquente dans le générateur en règle sans corpus ;
- utiliser une opération de string pour réparer une table après réalisation ;
- appliquer une alternance à Dict/MorphoDict avant qu'elle soit certifiée au core.

## 5. Work plan

1. clusteriser les 734 classes par structure de table ;
2. extraire les différences de stems/suffixes ;
3. associer lexèmes/exemples ;
4. proposer des règles ;
5. vérifier références standard/Tosk ;
6. fusionner seulement les classes réellement équivalentes ;
7. préserver un mapping ancien-ID → nouvelle famille.

## 6. Final condition

La morphophonologie est “close” lorsque chaque transformation partagée est soit :

- une règle productive certifiée ;
- une allomorphie de famille documentée ;
- une irrégularité lexicale ;
- explicitement non analysée mais isolée derrière un full-form constructor.
