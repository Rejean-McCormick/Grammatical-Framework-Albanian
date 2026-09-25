# Constitution globale anti-drift

## Articles non négociables

1. **Compilation ≠ correction linguistique.** `58/58`, `52/52`, PGF ou scénario `OK` ne certifient pas une forme.
2. **Observation ≠ attente.** Un output GF devient gold seulement après preuve et revue.
3. **Le gold suit la linguistique.** Ni la grammaire ni le gold ne sont déformés pour préserver une erreur historique.
4. **Hash-bound.** Une preuve s'applique au source-lock et à l'output exact qu'elle cite.
5. **Variété déclarée.** La cible par défaut est `Standard Albanian`; Tosk et Geg restent étiquetés.
6. **English = benchmark de maturité/API, pas autorité linguistique.**
7. **Langues modèles = architecture comparative, jamais preuve de surface albanaise.**
8. **DRAFT-MAX = source d'idées quarantinée.** Une idée = une décision + un patch + des tests.
9. **Placeholder = dette.** Aucun `invariantN/A/V` compile-safe n'est certifié par le seul fait qu'il compile.
10. **DictSqi ≠ MorphoDictSqi.** Le premier porte identité lexicale/catégorie/valence ; le second porte lemgramme/table morphologique.
11. **Une information grammaticale a un propriétaire.** Pas de deuxièmes autorités parallèles en `Str` ou enums concurrents sans migration datée.
12. **Les smart paradigms ont des guards.** Une principal part fournie n'est jamais ignorée silencieusement.
13. **Les distinctions sont conservées jusqu'au dernier consommateur.** Clitic role, case, voice-use, morph-voice, agreement, complement government ne sont pas aplatis prématurément.
14. **Une migration de record central est transversale.** Producteurs, transporteurs, consommateurs et tests changent ensemble.
15. **Le vocabulaire global de certification est unique.** Le mot nu `certified` est interdit dans les rapports de release.
16. **Les dénominateurs sont protégés.** CASEs, fonctions, cellules, catégories ou golds ne diminuent pas silencieusement.
17. **Le non-certifié reste visible.** `partial`, `missing`, `questionable`, placeholders, conflits et limitations restent dans les registres.
18. **Le common RGL contract doit être satisfait.** Une distinction linguistiquement non pertinente peut être neutralisée, jamais simplement omise si l'abstract l'exige.
19. **La croissance augmente l'information.** Expansion lexicale ou CASEs doivent ajouter diversité de classes/phénomènes, pas seulement volume.
20. **Toute exception durable a provenance, owner et test.**

21. **Le routing Compendium précède le code.** Toute tâche choisit un route R01–R14 et un workflow primaire avant modification.
22. **L'état procédural est S00–S11.** Les niveaux Albanian R0–R4 mesurent la maturité produit et ne remplacent jamais la state machine Compendium.
23. **Le microcycle W00–W08 est obligatoire par patch/workstream.** Aucun code n'est considéré réconcilié avant `W08 RECONCILED`.
24. **Le patch record Albanian est un superset du `AI_PATCH_PROTOCOL`.** Toute information exigée par le Compendium reste obligatoire même si un template local l'omet historiquement.
25. **Le plus bas gate non satisfait contrôle l'état.** Du code avancé ne permet pas de sauter une exigence de preuve, contrat, morphologie, régression ou revue.
26. **Les blockers sont visibles.** `BLOCKED_SOURCE|EVIDENCE|ARCHITECTURE|CONTRACT|DEPENDENCY|COMPILER|LINGUISTIC_TEST|REGRESSION|DEFERRED_EXPLICITLY` ne sont jamais masqués par fallback, chaîne vide ou `variants`.

## Vocabulaire global

### Structure/exécution
`structurally_green`, `scenario_executed`, `executed_only`.

### Revue linguistique
`valid`, `valid_variant`, `questionable`, `invalid` + confiance `high|medium|low`.

### Gold
`gold_eligible`, `golded`, `gold_regression_pass`.

### Parité
`implemented`, `equivalent`, `partial`, `missing`, `linguistically_not_applicable`, `needs_review`.

### Preuve
`source_fact`, `compiler_fact`, `test_fact`, `linguistic_evidence`, `accepted_decision`, `inference`, `provisional`, `stale`.

### Certification de périmètre
`AI_reviewed_in_scope`, `human_reviewed_in_scope`, `dual_reviewed_in_scope`, `gold_protected_in_scope`, `R4_candidate_*`.

Les ladders locaux (`C0–C6`, `P0–P3`, `STRUCTURAL_PASS`, etc.) restent permis comme statuts internes de workstream, mais doivent être **mappés** à ce vocabulaire dans tout rapport global.

## Axes de statut qui ne doivent pas être fusionnés

- `S00–S11` : état légal de développement Compendium.
- `W00–W08` : microcycle d'un workstream/patch.
- `R0–R4` : maturité Albanian interne.
- `RG-*` : exigences du release gate Compendium.

Un rapport global doit toujours séparer ces quatre axes.
