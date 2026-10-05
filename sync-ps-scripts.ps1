# Photoshop scripts: two-way sync between the OneDrive exchange folder and this PC.
#
#   <OneDrive>\_scripts_\photoshop   <->   <Photoshop>\Presets\Scripts
#
# Newest file wins, nothing is ever deleted, and only files that already live
# in the exchange folder are kept in step - so Adobe's own stock scripts in
# Presets\Scripts stay out of it. A new script joins the exchange explicitly:
#
#   .\sync-ps-scripts.ps1 -Add "C:\...\Presets\Scripts\my_script.jsx"
#   .\sync-ps-scripts.ps1              # both directions
#   .\sync-ps-scripts.ps1 -Pull        # exchange -> Photoshop only
#   .\sync-ps-scripts.ps1 -Push        # Photoshop -> exchange only
#
# Writing into Program Files needs an elevated shell; without it the script
# says so instead of failing silently.

param([switch]$Pull, [switch]$Push, [string[]]$Add)

$ErrorActionPreference = 'Stop'

# ---- the exchange folder ---------------------------------------------------
$od = $env:OneDriveCommercial
if (-not $od) { $od = $env:OneDrive }
if (-not $od -or -not (Test-Path $od)) { throw 'OneDrive folder not found - sign in to OneDrive first.' }

$share = Join-Path $od '_scripts_\photoshop'
New-Item -ItemType Directory -Force $share | Out-Null

# ---- this PC's Photoshop ---------------------------------------------------
$ps = Get-ChildItem 'C:\Program Files\Adobe' -Directory -Filter 'Adobe Photoshop *' -ErrorAction SilentlyContinue |
      Sort-Object Name -Descending |
      ForEach-Object { Join-Path $_.FullName 'Presets\Scripts' } |
      Where-Object { Test-Path $_ } |
      Select-Object -First 1

if (-not $ps) { throw 'Photoshop Presets\Scripts not found - is Photoshop installed on this PC?' }

"exchange : $share"
"photoshop: $ps"
""

# ---- add new scripts to the exchange ---------------------------------------
foreach ($f in $Add) {
    $item = Get-Item $f
    Copy-Item $item.FullName (Join-Path $share $item.Name) -Force
    "ADDED    $($item.Name)"
}

if (-not $Pull -and -not $Push) { $Pull = $true; $Push = $true }

function Newer($a, $b) { ($a.LastWriteTime - $b.LastWriteTime).TotalSeconds -gt 2 }

$copied = 0
foreach ($s in Get-ChildItem $share -File | Where-Object { $_.Extension -match '^\.(jsx|js|jsxbin)$' }) {
    $local = Join-Path $ps $s.Name
    $l = Get-Item $local -ErrorAction SilentlyContinue

    if (-not $l) {
        if (-not $Pull) { continue }
        try { Copy-Item $s.FullName $local -Force; "-> PS    $($s.Name)   (new here)"; $copied++ }
        catch { "SKIPPED  $($s.Name) - cannot write to Presets\Scripts, run this in an elevated shell" }
    }
    elseif ((Newer $s $l) -and $Pull) {
        try { Copy-Item $s.FullName $local -Force; "-> PS    $($s.Name)"; $copied++ }
        catch { "SKIPPED  $($s.Name) - cannot write to Presets\Scripts, run this in an elevated shell" }
    }
    elseif ((Newer $l $s) -and $Push) {
        Copy-Item $l.FullName $s.FullName -Force
        "-> share $($s.Name)"
        $copied++
    }
}

if ($copied -eq 0) { "everything is already in step" }
