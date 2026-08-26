# Evidence: maintenance-2026-08

## Scope

Leo approved Proof Loop maintenance items 1-4:

1. Release hygiene.
2. README conversion pass.
3. Fresh proof artifact.
4. Public roadmap/maintenance issues.

## Changes Made

### Release hygiene

Published missing GitHub Releases for existing tags:

- `v0.2.0 - Public surface refresh`: https://github.com/LeoStehlik/proof-loop/releases/tag/v0.2.0
- `v0.2.1 - Safety boundary clarification`: https://github.com/LeoStehlik/proof-loop/releases/tag/v0.2.1

Verification command:

```bash
gh release list -R LeoStehlik/proof-loop --limit 10
```

Observed result:

```text
v0.2.1 - Safety boundary clarification  Latest  v0.2.1  2026-08-26T09:20:05Z
v0.2.0 - Public surface refresh                  v0.2.0  2026-08-26T09:19:50Z
v0.1.0 - Proof Loop                              v0.1.0  2026-05-20T16:15:12Z
```

### README conversion pass

Updated `README.md` with a near-top `Start Here` section showing:

- clone the repo
- run `make test`
- run `bin/proof-loop doctor`
- initialize a proof-tracked task in another repo
- run the mechanical done gate and expect it to fail until verifier PASS artifacts exist

No protocol semantics, scripts, schemas, or examples were changed.

### Fresh Proof Loop artifact

Created `.agent/tasks/maintenance-2026-08/` with:

- `spec.md`
- `evidence.md`
- `verdict.json` pending fresh verifier write
- `problems.md` pending fresh verifier write

### Public roadmap/maintenance issues

Created four public GitHub issues:

- #1 Add a compact real-world proof artifact example: https://github.com/LeoStehlik/proof-loop/issues/1
- #2 Tighten install and adoption docs: https://github.com/LeoStehlik/proof-loop/issues/2
- #3 Evaluate minimal distribution options: https://github.com/LeoStehlik/proof-loop/issues/3
- #4 Maintain release notes and project status: https://github.com/LeoStehlik/proof-loop/issues/4

Labels added through the GitHub API because the first label path failed.

## Verification Commands Run By Builder

```bash
make test
gh release list -R LeoStehlik/proof-loop --limit 10
gh issue list -R LeoStehlik/proof-loop --state open --limit 10 --json number,title,labels,url
git diff -- README.md .agent/tasks/maintenance-2026-08/spec.md
```

`make test` passed locally on kobe:

```text
Ran 10 tests in 0.784s
OK
NAV_LABEL_CHECK_PASS
PROOF_LOOP_PASS examples/example-task/.agent/tasks/ui-language-fix
PROOF_LOOP_PASS examples/demo-repo/.agent/tasks/nav-labels-proof
PROOF_LOOP_DOCTOR_PASS
PROOF_LOOP_SCHEMA_PASS examples/demo-repo/.agent/tasks/nav-labels-proof
```

## Operator Note

While first writing this evidence file, a shell heredoc delimiter collision caused part of the intended evidence text to be interpreted as shell commands. The session was interrupted. A registry metadata check from the Mac mini showed public latest versions unchanged for `x-search-oauth`, `better-every-run`, and `human-writing`; no Proof Loop repo files besides this evidence rewrite were affected.

## Notes

- `clawhub` was not available on kobe non-interactive PATH for an intentional Proof Loop ClawHub check, so this pass did not publish or inspect Proof Loop on ClawHub.
- No new package or distribution machinery was added.
