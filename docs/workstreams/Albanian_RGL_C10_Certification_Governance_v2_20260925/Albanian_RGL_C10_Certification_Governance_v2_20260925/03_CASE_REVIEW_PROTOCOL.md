---
document_role: case_review_protocol
status: normative
date: 2026-09-25
wordbench_response_schema: gf-wordbench-linguistic-review-response-v1
---

# Protocole de revue des CASEs

## 1. Unité de certification

Un CASE est une observation reproductible liée à :
- un run;
- un source-lock SHA-256;
- une version GF;
- une langue et une variété déclarée;
- un scénario;
- un hash de script;
- un hash de sortie normalisée.

Une revue d'un ancien hash ne certifie jamais automatiquement une nouvelle sortie.

## 2. Vocabulaire de verdict

Le vocabulaire Wordbench est normatif. La définition canonique locale est `16_NORMATIVE_VOCABULARY.md`; les rappels ci-dessous sont uniquement opérationnels :

### `valid`
Grammatical et naturel dans la variété déclarée, pour le contexte testé.

### `valid_variant`
Grammatical, mais marqué stylistiquement, dépendant du contexte, ou une variante acceptable parmi plusieurs.

### `questionable`
Preuve insuffisante ou incertitude matérielle. C'est bloquant.

### `invalid`
Morphologiquement, syntaxiquement, lexicalement ou normativement inacceptable pour la variété déclarée. C'est bloquant.

## 3. Confiance

Wordbench prévoit :
- `high`
- `medium`
- `low`

La policy actuelle a un plancher de promotion gold au moins `medium` par défaut. `low` n'est pas gold-éligible.

## 4. Procédure par CASE

Pour chaque sortie :

1. vérifier que l'identité du run et le hash correspondent;
2. identifier le phénomène principal et les phénomènes secondaires;
3. vérifier la variété cible;
4. évaluer morphologie, accord, gouvernement, ordre, clitiques, lexicalité et naturalité pertinents;
5. consulter une preuve spécifique lorsqu'une intuition seule n'est pas suffisante;
6. attribuer verdict + confiance;
7. fournir une justification courte mais falsifiable;
8. si `invalid` ou `questionable`, créer/rattacher une fiche de bug ou d'investigation;
9. ne jamais modifier le gold à cette étape.

## 5. Champs supplémentaires du ledger Conversation 10

En plus du schéma Wordbench, le ledger de travail doit conserver :

- `case_id`
- `campaign_id`
- `scenario_id`
- `phenomenon_primary`
- `phenomena_secondary`
- `category`
- `morphological_cells`
- `lexeme_or_function`
- `language_variety`
- `output_sha256`
- `verdict`
- `confidence`
- `rationale`
- `evidence_refs`
- `bug_id`
- `owner_conversation`
- `gold_eligible`
- `gold_promoted`
- `reviewed_at`
- `reviewer_identity`

Les champs ajoutés servent au tableau de bord; ils ne remplacent pas le contrat Wordbench.

## 6. Règles d'incertitude

Utiliser `questionable` lorsque :
- deux sources sérieuses divergent;
- la variété n'est pas claire;
- la construction exige un contexte absent;
- la sortie est possible mais la naturalité est douteuse;
- l'analyse dépend d'une valence lexicale non établie;
- la morphologie paraît plausible mais la cellule exacte n'est pas attestée.

Ne jamais convertir une incertitude en `valid_variant` uniquement pour augmenter le taux de réussite.

## 7. Revue AI vs certification humaine

Wordbench documente la revue ChatGPT comme **AI-reviewed linguistic validation**, pas comme certification humaine indépendante. Le paquet final doit donc distinguer :
- `AI-reviewed`;
- `human-reviewed`;
- `dual-reviewed` si les deux existent.

Le statut de maturité doit afficher la composition du corpus par type de revue.
