# Plan de tests et certification morphologique

## 1. Trois niveaux de vérité

### Niveau A — compile

Le code GF compile. Nécessaire, jamais suffisant.

### Niveau B — table morphologique

Chaque cellule attendue d'un paradigme est comparée à une attente revue.

### Niveau C — comportement RGL

Les consommateurs syntaxiques sélectionnent les bonnes cellules dans des constructions complètes.

La certification morphologique exige B + C, en plus de A.

## 2. Gates globaux

Après toute livraison intégrable :

- GF 3.12 ;
- census au moins 58/58, sauf croissance intentionnelle documentée ;
- 52/52 scénarios existants ;
- aucun warning lock bloquant ;
- aucun gold accepté régressé sans décision explicite.

## 3. Tests T1 — `ResSqi`

Tester toutes les branches de :

- cas ;
- nombre ;
- genre ;
- définitude ;
- agreement helpers ;
- conversions `Agr` ;
- nouvelle dimension éventuelle avant consommation syntaxique.

## 4. Tests T2 — `MorphoSqi`

Pour chaque famille productive N/A/V :

1. lexème régulier canonique ;
2. lexème frontière ;
3. lexème avec alternance orthographique/phonologique ;
4. cas qui exige un constructeur plus explicite ;
5. input invalide.

Les tests doivent sortir des **tables complètes étiquetées**, pas une forme choisie.

## 5. Tests T3 — `ParadigmsSqi`

Chaque overload public :

- type/arity ;
- domaine ;
- metadata par défaut ;
- principal parts ;
- classe choisie ;
- comportement hors domaine ;
- fallback complet.

Cas prioritaire : prouver que `reg2N/reg2A/reg2V` n'ignorent pas une seconde forme contradictoire après refactor.

## 6. Gold morphology

Créer un corpus de golds morphologiques distinct du simple corpus de phrases. Chaque ligne doit contenir au minimum :

```text
test_id
lemma
category
constructor
input_principal_parts
feature_bundle
expected_surface
source
review_status
```

Aucune sortie générée automatiquement n'est `accepted` par défaut.

## 7. Couverture nominale

Matrice minimale :

```text
Species × Case × Number
(+ Gender metadata / plural gender where relevant)
```

Si `Gen` est ajouté, il entre dans la matrice immédiatement.

## 8. Couverture adjectivale

```text
Case × Gender × Number
+ nyje behavior in syntax
```

## 9. Couverture verbale

Au minimum :

```text
Indicative(Pres/Past/Aorist/Imperfect) × Number × Person
Subjunctive × Number × Person
Imperative × Number
Participle
Optative tables
Admirative tables
```

Toute redéfinition du record ajuste cette matrice explicitement.

## 10. Negative tests

Obligatoires pour les smart paradigms :

- suffixe inconnu ;
- principal parts incompatibles ;
- forme ambiguë ;
- classe non supportée.

Le succès attendu d'un negative test est **l'échec contrôlé**, pas une forme de secours.

## 11. Tests de performance

`MorphoSqi` est déjà volumineux. Toute restructuration majeure doit mesurer :

- temps de compilation ;
- taille GFO/PGF ;
- croissance de tables ;
- coût des dictionnaires ;
- différence par rapport à la baseline.

## 12. Certification d'une famille

Une famille passe à `CERTIFIED` seulement si :

- domaine documenté ;
- principal parts documentées ;
- table complète testée ;
- au moins plusieurs lexèmes revus ;
- test invalide ;
- intégration syntaxique ;
- full Wordbench vert ;
- provenance enregistrée.

## 13. Quantitative binding v2

Les conditions qualitatives de ce document sont rendues bloquantes et chiffrées dans `19_QUANTITATIVE_RELEASE_GATES.md`.
