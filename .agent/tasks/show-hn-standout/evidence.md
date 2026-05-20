# Evidence - show-hn-standout

## Build Summary

Implemented the five standout slices:

- unified CLI at `bin/proof-loop`
- JSON schemas under `schemas/`
- `evidence.json` and `raw/` proof bundle support
- harness guide templates under `templates/`
- dry-run `install-guides`
- `make demo` fail -> fix -> pass transcript
- Markdown proof report via `proof-loop report`
- README updates for CLI/demo/report visibility

## Checks Run

```bash
make test
```

Result: PASS. The suite ran 10 tests and exercised the unified CLI, schema validation, dry-run guide installation, demo script, existing wrappers, and existing done gates.

```bash
make demo
```

Result: PASS. The demo showed `NAV_LABEL_CHECK_FAIL`, applied a fix, showed `NAV_LABEL_CHECK_PASS`, and rendered a Markdown proof report.

```bash
bin/proof-loop doctor
bin/proof-loop validate examples/demo-repo/.agent/tasks/nav-labels-proof --require-evidence-json
bin/proof-loop report examples/demo-repo/.agent/tasks/nav-labels-proof --format md
```

Result: PASS.

## AC1 - PASS

`bin/proof-loop` supports `init`, `check`, `status`, `list`, `doctor`, `validate`, `report`, and `install-guides`. Tests and `make test` exercise these paths.

## AC2 - PASS

Schemas exist under `schemas/`; the demo task includes `evidence.json` and `raw/check-nav-labels.txt`; `proof-loop validate` passes with `--require-evidence-json`.

## AC3 - PASS

Harness adapter templates exist for Codex, Claude, OpenCode, and Hermes. `install-guides --dry-run` is tested and does not mutate target guide files.

## AC4 - PASS

`make demo` runs a real fail -> fix -> pass flow and renders a proof report.

## AC5 - PASS

`proof-loop report TASK --format md` renders task id, overall status, AC table, evidence summary, raw log references, and problems state.
