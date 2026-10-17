# การร่วมพัฒนา AI Infrastructure Engineer Learning Path

ขอบคุณที่สนใจร่วมพัฒนา! เอกสารนี้อธิบายแนวทางสำหรับการร่วมพัฒนาโปรเจกต์นี้

## สารบัญ

- [หลักปฏิบัติ](#หลักปฏิบัติ)
- [ฉันจะร่วมพัฒนาได้อย่างไร?](#ฉันจะร่วมพัฒนาได้อย่างไร)
- [เริ่มต้นใช้งาน](#เริ่มต้นใช้งาน)
- [แนวทางการร่วมพัฒนา](#แนวทางการร่วมพัฒนา)
- [แนวทางด้านสไตล์](#แนวทางด้านสไตล์)
- [แนวทางการเขียน Commit Message](#แนวทางการเขียน-commit-message)
- [กระบวนการ Pull Request](#กระบวนการ-pull-request)
- [ชุมชน](#ชุมชน)

---

## หลักปฏิบัติ

โปรเจกต์นี้ยึดถือหลักปฏิบัติ (Code of Conduct) ที่ผู้ร่วมพัฒนาทุกคนต้องปฏิบัติตาม กรุณาอ่าน [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) ก่อนร่วมพัฒนา

**โดยย่อ:**
- ให้ความเคารพและเปิดรับทุกคน
- ต้อนรับผู้มาใหม่
- มุ่งเน้น feedback ที่สร้างสรรค์
- คิดว่าผู้อื่นมีเจตนาดี

---

## ฉันจะร่วมพัฒนาได้อย่างไร?

### 🐛 การรายงานบั๊ก

พบบั๊กใช่ไหม? ช่วยเราแก้ไขได้!

**ก่อนส่งรายงาน:**
- ตรวจสอบว่ามี issue นี้อยู่แล้วหรือไม่
- ตรวจสอบว่าไม่ได้อยู่ในรายการปัญหาที่ทราบแล้ว
- ทดสอบกับเวอร์ชันล่าสุด

**การส่งรายงานบั๊ก:**
1. ใช้เทมเพลตรายงานบั๊ก
2. ระบุหัวข้อและคำอธิบายที่ชัดเจน
3. ระบุขั้นตอนการทำซ้ำ
4. แนบข้อความ error หรือภาพหน้าจอ
5. ระบุสภาพแวดล้อมของคุณ (OS, เวอร์ชัน Python ฯลฯ)

### 💡 การเสนอการปรับปรุง

มีไอเดียในการปรับปรุงหลักสูตรใช่ไหม?

**การเสนอการปรับปรุง:**
1. ตรวจสอบว่ามีผู้เสนอไว้แล้วหรือไม่
2. ใช้เทมเพลตขอฟีเจอร์
3. อธิบาย use case
4. อธิบายแนวทางแก้ไขที่เสนอ
5. พิจารณาความซับซ้อนในการพัฒนา

### 📚 การปรับปรุงเอกสาร

ยินดีรับการปรับปรุงเอกสารเสมอ!

**ส่วนที่สามารถร่วมพัฒนาได้:**
- แก้คำผิดหรือคำอธิบายที่ไม่ชัดเจน
- เพิ่มตัวอย่าง
- ปรับปรุง comment ในโค้ด
- แปลเป็นภาษาอื่น
- เพิ่มแผนภาพหรือภาพประกอบ

### 🧪 การเพิ่มแบบฝึกหัด

ช่วยให้ผู้เรียนได้ฝึกฝนมากขึ้น!

**แนวทางสำหรับแบบฝึกหัด:**
- ควรช่วยเสริมแนวคิดของบทเรียน
- มีข้อกำหนดที่ชัดเจน
- มี starter code
- เพิ่มเฉลยไว้ใน branch แยก
- ระบุระดับความยาก

### 🎯 การสร้างโปรเจกต์

เสนอโปรเจกต์ภาคปฏิบัติใหม่!

**ข้อกำหนดของโปรเจกต์:**
- สอดคล้องกับระดับของหลักสูตร
- มี README ที่ครอบคลุม
- มี code stub พร้อม comment TODO
- เพิ่ม test
- จัดทำเอกสารสถาปัตยกรรม

### ✅ การรีวิว Pull Request

ช่วยรีวิวการร่วมพัฒนา!

**แนวทางการรีวิว:**
- สร้างสรรค์และสุภาพ
- ทดสอบการเปลี่ยนแปลงบนเครื่องของคุณ
- ตรวจสอบความชัดเจนและความครบถ้วน
- ตรวจสอบคุณภาพโค้ด
- ตรวจสอบว่าอัปเดตเอกสารแล้ว

---

## เริ่มต้นใช้งาน

### 1. Fork Repository

```bash
# Click "Fork" button on GitHub
# Then clone your fork
git clone https://github.com/YOUR-USERNAME/ai-infra-engineer-learning.git
cd ai-infra-engineer-learning
```

### 2. ตั้งค่า Development Environment

```bash
# Create virtual environment
python3.11 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
pip install -r requirements-dev.txt  # Development dependencies

# Install pre-commit hooks
pre-commit install
```

### 3. สร้าง Branch

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Or a bugfix branch
git checkout -b fix/bug-description
```

### 4. แก้ไขตามต้องการ

ปฏิบัติตามแนวทางด้านสไตล์ด้านล่าง

### 5. ทดสอบการเปลี่ยนแปลง

```bash
# Run tests
pytest

# Check code style
flake8 .
black --check .

# Validate markdown
markdownlint **/*.md
```

### 6. Commit และ Push

```bash
# Stage changes
git add .

# Commit with descriptive message
git commit -m "Add: Feature description"

# Push to your fork
git push origin feature/your-feature-name
```

### 7. สร้าง Pull Request

- ไปที่ fork ของคุณบน GitHub
- คลิก "New Pull Request"
- กรอกเทมเพลต PR
- ลิงก์ issue ที่เกี่ยวข้อง
- ขอให้มีการรีวิว

---

## แนวทางการร่วมพัฒนา

### การร่วมพัฒนาบทเรียน

**โครงสร้าง:**
- ทำตามรูปแบบบทเรียนที่มีอยู่
- ระบุวัตถุประสงค์การเรียนรู้
- เพิ่มแบบฝึกหัดภาคปฏิบัติ
- มีคำถามสำหรับตรวจสอบตนเอง
- มีส่วนสรุป

**เนื้อหา:**
- ใช้ภาษาที่ชัดเจนและกระชับ
- อธิบายแนวคิดก่อนแสดงโค้ด
- ใส่ตัวอย่างจากการใช้งานจริง
- เพิ่มแผนภาพในจุดที่ช่วยให้เข้าใจ
- อ้างอิงแหล่งที่มาของสถิติหรือคำพูด

**ตัวอย่างโค้ด:**
- ควรสมบูรณ์และรันได้จริง
- มี import ที่จำเป็นครบถ้วน
- เพิ่ม inline comment
- ปฏิบัติตาม best practice ของ Python
- ทดสอบโค้ดทั้งหมดก่อนส่ง

### การร่วมพัฒนาโปรเจกต์

**ข้อกำหนด:**
- README ที่ครอบคลุม ประกอบด้วย:
  - ภาพรวมของโปรเจกต์
  - วัตถุประสงค์การเรียนรู้
  - ความรู้พื้นฐานที่ต้องมี
  - ขั้นตอนการติดตั้ง
  - แผนภาพสถาปัตยกรรม
- Code stub พร้อม comment TODO
- ไฟล์ test
- เทมเพลตเอกสาร
- ไฟล์ .env.example

**คุณภาพโค้ด:**
- Type hint สำหรับ function signature
- Docstring สำหรับทุก function/class
- การจัดการ error
- Logging ในจุดที่เหมาะสม
- กำหนดค่าผ่าน environment variable

### การร่วมพัฒนาเอกสาร

**สไตล์ Markdown:**
- ใช้ header ตามลำดับชั้น (# > ## > ###)
- เพิ่มสารบัญสำหรับเอกสารยาว
- ใช้ code block พร้อมระบุภาษา
- เพิ่ม alt text ให้รูปภาพ
- ความยาวบรรทัดไม่เกิน 120 ตัวอักษร

**เนื้อหา:**
- เขียนสำหรับผู้เริ่มต้น
- อธิบายศัพท์เทคนิค
- ใช้ประโยคกรรตุวาจก (active voice)
- กระชับ
- ใส่ตัวอย่าง

---

## แนวทางด้านสไตล์

### สไตล์โค้ด Python

เราปฏิบัติตาม **PEP 8** โดยมีการปรับเปลี่ยนบางส่วน:

```python
# Use type hints
def train_model(data: np.ndarray, epochs: int = 10) -> torch.nn.Module:
    """
    Train a machine learning model.

    Args:
        data: Training data as numpy array
        epochs: Number of training epochs (default: 10)

    Returns:
        Trained PyTorch model
    """
    pass

# Use descriptive variable names
model_checkpoint_path = "/data/checkpoints"  # Good
mcp = "/data/checkpoints"  # Bad

# Add docstrings to all public functions
# Use Google-style docstrings
```

**เครื่องมือ:**
- **black**: Code formatter (ความยาวบรรทัด: 100)
- **flake8**: Linter
- **mypy**: Type checker
- **isort**: จัดเรียง import

### สไตล์ Markdown

```markdown
# Use ATX-style headers

## Add blank lines around headers

Use **bold** for emphasis, *italic* for terms.

\`\`\`python
# Always specify language in code blocks
def example():
    pass
\`\`\`

- Use hyphens for unordered lists
1. Use numbers for ordered lists
```

### สไตล์เอกสาร

**การตั้งชื่อไฟล์:**
- ใช้ตัวพิมพ์เล็กคั่นด้วยขีด: `getting-started.md`
- ตั้งชื่อให้สื่อความหมาย: `aws-ml-infrastructure.md` ไม่ใช่ `aws.md`

**โครงสร้าง:**
- เริ่มด้วยชื่อเรื่องและคำอธิบายสั้น ๆ
- เพิ่มสารบัญสำหรับเอกสารที่ยาวกว่า 500 คำ
- ใช้ระดับ header ให้สม่ำเสมอ
- ปิดท้ายด้วย "ขั้นตอนถัดไป" หรือ "สรุป"

---

## แนวทางการเขียน Commit Message

เราปฏิบัติตามข้อกำหนด **Conventional Commits**:

### รูปแบบ

```
<type>(<scope>): <subject>

<body>

<footer>
```

### ประเภท

- **feat**: ฟีเจอร์ใหม่
- **fix**: แก้บั๊ก
- **docs**: เปลี่ยนแปลงเอกสาร
- **style**: เปลี่ยนสไตล์โค้ด (การจัดรูปแบบ ไม่เปลี่ยน logic)
- **refactor**: Refactor โค้ด
- **test**: เพิ่มหรืออัปเดต test
- **chore**: งานบำรุงรักษา

### ตัวอย่าง

```bash
# Feature
git commit -m "feat(module-01): Add Docker basics lesson"

# Bug fix
git commit -m "fix(project-01): Correct FastAPI endpoint validation"

# Documentation
git commit -m "docs(readme): Update installation instructions"

# With body
git commit -m "feat(module-02): Add AWS ML infrastructure lesson

- Add EC2 GPU instance configuration
- Include S3 storage best practices
- Add code examples for SageMaker

Closes #123"
```

### Best Practice

- ใช้รูปคำสั่ง (imperative mood): "Add feature" ไม่ใช่ "Added feature"
- บรรทัด subject ยาวไม่เกิน 72 ตัวอักษร
- ขึ้นต้นบรรทัด subject ด้วยตัวพิมพ์ใหญ่
- ไม่ใส่จุดท้าย subject
- เว้นบรรทัดว่างระหว่าง subject กับ body
- ตัดบรรทัด body ที่ 72 ตัวอักษร
- อ้างอิง issue ใน footer

---

## กระบวนการ Pull Request

### ก่อนส่ง

- [ ] โค้ดเป็นไปตามแนวทางด้านสไตล์
- [ ] Test ทั้งหมดผ่าน
- [ ] อัปเดตเอกสารแล้ว
- [ ] Commit message เป็นไปตามแนวทาง
- [ ] Branch อัปเดตตรงกับ main แล้ว

### เทมเพลต PR

กรอกให้ครบทุกส่วน:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring

## Testing
How was this tested?

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] All tests pass

## Related Issues
Closes #123
```

### กระบวนการรีวิว

1. **การตรวจสอบอัตโนมัติ**: CI/CD ทำงานโดยอัตโนมัติ
   - Test ต้องผ่าน
   - Linting ต้องผ่าน
   - รักษา code coverage ไว้

2. **การรีวิวโดยคน**: มี maintainer อย่างน้อยหนึ่งคนรีวิว
   - คุณภาพโค้ด
   - เอกสาร
   - Test coverage
   - การตัดสินใจด้านการออกแบบ

3. **Feedback**: ตอบสนองต่อ comment จากการรีวิว
   - แก้ไขตามที่ร้องขอ
   - Push การอัปเดตไปยัง branch เดิม
   - ตอบกลับ comment

4. **Merge**: เมื่อได้รับการอนุมัติ
   - Maintainer จะเป็นผู้ merge
   - ลบ branch ของคุณหลัง merge
   - อัปเดต fork ของคุณ

### หลัง Merge

- อัปเดต fork ของคุณ:
  ```bash
  git checkout main
  git pull upstream main
  git push origin main
  ```

- ลบ branch ที่ merge แล้ว:
  ```bash
  git branch -d feature/your-feature-name
  git push origin --delete feature/your-feature-name
  ```

---

## การตั้งค่าสำหรับการพัฒนา

### เครื่องมือที่จำเป็น

```bash
# Install development dependencies
pip install -r requirements-dev.txt

# Includes:
# - pytest (testing)
# - black (formatting)
# - flake8 (linting)
# - mypy (type checking)
# - pre-commit (git hooks)
# - markdownlint (markdown linting)
```

### Pre-commit Hook

เราใช้ pre-commit เพื่อรักษาคุณภาพโค้ด:

```bash
# Install hooks
pre-commit install

# Run manually
pre-commit run --all-files
```

**Hook ที่ใช้:**
- trailing-whitespace: ลบช่องว่างท้ายบรรทัด
- end-of-file-fixer: ตรวจสอบให้ไฟล์จบด้วยบรรทัดใหม่
- check-yaml: ตรวจสอบความถูกต้องของไฟล์ YAML
- black: จัดรูปแบบโค้ด Python
- flake8: Lint โค้ด Python
- markdownlint: Lint ไฟล์ markdown

### การรัน Test

```bash
# Run all tests
pytest

# Run specific test file
pytest tests/test_module_01.py

# Run with coverage
pytest --cov=src tests/

# Run specific test
pytest tests/test_api.py::test_health_endpoint
```

### การ Build เอกสาร

```bash
# Preview markdown locally
# Install grip: pip install grip

# Preview README
grip README.md

# Preview in browser
grip README.md --browser
```

---

## ชุมชน

### การขอความช่วยเหลือ

- **GitHub Discussions**: ถามคำถาม แบ่งปันไอเดีย
- **Issue Tracker**: รายงานบั๊ก ขอฟีเจอร์

ขณะนี้ยังไม่มีการจัดแชตแบบเรียลไทม์หรือ office hours ประจำ หากต้องการจัดกลุ่มติว ให้เปิด Discussion

### การยกย่อง

ผู้ร่วมพัฒนาจะได้รับการยกย่องใน:
- ส่วน Contributors ใน README
- Release note สำหรับการร่วมพัฒนาที่สำคัญ
- Hall of Fame สำหรับการร่วมพัฒนาครั้งใหญ่

### การเป็น Maintainer

ผู้ร่วมพัฒนาที่มีส่วนร่วมอย่างต่อเนื่องอาจได้รับเชิญให้เป็น maintainer:

**เกณฑ์:**
- ร่วมพัฒนาอย่างสม่ำเสมอและมีคุณภาพสูง
- เข้าใจเป้าหมายของโปรเจกต์เป็นอย่างดี
- ช่วยเหลือในการรีวิวและการพูดคุย
- ยึดมั่นในคุณค่าของโปรเจกต์

**หน้าที่:**
- รีวิว pull request
- คัดกรอง issue
- รักษาคุณภาพโค้ด
- ช่วยกำหนดทิศทางของโปรเจกต์

---

## มีคำถาม?

- อ่าน [FAQ](./resources/faq.md)
- ถามใน [GitHub Discussions](https://github.com/ai-infra-curriculum/ai-infra-engineer-learning/discussions)
- เปิด issue พร้อม label "question"

---

## สัญญาอนุญาต

การร่วมพัฒนาถือว่าคุณยอมรับให้ผลงานของคุณอยู่ภายใต้ MIT License

---

<div align="center">

**ขอบคุณที่ร่วมพัฒนา! 🎉**

ทุกการมีส่วนร่วม ไม่ว่าจะเล็กเพียงใด ล้วนช่วยให้แหล่งเรียนรู้นี้ดีขึ้นสำหรับทุกคน

[กลับไปที่ README](./README.md)

</div>
