param(
  [Parameter(Mandatory=$true)][string]$GfExe,
  [Parameter(Mandatory=$true)][string]$RglRoot,
  [string]$WordbenchCommand = "gf-wordbench"
)

$ErrorActionPreference = "Stop"
$ProjectRoot = (Resolve-Path (Join-Path $PSScriptRoot "../..")).Path
Push-Location $ProjectRoot
try {
  Write-Host "[1/5] Conversation 4 static validator"
  python validation/verbal_advanced/static_validate_verbal.py

  Write-Host "[2/5] Dict + MorphoDict static validation"
  python validation/lexicon/static_validate_dict_and_morphodict.py

  Write-Host "[3/5] MorphoSqi heuristic lint"
  python gf_morphosqi_lint.py AlbanianSQI/GF/lib/src/albanian/MorphoSqi.gf

  Write-Host "[4/5] Python validator syntax"
  python -m compileall -q validation/verbal_advanced validation/lexicon validation/morphodict tools/dictionary

  Write-Host "[5/5] Wordbench strict diagnostic + optional advanced verbal scenario"
  & $WordbenchCommand validate `
    --mode diagnostic `
    --strict `
    --project-root $ProjectRoot `
    --gf-exe $GfExe `
    --rgl-root $RglRoot `
    --scenario alb-verb-advanced `
    --keep-ok-details `
    --verbose
  if ($LASTEXITCODE -ne 0) {
    throw "Wordbench certification run failed with exit code $LASTEXITCODE"
  }
}
finally {
  Pop-Location
}
