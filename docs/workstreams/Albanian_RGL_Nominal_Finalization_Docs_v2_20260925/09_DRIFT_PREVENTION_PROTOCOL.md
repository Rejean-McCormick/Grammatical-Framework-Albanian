# Protocole anti-drift obligatoire

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

## 1. Avant tout patch

Répondre explicitement à :

```text
BASELINE / SOURCE LOCK:
PROBLÈME OU CAPACITÉ:
FAIT LINGUISTIQUE QUI LE JUSTIFIE:
ABSTRACT SIGNATURE:
CAT/RES CONTRACT ACTUEL:
PRODUCTEUR DE L’INFO:
PORTEURS INTERMÉDIAIRES:
DERNIER CONSOMMATEUR:
TEST QUI ÉCHOUE / MANQUE:
FICHIERS AUTORISÉS:
```

Si l’un de ces champs est inconnu pour une modification de représentation, le patch est bloqué ou limité à la collecte de preuve/tests.

## 2. Interdictions

- déduire genre/cas/classe depuis une `Str` lorsque l’information pouvait être typée ;
- ajouter un champ sans consommateur identifié ;
- supprimer/écraser une dimension avant inspection de tous les consommateurs ;
- corriger une sortie finale par concaténation locale si le défaut vient de la morphologie/accord ;
- copier un pattern English/Romanian/etc. sans prouver la compatibilité ;
- faire d’un résultat du compilateur une preuve linguistique ;
- promouvoir automatiquement un output généré en gold ;
- activer un overlay DRAFT-MAX complet ;
- modifier `DictSqi`/`MorphoDictSqi` pour contourner un manque du core nominal ;
- introduire un nouveau placeholder compile-safe en remplacement d’un paradigme réalisable.

## 3. Invariants à vérifier après chaque changement

### I1 — Cas

`Gen` reste distinct de `Dat` comme contexte même si des formes sont identiques.

### I2 — Genre/nombre

Aucun chemin d’accord ne transforme un pluriel en genre indéterminé avant le dernier consommateur pertinent.

### I3 — *Nyje*

Une seule politique centrale détermine `i/e/të/së` ; les consommateurs ne réimplémentent pas la matrice.

### I4 — Adjectifs

Le radical adjectival n’acquiert pas de pseudo-flexion casuelle parce que la *nyje* varie.

### I5 — Possession

Le possesseur et le possédé restent séparés ; le placement/définitude est calculé au bon niveau.

### I6 — Numéraux

Aucune règle de gouvernement ne lit les chiffres/terminaisons à partir du texte rendu.

### I7 — Proper names

Un constructeur invariant n’est pas confondu avec une affirmation d’invariabilité linguistique.

### I8 — Baseline

58/58 + 52/52 (ou une baseline intentionnellement élargie) reste récupérable.

## 4. Réconciliation obligatoire après patch

Mettre à jour ou vérifier :

- source GF ;
- tests ciblés ;
- scénarios Wordbench ;
- golds affectés ;
- décisions ;
- questions ouvertes ;
- matrice de traçabilité ;
- parity/status roadmap si le niveau de maturité change ;
- source lock/hash si un artifact d’intégration est produit.

Un patch qui compile mais laisse ces éléments contradictoires est **incomplet**.

## 5. Test de drift documentaire

Avant une nouvelle session de travail, comparer les affirmations suivantes au code :

- nombre de valeurs de `Case` ;
- type de `GenNum` ;
- type de `Noun.g` ;
- type de `Adj.s` ;
- champs de `Det`, `Quant`, `NP`, `PN` ;
- comportement de `PossNP` ;
- signature des principaux `mkN/mkA/mkPN` ;
- counts Wordbench/census/scénarios.

Si le code diffère, marquer le document `STALE` avant de raisonner à partir de lui.

## 6. Regeneration gates v2

Après modification du RGL source ou des scénarios, régénérer `12`, `13`, `14`, `18`, `19` selon leur trigger. Un hash changé sans régénération marque le paquet documentaire `STALE`.
