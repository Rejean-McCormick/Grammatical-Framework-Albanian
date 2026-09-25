# Source-lock, baseline et autorité

## 1. Sources fournies

| Source | SHA-256 | Rôle |
|---|---|---|
| Albanian working snapshot | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` | source cible courant fourni |
| Supplied full RGL snapshot | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` | abstracts/API/upstream/model languages |
| GF RGL AI Compendium | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` | workflows, contracts, patterns, gates |
| Compendium alignment copy `DocGF-Compendium(4).zip` | `c635c426af5f16efbf798cc7ee87c2976247f08944385191a22c826e22b38ef7` | référence normative utilisée pour l’audit de conformité v2 |
| GF Wordbench | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` | validation infrastructure |
| Albanian linguistic references | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` | autorité linguistique cible fournie |
| 10 workstream documentation bundle | `5402dfc63c1f2e20331e38208b9b2168d93814b54ee3423d9817ad2c65149da6` | specs spécialisées |
| historical project docs bundle | `04d08549d326581e26d8888ede169d2dc9e639aaeb905168d8a4f51feb96a0c0` | historique, rapports, preuves de runs |

Le `gf-rgl-master.zip` fourni ne contient pas de metadata Git ; son hash d'archive est donc l'identité de la baseline amont fournie, pas un commit upstream revendiqué.

## 2. Deux baselines qui ne doivent plus être confondues

### DECLARED_BASELINE
Valeurs fournies par le mainteneur : `albanian-s02-green-20260925`, 58/58 + 52/52.

### EVIDENCE_BACKED_RUN dans le snapshot archivé
Le dernier rapport Wordbench archivé `WORDBENCH_RUN_20260925_032810_FIX.md` observe :

- 58 cibles recensées ;
- 56/58 acceptées en strict ;
- 52/52 scénarios OK ;
- les 2 blockers restants sont des warnings de lock sur helpers invariants ;
- un correctif lock-safe est présent ;
- un nouveau run GF 3.12 externe est encore requis pour établir 58/58 sur ce source family.

**Décision globale :** la baseline déclarée reste l'ancre de non-régression du projet, mais aucun document ne doit citer le snapshot fourni comme preuve du run 58/58 final tant que son artifact n'est pas archivé.

## 3. Autorité et provenance — conforme au Compendium

### Hiérarchie générale

Sauf règle de domaine ci-dessous :

1. déclaration abstraite/type exacte courante ;
2. source cible Albanian exact ;
3. source héritée/functor/resource/family exacte ;
4. résultat compiler enregistré pour le même source-lock ;
5. décisions architecture/linguistiques Albanian acceptées ;
6. résultat regression/gold enregistré pour le même source-lock ;
7. contrats générés liés aux mêmes hashes ;
8. preuve linguistique Albanian autoritative ;
9. source d'une langue modèle compatible architecturalement ;
10. documentation officielle de la même version GF/RGL ;
11. commentaires/historique ;
12. inférence IA.

Une source de rang inférieur peut expliquer, jamais remplacer silencieusement, une source de rang supérieur.

### Signatures abstraites et ownership

`abstract .gf exact -> module/inheritance exact -> compiler diagnostics -> generated indexes -> documentation`.

### Représentation concrète d'une catégorie

`CatSqi exact -> ResSqi exact -> producers/consumers target -> contrat accepté -> compiler -> modèle compatible`.

### Faits linguistiques

`preuve Albanian acceptée -> décision Albanian acceptée -> exemples/golds vérifiés -> source Albanian si linguistiquement revue -> comparaison cross-language -> inférence`.

**Compiler success n'est jamais une preuve linguistique.**

### Réalisation de surface

`exemples Albanian vérifiés -> gold morphology/syntax -> décisions acceptées -> implémentation courante -> modèles compatibles -> attente linguistique générale`.

### Choix d'architecture

`besoins catégories/consumers -> décisions architecture -> preuve Albanian -> implémentation courante -> mesures compiler/complexité -> patterns applicables -> modèles compatibles -> généalogie`.

### Classes de preuve obligatoires

`normative`, `source_fact`, `compiler_fact`, `test_fact`, `linguistic_evidence`, `accepted_decision`, `generated_fact`, `inference`, `provisional`, `rejected`, `stale`.

Toute claim durable doit être atomique et porter source, locator, hash/version, scope, status et confidence.

## 4. Rebase rule

Toute nouvelle archive source crée un nouveau source-lock. Les facts générés, golds dépendants, matrices de parity et statuts de certification doivent être marqués `stale` jusqu'à revalidation lorsque leur dépendance change.
