I'll conduct this systematically, starting with the seed sources and expanding through citation networks and code repositories. This requires many searches — let me begin.Search is live and working. Let me dig into the most directly relevant seed source first — the Wang et al. 2025 causality-driven localization paper for EnKF.This is a critical primary source. Key finding: LK is computed from a long time series *before* DA and held fixed — not from Pf/Pa — and the authors explicitly flag flow-dependent/ensemble-based LK as unresolved future work. Let me continue with the other seed papers and search for code repositories.# Liang–Kleeman Information Flow × Kalman/Ensemble Filtering: Literature Search Results

Web search was live throughout this session. Findings below are drawn from retrieved documents; I've labeled claims as **[stated]** (explicit in the source), **[inferred]** (derived from equations/context I could see but not verbatim-confirmed), or **[unclear/not found]** (could not verify). Two primary sources (Hagan et al. 2019 AMS journal page, Zhou et al. 2024 AMS journal page) blocked automated fetching — I worked from cached search snippets, ResearchGate abstracts, and citing-paper paraphrases rather than the full PDF equations. I flag every place this matters.

---

## A. Search Log

**Databases/sites queried:** Google-backed web search (via tool), AMS Journals (journals.ametsoc.org — blocked bot access), Frontiers (fully fetched), APS/PRE (journals.aps.org), arXiv, ResearchGate, Semantic Scholar (indirectly), OpenAlex-style citation trails via search, GitHub, ncoads.org (X.S. Liang's lab site — robots-disallowed for direct fetch, but indexed via search), PyPI/pyleoclim docs, Zenodo, dblp.

**Representative queries run (of ~20 total):**
`Hagan 2019 Liang-Kleeman time-varying causality`; `Wang 2025 causality-driven localization EAKF`; `Liang 2014 unraveling cause-effect Phys Rev E`; `X. San Liang causality source code MATLAB`; `"Liang Kleeman" "Kalman filter" covariance`; `"Liang information flow" "ensemble Kalman filter"`; `Hagan Wang Liang Dolman square root Kalman filter state vector`; `Zhou 2024 MtvLK Bierman Thornton`; `"causality_est.m" OR "EWMACovEst.m" OR "bierman.m" OR "thornton.m"`; `"MtvLK" github zenodo`; `Yang 2024 air-sea interaction Liang Kleeman Kalman`; `Liang Kleeman process noise measurement noise Kalman tuning`; `Knowledge-Guided Time-Varying Causal Inference Arctic Sea Ice`.

**Stopping condition:** After ~3 consecutive query reformulations (code-repo names, Q/R-tuning specifics, EWMA+LK) returned no new on-target sources, I stopped that sub-thread per your instruction. I did **not** exhaust every branch (e.g., I did not do a full OpenAlex/Crossref forward-citation crawl of all ~40 papers citing Liang 2014/2016 individually) — this is noted as missing evidence in Section E.

---

## B. Directly Relevant Papers

### B1. Hagan, Wang, Liang & Dolman (2019), *J. Climate* 32, 7521–7537, doi:10.1175/JCLI-D-18-0881.1 [SEED]

- **LK/filter connection [stated]:** "To tackle the challenge of computing a time-varying causality based on Eq. (2)... a Kalman filter is employed. The main goal of using this Kalman filter approach is to estimate the required covariances at each time step." They cite Bierman & Thornton (1976) and use a **square-root Kalman filter** specifically to avoid numerical instability in propagating covariance.
- **Covariance definition [unclear — could not access full equations]:** The paper states a standard KF has "the estimation part, which calculates the state estimate x, and the gain part, which computes the covariance of the state." I could **not** retrieve the exact state-vector definition (whether **x** = the raw land-atmosphere time series themselves, or some transformed/regression-coefficient state) from accessible text. This is the single most important unresolved equation for your question, and I could not confirm it — you should pull the actual PDF (Eqs. 9–16 in the paper) yourself.
- **Distinguishes P from C? [unclear/not found]:** No accessible text draws an explicit distinction between "signal covariance C" (as required by the original Liang 2014 formula) and "Kalman estimation-error covariance." The framing ("main goal... is to estimate the required covariances") reads as treating the KF as a smoothing/tracking device whose output covariance is *used as* C, without a stated justification for that substitution.
- **Q(t)/R(t) [not found]:** No accessible source states how process/measurement noise covariances were chosen (fixed constants, tuned, adaptive).
- **Stationary vs transient:** Transient/time-varying — this is the paper's whole point (title: "time-varying causality formalism").
- **Filtering stage:** Appears to be computed **during** the recursive KF pass (covariance re-estimated at each time step), not before/fixed.
- **Validation:** Applied to real land-atmosphere (soil moisture/temperature) interactions; synthetic validation with periodic/frequency-domain signals is mentioned (wavelet cross-check) but I couldn't confirm quantitative validation metrics from accessible text.
- **Code:** Not found in accessible text — no GitHub/Zenodo link surfaced for this specific paper (see ncoads.org note below).
- **Unresolved ambiguity:** Whether the KF's P is rigorously equivalent to, or merely a proxy for, the LK formula's required C is **not explicitly addressed** in any text I could retrieve.

### B2. Zhou, Hagan, Wang, Liang, Li, Shao, Yeboah & Wei (2024), *J. Climate* 37, 1853–1876, doi:10.1175/JCLI-D-23-0207.1 ("MtvLK")

Direct multivariate extension of Hagan et al. (2019).

- **LK/filter connection [stated, via ResearchGate-cached snippet]:** "Because the Kalman filter can identify immediate changes, this would become advantageous when tracking time-varying causality... we use the Kalman filter to estimate the time-varying information flow... The standard Kalman filter is formulated with [Eqs 8-9]... the estimation of each time can be obtained by the Kalman filter recursive [update]... the standard Kalman filter essentially uses the Kalman gain K... **This step is used to compute the causality.** The Bierman and Thornton algorithms are used at the measurement and temporal updates to make the calculation more stable."
- **Covariance definition [unclear]:** Same ambiguity as Hagan 2019 — text explicitly says the Kalman gain/covariance machinery is used "to compute the causality," which strongly suggests the filter's internal P *is* substituted for C, but I found no explicit derivation justifying this substitution, and no passage distinguishing "signal covariance" from "estimation-error covariance."
- **Q/R:** Not found.
- **Stationary vs transient:** Transient — validated on a synthetic time-varying-causality benchmark (causality strength ramped from 0 to 0.5 over a designed window, per the snippet: "for 500 ≤ t ≤ 1500, all the causalities are gradually increased from 0 to 0.5").
- **Filtering stage:** During the recursive filter pass, computed at each step.
- **Numerical-stability framing [stated]:** Bierman/Thornton square-root algorithms are explicitly motivated by numerical stability ("make the calculation more stable"), **not** by an explicit "preserve causal structure" argument — so per your evidence rules, I cannot label this as "causality-preserving regularization"; that would be an unsupported inference.
- **Code:** Not found in accessible text. X.S. Liang's lab bibliography page (ncoads.org) lists this paper with a "[pdf]" link but the underlying URL wasn't resolvable through search; the general code page ncoads.org/article/show/67.aspx ("codes are available, and will be updated") is robots-disallowed for me to fetch directly, and I could not confirm this specific MtvLK algorithm is hosted there.
- **Unresolved ambiguity:** Identical to B1 — the P-vs-C substitution is functionally present but not argued for in any text I could access.

### B3. Wang, Wang, Cao, Li & Han (2025), *Frontiers in Marine Science* 12:1600634, doi:10.3389/fmars.2025.1600634 [SEED — full text obtained]

This is the cleanest, most fully-verifiable source in the set, and it answers several of your questions directly and explicitly.

- **LK/filter connection [stated]:** LK information flow is used to construct an **anisotropic localization function** for the Ensemble Adjustment Kalman Filter (EAKF), replacing the empirical Gaspari–Cohn radius. LK itself is *not* computed from filter-internal covariances.
- **Covariance definition [stated, exact quote]:** "C represents the covariance between the two variables" — this is the **raw sample covariance of the time series themselves** (observation-to-state-variable time series), computed independently of the EAKF's forecast/analysis covariance.
- **Distinguishes P from C? [stated — and answered "no substitution occurs"]:** The paper explicitly states: "the LK information flow used in this study is calculated from **sufficiently long time series prior to DA**, and it is assumed that the causal relationships derived... remain unchanged during the DA process." So in this paper, C ≠ Pf ≠ Pa — LK's C is a **separate, static, pre-computed climatological covariance**, and the EnKF's Pf/Pa are used only for the standard EAKF update (as usual), Schur-multiplied by a localization mask derived from the *static* LK result.
- **Q(t)/R(t):** Not the focus; standard EAKF adaptive-inflation (Anderson 2007) is used for the ensemble covariance, unrelated to the LK computation.
- **Low observation noise / covariance ratio distortion:** Not addressed in this paper.
- **Stationary vs transient [stated — this is important]:** **Explicitly stationary/static.** LK is computed once from a 9,600-timestep series *before* the first DA cycle, and the resulting localization mask is fixed for the entire assimilation run.
- **Filtering stage:** Before assimilation, one-time, not recomputed per cycle.
- **Validation:** Twin experiments with an atmosphere-ocean-land intermediate coupled model (Wu et al. 2012), EAKF, ensemble sizes N=[5,10,20,30,40]. Reports RMSE reductions (5–51% depending on variable) vs. Gaspari-Cohn localization, and shows the LK method avoids filter divergence at N=5 where G-C diverges.
- **Code:** Not found — data availability statement only references "Supplementary Material," no GitHub/Zenodo link.
- **Unresolved ambiguity — explicitly stated as future work by the authors themselves:** *"future work should also explore the integration of **flow-dependent ensemble covariances** within the LK framework to define the information flow **dynamically throughout the DA window**... allow[ing] the information pathways to adapt instantaneously to the evolving atmospheric and oceanic states."* This is a direct, primary-source confirmation that **as of this 2025 paper, nobody (including this author group) has yet computed LK from a live forecast/analysis ensemble covariance (Pf/Pa) inside the DA cycle** — that is explicitly flagged as an open gap, not something this paper (or, by the authors' framing, any paper they're aware of) has done.

### B4. Liang (2014), *Phys. Rev. E* 90, 052150, doi:10.1103/PhysRevE.90.052150 [SEED — foundational]

- Defines T_{2→1} using **C**, the sample covariance matrix of the raw time series **⟨X(·)X(·)ᵀ⟩** — explicitly *not* a filtering-derived quantity. This is the canonical definition against which every downstream "P vs C" question in this search should be checked.
- No Kalman filter content; purely the derivation and bivariate significance test.

### B5. Liang (2016), *Phys. Rev. E* 94, 052201, doi:10.1103/PhysRevE.94.052201 [SEED — foundational]

- General closed-form information flow for time-discrete/continuous, deterministic/stochastic systems. No filtering content. Establishes the "principle of nil causality" as a proven theorem.

---

## C. Adjacent Papers (covariance/filtering-relevant, but not using LK — or using a different causality formalism)

### C1. Jiang, Andreou, Reich & Chen — "A Continuous-Time Ensemble Kalman–Bucy Smoother for Causal Inference and Model Discovery," arXiv 2604.25157 (2026)
Full text obtained. **Important distinction:** this paper's "causal inference" is the *Assimilative Causal Inference* (ACI) framework of Andreou, Chen & Bollt (2026, *Nat. Commun.*) — an information-gain/relative-entropy metric between smoother and filter distributions, **not** the Liang-Kleeman formula. It is adjacent, not directly relevant, despite very similar-sounding terminology ("causal information flow," "causal influence range").
- Rigorously and explicitly distinguishes filtering covariance **Pf(t)** from smoothing covariance **Ps(t)** and cross-covariance **P_{f,s}**, with full derivations (their Eqs. 8–9, Appendix B) showing exactly when Pf,s = Pf holds and when it doesn't (stochastic vs. deterministic EnKBF formulations).
- Uses **explicit Gaspari-Cohn covariance localization and multiplicative inflation**, with stated objectives: *localization increases effective rank / mitigates sampling error; inflation compensates nonlinearity-induced sampling error.* Neither is framed as "preserving causal structure" — this is a good example of the general principle you asked me to verify (Q9): **inflation/localization in the literature is motivated by numerical/statistical regularization, not causality preservation**, and this paper is explicit and careful about that.
- **Code:** Fully open — `https://github.com/jiangzh67/EnKBS`, MIT license, MATLAB.
- Relevant to you as a **methodological template**: this is the most rigorous P_f vs. P_s treatment I found in the entire search, and its Appendix A/B derivations (discrete-to-continuous KF/RTS-smoother limit) are a good model for how a careful "P vs C" argument should look, even though it's not LK.

### C2. Lien, "A Liang-Kleeman Causality Analysis based on Linear Inverse Modeling" (LIM-LK), arXiv:2409.06797; and the follow-up Phys. Rev. E paper (2025, "Linear-inverse-modeling approach to estimating Liang-Kleeman information flow in a cyclostationary process under memoryless and persistent noise")
- Fits a linear dynamical model **ẋ = Ax + √(2Q)·noise** to data (linear inverse modeling — structurally close to a Kalman filter's forecast/dynamics model, but fit offline via least squares, not sequentially updated against observations), then computes LK causality from the fitted **A** and the **stationary/climatological covariance C = ⟨xxᵀ⟩** implied by that model.
- **C here is explicitly the signal covariance**, not an estimation-error covariance — LIM-LK is adjacent rather than directly relevant because there's no sequential Bayesian filtering/observation-assimilation step; it's a one-shot dynamical-system-identification exercise.
- Extension to colored (Ornstein-Uhlenbeck) noise is notable if you care about non-white process noise Q(t).

### C3. Rong & Liang (2022), *IEEE TGRS* 60, "An information flow-based sea surface height reconstruction through machine learning"
LK is used as a feature-relevance/weighting mechanism ahead of an ML reconstruction — no Kalman filter, no time-varying covariance. Adjacent only.

### C4. General LK code repositories (no filtering, stationary bivariate/multivariate only)
- `github.com/Climdyn/Liang_Index_climdyn` (Docquier/Vannitsem group) — Python, bivariate (Liang 2014) and multivariate (Liang 2021).
- `github.com/dykuang/Liang-Causality` — numpy + PyTorch (differentiable/GPU) implementation, notable because it's structured as a "torch module" usable as a neural-net layer — potentially relevant to you if you ever want a differentiable LK estimator inside a learned pipeline, but it is **stationary**, no filtering.
- `github.com/Koni2020/pyLiang` — Python.
- `pyleoclim.utils.causality.liang` / `.liang_causality` — pip-installable, stationary bivariate LK with significance testing (AR(1) or surrogate), widely used in paleoclimate.
- X.S. Liang's own code page `www.ncoads.org/article/show/67.aspx` ("The codes are available, and will be updated") — **robots-disallowed**, so I could not verify its contents. Could not confirm whether it hosts the Hagan/Zhou Kalman-filter variant specifically.

### C5. Docquier et al. (2022, *GRL*), and CMIP6 large-ensemble LK papers (e.g., *Sci. Rep.* 2024, "Drivers of summer Arctic sea-ice extent... revealed by information flow")
Standard stationary/windowed LK applied to climate time series. No Kalman filtering. Useful only as evidence of the breadth of LK's climate-science adoption.

---

## D. Contradictions / Inconsistent Usage

1. **What "transient LK" means differs sharply between the two seed-adjacent camps.** Wang et al. (2025) treat LK as **static-but-spatially-anisotropic** (fixed once, before DA, from a long climatological series) — "transient" in their world only means "used to modulate a localization function that varies by location/variable pair," not "recomputed as the filter's covariance evolves in time." Hagan (2019)/Zhou (2024) treat LK as **genuinely time-varying**, recomputed every recursive step using a Kalman-filter-tracked covariance. These are two different senses of "time-varying LK" and a paper search on the phrase alone will conflate them if you're not careful — worth flagging since your project brief explicitly cares about this distinction.

2. **No paper I found explicitly reconciles "signal covariance C" (Liang 2014's own definition, ⟨X(·)X(·)ᵀ⟩ of the raw process) with "Kalman estimation-error covariance P" (uncertainty about the estimate, which shrinks as observations accumulate and is NOT the same statistical object as the variance of the underlying signal).** This is a substantive, unaddressed conceptual gap across every "LK + Kalman" paper I could access — Hagan (2019) and Zhou (2024) appear to functionally substitute one for the other via the KF machinery without an explicit justifying argument in any text I could retrieve, while Wang (2025) sidesteps the issue entirely by keeping C outside the filter altogether. I want to be careful here: I could not access Hagan/Zhou's actual equations, so I cannot rule out that a justification exists in the paper body that simply didn't surface in indexed snippets — this is a "go read the primary source" item, not a confirmed finding.

3. **Regularization language is used loosely across papers but the stated *objective* differs every time**: Bierman/Thornton square-root filtering in Hagan/Zhou is for **numerical stability of the recursion**, not causal-structure preservation; Gaspari-Cohn localization in Wang (2025) is a **downstream application of LK's output**, not a regularizer applied *to* LK's inputs; localization/inflation in the EnKBS paper (C1) is for **sampling-error/rank-deficiency mitigation** in a completely different (non-LK) causal framework. None of these support a general claim that "covariance regularization preserves causal information" — that claim isn't made or tested anywhere in this search.

---

## E. Missing Evidence

- **Exact state-space formulation in Hagan (2019) and Zhou (2024):** what the Kalman filter's state vector **x** literally is (raw time series? regression/interaction coefficients? something else), and the precise equations (their Eqs. 9–16-ish) linking Kalman P to the LK formula's C. AMS journal pages blocked automated fetching (bot detection) and ResearchGate PDFs rate-limited/blocked. **You should pull these two PDFs directly** (institutional access or the [pdf] links on ncoads.org/article/show/76.aspx) — this is the highest-value primary-source read for your specific question.
- **How Q(t)/R(t) are chosen** in the Hagan/Zhou Kalman-LK filters — fixed constants, hand-tuned, or adaptively estimated. Not found anywhere in accessible text.
- **Whether low observation noise R distorts the LK covariance ratio C_ij/C_ii** — not addressed by any LK-specific source found. This looks like a genuinely open question, possibly worth being the actual novel contribution of a project, rather than something to search harder for.
- **Named files from your seed list** (`MtvLK` as a standalone repo, `SquareRootKalmanFilter2.m`, `multiLK_code.m`, `causality_est.m`, `EWMACovEst.m`, `bierman.m`, `thornton.m`): **none of these were found** anywhere in GitHub, GitLab, Zenodo, Figshare, OSF, or general web search, including with spelling variants. "MtvLK" only appears as the paper's *method acronym*, not a repo name. I'm reporting this as a clean negative result, not silence — if these filenames came from somewhere specific (a supplementary PDF, a private conversation, a different search engine), they don't appear to be indexed publicly right now.
- **A full forward-citation crawl** of Liang (2014)/(2016) — I sampled citing papers heavily but did not exhaustively enumerate all ~200+ citations via OpenAlex/Crossref API-style traversal; I relied on search-engine coverage, which is good but not guaranteed complete.
- **EWMA-based covariance estimation combined with LK** — no source found combining these terms at all.
- **Shrinkage estimators (Ledoit-Wolf etc.) combined with LK** — no source found.

---

## F. Final Evidence Map

**What is established (multiple independent primary sources, explicit statements):**
- LK causality *has* been combined with Kalman filtering to obtain time-varying causality estimates — twice, by essentially one overlapping author group (Hagan 2019 → Zhou 2024/MtvLK), using a **square-root (Bierman-Thornton) Kalman filter** whose covariance output feeds the LK formula at each recursive step.
- LK has also been combined with **ensemble** Kalman filtering (EAKF) in a structurally different way (Wang et al. 2025) — but there, LK is computed once from a long static time series *before* DA and is **not** derived from Pf or Pa at all; it's used only to shape localization.
- Liang's own definition of C (Liang 2014/2016) is the raw signal covariance of the observed process, computed independent of any filter.
- General-purpose (stationary, non-filtering) LK code is abundant and public (pyleoclim, Climdyn, dykuang).

**What is only claimed / asserted without a verified derivation (from accessible text):**
- That the Kalman filter's internal covariance P can validly stand in for the LK formula's required signal covariance C — this substitution is functionally present in Hagan (2019)/Zhou (2024) but I found no accessible passage that argues for its validity; it may be justified in the full paper text I couldn't reach, or it may simply be an unexamined convenience. **This is exactly the ambiguity you flagged in Q4/Q5, and based on everything retrievable, it remains open.**

**What has experimental/quantitative support:**
- Wang et al. (2025)'s LK-localized EAKF: 5–51% RMSE reduction vs. Gaspari-Cohn across variables, improved stability at small ensemble sizes (N=5), in a twin experiment on an intermediate atmosphere-ocean-land model.
- Zhou et al. (2024)/MtvLK: validated on a synthetic time-varying-causality benchmark plus real land-atmosphere data (exact quantitative results not retrievable from accessible snippets).

**What remains genuinely unknown / unresolved (confirmed, including by the authors themselves):**
- **Wang et al. (2025) explicitly state, in their own conclusions, that computing LK from a *live, evolving* forecast/analysis ensemble covariance within the DA cycle is future work** — i.e., as of a September 2025 publication, the specific thing you're asking about (transient LK computed *from* Pf(t)/Pa(t) inside an active EnKF/EnsKF loop, with an explicit signal-vs-error-covariance justification) does not appear to have been done and published, at least not by this most-relevant author group.
- No source addresses the low-R / covariance-ratio-distortion question.
- No source combines LK with EWMA covariance, shrinkage, or UD-factorization filters specifically (Bierman-Thornton square-root, yes; shrinkage/UD, no).
- No source states precisely how Q(t)/R(t) were chosen in the one existing time-varying-LK-via-Kalman-filter line of work.

**Exact papers/sections to inspect yourself, in priority order:**
1. Hagan et al. (2019), *J. Climate* 32, 7521–7537 — full equations 9–16(ish), the Kalman filter state-space setup. This is the paper that will tell you definitively what "x" and "P" mean in their formulation.
2. Zhou et al. (2024), *J. Climate* 37, 1853–1876 — same, multivariate version, plus their synthetic validation experiment design (Section on the 500≤t≤1500 ramped-causality test).
3. Wang et al. (2025), *Front. Mar. Sci.* 12:1600634 — Section 2.2 and the Discussion's "future work" paragraph (I quoted it above in full) — this is your clearest primary-source confirmation of the open gap.
4. Liang (2014), *Phys. Rev. E* 90, 052150 — for the canonical, filter-independent definition of C, to use as your ground-truth baseline when auditing whether later papers actually preserve its meaning.
5. Jiang, Andreou, Reich & Chen, arXiv 2604.25157, Appendix A & B — not LK, but the best available worked example of a rigorous Pf-vs-Ps derivation with a stated, defensible identity condition (P_{f,s} = P_f) — useful as a methodological template for how you'd want to *argue* a P≈C substitution if you pursue this yourself.