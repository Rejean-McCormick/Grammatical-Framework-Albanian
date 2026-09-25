# Albanian RGL — documentation totale canonique

**Date de consolidation :** 2026-09-25  
**Statut :** constitution globale + router canonique + conformité Compendium  
**Cible :** Resource Grammar Library albanaise (`Sqi`) de maturité fonctionnelle comparable à English RGL, avec analyses linguistiques proprement albanaises.

## 1. Pourquoi ce dossier existe

Les dix workstreams ont produit des spécifications riches mais partiellement redondantes. Ce dossier les consolide sous une seule hiérarchie de vérité afin d'empêcher :

- les divergences de vocabulaire de statut ;
- les migrations incompatibles de `ResSqi` ;
- les décisions différentes sur `Case`, genre, *nyje*, voix, clitiques ou TAM ;
- la confusion entre baseline déclarée et preuve de run archivée ;
- la promotion d'une sortie compilante au rang de fait linguistique ;
- la duplication d'une règle entre plusieurs conversations.

## 2. Hiérarchie globale

1. **Constitution et vocabulaire** — `01_GLOBAL_CONSTITUTION.md`.
2. **Source-lock et baseline** — `02_SOURCE_LOCK_AND_BASELINE.md`.
3. **Produit final / DoD** — `03_FINAL_PRODUCT_AND_DEFINITION_OF_DONE.md`.
4. **Ownership** — `04_WORKSTREAM_OWNERSHIP.md`.
5. **Architecture globale** — `05_GLOBAL_ARCHITECTURE.md`.
6. **Modèle grammatical cible** — `06_ALBANIAN_GRAMMATICAL_FEATURE_MODEL.md`.
7. **Sous-systèmes** — `07` à `16`.
8. **Validation / preuve / gold** — `17` et `18`.
9. **Décisions et questions ouvertes** — `19` et `20`.
10. **Roadmap / release / change control** — `21`, `22`, `25`.
11. **Rapport de consolidation** — `23_ALIGNMENT_REPORT.md`.
12. **Disposition des anciennes docs** — `24_LEGACY_DOC_DISPOSITION.md`.
13. **Conformité Compendium / routing** — `27_COMPENDIUM_COMPLIANCE_AND_ROUTING.md`.
14. **État S00–S11 et blockers** — `28_DEVELOPMENT_STATE_MAP.md`.

## 3. Baseline de coordination

La baseline déclarée par le mainteneur reste :

- GF 3.12 ;
- Wordbench 1.3.4 avec découverte native `src/morphodict` ;
- census attendu 58/58 = 51 language + 5 API facades + 2 MorphoDict ;
- scénarios 52/52 ;
- label `albanian-s02-green-20260925` ;
- `DictSqi` : 6 720 fonctions ;
- `MorphoDictSqi` : 592 lemgrammes ;
- 569 CASEs reviewables.

**Important :** ce label est une baseline de coordination fournie par le mainteneur. Le dernier run externe archivé dans le snapshot fourni est encore 56/58 strict + 52/52, suivi d'un correctif lock-safe nécessitant un rerun. La doc totale distingue donc toujours `DECLARED_BASELINE` et `EVIDENCE_BACKED_RUN`.

## 4. Cible finale

La cible n'est pas « English traduit ». Elle est :

> une RGL albanaise dont la couverture publique, l'ergonomie des paradigmes, la profondeur lexicale, la compositionalité, la traçabilité, les tests et la maintenabilité sont comparables à English, tandis que les formes et analyses sont gouvernées par les preuves albanaises.

La release de maturité maximale vise un état de type **R4 candidate**, avec couverture common-RGL entièrement disposée, golds larges, dette bornée et niveau de reviewer explicitement qualifié.

**R4 n'est pas un état Compendium.** La maturité Albanian `R0–R4` et l'état procédural Compendium `S00–S11` sont deux axes indépendants. Une release candidate exige à la fois la maturité Albanian requise **et** le passage au moins à `S10 RELEASE_CANDIDATE` via `testing/RELEASE_GATE.yaml`.

## 5. Règle d'usage

Pour toute modification :

`task header -> route Compendium -> source-lock -> contrats/signatures exacts -> owner workstream -> preuve/décision -> patch envelope -> patch minimal -> compile local -> tests locaux -> full regression -> réconciliation`.

Le **Mandatory Task Header** et le routeur R01–R14 de `27_COMPENDIUM_COMPLIANCE_AND_ROUTING.md` sont obligatoires avant édition. Chaque patch suit le microcycle `W00–W08` du Compendium.

Les workstream packs et anciennes docs sont conservés dans ce bundle comme sources détaillées et historiques. En cas de conflit de gouvernance, **la couche `canonical/` prévaut** ; pour un fait de code, le **source exact** prévaut ; pour un fait linguistique, la **preuve albanaise précisément localisée** prévaut.
