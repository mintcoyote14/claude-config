# Links Claude Code memory folders to this repo (idempotent).
# memory\<project-key>  ->  ~\.claude\projects\<project-key>\memory   (junction, no admin needed)
$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$projRoot = Join-Path $env:USERPROFILE '.claude\projects'
foreach ($src in Get-ChildItem (Join-Path $repo 'memory') -Directory) {
    $parent = Join-Path $projRoot $src.Name
    $link = Join-Path $parent 'memory'
    New-Item -ItemType Directory -Force $parent | Out-Null
    $item = Get-Item $link -Force -ErrorAction SilentlyContinue
    if ($item -and $item.LinkType -eq 'Junction') {
        if ($item.Target -contains $src.FullName) { "OK      $link"; continue }
        [IO.Directory]::Delete($link)   # wrong target: drop the link only, never its contents
    } elseif ($item) {
        $bak = "$link.bak-" + (Get-Date -Format yyyyMMdd-HHmmss)
        Rename-Item $link $bak
        "BACKUP  $bak (merge by hand if it holds anything you need)"
    }
    New-Item -ItemType Junction -Path $link -Target $src.FullName | Out-Null
    "LINKED  $link -> $($src.FullName)"
}