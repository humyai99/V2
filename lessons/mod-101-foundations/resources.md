# Module 101 — Foundations of ML Infrastructure Resources

## Foundational books

- **Designing Machine Learning Systems** by Chip Huyen. The canonical ML systems text. Required reading for this track.
- **Machine Learning Engineering** by Andriy Burkov. Practical complement to Huyen; covers more of the engineering side.
- **The Big Book of MLOps (2023)** by Databricks. Free PDF, comprehensive MLOps overview.
- **Building Machine Learning Powered Applications** by Emmanuel Ameisen. Product-engineering lens on ML.

## Official documentation

- **PyTorch documentation** — [pytorch.org/docs](https://pytorch.org/docs/stable/index.html). The framework most of this module's code uses.
- **TensorFlow documentation** — [tensorflow.org/api_docs](https://www.tensorflow.org/api_docs). For comparison; still widely deployed.
- **TorchServe documentation** — [pytorch.org/serve](https://pytorch.org/serve/). PyTorch's serving framework.
- **TensorFlow Serving documentation** — [tensorflow.org/tfx/serving](https://www.tensorflow.org/tfx/serving). TF's serving framework.

## The ML lifecycle references

- **Rules of Machine Learning** by Google — [developers.google.com/machine-learning/guides/rules-of-ml](https://developers.google.com/machine-learning/guides/rules-of-ml). 43 rules; read once.
- **Hidden Technical Debt in Machine Learning Systems** (Sculley et al., NeurIPS 2015) — [papers.nips.cc/paper/2015/file/86df7dcfd896fcaf2674f757a2463eba-Paper.pdf](https://papers.nips.cc/paper/2015/file/86df7dcfd896fcaf2674f757a2463eba-Paper.pdf). The "ML systems are 5% ML, 95% glue code" paper.
- **Continuous Delivery for Machine Learning** by Thoughtworks — [martinfowler.com/articles/cd4ml.html](https://martinfowler.com/articles/cd4ml.html). The patterns CD has to learn for ML.

## Industry posts worth reading

- **Meet Michelangelo** (Uber) — [uber.com/blog/michelangelo-machine-learning-platform](https://www.uber.com/blog/michelangelo-machine-learning-platform/). The reference internal-ML-platform post.
- **Open-Sourcing Metaflow** (Netflix) — [netflixtechblog.com/open-sourcing-metaflow-a-human-centric-framework-for-data-science-fa72e04a5d9](https://netflixtechblog.com/open-sourcing-metaflow-a-human-centric-framework-for-data-science-fa72e04a5d9). Human-centric framework design.
- **Scaling Kubernetes to Support 50,000 Services** (Airbnb) — for understanding the scale of platform engineering.

## Development environment

- **uv** — [docs.astral.sh/uv](https://docs.astral.sh/uv/). Modern Python package manager (10-100x faster than pip).
- **ruff** — [docs.astral.sh/ruff](https://docs.astral.sh/ruff/). Linter + formatter.
- **mypy** — [mypy.readthedocs.io](https://mypy.readthedocs.io/). Type checker.
- **pre-commit** — [pre-commit.com](https://pre-commit.com/). Hook framework.
- **Docker Desktop** or **Podman** — local container runtime.

## ML framework comparison

| Framework | Best for | Notes |
|---|---|---|
| **PyTorch** | Research, modern production | The dominant deep-learning framework. Most new code is PyTorch. |
| **TensorFlow** | Mobile/edge deployments, legacy production | Still widely deployed; less new code today. |
| **JAX** | Research with strong perf needs | Functional, increasingly popular for LLM research. |
| **ONNX** | Cross-framework deployment | Standard exchange format; serving runtime independence. |

## Online courses + tutorials

- **Andrew Ng's Machine Learning Specialization** (Coursera) — the most-watched ML course in history. Foundational.
- **Fast.ai Practical Deep Learning for Coders** — [course.fast.ai](https://course.fast.ai/). Top-down, ship-first approach.
- **Hugging Face Course** — [huggingface.co/learn](https://huggingface.co/learn). Modern, hands-on, free.
- **Full Stack Deep Learning** — [fullstackdeeplearning.com](https://fullstackdeeplearning.com/). Free course on ML systems.

## Cross-references in this curriculum

- This is the first engineer-track module. The remaining 9 modules (mod-102 through mod-110) build on what's introduced here.
- Junior track's mod-001 through mod-005 cover the prerequisites if you're coming in fresh.
- ML Platform track is a sister specialization — same concepts at higher abstraction.
- Modules 105 (data pipelines), 106 (MLOps), and 110 (LLM infra) are the deeper-dives that build directly on these foundations.
