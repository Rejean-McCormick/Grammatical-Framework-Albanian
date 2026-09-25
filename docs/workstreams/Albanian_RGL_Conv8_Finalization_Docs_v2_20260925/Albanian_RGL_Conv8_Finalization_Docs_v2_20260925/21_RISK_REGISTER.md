# Risk register

| ID | risk | severity | failure mode | mitigation |
| --- | --- | --- | --- | --- |
| R-C8-01 | V2A agreement uses subject channel | high | wrong secondary predicate morphology | E-C8-011 + independent evidence; controller-aware patch |
| R-C8-02 | VV/V2V controller absent | high | incorrect embedded agreement/control | lexical evidence + minimal controller metadata if needed |
| R-C8-03 | VS/V2S hard-coded që | medium-high | wrong complementizer selection | lexical evidence; defer selection |
| R-C8-04 | ConjNP hard-coded P3 plural | high | wrong coordinated-subject agreement | agreement evidence before resolver |
| R-C8-05 | ConjCN gender copied | medium-high | downstream gender mismatch | evidence-backed resolution or representation change |
| R-C8-06 | Construction literals | medium | surface plausibility hides non-compositional grammar | classify/rebuild on core |
| R-C8-07 | Parallel shared-type edits | high | cross-conversation breakage | ownership lock + migration protocol |
| R-C8-08 | Dict over-promotion | high | false valence claims at scale | evidence-backed batches only |
| R-C8-09 | No current gold corpus | medium | scenario green mistaken for linguistic regression proof | build reviewed C8 golds |
| R-C8-10 | Terminology: Tosk infinitive | medium | wrong RGL category mapping | preserve source distinction; model actual forms |
