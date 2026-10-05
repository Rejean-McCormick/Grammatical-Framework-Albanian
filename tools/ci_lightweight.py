#!/usr/bin/env python3
"""Fast, dependency-free CI checks for Grammatical_Framework-Albanian.

This intentionally does NOT certify the full Albanian RGL and does NOT require
GF/Wordbench.  Its purpose is to catch cheap, high-signal mistakes on every
push without turning historical/release validation debt into a development
blocker.
"""
from __future__ import annotations

import shutil
import subprocess
import sys
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROJECT_FILE = ROOT / "project.toml"
EXPECTED_PROJECT_ID = "albanian-rgl-linguistic"

failures: list[str] = []
notices: list[str] = []


def ok(label: str, detail: str = "") -> None:
    suffix = f" — {detail}" if detail else ""
    print(f"PASS {label}{suffix}")


def fail(label: str, detail: str = "") -> None:
    suffix = f" — {detail}" if detail else ""
    print(f"FAIL {label}{suffix}")
    failures.append(f"{label}: {detail}".rstrip(": "))


def notice(label: str, detail: str = "") -> None:
    suffix = f" — {detail}" if detail else ""
    print(f"INFO {label}{suffix}")
    notices.append(f"{label}: {detail}".rstrip(": "))


def load_project() -> dict:
    if not PROJECT_FILE.is_file():
        fail("project.toml exists")
        return {}
    try:
        data = tomllib.loads(PROJECT_FILE.read_text(encoding="utf-8"))
    except Exception as exc:  # syntax/encoding should fail the fast CI
        fail("project.toml parses", str(exc))
        return {}
    ok("project.toml parses")
    return data


def check_project_contract(data: dict) -> None:
    project = data.get("project", {})
    actual_id = project.get("id")
    if actual_id == EXPECTED_PROJECT_ID:
        ok("project identity", actual_id)
    else:
        fail("project identity", f"expected {EXPECTED_PROJECT_ID!r}, got {actual_id!r}")

    sources = data.get("sources", {})
    source_rel = sources.get("directory")
    source_dir = ROOT / str(source_rel or "")
    if source_rel and source_dir.is_dir():
        ok("GF source directory", str(source_rel))
    else:
        fail("GF source directory", str(source_rel))
        return

    modules = data.get("modules", {})
    for group in ("entrypoints", "checkpoints"):
        values = modules.get(group, [])
        if not isinstance(values, list) or not values:
            fail(f"{group} declared", "missing or empty")
            continue
        missing = [name for name in values if not (source_dir / name).is_file()]
        if missing:
            fail(f"{group} exist", ", ".join(missing))
        else:
            ok(f"{group} exist", f"{len(values)} file(s)")


def check_scenarios(data: dict) -> None:
    validation = data.get("validation", {})
    required = validation.get("required_scenarios", [])
    optional = validation.get("optional_scenarios", [])
    if not isinstance(required, list):
        fail("required scenarios declaration", "not a list")
        return
    if not isinstance(optional, list):
        fail("optional scenarios declaration", "not a list")
        return

    if len(required) != len(set(required)):
        fail("required scenario IDs unique")
    else:
        ok("required scenario IDs unique", str(len(required)))

    if len(optional) != len(set(optional)):
        fail("optional scenario IDs unique")
    else:
        ok("optional scenario IDs unique", str(len(optional)))

    overlap = sorted(set(required) & set(optional))
    if overlap:
        fail("required/optional scenario sets disjoint", ", ".join(overlap))
    else:
        ok("required/optional scenario sets disjoint")

    scenario_dir = ROOT / "validation" / "scenarios"
    missing_required = [sid for sid in required if not (scenario_dir / f"{sid}.gfs").is_file()]
    missing_optional = [sid for sid in optional if not (scenario_dir / f"{sid}.gfs").is_file()]

    if missing_required:
        fail("required scenario files exist", ", ".join(missing_required))
    else:
        ok("required scenario files exist", str(len(required)))

    if missing_optional:
        fail("optional scenario files exist", ", ".join(missing_optional))
    else:
        ok("optional scenario files exist", str(len(optional)))

    actual = {p.stem for p in scenario_dir.glob("*.gfs")}
    declared = set(required) | set(optional)
    extras = sorted(actual - declared)
    if extras:
        # Extra experiments are allowed; they should not block development.
        notice("undeclared scenario files", f"{len(extras)}: {', '.join(extras[:8])}" + (" …" if len(extras) > 8 else ""))
    else:
        ok("scenario inventory", f"{len(actual)} declared scenario file(s)")


def active_python_files() -> list[Path]:
    files = set(ROOT.glob("*.py"))
    for rel in ("tools", "validation", "AlbanianSQI"):
        base = ROOT / rel
        if base.exists():
            files.update(base.rglob("*.py"))
    return sorted(p for p in files if p.is_file())


def check_python_syntax() -> None:
    bad: list[str] = []
    files = active_python_files()
    for path in files:
        try:
            text = path.read_text(encoding="utf-8")
            compile(text, str(path.relative_to(ROOT)), "exec")
        except Exception as exc:
            bad.append(f"{path.relative_to(ROOT)}: {exc}")
    if bad:
        fail("Python syntax", " | ".join(bad[:8]))
    else:
        ok("Python syntax", f"{len(files)} active script(s)")


def active_text_files() -> list[Path]:
    files: set[Path] = set()
    for base in (
        ROOT / "AlbanianSQI" / "GF" / "lib" / "src" / "albanian",
        ROOT / "AlbanianSQI" / "GF" / "lib" / "src" / "morphodict",
        ROOT / "validation" / "scenarios",
    ):
        if base.exists():
            files.update(base.glob("*.gf"))
            files.update(base.glob("*.gfs"))
    return sorted(files)


def check_active_text() -> None:
    unreadable: list[str] = []
    empty: list[str] = []
    conflicts: list[str] = []
    files = active_text_files()
    for path in files:
        try:
            text = path.read_text(encoding="utf-8")
        except Exception as exc:
            unreadable.append(f"{path.relative_to(ROOT)}: {exc}")
            continue
        if not text.strip():
            empty.append(str(path.relative_to(ROOT)))
        for line_no, line in enumerate(text.splitlines(), 1):
            stripped = line.lstrip()
            if stripped.startswith("<<<<<<< ") or stripped.startswith(">>>>>>> ") or stripped == "=======":
                conflicts.append(f"{path.relative_to(ROOT)}:{line_no}")
    if unreadable:
        fail("active GF/scenario files are UTF-8 readable", " | ".join(unreadable[:8]))
    else:
        ok("active GF/scenario files are UTF-8 readable", f"{len(files)} file(s)")
    if empty:
        fail("active GF/scenario files are non-empty", ", ".join(empty[:8]))
    else:
        ok("active GF/scenario files are non-empty")
    if conflicts:
        fail("no unresolved merge markers in active GF/scenarios", ", ".join(conflicts[:8]))
    else:
        ok("no unresolved merge markers in active GF/scenarios")


def run_morphosqi_lint() -> None:
    lint = ROOT / "gf_morphosqi_lint.py"
    morpho = ROOT / "AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf"
    if not lint.is_file() or not morpho.is_file():
        fail("MorphoSqi heuristic lint prerequisites", "missing lint script or MorphoSqi.gf")
        return
    proc = subprocess.run(
        [sys.executable, str(lint), str(morpho)],
        cwd=ROOT,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if proc.returncode == 0:
        ok("MorphoSqi heuristic lint")
    else:
        tail = "\n".join(proc.stdout.splitlines()[-12:])
        fail("MorphoSqi heuristic lint", tail)


def report_native_gf() -> None:
    gf = shutil.which("gf")
    if not gf:
        notice("native GF compilation", "not part of FAST CI; gf executable not installed")
        return
    proc = subprocess.run([gf, "--version"], cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    version = proc.stdout.strip().splitlines()[0] if proc.stdout.strip() else gf
    notice("native GF executable detected", version)


def main() -> int:
    print("== Grammatical_Framework-Albanian: lightweight CI ==")
    data = load_project()
    if data:
        check_project_contract(data)
        check_scenarios(data)
    check_python_syntax()
    check_active_text()
    run_morphosqi_lint()
    report_native_gf()

    print("\n== Summary ==")
    if failures:
        print(f"FAILED: {len(failures)} check(s)")
        for item in failures:
            print(f" - {item}")
        return 1
    print("PASS: lightweight repository checks are healthy")
    if notices:
        print(f"INFO: {len(notices)} non-blocking notice(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
