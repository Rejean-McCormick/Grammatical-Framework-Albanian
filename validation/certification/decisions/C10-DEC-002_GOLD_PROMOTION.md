# C10-DEC-002 — Gold promotion is a separate explicit action

Status: ACCEPTED IMPLEMENTATION DECISION

No validation, bootstrap, dashboard or linter command may write a gold. `promote-golds` is the sole C10 command that writes `validation/gold/*.gold`; it requires a decision reference, reviewer identity, exact Wordbench request, matching source/output hashes, and only `valid`/`valid_variant` CASEs at medium/high confidence.
