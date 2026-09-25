---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 13 — Frontières avec les autres workstreams

## C5 possède

- sémantique et représentation des capacités fortes/faibles de `Pron/NP`;
- rôles Acc/Dat/Refl dans le `CliticCluster`;
- flattening/fusion des clitiques argumentaux;
- contraction de `të` avec le cluster;
- distinction syntaxique des cas nécessaire au gouvernement;
- `Prep/Compl` et registre de gouvernement;
- interaction de ces informations avec `Question/Relative/Slash`;
- table `cili`/démonstratifs/pronoms dans la mesure où elle sert ces contrats.

## C5 dépend de mais ne possède pas

| Domaine | Propriétaire externe | Interface C5 |
|---|---|---|
| paradigmes verbaux, formes TAM | workstream morphologie/verb/TAM | C5 reçoit une forme/hôte verbal structuré |
| non-actif/voix et choix `kam/jam` | workstream voix/TAM | `VoiceMarker/VoiceContext`, jamais injecté comme Refl |
| morphologie nominale générale | workstream nom/morphologie | C5 demande une forme pour SyntaxCase / mapping MorphCase |
| nyje adjectival général | workstream nominal/adjectival | C5 possède seulement exigences génitives pertinentes |
| lexique `DictSqi` | workstream lexique | aucune mutation pour contourner un bug C5 |
| `MorphoDictSqi` | workstream morphodict | aucune entrée modifiée pour simuler syntaxe C5 |
| Extend au-delà des contextes C5 | workstream Extend | utilise les services C5, ne les redéfinit pas |

## Règles de conflit

1. C5 ne modifie pas la conjugaison d'un verbe pour obtenir un meilleur placement clitique.
2. Le workstream voix ne réutilise pas `CliticCluster.refl` comme stockage du non-actif.
3. Le workstream nominal ne remplace pas `Gen` par `Dat` sans passer par le mapping de syncrétisme accepté.
4. Les autres conversations ne doivent pas recréer `flattenClitics` localement.
5. Si une exigence traverse deux propriétaires, créer une interface et un test d'intégration; ne déplacer l'ownership qu'avec décision enregistrée.
