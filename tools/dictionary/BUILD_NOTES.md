# Build notes
Inputs:
1. `resources/dictionary/albanet_unique_pos_lemma_synset.tsv`
2. `resources/dictionary/tosk_function_words.tsv`
3. exact baseline `LexiconSqi.gf`

Rule: exact `LexiconSqi` linearizations override smart constructors for the same native lemma + GF category. Rich categories are never guessed from Albanet.
