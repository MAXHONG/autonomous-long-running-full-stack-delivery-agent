# Triggering Guide

This skill is best understood as **auto-discoverable, but explicit invocation is the most reliable path**.

## Short answer

- Codex: yes, it can be selected automatically when the request clearly matches the skill description; explicit `$autonomous-long-running-full-stack-delivery-agent` is more reliable.
- OpenCode: yes, skills are discovered automatically and loaded on demand via the native `skill` tool.
- Claude Code: yes, subagents can be delegated automatically when the task matches the subagent description.
- OpenClaw: yes, eligible skills are loaded into the skill system automatically; if `user-invocable: true`, they can also be run as slash-style user-invocable skills.

## Codex

In Codex-style skill systems, the usual behavior is:

- the skill is made available from its `name` and `description`
- the body of `SKILL.md` is loaded only after the skill is selected
- explicit invocation with the skill name is the most reliable trigger

Recommended explicit prompt:

```text
Use $autonomous-long-running-full-stack-delivery-agent to continue this project with persistent state files, small validated delivery loops, and minimal user interruptions.
```

## OpenCode

Per the OpenCode docs, skills are discovered from skill directories and are “loaded on-demand via the native `skill` tool”; agents see available skills and can load the full content when needed.

That means:

- OpenCode discovers the skill automatically if the folder is installed in a supported location
- the model sees the skill `name` and `description`
- the full skill content is loaded only when the model chooses to load it
- a more specific description improves auto-selection accuracy

Explicit usage is still the most deterministic path.

## Claude Code

Per the Claude Code subagents docs, “when Claude encounters a task that matches a subagent’s description, it delegates to that subagent.” Claude also uses the subagent description to decide when to delegate.

That means:

- the subagent can be delegated automatically
- the `description` field is the main routing signal
- users can also invoke it explicitly with wording such as:

```text
Use the autonomous-long-running-full-stack-delivery-agent to continue this project.
```

If you add the file manually, Claude Code loads subagents at session start, so restart the session or use `/agents` to load it immediately.

## OpenClaw

Per the OpenClaw skills docs:

- skills are loaded from bundled, managed, and workspace locations
- skills are filtered at load time based on environment, config, and binary presence
- `user-invocable: true` exposes the skill as a user slash command
- `disable-model-invocation: true` would hide it from model-triggered invocation

For this repository, the OpenClaw package is configured with `user-invocable: true`, so it supports:

- automatic model-side availability when eligible
- direct user invocation as a slash-style skill

## Practical recommendation

If you want the skill to fire as often as possible:

1. Keep the `description` concrete and high-signal.
2. Mention long-running delivery, persistent state files, testing, repair, and handoff in the description.
3. Use explicit invocation in the first prompt.
4. After the first successful run, let the platform reuse or rediscover it automatically.

## How to maximize automatic triggering

### Codex

- Keep the skill in `~/.codex/skills/<name>/`.
- Make the `description` read like a routing rule, not a slogan.
- Include verbs users actually say: continue, take over, recover, fix, test, document, ship.

### OpenCode

OpenCode says skills are loaded on-demand and controlled by `permission.skill` rules. If automatic loading feels weak:

- install the skill in `.opencode/skills/` or `~/.config/opencode/skills/`
- ensure the `skill` tool is not disabled
- prefer `"*": "allow"` or an explicit allow rule for this skill in `opencode.json`

Example:

```json
{
  "permission": {
    "skill": {
      "*": "allow",
      "autonomous-long-running-full-stack-delivery-agent": "allow"
    }
  }
}
```

### Claude Code

Claude Code docs explicitly say to include phrases like “use proactively” in the description to encourage automatic delegation. This repository already does that for the Claude Code variant.

If you want even stronger behavior:

- install the agent at project level so it stays close to the repo
- mention the agent name in the first request
- use `@agent-autonomous-long-running-full-stack-delivery-agent` when you need guaranteed invocation
- use `--agent autonomous-long-running-full-stack-delivery-agent` if you want the whole session to run under this agent

### OpenClaw

OpenClaw loads workspace skills with the highest precedence. If you want more automatic use:

- install into `<workspace>/skills/` instead of only `~/.openclaw/skills/`
- keep `user-invocable: true`
- keep `disable-model-invocation: false`
- avoid metadata requirements that would filter the skill out at load time

## Official references

- OpenCode Agent Skills: <https://opencode.ai/docs/skills>
- Claude Code Subagents: <https://docs.anthropic.com/en/docs/claude-code/sub-agents>
- OpenClaw Skills: <https://docs.openclaw.ai/tools/skills>
