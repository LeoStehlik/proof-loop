# proof-loop

Multi-agent sprint protocol. Prevents AI coding agents from declaring done without proof.

The core idea: spec freeze before build, role-separated agents, explicit acceptance criteria, durable verdict artifacts in the repo. A sprint is not done until every AC has a PASS verdict from a fresh verifier session.

---

## The Problem

Large multi-agent coding tasks fail in predictable ways:

- The agent claims the job is done without durable proof
- The same session both implements and judges its own work
- Acceptance criteria drift during the task
- A later session cannot tell what was actually verified
- The verifier approves based on code review, not a live test

Proof loop addresses all of these.

---

## The Loop

```
spec freeze -> build -> evidence -> FRESH verify -> fix -> FRESH verify
                                         ^                      |
                                         |______________________|
                                         (repeat until all ACs = PASS)
```

---

## Four Roles

| Role | Does | Never |
|------|------|-------|
| Spec-Freezer | Writes spec.md with explicit ACs | Edits production code |
| Builder | Implements against frozen spec | Verifies own work |
| Verifier | Fresh session, verdicts each AC | Edits production code |
| Fixer | Minimal fix for what verifier flagged | Signs off on completion |

**The verifier is always a fresh session.** The agent that built cannot judge its own work.

---

## Acceptance Criteria Format

```
AC1: A user with locale=de sees all navigation labels in German
     Verify: browser test against demo tenant with German locale

AC2: POST /api/v1/translate/de returns 200 with translated titles
     Verify: curl command or automated test

AC3: Full regression suite passes
     Verify: pnpm test:e2e — all spec files green
```

Good: specific, testable by a third party.
Bad: "Translate the UI", "Make it work in German", "Fix the bugs".

---

## Artifacts (in repo)

```
.agent/tasks/<TASK_ID>/
  spec.md         -- frozen ACs + constraints + non-goals
  verdict.json    -- AC verdicts per phase (PASS/FAIL/UNKNOWN)
  problems.md     -- specific failures with file/line refs
  evidence.md     -- prose build summary (optional)
```

---

## Installation

### OpenClaw

```json
{
  "skills": {
    "load": {
      "extraDirs": ["/path/to/your/skills"]
    }
  }
}
```

```bash
git clone https://github.com/LeoStehlik/proof-loop.git /path/to/your/skills/proof-loop
```

### Claude Code / Codex

Copy the `proof-loop` folder into `.agents/skills/` or `.claude/skills/`, then invoke with `/proof-loop`.

---

## What's Inside

```
proof-loop/
├── SKILL.md                           Core protocol + role table
└── references/
    ├── workflow.md                    Full phase-by-phase spec
    ├── brief-template.md              Copy-paste brief + role prompts
    └── artifacts.md                   spec.md / verdict.json / problems.md schemas
```

---

## Inspiration

Inspired by [repo-task-proof-loop](https://github.com/DenisSergeevitch/repo-task-proof-loop). Built as our own implementation with a focus on multi-agent team workflows and the lessons from running real sprints.

---

## License

MIT - see [LICENSE](LICENSE)
