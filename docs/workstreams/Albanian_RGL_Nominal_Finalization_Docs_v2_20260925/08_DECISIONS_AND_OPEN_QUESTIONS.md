# Registre des décisions et questions ouvertes

> **Document version**: 2.0  
> **Document status**: NORMATIVE  
> **Baseline evidence authority**: `19_BASELINE_EVIDENCE_LOCK.md`  
> **Source/provenance authority**: `02_SOURCE_LOCK_AND_AUTHORITY.md`  

> **Projet**: Albanian RGL — domaine nominal complet  
> **Date de verrouillage documentaire**: 2026-09-25  
> **Baseline d’intégration fournie par le mainteneur**: `albanian-s02-green-20260925`  
> **GF**: 3.12  
> **GF Wordbench**: 1.3.4  
> **Gate d’intégration**: voir `19_BASELINE_EVIDENCE_LOCK.md`  
> **Certification linguistique globale**: non établie  
> **Principe**: compilation verte ≠ certification linguistique.  

## A. Décisions adoptées pour le chantier

| ID | Statut | Décision | Justification |
|---|---|---|---|
| NOM-D001 | DECISION | English est benchmark de maturité/API, pas modèle linguistique | roadmap + règles du projet |
| NOM-D002 | DECISION | baseline verte préservée à chaque migration | source lock / merge gate |
| NOM-D003 | DECISION | représenter `Gen` distinctement de `Dat` | cinq cas attestés + rôle syntaxique de la *nyje* |
| NOM-D004 | DECISION | `Noun.g` dépend du nombre | noms ambigénériques attestés |
| NOM-D005 | DECISION | l’accord pluriel conserve le genre | nécessaire à l’accord des ambigénériques |
| NOM-D006 | DECISION | *nyje* centralisée dans une opération partagée | évite conditions locales et suit son conditionnement morphosyntaxique |
| NOM-D007 | DECISION | articulatedness adjectivale est une propriété explicite | deux classes d’adjectifs attestées |
| NOM-D008 | DECISION | morphologie du radical adjectival et *nyje* sont conceptuellement séparées | la référence décrit genre/nombre pour l’adjectif et contexte plus riche pour *nyje* |
| NOM-D009 | DECISION | DRAFT-MAX n’est jamais appliqué en bloc | règle de projet ; migration incrémentale |
| NOM-D010 | DECISION | pas de classe de gouvernement numéral sans preuve albanaise | Compendium + gap actuel |
| NOM-D011 | DECISION | tout smart paradigm doit avoir un chemin explicite pour irréguliers | évite placeholders / mauvaise inférence |
| NOM-D012 | DECISION | conserver et certifier `ResSqi.link_clitic` comme service nyje unique au lieu d’en créer un second | le service existe déjà dans le source verrouillé |
| NOM-D013 | DECISION | une preuve Geg ne devient pas automatiquement un gold Standard Albanian | `Lesson_50.html` est explicitement Lesson 5: Geg |

## B. Questions ouvertes — preuves requises

### NOM-Q001 — neutre productif

**Question** : faut-il représenter un `Neut` productif dans la RGL standard ?  
**État** : la référence indique un statut résiduel/disputé.  
**Action** : ne pas ajouter avant inventaire d’items standards et conséquences d’accord.

### NOM-Q002 — type exact de `Adj`

**Question** : faut-il migrer `Adj.s` de `Case => Gender => Number` vers `Gender => Number`, ou conserver le `Case` comme contexte transparent ?  
**Critère** : tous les producteurs/consommateurs + coût de migration + capacité à empêcher de fausses variations de cas.

### NOM-Q003 — possessifs prénominalisés

**Question** : quelle liste/classe de termes de parenté autorise l’ordre `Poss + N` en Standard Albanian et avec quels paradigmes ?  
**Action** : source ciblée avant ajout de métadonnée lexicale.

### NOM-Q004 — comparatif/superlatif

**Question** : quelles distinctions de degré doivent être lexicales vs analytiques, et quelle *nyje* est exigée dans les superlatifs/ordinaux ?  
**Action** : compléter la preuve avant de certifier les fallbacks actuels `më`.

### NOM-Q005 — gouvernement numéral

**Question** : certains nombres/classe de nombres sélectionnent-ils systématiquement une forme nominale, un cas ou un accord particulier ?  
**Action** : extraire une source standard et construire des minimal pairs avant d’ajouter `NumeralGov`.

### NOM-Q006 — noms propres

**Question** : quelles classes de noms propres se fléchissent et comment la définitude/cas interagit-elle avec anthroponymes et toponymes ?  
**Action** : corpus/référence dédiée ; tests sur formes attestées.

### NOM-Q007 — coordination

**Question** : règle d’accord pour coordinations de genres/nombres différents.  
**Action** : source albanaise + audit `ConjunctionSqi`/`NP.a`.

### NOM-Q008 — `DetNP` sans tête

**Question** : quel genre d’accord doit porter un determiner substantivé lorsque l’abstract ne fournit pas une tête ?  
**État** : le code courant utilise `Masc`.  
**Action** : comparer les constructions réelles et définir une politique explicite plutôt qu’un default silencieux.

## C. Procédure de fermeture d’une question

Pour passer `NOM-Qxxx` à une décision :

1. ajouter la source/preuve à `02_SOURCE_LOCK_AND_AUTHORITY.md` ;
2. résumer le fait dans `04_ALBANIAN_LINGUISTIC_CONTRACTS.md` ;
3. définir la représentation dans `03_TARGET_ARCHITECTURE.md` ;
4. ajouter les tests dans `07_TEST_AND_CERTIFICATION_PLAN.md` ;
5. enregistrer une nouvelle `NOM-Dxxx` ici ;
6. seulement ensuite modifier le code.

### NOM-Q009 — Standardisation des numéraux/ordinaux de Lesson 50

**Question** : quelles formes du chapitre Geg sont identiques au Standard Albanian moderne et lesquelles demandent adaptation ?  
**Action** : corroboration Standard/Tosk ou validation explicite avant gold; l’architecture peut néanmoins utiliser ces données comme comparaison.
