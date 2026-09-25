"""Static Albanian morphology inspection helpers for MorphoDictSqi MAX.

This module does *not* replace GF.  It evaluates only the generated, numbered
single-argument morphology classes in MorphoSqi.gf well enough to compare their
surface strings with externally observed evidence.  GF 3.12 remains the
execution/type-checking authority.

The evaluator is deliberately fail-closed: unsupported GF expressions return
None rather than guessed strings.
"""
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import hashlib
import re
from typing import Dict, Iterable, Optional


def _find_matching(s: str, start: int, opench: str = "{", closech: str = "}") -> int:
    if start >= len(s) or s[start] != opench:
        raise ValueError("matching-brace start does not point at opener")
    depth = 0
    in_string = False
    escape = False
    for i in range(start, len(s)):
        c = s[i]
        if in_string:
            if escape:
                escape = False
            elif c == "\\":
                escape = True
            elif c == '"':
                in_string = False
            continue
        if c == '"':
            in_string = True
        elif c == opench:
            depth += 1
        elif c == closech:
            depth -= 1
            if depth == 0:
                return i
    raise ValueError("unbalanced GF expression")


def _split_top(s: str, sep: str = ";") -> list[str]:
    out: list[str] = []
    start = 0
    braces = parens = angles = 0
    in_string = False
    escape = False
    for i, c in enumerate(s):
        if in_string:
            if escape:
                escape = False
            elif c == "\\":
                escape = True
            elif c == '"':
                in_string = False
            continue
        if c == '"':
            in_string = True
        elif c == "{":
            braces += 1
        elif c == "}":
            braces -= 1
        elif c == "(":
            parens += 1
        elif c == ")":
            parens -= 1
        elif c == "<":
            angles += 1
        elif c == ">":
            angles = max(0, angles - 1)
        elif c == sep and braces == parens == angles == 0:
            out.append(s[start:i])
            start = i + 1
    out.append(s[start:])
    return out


def pattern_regex(pattern: str) -> Optional[re.Pattern[str]]:
    """Convert the small GF string-pattern subset used by generated dispatchers."""
    tokens: list[str] = []
    cur = ""
    par = 0
    in_string = False
    for c in pattern.strip():
        if in_string:
            cur += c
            if c == '"':
                in_string = False
        elif c == '"':
            in_string = True
            cur += c
        elif c == "(":
            par += 1
            cur += c
        elif c == ")":
            par -= 1
            cur += c
        elif c == "+" and par == 0:
            tokens.append(cur.strip())
            cur = ""
        else:
            cur += c
    if cur.strip():
        tokens.append(cur.strip())

    parts: list[str] = []
    for idx, token in enumerate(tokens):
        if not token:
            continue
        if token.startswith('"') and token.endswith('"'):
            parts.append(re.escape(token[1:-1]))
            continue
        if token == "_":
            parts.append(".*")
            continue
        m = re.match(r"([A-Za-z_]\w*)@\?$", token)
        if m:
            parts.append(fr"(?P<{m.group(1)}>.)")
            continue
        m = re.match(r"([A-Za-z_]\w*)@\((.*)\)$", token)
        if m:
            name, inner = m.groups()
            count = inner.count("?")
            parts.append(fr"(?P<{name}>.{{{count}}})" if count else fr"(?P<{name}>.+?)")
            continue
        if re.match(r"^[A-Za-z_]\w*$", token):
            quant = ".*" if idx == len(tokens) - 1 else ".*?"
            parts.append(fr"(?P<{token}>{quant})")
            continue
        return None
    try:
        return re.compile("^" + "".join(parts) + "$")
    except re.error:
        return None


def _tokenize_concat(expr: str) -> tuple[list[str], list[str]]:
    s = expr.strip()
    toks: list[str] = []
    ops: list[str] = []
    cur = ""
    par = angle = 0
    in_string = False
    escape = False
    i = 0
    while i < len(s):
        c = s[i]
        if in_string:
            cur += c
            if escape:
                escape = False
            elif c == "\\":
                escape = True
            elif c == '"':
                in_string = False
            i += 1
            continue
        if c == '"':
            in_string = True
            cur += c
            i += 1
            continue
        if c == "(":
            par += 1
        elif c == ")":
            par -= 1
        elif c == "<":
            angle += 1
        elif c == ">":
            angle = max(0, angle - 1)
        elif c == "+" and par == 0 and angle == 0:
            toks.append(cur.strip())
            cur = ""
            if i + 1 < len(s) and s[i + 1] == "+":
                ops.append("++")
                i += 2
            else:
                ops.append("+")
                i += 1
            continue
        cur += c
        i += 1
    toks.append(cur.strip())
    return toks, ops


def _eval_expr(expr: str, env: Dict[str, str]) -> Optional[str]:
    s = expr.strip()
    if not s:
        return ""
    if s.startswith("<") and "case" in s:
        return _eval_case(s, env)
    if s.startswith("case "):
        return _eval_case(s, env)
    if s.startswith("(") and s.endswith(")"):
        return _eval_expr(s[1:-1], env)
    m = re.match(r"init\s+(.+)$", s)
    if m:
        val = _eval_expr(m.group(1), env)
        return val[:-1] if val else val
    m = re.match(r"drop\s+(\d+)\s+(.+)$", s)
    if m:
        val = _eval_expr(m.group(2), env)
        return val[int(m.group(1)) :] if val is not None else None
    toks, ops = _tokenize_concat(s)
    if len(toks) > 1:
        vals = [_eval_expr(t, env) for t in toks]
        if any(v is None for v in vals):
            return None
        out = vals[0] or ""
        for op, val in zip(ops, vals[1:]):
            val = val or ""
            out += ((" " if out and val else "") if op == "++" else "") + val
        return out
    if s.startswith('"') and s.endswith('"'):
        return s[1:-1]
    if re.match(r"^[A-Za-z_]\w*$", s):
        return env.get(s)
    return None


def _eval_case(expr: str, env: Dict[str, str]) -> Optional[str]:
    s = expr.strip()
    if s.startswith("<") and s.endswith(">"):
        s = s[1:-1].strip()
        s = re.sub(r"\s*:\s*Str\s*$", "", s)
    m = re.match(r"case\s+(.+?)\s+of\s*\{", s, re.S)
    if not m:
        return None
    scr_expr = m.group(1).strip()
    if scr_expr.startswith("<") and scr_expr.endswith(">"):
        scr_expr = scr_expr[1:-1].strip()
        scr_expr = re.sub(r"\s*:\s*Str\s*$", "", scr_expr)
    scr = _eval_expr(scr_expr, env)
    if scr is None:
        return None
    brace = s.find("{", m.start())
    end = _find_matching(s, brace)
    for alt in _split_top(s[brace + 1 : end], ";"):
        if "=>" not in alt:
            continue
        pat, rhs = alt.split("=>", 1)
        pat, rhs = pat.strip(), rhs.strip()
        if pat == "_":
            return _eval_expr(rhs, env)
        rx = pattern_regex(pat)
        if rx:
            mm = rx.match(scr)
            if mm:
                env2 = dict(env)
                env2.update({k: v for k, v in mm.groupdict().items() if v is not None})
                return _eval_expr(rhs, env2)
        elif pat.startswith('"') and pat.endswith('"') and scr == pat[1:-1]:
            return _eval_expr(rhs, env)
    return None


@dataclass(frozen=True)
class ClassResult:
    class_id: str
    base: str
    surfaces: frozenset[str]
    gender: Optional[str]
    clit: Optional[bool]
    unresolved_assignments: tuple[tuple[str, str], ...]


class MorphoInspector:
    def __init__(self, repo_root: Path):
        self.repo_root = Path(repo_root)
        self.morpho_path = self.repo_root / "AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf"
        self.paradigms_path = self.repo_root / "AlbanianSQI/GF/lib/src/albanian/ParadigmsSqi.gf"
        self.morpho_text = self.morpho_path.read_text(encoding="utf-8")
        self.paradigms_text = self.paradigms_path.read_text(encoding="utf-8")
        self.defs = self._parse_defs()
        # The consolidated ParadigmsSqi keeps the original smart route bodies
        # and inserts strict principal-part wrappers afterwards.  Route extraction
        # therefore terminates at the preserved Raw helper, not at the public
        # validator wrapper.
        self.routes = {
            "N": self._extract_route("regN", "reg2NRaw"),
            "A": self._extract_route("regA", "reg2ARaw"),
            "V": self._extract_route("regV", "reg2VRaw"),
        }

    def _parse_defs(self) -> dict[str, str]:
        pat = re.compile(r"(?m)^mk([NAV])(\d{3})\s*:\s*Str\s*->\s*([NAV])\s*;")
        ms = list(pat.finditer(self.morpho_text))
        out: dict[str, str] = {}
        for i, m in enumerate(ms):
            end = ms[i + 1].start() if i + 1 < len(ms) else len(self.morpho_text)
            out[m.group(1) + m.group(2)] = self.morpho_text[m.start() : end]
        return out

    def _extract_route(self, name: str, next_name: str) -> list[tuple[str, str]]:
        text = self.paradigms_text
        s = text.index("  " + name + " :")
        e = text.index("  " + next_name + " :", s)
        body = text[s:e]
        m = re.search(r"case\s+<[^>]+>\s+of\s*\{", body)
        if not m:
            return []
        start = body.find("{", m.start())
        end = _find_matching(body, start)
        out: list[tuple[str, str]] = []
        for line in body[start + 1 : end].splitlines():
            mm = re.search(r"^\s*(.+?)\s*=>\s*(mk[NAV]\d{3})\s+form\s*;", line)
            if mm:
                out.append((mm.group(1).strip(), mm.group(2)))
        return out

    def smart_route(self, category: str, base: str) -> Optional[str]:
        for pat, cls in self.routes.get(category, []):
            if pat == "_":
                return cls
            rx = pattern_regex(pat)
            if rx and rx.match(base):
                return cls
        return None

    @staticmethod
    def _select_outer_branch(body: str, base: str) -> tuple[Optional[str], dict[str, str]]:
        m = re.search(r"^mk[NAV]\d{3}\s+([A-Za-z_]\w*)\s*=\s*(.*)$", body, re.M)
        if not m:
            return None, {}
        arg = m.group(1)
        env = {arg: base}
        c = re.search(r"case\s+<\s*" + re.escape(arg) + r"\s*:\s*Str\s*>\s+of\s*\{", body)
        if not c:
            return body, env
        brace = body.find("{", c.start())
        end = _find_matching(body, brace)
        case_body = body[brace + 1 : end]
        fallback = re.search(r"(?m)^\s*_\s*=>\s*error\b", case_body)
        substantive = case_body[: fallback.start()] if fallback else case_body
        arrow = substantive.find("=>")
        if arrow < 0:
            return None, env
        pat = substantive[:arrow].strip()
        rhs = substantive[arrow + 2 :].strip().rstrip(";").strip()
        rx = pattern_regex(pat)
        if not rx:
            return None, env
        mm = rx.match(base)
        if not mm:
            return None, env
        env.update({k: v for k, v in mm.groupdict().items() if v is not None})
        return rhs, env

    @staticmethod
    def _extract_lets(branch: str, env: dict[str, str]) -> tuple[dict[str, str], list[tuple[str, str]]]:
        text = re.sub(r"--[^\n]*", "", branch)
        skip = {
            "s", "g", "clit", "Indicative", "Subjunctive", "Imperative", "participle",
            "pres_optative", "perf_optative", "pres_admirative", "imperf_admirative",
            "Nom", "Acc", "Dat", "Ablat", "Sg", "Pl", "P1", "P2", "P3", "Pres",
            "Past", "Aorist", "Imperfect", "Masc", "Fem",
        }
        starts = list(re.finditer(r"\b([A-Za-z_]\w*)\s*(?::\s*Str\s*)?=\s*", text))
        assignments: list[tuple[int, str, str]] = []
        for m in starts:
            name = m.group(1)
            if name in skip:
                continue
            i = m.end()
            braces = par = angle = 0
            in_string = False
            escape = False
            j = i
            while j < len(text):
                c = text[j]
                if in_string:
                    if escape:
                        escape = False
                    elif c == "\\":
                        escape = True
                    elif c == '"':
                        in_string = False
                else:
                    if c == '"':
                        in_string = True
                    elif c == "{":
                        braces += 1
                    elif c == "}":
                        braces = max(0, braces - 1)
                    elif c == "(":
                        par += 1
                    elif c == ")":
                        par = max(0, par - 1)
                    elif c == "<":
                        angle += 1
                    elif c == ">":
                        angle = max(0, angle - 1)
                    elif c == ";" and braces == par == angle == 0:
                        break
                j += 1
            assignments.append((m.start(), name, text[i:j].strip()))

        pending = assignments
        for _ in range(6):
            new: list[tuple[int, str, str]] = []
            progressed = False
            for pos, name, expr in pending:
                val = _eval_expr(expr, env)
                if val is not None:
                    env[name] = val
                    progressed = True
                else:
                    new.append((pos, name, expr))
            pending = new
            if not progressed:
                break
        return env, [(name, expr) for _, name, expr in pending]

    def evaluate_class(self, class_name: str, base: str) -> Optional[ClassResult]:
        key = class_name[2:] if class_name.startswith("mk") else class_name
        body = self.defs.get(key)
        if not body:
            return None
        branch, env = self._select_outer_branch(body, base)
        if branch is None:
            return None
        env, pending = self._extract_lets(branch, env)
        clean = re.sub(r"--[^\n]*", "", branch)
        surfaces: set[str] = set()
        for m in re.finditer(r"=>\s*([^;{}]+)", clean):
            val = _eval_expr(m.group(1), env)
            if isinstance(val, str) and val and val not in {"Masc", "Fem", "True", "False"}:
                surfaces.add(val)
        for field in ("participle",):
            for m in re.finditer(r"\b" + field + r"\s*=\s*([^;{}]+);", clean):
                val = _eval_expr(m.group(1), env)
                if isinstance(val, str) and val:
                    surfaces.add(val)
        gender = None
        gm = re.search(r"\bg\s*=\s*(Masc|Fem)\b", clean)
        if gm:
            gender = gm.group(1)
        clit = None
        cm = re.search(r"\bclit\s*=\s*(True|False)\b", clean)
        if cm:
            clit = cm.group(1) == "True"
        return ClassResult(
            class_id="mk" + key,
            base=base,
            surfaces=frozenset(surfaces),
            gender=gender,
            clit=clit,
            unresolved_assignments=tuple(pending),
        )

    def class_hash(self, class_name: str) -> str:
        key = class_name[2:] if class_name.startswith("mk") else class_name
        body = self.defs[key]
        return hashlib.sha256(body.encode("utf-8")).hexdigest()

    def classes_for(self, category: str) -> Iterable[str]:
        for key in sorted(self.defs):
            if key.startswith(category):
                yield "mk" + key


def form_matches(surface: str, generated: Iterable[str]) -> bool:
    generated_set = set(generated)
    if surface in generated_set:
        return True
    if surface and surface[0].isupper():
        lower_initial = surface[0].lower() + surface[1:]
        return lower_initial in generated_set
    return False
