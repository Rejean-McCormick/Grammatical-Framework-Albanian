---
document_role: optimization_changelog
status: informative
version: 2.0
date: 2026-09-25
---

# Optimisation v2 — changements par rapport au paquet initial

## Problèmes corrigés

1. **Hiérarchie de preuve trop globale**  
   Remplacée par des hiérarchies par domaine : signatures, catégories, linguistique, surface et architecture.

2. **Définitions dupliquées**  
   Ajout de `16_NORMATIVE_VOCABULARY.md` et d'une single-source-of-truth map dans `00_START_HERE.md`.

3. **Absence de modèle grammatical explicite**  
   Ajout de `17_ALBANIAN_GRAMMATICAL_FEATURE_MODEL.md`, qui sépare représentation GF et cible linguistique.

4. **Absence de registre concret des paradigmes/cellules**  
   Ajout de `18_PARADIGM_AND_MORPHOLOGICAL_CELL_REGISTRY.md`.

5. **Parité English trop abstraite**  
   Ajout de `19_ENGLISH_REFERENCE_BASELINE.md`, lié au snapshot upstream fourni et aux compteurs Dict/MorphoDict vérifiables.

6. **Maturité non assez mesurable**  
   Ajout de `20_CERTIFICATION_THRESHOLDS_AND_LEVELS.md`; G1/G2/G3 et R0–R4 sont désormais séparés.

7. **Staleness insuffisamment formalisé**  
   Ajout de `21_TRACEABILITY_AND_STALENESS_MODEL.md`.

8. **Standard/Tosk/Geg insuffisamment gouvernés**  
   Ajout de `22_STANDARD_ALBANIAN_VARIETY_POLICY.md`.

9. **Absence de change control formel**  
   Ajout de `23_CHANGE_CONTROL_AND_DECISION_LOG.md`.

10. **Absence de linter conceptuel**  
    Ajout de `24_AUTOMATED_CONSISTENCY_CHECKS.md`.

11. **Routage 1–9 non résolu**  
    Ajout de `25_OWNER_ROUTING_REGISTRY.md` sans inventer les owners.

12. **Release packet non normalisé**  
    Ajout de `26_RELEASE_EVIDENCE_PACKET_TEMPLATE.md`.

13. **Dette réelle insuffisamment visible**  
    Ajout de `27_INITIAL_DEBT_AND_RISK_BASELINE.md`, notamment les 6 339 fallbacks Dict et 155 placeholders MorphoDict documentés dans le snapshot.

14. **Questions ouvertes risquant de disparaître**  
    Ajout de `28_OPEN_QUESTIONS_REGISTER.md`.

15. **AI review vs human certification**  
    Ajout de `29_REVIEWER_AND_HUMAN_CERTIFICATION_POLICY.md`.

16. **Contrôle qualité documentaire**  
    Ajout de `30_DOC_VALIDATION_REPORT.md`.

## Résultat

La v2 n'est plus seulement un ensemble de règles. Elle contient :

- une constitution;
- un modèle du domaine;
- un registre de dette;
- des seuils;
- une politique de variété;
- un modèle de traçabilité;
- un chemin précis jusqu'à la release.

La prochaine étape n'est plus d'ajouter des règles générales, mais de **remplir les artefacts vivants** : 569 CASEs, evidence records, golds, matrices de couverture et matrice English.
