# Context Handover: 2019 TvLK Paper Study

## What is this?

This file captures the current state of an ongoing study session on the **2019 Hagan et al. TvLK paper** (Time-Varying Liang–Kleeman information flow). Any future agent or session should read this before continuing work in this folder.

---

## What happened so far

### Session: 2026-07-30

1. **Sparring session on the 2019 paper.** The user and agent worked through the paper's concepts one piece at a time. The following **key confusions were identified and resolved:**

   - **"Why covariance?"** — The user's core confusion was why LK is built on covariance at all. Resolution: covariance is NOT the definition of causality. It is the arithmetic tool used to estimate the physical push parameter $a_{12}$ from the linear rate equation $\frac{dX_1}{dt} = a_{11}X_1 + a_{12}X_2 + \text{noise}$.

   - **"How can you calculate covariance from a single point?"** — The user correctly identified that $P(t)$ at a single time step $t$ cannot be a sample covariance from one data point. Resolution: $P(t)$ is not computed from a single point. It has two sources of history: (1) recursive Kalman memory ($P_{t-1} \to P_t$), and (2) the sliding historical window used to estimate $Q(t)$ and $R(t)$.

   - **"How does the Kalman filter produce $P(X_2, \dot{X}_1)$?"** — The user asked how the Kalman filter can output covariance between $X_2$ and the derivative of $X_1$ when only $X_1$ and $X_2$ are observed. Resolution: the derivative must be inside the state vector or observation pipeline. The paper does NOT specify exactly how — this is a known reproducibility gap.

   - **"What is the exact state vector, $A$, and $H$?"** — The user looked for these in the paper and could not find them. Resolution: **the paper genuinely omits them.** Both guide files now explicitly flag this as an implementation gap that is the paper's limitation, not the reader's failure.

2. **Guide files rewritten.** Both foundation and paper guide files were substantially rewritten to address the confusions above:

   - [2019-tvlk-foundations.md](2019-tvlk-foundations.md) — Added new modules on "Where covariance comes from" (Module 4), "The state-vector question" (Module 7), "Why P(t) is not covariance from one point" (Module 8). Added heater example for physical intuition. Added context section comparing LK to Granger, Transfer Entropy, PCMCI.

   - [2019-tvlk-paper-guide.md](2019-tvlk-paper-guide.md) — Core contribution stated upfront ($C \to P(t)$). Warnings about the implementation gap added to Section 2b reading path. "Why P(t) is not covariance from one data point" promoted to main body.

3. **Further-reading notes were consolidated.** The extensions, alternatives, limitations, experiments, and IcyAlert decisions now live in one maintained research-status file:

   - [IcyAlert LK and filtering status](../../../llm-remarks/icyalert-lk-filtering-status.md) — Contains the covariance distinction, direct LK extensions, Docquier evidence, completed experiments, open decisions, and reading order.

---

## Current file inventory

| File | Purpose | Status |
|---|---|---|
| [2019-tvlk-foundations.md](2019-tvlk-foundations.md) | Pre-reading foundations (12 modules) | **Rewritten** — ready to use |
| [2019-tvlk-paper-guide.md](2019-tvlk-paper-guide.md) | Section-by-section reading companion | **Rewritten** — ready to use |
| [IcyAlert LK and filtering status](../../../llm-remarks/icyalert-lk-filtering-status.md) | Extensions, evidence, experiment status, and decisions | **Consolidated** — authoritative file |
| [llm-summary-2019.md](llm-summary-2019.md) | Previous LLM's toy example walkthrough | Unchanged — still useful as quick reference |
| [paper-dump.md](paper-dump.md) | Full paper text (local copy) | Unchanged |
| [lacking.md](lacking.md) | Broader DA/ML foundations (separate scope) | Unchanged — not about TvLK specifically |
| [3d-var-more-paper.md](3d-var-more-paper.md) | 3D-Var related papers | Unchanged |
| [4d-var.md](4d-var.md) | 4D-Var notes | Unchanged |
| [shared-link.md](shared-link.md) | Shared links | Unchanged |
| [parse_refs.py](parse_refs.py) | Reference parsing script | Unchanged |

---

## What the user understands so far

- ✅ Why correlation is symmetric and cannot give causal direction
- ✅ What the derivative series $\dot{X}_1$ is and why it breaks symmetry
- ✅ Why LK uses covariance (to estimate $a_{12}$, the physical push)
- ✅ The core contribution: $C \to P(t)$
- ✅ That the Kalman filter is a covariance-tracking machine here, not a forecaster
- ✅ That $P(t)$ is not covariance from a single point (recursive memory + sliding window)
- ✅ That the paper omits the exact state vector, $A$, $H$ matrices
- ✅ That LK is one of several causality frameworks (Granger, TE, PCMCI, LK)
- ✅ The linear assumption

## What has NOT been sparred through yet

- ⬜ Walking through the actual TvLK formula term by term with numbers
- ⬜ Understanding $Q(t)$ and $R(t)$ estimation (EWMA/UWMA) in detail
- ⬜ The synthetic experiments (what was preset, what was recovered)
- ⬜ The wavelet postprocessing layer (TFvLK)
- ⬜ Significance testing
- ⬜ The real-data application (ERA-Interim soil moisture / temperature)
- ⬜ Reading the actual paper sections with the guide

---

## How to continue

1. **If the user wants to continue sparring:** Pick the next unchecked item above and go one piece at a time. Do not dump multiple topics. Ask the user to confirm understanding before moving on.

2. **If the user wants to read the paper:** Point them to [2019-tvlk-paper-guide.md](2019-tvlk-paper-guide.md) as a side-by-side companion. The reading path section gives time estimates per section.

3. **If the user asks about further papers or alternatives:** Point to [IcyAlert LK and filtering status](../../../llm-remarks/icyalert-lk-filtering-status.md).

4. **Critical style note:** The user learns best through slow, one-piece-at-a-time sparring with confirmation questions. Do NOT dump entire explanations. Ask one question, wait for the answer, then build on it.
