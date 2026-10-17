# Lab 01: Python Dev Environment ที่ทำซ้ำได้

**ระยะเวลา:** 45 นาที
**ระดับความยาก:** ผู้เริ่มต้น
**ความรู้/สิ่งที่ต้องมีก่อน:** macOS, Linux หรือ WSL2 บน Windows

## วัตถุประสงค์

เมื่อจบแล็บนี้ คุณจะมี development environment สำหรับ Python 3.11+ ที่แยกออกมาด้วย virtual environment พร้อม linting, formatting, type checking และ pre-commit hook ที่รันเครื่องมือทั้งหมดนี้ทุกครั้งที่ commit นี่คือพื้นฐานที่ทุกแล็บและโปรเจกต์ถัดไปต้องพึ่งพา

## ทำไมเรื่องนี้จึงสำคัญ

ML platform ใน production พังได้ในรูปแบบที่สังเกตยาก เมื่อ "รันได้บนเครื่องฉัน" เป็นการทดสอบการยอมรับเพียงอย่างเดียว environment บนเครื่อง local ที่ทำซ้ำได้ และมี linter, formatter และ type check ชุดเดียวกับ CI จะกำจัดบั๊กทั้งประเภทออกไปจากงานประจำวันของคุณ

## สิ่งที่ต้องมีก่อน

- Python **3.11 หรือ 3.12** (3.13 ยังมีปัญหาความเข้ากันได้กับ ML library บางตัว ณ ปี 2026)
- ติดตั้งและตั้งค่า Git แล้ว (`git config user.email` แสดงอีเมลของคุณ)
- terminal ที่ใช้งานได้ (zsh บน macOS, bash บน Linux)

ตรวจสอบ:

```bash
python3 --version    # expect Python 3.11.x or 3.12.x
git --version        # any 2.x is fine
```

## ขั้นตอน

### 1. สร้างโครงสร้างโปรเจกต์

```bash
mkdir -p ~/ai-infra-labs/lab-01-env && cd ~/ai-infra-labs/lab-01-env
git init -q
echo "venv/" > .gitignore
echo "__pycache__/" >> .gitignore
echo ".ruff_cache/" >> .gitignore
echo ".mypy_cache/" >> .gitignore
```

### 2. สร้างและเปิดใช้งาน virtual environment

```bash
python3 -m venv venv
source venv/bin/activate
# On Windows PowerShell: .\venv\Scripts\Activate.ps1

python --version   # should now be your project Python, isolated from system
which python       # expect a path inside venv/
```

### 3. ติดตั้ง dev dependencies

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

### 4. เพิ่ม Python module จริง

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

### 5. รัน toolchain ด้วยตนเอง

```bash
ruff format src tests
ruff check src tests
mypy src
pytest
```

ทั้งสี่คำสั่งควรสำเร็จ (ไม่มี output แปลว่าสำเร็จสำหรับ formatter; `Success: no issues found` สำหรับ mypy; `1 passed` สำหรับ pytest)

### 6. เชื่อมต่อ pre-commit

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

การ commit ควรเรียกใช้ ruff และ mypy หากการตรวจสอบใดล้มเหลว ให้แก้ไขแล้ว commit ใหม่

## การตรวจสอบความถูกต้อง

environment ที่ใช้งานได้ต้องผ่านเงื่อนไขทั้งหมดนี้:

- [ ] `python --version` แสดง Python ของ venv ไม่ใช่ Python ของระบบ
- [ ] `ruff format --check src tests` คืนค่า 0
- [ ] `mypy src` คืนค่า `Success: no issues found`
- [ ] `pytest` คืนค่า 1 passed
- [ ] การทำให้เกิด syntax error ใน `src/labenv/greet.py` แล้วพยายาม commit ทำให้ pre-commit hook ล้มเหลวและบล็อกการ commit

ทดสอบข้อสุดท้ายอย่างจริงจัง — ทำให้ไฟล์เสีย, `git add`, `git commit`, สังเกตความล้มเหลว จากนั้นแก้ไขและ commit ใหม่

## การล้างข้อมูล

```bash
deactivate
cd ~ && rm -rf ~/ai-infra-labs/lab-01-env
```

## การแก้ไขปัญหา

- **`command not found: python3`** — บน macOS ให้ติดตั้งผ่าน `brew install python@3.11` บน Linux ใช้ `sudo apt install python3.11 python3.11-venv`
- **`pre-commit install` ล้มเหลวพร้อมข้อความ "no .pre-commit-config.yaml found"** — คุณรันคำสั่ง install ก่อนเขียน config ลำดับมีความสำคัญ
- **mypy แจ้งปัญหาเกี่ยวกับ `--no-namespace-packages`** — mypy เวอร์ชันเก่าไม่รองรับ flag นี้ ให้อัปเกรดเป็น ≥1.10 หรือเอา flag ออก
- **Test หา package `labenv` ไม่เจอ** — `pyproject.toml` ต้องมี `[tool.pytest.ini_options] pythonpath = ["src"]` ให้ตรวจสอบ config อีกครั้ง
