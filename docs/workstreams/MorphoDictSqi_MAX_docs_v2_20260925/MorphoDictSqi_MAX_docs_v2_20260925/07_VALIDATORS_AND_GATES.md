# Validateurs et gates MorphoDictSqi MAX

> **Projet :** Albanian RGL — Conversation 2 — MorphoDictSqi MAX  
> **Révision documentaire :** 2.0 — 2026-09-25  
> **Baseline mainteneur :** `albanian-s02-green-20260925`  
> **Toolchain cible :** GF 3.12 ; GF Wordbench 1.3.4  
> **Gate de non-régression :** baseline 58/58 cibles GF ; 52/52 scénarios ; aucun gold existant régressé.  
> **Règle fondamentale :** compiler n'est pas certifier linguistiquement.


## 1. Validateurs statiques / sémantiques

- **V01 Abstract/concrete bijection** — exactement un `lin` par `fun`.
- **V02 Identifiants uniques** — IDs et noms GF uniques/conformes.
- **V03 `variants` = 0** — source et génération.
- **V04 Provenance complète** — chaque actif a `source/evidence`.
- **V05 Placeholder firewall** — aucun placeholder C6.
- **V06 Multiword policy** — exception seulement via decision id.
- **V07 Category contract** — catégorie + collapse conformes.
- **V08 Duplicate lemgram/table** — selon `table_signature`.
- **V09 Valence leakage** — pas de `V2/N2/A2` morphologiques injustifiés.
- **V10 Category table completeness** — selon `16_CATEGORY_TABLE_CONTRACTS.md`.
- **V11 Smart-paradigm domain** — `paradigm_id` P3 et domaine satisfait.
- **V12 Evidence concordance** — C4+ conforme au mapping.
- **V13 Data schema validity** — records conformes à `15`.
- **V14 Feature-map validity** — aucun trait inventé/non mappé pour C4+.
- **V15 Paradigm registry integrity** — version/hash/domaine/tests présents.
- **V16 Dependency freshness** — aucun C6 `STALE_REVALIDATION`.
- **V17 Reproducible build** — double rebuild canonique identique.
- **V18 Source conflict gate** — aucun conflit matériel ouvert pour C6.
- **V19 Source-universe accounting** — chaque candidat éligible a un état, aucun drop silencieux.

## 2. Validation GF

Au minimum : `gf -make MorphoDictSqi.gf` sous GF 3.12, harness dédié, introspection des tables touchées, pas de nouveau warning structurel bloquant. Les logs sont référencés par campagne.

## 3. Golds morphologiques

Les golds stockent `lemgram_id`, feature path, forme attendue, evidence id et justification. Couvrir : classes N/A/V, irréguliers, homographes, alternances discriminantes, limites de smart dispatch et bugs historiques.

## 4. Gate global

- baseline 58/58 ;
- baseline 52/52 ;
- golds existants sans régression ;
- nouveaux tests verts ;
- V01–V19 applicables verts.

Si le profil officiel ajoute des scénarios, 52 reste un sous-ensemble obligatoire de régression.

## 5. Gate de lot massif

Pour tout lot >100 entrées :

1. validations automatiques sur **100 %** du lot ;
2. classe P3 avant promotion massive ;
3. toutes les entrées à risque élevé revues : irréguliers, homographes, conflits, normalisations non triviales, nouvelles classes ;
4. pour le reste, revue déterministe stratifiée par `category × paradigm_id × source_id` : `sample_size = min(N, max(10, ceil(sqrt(N))))` par strate, sélection par plus petit hash `SHA256(campaign_id + lemgram_id)` ;
5. aucun échec de l'échantillon ne peut être masqué : un échec morphologique suspend la strate jusqu'à analyse de cause.

Cette revue échantillonnée complète les contrôles automatiques ; elle ne remplace jamais V12.

## 6. Politique d'échec

- compile fail → diagnostic GF ;
- evidence mismatch → revue/classe ;
- missing paradigm → escalade ;
- source conflict → blocage ;
- insufficient evidence → blocage ;
- reproducibility fail → aucune release.
