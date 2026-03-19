# Autonomous Long-Running Full-Stack Delivery Agent

A multi-platform open-source packaging of the `autonomous-long-running-full-stack-delivery-agent` skill. This repository packages the same long-running delivery workflow for Codex, OpenCode, Claude Code, and OpenClaw, with bilingual documentation and installation guidance.

## What this repository includes

- A Codex-native skill package
- An OpenCode-compatible Agent Skills package
- A Claude Code native subagent package
- An OpenClaw-compatible skill package plus plugin manifest
- English and Simplified Chinese documentation
- Shared task templates, state-file examples, and installation guidance

## Why this skill exists

This skill is designed for real delivery work rather than one-shot demos. It pushes the agent to:

- keep moving after a clear project goal is given
- recover state from files instead of chat memory
- work in small, verifiable loops
- test immediately after implementation
- fix failures before stacking more features
- maintain `task.json`, `progress.md`, `architecture.md`, and `handoff.md`
- prepare documentation, packaging, release notes, and handoff artifacts

## Repository layout

```text
packages/
  codex/
  opencode/
  claude-code/
  openclaw/
docs/
scripts/
```

## Platform packages

| Platform | Package path | Native format |
| --- | --- | --- |
| Codex | `packages/codex/autonomous-long-running-full-stack-delivery-agent` | `SKILL.md` + `agents/openai.yaml` |
| OpenCode | `packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent` | Agent Skills `SKILL.md` |
| Claude Code | `packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md` | Subagent Markdown file |
| OpenClaw | `packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent` | Agent Skills `SKILL.md` |

## Documentation

- Chinese README: [README.zh-CN.md](README.zh-CN.md)
- Installation guide: [docs/installation.md](docs/installation.md)
- Chinese installation guide: [docs/installation.zh-CN.md](docs/installation.zh-CN.md)
- Platform matrix: [docs/platform-matrix.md](docs/platform-matrix.md)
- Chinese platform matrix: [docs/platform-matrix.zh-CN.md](docs/platform-matrix.zh-CN.md)
- Triggering guide: [docs/triggering.md](docs/triggering.md)
- Chinese triggering guide: [docs/triggering.zh-CN.md](docs/triggering.zh-CN.md)
- Impact estimate: [docs/impact.md](docs/impact.md)
- Chinese impact estimate: [docs/impact.zh-CN.md](docs/impact.zh-CN.md)

## One-line install

These commands download and install the right package directly from GitHub.

### Bash

- Codex: `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- codex`
- OpenCode (project): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- opencode --scope project`
- Claude Code (project): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- claude-code --scope project`
- OpenClaw (project): `curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- openclaw --scope project`

### PowerShell

- Codex: `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform codex }"`
- OpenCode (project): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform opencode -Scope project }"`
- Claude Code (project): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform claude-code -Scope project }"`
- OpenClaw (project): `powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform openclaw -Scope project }"`

## Quick install

Copy the package that matches your environment into the tool's expected skill or agent directory.

- Codex: `~/.codex/skills/`
- OpenCode: `.opencode/skills/` or `~/.config/opencode/skills/`
- Claude Code: `.claude/agents/` or `~/.claude/agents/`
- OpenClaw: `<workspace>/skills/` or `~/.openclaw/skills/`

Detailed examples are in [docs/installation.md](docs/installation.md).

## Estimated impact

See [docs/impact.md](docs/impact.md) for a Mermaid-based before/after comparison. The short version is that this skill primarily improves delivery discipline: state recovery, validated loops, repair behavior, handoff quality, and release readiness.

## Validation

Run the repository structure check:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check-structure.ps1
```

## License

[MIT](LICENSE)
