.PHONY: test

test:
	python3 -m py_compile scripts/init_task.py scripts/check_task.py examples/demo-repo/check_nav_labels.py
	python3 -m unittest discover -s tests
	python3 examples/demo-repo/check_nav_labels.py examples/demo-repo/nav_labels.json
	python3 scripts/check_task.py examples/example-task/.agent/tasks/ui-language-fix
	python3 scripts/check_task.py examples/demo-repo/.agent/tasks/nav-labels-proof
