# Baseline Evidence Lock — Conversation 7 v2

## 1. Declared integration floor

Project context and the current roadmap define:

- GF: `3.12`;
- Wordbench: `1.3.4`;
- expected census: `58 = 51 language + 5 API facades + 2 MorphoDict`;
- documented run: `20260925_112639`;
- GF files OK: `58/58`;
- scenarios OK: `52/52`;
- lock warnings: `0`;
- source-lock SHA-256: `6834fc8975ce82a6c4984280bff1000dae644f134fec457996abb9f25888ef37`;
- declared baseline/tag: `albanian-s02-green-20260925`;
- linguistic certification: not established.

## 2. Evidence caveat

The supplied source snapshot contains the roadmap recording that run, but this documentation package does **not** contain the raw Wordbench run directory/summary artifact for `20260925_112639`. Therefore:

- the baseline is valid project-provided coordination evidence;
- this package does not invent hashes for missing raw run artifacts;
- when raw run evidence is supplied, add its hashes here before using it as a cryptographic regression lock.

## 3. Current source package lock

- Albanian ZIP SHA-256: `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829`.
- RGL ZIP SHA-256: `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d`.
- Albanian reference ZIP SHA-256: `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc`.

## 4. What every clause patch must re-prove

### Structural

- all modified modules compile;
- no new structural lock warnings;
- full census does not regress below the intended target;
- API facades, Dict and MorphoDict remain in the census.

### Scenario

- existing required scenario set remains present;
- `52/52` (or intentionally enlarged set) executes successfully;
- changed outputs are identified, not hidden in an aggregate pass count.

### Linguistic

- changed behavior has evidence/decision status;
- accepted golds do not regress unless corrected with evidence;
- new alternatives do not silently expand ambiguity.

## 5. Overlay/branch handoff envelope

```text
WORKSTREAM: C07 clause syntax
BASELINE TAG (declared): albanian-s02-green-20260925
BASE SOURCE LOCK: ...
FILES CHANGED: ...
GF 3.12 FOCUSED COMPILE: ...
WORDBENCH CENSUS: ...
WORDBENCH SCENARIOS: ...
LOCK WARNINGS: ...
CASE OUTPUTS CHANGED: ...
GOLDS ADDED/CHANGED: ...
OPEN DECISIONS CLOSED: ...
OPEN DECISIONS REMAINING: ...
PARSE/AMBIGUITY IMPACT: ...
CROSS-WORKSTREAM DEPENDENCIES: ...
ROLLBACK/OVERLAY: ...
```

## 6. Baseline mutation rule

Do not rewrite this file to make a failing candidate look like the baseline. A new accepted baseline is appended/versioned only after integration evidence passes and the project deliberately promotes it.
