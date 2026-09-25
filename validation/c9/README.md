# Conversation 9 focused validation

These assets are additive and deliberately live outside `validation/scenarios/`.
They do **not** change the protected 52-scenario baseline until an external GF 3.12 /
Wordbench 1.3.4 run verifies them and the project intentionally promotes them.

## Compile/run candidate

From `validation/c9/inputs`, with the Albanian RGL paths available to GF 3.12:

1. compile/import `AlbC9ResourceSmokeSqi.gf`;
2. execute `../scripts/c9-resource-smoke.gfs`;
3. confirm the government probes use `NOM`, not `ABL`;
4. confirm `Strand*` compatibility functions are preposition-first;
5. confirm `TrySqi` string overloads resolve without collisions;
6. confirm `CombinatorsSqi.appCN` is available through the Albanian specialization.

`C9_EMPTY_REL_PL` intentionally exposes the current core limitation that `Agr.GenNum`
collapses plural gender. The compatibility realization uses masculine plural `të cilët`
until the accepted richer agreement migration is implemented by the owning core workstream.
