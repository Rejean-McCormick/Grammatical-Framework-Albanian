# Albanian linguistic evidence ledger

## 1. Scope

Ce ledger sépare ce que les références fournies attestent de ce que le code doit décider. Il ne mélange pas Tosk standard, Geg, historique et généralités descriptives.

## 2. Evidence records

| ID | Claim source-derived | Variety/scope | Source locator | Implementation consequence | Status |
|---|---|---|---|---|---|
| ALB-EV-001 | cinq cas sont décrits : nom., acc., dat., gen., abl. | général | `Albanian_Complete_Grammar.html` → phrase “Five cases remain...” | justifie d'étudier `Gen`, pas de l'ajouter automatiquement | VERIFIED-SOURCE |
| ALB-EV-002 | datif et génitif sont morphologiquement identiques | général | même section → “dative and genitive are morphologically identical” | la distinction structurale peut être virtualisée/syncrétique | VERIFIED-SOURCE |
| ALB-EV-003 | le nom fléchit en définitude | général | même section → “inflecting for case and number... definiteness” | confirme `Species`/définitude comme dimension nominale | VERIFIED-SOURCE |
| ALB-EV-004 | l'article défini est postposé | général/Balkan | même section → exemple `zog / zog-u` | morphologie nominale doit préserver la série définie | VERIFIED-SOURCE |
| ALB-EV-005 | le nyje distingue notamment le génitif du datif dans la description fournie | général | même fichier → paragraphe “attributive article (nyje)” | la solution Gen doit coordonner morphologie et syntaxe du nyje | VERIFIED-SOURCE |
| ALB-EV-006 | neutre mentionné, statut disputé | général | même section → “exact status of the neuter gender is disputed” | `Neut` reste OPEN | VERIFIED-SOURCE |
| ALB-EV-007 | le système verbal contient de nombreuses formes analytiques | général | même section → perfect/future/progressive/passive examples | ne pas stocker aveuglément toutes les chaînes analytiques dans `Verb` | VERIFIED-SOURCE |
| ALB-EV-008 | optatif et admiratif synthétiques sont décrits | général | même section → “optative... admirative mood” | les tables actuelles doivent être validées, pas supprimées par simplification | VERIFIED-SOURCE |
| ALB-EV-009 | futur Tosk : `do` + présent subjonctif | Tosk | section variation dialectale | frontière TAM/syntaxe ; morphologie doit fournir la forme subjonctive fiable | VERIFIED-SOURCE |
| ALB-EV-010 | Tosk et Geg diffèrent fortement sur infinitif/participe | dialectal | section variation dialectale → participles `-r` vs Geg | la cible standard doit être explicitement Tosk/standard quand on généralise | VERIFIED-SOURCE |
| ALB-EV-011 | les glossaires historiques attestent `ambigeneric` | matériel Geg/historique | `Geg_Glossary_Master.html`, ex. `ujë` | indice pour genre selon nombre, insuffisant seul pour le standard | VERIFIED-SOURCE-LIMITED |
| ALB-EV-012 | des formes non-actives sont annotées dans le corpus | matériel lexical/historique | glossaires, ex. formes étiquetées `non-active` | justifie inventaire voice morphology, pas encore un type final | VERIFIED-SOURCE-LIMITED |

## 3. Evidence promotion rule

Une preuve linguistique devient implémentatoire seulement si le record contient :

```text
claim_id
source file
exact locator/section
variety (Standard/Tosk/Geg/historical)
examples
scope of generalization
counterexamples checked
implementation decision id
gold tests
review status
```

## 4. PDF

`Albanian.pdf` reste **CATALOGUED / NOT-EXTRACTED** dans ce pack. Aucun fait de ce PDF n'est utilisé comme justification tant qu'une extraction localisée et vérifiable n'a pas été ajoutée.

## 5. Generated support

`generated/ALBANIAN_EVIDENCE_SNIPPETS.json` contient des snippets de localisation issus des HTML pour aider la revue ; ce fichier n'est pas un gold linguistique.
