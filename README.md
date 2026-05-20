# Proof Loop

**Finish AI coding work with evidence, not vibes.**

Proof Loop is a lightweight protocol and toolkit for non-trivial coding tasks handled by AI agents. It freezes acceptance criteria before the build, separates builder and verifier roles, records durable proof artifacts in the repo, and refuses to call work done until every acceptance criterion has a fresh PASS verdict.

Use it when an agent, team, or multi-agent sprint needs a hard boundary against false completion claims.

## Why It Exists

AI coding agents often fail in predictable ways:

- they claim completion without durable proof
- the same session builds and judges its own work
- acceptance criteria drift while implementation is underway
- verification is a prose summary instead of a live check
- future sessions cannot tell what was actually tested

Proof Loop makes completion auditable. A task is done only when a fresh verifier has checked each AC and the repo contains the artifacts to prove it.

## What You Get

- a clear sprint protocol: spec freeze -> build -> evidence -> fresh verify -> fix loop
- role boundaries for orchestrator, spec-freezer, builder, verifier, and fixer
- helper scripts to initialize and check task proof folders
- a complete example task with passing artifacts
- copy-paste role briefs for Codex, Claude Code, OpenClaw, or any agent setup
- a documented boundary with Loopsmith for recurring behaviour improvement

## Quick Start

Clone the repo or copy it into the project where you want to run the protocol.

Create a task proof folder:

```bash
python3 scripts/init_task.py ui-language-fix --title "Fix German navigation labels"
```

This creates:

```text
.agent/tasks/ui-language-fix/
  spec.md
  verdict.json
  problems.md
  evidence.md
```

Fill `spec.md` with explicit acceptance criteria before implementation starts.

After the build and verifier pass, check whether the task is allowed to be called done:

```bash
python3 scripts/check_task.py .agent/tasks/ui-language-fix
```

The check exits non-zero unless:

- `verdict.json` has `overall: PASS`
- every AC has `status: PASS`
- `problems.md` is empty or absent

## The Protocol

```text
spec freeze -> build -> evidence -> fresh verify -> fix -> fresh verify
                                         ^                    |
                                         |____________________|
                                      repeat until all ACs PASS
```

## Roles

| Role | Does | Never |
|---|---|---|
| Orchestrator | Keeps the loop intact and refuses weak completion | Accepts narrative-only proof |
| Spec-Freezer | Writes frozen `spec.md` with explicit ACs | Edits production code |
| Builder | Implements against the frozen spec | Verifies own work as final |
| Verifier | Fresh session that checks each AC | Edits production code |
| Fixer | Applies minimal fixes for verifier findings | Signs off on completion |

The verifier must be a fresh session. The agent that built the change does not judge whether the change is done.

## Acceptance Criteria

Good ACs are specific and testable by a third party.

```text
AC1: A user with locale=de sees all navigation labels in German after saving language preference.
     Verify: browser check against a German-locale test user.

AC2: The language preference survives page reload.
     Verify: reload the page and confirm the saved locale and labels remain German.

AC3: Existing English navigation remains unchanged for locale=en.
     Verify: switch back to English and confirm the original labels render.
```

Weak ACs are task descriptions, not proof conditions:

```text
AC1: Translate the UI.
AC2: Make language switching work.
AC3: Fix the bugs.
```

## Artifacts

Every task stores proof under `.agent/tasks/<TASK_ID>/`.

```text
.agent/tasks/<TASK_ID>/
  spec.md       frozen ACs, constraints, non-goals, verification approach
  evidence.md   build summary and checks run
  verdict.json  structured verifier result: PASS / FAIL / UNKNOWN per AC
  problems.md   specific open failures, empty when no problems remain
```

See [`references/artifacts.md`](references/artifacts.md) for schemas.

## Examples

A complete passing example lives at:

```text
examples/example-task/.agent/tasks/ui-language-fix/
```

Role prompts live at:

```text
examples/role-briefs/
  orchestrator.md
  spec-freezer.md
  builder.md
  verifier.md
  fixer.md
```

## Proof Loop vs Loopsmith

Proof Loop governs a single task.

Loopsmith improves repeated agent behaviour over time.

Use Proof Loop when you need a specific task to finish with evidence. Use [Loopsmith](https://github.com/LeoStehlik/loopsmith) when the same failure pattern keeps coming back and you want to improve the agent, prompt, policy, or evaluator itself.

See [`references/loopsmith-bridge.md`](references/loopsmith-bridge.md).

## Installation As A Skill

### OpenClaw

Add your skills directory to `openclaw.json`:

```json
{
  "skills": {
    "load": {
      "extraDirs": ["/path/to/your/skills"]
    }
  }
}
```

Clone this repo into that directory:

```bash
git clone https://github.com/LeoStehlik/proof-loop.git /path/to/your/skills/proof-loop
```

### Codex / Claude Code

Copy the `proof-loop` folder into your agent skills directory, or reference `SKILL.md` directly in your task brief.

## Repository Map

```text
proof-loop/
  SKILL.md                         skill trigger and core operating rules
  scripts/
    init_task.py                   create .agent/tasks/<TASK_ID>/ skeletons
    check_task.py                  mechanical done gate
  references/
    workflow.md                    full phase-by-phase protocol
    brief-template.md              reusable sprint and role prompts
    artifacts.md                   artifact schemas
    loopsmith-bridge.md            when to escalate repeated failures to Loopsmith
  examples/
    example-task/                  complete passing proof artifact example
    role-briefs/                   copy-paste role prompts
```

## Status

Usable protocol skill and small toolkit. The scripts are intentionally stdlib-only so they can run inside almost any repository without packaging ceremony.

## License

MIT - see [LICENSE](LICENSE).

## Attribution

Inspired by [`repo-task-proof-loop`](https://github.com/DenisSergeevitch/repo-task-proof-loop), adapted for practical multi-agent coding work and public agent-operation skills.
