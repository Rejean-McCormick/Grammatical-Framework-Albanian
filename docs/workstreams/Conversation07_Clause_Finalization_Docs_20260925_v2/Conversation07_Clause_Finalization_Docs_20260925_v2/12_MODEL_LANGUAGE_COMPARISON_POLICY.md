# Model-Language Comparison Policy — Clause Syntax v2

## 1. Role assignment

| Model | Primary use | Useful current architecture fact | Never proof of |
|---|---|---|---|
| English | coverage/maturity benchmark | rich `Cl`, `QCl`, direct/indirect Q forms; thin public delegation | Albanian inversion, auxiliaries, complementizers, order |
| Greek | Balkan clause/mood/order architecture | typed order + QForm and rich mood-sensitive realization | Albanian particles/order |
| Macedonian | close Balkan comparison | `Cl` has order while `QCl/QS` can remain shallower | Albanian clitic/order rules |
| Bulgarian | Balkan question/slash architecture | typed clause order and direct/indirect question form | Albanian relative/question markers |
| Romanian | clitic-rich finite clause architecture | QForm and clitic-sensitive clause composition | Albanian inversion/clitic doubling details |

## 2. What the supplied model sources establish

They demonstrate that mature RGL implementations sometimes preserve order or direct/indirect question distinctions until late realization. They also demonstrate that category depth can legitimately differ by language.

They do **not** establish that Albanian requires `Order`, `QForm`, the same slot inventory, or the same relative strategy.

## 3. Comparison procedure for every proposed Albanian change

1. Identify the exact Albanian behavior/evidence ID.
2. Identify the earliest Albanian owner and current category contract.
3. Inspect English only for shared API/coverage obligations.
4. Inspect Balkan models for alternative representation patterns.
5. Reject any model field that has no Albanian producer/consumer.
6. Choose the smallest representation that preserves the evidenced Albanian contrast.
7. Record the comparison in the change record.

## 4. Reuse gate

A model pattern can be reused only if all are true:

- target distinction exists in Albanian evidence;
- target category contract can carry the required information or a justified migration is made;
- all target producers/consumers are identified;
- tests exercise the distinction;
- no irrelevant model-specific dimension is copied.

## 5. No Balkan majority vote

Three or four Balkan languages sharing a design is a search hint, not a linguistic vote. Albanian evidence can require a different architecture.

## 6. Pattern selection rules

- EP019 (single clause assembler): **selected**, because Albanian currently has multiple assembly sites and a shared kernel already exists.
- EP021 (polarity propagation): **selected as an invariant**, because polarity crosses VP/question/relative/embedded contexts; no new polarity metadata is introduced without a producer/consumer need.
- EP023 (order dimension): **not selected yet**; blocked on OD-C07-006/011.
- EP005 (named slots): **not selected yet**; blocked on a demonstrated discontinuity/slot producer-consumer matrix.
- EP010 (in-place vs extraposed): **not selected yet**; use only if a specific Albanian construction requires preserving both placement zones.

This status must be revisited if new linguistic evidence changes applicability.
