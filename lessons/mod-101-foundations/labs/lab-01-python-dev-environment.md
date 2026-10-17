# Lab 01: Reproducible Python Dev Environment

**Duration:** 45 minutes
**Difficulty:** Beginner
**Prerequisites:** macOS, Linux, or WSL2 on Windows

## Objective

By the end of this lab you will have a Python 3.11+ development environment isolated by virtual environment, with linting, formatting, type checking, and a pre-commit hook that runs them all on every commit. This is the foundation every subsequent lab and project depends on.

## Why this matters

Production ML platforms break in subtle ways when "works on my machine" is the only acceptance test. A reproducible local environment with the same linters, formatters, and type checks as CI eliminates one entire class of bugs from your day.

## Prerequisites

- Python **3.11 or 3.12** (3.13 has compatibility gaps for some ML libraries as of 2026)
- Git installed and configured (`git config user.email` returns your email)
- A working terminal (zsh on macOS, bash on Linux)

Verify:

```bash
python3 --version    # expect Python 3.11.x or 3.12.x
git --version        # any 2.x is fine
```

## Steps

### 1. Create the project skeleton

```bash
mkdir -p ~/ai-infra-labs/lab-01-env && cd ~/ai-infra-labs/lab-01-env
git init -q
echo "venv/" > .gitignore
echo "__pycache__/" >> .gitignore
echo ".ruff_cache/" >> .gitignore
echo ".mypy_cache/" >> .gitignore
```

### 2. Create and activate a virtual environment

```bash
python3 -m venv venv
source venv/bin/activate
# On Windows PowerShell: .\venv\Scripts\Activate.ps1

python --version   # should now be your project Python, isolated from system
which python       # expect a path inside venv/
```

### 3. Install dev dependencies

```bash
cat > requirements-dev.txt <<'EOF'
ruff>=0.5
mypy>=1.10
pre-commit>=3.7
pytest>=8.0
EOF

pip install --upgrade pip
pip install -r requirements-dev.txt
```

### 4. Add a real Python module

```bash
mkdir -p src/labenv tests
cat > src/labenv/greet.py <<'EOF'
"""Tiny module to demonstrate the dev tooling."""
def hello(name: str) -> str:
    return f"hello, {name}"
EOF

cat > tests/test_greet.py <<'EOF'
from labenv.greet import hello

def test_hello_returns_personalized_message():
    assert hello("alice") == "hello, alice"
EOF

cat > pyproject.toml <<'EOF'
[project]
name = "labenv"
version = "0.0.1"
requires-python = ">=3.11"

[tool.ruff]
line-length = 100

[tool.ruff.lint]
select = ["E","F","W","I","UP","B","SIM"]

[tool.mypy]
strict = true

[tool.pytest.ini_options]
addopts = "-ra -q"
pythonpath = ["src"]
testpaths = ["tests"]
EOF
```

### 5. Run the toolchain manually

```bash
ruff format src tests
ruff check src tests
mypy src
pytest
```

All four should succeed (zero output is success for the formatter; `Success: no issues found` for mypy; `1 passed` for pytest).

### 6. Wire up pre-commit

```bash
cat > .pre-commit-config.yaml <<'EOF'
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.5.6
    hooks:
      - id: ruff-format
      - id: ruff
        args: [--fix]
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.10.0
    hooks:
      - id: mypy
        additional_dependencies: []
        args: [--strict, --no-namespace-packages]
EOF

pre-commit install
git add -A
git commit -m "init: reproducible python dev environment"
```

The commit should trigger ruff and mypy. If any check fails, fix and commit again.

## Validation

A working environment satisfies all of:

- [ ] `python --version` shows your venv Python, not system Python.
- [ ] `ruff format --check src tests` returns 0.
- [ ] `mypy src` returns `Success: no issues found`.
- [ ] `pytest` returns 1 passed.
- [ ] Making a syntax error in `src/labenv/greet.py` and trying to commit causes the pre-commit hook to fail and block the commit.

Test the last one explicitly — break the file, `git add`, `git commit`, observe the failure, then fix and recommit.

## Cleanup

```bash
deactivate
cd ~ && rm -rf ~/ai-infra-labs/lab-01-env
```

## Troubleshooting

- **`command not found: python3`** — On macOS, install via `brew install python@3.11`. On Linux, `sudo apt install python3.11 python3.11-venv`.
- **`pre-commit install` fails with "no .pre-commit-config.yaml found"** — You ran the install before writing the config. Order matters.
- **mypy complains about `--no-namespace-packages`** — Older mypy versions don't support this flag; upgrade to ≥1.10 or drop the flag.
- **Tests can't find `labenv` package** — `pyproject.toml` must include `[tool.pytest.ini_options] pythonpath = ["src"]`. Re-check the config.
