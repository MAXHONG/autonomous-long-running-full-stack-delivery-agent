[CmdletBinding()]
param(
  [Parameter(Mandatory = $true)]
  [ValidateSet('codex', 'opencode', 'claude-code', 'openclaw')]
  [string]$Platform,

  [ValidateSet('user', 'project')]
  [string]$Scope = 'project',

  [string]$TargetDir,

  [string]$Owner = 'MAXHONG',

  [string]$Repo = 'autonomous-long-running-full-stack-delivery-agent',

  [string]$Ref = 'main'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Install-DeliveryAgentSkill {
  param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('codex', 'opencode', 'claude-code', 'openclaw')]
    [string]$Platform,

    [ValidateSet('user', 'project')]
    [string]$Scope = 'project',

    [string]$TargetDir,

    [string]$Owner = 'MAXHONG',

    [string]$Repo = 'autonomous-long-running-full-stack-delivery-agent',

    [string]$Ref = 'main'
  )

  $skillName = 'autonomous-long-running-full-stack-delivery-agent'

  function Resolve-LocalRoot {
    $candidate = if ($PSScriptRoot) { Split-Path -Parent $PSScriptRoot } else { $null }
    if ($candidate -and (Test-Path (Join-Path $candidate 'packages'))) {
      return $candidate
    }
    return $null
  }

  function Download-RemoteRoot {
    $tmpDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
    New-Item -ItemType Directory -Force $tmpDir | Out-Null
    $zipPath = Join-Path $tmpDir 'repo.zip'
    $url = "https://github.com/$Owner/$Repo/archive/refs/heads/$Ref.zip"
    Invoke-WebRequest -Uri $url -OutFile $zipPath
    Expand-Archive -Path $zipPath -DestinationPath $tmpDir -Force
    return (Join-Path $tmpDir "$Repo-$Ref")
  }

  function Copy-Dir {
    param([string]$Source, [string]$Destination)
    $parent = Split-Path -Parent $Destination
    if ($parent) {
      New-Item -ItemType Directory -Force $parent | Out-Null
    }
    if (Test-Path $Destination) {
      Remove-Item -Recurse -Force $Destination
    }
    Copy-Item -Recurse -Force $Source $Destination
  }

  function Copy-SingleFile {
    param([string]$Source, [string]$Destination)
    $parent = Split-Path -Parent $Destination
    if ($parent) {
      New-Item -ItemType Directory -Force $parent | Out-Null
    }
    Copy-Item -Force $Source $Destination
  }

  $repoRoot = Resolve-LocalRoot
  if (-not $repoRoot) {
    $repoRoot = Download-RemoteRoot
  }

  switch ($Platform) {
    'codex' {
      $src = Join-Path $repoRoot "packages/codex/$skillName"
      $dest = if ($TargetDir) { Join-Path $TargetDir $skillName } else { Join-Path $HOME ".codex/skills/$skillName" }
      Copy-Dir -Source $src -Destination $dest
    }
    'opencode' {
      $src = Join-Path $repoRoot "packages/opencode/.opencode/skills/$skillName"
      if ($TargetDir) {
        $dest = Join-Path $TargetDir $skillName
      } elseif ($Scope -eq 'user') {
        $dest = Join-Path $HOME ".config/opencode/skills/$skillName"
      } else {
        $dest = Join-Path (Get-Location) ".opencode/skills/$skillName"
      }
      Copy-Dir -Source $src -Destination $dest
    }
    'claude-code' {
      $src = Join-Path $repoRoot "packages/claude-code/.claude/agents/$skillName.md"
      if ($TargetDir) {
        $dest = Join-Path $TargetDir "$skillName.md"
      } elseif ($Scope -eq 'user') {
        $dest = Join-Path $HOME ".claude/agents/$skillName.md"
      } else {
        $dest = Join-Path (Get-Location) ".claude/agents/$skillName.md"
      }
      Copy-SingleFile -Source $src -Destination $dest
    }
    'openclaw' {
      $src = Join-Path $repoRoot "packages/openclaw/skills/$skillName"
      if ($TargetDir) {
        $dest = Join-Path $TargetDir $skillName
      } elseif ($Scope -eq 'user') {
        $dest = Join-Path $HOME ".openclaw/skills/$skillName"
      } else {
        $dest = Join-Path (Get-Location) "skills/$skillName"
      }
      Copy-Dir -Source $src -Destination $dest
    }
  }

  Write-Host "Installed $skillName for $Platform at: $dest" -ForegroundColor Green
}

Install-DeliveryAgentSkill -Platform $Platform -Scope $Scope -TargetDir $TargetDir -Owner $Owner -Repo $Repo -Ref $Ref
