# Task: show-hn-standout

## Task Statement

Build the next five standout Proof Loop slices so the repo is stronger than a normal Show HN-shaped project while staying small, harness-agnostic, and honest.

## Acceptance Criteria

**AC1:** The repo has a unified `proof-loop` CLI with `init`, `check`, `status`, `list`, `doctor`, `report`, and `install-guides` subcommands.
- Verify: run `bin/proof-loop --help`, `bin/proof-loop init`, `check`, `status`, `list`, `doctor`, and `report` in tests or smoke commands.

**AC2:** The repo has a machine-readable proof bundle with JSON schemas, `evidence.json`, `raw/` logs, and schema validation.
- Verify: run schema validation through the CLI/tests; `schemas/*.schema.json` exist; demo proof includes `evidence.json` and `raw/` logs.

**AC3:** The repo has opt-in harness adapter templates and a dry-run guide installer.
- Verify: run `bin/proof-loop install-guides --dry-run --harness codex --harness claude --harness opencode --harness hermes`; it must print planned writes without mutating files.

**AC4:** The repo has a real failing-to-passing demo transcript driven by `make demo`.
- Verify: run `make demo`; output must show an initial failing check, a fix, evidence/report generation, and final PASS.

**AC5:** The repo can generate a Markdown proof report for a task.
- Verify: run `bin/proof-loop report examples/demo-repo/.agent/tasks/nav-labels-proof --format md`; output must contain task id, overall status, AC table, evidence summary, raw log references, and problems state.

## Constraints

- Keep Python standard-library only.
- Keep the CLI simple; do not introduce package publishing work.
- Do not silently mutate AGENTS/CLAUDE/OpenCode/Hermes guides; guide installation must support dry-run.
- Preserve existing commands and tests.

## Non-Goals

- PyPI packaging.
- HTML report generation in this slice.
- Native integration with any harness.
- Full subagent orchestration.

## Verification Approach

Run `make test`, `make demo`, external CLI smoke checks, `bin/proof-loop doctor`, `bin/proof-loop report`, and `scripts/check_task.py .agent/tasks/show-hn-standout` after evidence is updated.
