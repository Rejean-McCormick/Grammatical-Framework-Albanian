# Authority, provenance and source-lock protocol

**Document status:** normative  
**Pack version:** 2.0

## 1. Authority order

When evidence conflicts, use this order:

1. exact abstract/API signatures from the **RGL revision actually used by the protected Albanian baseline**;
2. GF 3.12 compiler output and reproducible Wordbench evidence from the exact Albanian source state;
3. current Albanian source;
4. inherited/common/functor source actually used by Albanian;
5. accepted Albanian decisions and category contracts;
6. reviewed Albanian linguistic evidence and accepted golds;
7. architecture-compatible model-language evidence;
8. English implementation details as maturity/capability evidence;
9. comments and historical notes.

English is authoritative for **what mature coverage looks like**, not for Albanian word order, government, morphology or complement strategy.

## 2. Three locks that must not be conflated

### A. Package snapshot lock

The files used to generate this documentation are byte-locked:

| Source | SHA-256 |
|---|---|
| `Code_snapshot_Grammatical_Framework-Albanian(20260925-123255).zip` | `961852fae67f7e5878c7d214197a75a705e5028d7ee8e87974358a9d85c39829` |
| `gf-rgl-master.zip` | `e6491c23c440b4f18e59404908eeb71bfd3404745ad2634009b27bfbb19e8a4d` |
| `Code_snapshot_GF_RGL_AI_Compendium(4).zip` | `73849c9b2e74cd8fcaacb438663eee2c285f84872f46284543b165840ce79bfe` |
| `Code_snapshot_GF_Wordbench(20260925-123301).zip` | `1664b592c5cfca72131ba75124f3a6d51b39e2596ae4488aa70a55746245cfdd` |
| `Albanian_ref(20260925-125550).zip` | `15396c31106de2787ae844bb7013b77b4d1fe0b8a3b5e714fc7a9aeef23f1cfc` |

### B. Albanian integration source-lock

Protected baseline recorded by the project roadmap:

- tag/context: `albanian-s02-green-20260925`;
- Wordbench run: `20260925_112639`;
- source-lock SHA-256: `6834fc8975ce82a6c4984280bff1000dae644f134fec457996abb9f25888ef37`;
- GF: 3.12;
- Wordbench: 1.3.4;
- 58/58 targets;
- 52/52 required scenarios;
- zero structural lock warnings;
- linguistic certification not established.

This source-lock is a build-evidence identity. It is not interchangeable with the outer ZIP SHA-256.

### C. Active RGL revision lock

The supplied `gf-rgl-master.zip` has no `.git` metadata. The project roadmap mentions reference commit `bfc0a89f9912e5db7567c955e0114437643c6eeb`, but this pack does **not** assert byte identity between that commit and the supplied ZIP.

**Release-blocking action C9-DEC-001:** establish the exact RGL revision/search path used by the protected 58/58 baseline. Until then, signature-sensitive discrepancies such as `Documentation.InflectionCl` remain `version_blocked`, never silently patched.

## 3. Source-role rules

- **Common RGL abstract/API:** contract inventory and public surface.
- **English:** maturity benchmark and implementation comparison.
- **Current Albanian:** actual implementation state.
- **Albanian linguistic corpus:** realization and acceptability evidence.
- **Bulgarian/Macedonian/Romanian/Greek/etc.:** targeted typological architecture evidence only.
- **DRAFT-MAX:** idea reservoir only; never a bulk authority.

## 4. Dialect/source scope

Evidence must be labeled `standard_relevant`, `tosk`, `geg`, `cross_dialect`, or `uncertain`. Geg-only evidence cannot silently enter the standard/Tosk-oriented core. A dialect-specific capability requires an explicit scope decision.

## 5. Update rule

Every accepted code patch must record:

- base Albanian source-lock;
- active RGL revision identity;
- matrix row IDs changed;
- decision/evidence/test IDs touched;
- new Wordbench run/source-lock if full integration is executed.

A newer exact compiler run supersedes prose status claims for build facts. It does not automatically supersede accepted linguistic decisions.
