# Links Claude Code folders to this repo (idempotent, junctions, no admin needed).
# memory\<project-key>  ->  ~\.claude\projects\<project-key>\memory
# skills\<name>         ->  ~\.claude\skills\<name>   (personal skills, available in every session)
$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$claude = Join-Path $env:USERPROFILE '.claude'

function Set-Junction($src, $link, $bakDir) {
    New-Item -ItemType Directory -Force (Split-Path $link -Parent) | Out-Null
    $item = Get-Item $link -Force -ErrorAction SilentlyContinue
    if ($item -and $item.LinkType -eq 'Junction') {
        if ($item.Target -contains $src.FullName) { "OK      $link"; return }
        [IO.Directory]::Delete($link)   # wrong target: drop the link only, never its contents
    } elseif ($item) {
        $bak = "$link.bak-" + (Get-Date -Format yyyyMMdd-HHmmss)
        if ($bakDir) {   # keep backups out of a folder that is scanned for content
            New-Item -ItemType Directory -Force $bakDir | Out-Null
            $bak = Join-Path $bakDir (Split-Path $bak -Leaf)
        }
        Move-Item $link $bak
        "BACKUP  $bak (merge by hand if it holds anything you need)"
    }
    New-Item -ItemType Junction -Path $link -Target $src.FullName | Out-Null
    "LINKED  $link -> $($src.FullName)"
}

foreach ($src in Get-ChildItem (Join-Path $repo 'memory') -Directory) {
    Set-Junction $src (Join-Path $claude "projects\$($src.Name)\memory")
}
$skillsDir = Get-Item (Join-Path $claude 'skills') -Force -ErrorAction SilentlyContinue
if ($skillsDir -and $skillsDir.LinkType) {
    # The whole folder is already a link (e.g. to this repo): linking each skill inside it would rename the repo's own folders
    "SKIP    skills: $($skillsDir.FullName) is a $($skillsDir.LinkType) to $($skillsDir.Target)"
} else {
    foreach ($src in Get-ChildItem (Join-Path $repo 'skills') -Directory) {
        Set-Junction $src (Join-Path $claude "skills\$($src.Name)") (Join-Path $claude 'skills-backup')
    }
}
