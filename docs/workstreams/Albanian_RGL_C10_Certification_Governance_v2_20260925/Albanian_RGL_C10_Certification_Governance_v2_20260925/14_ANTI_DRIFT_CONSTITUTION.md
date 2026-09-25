---
document_role: anti_drift_constitution
status: highest_local_norm
version: 2.0
date: 2026-09-25
---

# Constitution anti-drift — Conversation 10

## Article 1 — Compilation ≠ correction linguistique

`58/58`, `52/52`, PGF build, scénario `OK` ou absence d'erreur GF ne certifient jamais une sortie linguistique.

## Article 2 — Observation ≠ attente

Une chaîne produite par la grammaire est une observation. Elle ne devient attente qu'après preuve et revue.

## Article 3 — Le gold suit la linguistique

On ne modifie ni la grammaire pour conserver un gold faux, ni le gold pour faire passer un comportement non justifié.

## Article 4 — Hash-bound

Une revue certifie l'output exact et le source-lock exact qu'elle cite. Un changement pertinent rend la preuve stale jusqu'à revalidation.

## Article 5 — Variété déclarée

Aucun gold sans variété. Par défaut : `Standard Albanian`. Tosk, Geg et Standard ne sont jamais fusionnés implicitement.

## Article 6 — Incertitude visible

Une incertitude est `questionable`, `needs_review` ou `provisional`, jamais `valid_variant` par commodité.

## Article 7 — Source representation ≠ linguistic ontology

Le fait que le code possède quatre valeurs de `Case`, deux `Gender`, ou une table donnée ne suffit pas à conclure que la langue ne possède que ces distinctions. Le modèle GF et l'analyse linguistique sont comparés explicitement.

## Article 8 — English est benchmark, pas moule

La parité vise capacité, couverture et maturité. Une architecture différente est acceptable si elle est justifiée et testée.

## Article 9 — Les langues modèles ne prouvent pas Albanian

Une langue modèle peut suggérer un pattern d'ingénierie, jamais un fait de forme, accord, gouvernement ou ordre en Albanian.

## Article 10 — Pas de DRAFT-MAX global

Une idée historique est récupérée seulement par changement isolé, preuve, tests et revue.

## Article 11 — Placeholder ≠ maturité

Un fallback compile-safe est une dette. Il ne devient jamais implicitement paradigme certifié.

## Article 12 — Dict ≠ MorphoDict

`DictSqi` = lexique syntaxique/valence.  
`MorphoDictSqi` = lemgrammes/tables morphologiques.

Leurs métriques et critères restent séparés.

## Article 13 — Dénominateurs protégés

Aucun dénominateur de CASEs, cellules, fonctions, golds ou phénomènes ne diminue silencieusement. Toute modification passe par change control.

## Article 14 — Chaque progression augmente l'information

569 → 5k → 20k+ doit augmenter la diversité de phénomènes, cellules, classes et interactions, pas seulement le volume.

## Article 15 — Les bugs vont au propriétaire

Conversation 10 découvre, reproduit, classe et revalide. Le correctif core appartient à la conversation propriétaire 1–9.

## Article 16 — Le non-certifié reste visible

Placeholders, sorties non revues, conflits de source, `partial`, `missing`, `questionable` et limitations restent dans les registres jusqu'à résolution.

## Article 17 — « Certifié » exige un périmètre

Le mot `certified` seul est interdit dans les rapports. Employer un statut défini dans `16_NORMATIVE_VOCABULARY.md` et préciser périmètre, variété et reviewer.

## Article 18 — Changement constitutionnel explicite

Modifier une règle fondamentale exige :
- decision ID;
- motivation;
- sources;
- impact sur anciennes métriques/golds;
- version;
- date;
- reviewer.

## Checklist de certification

- [ ] source-lock exact?
- [ ] variété exacte?
- [ ] output hash exact?
- [ ] preuve atomique pertinente?
- [ ] verdict canonique?
- [ ] confiance suffisante?
- [ ] feature/cellule identifiée?
- [ ] bug routé si nécessaire?
- [ ] gold séparé de validate?
- [ ] dénominateur préservé ou décision enregistrée?
- [ ] English utilisé seulement pour contrat/benchmark?
- [ ] dialecte non confondu avec Standard?
- [ ] dette résiduelle visible?
- [ ] type de reviewer explicite?
