# Authority, evidence and model-language policy

## Authority by claim type

### RGL/API claim
1. exact abstract/API source in supplied `gf-rgl-master.zip`;
2. compiler behavior under the locked GF/RGL environment;
3. Compendium contract indexes.

### Current Albanian implementation claim
1. current Albanian snapshot;
2. exact current Wordbench evidence;
3. historical snapshots only as regression history.

### Albanian linguistic claim
1. supplied Albanian reference evidence with exact locator;
2. additional Albanian scholarly evidence supplied/approved later;
3. current Albanian source only as implementation evidence, never proof of correctness;
4. model languages only as architecture/comparison evidence.

## Model-language rule

English answers **what public coverage exists**. It does not answer how Albanian realizes it.

Balkan/Romance/model sources may answer **how another implementation preserves a comparable distinction**, but a copied decision is forbidden unless Albanian evidence independently licenses the behavior.

## Evidence record minimum

Every linguistic decision must contain:

```yaml
evidence_id: E-C8-...
phenomenon: ...
source_file: ...
locator: page/section/example or exact searchable phrase
dialect_scope: Standard/Tosk/Geg/unclear
claim: ...
implementation_consequence: ...
confidence: high|medium|low
status: accepted|provisional|quarantined
```

## Supplied linguistic package

`Albanian_ref(10).zip` contains a 66-page PDF reference plus Standard/Tosk/Geg lessons, grammar, glossaries and dictionaries. This v2 uses exact PDF page/phrase locators for the high-impact complement/clitic/coordination claims and leaves unsupported secondary-predication/coordination-agreement claims open.
