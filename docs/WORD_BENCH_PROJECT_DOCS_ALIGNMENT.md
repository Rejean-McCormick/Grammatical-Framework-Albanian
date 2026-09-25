# GF Wordbench 1.3.4 project-document alignment

The rigid active-project asset names required by GF Wordbench 1.3.4 are implemented as thin routing documents in `docs/` and `validation/`.

The consolidated project doctrine itself is imported once under `docs/canonical/`. This avoids maintaining multiple competing copies of the same normative content while satisfying Wordbench's filesystem contract.

The source archive lock for the imported canonical documentation is recorded in `docs/canonical/CANONICAL_SOURCE_LOCK.txt`.
