# Public API compatibility contract

## 1. Compatibility dimensions

| Dimension | Protected behavior |
|---|---|
| abstract compatibility | no unplanned common-contract function/category loss or retyping |
| source compatibility | existing accepted application expressions should continue to typecheck unless a migration is explicitly approved |
| facade compatibility | Syntax/Constructors/Combinators/Try/Symbolic names are not silently removed/hidden |
| overload compatibility | Try overload additions/removals do not create unexplained ambiguity or change resolution unexpectedly |
| tree compatibility | existing abstract trees remain meaningful across concrete changes when contract permits |
| linearization compatibility | accepted gold outputs change only with linguistic evidence and recorded migration |
| parse compatibility | significant parse loss/explosion is measured for changed surfaces |

## 2. Allowed additive changes

Normally safe when tested:

- new focused tests/golds;
- new Albanian-specific helper operators that are not exported publicly;
- a public overload that does not collide with existing calls and has an explicit use case;
- an Albanian Combinators specialization preserving public type/signature while correcting proven semantics.

## 3. Changes requiring migration decision

- removing/renaming/retyping a public function/category;
- changing a public facade composition so previously exported names disappear;
- changing Try overload resolution for accepted calls;
- changing category representation consumed by public Constructors/Combinators;
- changing accepted linearization/gold behavior;
- replacing an inherited implementation with a local one that alters parse/linearization semantics.

## 4. Required compatibility test bundle

For every public API change:

1. compile pre-existing facade-only smoke grammar;
2. compile new intended use cases;
3. record exported-name/collision delta for Try/Combinators;
4. run affected parse/linearization tests;
5. run full 58/58 + 52/52 floor;
6. record any deliberate incompatibility and migration note.

## 5. Stability rule

API ergonomics do not justify moving grammar logic into facades. If a constructor only works after facade-level string manipulation or record flattening, repair the grammar owner instead.
