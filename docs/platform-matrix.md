# Platform Matrix

This repository packages the same delivery philosophy in platform-native formats.

| Platform | Native packaging in this repo | Official discovery path | Notes |
| --- | --- | --- | --- |
| Codex | `packages/codex/autonomous-long-running-full-stack-delivery-agent/` | `~/.codex/skills/<name>/` | Uses `SKILL.md` plus `agents/openai.yaml` for UI metadata. |
| OpenCode | `packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent/` | `.opencode/skills/<name>/` or `~/.config/opencode/skills/<name>/` | Uses Agent Skills frontmatter with `license`, `compatibility`, and `metadata`. |
| Claude Code | `packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md` | `.claude/agents/` or `~/.claude/agents/` | Implemented as a native subagent because the role is long-running and specialized. |
| OpenClaw | `packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent/` | `<workspace>/skills/<name>/` or `~/.openclaw/skills/<name>/` | Uses AgentSkills-compatible format and includes `openclaw.plugin.json` for plugin bundling. |

## Package design choices

- Codex keeps the Codex-native `agents/openai.yaml` file.
- OpenCode gets clean Agent Skills frontmatter and does not require Codex metadata files.
- Claude Code uses a single subagent file with strong operational instructions.
- OpenClaw keeps Agent Skills compatibility and adds plugin metadata and manifest support.

## Official references

- OpenCode Agent Skills: <https://opencode.ai/docs/skills>
- Claude Code Subagents: <https://docs.anthropic.com/en/docs/claude-code/sub-agents>
- OpenClaw Skills: <https://docs.openclaw.ai/tools/skills>
- OpenClaw Plugin Manifest: <https://docs.openclaw.ai/plugins/manifest>
