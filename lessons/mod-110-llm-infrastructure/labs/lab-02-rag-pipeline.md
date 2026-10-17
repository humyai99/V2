# Lab 02: สร้าง RAG Pipeline แบบครบวงจร

**ระยะเวลา:** 90 นาที  **ข้อกำหนดเบื้องต้น:** vLLM จาก Lab 01 กำลังรันอยู่; Qdrant (lab 03) หรือ FAISS แบบ in-memory

## วัตถุประสงค์
นำเข้าชุดเอกสารขนาดเล็ก ทำ embedding จัดเก็บใน vector DB ดึง top-k สำหรับ query ของผู้ใช้ และส่งให้ LLM ผ่าน prompt template วัดความแม่นยำของการดึงข้อมูล (retrieval precision) และ latency แบบ end-to-end

## ขั้นตอน

### 1. ชุดเอกสารตัวอย่าง
ใช้สารบัญของเอกสาร Python หรือไฟล์ markdown ชุดเล็ก ๆ ใดก็ได้
```bash
mkdir corpus && cd corpus
curl -L https://raw.githubusercontent.com/python/cpython/main/Doc/tutorial/introduction.rst -o intro.rst
curl -L https://raw.githubusercontent.com/python/cpython/main/Doc/tutorial/controlflow.rst -o controlflow.rst
curl -L https://raw.githubusercontent.com/python/cpython/main/Doc/tutorial/datastructures.rst -o datastructures.rst
```

### 2. Chunking
```python
# chunk.py
from pathlib import Path
def chunk(text, size=500, overlap=50):
    chunks=[]; i=0
    while i < len(text):
        chunks.append(text[i:i+size])
        i += size - overlap
    return chunks

docs = []
for p in Path("corpus").glob("*.rst"):
    for j, c in enumerate(chunk(p.read_text())):
        docs.append({"id": f"{p.stem}-{j}", "source": p.name, "text": c})
print(f"{len(docs)} chunks")
```

### 3. Embed
```python
from sentence_transformers import SentenceTransformer
emb = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2")
vectors = emb.encode([d["text"] for d in docs], normalize_embeddings=True)
```

### 4. สร้าง index ใน FAISS (in-memory; สำหรับ prod ให้ใช้ Qdrant ตาม lab 03)
```python
import faiss, numpy as np
index = faiss.IndexFlatIP(vectors.shape[1])    # cosine via normalized inner product
index.add(np.asarray(vectors, dtype="float32"))
```

### 5. Retrieve
```python
def retrieve(query, k=4):
    q = emb.encode([query], normalize_embeddings=True).astype("float32")
    D, I = index.search(q, k)
    return [(docs[i], float(D[0][j])) for j, i in enumerate(I[0])]

print(retrieve("how do for loops work in python"))
```

### 6. ประกอบ prompt และเรียก LLM
```python
from openai import OpenAI
client = OpenAI(base_url="http://localhost:8000/v1", api_key="dummy")

def answer(question):
    hits = retrieve(question, k=4)
    context = "\n\n".join(f"[{h[0]['source']}#{h[0]['id']}]\n{h[0]['text']}" for h in hits)
    prompt = f"""You are answering questions strictly using the provided context.
If the answer is not in the context, say "I don't know".

Context:
{context}

Question: {question}

Answer (cite sources by id):"""
    r = client.chat.completions.create(
        model="mistralai/Mistral-7B-Instruct-v0.3",
        messages=[{"role":"user","content":prompt}],
        max_tokens=300, temperature=0.2,
    )
    return r.choices[0].message.content

print(answer("How do I write a for loop iterating over a list?"))
```

### 7. Evaluation harness
```python
test_set = [
    ("How do for loops work in python", ["controlflow"]),
    ("What is a dictionary in python", ["datastructures"]),
]
for q, expected_sources in test_set:
    hits = retrieve(q, k=4)
    sources = {h[0]["source"].replace(".rst","") for h in hits}
    print(q, "->", "PASS" if any(e in sources for e in expected_sources) else "FAIL", sources)
```

## การตรวจสอบผล
- [ ] Retrieval คืน chunk ที่เกี่ยวข้องสำหรับ query ที่รู้คำตอบอยู่แล้ว
- [ ] คำตอบอ้างอิง source id เมื่อ context เพียงพอ
- [ ] คำตอบบอกว่า "I don't know" เมื่อ context ไม่มีคำตอบ (ทดสอบโดยถามเกี่ยวกับ Rust)

## การทำความสะอาด
```bash
cd .. && rm -rf corpus
```

## การแก้ไขปัญหา
- **คำตอบแบบ hallucination** — ลด temperature; ทำให้คำสั่ง "don't know" เข้มงวดขึ้น; ตรวจสอบว่า chunk ที่ดึงมามีคำตอบจริง
- **ดึง source ผิด** — ขนาด chunk เล็กหรือใหญ่เกินไป 300-800 ตัวอักษรเหมาะกับข้อความทั่วไป; ใช้ขนาดเล็กกว่าสำหรับโค้ด
- **Embedding ครั้งแรกช้า** — มีการดาวน์โหลดโมเดลในการรันครั้งแรก; cache อยู่ที่ `~/.cache/torch/sentence_transformers/`
