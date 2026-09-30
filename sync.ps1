# One-command sync: pull, commit local changes, push - for every repo below.
$repos = @('D:\_SCRIPTS_', 'D:\Claude')
foreach ($r in $repos) {
    Write-Host "=== $r" -ForegroundColor Cyan
    if (-not (Test-Path (Join-Path $r '.git'))) { Write-Host 'not a git repo, skipped' -ForegroundColor Yellow; continue }
    Push-Location $r
    try {
        if (-not (git remote)) { Write-Host 'no remote yet, skipped' -ForegroundColor Yellow; continue }
        if (git ls-remote --heads origin main) {
            git pull --rebase --autostash origin main
            if ($LASTEXITCODE -ne 0) { Write-Host 'PULL FAILED - resolve conflicts, then rerun' -ForegroundColor Red; continue }
        }
        if (git status --porcelain) {
            git add -A
            git commit -q -m ("sync {0} {1:yyyy-MM-dd HH:mm}" -f $env:COMPUTERNAME, (Get-Date))
        }
        git push -u origin main
        if ($LASTEXITCODE -ne 0) { Write-Host 'PUSH FAILED' -ForegroundColor Red }
    } finally { Pop-Location }
}