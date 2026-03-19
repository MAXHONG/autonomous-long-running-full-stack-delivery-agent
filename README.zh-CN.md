# 自治式长期运行全栈交付代理

这是 `autonomous-long-running-full-stack-delivery-agent` 技能的多平台开源打包仓库，面向 Codex、OpenCode、Claude Code 和 OpenClaw 提供可直接安装的版本，并配套中英文文档与安装说明。

## 仓库内容

- Codex 原生 Skill 包
- OpenCode 兼容 Agent Skills 包
- Claude Code 原生子代理包
- OpenClaw 兼容 Skill 包和插件清单
- 中英文说明文档
- 任务模板、状态文件样例和安装说明

## 这个技能解决什么问题

这个技能不是为了“一次性生成示例代码”，而是为了真实项目交付。它会强约束代理：

- 用户给出明确目标后默认持续推进
- 依赖文件状态恢复，而不是只靠对话记忆
- 按小闭环开发，每个闭环都要可验证
- 每实现一个模块就立刻测试
- 测试失败先修复，再继续开发
- 持续维护 `task.json`、`progress.md`、`architecture.md`、`handoff.md`
- 最终补齐文档、打包、交接、发布说明

## 仓库结构

```text
packages/
  codex/
  opencode/
  claude-code/
  openclaw/
docs/
scripts/
```

## 平台版本

| 平台 | 包路径 | 原生格式 |
| --- | --- | --- |
| Codex | `packages/codex/autonomous-long-running-full-stack-delivery-agent` | `SKILL.md` + `agents/openai.yaml` |
| OpenCode | `packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent` | Agent Skills `SKILL.md` |
| Claude Code | `packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md` | 子代理 Markdown 文件 |
| OpenClaw | `packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent` | Agent Skills `SKILL.md` |

## 文档入口

- 英文 README：[README.md](README.md)
- 安装说明：[docs/installation.zh-CN.md](docs/installation.zh-CN.md)
- 英文安装说明：[docs/installation.md](docs/installation.md)
- 平台矩阵：[docs/platform-matrix.zh-CN.md](docs/platform-matrix.zh-CN.md)
- 英文平台矩阵：[docs/platform-matrix.md](docs/platform-matrix.md)

## 快速安装

把对应平台的包复制到工具约定的技能或代理目录即可：

- Codex：`~/.codex/skills/`
- OpenCode：`.opencode/skills/` 或 `~/.config/opencode/skills/`
- Claude Code：`.claude/agents/` 或 `~/.claude/agents/`
- OpenClaw：`<workspace>/skills/` 或 `~/.openclaw/skills/`

具体命令示例见 [docs/installation.zh-CN.md](docs/installation.zh-CN.md)。

## 结构检查

运行仓库结构检查脚本：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check-structure.ps1
```

## 许可证

[MIT](LICENSE)
