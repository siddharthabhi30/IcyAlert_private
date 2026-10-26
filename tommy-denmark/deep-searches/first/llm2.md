# Liang–Kleeman Information Flow with Kalman Filtering, Ensemble Data Assimilation, and Time-Varying Covariance

## Search log

I searched from the four seed papers outward rather than relying on general background knowledge. The search covered the exact titles and DOIs; AMS, APS, Frontiers, PubMed, institutional publication repositories, NCOADS, ORCID/name-based author searches, Semantic Scholar results where indexed, Crossref and Google Scholar outbound citation links exposed by publisher pages, and web queries targeting OpenAlex/Crossref/Semantic Scholar records. The publisher pages themselves expose forward-citation and Google Scholar/Crossref links—for example, AMS currently identifies Hagan et al. as a cited article, while Frontiers exposes Crossref/Google Scholar links for its references. citeturn22search0turn27view3

Repository searches covered GitHub, GitLab, Zenodo, Figshare, OSF, MathWorks File Exchange, institutional repositories, and Internet Archive/Wayback-oriented queries. I specifically searched `MtvLK`, `SquareRootKalmanFilter2.m`, `multiLK_code.m`, `causality_est.m`, `EWMACovEst.m`, `bierman.m`, and `thornton.m`. The most important recovery is that the MtvLK source is **not currently lost**: a public GitHub repository contains the named MATLAB components, including `EWMACovEst.m`, `KalmanGainCalc.m`, `SquareRootKalmanFilter2.m`, `bierman.m`, `causality_est.m`, `multiLK_code.m`, `multi_causality_est.m`, `thornton.m`, EWMA/UWMA routines, toy-model scripts, and real-data scripts. citeturn13view0 A separate MathWorks Kalman-filter package also surfaced similarly named Bierman/Thornton/EWMA routines, but I found no source establishing provenance between that package and the LK implementations, so I do **not** treat them as the same codebase.

The exact and expanded literature queries included:

`"Liang Kleeman" "Kalman filter"`; `"Liang information flow" "ensemble Kalman"`; `"LK information flow" covariance assimilation`; `"time-varying causality" "Kalman covariance"`; `"transient information transfer" "ensemble covariance"`; `"Liang causality" "forecast covariance"`; `"Liang causality" "analysis covariance"`; `"information flow" "covariance inflation" EnKF`; `"causal covariance" "ensemble Kalman filter"`; `"causality preserving" "data assimilation"`; `"covariance structure preservation" EnKF causality`; `"flow-dependent causality" "data assimilation"`; `"Q(t)" "R(t)" "Liang Kleeman"`; `"Bierman" "Thornton" Liang causality`; `"square root Kalman" Liang information flow`; `"EWMA" "Liang Kleeman"`; plus spelling variants of Liang–Kleeman/Liang Kleeman, information flow/information transfer, transient/time-varying/dynamic LK, and forecast/analysis/signal/error covariance.

Three materially different saturation searches produced no additional direct implementation beyond the Hagan/Zhou family and Wang's localization work: the **forecast/analysis covariance** queries returned no paper computing LK cycle-by-cycle from an EnKF \(P^f\) or \(P^a\); the **causality-preserving EnKF/covariance-structure** queries returned ordinary covariance-preserving or localization literature but no new LK algorithm; and the **Q/R–Bierman–Thornton–EWMA** queries led back to Hagan's TvLK and related square-root-filter literature, not another independent LK/Kalman construction. citeturn19search0turn21search0turn22search0

The forward/backward trail produced four especially important post-seed developments: Zhou et al.'s 2024 **multivariate time-varying LK (MtvLK)** extension; Wang et al.'s 2025 **LK-driven EAKF localization**; a 2025 **linear-inverse-model/LK** method for cyclostationary systems under white and persistent noise, which is not a Kalman method; and Siddique et al.'s 2026 **benchmark of bivariate versus conditioned/time-varying LK**, which uses the time-varying LK lineage but does not introduce a new filter covariance theory. citeturn20search6turn20search2turn20search3turn28search3

There are limitations to the citation search that matter. Direct automated Google Scholar result pages and some APS PDFs were access-restricted in this environment; publisher-provided Google Scholar/Crossref links, Semantic Scholar-indexed records, institutional pages, and normal web citation searching were therefore used as substitutes. The NCOADS publication page verifies Liang's 2014 paper and exposes its PDF link, but APS blocked direct PDF retrieval here. citeturn25search9turn24view1 I therefore do **not** invent page or equation numbers from the Liang PDFs that I could not independently inspect.

## Directly relevant papers

### Liang's foundational covariance is signal/time-series covariance, not Kalman error covariance

**X. San Liang, “Unraveling the cause-effect relation between time series,” Physical Review E 90, 052150 (2014), DOI 10.1103/PhysRevE.90.052150.** The paper's abstract explicitly describes the estimator as involving “sample covariances.” citeturn23search1 Hagan et al. reproduce the relevant bivariate estimator as their Eq. (8), defining \(C_{ij}\) as sample covariance of the observed time series and \(C_{i,dj}\) as covariance involving the finite-difference derivative series. citeturn7view0

For the bivariate linear estimator as reproduced and attributed to Liang,

\[
\widehat T_{2\to1}
=
\frac{C_{12}}{C_{11}}
\frac{-C_{12}C_{1,d1}+C_{11}C_{2,d1}}
{C_{11}C_{22}-C_{12}^2}.
\]

Here \(C\) is a covariance of the **variables/time-series samples** entering the inferred dynamics. It is not introduced as a state-estimation error covariance. That distinction is also consistent with Liang's abstract: the inverse problem is solved from two observed time series using ordinary sample statistics. citeturn23search1turn7view0

**Status:** explicitly stated for the sample-covariance character; the original 2014 APS PDF's exact equation/page number was not recoverable because APS returned HTTP 403 in this session, so the equation identification above is through Hagan's primary-paper reproduction, not an invented Liang equation number. citeturn24view1turn7view0

**Q/R:** not applicable; this is not a filtering paper.

**Stationarity/transience:** the estimator uses covariance accumulated over a time series; Hagan's later work identifies this covariance computation as the stationarity bottleneck it seeks to remove. citeturn19search0

**Code:** no seed-paper repository was recovered in this search.

**Core unresolved point for the Kalman question:** nothing in Liang 2014 establishes that \(C=\operatorname{Cov}(X)\) may generally be replaced by a Kalman posterior error covariance \(P=\operatorname{Cov}(X-\hat X)\).

### Liang's ab-initio theory also does not introduce a Kalman error covariance

**X. San Liang, “Information flow and causality as rigorous notions ab initio,” Physical Review E 94, 052201 (2016), DOI 10.1103/PhysRevE.94.052201.** This is the first-principles theoretical paper. It derives information flow for deterministic and stochastic mappings and continuous-time systems and includes a dedicated **“Linear Stochastic Systems”** section; APS states that for linear systems the concise formula analytically connects causation and correlation. citeturn23search0

The paper's role in the present question is important mostly by contrast: its covariance arises from the distribution/statistics of the dynamical variables, not from a filtering algorithm. The paper contains no Kalman filter, EnKF, forecast covariance, analysis covariance, inflation, localization, or data-assimilation construction in the material recovered. citeturn23search0

**Status:** explicitly foundational; **not found**: any theorem equating Liang's covariance with Kalman estimation-error covariance.

### Hagan et al. is the crucial direct LK–Kalman paper—and contains the central covariance ambiguity

**D. F. T. Hagan, G. Wang, X. S. Liang, and H. A. J. Dolman, “A Time-Varying Causality Formalism Based on the Liang–Kleeman Information Flow for Analyzing Directed Interactions in Nonstationary Climate Systems,” Journal of Climate 32, 7521–7537 (2019), DOI 10.1175/JCLI-D-18-0881.1.** citeturn19search4

This is the most direct answer to core question one. The paper says its goal is to make LK time-varying by using a **square-root Kalman filter to estimate the required covariances at each time step**. citeturn19search0

The key sequence is unusually clear when the equations are read together:

| Hagan location | What it says | Covariance object |
|---|---|---|
| Sec. 2a, journal p. 7524, Eq. (8) | Standard LK estimator from sample covariances \(C_{ij}\) and derivative covariances | **signal/time-series sample covariance \(C\)** citeturn7view0 |
| Sec. 2b, p. 7524, Eqs. (9)–(14) | Standard linear Kalman filter; \(K\) is chosen to minimize \(P=E[ee^T]\) | **estimation-error covariance \(P\)** citeturn7view0 |
| Sec. 2c, p. 7525, Eq. (15) | Replaces the \(C\)-terms of LK by elements of the recursively produced \(P\) | **updated Kalman covariance \(P\)** citeturn7view1 |

Hagan's Eq. (15) is, in substance,

\[
T_{2\to1,t}
=
\frac{P_{12}}{P_{11}}
\frac{-P_{12}P_{1,d1}+P_{11}P_{2,d1}}
{P_{11}P_{22}-P_{12}^{2}},
\]

with the converse flow defined analogously. The paper says \(P\) is the covariance matrix resulting at each step of the square-root recursion, and the causality is computed at the **updated covariance**. citeturn7view1

That answers core question two in a qualified way: **yes, Hagan computes a transient LK-like quantity from a filtered, updated covariance.** In conventional Kalman terminology it is analysis/posterior-like rather than the forecast \(P_k^{-}\), because the paper computes LK after the measurement update. It does not use \(P^a\) notation, so calling it \(P^a\) is an interpretation of the algorithmic stage, not the authors' notation. citeturn7view0turn7view1

The crucial distinction in core questions three through five is not resolved by the paper. Hagan explicitly defines the Kalman \(P\) as the expected squared **state-estimation error**, then puts that \(P\) where Liang's Eq. (8) used sample covariance \(C\). citeturn7view0turn7view1 I found **no derivation in the paper proving \(P=C\), no theorem showing that LK remains the same functional when evaluated on posterior error covariance, and no experiment isolating that substitution as the variable under test**. The synthetic experiments test whether the complete TvLK algorithm recovers a prescribed switching causal structure and frequency structure; they do not compare “true signal covariance LK” against “error-covariance LK” while controlling everything else. citeturn22search0

That is not merely terminological. From standard covariance algebra,

\[
C_X=\operatorname{Cov}(X),\qquad
P=\operatorname{Cov}(X-\hat X),
\]

are generally different objects. In a probabilistic estimator one can write, under the usual conditioning assumptions,

\[
\operatorname{Cov}(X)
=
E[\operatorname{Cov}(X\mid Y)]
+
\operatorname{Cov}(E[X\mid Y]),
\]

so posterior uncertainty is only one component of total state variability. Thus the equality required to literally identify \(P\) with Liang's \(C\) is **not generic**. This is a mathematical observation from the two definitions; it is **not a criticism the Hagan paper itself states**.

#### How Hagan obtains \(Q(t)\) and \(R(t)\)

Appendix B, journal p. 7534, is explicit. Rather than taking fixed identity matrices, the study estimates process and measurement noise covariances **offline at each time step** using exponentially weighted moving averages (EWMA) or unweighted moving averages (UWMA). A smoothed version of the time series is used as a surrogate for the unavailable true process state. The paper stresses that \(Q\) is particularly difficult to infer because the true process is unobserved. citeturn6view3turn22search0

This means “time varying” has two layers in TvLK:

\[
Q=Q_k,\qquad R=R_k,
\]

are pre-estimated time-dependent filter tunings, while

\[
P_k^- \rightarrow K_k \rightarrow P_k
\]

is then propagated recursively online through the record. LK is calculated from the **updated \(P_k\)** at each step. citeturn7view1turn6view3

EWMA/UWMA therefore do **not** mean that LK itself is a conventional rolling-window covariance estimator. The moving average is being used to build \(Q_k,R_k\); the causality covariance is the recursively filtered \(P_k\). citeturn6view3

#### Square-root/UD filtering

The Bierman and Thornton algorithms are used for numerically stable measurement and temporal updates. The motivation the paper gives is numerical stability and maintaining a positive-definite covariance representation; it does **not** claim that a UD or square-root factorization preserves the physical causal covariance of the observed signal. citeturn7view1turn22search0

That distinction is important:

\[
P=UDU^T
\]

preserves, up to numerical arithmetic, the **Kalman covariance represented by the filter**. It does not establish that that covariance equals the \(C\) required by the original LK derivation.

#### Smoothing

Hagan also tested a forward/backward optimal linear smoother to repair the initial portion lost because a lookback interval is needed for moving-average estimates. It reduced the missing initial section but was **not adopted** in the final method. citeturn22search0 Thus smoothing was explored for boundary/initialization behavior, not to establish causal covariance preservation.

#### Validation

The synthetic models are designed with known changes of causal direction and, in one experiment, known frequency content; the paper reports recovery of those patterns and then applies the method to soil-moisture/air-temperature coupling. citeturn22search0 This is meaningful **whole-algorithm experimental support** for transient tracking, but not a mathematical or controlled empirical validation of the \(P\mapsto C\) substitution itself.

**Code:** no Hagan-2019-specific public repository or supplement containing the full implementation was recovered in the searches. Some filenames used in the later MtvLK package embody the same Bierman/Thornton/EWMA machinery, but they belong to the later repository and should not automatically be attributed backward to the 2019 release. citeturn13view0

### Zhou et al. extends the same construction to multivariate LK

**F. Zhou et al., “Estimating Time-Dependent Structures in a Multivariate Causality for Land–Atmosphere Interactions,” Journal of Climate 37, 1853–1876 (2024), DOI 10.1175/JCLI-D-23-0207.1.** citeturn20search6

This is the major direct follow-up. It explicitly states that it uses a square-root Kalman filter to convert multivariate LK into a **multivariate time-varying LK (MtvLK)** suitable for short, highly correlated, nonstationary series. citeturn19search1turn20search6

In Sec. 2c, Eq. (16), the multivariate time-varying flow is written using the covariance produced at each filter step:

\[
T_{t,\,2\to1\mid3,\ldots,d}
=
\frac{1}{\det P}
\sum_{j=1}^{d}
\dot\Delta_{2j}P_{j,d1}
\frac{P_{12}}{P_{11}},
\]

where \(\dot\Delta_{2j}\) are cofactors of \(P=(P_{ij})\), and \(P_{j,d1}\) denotes covariance involving \(X_j\) and the derivative series of \(X_1\). The paper describes \(P\) as the covariance resulting at each step, and causality is calculated from the updated covariance after the Kalman gain/update sequence. citeturn19search1

So the covariance story is structurally the same as Hagan's: the original multivariate LK calculation is written in terms of covariances of the dynamical variables, while the time-varying implementation inserts the recursively produced filter \(P\). I found **no separate derivation in Zhou establishing an equality between Kalman estimation-error covariance and the underlying signal covariance**. The paper validates the resulting MtvLK algorithm on synthetic systems and real land–atmosphere data; again, that validates aggregate causal-recovery behavior rather than the identity \(P=C\). citeturn20search6

The available HTML verifies Eq. (16) and its section but does not expose stable journal-page anchors for the equation; I therefore do not guess a page number beyond the article's overall 1853–1876 pagination. citeturn20search6

#### Code is unusually good here

The public MtvLK repository is the strongest reproducibility artifact recovered in the entire search. It identifies `multiLK_code.m` as a main entry point and contains the square-root-filter and supporting covariance routines:

`SquareRootKalmanFilter2.m`, `KalmanGainCalc.m`, `bierman.m`, `thornton.m`, `EWMACovEst.m`, `EWMA.m`, `UWMA.m`, `StandardCovEst.m`, `causality_est.m`, `multi_causality_est.m`, and toy/real-data scripts. citeturn13view0

This is the best place to inspect the operational meaning of \(P\), \(Q\), \(R\), initialization, and derivative covariances beyond what the prose explains. The live repository also means the requested filenames `MtvLK`, `SquareRootKalmanFilter2.m`, `multiLK_code.m`, `causality_est.m`, `EWMACovEst.m`, `bierman.m`, and `thornton.m` were recovered without needing an archived deletion. citeturn13view0

### Wang et al. combines LK and an ensemble Kalman filter in a fundamentally different way

**T. Wang, X. Wang, L. Cao, W. Li, and G. Han, “Causality-driven localization method for improving ensemble-based Kalman filters in strongly coupled data assimilation system,” Frontiers in Marine Science 12:1600634 (2025), DOI 10.3389/fmars.2025.1600634.** Published September 4, 2025. citeturn20search9turn28search10

This paper is directly relevant to data assimilation, but it is essential **not** to describe it as an ensemble version of Hagan TvLK.

The filter is an **Ensemble Adjustment Kalman Filter (EAKF)**. Its analysis update uses ensemble-derived prior/error cross-covariances in the ordinary EnKF sense. Separately, LK information flow is calculated from a long time series and converted into a causal localization mask/range. citeturn20search2

The authors make this separation explicit:

> “the LK information flow used in this study is calculated from sufficiently long time series prior to DA”

and they assume those causal relationships stay fixed throughout assimilation. citeturn27view8

For the experiments they use **9,600 model-output times** for the LK calculation, and the resulting localization map is generated **before the first DA cycle**. citeturn27view2turn27view8

Thus:

\[
\boxed{\text{LK covariance }C \neq \text{EAKF forecast-error/sample covariance}}
\]

in this paper's implementation. LK sees a pre-assimilation temporal sample covariance. EAKF sees ensemble error covariance. The two interact only through the localization operator constructed from LK causal significance/range. citeturn27view8turn20search2

This is the cleanest paper in the set regarding covariance semantics because it does **not** substitute the ensemble \(P^f\) into LK.

#### Does Wang dynamically compute LK from forecast or analysis ensembles?

No. The paper explicitly says the causal map is fixed, and its discussion identifies dynamic integration as future work:

> “future work should also explore the integration of flow-dependent ensemble covariances within the LK framework”

so that information flow could change throughout the assimilation window. citeturn27view9

That statement is particularly strong evidence for core question two: **as of Wang et al. 2025, their own LK–EnKF method had not yet implemented cycle-by-cycle LK from flow-dependent forecast ensembles.**

#### What does Wang's covariance mean?

There are two different covariance notions:

| Context | Meaning |
|---|---|
| LK Eq. (5) | covariance \(C\) between variables in the long time series used for causal inference |
| EAKF update | prior ensemble/error covariance and state–observation covariance used to transfer observational increments |

The paper's methodology explicitly defines LK in terms of time-series covariance and SCDA in terms of cross-component covariances. citeturn20search2turn27view8

#### Q and R

There is no Hagan-like \(Q(t),R(t)\) estimation for LK, because LK itself is not Kalman-filtered. In the twin experiment, synthetic observations are formed by adding Gaussian observational noise at prescribed amplitudes, and that observation-error specification is used by the EAKF. citeturn3view0 The paper does not infer a time-dependent \(R_k\) from LK. Nor does it introduce an LK-specific \(Q_k\).

#### Inflation and localization

The DA experiment uses **adaptive inflation following Anderson (2007)**. citeturn27view10 But there is no claim that inflation is designed to preserve LK causality. The causal intervention is instead the localization scheme: LK identifies observations judged causally relevant and provides spatially heterogeneous, directional localization support; the remaining distance weighting uses the Gaspari–Cohn function. citeturn20search2

Therefore the best answer to “Has anyone modified an ensemble filter specifically to retain causal covariance structure?” is nuanced:

**Explicitly established:** Wang modifies **localization** so that assimilation respects a precomputed causal structure and suppresses correlations judged noncausal/spurious. The paper reports that this helps preserve “fundamental coupling mechanisms” in the resulting assimilation. citeturn20search2

**Not established:** it does not impose a mathematical constraint that the ensemble covariance matrix itself retain a prescribed LK causal covariance matrix after analysis. It is a causal **selection/localization** mechanism, not a covariance-invariance theorem.

The twin experiments report lower errors than optimized conventional Gaspari–Cohn localization, including approximately 5% for atmospheric streamfunction, 22% for SST, and about 51% for ocean streamfunction in the comparisons described by the authors; small ensembles are a particular target. citeturn20search2 These tests support the localization strategy, not substitution of ensemble \(P\) for LK \(C\).

**Code:** the Data Availability Statement says the study's contributions are included in the article/Supplementary Material and directs further inquiries to the corresponding author; no public GitHub/Zenodo code repository was identified in the searches. citeturn27view11

### Siddique et al. is a recent independent check of time-varying LK behavior, but not a new covariance filter

**F. Siddique, D. F. T. Hagan, G. Wang, D. Docquier, and S. Vannitsem, “Benchmarking Conditioners in Liang–Kleeman Information Flow: Application to Land–Atmosphere Interactions,” EGUsphere preprint, 2026, DOI 10.5194/egusphere-2026-267.** citeturn28search3

The paper studies bivariate versus conditioned/multivariate LK and explicitly analyzes time-varying differences under synthetic hidden-confounding and land–atmosphere experiments. It is useful as a post-MtvLK validation/diagnostic paper because it shows that time-dependent conclusions can depend materially on which conditioning variables are included. citeturn28search3

It does **not**, from the material recovered, introduce a new forecast/analysis covariance substitution, EnKF version, shrinkage scheme, or causality-preserving square-root filter. Accordingly, it should not be treated as independent mathematical justification for \(P=C\).

## Adjacent literature and what it does not establish

Several adjacent lines are highly relevant because they provide techniques that one might combine with LK, but I found no primary evidence that these techniques have already been justified as preserving LK information flow.

### Cyclostationary and rolling alternatives to the Kalman construction

The 2025 paper **“Linear-inverse-modeling approach to estimating Liang-Kleeman information flow in a cyclostationary process under memoryless and persistent noise”** develops a LIM–LK route for periodically nonstationary systems and explicitly studies both memoryless and persistent stochastic forcing. This is directly relevant to transient covariance/noise questions, but it uses **linear inverse modeling**, not a Kalman analysis/forecast covariance. citeturn20search3

There is also now rolling-window LK work in other domains. For example, a 2026 financial study applies LK repeatedly over rolling windows to obtain time-varying causal relationships rather than recursively filtering covariance. citeturn20search7turn20search8 This provides an important conceptual comparator:

\[
\text{rolling LK}: C_k = \operatorname{Cov}\{X_{k-L+1:k}\}
\]

versus

\[
\text{TvLK}: P_k = \text{Kalman-updated error covariance}.
\]

These are not equivalent estimators, and I found no paper deriving their equivalence.

### Data-assimilation covariance methods that Wang itself identifies as related

Wang's primary paper points to a substantial coupled-DA covariance literature, including Han et al. (2013) on **error-covariance estimation for coupled DA**, Lu et al. (2015) on **leading averaged coupled covariance**, Chang and Kalnay (2022) on **prior correlations for ensemble-based localization**, Yoshida and Kalnay (2018) on a **correlation-cutoff localization** method, and Anderson/Lei work on empirical localization. citeturn27view3turn27view8

These are important candidates for a future LK/EnKF design because they address exactly the problem of noisy or unstable cross-component covariance. But the evidence recovered does **not** show that any of them evaluates its covariance adjustment against an LK information-flow invariant or causal-covariance target. Wang cites them as DA/localization predecessors, then introduces LK as a separate causal criterion. citeturn27view8

Likewise, the original EnKF literature estimates forecast-error statistics from a Monte Carlo ensemble; Wang's bibliography explicitly places Evensen's EnKF work and Houtekamer–Mitchell alongside its localization discussion. citeturn27view8 That covariance is an uncertainty/error statistic for DA, not automatically the state/time-series covariance in Liang's estimator.

### Square-root and adaptive noise estimation are adjacent, not causal guarantees

Adaptive square-root Kalman literature can estimate \(Q\) or \(R\) while maintaining their positive semidefiniteness. For example, Zhou et al.'s 2015 adaptive square-root unscented Kalman filter explicitly estimates square roots of process or measurement noise covariance to improve filtering under changing noise. citeturn22search4

That provides a plausible alternative to Hagan's offline EWMA/UWMA \(Q_k,R_k\) procedure, but there is no evidence in the source that it was designed for LK, or that it preserves an information-flow causal structure.

### Inflation, shrinkage, covariance relaxation, hybrid covariance

The direct LK literature recovered contains:

- **adaptive inflation:** yes, in Wang's EAKF experiment, but as ordinary EnKF stabilization, not an LK-preservation mechanism. citeturn27view10
- **LK-driven localization:** yes, Wang 2025. citeturn20search2
- **square-root/UD filtering:** yes, Hagan 2019 and Zhou 2024. citeturn7view1turn19search1
- **EWMA/UWMA covariance estimation:** yes, for Hagan's \(Q_k,R_k\), not as a shrinkage estimator for LK \(C\). citeturn6view3
- **forward/backward smoothing:** tested by Hagan, not retained. citeturn22search0
- **covariance relaxation such as RTPP/RTPS specifically for LK:** **not found**.
- **Ledoit–Wolf-type or other shrinkage specifically for LK-filter covariance:** **not found**.
- **hybrid static/ensemble covariance specifically for LK:** **not found**.
- **localization selected to preserve a causal graph:** Wang is the closest direct example, but it preserves/gates causal *relationships*, not a proven covariance invariant. citeturn20search2

Those negatives survived the separate covariance-structure, EnKF, and LK search families rather than being inferred from an absence in one paper.

## Contradictions and technical interpretation

### The central \(C\) versus \(P\) mismatch

The most consequential finding of this literature search is an internal change of statistical object between Liang and Hagan.

Liang's practical estimator is based on **sample covariance of the dynamical variables**. citeturn23search1turn7view0 Hagan then introduces a Kalman filter whose \(P\) is explicitly the covariance of the **state-estimation error**, \(E[ee^T]\). citeturn7view0 One page later, Eq. (15) substitutes elements of that \(P\) into the places occupied by \(C\) in Eq. (8). citeturn7view1

The paper at times also informally calls \(P\) the “covariance of the state,” while its mathematical definition is the estimation-error covariance. citeturn19search0turn7view0 Those two descriptions should not be silently conflated.

A clean notation would distinguish:

\[
C^x_k=\operatorname{Cov}(x_k)
\]

from

\[
P^f_k
=
E[(x_k-\hat x^f_k)(x_k-\hat x^f_k)^T]
\]

and

\[
P^a_k
=
E[(x_k-\hat x^a_k)(x_k-\hat x^a_k)^T].
\]

For an EnKF there is yet another object,

\[
\widehat P^f_k
=
\frac{1}{N-1}X^{\prime f}_k X^{\prime f\,T}_k,
\]

which is a finite-ensemble estimate of forecast-error covariance; depending on how the ensemble was generated, the same member spread may also be discussed informally as “state covariance,” but its DA target is the forecast uncertainty distribution. Wang keeps this ensemble covariance separate from its time-series LK covariance. citeturn27view8

No direct source found in this search proves

\[
C^x_k=P^a_k,\qquad
C^x_k=P^f_k,
\]

or

\[
C^x_k=\widehat P^{\,\text{ensemble}}_k
\]

for the purposes of the Liang estimator.

### Hagan's synthetic success does not identify why it works

The Hagan experiments show that the whole recursive procedure can follow predefined time-varying causal changes. citeturn22search0 That is stronger than a mere untested assertion.

But several things change simultaneously: \(C\) becomes \(P\), \(P\) is generated through a Kalman recursion, \(Q_k,R_k\) are fitted from smoothed surrogates, initial values and moving-average windows matter, and Bierman/Thornton numerical updates are used. citeturn6view3turn7view1 Because there is no ablation comparing these pieces against known instantaneous population signal covariance, the experiment does not tell us whether successful causal recovery occurs **because \(P\) estimates \(C\)**, because their structures are approximately proportional in those tests, because the relevant ratios happen to be robust, or for another reason.

That distinction should therefore be labeled:

**Experimentally supported:** causal-pattern recovery by TvLK as a complete algorithm.

**Not established:** \(P\) is a statistically consistent estimator of Liang's signal covariance \(C\).

### Low \(R\) has a subtle effect; “posterior contraction destroys LK ratios” is not universally true

None of the directly relevant papers performs a systematic low-\(R\) experiment aimed at the LK covariance ratio. Hagan does, however, give enough equations to analyze the issue from its own Kalman update. Its gain and covariance update are Eqs. (12)–(14), followed by the LK ratio \(P_{12}/P_{11}\) in Eq. (15). citeturn7view0turn7view1

Consider a two-state prior

\[
P^-=
\begin{bmatrix}
p_{11}&p_{12}\\
p_{12}&p_{22}
\end{bmatrix}.
\]

If the observation directly measures **state 1 only**,

\[
H=[1,0],\qquad R=r,
\]

the posterior entries obtained from Hagan's Kalman equations are

\[
P^a_{11}=\frac{p_{11}r}{p_{11}+r},
\qquad
P^a_{12}=\frac{p_{12}r}{p_{11}+r}.
\]

Therefore

\[
\boxed{
\frac{P^a_{12}}{P^a_{11}}
=
\frac{p_{12}}{p_{11}}
}
\]

exactly. So, in this special observation geometry, driving observation noise toward zero contracts both numerator and denominator by the same factor and **does not distort this particular LK prefactor**.

But if only state 2 is observed,

\[
H=[0,1],
\]

then

\[
P^a_{12}=\frac{p_{12}r}{p_{22}+r},
\]

while

\[
P^a_{11}
=
p_{11}-\frac{p_{12}^2}{p_{22}+r},
\]

so the ratio generally **does change**, and as \(r\to0\), \(P^a_{12}\to0\) while \(P^a_{11}\) approaches the conditional variance \(p_{11}-p_{12}^2/p_{22}\) when this is positive.

With sufficiently accurate direct observations of **all** states, posterior error covariance can approach a nearly diagonal small-noise matrix, so cross-error covariances can be strongly suppressed even though the physical state process remains causally coupled. That is precisely why identifying posterior-error \(P\) with physical signal covariance \(C\) needs justification.

Moreover, Eq. (15) depends on much more than \(P_{12}/P_{11}\): its determinant-like denominator and the covariances with \(\dot X_1\) also matter. citeturn7view1 Consequently, invariance of one ratio under one measurement configuration does not establish invariance of TvLK as a whole.

**Evidence label:** this algebra is **inferred directly from Hagan's published Kalman equations**, not an experiment or claim made by Hagan.

### Posterior contraction and finite-ensemble collapse are different phenomena

It is important not to call every reduction in covariance “collapse.”

In an exact Kalman analysis, \(P^a\) is expected to contract relative to \(P^f\) in directions informed by observations; that is a Bayesian/least-squares consequence of gaining information. Hagan's Eqs. (12)–(14) implement that expected contraction. citeturn7view0

In a finite EnKF, by contrast, undersampling can produce rank deficiency, sampling noise, spuriously small spread, and spurious long-range cross-correlations. Wang's motivation explicitly concerns the limited-ensemble/spurious-correlation problem and uses localization plus adaptive inflation to control it. citeturn20search2turn27view10

Therefore, even a future ensemble-LK method would need to separate:

\[
\text{legitimate posterior uncertainty reduction}
\]

from

\[
\text{finite-ensemble underdispersion/collapse}.
\]

No direct LK paper recovered here provides that separation theoretically.

### Wang resolves one ambiguity by keeping the covariance spaces separate, but introduces a stationarity assumption

Wang does **not** make Hagan's \(P=C\) substitution. Instead it uses long-time-series \(C\) to establish a causal map and ordinary ensemble forecast/error covariance to perform assimilation. citeturn27view8

The cost of this clean separation is that the causal map is fixed. The authors themselves identify this as a limitation and explicitly propose dynamically combining LK with flow-dependent ensemble covariances in future work. citeturn27view9

The two direct branches can therefore be summarized as:

\[
\textbf{Hagan/Zhou branch: }
\text{dynamic LK, but } C\rightarrow P \text{ is theoretically unresolved},
\]

versus

\[
\textbf{Wang branch: }
C \text{ remains a time-series covariance, but LK is static during DA}.
\]

I found no paper that simultaneously solves both problems by deriving and validating a **dynamic LK computed from a rigorously defined forecast/analysis ensemble signal distribution each assimilation cycle**.

## Missing evidence and implementation details not recovered

The following are genuine gaps after the searches, rather than assumptions about what “should” be true.

| Question | Evidence status |
|---|---|
| A proof that Hagan's Kalman \(P\) equals Liang's signal covariance \(C\) | **Not found.** Hagan explicitly defines \(P\) as estimation-error covariance and then substitutes it into the LK expression. citeturn7view0turn7view1 |
| A controlled experiment comparing TvLK from \(P^a\) with LK from known instantaneous population \(C(t)\) | **Not found.** Synthetic experiments validate the end-to-end causal pattern, not this identity. citeturn22search0 |
| LK calculated from \(P^f_k\) before assimilation every cycle | **Not found.** |
| LK calculated from an EnKF forecast ensemble at one time | **Not found.** Wang instead uses 9,600-point temporal records before DA. citeturn27view2turn27view8 |
| LK calculated from the EnKF analysis ensemble every cycle | **Not found.** |
| Dynamic LK localization recomputed every DA cycle | **Not found in Wang; explicitly proposed for future work.** citeturn27view9 |
| Distinction between “ensemble state covariance” and “ensemble estimation-error covariance” in a new LK derivation | **Not found.** |
| Systematic \(R\to0\) sensitivity experiment for TvLK | **Not found.** The dependence can be analyzed algebraically from Hagan's equations, but it was not isolated experimentally. citeturn7view0turn7view1 |
| Systematic \(Q\)-misspecification sensitivity for TvLK | **Not found.** Hagan reports careful \(Q,R\) tuning and notes their difficulty, but no identifiability study establishing the effect on causal bias was recovered. citeturn6view3 |
| Adaptive online \(Q_k,R_k\) estimation inside LK recursion | **Not in Hagan's implemented framework:** its \(Q,R\) are estimated offline even though time dependent. citeturn6view3 |
| Covariance shrinkage specifically designed to preserve LK | **Not found.** |
| RTPP/RTPS or other covariance relaxation specifically designed to preserve LK | **Not found.** |
| Hybrid climatological–ensemble covariance with LK | **Not found.** |
| A causal-covariance-preserving square-root transform | **Not found.** Hagan/Zhou use square roots for numerical covariance stability, not a demonstrated LK invariant. citeturn7view1turn19search1 |
| Smoother-based final TvLK algorithm | **Not found:** Hagan tested forward/backward smoothing but did not adopt it. citeturn22search0 |
| Hagan 2019 official code archive | **Not found.** |
| Zhou 2024/MtvLK code | **Found publicly**, including the requested MATLAB filenames. citeturn13view0 |
| Wang 2025 public source repository | **Not found.** Article/Supplementary Material is the stated availability route. citeturn27view11 |
| Archived deleted MtvLK repository needed | **No:** the live public repository was recovered. Internet-Archive-specific searches did not yield a superior/deleted copy. citeturn13view0 |
| Exact original Liang-2014 PDF equation/page in this session | **Not recovered because APS PDF access returned 403.** The sample-covariance formula is independently visible through Hagan's reproduction and Liang's primary abstract. citeturn24view1turn23search1turn7view0 |

One implementation issue deserves special inspection in the MtvLK source: what exactly `SquareRootKalmanFilter2.m` regards as its state, how `P_{j,d1}` is generated, whether \(Q_k,R_k\) are full or diagonal matrices in each demonstration, how initial \(P_0\) is chosen, and whether any renormalization of \(P\) occurs before `causality_est.m`. The repository clearly contains the relevant routines, but those details should be read directly in source rather than inferred from filenames. citeturn13view0

## Final evidence map

### What is established

**LK can be combined with a Kalman filter to generate a pointwise-in-time causal statistic.** Hagan 2019 does this in the bivariate case using a Bierman/Thornton square-root/UD implementation, time-dependent offline \(Q_k,R_k\), and the updated filter covariance at every time step. citeturn7view1turn6view3 Zhou et al. 2024 extends essentially that architecture to multivariate conditioned LK and provides public MATLAB code. citeturn19search1turn13view0

**LK has also been integrated with an ensemble Kalman data-assimilation system.** Wang 2025 uses LK to design causal localization for an EAKF in strongly coupled atmosphere–ocean–land DA and reports improved twin-experiment performance, particularly in small ensembles. citeturn20search2

But those two statements describe **two different integrations**:

\[
\text{Hagan/Zhou: LK itself is fed a Kalman covariance},
\]

\[
\text{Wang: LK is computed separately, then used to modify EnKF localization}.
\]

**Wang's implementation is not transient LK from \(P^f\) or \(P^a\).** It uses a 9,600-sample pre-DA time series, produces the causal localization before cycle one, and keeps it fixed. citeturn27view2turn27view8

**No directly relevant paper found in this search computes LK from a forecast ensemble or analysis ensemble at one instant during every assimilation cycle.** Wang explicitly names integration with flow-dependent ensemble covariances as future work. citeturn27view9

**Square-root/UD filtering has been used, but its demonstrated purpose is filter covariance stability/positive-definite computation, not preservation of a physical LK covariance structure.** citeturn7view1turn22search0

**Adaptive inflation has been used alongside LK–EnKF assimilation, but not as an LK-causality-preservation method.** citeturn27view10

**Smoothing has been experimentally considered in TvLK but rejected from the final Hagan procedure.** citeturn22search0

### What is only claimed or operationally assumed

The strongest unresolved assumption is

\[
\boxed{\text{Liang signal covariance }C
\quad\longrightarrow\quad
\text{Kalman estimation-error covariance }P.}
\]

Hagan explicitly defines these as different kinds of covariance on consecutive parts of the derivation, then uses \(P\) in the time-varying LK equation. citeturn7view0turn7view1 Zhou's MtvLK follows the same filtered-covariance architecture. citeturn19search1

I found no theorem establishing that this substitution leaves Liang information flow invariant, no consistency proof showing that the Kalman \(P_k\) converges to the desired instantaneous signal covariance, and no derivation specifying conditions under which \(P_k\propto C_k\) would at least preserve the relevant covariance ratios.

Likewise, statements that the filter “preserves immediate changes” are algorithmic motivations/results, not a proof that the physical causal covariance is preserved by the analysis update. citeturn19search0

### What has experimental support

Hagan's synthetic systems support **tracking known switches in causal direction and known time-frequency causal structure** with the complete TvLK algorithm. citeturn22search0

Zhou's work supports **multivariate time-varying causal recovery** on synthetic problems and shows applicability to short/highly correlated land–atmosphere series. citeturn20search6

Wang's twin experiments support **using a static LK causal map as EAKF localization information**, including significant RMSE reductions and improved robustness at small ensemble size relative to the chosen conventional localization setup. citeturn20search2

Siddique et al. 2026 provides additional evidence that **conditioning choices can materially alter time-varying LK conclusions**, especially under compound environmental states, but it does not validate Kalman \(P=C\). citeturn28search3

### What remains unknown

The literature retrieved leaves open the core construction that would connect all of your target topics:

\[
\boxed{
\text{instantaneous causal signal covariance}
\;\longleftrightarrow\;
\text{forecast ensemble}
\;\longleftrightarrow\;
P^f_k
\;\longrightarrow\;
\text{analysis ensemble}
\;\longleftrightarrow\;
P^a_k
}
\]

with an explicit statement of **which distribution LK is supposed to act on**.

In particular, the following remain unresolved by the papers found:

Whether the desired transient LK object should be based on the unconditional evolving state distribution \(C_x(t)\), the conditional forecast distribution \(\operatorname{Cov}(x_t\mid y_{1:t-1})\), the conditional posterior \(\operatorname{Cov}(x_t\mid y_{1:t})\), the across-member ensemble covariance at fixed \(t\), or a temporal moving-window covariance around \(t\).

Whether assimilation-induced covariance contraction represents a physically meaningful change of “information flow” or merely a change in **epistemic uncertainty about the state**.

Whether an analysis ensemble can be transformed to assimilate observations while preserving specified LK-relevant covariance ratios or cofactors.

Whether inflation should preserve total variance, individual covariance ratios, normalized correlations, the full LK functional, or only an independently estimated causal graph.

Whether localization should be one-way/asymmetric, given LK's directional nature, even though ordinary covariance matrices themselves are symmetric.

Whether \(Q_k,R_k\) can be jointly learned without contaminating the causal statistic, and whether estimation error in those matrices produces identifiable bias in TvLK.

Whether low observational noise can create an artificial disappearance of causal cross-error covariance. The algebra above shows the answer depends strongly on which variables are observed; no direct experiment in the LK literature resolves this.

Whether shrinkage or regularization can be designed around the **LK functional itself**, rather than Frobenius error in \(P\) or DA RMSE.

Whether a square-root analysis transformation can be selected from the many transformations yielding the same posterior covariance so as to preserve ensemble-level causal geometry.

And, most directly, whether the dynamic “flow-dependent ensemble covariance within LK” proposed by Wang can be made mathematically compatible with Liang's original signal-covariance derivation. Wang explicitly identifies that direction but does not solve it. citeturn27view9

### Papers and sections worth inspecting personally

The highest-value inspection sequence, based solely on the evidence recovered, is:

| Priority | Source to inspect | Exact location | Why it matters |
|---|---|---|---|
| Highest | **Hagan et al. 2019** | Sec. 2a Eq. (8), p. 7524 | Definition of LK sample covariance \(C\). citeturn7view0 |
| Highest | **Hagan et al. 2019** | Sec. 2b Eqs. (9)–(14), p. 7524 | Explicit definition of \(P\) as estimation-error covariance and forecast/update equations. citeturn7view0 |
| Highest | **Hagan et al. 2019** | Sec. 2c Eq. (15), p. 7525 | The actual \(C\rightarrow P\) substitution. citeturn7view1 |
| Highest | **Hagan et al. 2019** | Appendix B, p. 7534 | Offline EWMA/UWMA \(Q_k,R_k\), surrogate true process, initialization/window issues, smoother test. citeturn6view3turn22search0 |
| Highest | **Wang et al. 2025** | Methodology around Eq. (5) and statement immediately after it | Separates LK temporal covariance from EnKF error covariance; causal map fixed before DA. citeturn27view8 |
| Highest | **Wang et al. 2025** | Discussion, lines corresponding to the flow-dependent proposal | Explicit statement that dynamic LK using ensemble covariance is future work. citeturn27view9 |
| Very high | **Zhou et al. 2024** | Sec. 2c, Eq. (16) | Multivariate version of the filtered-\(P\) substitution. citeturn19search1 |
| Very high | **MtvLK repository** | `SquareRootKalmanFilter2.m`, `causality_est.m`, `multi_causality_est.m`, `EWMACovEst.m` | Best route to determine exactly what numerical covariance is passed to LK and how noise covariances/derivative terms are built. citeturn13view0 |
| High | **Liang 2014** | estimator derivation in the original PRE article | Establish directly, from the foundational derivation, the probability distribution with respect to which \(C\) is defined. The APS PDF itself should be inspected outside this session because it was access-blocked here. citeturn23search1turn24view1 |
| High | **Liang 2016** | “Linear Stochastic Systems” section | Establish the theoretical covariance meaning before any filtering is introduced. citeturn23search0 |
| High | **Siddique et al. 2026** | synthetic conditioning/time-varying experiments | Recent independent evidence on sensitivity of transient LK to conditioned variables. citeturn28search3 |
| Adjacent | **LIM–LK 2025** | cyclostationary/noise derivation | Alternative way to make LK time dependent without identifying Kalman posterior error covariance with signal covariance. citeturn20search3 |
| Adjacent | **Han 2013; Lu 2015; Chang & Kalnay 2022; Yoshida & Kalnay 2018** | cited DA covariance/localization methods | Candidate mechanisms for stabilizing flow-dependent covariance, but no LK-preservation result was found. Their bibliographic records are collected in Wang's primary-paper references. citeturn27view8 |

The evidence therefore supports three distinct, non-equivalent constructions that should remain separate during further analysis:

\[
\boxed{\text{Liang 2014/2016: } LK(C_{\text{signal/time series}})}
\]

\[
\boxed{\text{Hagan 2019 / Zhou 2024: } LK(P_{\text{updated Kalman error covariance}})}
\]

\[
\boxed{\text{Wang 2025: } LK(C_{\text{long pre-DA time series}})
\;\rightarrow\;
\text{localization of an EAKF using } \widehat P^f}
\]

The literature recovered does **not** yet establish a fourth construction,

\[
\boxed{
LK\!\left(\widehat P^f_k\right)
\ \text{or}\
LK\!\left(\widehat P^a_k\right)
\quad\text{recomputed from an ensemble every DA cycle},
}
\]

as a mathematically derived and experimentally validated extension of original Liang–Kleeman information flow. Wang et al.'s explicit future-work statement is currently the clearest primary-source evidence that this particular bridge remained open rather than already solved. citeturn27view9