# Questions ouvertes et décisions

Ce registre doit rester court, actif et actionnable. Une question résolue devient une décision dans le log du projet et est retirée de la section OPEN.

## OPEN

### MORPH-SQI-001 — `Gen` explicite dans `Case`

**Question :** faut-il passer de `Nom|Acc|Dat|Ablat` à `Nom|Acc|Dat|Gen|Ablat` ?

**Pour :** les références distinguent grammaticalement génitif et datif ; DRAFT-MAX montre une voie de propagation.

**Risque :** très large migration de tables/consommateurs ; le syncrétisme morphologique peut faire croire à tort qu'il faut inventer une nouvelle forme nominale.

**Preuve requise :** tests de génitif/possession et audit des consumers.

### MORPH-SQI-002 — genre nominal dépendant du nombre

**Question :** `Noun.g` doit-il devenir `Number => Gender` ?

**Pour :** DRAFT-MAX et attestations d'ambigénéricité suggèrent que le genre d'accord peut nécessiter plus qu'un scalaire.

**Risque :** les données Geg/historiques ne suffisent pas à décrire le standard moderne.

**Preuve requise :** corpus Tosk/standard + tests d'accord.

### MORPH-SQI-003 — statut du neutre

**Question :** doit-il être une valeur de `Gender` dans le RGL cible ?

**Évidence actuelle :** référence générale le mentionne mais qualifie son statut de disputé.

**Action :** ne pas ajouter avant inventaire des lexèmes et comportements d'accord dans la variété cible.

### MORPH-SQI-004 — principal parts verbales minimales

**Question :** quelles formes observables discriminent les 135 classes sans surcharger l'API ?

**Hypothèse :** présent + aoriste + participe, avec extensions pour certaines familles.

**Action :** analyse automatique des 135 classes + validation manuelle linguistique.

### MORPH-SQI-005 — frontière `subjunctiveFromPresent`

**Question :** quelles règles sont vraiment productives et quelles exceptions doivent migrer vers `IrregSqi`/classe dédiée ?

### MORPH-SQI-006 — contenu exact de `Past`

**Question :** le label `Past` du record courant représente quoi exactement dans la grammaire et est-il redondant/analytique par rapport aux systèmes décrits dans les références ?

**Action :** tracer tous les producteurs et consommateurs avant renommage ou suppression.

### MORPH-SQI-007 — voix dans le record lexical

**Question :** quelles distinctions active/non-active doivent être stockées comme tables du verbe et lesquelles appartiennent à l'assemblage morphosyntaxique ?

### MORPH-SQI-008 — API adjectivale des principal parts

**Question :** quelles formes (masc sg, fem sg, pluriel, etc.) minimisent l'ambiguïté des 36 classes ?

### MORPH-SQI-009 — statut des fallbacks `reg2* -> reg*`

**Question :** quels fallbacks sont prouvés équivalents et lesquels doivent devenir des erreurs ?

## ACCEPTED dans ce dossier de gouvernance

### MORPH-SQI-A01 — DRAFT-MAX incrémental uniquement

**Décision :** aucune activation globale.

### MORPH-SQI-A02 — classes numérotées internes

**Décision :** elles peuvent rester comme implémentation, mais la surface publique finale ne doit pas exiger leur connaissance.

### MORPH-SQI-A03 — placeholders non certifiés

**Décision :** un placeholder compile-safe n'est jamais promu comme morphologie finale.

### MORPH-SQI-A04 — guards

**Décision :** les smart paradigms doivent refuser les inputs hors domaine.

### MORPH-SQI-A05 — principal parts observables

**Décision :** l'API publique privilégie des formes que le lexicographe peut vérifier directement.

## Ledger rule v2

Ce fichier est une vue active. Dès qu'une question est résolue, sa décision durable est ajoutée à `23_DECISION_LEDGER.md`; elle n'est jamais effacée de l'historique append-only.
