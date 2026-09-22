# Albanian RGL — Upgrade Implementation 2026-09-22

**Status:** implementation candidate complete; static gate PASS; GF 3.12 compiler acceptance pending  
**Source basis:** snapshot generated 2026-09-22 08:35:27  
**Target compiler:** GF 3.12  
**Target census:** 49 language modules + 5 public API facades = 54 GF files

---

## 1. Purpose

This note records what was actually implemented for the upgrade specified in
`ALBANIAN_NEXT_UPGRADE_20260922.md`. It deliberately separates source/static
facts from compiler evidence. The latest external GF run remains
`20260922_123316`; it predates this implementation and therefore cannot be used
as proof that this candidate compiles.

## 2. U1 implemented — overload hardening

`ParadigmsSqi.gf` no longer implements the audited public overload families by
calling the same overloaded public name from one of its own branches.
Construction now passes through uniquely named, explicitly typed helpers:

```text
mkN2Core
mkA2Core
mkV2Core
mkVVCore
mkVSCore
mkVQCore
mkVACore
mkV2VCore
mkV2SCore
mkV2QCore
mkV2ACore
mkV3Core
```

The preserved public overload families are:

```text
mkN2 mkA2 mkV2 mkVV mkVS mkVQ mkVA
mkV2V mkV2S mkV2Q mkV2A mkV3
```

The static validator confirms that all twelve public overload blocks are
present and that no branch in those blocks self-dispatches through the same
public overload name.

## 3. U3 implemented structurally — category-shape preservation

The previous warning frontier implicated `NP`, `VP`, and `VPSlash` category
shape. This candidate does not fabricate `lock_*` fields locally.

Instead:

- `ResSqi` now owns structural `VP` and `VPSlash` resource types;
- `CatSqi` aliases its public linearization categories to `ResSqi.VP` and
  `ResSqi.VPSlash`;
- `ClauseSqiRes` constructs and transforms the resource types directly and no
  longer opens `CatSqi` merely to obtain those structures;
- `AdverbSqi` removes the `NP`-typed helper coercions that rebuilt a locked
  category as a resource helper result and accesses the required NP surface
  field directly in the concrete linearization.

This follows the standard RGL architectural pattern in which category lincats
alias resource-owned structures rather than duplicating their shape.

**Acceptance boundary:** the static shape is verified. Elimination of all
`missing lock field lock_*` warnings requires the GF 3.12 compiler gate.

## 4. U4 implemented — complete census validator

`validate_albanian_upgrade.py` is included at repository root. Its static gate
requires exactly:

```text
49  AlbanianSQI/GF/lib/src/albanian/*.gf
 5  AlbanianSQI/GF/lib/src/*.gf
54  total GF files
```

The five required public facades are fixed explicitly as:

```text
CombinatorsSqi.gf
ConstructorsSqi.gf
SymbolicSqi.gf
SyntaxSqi.gf
TrySqi.gf
```

The validator also checks balanced GF delimiters, overload self-dispatch,
structural VP/VPSlash markers, removal of the Adverb NP helper coercions, and
known placeholder patterns.

When `gf` is available it can compile all 54 targets in a temporary tree and
fails the gate on any target failure, any `missing lock field lock_*` warning,
or any `circular definitions` diagnostic.

Example:

```text
python validate_albanian_upgrade.py --gf gf --require-gf \
  --extra-path <path-to-rgl-src>
```

The `--extra-path` option may be repeated when the local RGL installation needs
additional source roots.

## 5. U5 prepared — optional GF Wordbench patch

A separate optional companion patch is supplied for GF Wordbench. It is not
required to apply the Albanian source overlay.

It adds a dedicated compiler diagnostic for GF circular definitions:

```text
pattern id: DP-GFCIRC-001
kind:       TYPE
severity:   ERROR
```

This prevents leading rename/type-context tokens such as `Voc`, `Int`, or `N`
from replacing the actual fatal diagnostic when stderr ends in, for example:

```text
ParadigmsSqi.gf:
  circular definitions: mkA2
```

The patch also makes the Markdown summary source-lock digest use the same
portable source-path semantics as the detailed source lock, removing the
observed summary/details identity mismatch.

Targeted Wordbench tests executed for the companion patch:

```text
20 diagnostics component tests PASS
39 reporting/details tests PASS
59 targeted tests PASS total
```

This is targeted evidence only, not a claim that the complete Wordbench test
suite was executed.

## 6. Current validation result

The self-contained static gate on this candidate reports:

```text
static:            PASS
language files:    49
API facade files:   5
total GF files:    54
static errors:      0
static warnings:    0
compiler:          NOT_RUN
```

GF is not installed in the environment that assembled this candidate. Thus the
candidate is **not yet compiler-certified**. The first authoritative next step
is the 54/54 GF 3.12 run, not further source expansion.

## 7. Acceptance sequence

1. Run `validate_albanian_upgrade.py --gf ... --require-gf` against GF 3.12 and
   the pinned/target RGL source environment.
2. Require 54/54 compile PASS, zero circular-definition diagnostics, and zero
   `missing lock field lock_*` warnings.
3. If Wordbench is used, apply the optional companion patch and repeat Global
   Scan plus explicit facade coverage until the report itself demonstrates the
   same 54-target surface.
4. Only after the compiler/structural gate is green, execute the reviewed
   Albanian scenarios/goldens specified by the minimal test suite.
5. Do not promote a linguistic-completion or release claim from a zero-scenario
   run.

## 8. Files changed by the source upgrade

Production GF files:

```text
AlbanianSQI/GF/lib/src/albanian/AdverbSqi.gf
AlbanianSQI/GF/lib/src/albanian/CatSqi.gf
AlbanianSQI/GF/lib/src/albanian/ClauseSqiRes.gf
AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf
AlbanianSQI/GF/lib/src/albanian/ResSqi.gf
```

Support/validation:

```text
validate_albanian_upgrade.py
```

The synchronized documentation bundle is included in the full upgrade, with
this implementation note added as the evidence boundary for the candidate.
