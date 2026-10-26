Perform an exhaustive web-based literature search. Do not answer from memory or general training knowledge.

If live web search is unavailable, stop and explicitly say so. Do not fabricate papers, code, equations, repositories, or conclusions.

RESEARCH GOAL

Find everything relevant to combining Liang–Kleeman information flow (LK/LKIF) with:

- Kalman filters;
- ensemble Kalman filters;
- square-root or UD filters;
- time-varying covariance estimation;
- process-noise covariance Q(t);
- observation-noise covariance R(t);
- transient/nonstationary information transfer;
- forecast and analysis ensembles;
- covariance preservation, shrinkage, inflation or regularization;
- data assimilation.

Spatial or grid-based applications are useful but secondary. Do not assume the method must operate across grids.

CORE QUESTIONS

1. How has LK information flow been combined with Kalman filtering?
2. Has anyone calculated transient LK using forecast covariance Pf(t), analysis covariance Pa(t), or another filtered covariance?
3. In each paper, what exactly does covariance P represent?
4. Does the paper distinguish Kalman estimation-error covariance P from the signal covariance C required by the original LK formula?
5. Is substituting P for C mathematically justified, experimentally validated, or merely assumed?
6. How are Q(t) and R(t) obtained?
7. Does low observation noise reduce or distort the covariance ratio used by LK?
8. Has anyone modified a Kalman or ensemble filter specifically to retain causal covariance structure?
9. Have inflation, covariance relaxation, moving covariance, square-root filtering, smoothing, localization, shrinkage or hybrid covariance been used for this purpose?
10. Is LK calculated:
    - from one long time series;
    - from an ensemble at one time;
    - over a moving window;
    - before assimilation;
    - during every assimilation cycle?
11. Is there public source code, supplementary material, archived code or reproducible pseudocode?
12. What remains genuinely unresolved?

SEED SOURCES

Start from these and follow both their references and all papers that cite them:

1. Hagan et al. (2019)
   “A Time-Varying Causality Formalism Based on the Liang–Kleeman Information Flow for Analyzing Directed Interactions in Nonstationary Climate Systems”
   DOI: 10.1175/JCLI-D-18-0881.1

2. Wang et al. (2025)
   “Causality-driven localization method for improving ensemble-based Kalman filters in strongly coupled data assimilation system”
   DOI: 10.3389/fmars.2025.1600634

3. Liang (2014)
   “Unraveling the cause-effect relation between time series”
   DOI: 10.1103/PhysRevE.90.052150

4. Liang (2016)
   “Information flow and causality as rigorous notions ab initio”
   DOI: 10.1103/PhysRevE.94.052201

SEARCH PROCEDURE — REQUIRED

1. Search the exact titles and DOIs.
2. Search each author’s publication page, ORCID, Google Scholar profile and institutional page.
3. Perform backward citation searches from the reference lists.
4. Perform forward citation searches using Google Scholar, OpenAlex, Crossref and Semantic Scholar where available.
5. Search journal supplementary files and data/code availability statements.
6. Search GitHub, GitLab, Zenodo, Figshare, OSF and institutional repositories.
7. Search the Internet Archive for deleted repositories, especially:
   - MtvLK
   - SquareRootKalmanFilter2.m
   - multiLK_code.m
   - causality_est.m
   - EWMACovEst.m
   - bierman.m
   - thornton.m
8. Repeat searches using spelling variants:
   - Liang–Kleeman / Liang Kleeman
   - information flow / information transfer
   - time-varying LK / transient LK / dynamic LK
   - Kalman covariance / ensemble covariance / signal covariance
9. Continue until at least three substantially different searches produce no new directly relevant source.

SEARCH QUERIES TO EXPAND

- "Liang Kleeman" "Kalman filter"
- "Liang information flow" "ensemble Kalman"
- "LK information flow" covariance assimilation
- "time-varying causality" "Kalman covariance"
- "transient information transfer" ensemble covariance
- "Liang causality" forecast covariance
- "Liang causality" analysis covariance
- "information flow" covariance inflation EnKF
- "causal covariance" ensemble Kalman filter
- "causality preserving" data assimilation
- "covariance structure preservation" EnKF
- "flow-dependent causality" data assimilation
- "Q(t)" "R(t)" Liang Kleeman
- "Bierman Thornton" Liang causality
- "square root Kalman" information flow causality
- "EWMA" "Liang Kleeman"
- "signal covariance" "Kalman error covariance" causality
- "causality-driven localization" Kalman
- "information-theoretic localization" data assimilation

EVIDENCE RULES

- Do not infer implementation details that are not written.
- For every important claim, provide the exact source, page, section and equation.
- Include a short quotation where legally permitted.
- Clearly label:
  - explicitly stated;
  - inferred from equations;
  - unclear;
  - not found.
- Do not call two methods equivalent unless a source or derivation establishes it.
- Do not assume square-root filtering preserves physical covariance; verify what it preserves.
- Do not assume covariance inflation preserves causality; verify the stated objective.
- Distinguish carefully:
  1. signal/state covariance C;
  2. forecast-error covariance Pf;
  3. analysis-error covariance Pa;
  4. ensemble sample covariance;
  5. climatological covariance;
  6. moving-window covariance.
- Distinguish expected Kalman posterior contraction from finite-ensemble covariance collapse.
- Reviews may guide searching, but final technical claims must use primary sources.

OUTPUT

A. Search log
List databases, repositories, author pages and exact queries searched.

B. Directly relevant papers
For each paper provide:

- citation and link;
- exact LK/filter connection;
- covariance definition;
- how Q and R are obtained;
- stationary or transient;
- filtering stage where LK is calculated;
- validation experiment;
- code availability;
- unresolved ambiguity.

C. Adjacent papers
Include useful covariance-filtering papers that do not actually use LK, clearly marked as adjacent.

D. Contradictions
Show where papers use incompatible meanings of covariance or make different assumptions.

E. Missing evidence
List implementation details that could not be recovered.

F. Final evidence map
Do not make the research decision for me. Instead provide:

- what is established;
- what is only claimed;
- what has experimental support;
- what remains unknown;
- which exact papers/sections I should inspect myself.