# Albanian RGL — Total Documentation 2026-09-25

Ce bundle consolide :

- les **10 workstreams** spécialisés ;
- les **55 fichiers** du dossier historique `docs/` fourni ;
- une couche `canonical/` qui résout les non-alignements, sert de routeur global et applique désormais explicitement la state machine / patch protocol / release gate du GF RGL AI Compendium.

Commencer par [`canonical/00_START_HERE.md`](canonical/00_START_HERE.md), puis [`canonical/27_COMPENDIUM_COMPLIANCE_AND_ROUTING.md`](canonical/27_COMPENDIUM_COMPLIANCE_AND_ROUTING.md) et [`canonical/28_DEVELOPMENT_STATE_MAP.md`](canonical/28_DEVELOPMENT_STATE_MAP.md). Lire ensuite [`canonical/23_ALIGNMENT_REPORT.md`](canonical/23_ALIGNMENT_REPORT.md) pour les divergences et arbitrages.

La consolidation ne prétend pas que les décisions TARGET sont déjà implémentées ou linguistiquement goldées. Elle fixe l'architecture et la gouvernance optimales ; l'implémentation doit suivre les gates.


**Version v2 Compendium-aligned :** R0–R4 (maturité Albanian) est désormais strictement séparé de S00–S11 (state Compendium), W00–W08 (microcycle) et RG-* (release requirements).
