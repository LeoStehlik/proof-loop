# Task: pre-hn-readiness

## Task Statement

Make Proof Loop ready for a Show HN audience by turning it from a useful protocol repo into a small, tryable, verified tool with tests, CI, executable wrappers, a realistic demo fixture, and a sharper README entry path.

## Acceptance Criteria

**AC1:** The repository has a real test suite and a single `make test` command that exercises the helper scripts.
- Verify: run `make test`; it must pass and cover task initialization, invalid task IDs, unverified FAIL, completed PASS, invalid JSON, and non-empty `problems.md`.

**AC2:** Proof Loop can be invoked from another repository through executable wrapper commands, not only by running `python3 scripts/...` inside the cloned repo.
- Verify: from a temporary directory outside this repo, run `bin/proof-loop-init` and `bin/proof-loop-check` using absolute paths; initialization must create `.agent/tasks/<TASK_ID>/` in that external directory and the check must fail until the task is verified.

**AC3:** The repo includes a realistic demo fixture whose proof artifacts correspond to an actual file and check command.
- Verify: run the demo check command documented in the demo evidence; it must pass against files in `examples/demo-repo/`, and the demo task must pass `scripts/check_task.py`.

**AC4:** GitHub Actions CI is present and the README exposes the test badge.
- Verify: `.github/workflows/test.yml` exists, runs `make test`, and README contains the workflow badge.

**AC5:** The README has an HN-ready top section: a 20-second demo and a clear `What This Is Not` section.
- Verify: README contains `20-second demo` and `What This Is Not`, and the commands shown in the demo are backed by actual files/scripts.

## Constraints

- Keep runtime dependencies to Python standard library.
- Do not introduce packaging complexity unless needed.
- Do not remove existing examples, role briefs, or references.
- Keep claims harness-agnostic and honest; do not imply native integrations.

## Non-Goals

- Publishing to PyPI.
- Building a full web demo.
- Creating an umbrella repo or platform brand.
- Adding Loopsmith eval packs in this task.

## Verification Approach

Run `make test`, run the wrappers from outside the repo, run the realistic demo check, run `scripts/check_task.py` against the demo proof task, and finally update `verdict.json` so every AC is PASS only after those checks succeed.
