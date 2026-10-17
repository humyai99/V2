# Reading List — Staff Engineer Path

You've been operating production ML platforms for 3+ years. You can lead the technical design of a multi-team project. The next move is depth + influence — the things that distinguish staff from senior.

This list is more about **how to operate** than what to learn. The reading is more biographical and meta than technical.

## Track 1 — Leadership Without Authority

### Books

- *Staff Engineer: Leadership Beyond the Management Track* — Will Larson. **Required.**
- *The Staff Engineer's Path* — Tanya Reilly.
- *The Manager's Path* — Camille Fournier (even if you're not managing — context matters).
- *An Elegant Puzzle* — Will Larson.

### Practice

- Write a design document that another senior engineer **wants** to read. Then go solicit reviews and iterate.
- Run a quarterly cross-team technical review for your platform area. Capture decisions in writing.
- Identify 3 engineers to mentor for the next year. Teaching is how you find out what you don't actually know.

---

## Track 2 — System Design at Scale

### Books

- *Designing Data-Intensive Applications* — Martin Kleppmann (a re-read at this point — different things stand out).
- *Software Engineering at Google* — Winters, Manshreck, Wright.
- *Accelerate* — Forsgren, Humble, Kim. The empirical case for high-performance practices.
- *Team Topologies* — Skelton & Pais.

### Practice

- Author a **platform RFC** that survives review by 5+ senior engineers.
- Run a major migration end-to-end (move 50+ services from old infra to new). Document the playbook.
- Conduct a **technical due-diligence review** of an adjacent team's system.

---

## Track 3 — Strategy and Roadmaps

### Books

- *Good Strategy / Bad Strategy* — Richard Rumelt. **Required.**
- *Continuous Discovery Habits* — Teresa Torres.
- *Building a Second Brain* — Tiago Forte (for personal knowledge management at this stage).

### Practice

- Write a **3-year platform vision** that connects to the company's business goals. Pitch it to your skip-level.
- Run a quarterly roadmap exercise that aligns 3+ teams.
- Practice saying no, transparently, with a documented alternative.

---

## Track 4 — Working with Researchers and Product

### Books

- *Inspired* — Marty Cagan.
- *The Lean Startup* — Eric Ries (skim).
- *Crucial Conversations* — Patterson, Grenny, McMillan, Switzler.

### Practice

- Embed with a research team for a month. Translate their needs into platform commitments.
- Run a product-engineering brainstorm where you're the engineer who **leaves with a product manager's mental model**, not vice versa.

---

## Track 5 — Distributed Systems Mastery

You did the basics. Now go to the source.

### Books and papers

- *Distributed Systems* — van Steen & Tanenbaum (free online).
- *Principles of Distributed Computing* — Lynch.
- "Paxos Made Simple" — Lamport.
- "In Search of an Understandable Consensus Algorithm (Raft)" — Ongaro & Ousterhout.
- "Calvin: Fast Distributed Transactions for Partitioned Database Systems" — Thomson et al.
- "Chain Replication for Supporting High Throughput and Availability" — van Renesse & Schneider.

### Source-code reading (pick one, two weeks deep)

- etcd's Raft implementation.
- CockroachDB's distributed SQL layer.
- Apache Kafka's controller.
- Cassandra's gossip and hinted handoff.

---

## Track 6 — ML Platforms at Scale (Multi-tenant)

Beyond single-service production ML.

### Papers and engineering blogs

- *TFX: A TensorFlow-Based Production-Scale Machine Learning Platform* — Baylor et al.
- Uber's Michelangelo platform engineering blog series.
- Meta's PyTorch Platform writeups.
- Netflix's Metaflow design.
- *Triton Inference Server* design docs.
- *vLLM: Easy, Fast, and Cheap LLM Serving with PagedAttention* — Kwon et al.

### Build

- Design and lead the build of a **multi-tenant model serving layer** hosting 50+ models with shared CPU/GPU pools. Account for: model loading/eviction, fair scheduling, per-tenant rate limiting, isolation, blast-radius limits, cost attribution.

---

## Track 7 — Reliability Culture

Beyond runbooks.

### Books and papers

- *Site Reliability Engineering* — Google SRE book, full re-read.
- *Seeking SRE* — David Blank-Edelman (ed.).
- "Failure Sketching: A Technique for Automated Root Cause Diagnosis of In-Production Failures" — Kasikci et al.
- Netflix's *Principles of Chaos*.

### Practice

- Run a quarterly **GameDay** — break things in staging on purpose; measure what your team can and can't diagnose.
- Author a postmortem culture document for your org.
- Introduce **error budgets** as a policy lever for release cadence.

---

## Track 8 — Industry Awareness

Track what's coming, not just what's here.

### Reading habits

- Skim **NeurIPS / ICML / ICLR** proceedings for one weekend per quarter.
- Subscribe to *The Pragmatic Engineer* (Gergely Orosz), *MLOps Community* newsletters, *Latent Space* podcast.
- Watch one *Strange Loop* / *QCon* keynote per month.
- Read the latest *State of DevOps* / *Stack Overflow Developer Survey* / *Google's DORA* reports annually.

---

## Career Moves

Staff engineering is as much about choosing what to work on as it is about being good at it.

### Decision frameworks

- **Glue work** — Tanya Reilly's essay. The work that holds teams together but doesn't show up in your perf review. Do it deliberately, document it.
- **Promotion vs. impact** — periodically ask: am I optimizing for the next title, or for the most leveraged work?
- **The two-pizza team rule** — your effective span of attention is limited; choose your tax carefully.

### Habits to develop

- Write 250 words per workday — design docs, RFCs, postmortems, retrospectives.
- Spend 10% of your time mentoring, no exceptions.
- Maintain a personal **decision log** for major technical choices. Re-read it quarterly.

---

## How to Use This List

- This is a **2–5 year reading list**, paced deliberately.
- Don't optimize for completing it — optimize for what your day job needs next quarter.
- Re-read your own work. The most valuable references at this level are your own postmortems and RFCs.
- Get a peer staff engineer at another company you trade notes with quarterly.

After this path, the next move is usually domain specialization (a specific ML modality, a specific industry) or principal/distinguished engineer (more breadth, more reach, eventually setting industry standards).
