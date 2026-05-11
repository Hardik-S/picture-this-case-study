param(
    [string]$Root = "."
)

$ErrorActionPreference = "Stop"

$indexPath = Join-Path $Root "index.html"
$caseStudyPath = Join-Path $Root "docs/case-study.md"
$evidenceLedgerPath = Join-Path $Root "docs/evidence-ledger.md"
$vercelPath = Join-Path $Root "vercel.json"

foreach ($path in @($indexPath, $caseStudyPath, $evidenceLedgerPath, $vercelPath)) {
    if (-not (Test-Path $path)) {
        throw "Required public artifact missing: $path"
    }
}

$index = Get-Content -Raw $indexPath
$caseStudy = Get-Content -Raw $caseStudyPath
$evidenceLedger = Get-Content -Raw $evidenceLedgerPath

$requiredPageText = @(
    "Prototype Review Signals",
    "Decision-time friction",
    "Reveal comprehension",
    "Privacy boundary"
)

foreach ($text in $requiredPageText) {
    if ($index -notmatch [regex]::Escape($text)) {
        throw "Missing recruiter-visible page text: $text"
    }
}

$requiredCaseStudyText = @(
    "review signals",
    "sanitized validation",
    "unsupported traction"
)

foreach ($text in $requiredCaseStudyText) {
    if ($caseStudy -notmatch [regex]::Escape($text)) {
        throw "Missing case-study rationale text: $text"
    }
}

$requiredLedgerText = @(
    "Sanitized artifact",
    "Evidence status",
    "Do not claim traction"
)

foreach ($text in $requiredLedgerText) {
    if ($evidenceLedger -notmatch [regex]::Escape($text)) {
        throw "Missing evidence-ledger guardrail text: $text"
    }
}

Write-Host "Static site proof checks passed."
