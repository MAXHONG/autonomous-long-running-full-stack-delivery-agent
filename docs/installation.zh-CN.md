# 安装说明

这个仓库按目标平台提供了不同的包，请安装与你的工具匹配的版本。

## 一行安装命令

### Bash

- Codex：`curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- codex`
- OpenCode（项目级）：`curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- opencode --scope project`
- OpenCode（用户级）：`curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- opencode --scope user`
- Claude Code（项目级）：`curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- claude-code --scope project`
- Claude Code（用户级）：`curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- claude-code --scope user`
- OpenClaw（项目级）：`curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- openclaw --scope project`
- OpenClaw（用户级）：`curl -fsSL https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.sh | bash -s -- openclaw --scope user`

### PowerShell

- Codex：`powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform codex }"`
- OpenCode（项目级）：`powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform opencode -Scope project }"`
- OpenCode（用户级）：`powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform opencode -Scope user }"`
- Claude Code（项目级）：`powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform claude-code -Scope project }"`
- Claude Code（用户级）：`powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform claude-code -Scope user }"`
- OpenClaw（项目级）：`powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform openclaw -Scope project }"`
- OpenClaw（用户级）：`powershell -NoProfile -ExecutionPolicy Bypass -Command "& { iwr 'https://raw.githubusercontent.com/MAXHONG/autonomous-long-running-full-stack-delivery-agent/main/scripts/install.ps1' -UseBasicParsing | iex; Install-DeliveryAgentSkill -Platform openclaw -Scope user }"`

## Codex

目标路径：

- 用户级：`~/.codex/skills/autonomous-long-running-full-stack-delivery-agent`

复制目录：

```bash
cp -R packages/codex/autonomous-long-running-full-stack-delivery-agent ~/.codex/skills/
```

Windows PowerShell：

```powershell
Copy-Item -Recurse -Force .\packages\codex\autonomous-long-running-full-stack-delivery-agent "$HOME\.codex\skills\"
```

## OpenCode

OpenCode 会从以下位置发现技能：

- 项目级：`.opencode/skills/<name>/SKILL.md`
- 全局：`~/.config/opencode/skills/<name>/SKILL.md`

复制到项目目录：

```bash
mkdir -p .opencode/skills
cp -R packages/opencode/.opencode/skills/autonomous-long-running-full-stack-delivery-agent .opencode/skills/
```

Windows PowerShell：

```powershell
New-Item -ItemType Directory -Force .\.opencode\skills | Out-Null
Copy-Item -Recurse -Force .\packages\opencode\.opencode\skills\autonomous-long-running-full-stack-delivery-agent .\.opencode\skills\
```

## Claude Code

这个仓库为 Claude Code 提供的是原生子代理文件。

目标路径：

- 项目级：`.claude/agents/`
- 用户级：`~/.claude/agents/`

项目内安装：

```bash
mkdir -p .claude/agents
cp packages/claude-code/.claude/agents/autonomous-long-running-full-stack-delivery-agent.md .claude/agents/
```

Windows PowerShell：

```powershell
New-Item -ItemType Directory -Force .\.claude\agents | Out-Null
Copy-Item -Force .\packages\claude-code\.claude\agents\autonomous-long-running-full-stack-delivery-agent.md .\.claude\agents\
```

## OpenClaw

OpenClaw 会从以下位置加载技能：

- 工作区：`<workspace>/skills`
- 用户级：`~/.openclaw/skills`

工作区安装：

```bash
mkdir -p skills
cp -R packages/openclaw/skills/autonomous-long-running-full-stack-delivery-agent skills/
```

Windows PowerShell：

```powershell
New-Item -ItemType Directory -Force .\skills | Out-Null
Copy-Item -Recurse -Force .\packages\openclaw\skills\autonomous-long-running-full-stack-delivery-agent .\skills\
```

另外，这个仓库还提供了 `packages/openclaw/openclaw.plugin.json`，可以按插件方式接入。

## 推荐首条指令

```text
Use the autonomous-long-running-full-stack-delivery-agent to continue this project with persistent state files, small validated delivery loops, and minimal user interruptions.
```
