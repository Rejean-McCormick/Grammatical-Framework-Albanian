# Roadmap et définition de fini

## 1. Séquence de réalisation

### Phase M0 — verrouillage et audit

Livrables :

- source-lock exact de la baseline verte ;
- extracteur de classes N/A/V ;
- carte producers/consumers de `ResSqi` ;
- inventaire des appels `ParadigmsSqi` dans le dépôt ;
- inventaire des usages `invariantN/A/V`.

Exit : aucune décision de type central ne dépend d'une source non identifiée.

### Phase M1 — API et tests de non-régression

Avant de changer les types :

- harness de tables morphologiques ;
- golds initiaux sur familles déjà fiables ;
- tests négatifs des smart paradigms ;
- mesure de performance baseline.

### Phase M2 — noms

- grouper 563 classes en familles ;
- définir principal parts ;
- renforcer `regN/reg2N` ;
- décider `Gen` ;
- décider genre dépendant du nombre ;
- certifier les familles fréquentes ;
- exposer une API nominale stable.

### Phase M3 — adjectifs

- grouper 36 classes ;
- principal parts discriminantes ;
- relation avec nyje ;
- guards ;
- tables complètes et syntaxe d'accord.

### Phase M4 — verbes

- grouper 135 classes ;
- principal parts ;
- réviser les heuristiques ;
- isoler vrais irréguliers ;
- clarifier présent/aoriste/participial systems ;
- coordonner voix/TAM ;
- déprécier les faux complétions de `irregV`.

### Phase M5 — IrregSqi

- inventaire sourcé ;
- supprimer les pseudo-irréguliers devenus classes productives ;
- full-table tests.

### Phase M6 — dictionnaires pilotes

Sans grossissement massif :

- choisir un échantillon de placeholders Dict/MorphoDict ;
- remplacer par nouveaux paradigmes ;
- mesurer taux de réussite et erreurs ;
- corriger l'API, pas les dictionnaires, lorsqu'une famille productive est manquante.

### Phase M7 — certification et handoff

- GF 3.12 ;
- 58/58 + 52/52 ;
- nouveaux golds morphologiques ;
- aucune régression acceptée sans décision ;
- documentation synchronisée ;
- overlay/commit minimal.

## 2. Définition de « Morphologie fondamentale MAX terminée »

Le workstream n'est fini que lorsque toutes les conditions suivantes sont vraies :

### Architecture

- `ResSqi` contient les dimensions nécessaires et aucune dimension spéculative ;
- chaque champ a producteurs/consommateurs identifiés ;
- les frontières morphologie/morphosyntaxe sont documentées.

### Noms

- grandes familles productives certifiées ;
- principal parts définies ;
- décisions Gen/genre pluriel/neutre résolues ou explicitement hors scope avec justification ;
- les placeholders nominaux ordinaires peuvent être remplacés par des paradigmes réels.

### Adjectifs

- familles productives certifiées ;
- accord complet ;
- comportement nyje documenté ;
- smart API avec guards.

### Verbes

- familles principales certifiées sur leurs tables ;
- principal parts stables ;
- vrais irréguliers séparés ;
- modes/temps stockés ont une sémantique claire ;
- non-actif et systèmes analytiques ont une frontière documentée avec les autres workstreams.

### API

- `mkN`, `mkA`, `mkV` simples restent ergonomiques dans leur domaine ;
- des overloads principal-parts sûrs existent ;
- un escape hatch complet existe ;
- aucun input fourni n'est silencieusement ignoré ;
- tous les overloads sont testés.

### Validation

- full compile et scénarios verts ;
- corpus de golds morphologiques revu ;
- tests négatifs ;
- tests de performance ;
- documentation alignée sur le code exact.

### Impact lexical

- réduction mesurable et importante du besoin de `invariantN/invariantA/invariantV` ;
- les placeholders restants sont exceptionnels, explicitement suivis et non présentés comme certifiés.

## 3. Critère ultime

La morphologie est mature lorsque l'ajout d'un lexème albanais normal suit le flux :

```text
formes de dictionnaire / principal parts attestées
→ constructeur ParadigmsSqi documenté
→ table complète correcte
→ catégorie RGL lock-safe
→ DictSqi/MorphoDictSqi
→ Wordbench + golds
```

et non :

```text
lemme
→ heuristique opaque
→ classe numérotée inconnue
→ placeholder si ça échoue
```

## 4. Binding DoD v2

La définition qualitative ci-dessus est satisfaite uniquement quand G0–G8 de `19_QUANTITATIVE_RELEASE_GATES.md` passent.
