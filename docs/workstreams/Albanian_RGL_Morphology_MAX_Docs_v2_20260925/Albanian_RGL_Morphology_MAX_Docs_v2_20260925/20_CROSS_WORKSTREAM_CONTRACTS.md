# Cross-workstream contracts

## 1. Ownership

Conversation 1 possède :

- paramètres morphologiques fondamentaux de `ResSqi` ;
- records lexicaux N/A/V et helpers morphologiques ;
- familles flexionnelles et principal parts ;
- API de création lexicale `ParadigmsSqi` ;
- vrais irréguliers.

## 2. Shared boundaries

| Boundary | Conversation 1 provides | Other workstream decides | Change rule |
|---|---|---|---|
| Case / government | type `Case`, tables, `Prep/Compl` metadata | realization syntax, genitive/nyje placement | shared RFC before type change |
| Nominal gender/agreement | lexical gender metadata + inflection | CN/NP agreement propagation | shared RFC for `Noun.g` shape |
| Adjective/nyje | adjective forms + behavior metadata | placement/selection of nyje | no string-postprocessing in morphology |
| Verb TAM | lexical/synthetic forms + principal parts | analytic tense assembly | do not duplicate analytic chains in every Verb |
| Voice/non-active | morphologically conditioned forms/metadata | VP voice semantics and syntax | shared decision before fields added |
| Clitics | allomorphs if truly lexical | cluster order, doubling, placement | clitic structure is not owned by Morpho |
| Valence | morphologically correct head V/N/A | V2/V3/VV... argument structure | wrappers cannot repair morphology |
| DictSqi | certified constructors | sense/category/valence/provenance | no morphology-by-placeholder as final fix |
| MorphoDictSqi | inflectional API | one lemgramme per table | no semantics/subcat in morphodict |

## 3. Shared-change protocol

A change is `SHARED` when it modifies a type or field read outside the four core files. It requires : owner, affected files, migration plan, tests from both sides, rollback, and an accepted decision ID.

## 4. Conflict rule

Si une autre conversation a besoin d'une information non représentée, elle ouvre une requirement vers Conversation 1. Elle ne doit pas ajouter localement un champ parallèle ou encoder l'information dans `Str`.
