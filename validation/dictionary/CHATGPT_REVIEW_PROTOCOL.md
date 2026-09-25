# ChatGPT dictionary review protocol

Review queue: `CHATGPT_REVIEW_QUEUE.tsv`

Tiers:
- T1_exact_baseline: 337 — exact reuse of the green LexiconSqi; verify linguistic output, not compilation shape.
- T2_single_lemma_import: 4545 — Albanet/reference single-token entries using smart paradigms.
- T3_high_risk_import: 1838 — multiword/punctuation entries; review before any gold promotion.

For each entry classify: `valid`, `valid_variant`, `questionable`, or `invalid`, with a short reason. Only `valid`/`valid_variant` at sufficient confidence can be promoted to gold.
