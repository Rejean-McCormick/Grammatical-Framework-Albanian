# Clause — Sentence, Question, Relative

## Scope
41 fonctions shared recensées dans le pack C7 : 19 Sentence + 17 Question + 5 Relative.

## Architecture cible

- `ClauseSqiRes` = assembly boundary ordinaire ;
- modules publics restent minces ;
- government/slash/clitic/TAM metadata ne sont pas flattenés avant realization ;
- les constructeurs spécialisés restent spécialisés, mais leur divergence est inventoriée et testée.

## Politique de génération

- ordre neutre par défaut : SVO ;
- direct polar question : `a` selon preuve existante ;
- ordinary relative default : invariant `që` ;
- relatif fléchi `cili` disponible lorsque l'accord/cas/préposition doit être explicite ;
- pas de preposition stranding canonique sans preuve ; neutraliser les fonctions English-like vers une stratégie albanaise ;
- variantes parse/generation ne servent jamais à cacher l'incertitude.

## Décision clôturée globalement

Accord adjectival dans les constructions impersonnelles/extraposed attestées : féminin singulier comme default de cette famille, avec tests dédiés. Cela ne devient pas un `defaultAgr` universel pour toutes les clauses sans sujet nominal.

## Open core

Embedded polar/wh questions, distribution `se/që`, focus/scrambling, pro-drop policy, adverb placement, nonrestrictive relatives, purpose clauses, positive imperative clitic variant et idiomatic question order restent evidence-driven.
