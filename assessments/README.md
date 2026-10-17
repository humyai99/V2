# การประเมินผล

ไดเรกทอรีนี้เก็บการประเมินผล **ระดับแทร็ก** ที่ครอบคลุมหลายโมดูล ส่วนแบบทดสอบรายโมดูลจะอยู่คู่กับโมดูลนั้น ๆ ภายใต้ `lessons/mod-NNN-*/quizzes/`

## โครงสร้าง

```
assessments/
├── quizzes/              Track-level quizzes; per-module quizzes are in lessons/
│   └── answer-keys/      Answer key index
├── coding-challenges/    Multi-module coding challenges
├── practical-exams/      Midterm and final practical exams
└── rubrics/              Grading rubrics for projects and exams
```

## แบบทดสอบรายโมดูล (ตำแหน่งหลัก)

แต่ละโมดูลมีไฟล์แบบทดสอบของตนเอง ตำแหน่งหลักคือ `lessons/mod-NNN-*/quizzes/module-quiz.md` โดยโมดูล 02 มี `mid-module-quiz.md` และ `final-quiz.md` เพิ่มเติม ซึ่งครอบคลุมบทเรียนคนละช่วง

| โมดูล | พาธ |
|---|---|
| 101 | `lessons/mod-101-foundations/quizzes/module-quiz.md` |
| 102 | `lessons/mod-102-cloud-computing/quizzes/` (กลางโมดูล, ท้ายโมดูล, โมดูล) |
| 103 | `lessons/mod-103-containerization/quizzes/module-quiz.md` |
| 104 | `lessons/mod-104-kubernetes/quizzes/module-quiz.md` |
| 105 | `lessons/mod-105-data-pipelines/quizzes/module-quiz.md` |
| 106 | `lessons/mod-106-mlops/quizzes/module-quiz.md` |
| 107 | `lessons/mod-107-gpu-computing/quizzes/module-quiz.md` |
| 108 | `lessons/mod-108-monitoring-observability/quizzes/module-quiz.md` |
| 109 | `lessons/mod-109-infrastructure-as-code/quizzes/module-quiz.md` |
| 110 | `lessons/mod-110-llm-infrastructure/quizzes/module-quiz.md` |

## การประเมินผลระดับแทร็กในไดเรกทอรีนี้

| ไฟล์ | วัตถุประสงค์ |
|---|---|
| `coding-challenges/challenge-01-model-api.md` | โจทย์เขียนโค้ดข้ามหลายโมดูล: สร้าง model API ที่ครอบคลุม Docker + Kubernetes + monitoring |
| `practical-exams/midterm-practical-exam.md` | ข้อสอบภาคปฏิบัติกลางแทร็ก ครอบคลุมโมดูล 101–105 |
| `rubrics/project-assessment-rubric.md` | รูบริกที่ใช้ให้คะแนนโปรเจกต์ท้ายแทร็กทั้งสามโปรเจกต์ |

## การให้คะแนน

แบบทดสอบและข้อสอบแต่ละชุดใน repo นี้มีเกณฑ์ผ่าน/ไม่ผ่านของตนเอง (โดยทั่วไปคือ 80%) สำหรับรูบริกของโปรเจกต์ ดูที่ `rubrics/project-assessment-rubric.md`
