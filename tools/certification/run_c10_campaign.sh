#!/usr/bin/env sh
set -eu
if [ "$#" -lt 4 ]; then
  echo "usage: $0 g1|g2|g3 /path/to/gf /path/to/gf-rgl /path/to/GF_Wordbench/src [out-root]" >&2
  exit 2
fi
LEVEL="$1"; GF_EXE="$2"; RGL_ROOT="$3"; WB_SRC="$4"; OUT_ROOT="${5:-validation/certification/external_runs}"
python tools/certification/run_external_wordbench.py --level "$LEVEL" --gf-exe "$GF_EXE" --rgl-root "$RGL_ROOT" --wordbench-src "$WB_SRC" --out-root "$OUT_ROOT"
