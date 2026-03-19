# Installation Guide

This repository ships one package per target environment. Install the package that matches your tool.

## One-line installers

### Bash

- Codex: `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- codex`
- OpenCode (project): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- opencode --scope project`
- OpenCode (user): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- opencode --scope user`
- Claude Code (project): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- claude-code --scope project`
- Claude Code (user): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- claude-code --scope user`
- OpenClaw (project): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- openclaw --scope project`
- OpenClaw (user): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- openclaw --scope user`

### PowerShell

- Codex: `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform codex }"`
- OpenCode (project): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform opencode -Scope project }"`
- OpenCode (user): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform opencode -Scope user }"`
- Claude Code (project): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform claude-code -Scope project }"`
- Claude Code (user): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform claude-code -Scope user }"`
- OpenClaw (project): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform openclaw -Scope project }"`
- OpenClaw (user): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform openclaw -Scope user }"`

## Codex

Target path:

- User-level: `~/.codex/skills/autonomous-long-running-full-stack-delivery-agent`

Copy the folder:

```bash
cp -R packages/codex/autonomous-long-running-full-stack-delivery-agent ~/.codex/skills/
```

Windows PowerShell:

```powershell
Copy-Item -Recurse -Force .\packages\codex\autonomous-long-running-full-stack-delivery-agent "$HOME\.codex\skills\"
```

## OpenCode

OpenCode looks for skills in:

- Project-level: `.opencode/skills/<name>/SKILL.md`
- Global: `~/.config/opencode/skills/<name>/SKILL.md`

Copy the packaged folder into your project:

```bash
mkdir -p .opencode/skills
cp -R packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent .opencode/skills/
```

Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force .\.opencode\skills | Out-Null
Copy-Item -Recurse -Force .\packages\opencode\.opencode\skills\autonomous-long-running-full-stack-delivery-agent .\.opencode\skills\
```

## Claude Code

This repository ships a native Claude Code subagent file.

Target paths:

- Project-level: `.claude/agents/`
- User-level: `~/.claude/agents/`

Project install:

```bash
mkdir -p .claude/agents
cp packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md .claude/agents/
```

Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force .\.claude\agents | Out-Null
Copy-Item -Force .\packages\claude-code\.claude\agents\autonomous-long-running-full-stack-delivery-agent.md .\.claude\agents\
```

## OpenClaw

OpenClaw loads skills from:

- Workspace: `<workspace>/skills`
- User-level: `~/.openclaw/skills`

Workspace install:

```bash
mkdir -p skills
cp -R packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent skills/
```

Windows PowerShell:

```powershell
New-Item -ItemType Directory -Force .\skills | Out-Null
Copy-Item -Recurse -Force .\packages\openclaw\skills\autonomous-long-running-full-stack-delivery-agent .\skills\
```

Optional plugin-style install is also supported through `packages/openclaw/openclaw.plugin.json`.

## Recommended first prompt

```text
Use the autonomous-long-running-full-stack-delivery-agent to continue this project with persistent state files, small validated delivery loops, and minimal user interruptions.
```
