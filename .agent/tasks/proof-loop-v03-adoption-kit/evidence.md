# Evidence - proof-loop-v03-adoption-kit

## Build Summary

Proof Loop v0.3.0 is shaped as an adoption release. The README now has a near-top `Use It Today` path, `docs/adoption-kit.md` gives copy-paste builder/verifier flow, and `examples/adoption-kit/` contains a compact completed proof folder with raw logs, evidence JSON, verifier verdict, and empty problems.

## Checks Run

```bash
make test
git diff --check
bin/proof-loop check examples/adoption-kit/.agent/tasks/checkout-empty-state-proof
bin/proof-loop validate examples/adoption-kit/.agent/tasks/checkout-empty-state-proof --require-evidence-json
bin/proof-loop report examples/adoption-kit/.agent/tasks/checkout-empty-state-proof --format md
```

Observed local results:

```text
Ran 10 tests in 0.815s
OK
PROOF_LOOP_PASS examples/adoption-kit/.agent/tasks/checkout-empty-state-proof
PROOF_LOOP_SCHEMA_PASS examples/adoption-kit/.agent/tasks/checkout-empty-state-proof
```

## AC1 - PASS

README contains clone, `make test`, `proof-loop init`, `proof-loop check`, and `proof-loop report` commands before the deeper protocol material, plus links to the adoption kit and completed example.

## AC2 - PASS

`docs/adoption-kit.md` covers task folder creation, AC freeze, builder prompt, fresh verifier prompt, done gate commands, and final good-state checklist.

## AC3 - PASS

`examples/adoption-kit/.agent/tasks/checkout-empty-state-proof` passes `bin/proof-loop check` and `bin/proof-loop validate --require-evidence-json`.

## AC4 - PASS

`make test` passes with the existing suite and the new adoption example gate.

## AC5 - PENDING RELEASE

`SKILL.md` is bumped to `0.3.0`. GitHub tag/release and Actions verification happen after PR merge.

## AC6 - PENDING RELEASE

ClawHub publish/install/inspect happens after the clean tag archive exists.
