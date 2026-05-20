# Evidence - pre-hn-readiness

## Build Summary

Implemented the five pre-HN readiness items:

- added `Makefile` with `make test`
- added stdlib unittest coverage under `tests/`
- added executable wrappers `bin/proof-loop-init` and `bin/proof-loop-check`
- added realistic demo fixture under `examples/demo-repo/`
- added GitHub Actions workflow `.github/workflows/test.yml`
- updated README with test badge, `20-second demo`, and `What This Is Not`

## Checks Run

```bash
make test
```

Result:

```text
Ran 7 tests in 0.398s
OK
NAV_LABEL_CHECK_PASS
PROOF_LOOP_PASS examples/example-task/.agent/tasks/ui-language-fix
PROOF_LOOP_PASS examples/demo-repo/.agent/tasks/nav-labels-proof
```

```bash
cd /tmp/proof-loop-wrapper-smoke/other-repo
/home/less/repo-garden-audit/repos/proof-loop/bin/proof-loop-init external-hn --title "External HN smoke" --root .
/home/less/repo-garden-audit/repos/proof-loop/bin/proof-loop-check .agent/tasks/external-hn
```

Result: wrapper init created `.agent/tasks/external-hn/`; wrapper check failed as expected because the task was unverified.

```bash
python3 examples/demo-repo/check_nav_labels.py examples/demo-repo/nav_labels.json
python3 scripts/check_task.py examples/demo-repo/.agent/tasks/nav-labels-proof
```

Result: demo check passed and the demo proof task passed.

## AC1 - PASS

`make test` passes and covers initialization, invalid IDs, unverified failure, completed example pass, invalid JSON, non-empty `problems.md`, and wrappers from another repo.

## AC2 - PASS

`bin/proof-loop-init` and `bin/proof-loop-check` work from a temporary directory outside this repository.

## AC3 - PASS

`examples/demo-repo/` contains a real JSON fixture, a real checker script, and matching proof artifacts. The checker and task gate both pass.

## AC4 - PASS

`.github/workflows/test.yml` runs `make test`; README includes the workflow badge.

## AC5 - PASS

README includes `20-second demo` and `What This Is Not`; commands shown are backed by committed wrappers, Makefile, and examples.
