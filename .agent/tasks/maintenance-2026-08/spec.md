# Task: maintenance-2026-08

## Task Statement

Refresh Proof Loop public maintenance surface after the repo sat mostly unchanged since May.

## Acceptance Criteria

**AC1:** GitHub release hygiene reflects the current tag line.
- Verify: `gh release list -R LeoStehlik/proof-loop --limit 10` shows `v0.2.1` as the latest release, with `v0.2.0` also present or otherwise accounted for.

**AC2:** README conversion path is clearer for a new visitor.
- Verify: `README.md` presents a short start/run/check path before the deeper protocol explanation, without removing existing protocol detail, examples, or safety boundaries.

**AC3:** A fresh Proof Loop artifact records this maintenance pass.
- Verify: `.agent/tasks/maintenance-2026-08/` contains frozen ACs, evidence, empty problems, and a verifier PASS verdict for each AC.

**AC4:** Public roadmap/maintenance issues exist for follow-up chores.
- Verify: `gh issue list -R LeoStehlik/proof-loop --state open --limit 10` shows small, concrete follow-up issues covering release/docs/example/distribution maintenance.

## Constraints

- Keep scope to Leo-approved items 1-4: release hygiene, README conversion pass, fresh proof artifact, and roadmap/issues.
- Do not add feature scope or change the Proof Loop protocol semantics.
- Keep scripts stdlib-only and existing tests green.
- Do all repo/GitHub work from kobe, not the Mac mini.

## Non-Goals

- No new package manager or install mechanism.
- No ClawHub publish unless separately decided.
- No native plugin wrapper.
- No HN/social posting.

## Verification Approach

Run `make test`, inspect README diff, inspect GitHub releases/issues with `gh`, and run `bin/proof-loop check .agent/tasks/maintenance-2026-08` after verifier artifacts are written.
