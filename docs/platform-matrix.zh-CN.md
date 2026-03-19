# 平台矩阵

这个仓库把同一个“长期运行交付代理”能力，按不同平台的原生格式做了打包。

| 平台 | 仓库中的原生打包方式 | 官方发现路径 | 说明 |
| --- | --- | --- | --- |
| Codex | `packages/codex/autonomous-long-running-full-stack-delivery-agent/` | `~/.codex/skills/<name>/` | 使用 `SKILL.md` 和 `agents/openai.yaml`。 |
| OpenCode | `packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent/` | `.opencode/skills/<name>/` 或 `~/.config/opencode/skills/<name>/` | 使用 Agent Skills frontmatter，并加上 `license`、`compatibility`、`metadata`。 |
| Claude Code | `packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md` | `.claude/agents/` 或 `~/.claude/agents/` | 采用原生子代理形式，更适合长期运行、专业化的代理角色。 |
| OpenClaw | `packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent/` | `<workspace>/skills/<name>/` 或 `~/.openclaw/skills/<name>/` | 使用 AgentSkills 兼容格式，并额外提供 `openclaw.plugin.json` 插件清单。 |

## 设计取舍

- Codex 版本保留 Codex 原生 `agents/openai.yaml`。
- OpenCode 版本改为纯 Agent Skills 风格，不依赖 Codex 元数据。
- Claude Code 版本使用单文件原生子代理，方便直接复制安装。
- OpenClaw 版本保留 Agent Skills 兼容性，并补上插件清单以支持插件式接入。

## 官方参考

- OpenCode Agent Skills：<https://opencode.ai/docs/skills>
- Claude Code Subagents：<https://docs.anthropic.com/en/docs/claude-code/sub-agents>
- OpenClaw Skills：<https://docs.openclaw.ai/tools/skills>
- OpenClaw Plugin Manifest：<https://docs.openclaw.ai/plugins/manifest>
