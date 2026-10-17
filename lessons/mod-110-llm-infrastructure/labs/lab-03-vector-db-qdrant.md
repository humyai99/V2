# Lab 03: ตั้งค่า Vector Database (Qdrant)

**ระยะเวลา:** 60 นาที  **ข้อกำหนดเบื้องต้น:** Docker

## วัตถุประสงค์
รัน Qdrant บนเครื่อง local สร้าง collection, upsert vector พร้อม metadata และรัน nearest-neighbor query แบบมีตัวกรอง

## ขั้นตอน

### 1. รัน Qdrant
```bash
docker run -d --name qdrant -p 6333:6333 -p 6334:6334 qdrant/qdrant:v1.10.0
```
HTTP API อยู่ที่พอร์ต 6333; gRPC อยู่ที่ 6334 Dashboard อยู่ที่ http://localhost:6333/dashboard

### 2. สร้าง collection
```python
from qdrant_client import QdrantClient
from qdrant_client.http.models import Distance, VectorParams

client = QdrantClient(host="localhost", port=6333)
client.recreate_collection(
    collection_name="docs",
    vectors_config=VectorParams(size=384, distance=Distance.COSINE),
)
```

### 3. Upsert พร้อม payload
```python
from qdrant_client.http.models import PointStruct
import numpy as np

points = [
    PointStruct(
        id=i,
        vector=np.random.rand(384).tolist(),
        payload={"category": np.random.choice(["a","b","c"]), "ts": 1717000000 + i*60},
    )
    for i in range(1000)
]
client.upsert(collection_name="docs", points=points)
print(client.count("docs"))
```

### 4. Nearest-neighbor แบบธรรมดา
```python
q = np.random.rand(384).tolist()
hits = client.search(collection_name="docs", query_vector=q, limit=5)
for h in hits:
    print(h.id, h.score, h.payload)
```

### 5. การค้นหาแบบมีตัวกรอง
```python
from qdrant_client.http.models import Filter, FieldCondition, MatchValue
hits = client.search(
    collection_name="docs",
    query_vector=q,
    query_filter=Filter(must=[FieldCondition(key="category", match=MatchValue(value="a"))]),
    limit=5,
)
```

### 6. อัปเดต payload (ไม่ต้อง embed ใหม่)
```python
client.set_payload(collection_name="docs", payload={"tag": "important"}, points=[1, 2, 3])
```

### 7. Snapshot สำหรับสำรองข้อมูล
```python
client.create_snapshot(collection_name="docs")
client.list_snapshots(collection_name="docs")
```

### 8. ใช้ร่วมกับ RAG pipeline (lab 02)
แทนที่ index แบบ in-memory ของ FAISS ด้วย Qdrant สิ่งที่ได้ใน production: persistence, การกรอง, หลาย collection

## การตรวจสอบผล
- [ ] เห็น collection ใน Qdrant dashboard พร้อม 1000 points
- [ ] Nearest-neighbor คืนผลลัพธ์ 5 รายการเรียงตาม score
- [ ] การค้นหาแบบมีตัวกรองคืนเฉพาะ points ที่มี `category=a`

## การทำความสะอาด
```bash
docker stop qdrant && docker rm qdrant
```

## การแก้ไขปัญหา
- **Snapshot ล้มเหลว** — Qdrant ต้องการ volume ที่เขียนได้; คำสั่ง docker run ข้างต้นใช้ volume ชั่วคราวค่าเริ่มต้น
- **ตัวกรองคืนผลลัพธ์ 0 รายการ** — ตรวจสอบการสะกดชื่อ field; key ของ payload แยกตัวพิมพ์เล็ก-ใหญ่
- **`Wrong vector size`** — ขนาดของ collection ต้องตรงกับมิติของ vector พอดี
