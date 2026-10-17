# AI Infrastructure Engineer — Learning Repo
#
# Common tasks for working through the curriculum.
# Each project has its own Makefile for project-specific tasks.

.PHONY: help install lint test format clean check-prereqs verify-modules

help:
	@echo "Available targets:"
	@echo "  install         Install Python dependencies into the active venv"
	@echo "  check-prereqs   Verify required tools are installed (docker, kubectl, terraform, etc.)"
	@echo "  lint            Run markdown lint across lessons/ and projects/"
	@echo "  format          Auto-format Python source under projects/*/src/"
	@echo "  test            Run all project test suites"
	@echo "  verify-modules  Validate every module has the expected scaffolding"
	@echo "  clean           Remove build artifacts and caches"

install:
	@python -m pip install --upgrade pip
	@pip install -r requirements.txt

check-prereqs:
	@command -v python  >/dev/null && echo "✓ python  $$(python --version)"  || echo "✗ python missing"
	@command -v docker  >/dev/null && echo "✓ docker  $$(docker --version)"  || echo "✗ docker missing"
	@command -v kubectl >/dev/null && echo "✓ kubectl $$(kubectl version --client --short 2>/dev/null | head -1)" || echo "✗ kubectl missing"
	@command -v helm    >/dev/null && echo "✓ helm    $$(helm version --short)" || echo "✗ helm missing"
	@command -v terraform >/dev/null && echo "✓ terraform $$(terraform version | head -1)" || echo "✗ terraform missing"

lint:
	@command -v markdownlint-cli2 >/dev/null && markdownlint-cli2 'lessons/**/*.md' 'projects/**/*.md' || echo "markdownlint-cli2 not installed; skipping"

format:
	@find projects -name '*.py' -path '*/src/*' | xargs -r ruff format
	@find projects -name '*.py' -path '*/src/*' | xargs -r ruff check --fix

test:
	@for p in projects/project-*; do \
		if [ -f "$$p/Makefile" ]; then \
			echo "==> $$p" && $(MAKE) -C "$$p" test || true; \
		fi; \
	done

verify-modules:
	@for m in lessons/mod-*; do \
		if [ -d "$$m" ]; then \
			[ -f "$$m/README.md" ] && lec=$$(ls $$m/*.md 2>/dev/null | grep -v README | wc -l) || lec=0; \
			exc=$$(find $$m/exercises -mindepth 1 -maxdepth 2 -name 'README.md' -o -name 'exercise-*.md' 2>/dev/null | wc -l); \
			lab=$$(find $$m/labs -mindepth 1 -maxdepth 2 -name '*.md' 2>/dev/null | wc -l); \
			qz=$$(find $$m/quizzes -name '*.md' 2>/dev/null | wc -l); \
			printf "  %-45s lectures=%2d exercises=%2d labs=%2d quizzes=%d\n" "$$m" "$$lec" "$$exc" "$$lab" "$$qz"; \
		fi; \
	done

clean:
	@find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .pytest_cache -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name .ruff_cache -exec rm -rf {} + 2>/dev/null || true
