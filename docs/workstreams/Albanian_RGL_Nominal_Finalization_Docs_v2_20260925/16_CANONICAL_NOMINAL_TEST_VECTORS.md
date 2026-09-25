# Canonical Nominal Test Vectors
> **Document version**: 2.0  
> **Document status**: NORMATIVE TEST DESIGN  
> **Gold rule**: seuls les vecteurs marqués `GOLD-ELIGIBLE` après validation Standard peuvent devenir gold.  
## 1. Identifiants stables

Chaque test nominal doit utiliser un ID `NOM-TV-xxx`. Les IDs restent stables même si l’implémentation change. Le test stocke séparément arbre GF, traits, output courant et output attendu.
## 2. Vecteurs immédiatement source-grounded

| ID | Phénomène | Input/traits | Attendu source | Source | Statut |
|---|---|---|---|---|---|
| `NOM-TV-001` | génitif + nyje masc sg nom tête | construction équivalente à ‘beginning of autumn’ | `fillimi i vjeshtës` | E-NOM-003 | REVIEWABLE |
| `NOM-TV-002` | nyje fem sg Gen/Dat/Abl tête | contexte attesté | `Republikës së Kosovës` | E-NOM-003 | REVIEWABLE |
| `NOM-TV-010` | distal masc sg Nom | demonstrative | `ai` | E-NOM-006 | REVIEWABLE |
| `NOM-TV-011` | distal fem sg Nom | demonstrative | `ajo` | E-NOM-006 | REVIEWABLE |
| `NOM-TV-012` | distal masc/fem sg Acc | demonstrative | `atë` | E-NOM-006 | REVIEWABLE |
| `NOM-TV-013` | distal masc sg Gen/Dat | demonstrative | `atij` | E-NOM-006 | REVIEWABLE |
| `NOM-TV-014` | distal fem sg Gen/Dat | demonstrative | `asaj` | E-NOM-006 | REVIEWABLE |
| `NOM-TV-020` | proximal masc sg Nom | demonstrative | `ky` | E-NOM-007 | REVIEWABLE |
| `NOM-TV-021` | proximal fem sg Nom | demonstrative | `kjo` | E-NOM-007 | REVIEWABLE |
| `NOM-TV-030` | possessif postnominal | 1pl possesseur + `gjuhë` | `gjuha jonë` | E-NOM-010 | REVIEWABLE |
| `NOM-TV-031` | possessif postnominal | 1sg possesseur + `mik` | `miku im` | E-NOM-010 | REVIEWABLE |
| `NOM-TV-032` | parenté postnominal | 1sg + brother | `vëllai im` | E-NOM-010 | REVIEWABLE |
| `NOM-TV-033` | parenté prénominal | 1sg + brother | `im vëlla` | E-NOM-010 | REVIEWABLE; class scope unresolved |
| `NOM-TV-034` | parenté prénominal P2 | sister | `jotë motër` | E-NOM-010 | REVIEWABLE; class scope unresolved |

## 3. Matrices obligatoires à matérialiser

### Noun morphology

Pour chaque paradigme certifié: `Species(2) × Case(5) × Number(2) = 20` chemins. Les cellules Gen/Dat peuvent être égales en chaîne mais doivent avoir deux sélections distinctes.

Classes à obtenir avant fermeture N3: masculin régulier, féminin régulier, pluriels `-e/-a/-ë/-nj/-inj`, alternance consonantique, invariant, irrégulier, ambigénérique.

**Important:** cette liste est une cible de couverture; les outputs ne doivent pas être remplis par intuition. Chaque classe obtient au moins un lemme avec preuve dans `15_LINGUISTIC_EVIDENCE_LEDGER.md`.

### Adjectives

- articulated 2-form pattern;
- articulated 3-form pattern;
- articulated 4-form pattern (`zi` est un seed attesté);
- unarticulated regular (`normal` est un seed attesté);
- radical grid `Gender × Number` séparée de la grille `link_clitic`.

### Agreement

Un test ambigénérique doit démontrer `Masc/Sg → Fem/Pl` dans au moins `AdjCN`, `NP.a`, relative, coordination/verb agreement si consommateur. **Le lemme de gold reste à sélectionner depuis une preuve Standard/Tosk explicite.**

### Numerals

Les frontières de génération restent des tests structuraux. Les outputs tirés de E-NOM-011/012 sont `REFERENCE-CANDIDATE` parce que `Lesson_50` est Geg; ils ne sont pas gold Standard avant corroboration.

### Proper names

Aucun tableau canonique de déclinaison n’est encore source-grounded. Les tests N8 commencent comme tests de **préservation de l’information** (Case/Agr) et non comme golds de surface, jusqu’à fermeture de Q006.

## 4. Format futur recommandé

Créer `validation/nominal/NOMINAL_TEST_VECTORS.tsv` avec colonnes:

`id,phenomenon,tree,features,current_output,expected_output,evidence_id,dialect_scope,review_status,gold_status`.

Le MD reste la spécification; le TSV devient l’entrée exécutable. Les deux doivent être reconciliés dans chaque livraison.
