$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

$requiredPaths = @(
  "README.md",
  "README.zh-CN.md",
  "LICENSE",
  "docs/installation.md",
  "docs/installation.zh-CN.md",
  "docs/impact.md",
  "docs/impact.zh-CN.md",
  "docs/platform-matrix.md",
  "docs/platform-matrix.zh-CN.md",
  "docs/triggering.md",
  "docs/triggering.zh-CN.md",
  "scripts/install.sh",
  "scripts/install.ps1",
  "packages/codex/autonomous-long-running-full-stack-delivery-agent/SKILL.md",
  "packages/codex/autonomous-long-running-full-stack-delivery-agent/agents/openai.yaml",
  "packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent/SKILL.md",
  "packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md",
  "packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent/SKILL.md",
  "packages/openclaw/openclaw.plugin.json"
)

$missing = @()
foreach ($relativePath in $requiredPaths) {
  $fullPath = Join-Path $repoRoot $relativePath
  if (-not (Test-Path $fullPath)) {
    $missing += $relativePath
  }
}

if ($missing.Count -gt 0) {
  Write-Host "Missing required paths:" -ForegroundColor Red
  $missing | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 1
}

$skillFiles = @(
  "packages/codex/autonomous-long-running-full-stack-delivery-agent/SKILL.md",
  "packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent/SKILL.md",
  "packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent/SKILL.md"
)

foreach ($relativePath in $skillFiles) {
  $fullPath = Join-Path $repoRoot $relativePath
  $content = Get-Content -Raw -Encoding UTF8 $fullPath
  if ($content -notmatch "(?ms)^---\s*\r?\nname:\s*autonomous-long-running-full-stack-delivery-agent\r?\ndescription:") {
    Write-Host "Invalid frontmatter header: $relativePath" -ForegroundColor Red
    exit 1
  }
}

$claudeAgent = Join-Path $repoRoot "packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md"
$claudeContent = Get-Content -Raw -Encoding UTF8 $claudeAgent
if ($claudeContent -notmatch "(?ms)^---\s*\r?\nname:\s*autonomous-long-running-full-stack-delivery-agent\r?\ndescription:") {
  Write-Host "Invalid Claude Code agent frontmatter." -ForegroundColor Red
  exit 1
}

Write-Host "Repository structure check passed." -ForegroundColor Green
