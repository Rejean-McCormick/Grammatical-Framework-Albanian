# Albanian advanced verbal validation

This directory owns the expectation matrix, negative constraints, static validator, and certification instructions for Conversation 4.

Wordbench-native assets live in the canonical project locations:

- `validation/inputs/AlbVerbAdvanced.gf`
- `validation/inputs/AlbVerbAdvancedSqi.gf`
- `validation/scenarios/alb-verb-advanced.gfs`

`project.toml` registers `alb-verb-advanced` in `optional_scenarios`; the protected 52 required scenarios are unchanged.

The advanced matrix has 98 cases. Rows marked `linguistic-review-required` are deliberately not gold-certified by this delivery.
