from __future__ import annotations

import argparse
import json
import os
import sys
from pathlib import Path


def main() -> int:
    ap = argparse.ArgumentParser(description="Run GF Wordbench 1.3.4 native static project/scenario checks with an explicit RGL root.")
    ap.add_argument("--wordbench-src", type=Path, required=True)
    ap.add_argument("--rgl-root", type=Path, required=True)
    ap.add_argument("--output", type=Path)
    args = ap.parse_args()

    wb = args.wordbench_src.resolve(strict=True)
    sys.path.insert(0, str(wb))
    from gf_wordbench.bootstrap import build_scenario_check_application
    from gf_wordbench.entrypoints.cli.parser import parse_cli_request
    from gf_wordbench.entrypoints.cli.project_commands import project_check_request_from_cli_request, run_project_check, _build_project_check_application

    root = Path(__file__).resolve().parents[2]
    lang = root / "AlbanianSQI/GF/lib/src/albanian"
    profile = root / "project.toml"
    rgl = args.rgl_root.resolve(strict=True)

    # Project check uses the public CLI request path, including explicit RGL root.
    cli = parse_cli_request([
        "project", "check", "--strict", "--language-path", str(lang),
        "--profile", str(profile), "--rgl-root", str(rgl),
    ])
    project_result = run_project_check(project_check_request_from_cli_request(cli), _build_project_check_application())

    # The 1.3.4 scenarios-check CLI has no --rgl-root option. Call the same composed
    # application boundary with the explicit root so external-language layouts are supported.
    scenario_validation = build_scenario_check_application().check_scenarios({
        "language_path": lang,
        "validation_profile": profile,
        "rgl_root": rgl,
        "strict": True,
    })
    scenario_diags = list(getattr(scenario_validation, "diagnostics", ()) or ())

    project_errors = [d for d in project_result.diagnostics if getattr(d, "severity", None) and str(getattr(d.severity, "value", d.severity)) == "error"]
    data = {
        "schema": "albanian-c10-native-wordbench-static-check-v1",
        "wordbench_version": "1.3.4",
        "project_check_ok": project_result.ok,
        "project_diagnostic_count": len(project_result.diagnostics),
        "scenario_check_ok": not scenario_diags,
        "scenario_diagnostic_count": len(scenario_diags),
        "rgl_root": str(rgl),
        "language_path": str(lang),
        "profile": str(profile),
    }
    text = json.dumps(data, indent=2, ensure_ascii=False) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text, encoding="utf-8")
    print(text, end="")
    return 0 if data["project_check_ok"] and data["scenario_check_ok"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
