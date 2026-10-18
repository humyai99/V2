# โมดูล 08: การเฝ้าติดตามและการสังเกตการณ์ระบบ

## ภาพรวม

โมดูลนี้ครอบคลุมการเฝ้าติดตามและ observability สำหรับโครงสร้างพื้นฐาน AI คุณจะสร้างระบบที่ติดตามสุขภาพโครงสร้างพื้นฐาน ประสิทธิภาพแอปพลิเคชัน และพฤติกรรมโมเดล ML ในระบบที่ใช้งานจริง

## เป้าหมายของโมดูล

เมื่อจบโมดูลนี้ คุณจะสามารถ:

1. **เข้าใจ observability:** อธิบายข้อมูลหลักสามชนิด ได้แก่ metrics, logs และ traces
2. **เก็บ metrics:** ตั้งค่า Prometheus สำหรับโครงสร้างพื้นฐานและแอปพลิเคชัน
3. **สร้างแดชบอร์ด:** ใช้ Grafana แสดงสุขภาพระบบ
4. **รวม logs:** ติดตั้ง ELK/EFK เพื่อเก็บและวิเคราะห์ log
5. **ติดตามคำขอ:** ใช้ distributed tracing ข้าม microservices
6. **ตั้งการแจ้งเตือน:** กำหนดกฎแจ้งเตือนและเวิร์กโฟลว์ on-call
7. **เฝ้าติดตามโมเดล ML:** วัดประสิทธิภาพ drift และคุณภาพข้อมูล
8. **ดูแลระบบจริง:** ใช้ SLIs, SLOs และขั้นตอนตอบสนองเหตุขัดข้อง

## ความรู้พื้นฐานที่ควรมี

**จำเป็น:** ใช้คำสั่ง Linux ได้ รู้พื้นฐาน Docker (โมดูล 03) และ Kubernetes (โมดูล 04) เข้าใจเครือข่ายเบื้องต้น และเขียน Python ได้

**แนะนำ:** เคยดูแลระบบจริง เข้าใจ HTTP/REST API และรู้ SQL เบื้องต้น

## โครงสร้างโมดูล

### บทเรียน

1. **รู้จัก observability** (ประมาณ 75 นาที)
   - ข้อมูลสามชนิด: metrics, logs, traces
   - ความต่างระหว่าง observability กับ monitoring
   - มาตรฐาน OpenTelemetry
   - ออกแบบระบบให้ตรวจสอบได้

2. **เก็บ metrics ด้วย Prometheus** (ประมาณ 90 นาที)
   - สถาปัตยกรรม Prometheus
   - ชนิดและการตั้งชื่อ metrics
   - Exporters และ service discovery
   - ภาษา PromQL
   - Recording rules

3. **แดชบอร์ดและการแสดงผลด้วย Grafana** (ประมาณ 75 นาที)
   - หลักการออกแบบแดชบอร์ด
   - ชนิด panels และ queries
   - Variables และ templating
   - การแจ้งเตือนใน Grafana
   - การแชร์และติดตามเวอร์ชัน

4. **การรวม logs** (ประมาณ 90 นาที)
   - แนวปฏิบัติในการบันทึก log
   - สถาปัตยกรรม ELK/EFK
   - เก็บ log ด้วย Fluentd/Filebeat
   - สร้างดัชนีใน Elasticsearch
   - ค้นหาและแสดงผลด้วย Kibana

5. **Distributed tracing** (ประมาณ 75 นาที)
   - พื้นฐาน tracing
   - สถาปัตยกรรม Jaeger/Zipkin
   - เพิ่ม instrumentation ในแอปพลิเคชัน
   - วิเคราะห์ traces
   - ปรับประสิทธิภาพ

6. **การแจ้งเตือนและตอบสนองเหตุขัดข้อง** (ประมาณ 90 นาที)
   - หลักการออกแบบการแจ้งเตือน
   - ตั้งค่า AlertManager
   - เวิร์กโฟลว์ on-call
   - จัดการเหตุขัดข้อง
   - Postmortem และแนวปฏิบัติ SRE

7. **การเฝ้าติดตามเฉพาะงาน ML** (ประมาณ 90 นาที)
   - ตัวชี้วัดประสิทธิภาพโมเดล
   - ตรวจจับ data drift
   - เฝ้าติดตามผลทำนาย
   - เวอร์ชันโมเดลและการย้อนกลับ
   - ตัวชี้วัดสำหรับ A/B testing

8. **แนวปฏิบัติสำหรับระบบจริง** (ประมาณ 75 นาที)
   - SLIs, SLOs และ SLAs
   - Error budgets
   - วางแผนกำลังรองรับ
   - ปรับค่าใช้จ่าย
   - เฝ้าติดตามความปลอดภัย

### แล็บภาคปฏิบัติ

- **แล็บ 1:** ติดตั้ง Prometheus และ Grafana
- **แล็บ 2:** รวม logs ด้วย EFK
- **แล็บ 3:** ใช้ distributed tracing
- **แล็บ 4:** สร้างแดชบอร์ดเฝ้าติดตามโมเดล ML
- **แล็บ 5:** สร้างระบบ observability สำหรับใช้งานจริง

### การประเมิน

- **แบบทดสอบ:** 25 ข้อครอบคลุมทุกบทเรียน
- **แบบฝึกหัดภาคปฏิบัติ:** ออกแบบ observability สำหรับระบบ ML
- **โปรเจกต์สรุป:** ติดตั้งระบบเฝ้าติดตามแบบครบวงจร

## ลำดับการเรียน

```text
รู้จัก observability
       ↓
Prometheus — เก็บ metrics
       ↓
Grafana — แสดงผล
       ↓
ELK/EFK — จัดการ logs
       ↓
Jaeger/Zipkin — ติดตามคำขอ
       ↓
AlertManager — แจ้งเตือน
       ↓
เฝ้าติดตามโมเดล ML
       ↓
แนวปฏิบัติสำหรับระบบจริง
```

## เครื่องมือและการตั้งค่า

### ระบบเก็บ metrics และแจ้งเตือน

```bash
# Prometheus (metrics)
wget https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-amd64.tar.gz

# Grafana (แดชบอร์ด)
wget https://dl.grafana.com/oss/release/grafana-10.0.0.linux-amd64.tar.gz

# Alertmanager (การแจ้งเตือน)
wget https://github.com/prometheus/alertmanager/releases/download/v0.25.0/alertmanager-0.25.0.linux-amd64.tar.gz
```

### ระบบ logs

```bash
docker pull docker.elastic.co/elasticsearch/elasticsearch:8.9.0
docker pull docker.elastic.co/kibana/kibana:8.9.0
docker pull fluent/fluentd:v1.16
```

### ระบบ tracing

```bash
docker pull jaegertracing/all-in-one:1.48
```

### ไลบรารี Python

```bash
pip install prometheus-client
pip install opentelemetry-api
pip install opentelemetry-sdk
pip install python-json-logger
pip install grafanalib
```

เวอร์ชันในตัวอย่างเป็นเวอร์ชันที่หลักสูตรระบุไว้ ควรตรวจความเข้ากันได้ก่อนใช้กับระบบของคุณ

## แนวคิดสำคัญ

### พื้นฐาน observability

- **Metrics:** ค่าตัวเลขตามเวลา เช่น CPU, หน่วยความจำ และจำนวนคำขอต่อวินาที
- **Logs:** เหตุการณ์พร้อมบริบท เช่น ข้อผิดพลาดและธุรกรรม
- **Traces:** เส้นทางของคำขอผ่านระบบแบบกระจาย
- **Cardinality:** จำนวนชุดค่า label ของ metric ที่ไม่ซ้ำกัน
- **Sampling:** ลดปริมาณข้อมูลที่เก็บโดยยังคงข้อมูลที่จำเป็นต่อการวิเคราะห์

### Prometheus

- **Time series:** ระบุด้วยชื่อ metric และ labels
- **Scraping:** ดึง metrics จากปลายทางตามรอบ
- **Exporters:** โปรแกรมที่เปิด metrics endpoints
- **Federation:** เชื่อม Prometheus หลายชุดเป็นลำดับชั้น
- **Remote storage:** เก็บ metrics ระยะยาว

### Grafana

- **Data sources:** แหล่งที่ Grafana ใช้ค้นข้อมูล
- **Panels:** หน่วยแสดงผลบนแดชบอร์ด
- **Variables:** พารามิเตอร์แดชบอร์ดที่เปลี่ยนค่าได้
- **Annotations:** เครื่องหมายเหตุการณ์บนกราฟ
- **Playlists:** แสดงหลายแดชบอร์ดสลับกัน

### Logs

- **Structured logging:** log ที่มีโครงสร้าง เช่น JSON
- **Log levels:** DEBUG, INFO, WARN, ERROR, FATAL
- **Correlation IDs:** เชื่อม log ที่เกี่ยวข้องกัน
- **Log retention:** ระยะเวลาที่เก็บ log
- **Index patterns:** วิธีจัดกลุ่มดัชนี Elasticsearch

### Tracing

- **Spans:** งานแต่ละช่วงภายใน trace
- **Trace context:** บริบทที่ส่งต่อข้ามขอบเขตบริการ
- **Sampling:** สัดส่วน traces ที่เก็บ
- **Service mesh:** ช่วยเพิ่ม instrumentation อัตโนมัติ
- **Tail-based sampling:** เลือกเก็บหลังเห็น trace ครบ

## การนำไปใช้งานจริง

ทักษะในโมดูลนี้ช่วยวิเคราะห์เหตุขัดข้อง วางแผนทรัพยากร หาคอขวดในไปป์ไลน์ ML ติดตามค่าใช้จ่าย ตรวจตามข้อกำหนด และใช้แนวปฏิบัติ SRE

ตัวอย่างการใช้งาน ได้แก่ เฝ้าติดตามความแม่นยำ latency และ throughput ของโมเดล ตรวจ drift กับข้อมูลที่ขาด ดูการใช้ GPU/หน่วยความจำ/ดิสก์ จัดสรรค่าใช้จ่ายตามโมเดลหรือทีม วิเคราะห์สาเหตุของเหตุขัดข้อง และเก็บ audit logs

## เวลาที่ใช้

- **บทเรียน:** ประมาณ 10–12 ชั่วโมง
- **แล็บภาคปฏิบัติ:** ประมาณ 15–20 ชั่วโมง
- **แบบทดสอบและการประเมิน:** ประมาณ 3–4 ชั่วโมง
- **รวม:** ประมาณ 30–35 ชั่วโมง

## เกณฑ์วัดความพร้อม

- [ ] อธิบาย metrics, logs และ traces พร้อมกรณีใช้งานได้
- [ ] ติดตั้งและตั้งค่า Prometheus เพื่อเก็บ metrics
- [ ] สร้างแดชบอร์ด Grafana พร้อมการแจ้งเตือน
- [ ] รวม logs ด้วย ELK/EFK
- [ ] ติดตามคำขอข้าม microservices
- [ ] ออกแบบกฎแจ้งเตือนที่เหมาะสม
- [ ] เฝ้าติดตามประสิทธิภาพโมเดลและ data drift
- [ ] คำนวณและติดตาม SLIs กับ SLOs
- [ ] ตอบสนองเหตุขัดข้องในระบบจริง
- [ ] ปรับค่าใช้จ่ายการเฝ้าติดตามและระยะเวลาเก็บข้อมูล

## แหล่งข้อมูลเพิ่มเติม

### เอกสาร

- [Prometheus](https://prometheus.io/docs/)
- [Grafana](https://grafana.com/docs/)
- [Elasticsearch](https://www.elastic.co/guide/)
- [Jaeger](https://www.jaegertracing.io/docs/)

### หนังสือ

- *Observability Engineering* โดย Charity Majors และคณะ
- *The Site Reliability Workbook* โดยทีม Google SRE
- *Distributed Systems Observability* โดย Cindy Sridharan

### เครื่องมือ

- **Prometheus:** ฐานข้อมูล metrics แบบ time series
- **Grafana:** แดชบอร์ดและการแสดงผล
- **AlertManager:** จัดเส้นทางและดูแลการแจ้งเตือน
- **Elasticsearch:** เก็บและค้น logs
- **Kibana:** แสดงผล logs
- **Jaeger:** Distributed tracing
- **OpenTelemetry:** เครื่องมือและมาตรฐาน observability

### ชุมชน

- [CNCF Observability TAG](https://github.com/cncf/tag-observability)
- [Prometheus Users](https://prometheus.io/community/)
- [Grafana Community](https://community.grafana.com/)

## ขั้นตอนถัดไป

- **โมดูล 09:** ใช้ Infrastructure as Code ติดตั้งระบบเฝ้าติดตามอัตโนมัติ
- **โมดูล 10:** เฝ้าติดตาม LLM
- **โปรเจกต์ 02:** สร้างไปป์ไลน์ MLOps พร้อมระบบเฝ้าติดตาม
- **โปรเจกต์ 03:** ติดตั้ง LLM พร้อม observability สำหรับระบบจริง

---

**พร้อมสร้างระบบ observability แล้วหรือยัง?** เริ่มติดตามระบบกัน
