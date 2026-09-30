# Creates D:\Sync as a junction to <OneDrive>\Sync (idempotent, no admin needed).
# Run once on every PC after OneDrive is signed in with the same account.
# Real files live inside OneDrive (that is what gets synced); D:\Sync is just a stable path.
param(
    [string]$Link = 'D:\Sync',
    [string]$Name = 'Sync'
)
$od = $env:OneDriveCommercial
if (-not $od) { $od = $env:OneDrive }
if (-not $od -or -not (Test-Path $od)) { throw 'OneDrive folder not found - sign in to OneDrive first.' }

$target = Join-Path $od $Name
New-Item -ItemType Directory -Force $target | Out-Null
attrib +P -U $target | Out-Null    # "Always keep on this device"; new files inside inherit it

$item = Get-Item $Link -Force -ErrorAction SilentlyContinue
if ($item -and $item.LinkType -eq 'Junction') {
    if ($item.Target -contains $target) { "OK      $Link -> $target"; return }
    [IO.Directory]::Delete($Link)   # wrong target: drop the link only, never its contents
} elseif ($item) {
    throw "$Link already exists and is a real folder/file - move its contents into $target by hand, then rerun."
}
New-Item -ItemType Junction -Path $Link -Target $target | Out-Null
"LINKED  $Link -> $target"
