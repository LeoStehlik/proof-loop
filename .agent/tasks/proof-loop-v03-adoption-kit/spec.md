# Task: proof-loop-v03-adoption-kit

## Task Statement

Ship Proof Loop v0.3.0 as an adoption release that turns existing credibility into practical installation and task-use proof.

## Acceptance Criteria

**AC1:** README presents a fast adoption path before the deeper protocol material.
- Verify: inspect README for clone/test/init/check/report commands and links to the adoption kit.

**AC2:** A standalone adoption kit gives copy-paste builder/verifier flow.
- Verify: `docs/adoption-kit.md` contains task creation, AC freeze, builder prompt, fresh verifier prompt, done gate, and good-state checklist.

**AC3:** A compact completed proof artifact example exists and passes the mechanical done gate.
- Verify: run `bin/proof-loop check examples/adoption-kit/.agent/tasks/checkout-empty-state-proof`.

**AC4:** Existing tests and examples remain green.
- Verify: run `make test`.

**AC5:** Release surfaces identify v0.3.0.
- Verify: inspect `SKILL.md`, Git tag/release, and GitHub Actions after release.

**AC6:** ClawHub visibility is verified or explicitly recorded if registry propagation lags.
- Verify: publish/install/inspect `proof-loop@0.3.0` from a clean tag archive.

## Constraints

- Keep protocol semantics stable.
- Keep the CLI dependency-free and stdlib-only.
- Do not add external service integration.

## Non-Goals

- No hosted SaaS, benchmark, or agent framework.
- No new package manager distribution mechanism beyond current GitHub/ClawHub release flow.

## Verification Approach

Run local tests, run the new example done gate, inspect docs, release through PR/tag/GitHub, validate clean clone, and verify ClawHub install/inspect from the public registry.
