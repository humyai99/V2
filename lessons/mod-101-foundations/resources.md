# Module 101 — แหล่งข้อมูลเรื่องพื้นฐาน ML Infrastructure

## หนังสือพื้นฐาน

- **Designing Machine Learning Systems** โดย Chip Huyen ตำราหลักด้าน ML systems เป็นหนังสือที่ต้องอ่านสำหรับ track นี้
- **Machine Learning Engineering** โดย Andriy Burkov ส่วนเสริมเชิงปฏิบัติของหนังสือ Huyen ครอบคลุมด้านวิศวกรรมมากขึ้น
- **The Big Book of MLOps (2023)** โดย Databricks PDF ฟรี ภาพรวม MLOps ที่ครอบคลุม
- **Building Machine Learning Powered Applications** โดย Emmanuel Ameisen มอง ML ผ่านมุมมองของ product engineering

## เอกสารทางการ

- **PyTorch documentation** — [pytorch.org/docs](https://pytorch.org/docs/stable/index.html) framework ที่โค้ดส่วนใหญ่ในโมดูลนี้ใช้
- **TensorFlow documentation** — [tensorflow.org/api_docs](https://www.tensorflow.org/api_docs) สำหรับเปรียบเทียบ ยังคงถูก deploy อย่างแพร่หลาย
- **TorchServe documentation** — [pytorch.org/serve](https://pytorch.org/serve/) serving framework ของ PyTorch
- **TensorFlow Serving documentation** — [tensorflow.org/tfx/serving](https://www.tensorflow.org/tfx/serving) serving framework ของ TF

## แหล่งอ้างอิงเรื่อง ML lifecycle

- **Rules of Machine Learning** โดย Google — [developers.google.com/machine-learning/guides/rules-of-ml](https://developers.google.com/machine-learning/guides/rules-of-ml) กฎ 43 ข้อ ควรอ่านสักครั้ง
- **Hidden Technical Debt in Machine Learning Systems** (Sculley et al., NeurIPS 2015) — [papers.nips.cc/paper/2015/file/86df7dcfd896fcaf2674f757a2463eba-Paper.pdf](https://papers.nips.cc/paper/2015/file/86df7dcfd896fcaf2674f757a2463eba-Paper.pdf) เปเปอร์ที่บอกว่า "ML systems เป็น ML 5% และ glue code 95%"
- **Continuous Delivery for Machine Learning** โดย Thoughtworks — [martinfowler.com/articles/cd4ml.html](https://martinfowler.com/articles/cd4ml.html) รูปแบบที่ CD ต้องเรียนรู้เพื่อใช้กับ ML

## บทความจากอุตสาหกรรมที่ควรอ่าน

- **Meet Michelangelo** (Uber) — [uber.com/blog/michelangelo-machine-learning-platform](https://www.uber.com/blog/michelangelo-machine-learning-platform/) บทความอ้างอิงเรื่อง ML platform ภายในองค์กร
- **Open-Sourcing Metaflow** (Netflix) — [netflixtechblog.com/open-sourcing-metaflow-a-human-centric-framework-for-data-science-fa72e04a5d9](https://netflixtechblog.com/open-sourcing-metaflow-a-human-centric-framework-for-data-science-fa72e04a5d9) การออกแบบ framework ที่ยึดมนุษย์เป็นศูนย์กลาง
- **Scaling Kubernetes to Support 50,000 Services** (Airbnb) — เพื่อเข้าใจขนาดของงาน platform engineering

## Development environment

- **uv** — [docs.astral.sh/uv](https://docs.astral.sh/uv/) Python package manager สมัยใหม่ (เร็วกว่า pip 10-100 เท่า)
- **ruff** — [docs.astral.sh/ruff](https://docs.astral.sh/ruff/) Linter + formatter
- **mypy** — [mypy.readthedocs.io](https://mypy.readthedocs.io/) Type checker
- **pre-commit** — [pre-commit.com](https://pre-commit.com/) Hook framework
- **Docker Desktop** หรือ **Podman** — container runtime บนเครื่อง local

## การเปรียบเทียบ ML framework

| Framework | เหมาะที่สุดสำหรับ | หมายเหตุ |
|---|---|---|
| **PyTorch** | งานวิจัย, production สมัยใหม่ | deep-learning framework ที่ครองตลาด โค้ดใหม่ส่วนใหญ่เป็น PyTorch |
| **TensorFlow** | deployment บน mobile/edge, production แบบ legacy | ยังถูก deploy อย่างแพร่หลาย แต่มีโค้ดใหม่น้อยลงในปัจจุบัน |
| **JAX** | งานวิจัยที่ต้องการ performance สูง | เป็นแบบ functional ได้รับความนิยมมากขึ้นในงานวิจัย LLM |
| **ONNX** | deployment ข้าม framework | รูปแบบมาตรฐานสำหรับแลกเปลี่ยน ทำให้ไม่ผูกติดกับ serving runtime |

## คอร์สออนไลน์ + บทสอน

- **Andrew Ng's Machine Learning Specialization** (Coursera) — คอร์ส ML ที่มีผู้ชมมากที่สุดในประวัติศาสตร์ เป็นพื้นฐาน
- **Fast.ai Practical Deep Learning for Coders** — [course.fast.ai](https://course.fast.ai/) แนวทางแบบ top-down เน้นส่งงานก่อน
- **Hugging Face Course** — [huggingface.co/learn](https://huggingface.co/learn) ทันสมัย เน้นลงมือทำ และฟรี
- **Full Stack Deep Learning** — [fullstackdeeplearning.com](https://fullstackdeeplearning.com/) คอร์สฟรีเรื่อง ML systems

## การอ้างอิงข้ามในหลักสูตรนี้

- นี่คือโมดูลแรกของ engineer track อีก 9 โมดูลที่เหลือ (mod-102 ถึง mod-110) ต่อยอดจากสิ่งที่แนะนำไว้ที่นี่
- mod-001 ถึง mod-005 ของ Junior track ครอบคลุมความรู้พื้นฐานที่จำเป็น หากคุณเพิ่งเริ่มต้น
- ML Platform track เป็นสายความเชี่ยวชาญพี่น้อง — แนวคิดเดียวกันแต่ในระดับ abstraction ที่สูงกว่า
- โมดูล 105 (data pipelines), 106 (MLOps) และ 110 (LLM infra) เป็นการเจาะลึกที่ต่อยอดโดยตรงจากพื้นฐานเหล่านี้
