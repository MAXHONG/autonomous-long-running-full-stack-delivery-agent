# Input / Output Contract

在需要把此技能封装给其他代理、自动化入口或工作流系统时，优先使用以下结构。

## 推荐输入参数 JSON

```json
{
  "project_name": "string",
  "project_goal": "string",
  "success_criteria": [
    "string"
  ],
  "repository": {
    "root_path": "string",
    "remote_url": "string",
    "default_branch": "main"
  },
  "product_scope": {
    "must_have": ["string"],
    "nice_to_have": ["string"],
    "out_of_scope": ["string"]
  },
  "business_rules": [
    "string"
  ],
  "technical_constraints": [
    "string"
  ],
  "preferred_stack": [
    "string"
  ],
  "environment": {
    "os": "string",
    "runtime": {
      "node": "string",
      "python": "string",
      "java": "string",
      "dotnet": "string"
    },
    "package_manager": "string",
    "network_access": true,
    "browser_automation": true,
    "docker_available": true,
    "ci_access": false,
    "release_access": false
  },
  "delivery_expectations": {
    "need_readme": true,
    "need_architecture_doc": true,
    "need_tests": true,
    "need_ci": true,
    "need_docker": false,
    "need_release_package": false,
    "need_github_push": false,
    "need_github_release": false
  },
  "credentials_status": {
    "available": ["string"],
    "missing": ["string"]
  },
  "risk_policy": {
    "allow_destructive_ops": false,
    "require_confirmation_for_prod": true,
    "require_confirmation_for_migration": true,
    "require_confirmation_for_paid_actions": true
  },
  "state_files": {
    "task_file": "task.json",
    "progress_file": "progress.md",
    "architecture_file": "architecture.md",
    "handoff_file": "handoff.md",
    "bootstrap_script": "bootstrap.sh",
    "run_script": "run-dev.sh"
  }
}
```

## 推荐阶段汇报格式

```md
## 当前阶段
初始化 / 恢复执行 / 开发闭环 / 缺陷修复 / 综合验证 / 发布交付 / 阻塞

## 本轮目标
一句话说明本轮只主攻的闭环任务。

## 已执行
- 动作 1
- 动作 2
- 动作 3

## 验证结果
- `命令或测试动作`：通过 / 失败
- `命令或测试动作`：通过 / 失败
- 关键证据：一句话摘要

## 状态文件更新
- `task.json`：更新了哪些任务状态
- `progress.md`：记录了哪些内容
- `architecture.md`：是否更新
- `handoff.md`：是否更新

## 风险 / 阻塞
- 无
或
- 阻塞项：xxx
- 所需最小人工输入：xxx

## 下一闭环
一句话说明下一个将继续推进的任务；若未阻塞，不请求用户回复“继续”。
```

## 推荐最终交付汇报字段

最终交付至少覆盖：

- 项目目标
- 已完成项
- 未完成项
- 已知问题
- 测试结果
- 启动与使用方式
- 交付物位置
- Git / 发布状态
- 状态文件摘要
- 后续建议
