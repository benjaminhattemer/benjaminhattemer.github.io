# Compile cv/CV.tex and place the result where Hugo serves it (static/CV.pdf).
# Run from anywhere:  .\cv\build.ps1
$root = Split-Path $PSScriptRoot -Parent
Set-Location $root
foreach ($pass in 1..2) {
    pdflatex -interaction=nonstopmode -halt-on-error -output-directory=cv cv/CV.tex | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "pdflatex failed - see cv/CV.log" }
}
Copy-Item cv/CV.pdf static/CV.pdf -Force
Write-Host "CV compiled and copied to static/CV.pdf"
