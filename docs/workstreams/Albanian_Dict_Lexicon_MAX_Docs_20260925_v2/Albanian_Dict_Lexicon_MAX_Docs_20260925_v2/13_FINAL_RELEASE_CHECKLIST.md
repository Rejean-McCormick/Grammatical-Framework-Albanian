---
doc_id: DICTMAX-013
title: "Checklist de sortie — DictSqi + LexiconSqi MAX"
status: normative
date: 2026-09-25
spec_version: "2.0.0"
workstream: "Conversation 3 — DictSqi + LexiconSqi MAX"
baseline: "albanian-s02-green-20260925"
---

# Usage

Une réponse « oui » doit être démontrable par fichier, hash, test ou rapport. Toute case non démontrée reste ouverte.

## A. Source lock

- [ ] snapshot Albanian final hashé ;
- [ ] RGL snapshot/commit identifié ;
- [ ] GF 3.12 enregistré ;
- [ ] Wordbench 1.3.4 enregistré ;
- [ ] sources lexicales hashées ;
- [ ] références linguistiques enregistrées ;
- [ ] générateur/validateurs hashés.

## B. LexiconSqi

- [ ] 348/348 fonctions abstraites présentes ;
- [ ] 348/348 revues ;
- [ ] 0 placeholder ;
- [ ] catégories riches revues ;
- [ ] valence/gouvernement documentés ;
- [ ] irréguliers/principal parts vérifiés ;
- [ ] tests ciblés passent.

## C. DictSqi — données

- [ ] provenance 100 % ;
- [ ] IDs uniques et stables ;
- [ ] aucune suppression silencieuse ;
- [ ] corrections de type conservent provenance ;
- [ ] multiwords classifiés ;
- [ ] quarantaine explicite ;
- [ ] dialecte/période enregistrés lorsque pertinents.

## D. DictSqi — analyse

- [ ] aucune entrée certifiée avec `invariantN/A/V` de secours ;
- [ ] N2/N3 justifiés ;
- [ ] A2 justifiés ;
- [ ] V/V2/V3/VA/VS/VQ/VV/V2* justifiés ;
- [ ] prépositions/cas gouvernés documentés ;
- [ ] contrôle/complementation testés lorsque pertinents ;
- [ ] PN/fonctionnels suivent politique explicite.

## E. Échelle/maturité

- [ ] couverture lexicale à grande échelle ;
- [ ] trous majeurs par catégorie documentés ;
- [ ] comparaison English actualisée ;
- [ ] aucune « parité » revendiquée par simple nombre d’entrées ;
- [ ] distribution de catégories expliquée par l’albanais.

## F. Générateur

- [ ] aucun chemin machine-local hardcodé ;
- [ ] génération déterministe ;
- [ ] normalisation Unicode stable ;
- [ ] collisions déterministes/fail closed ;
- [ ] outputs portent source lock ;
- [ ] rebuild #1 = fichiers versionnés ;
- [ ] rebuild #2 byte-identique ;
- [ ] validateur statique strict passe.

## G. GF / Wordbench

- [ ] `DictSqi` ciblé compile GF 3.12 ;
- [ ] `LexiconSqi` compile ;
- [ ] 58/58 ;
- [ ] 52/52 ;
- [ ] aucun nouveau warning bloquant ;
- [ ] golds existants sans régression non revue.

## H. Certification linguistique

- [ ] 569 CASEs baseline revus selon campagne ;
- [ ] nouveaux frames couverts par scénarios ;
- [ ] golds nouveaux revus ;
- [ ] variantes distinguées des erreurs ;
- [ ] aucun output promu uniquement parce qu’il compile.

## I. Cross-workstream

- [ ] aucun hack de morphologie fondamentale ajouté dans Dict ;
- [ ] handoffs core résolus ou limitations explicitement exclues ;
- [ ] aucune activation globale de DRAFT-MAX ;
- [ ] intégration avec MorphoDict respecte la frontière de responsabilité.

## J. Documentation

- [ ] métriques finales mises à jour ;
- [ ] décisions à jour ;
- [ ] source lock final ;
- [ ] risques/limitations publiés ;
- [ ] instructions de rebuild/test publiées ;
- [ ] snapshot/overlay final reproductible.

## Verdict permis

Le workstream peut être appelé **DictSqi + LexiconSqi MAX final** seulement si A-J sont satisfaits ou si une case réellement non applicable est explicitement marquée N/A avec justification.

## K. Identité / ingestion / orthographe

- [ ] lemma/lexeme/sense/analysis/gf_id distingués ;
- [ ] merges/splits tracés ;
- [ ] 0 collision d'ID non résolue ;
- [ ] normalisation Unicode/orthographique conforme ;
- [ ] `ë/ç` et variantes conservés dans les données linguistiques ;
- [ ] toutes nouvelles sources passent le gate d'ingestion/licence.

## L. Couverture catégorielle

- [ ] 35/35 catégories du benchmark English ont un verdict documenté ;
- [ ] toute absence majeure est `justified`, `closed-class`, `not-applicable` ou `blocked` ;
- [ ] aucune catégorie riche n'est dégradée pour simplifier le générateur.

## M. QA / compatibilité / scale

- [ ] stratégie d'échantillonnage publiée ;
- [ ] adjudications fermées ou explicitement bloquantes ;
- [ ] `schema_version` et migrations validées ;
- [ ] IDs deprecated/split/merge documentés ;
- [ ] manifest SHA-256 de release complet ;
- [ ] baselines performance publiées ;
- [ ] aucune régression majeure inexpliquée de génération/compilation.

## Règle de complétude v2

A–M forment le gate final. Les sections K–M sont bloquantes pour toute revendication `MAX final` ou `English-parity lexical candidate`.
