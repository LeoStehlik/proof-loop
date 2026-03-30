---
name: proof-loop
description: Multi-agent sprint protocol that prevents AI coding agents from declaring done without proof. Enforces spec freeze before build, role-separated subagents (builder never verifies own work), explicit acceptance criteria (AC1, AC2...), and durable verdict artifacts in the repo. Use when briefing agents on any non-trivial coding task, sprint, or feature where you need verifiable proof of completion. Works with Codex, Claude Code, OpenClaw subagents, or any multi-agent setup.
---

# Proof Loop

A sprint is not done until every acceptance criterion has a PASS verdict from a fresh verifier session.

Read `references/workflow.md` for the full loop spec.
Read `references/brief-template.md` for the agent brief format.
Read `references/artifacts.md` for the artifact schema.

## The Loop

```
spec freeze -> build -> evidence -> FRESH verify -> fix -> FRESH verify
                                         ^                      |
                                         |______________________|
                                         (repeat until all ACs = PASS)
```

## Four Roles — Always Separate

| Role | Does | Never |
|------|------|-------|
| **Spec-Freezer** | Writes spec.md with explicit ACs | Edits production code |
| **Builder** | Implements against frozen spec | Verifies own work |
| **Verifier** | Fresh session — verdicts each AC | Edits production code |
| **Fixer** | Minimal fix for what verifier flagged | Signs off on completion |

**The verifier is always a fresh session.** The agent that built cannot judge its own work.

## Acceptance Criteria Format

Every sprint brief must include explicit ACs before build starts:

```
AC1: [specific, testable condition — not a task description]
AC2: [specific, testable condition]
AC3: [specific, testable condition]
```

Good: "AC1: A German-locale user sees all prompt form field labels in German"
Bad: "AC1: Translate the form fields"

## Sprint is DONE Only When

- Every AC has a PASS verdict in the verifier's `verdict.json`
- No problems remain in `problems.md`
- Full regression suite passes (if applicable)

## Artifacts (stored in repo)

```
.agent/tasks/<TASK_ID>/
  spec.md         -- frozen ACs + constraints + non-goals
  verdict.json    -- AC verdicts per phase (PASS/FAIL/UNKNOWN)
  problems.md     -- specific failures with file/line refs (if any)
```

See `references/artifacts.md` for schemas.
