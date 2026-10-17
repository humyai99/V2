# Assessments

This directory holds **track-level** assessments that span multiple modules. Per-module quizzes live alongside their module under `lessons/mod-NNN-*/quizzes/`.

## Layout

```
assessments/
├── quizzes/              Track-level quizzes; per-module quizzes are in lessons/
│   └── answer-keys/      Answer key index
├── coding-challenges/    Multi-module coding challenges
├── practical-exams/      Midterm and final practical exams
└── rubrics/              Grading rubrics for projects and exams
```

## Per-module quizzes (canonical locations)

Each module owns its own quiz file. The canonical location is `lessons/mod-NNN-*/quizzes/module-quiz.md`. Module 02 additionally has a `mid-module-quiz.md` and `final-quiz.md` covering different lesson ranges.

| Module | Path |
|---|---|
| 101 | `lessons/mod-101-foundations/quizzes/module-quiz.md` |
| 102 | `lessons/mod-102-cloud-computing/quizzes/` (mid, final, module) |
| 103 | `lessons/mod-103-containerization/quizzes/module-quiz.md` |
| 104 | `lessons/mod-104-kubernetes/quizzes/module-quiz.md` |
| 105 | `lessons/mod-105-data-pipelines/quizzes/module-quiz.md` |
| 106 | `lessons/mod-106-mlops/quizzes/module-quiz.md` |
| 107 | `lessons/mod-107-gpu-computing/quizzes/module-quiz.md` |
| 108 | `lessons/mod-108-monitoring-observability/quizzes/module-quiz.md` |
| 109 | `lessons/mod-109-infrastructure-as-code/quizzes/module-quiz.md` |
| 110 | `lessons/mod-110-llm-infrastructure/quizzes/module-quiz.md` |

## Track-level assessments here

| File | Purpose |
|---|---|
| `coding-challenges/challenge-01-model-api.md` | Multi-module coding challenge: build a model API spanning Docker + Kubernetes + monitoring. |
| `practical-exams/midterm-practical-exam.md` | Mid-track practical exam covering modules 101–105. |
| `rubrics/project-assessment-rubric.md` | Rubric used to grade all three end-of-track projects. |

## Grading

Each quiz and exam in this repo includes its own pass/fail threshold (typically 80%). For project rubrics, see `rubrics/project-assessment-rubric.md`.
