---
document_set: Albanian RGL Conversation 5 - Clitics Pronouns Cases Prepositions
spec_version: "2.0.0"
date: 2026-09-25
baseline: albanian-s02-green-20260925
gf: "3.12"
wordbench: "1.3.4"
lifecycle: IMPLEMENTABLE
---

# 10 — Questions ouvertes

Chaque question a un niveau. Une question `BLOCKING` doit être résolue avant la phase indiquée.

| ID | Question | Niveau | Bloque | Preuve requise |
|---|---|---|---|---|
| OQ-C5-CASE-001 | `Case` 5-valeurs partout ou séparation SyntaxCase/MorphCase ? | BLOCKING | P5 | spike GF 3.12 + impact tables/consommateurs |
| OQ-C5-VOICE-001 | interface exacte entre cluster argumental et `u` non-actif | BLOCKING pour certification voice contexts | P8/P10 | Lesson40 + code voix/TAM + tests |
| OQ-C5-PREP-001 | lexicalisation/gouvernement exacts de `from_Prep` vs `by8agent_Prep` | BLOCKING | P6 | référence + exemples sémantiques Standard |
| OQ-C5-REL-001 | stratégie canonique `që` vs `cili` constructeur par constructeur | BLOCKING | P7 | références/corpus + API Relative |
| OQ-C5-PROG-001 | ordre exact `po` avec Acc/Dat/double/negation | MAJOR | P8 certification | exemples Standard ciblés |
| OQ-C5-IMP-001 | exposer enclise impérative dans core ou Extra ? | MAJOR | certification impératif exhaustif | architecture segmentation + besoin API |
| OQ-C5-DO-001 | DO doubling canonique de la RGL | MAJOR | gold final objet direct overt | politique de registre/corpus |
| OQ-C5-POSS-001 | compat `possess_Prep` vs `PossNP` sans duplication du génitif | MAJOR | P6/P7 | abstract + tests possession |
| OQ-C5-NEG-001 | `nuk` seul canonique ou variante `s'` exposée ? | ADVISORY | aucune phase core | politique variantes |
| OQ-C5-PDF-001 | quelles règles supplémentaires proviennent de `Albanian.pdf` ? | ADVISORY | nouvelles règles seulement | extraction ciblée avec localisation |
| OQ-C5-INT-001 | paradigme complet des interrogatifs personnels (`kush/kë/...`) | MAJOR | certification interrogatifs | référence explicite cellule par cellule |

Une question OPEN ne peut pas être « résolue » seulement parce qu'un patch compile.
