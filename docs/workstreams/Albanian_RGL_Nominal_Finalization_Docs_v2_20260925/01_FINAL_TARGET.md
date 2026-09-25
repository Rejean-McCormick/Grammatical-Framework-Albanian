# Objectif final et définition de sortie

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

## 1. Objectif final

Construire une RGL albanaise nominale qui soit comparable à English RGL par :

- la couverture des catégories et fonctions abstraites communes ;
- une API `ParadigmsSqi` publique suffisamment expressive pour le lexique réel ;
- la composition sans hacks locaux entre morphologie, accord et syntaxe ;
- la profondeur des tests morphologiques et syntaxiques ;
- la capacité à soutenir `LexiconSqi`, `DictSqi` et `MorphoDictSqi` sans records ad hoc ;
- la traçabilité des décisions et la stabilité de régression.

La parité **ne signifie pas** copier les représentations internes d’English. English est le benchmark de couverture/API/maturité. La grammaire albanaise est définie par les références albanaises et par les preuves de génération/usage.

## 2. Contenu du système nominal final

Le système final comprend au minimum :

### Morphologie nominale

- noms masculins et féminins ;
- noms ambigénériques lorsque le genre varie avec le nombre ;
- singulier/pluriel ;
- indéfini/défini ;
- nominatif, accusatif, génitif, datif, ablatif comme **distinctions grammaticales** même lorsque des formes sont syncrétiques ;
- pluriels réguliers, classes productives et irréguliers ;
- API de paradigmes à principal parts suffisantes pour ne pas forcer de placeholders.

### Adjectifs et AP

- adjectifs articulés et non articulés ;
- formes lexicales de genre/nombre ;
- sélection centralisée de la *nyje* selon le contexte ;
- attributif, prédicatif/AP, A2 et compléments ;
- comparaison et superlatif selon analyse albanaise validée ;
- ordinaux adjectivaux.

### Syntaxe nominale

- `N`, `N2`, `N3`, `CN`, `NP`, `Pron`, `PN`, `GN`, `LN`, `SN` ;
- `Det`, `Quant`, `Num`, `Card`, `Ord`, `DAP`, `IDet`, `IQuant`, `IP`, `RP` ;
- articles/définitude, démonstratifs, quantification, possession ;
- génitif avec *nyje* ;
- partitif ;
- adjectifs, relatives, adverbes et apposition dans CN/NP ;
- agreement nominal transmis jusqu’aux consommateurs finaux ;
- coordination nominale et relatives sans perte d’accord.

### Numéraux

- cardinaux productifs ;
- ordinaux ;
- digits et décimaux ;
- effet du numéral sur nombre, forme nominale, cas et accord **uniquement si attesté** ;
- aucune récupération de classe grammaticale depuis la chaîne rendue.

### Noms propres

- noms de personne et catégories `Names` ;
- cas et accord conservés ;
- surnoms/noms de famille et noms locatifs selon le contrat RGL ;
- flexion propre à l’albanais lorsqu’elle est attestée.

## 3. Définition de « terminé »

Le chantier nominal n’est terminé que si les conditions suivantes sont simultanément vraies :

1. **Couverture RGL** — aucune fonction nominale commune importante n’est absente sans justification `N/A`.
2. **Représentation** — toutes les distinctions nécessaires survivent jusqu’à leur dernier consommateur.
3. **Morphologie** — toutes les cellules importantes des paradigmes représentatifs peuvent être générées par les constructeurs centraux.
4. **Composition** — les sorties correctes ne dépendent pas de concaténations ponctuelles propres à un seul lexical item.
5. **Paradigms API** — les classes productives et principaux irréguliers sont constructibles via une API publique documentée.
6. **Dict/MorphoDict** — aucun nouveau placeholder n’est utilisé pour masquer une faiblesse du core ; les placeholders existants diminuent au fur et à mesure que des paradigmes certifiés deviennent disponibles.
7. **Tests** — les tables morphologiques, constructions syntaxiques et interactions critiques sont testées.
8. **Gates** — la baseline ne régresse pas : au minimum 58/58 + 52/52, ou un census/scenario count intentionnellement augmenté et entièrement vert.
9. **Gold** — les sorties promues en gold ont été revues linguistiquement ; une sortie compilée n’est jamais auto-promue.
10. **Documentation** — code, décisions, preuves, tests et état sont réconciliés.

## 4. Non-objectifs

- reproduire les types internes d’English par esthétique ;
- activer DRAFT-MAX en bloc ;
- ajouter des dimensions de table sans consommateur identifié ;
- maintenir un gold incorrect pour protéger une ancienne sortie ;
- traiter Tosk/Geg comme interchangeables sans décision de portée explicite ;
- considérer les 6 720 fonctions de `DictSqi` ou les 592 lemgrammes de `MorphoDictSqi` comme linguistiquement certifiés par leur seule présence.
