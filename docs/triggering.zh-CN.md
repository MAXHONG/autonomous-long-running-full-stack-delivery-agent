# 触发说明

这个技能最准确的理解方式是：**支持自动发现，但显式调用最稳妥。**

## 简短结论

- Codex：可以自动选中，但前提是用户请求和技能描述高度匹配；显式写 `$autonomous-long-running-full-stack-delivery-agent` 更稳。
- OpenCode：会自动发现技能，并在需要时通过原生 `skill` 工具按需加载。
- Claude Code：当任务和 subagent 的 `description` 匹配时，可以自动委派给这个 subagent。
- OpenClaw：符合条件的技能会自动进入技能系统；如果设置了 `user-invocable: true`，还可以作为用户可直接调用的 slash 风格技能。

## Codex

在 Codex 风格的技能系统里，通常是这样触发的：

- 系统先根据技能的 `name` 和 `description` 识别它
- 只有当技能被选中后，`SKILL.md` 的正文才会被真正加载
- 所以最稳的方式仍然是显式点名技能

推荐显式调用写法：

```text
Use $autonomous-long-running-full-stack-delivery-agent to continue this project with persistent state files, small validated delivery loops, and minimal user interruptions.
```

## OpenCode

根据 OpenCode 官方文档，技能会从约定目录中被发现，并且“通过原生 `skill` 工具按需加载”；也就是说，agent 会先看到可用技能的名称和描述，需要时再加载完整内容。

这意味着：

- 只要装到了正确目录，OpenCode 会自动发现这个技能
- 模型会看到技能的 `name` 和 `description`
- 只有模型决定使用时，才会加载完整 `SKILL.md`
- `description` 越具体，自动选中的准确率越高

不过，第一次使用时仍然推荐显式调用。

## Claude Code

根据 Claude Code 官方文档：“当 Claude 遇到与某个 subagent 描述相匹配的任务时，它会委派给该 subagent。” 也就是说，`description` 就是它自动委派的主路由信号。

这意味着：

- 这个 subagent 可以被自动委派
- `description` 字段直接决定什么时候更容易被调用
- 你也可以显式写：

```text
Use the autonomous-long-running-full-stack-delivery-agent to continue this project.
```

另外，如果你是手工把文件放进 `.claude/agents/`，Claude Code 一般在 session 启动时加载 subagent，所以最好重启会话或用 `/agents` 立刻加载。

## OpenClaw

根据 OpenClaw 官方文档：

- 技能会从 bundled、managed、workspace 等目录自动加载
- 加载时还会根据环境、配置、二进制依赖等做过滤
- `user-invocable: true` 会把技能暴露成用户可直接调用的 slash 命令
- `disable-model-invocation: true` 则会禁止模型自动调用

这个仓库里的 OpenClaw 版本已经设置了 `user-invocable: true`，所以它同时支持：

- 在满足条件时被模型侧自动使用
- 被用户直接以 slash 风格显式调用

## 实战建议

如果你希望它“尽量容易被自动触发”，建议这样做：

1. 让 `description` 足够具体。
2. 把 long-running、persistent state、testing、repair、handoff 等关键词写进描述。
3. 第一次使用时显式点名技能。
4. 跑通一次后，再让平台依赖自动发现和自动选择。

## 官方参考

- OpenCode Agent Skills：<https://opencode.ai/docs/skills>
- Claude Code Subagents：<https://docs.anthropic.com/en/docs/claude-code/sub-agents>
- OpenClaw Skills：<https://docs.openclaw.ai/tools/skills>
