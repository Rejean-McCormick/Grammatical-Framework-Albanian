from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
from pathlib import Path

LEVELS = {"g1", "g2", "g3"}


def project_root() -> Path:
    return Path(__file__).resolve().parents[2]


def load_manifest(root: Path, level: str) -> dict[str, object]:
    path = root / "validation/certification/campaigns" / level / "manifest.json"
    data = json.loads(path.read_text(encoding="utf-8"))
    if str(data.get("level", "")).lower() != level:
        raise ValueError(f"campaign manifest level mismatch: {path}")
    ids = data.get("scenario_ids")
    if not isinstance(ids, list) or not ids:
        raise ValueError(f"campaign manifest has no scenario_ids: {path}")
    return data


def build_validate_command(
    root: Path,
    *,
    level: str,
    gf_exe: Path,
    rgl_root: Path,
    out_root: Path,
    python_exe: str,
) -> list[str]:
    manifest = load_manifest(root, level)
    scenario_ids = [str(x) for x in manifest["scenario_ids"]]
    cmd = [
        python_exe,
        "-m",
        "gf_wordbench",
        "validate",
        "--language-path",
        str(root / "AlbanianSQI/GF/lib/src/albanian"),
        "--profile",
        str(root / "project.toml"),
        "--mode",
        "diagnostic",
        "--strict",
        "--gf-exe",
        str(gf_exe),
        "--rgl-root",
        str(rgl_root),
        "--out-root",
        str(out_root),
        "--keep-ok-details",
    ]
    for scenario_id in scenario_ids:
        cmd.extend(["--scenario", scenario_id])
    return cmd


def newest_review_request(out_root: Path) -> Path:
    found = list(out_root.rglob("LINGUISTIC_REVIEW_REQUEST.json")) if out_root.exists() else []
    if not found:
        raise FileNotFoundError(f"no LINGUISTIC_REVIEW_REQUEST.json found beneath {out_root}")
    return max(found, key=lambda p: p.stat().st_mtime_ns)


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Run one materialized Albanian C10 campaign through GF Wordbench 1.3.4 and ingest its review request."
    )
    ap.add_argument("--level", choices=sorted(LEVELS), required=True)
    ap.add_argument("--gf-exe", type=Path, required=True)
    ap.add_argument("--rgl-root", type=Path, required=True)
    ap.add_argument("--wordbench-src", type=Path, help="Path containing the gf_wordbench package, typically GF_Wordbench/src")
    ap.add_argument("--out-root", type=Path, default=project_root() / "validation/certification/external_runs")
    ap.add_argument("--python", default=sys.executable)
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--no-ingest", action="store_true")
    args = ap.parse_args()

    root = project_root()
    gf_exe = args.gf_exe.expanduser().resolve(strict=False)
    rgl_root = args.rgl_root.expanduser().resolve(strict=False)
    out_root = args.out_root.expanduser().resolve(strict=False)

    cmd = build_validate_command(
        root,
        level=args.level,
        gf_exe=gf_exe,
        rgl_root=rgl_root,
        out_root=out_root,
        python_exe=args.python,
    )

    env = os.environ.copy()
    if args.wordbench_src:
        wb = args.wordbench_src.expanduser().resolve(strict=False)
        env["PYTHONPATH"] = str(wb) + (os.pathsep + env["PYTHONPATH"] if env.get("PYTHONPATH") else "")

    print("C10 campaign:", args.level.upper())
    print("Scenario count:", len(load_manifest(root, args.level)["scenario_ids"]))
    print("Command:")
    print(subprocess.list2cmdline(cmd))
    if args.dry_run:
        return 0

    if not gf_exe.is_file():
        raise SystemExit(f"GF executable does not exist: {gf_exe}")
    if not rgl_root.is_dir():
        raise SystemExit(f"RGL root does not exist: {rgl_root}")
    out_root.mkdir(parents=True, exist_ok=True)

    check_cmd = [
        args.python, "-m", "gf_wordbench", "project", "check", "--strict",
        "--language-path", str(root / "AlbanianSQI/GF/lib/src/albanian"),
        "--profile", str(root / "project.toml"),
        "--gf-exe", str(gf_exe), "--rgl-root", str(rgl_root),
    ]
    subprocess.run(check_cmd, env=env, check=True)
    subprocess.run(cmd, env=env, check=True)

    request = newest_review_request(out_root)
    print("Review request:", request)
    if not args.no_ingest:
        ingest = [
            args.python,
            str(root / "tools/certification/c10_certification.py"),
            "ingest-wordbench",
            "--level",
            args.level,
            "--request",
            str(request),
        ]
        subprocess.run(ingest, check=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
