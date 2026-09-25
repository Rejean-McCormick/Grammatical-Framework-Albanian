# Change checklist — merge gate

Copier ce bloc dans chaque livraison.

```text
[ ] SOURCE_LOCK correspond au patch
[ ] DECISION-ID existe
[ ] claim linguistique localisé / ou changement purement mécanique
[ ] producer/consumer impact audité
[ ] aucune principal part ignorée
[ ] aucun nouveau invariant* sans waiver
[ ] aucun nouvel appel mkN###/mkA###/mkV### hors zones autorisées
[ ] positive table tests
[ ] negative guard tests
[ ] syntax consumer test si sélection de forme affectée
[ ] API compatibility évaluée
[ ] performance évaluée si refactor massif
[ ] GF 3.12 targeted compile
[ ] Wordbench 58/58 + 52/52 (ou census intentional supérieur)
[ ] gold diff revu
[ ] placeholders removed/remaining comptés
[ ] docs/ledger mis à jour
[ ] generated inventories régénérés
[ ] rollback documenté
```

Aucune case liée à une preuve non exécutée ne doit être cochée “par intention”.
