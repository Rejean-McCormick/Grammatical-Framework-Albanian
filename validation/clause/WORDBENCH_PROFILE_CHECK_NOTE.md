# C7 Wordbench profile check note — 2026-09-25

## Result

GF Wordbench 1.3.4 was invoked with the supplied full RGL snapshot as the explicit
`--rgl-root` against both the untouched C7 input baseline and the C7 candidate.

Both checks return the same result:

```text
Validation profile contract is invalid: 18 error(s), 0 warning(s).
```

Every diagnostic is `Required active-project authority or validation guide is missing.`
The C7 candidate therefore introduces **no new Wordbench project-contract diagnostic**.

## Why this is not repaired in C7

The current Wordbench policy expects a larger project-documentation profile under
`docs/` and README files under `validation/gold`, `validation/inputs`, and
`validation/scenarios`. The supplied Albanian snapshot already lacks 18 of these
assets before the C7 patch. Adding placeholder authority documents merely to make
`project check` green would be unrelated scope and would create false authority.

C7 records the pre-existing profile-packaging limitation and leaves it for the
project/documentation owner. It does not treat this profile check as GF compiler
evidence.

## Compiler boundary

No GF executable is installed in this execution environment. Consequently this C7
delivery makes no fresh claim of 58/58 GF compilation or 52/52 scenario execution.
Those gates must be rerun with GF 3.12 in the maintainer environment.
