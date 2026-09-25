#!/usr/bin/env python3
"""Native certification runner for MorphoDictSqi MAX.

This script deliberately fails closed. It never upgrades certification states by
itself; it only executes the native GF/Wordbench evidence gates and writes a
machine-readable summary for C2/C10 review.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
from datetime import datetime, timezone

EXPECTED_GF_MAJOR_MINOR = "3.12"
EXPECTED_WORDBENCH_VERSION = "1.3.4"
EXPECTED_STATIC_TARGETS = 58
EXPECTED_SCENARIOS = 52


def run(cmd: list[str], *, cwd: Path, env: dict[str, str] | None = None, log: Path | None = None) -> subprocess.CompletedProcess[str]:
    p = subprocess.run(cmd, cwd=cwd, env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if log is not None:
        log.parent.mkdir(parents=True, exist_ok=True)
        log.write_text(p.stdout, encoding="utf-8")
    return p


def version_from_output(text: str) -> str | None:
    m = re.search(r"\b(\d+\.\d+(?:\.\d+)?)\b", text)
    return m.group(1) if m else None


def main() -> int:
    ap = argparse.ArgumentParser(description="Run fail-closed native MorphoDictSqi MAX certification gates")
    ap.add_argument("--repo-root", type=Path, default=Path(__file__).resolve().parents[2])
    ap.add_argument("--gf", type=Path, default=None, help="GF 3.12 executable; defaults to PATH")
    ap.add_argument("--rgl-root", type=Path, required=True, help="Extracted gf-rgl root containing src/")
    ap.add_argument("--wordbench-root", type=Path, required=True, help="Extracted GF Wordbench 1.3.4 repository")
    ap.add_argument("--output", type=Path, default=None)
    args = ap.parse_args()

    root = args.repo_root.resolve()
    rgl = args.rgl_root.resolve()
    wb = args.wordbench_root.resolve()
    out = (args.output or (root / "docs/morphodict/campaigns/CMP-C2-MAX-20260925/native_gate")).resolve()
    out.mkdir(parents=True, exist_ok=True)

    gf = args.gf.resolve() if args.gf else (Path(shutil.which("gf")) if shutil.which("gf") else None)
    result: dict[str, object] = {
        "schema": "morphodict-sqi-native-gate-v1",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "expected": {"gf": EXPECTED_GF_MAJOR_MINOR, "wordbench": EXPECTED_WORDBENCH_VERSION, "targets": EXPECTED_STATIC_TARGETS, "scenarios": EXPECTED_SCENARIOS},
        "status": "FAIL_CLOSED",
        "gates": [],
    }
    gates: list[dict[str, object]] = result["gates"]  # type: ignore[assignment]

    def gate(name: str, ok: bool, detail: str, log: str | None = None) -> bool:
        rec: dict[str, object] = {"name": name, "status": "PASS" if ok else "FAIL", "detail": detail}
        if log:
            rec["log"] = log
        gates.append(rec)
        return ok

    ok_all = True
    if gf is None or not gf.exists():
        ok_all &= gate("GF_AVAILABLE", False, "gf executable not found")
    else:
        p = run([str(gf), "--version"], cwd=root, log=out / "gf_version.txt")
        ver = version_from_output(p.stdout)
        ok = p.returncode == 0 and ver is not None and ver.startswith(EXPECTED_GF_MAJOR_MINOR)
        ok_all &= gate("GF_VERSION", ok, f"detected={ver!r}; required={EXPECTED_GF_MAJOR_MINOR}", "gf_version.txt")

    if not (rgl / "src").is_dir():
        ok_all &= gate("RGL_ROOT", False, f"missing {rgl / 'src'}")
    else:
        ok_all &= gate("RGL_ROOT", True, str(rgl))

    wb_src = wb / "src"
    if not wb_src.is_dir():
        ok_all &= gate("WORDBENCH_ROOT", False, f"missing {wb_src}")
    else:
        env = os.environ.copy()
        env["PYTHONPATH"] = str(wb_src) + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
        p = run([sys.executable, "-m", "gf_wordbench", "--version"], cwd=wb, env=env, log=out / "wordbench_version.txt")
        ver = version_from_output(p.stdout)
        ok = p.returncode == 0 and ver == EXPECTED_WORDBENCH_VERSION
        ok_all &= gate("WORDBENCH_VERSION", ok, f"detected={ver!r}; required={EXPECTED_WORDBENCH_VERSION}", "wordbench_version.txt")

    # Always run the C2 static gate first. Native evidence is meaningless if this fails.
    p = run([sys.executable, "validation/morphodict/validate_morphodict_max.py"], cwd=root, log=out / "static_validation.txt")
    ok_all &= gate("C2_STATIC", p.returncode == 0 and "SUMMARY 27 / 27" in p.stdout, "MAX static validation", "static_validation.txt")

    if not ok_all:
        (out / "native_gate_summary.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        return 2

    env = os.environ.copy()
    env["PYTHONPATH"] = str(wb_src) + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")
    lang = root / "AlbanianSQI/GF/lib/src/albanian"

    common = [
        sys.executable, "-m", "gf_wordbench", "validate",
        "--language-path", str(lang),
        "--profile", str(root),
        "--strict",
        "--gf-exe", str(gf),
        "--rgl-root", str(rgl),
    ]

    diag_out = out / "wordbench_diagnostic"
    p = run(common + ["--mode", "diagnostic", "--out-root", str(diag_out)], cwd=wb, env=env, log=out / "wordbench_diagnostic_console.txt")
    diag_ok = p.returncode == 0
    ok_all &= gate("WORDBENCH_DIAGNOSTIC", diag_ok, f"exit={p.returncode}", "wordbench_diagnostic_console.txt")

    if diag_ok:
        rel_out = out / "wordbench_release"
        p = run(common + ["--mode", "release", "--out-root", str(rel_out)], cwd=wb, env=env, log=out / "wordbench_release_console.txt")
        rel_ok = p.returncode == 0
        ok_all &= gate("WORDBENCH_RELEASE", rel_ok, f"exit={p.returncode}", "wordbench_release_console.txt")
    else:
        gate("WORDBENCH_RELEASE", False, "not run because diagnostic gate failed")
        ok_all = False

    result["status"] = "NATIVE_GATES_PASS_PENDING_C10_REVIEW" if ok_all else "FAIL_CLOSED"
    (out / "native_gate_summary.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return 0 if ok_all else 1


if __name__ == "__main__":
    raise SystemExit(main())
