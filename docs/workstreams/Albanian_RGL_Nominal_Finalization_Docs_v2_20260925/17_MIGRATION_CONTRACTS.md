# Migration Contracts — N0 à N9
> **Document version**: 2.0  
> **Document status**: NORMATIVE MIGRATION GATES  
> **Rule**: `06_IMPLEMENTATION_SEQUENCE.md` donne l’ordre; ce document donne les conditions mécaniques d’entrée/sortie/rollback.  

| Stage | Boundary | Allowed representation change | Exit gate | Rollback |
|---|---|---|---|---|
| N0 | Characterization + locks | Aucun changement de représentation. | 12–19 générés; outputs courants capturés séparément des attentes linguistiques. | Pas de changement core; rollback trivial. |
| N1 | Case `Gen` | `Case: Nom|Acc|Dat|Ablat` → `Nom|Acc|Gen|Dat|Ablat`; aucune autre refonte fondamentale. | Toutes tables de Case exhaustives compilent; `PossNP` sélectionne `Gen`; `link_clitic` accepte/traite Gen; Gen/Dat restent deux chemins; full baseline vert. | Revert complet N1; aucun code N2 ne doit dépendre d’un N1 partiellement vert. |
| N2 | Genre dépendant du nombre + accord pluriel | `Noun.g : Gender` → `Number => Gender`; `GPl` → `GPl Gender` ou représentation information-equivalente. | Rescan 14 exhaustif; noms ordinaires inchangés; au moins un test ambigénérique source-grounded; tous consommateurs d’Agr verts. | Revert N2 sans toucher N1. |
| N3 | Paradigmes nominaux explicites | Pas de nouveau type syntaxique sauf preuve; enrichissement Morpho/Paradigms. | 20 cellules pour classes certifiées; API principal-parts; aucun nouveau placeholder; smart dispatcher a erreurs/limites testées. | Retirer nouveaux constructeurs/classes sans modifier N1/N2. |
| N4 | Nyje + génitif/possession | Réutiliser `link_clitic`; pas de deuxième service. | Matrice Gen/Dat/Species/Gender/Number revue; PossNP et Adj/AP utilisent même source de vérité; seeds E-NOM-003 verts. | Revert usages/matrice N4, conserver N1–N3. |
| N5 | Adjectifs | Articulatedness explicite; éventuelle réduction de `Adj.s` seulement si audit Q002 clos. | 2/3/4-form + unarticulated tests; radical vs nyje séparés; comparatif/superlatif seulement selon preuve. | Conserver ancien shape temporaire si migration du type non prouvée; ne jamais casser N4. |
| N6 | Det/Quant/Pron/Poss | Pas de default silencieux nouveau; toute métadonnée a producteur/consommateur. | Démonstratifs/pronoms/possessifs tables revues; Q008 policy explicite; exceptions parenté seulement après Q003. | Revert sous-famille concernée. |
| N7 | Numéraux | Aucun `NumeralGov` sans preuve Standard; ordinals ne sont pas auto-certifiés depuis Geg. | Boundaries structurelles vertes; outputs Standard corroborés avant gold; ordinaux corrigés si preuve. | Revert numéral seulement. |
| N8 | Names | PN/GN/LN/SN case-aware; pas d’invariance implicite certifiée. | Q006 fermé pour golds de surface; `FullName`, surnames, `InLN`, cas obliques testés. | Revert Names. |
| N9 | Integration/parity | Aucun nouveau changement de représentation. | 100% abstract surface accounted; Paradigms gaps documentés/fermés; ledger dette mis à jour; full gate + golds revus. | Retour au dernier N8 green. |

## Consumer audit record obligatoire

Pour N1/N2/N5 si type change, joindre au handoff un tableau:

`module | symbol/pattern | classification(changed/inspected-no-change/N-A) | reason | test`.

La liste initiale vient de `14_PRODUCER_CONSUMER_IMPACT_MATRIX.md`; un rescan après patch doit produire **zéro module non classé**.

## Prohibition

Deux stages fondamentaux ne peuvent pas être fusionnés dans le même overlay pour « gagner du temps ». En particulier N1 (`Gen`) et N2 (genre/accord) doivent rester réversibles indépendamment.
