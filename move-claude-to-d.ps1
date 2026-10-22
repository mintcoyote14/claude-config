# Moves the Claude Code data folder (%USERPROFILE%\.claude) to another drive and leaves a junction in its place,
# so every program that looks in C:\Users\<you>\.claude keeps working while the files live on D:.
# Close Claude Code first (desktop app, every terminal session, IDE extensions). Nothing is deleted:
# the original stays as .claude.bak-<timestamp> until you remove it yourself.
param([string]$Target = 'D:\ClaudeHome\.claude')
$ErrorActionPreference = 'Stop'
$src = Join-Path $env:USERPROFILE '.claude'
$Target = $Target.TrimEnd('\')

function Fail($msg) { Write-Host "ABORT: $msg" -ForegroundColor Red; exit 1 }

# Regular files by relative path; junctions/symlinks are listed separately and not descended into
function Get-Tree($root) {
    $files = @{}; $links = @()
    $stack = New-Object System.Collections.Stack
    $stack.Push($root)
    while ($stack.Count) {
        foreach ($i in Get-ChildItem -LiteralPath $stack.Pop() -Force) {
            $rel = $i.FullName.Substring($root.Length + 1)
            if ($i.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                $links += [pscustomobject]@{ Rel = $rel; Type = $i.LinkType; Target = @($i.Target)[0] }
            } elseif ($i.PSIsContainer) { $stack.Push($i.FullName) }
            else { $files[$rel] = $i.Length }
        }
    }
    [pscustomobject]@{ Files = $files; Links = $links }
}

# --- Preflight: read-only checks
$item = Get-Item -LiteralPath $src -Force -ErrorAction SilentlyContinue
if (-not $item) { Fail "$src not found" }
if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { "Already moved: $src -> $(@($item.Target)[0])"; exit 0 }
if ($Target.StartsWith($src, [StringComparison]::OrdinalIgnoreCase)) { Fail 'target is inside the source folder' }
$drive = (Split-Path $Target -Qualifier) + '\'
if (-not (Test-Path -LiteralPath $drive)) { Fail "drive $drive not found" }
if ((Test-Path -LiteralPath $Target) -and (Get-ChildItem -LiteralPath $Target -Force | Select-Object -First 1)) { Fail "$Target exists and is not empty" }
$running = Get-Process -Name claude -ErrorAction SilentlyContinue
if ($running) { Fail "Claude is running (PID $($running.Id -join ', ')). Close the desktop app, terminals and IDE extensions, then rerun." }

$tree = Get-Tree $src
$bytes = ($tree.Files.Values | Measure-Object -Sum).Sum
$free = (Get-PSDrive ($drive.Substring(0, 1))).Free
"Source: $($tree.Files.Count) files, {0:N1} MB, {1} links; free on {2} {3:N1} MB" -f ($bytes / 1MB), $tree.Links.Count, $drive, ($free / 1MB)
if ($bytes -ge $free) { Fail "not enough space on $drive" }

# --- Rename first: fails right away if anything still holds the folder open
$bak = "$src.bak-" + (Get-Date -Format yyyyMMdd-HHmmss)
try { Rename-Item -LiteralPath $src -NewName (Split-Path $bak -Leaf) }
catch { Fail "cannot rename $src (still in use?): $($_.Exception.Message)" }

$linked = $false
try {
    robocopy $bak $Target /E /COPY:DAT /DCOPY:DAT /XJ /R:1 /W:1 /NFL /NDL /NP /NJH | Out-Host
    if ($LASTEXITCODE -ge 8) { throw "robocopy failed with code $LASTEXITCODE" }

    # Verify: same file list, sizes and MD5
    $copy = Get-Tree $Target
    if ($copy.Files.Count -ne $tree.Files.Count) { throw "file count differs: $($copy.Files.Count) copied vs $($tree.Files.Count)" }
    $n = 0
    foreach ($rel in $tree.Files.Keys) {
        $n++; Write-Progress -Activity 'Verifying MD5' -Status $rel -PercentComplete ($n * 100 / $tree.Files.Count)
        if (-not $copy.Files.ContainsKey($rel) -or $copy.Files[$rel] -ne $tree.Files[$rel]) { throw "missing or different size: $rel" }
        $a = (Get-FileHash -LiteralPath (Join-Path $bak $rel) -Algorithm MD5).Hash
        $b = (Get-FileHash -LiteralPath (Join-Path $Target $rel) -Algorithm MD5).Hash
        if ($a -ne $b) { throw "MD5 mismatch: $rel" }
    }
    Write-Progress -Activity 'Verifying MD5' -Completed
    "MD5 OK for $($tree.Files.Count) files"

    New-Item -ItemType Junction -Path $src -Target $Target | Out-Null
    $linked = $true
    "LINKED  $src -> $Target"
} catch {
    if (-not $linked) { Rename-Item -LiteralPath $bak -NewName '.claude' }
    Fail "$($_.Exception.Message). Original restored at $src; the partial copy in $Target can be deleted."
}

# --- Recreate the junctions/symlinks robocopy skipped (memory links etc.)
foreach ($l in $tree.Links) {
    $path = Join-Path $Target $l.Rel
    try { New-Item -ItemType $l.Type -Path $path -Target $l.Target | Out-Null; "LINKED  $path -> $($l.Target)" }
    catch { Write-Host "RECREATE BY HAND  $path -> $($l.Target) ($($l.Type)): $($_.Exception.Message)" -ForegroundColor Yellow }
}

$setup = Join-Path $PSScriptRoot 'setup.ps1'
if (Test-Path -LiteralPath $setup) { & $setup }

Write-Host "`nDone. Start Claude Code and check that history, memory and skills are there." -ForegroundColor Green
Write-Host "Backup kept at $bak - delete it yourself once everything works."
