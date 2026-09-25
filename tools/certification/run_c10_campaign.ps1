param(
  [Parameter(Mandatory=$true)][ValidateSet('g1','g2','g3')][string]$Level,
  [Parameter(Mandatory=$true)][string]$GfExe,
  [Parameter(Mandatory=$true)][string]$RglRoot,
  [Parameter(Mandatory=$true)][string]$WordbenchSrc,
  [string]$OutRoot = "validation/certification/external_runs"
)
$ErrorActionPreference = 'Stop'
python tools/certification/run_external_wordbench.py --level $Level --gf-exe $GfExe --rgl-root $RglRoot --wordbench-src $WordbenchSrc --out-root $OutRoot
