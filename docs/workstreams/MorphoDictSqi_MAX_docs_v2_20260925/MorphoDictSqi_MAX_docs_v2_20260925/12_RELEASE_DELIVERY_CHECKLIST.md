# Checklist de livraison — MorphoDictSqi MAX

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## A. Périmètre

- [ ] fichiers GF modifiés listés ;
- [ ] générateurs/validateurs/données/docs listés ;
- [ ] campaign id et source universe id enregistrés.

## B. Provenance / données

- [ ] sources + hashes ;
- [ ] schémas valides ;
- [ ] observation vs inférence distinguées ;
- [ ] licence/rôle de chaque nouvelle source ;
- [ ] aucun candidat éligible dropped silencieusement.

## C. Lemgrammes

- [ ] active/C6/placeholders/stale/blockers avant/après ;
- [ ] exclusions ;
- [ ] renommages/suppressions/migrations expliqués ;
- [ ] table signatures calculées.

## D. Classes morphologiques

- [ ] `paradigm_id` pour toute entrée C2+ ;
- [ ] bulk classes P3 ;
- [ ] principal parts et cas négatifs documentés ;
- [ ] missing classes envoyées à la queue d'escalade.

## E. Invariants

- [ ] variants 0 ;
- [ ] duplications connues 0 ;
- [ ] multiwords non waivés 0 ;
- [ ] C6 sans provenance 0 ;
- [ ] placeholders C6 0 ;
- [ ] C6 stale 0 ;
- [ ] conflits matériels C6 0.

## F. Validation

- [ ] V01–V19 ;
- [ ] tables touchées introspectées ;
- [ ] evidence matching ;
- [ ] revue stratifiée lot massif ;
- [ ] GF 3.12 compile ;
- [ ] Wordbench 58/58 + 52/52 baseline ;
- [ ] golds sans régression ;
- [ ] double rebuild identique.

## G. Artifacts

- [ ] `MorphoDictSqiAbs.gf` / `MorphoDictSqi.gf` ;
- [ ] source lock/universe ;
- [ ] coverage + evidence + table signatures ;
- [ ] paradigm registry ;
- [ ] dependency graph ;
- [ ] metrics/queues/exclusions ;
- [ ] decisions ;
- [ ] logs/tests ;
- [ ] manifest de release.

## H. Formulation de certification

Toujours borner : « campagne X, source universe Y, N nouveaux C6, M blockers, P placeholders, GF/Wordbench/golds tels résultats ». Ne jamais écrire seulement « MorphoDict validé ».
