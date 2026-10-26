**A. Search log**

Live web search was available and used throughout. Searches were performed via general web search, direct DOI/title lookups, AMS journals, Frontiers, APS, arXiv, ResearchGate, Google Scholar-style forward/backward citation following (via result snippets and reference lists), author/institutional pages (e.g., NUIST Wang Guojie, VU Amsterdam Hagan/Dolman), OpenAlex/Crossref/Semantic Scholar mentions in results, GitHub/GitLab/Zenodo/Figshare/OSF/Internet Archive probes, and PyPI/MATLAB File Exchange.

Exact queries and expansions executed (representative; repeated with spelling variants Liang–Kleeman / Liang Kleeman / LK / L-K / Liang information flow / information transfer / TvLK / MtvLK / time-varying causality / transient information transfer, plus Kalman / square-root / Bierman–Thornton / UD / EnKF / EAKF / ensemble / Pf / Pa / forecast covariance / analysis covariance / error covariance / signal covariance / Q(t) / R(t) / EWMA / inflation / localization / shrinkage / assimilation / causal covariance):

- Seed titles + DOIs (Hagan 2019 10.1175/JCLI-D-18-0881.1; Wang 2025 10.3389/fmars.2025.1600634; Liang 2014 10.1103/PhysRevE.90.052150; Liang 2016 10.1103/PhysRevE.94.052201).
- “Liang Kleeman” OR “Liang-Kleeman” OR “Liang information flow” “Kalman”; same + “ensemble Kalman” / EnKF / “square root Kalman”; “LK information flow” covariance assimilation; “time-varying causality” “Kalman covariance”; “transient information transfer” ensemble; “Liang causality” forecast/analysis covariance; “information flow” covariance inflation EnKF; “causal covariance” / “causality preserving” / “covariance structure preservation” EnKF/data assimilation; “flow-dependent causality”; “Q(t)” “R(t)” Liang; “Bierman Thornton” Liang/Hagan; “EWMA” Liang/Hagan; “signal covariance” “Kalman error covariance” causality; “causality-driven localization”; “MtvLK” / multiLK / causality_est / SquareRootKalmanFilter2.m / EWMACovEst.m / bierman.m / thornton.m (and site:github.com variants).
- Author pages/ORCID/Google Scholar proxies; forward citations of seeds; backward from reference lists of Hagan 2019, Zhou et al. 2024, Wang 2025.
- Code/repos: GitHub MtvLK, LKIF, Hagan Kalman, etc.; Zenodo/Figshare/OSF; Internet Archive for deleted repos.
- Supplementary/data-availability statements in primary papers.

Stopping criterion met: ≥3 distinct query families (Kalman-combination, code/repo names, Pf/Pa/signal-vs-error distinctions) yielded no new directly relevant primary sources after the core set. Adjacent covariance/DA papers appeared but were filtered as non-LK.

Primary full-text access: Hagan et al. (2019) AMS PDF; Wang et al. (2025) Frontiers full; Zhou et al. (2024) AMS/ResearchGate excerpts + data statement; Liang 2014/2016 abstracts + arXiv/PRE where available; supporting reviews and code pages.

**B. Directly relevant papers**

1. **Hagan, D. F. T., Wang, G., Liang, X. S., & Dolman, H. A. J. (2019).** A time-varying causality formalism based on the Liang–Kleeman information flow for analyzing directed interactions in nonstationary climate systems. *Journal of Climate*, 32(21), 7521–7537. https://doi.org/10.1175/JCLI-D-18-0881.1 (AMS PDF available).

   - **Exact LK/filter connection**: Square-root Kalman filter (Bierman–Thornton UD algorithm) estimates time-varying covariances that are plugged into the linear LK formula (original Liang 2014 form using sample covariances Cij, Ci,dj) to produce TvLK. Explicitly: “we remedy this difficulty by using the square root Kalman filter to estimate the causality based on the LK formalism to derive a time-varying form.” Kalman is used as a recursive estimator of the covariances appearing in the LK expression; not an assimilation filter of a dynamical model state.
   - **Covariance definition**: The P (or equivalent) tracked by the filter is the covariance of the (vectorized) parameters / statistics needed for LK (essentially the signal covariances C of the observed time series and their Euler differences). It is the state-error covariance of the Kalman recursion whose “state” is these statistics. Not forecast-error Pf or analysis-error Pa of a physical model.
   - **How Q and R obtained**: Offline estimation (details in appendix; moving-window style). Paper notes process/measurement noise covariances are computed first, then fed to the filter iteration.
   - **Stationary or transient**: Explicitly transient/time-varying (and time-frequency via wavelet post-processing = TFvLK).
   - **Filtering stage where LK calculated**: At every time step of the Kalman recursion (after covariance update), the instantaneous C estimates are inserted into the LK formula. Not inside a data-assimilation cycle of a geophysical model.
   - **Validation**: Synthetic AR models with known time-varying causality; real soil-moisture–air-temperature coupling over China. Recovers nil-causality principle and directional structure comparable to stationary LK.
   - **Code availability**: Not found in paper or searches (no GitHub/Zenodo linked; no “SquareRootKalmanFilter2.m” etc. recovered). Supplementary not located with code.
   - **Unresolved ambiguity**: Precise mapping of filter state vector to the exact C matrix elements; whether any distinction is drawn between the Kalman P and the “signal covariance C required by the original LK formula” (appears substituted directly); numerical effect of low observation noise on the ratio used by LK.

2. **Zhou, F., Hagan, D. F. T., Wang, G., Liang, X. S., et al. (2024).** Estimating time-dependent structures in a multivariate causality for land–atmosphere interactions. *Journal of Climate*, 37(6). https://doi.org/10.1175/JCLI-D-23-0207.1 (PDF/ResearchGate excerpts; data statement).

   - **Exact LK/filter connection**: Direct multivariate extension of Hagan et al. (2019). Square-root Kalman (again Bierman–Thornton) estimates time-varying multivariate LK (MtvLK). “When there are only two variables … MtvLK will be the same as the framework proposed by Hagan et al. (2019).” Same substitution of filter-estimated covariances into the multivariate LK formula of Liang (2021).
   - **Covariance definition**: Same as Hagan—filter tracks covariances of the multivariate series (and differences) that enter the LK expression. Explicit use of modified Cholesky factors of the state variance–covariance matrix.
   - **How Q and R obtained**: Explicitly offline via exponential weighted moving average (EWMA) and unweighted moving average (UWMA) over a look-back window; then held for the Kalman iteration. Paper notes Q/R may vary but are estimated offline first. Forward + backward filter runs combined to avoid missing data at ends.
   - **Stationary or transient**: Transient (MtvLK).
   - **Filtering stage**: Every assimilation/update cycle of the Kalman filter on the statistics; LK evaluated from the resulting time-varying C.
   - **Validation**: Three synthetic models with designed time-varying causality (including confounding variables); real SM–VPD–GPP over two Chinese regions. Recovers nil causality and correctly identifies direction even under high correlation.
   - **Code availability**: Explicitly stated: https://github.com/FeihongZhou/MtvLK.git (all code to replicate). Public.
   - **Unresolved ambiguity**: Same substitution question as Hagan; sensitivity of EWMA/UWMA window to the resulting LK ratios; no discussion of whether the Kalman P is mathematically identical to the population/signal C of the original LK derivation.

3. **Wang, T., Wang, X., Cao, L., Li, W., & Han, G. (2025).** Causality-driven localization method for improving ensemble-based Kalman filters in strongly coupled data assimilation system. *Frontiers in Marine Science*, 12, 1600634. https://doi.org/10.3389/fmars.2025.1600634 (full text open).

   - **Exact LK/filter connection**: LK information flow is computed on time series (from the coupled model or ensembles) and used to construct an anisotropic, causality-strength-based localization function that replaces/modifies the conventional Gaspari–Cohn localization inside an Ensemble Adjustment Kalman Filter (EAKF) for strongly coupled data assimilation (SCDA). LK quantifies causal dependence strength to set localization radii/weights, suppressing spurious cross-component correlations. Not used to estimate time-varying C inside the filter; used as a diagnostic to drive localization of the ensemble covariance.
   - **Covariance definition**: The ensemble sample covariance (prior/forecast) is localized by an LK-derived factor. LK itself is computed from the (model or observed) time series via the standard sample-covariance formula of Liang (2014). Distinction between ensemble covariance and the C used by LK is present but not deeply analyzed; LK is applied to identify “genuine physical interactions from spurious covariations.”
   - **How Q and R obtained**: Standard EAKF twin-experiment setup (observation-error R prescribed; process noise implicit in the intermediate atmosphere–ocean–land model). Not estimated via LK or special methods for the causality step.
   - **Stationary or transient**: LK itself computed in a (presumably stationary or windowed) manner on the series; the resulting localization is applied throughout the assimilation cycles. Paper emphasizes directional asymmetry and spatial/variable heterogeneity.
   - **Filtering stage**: LK is pre-computed or computed offline relative to the DA cycle and then used to localize the ensemble covariances during every analysis step of the EAKF. Not calculated from Pf or Pa inside the cycle for the purpose of time-varying LK.
   - **Validation**: Twin experiments with intermediate coupled model; outperforms G-C localization especially at small ensemble sizes (faster stabilization, higher accuracy). Captures variable/directional/spatial heterogeneity.
   - **Code availability**: Not found (no GitHub/Zenodo link in paper or searches).
   - **Unresolved ambiguity**: Exact time series used for LK (model free-run, ensemble mean, single members, analysis vs forecast?); whether LK is recomputed every cycle or fixed; mathematical justification that the localization preserves the causal structure of the true covariance; effect of ensemble size / inflation on the LK values themselves.

**Core Liang foundations (required context, not Kalman combinations):**

- Liang (2014) Phys. Rev. E 90, 052150: Derives the practical estimator T₂→₁ = (C₁₁ C₁₂ C₂,d₁ − C₁₂² C₁,d₁) / (C₁₁² C₂₂ − C₁₁ C₁₂²) (and symmetric) from sample covariances of the series and their Euler differences. Assumes the linear stochastic system underlying the maximum-likelihood estimator. Explicitly sample (signal) covariances C.
- Liang (2016) Phys. Rev. E 94, 052201: Rigorous ab-initio derivation of information flow for deterministic/stochastic maps and continuous systems; proves nil-causality theorem; linear case recovers the concise covariance formula. No Kalman.

No other papers were found that calculate transient LK directly from forecast covariance Pf(t), analysis covariance Pa(t), or filtered error covariances of a physical-model Kalman/EnKF cycle. The Hagan/Zhou line uses Kalman solely as a recursive covariance estimator for the statistics that enter the original LK formula. The Wang 2025 line uses LK as an external diagnostic for localization of ensemble covariances inside EAKF/SCDA.

**C. Adjacent papers (useful covariance-filtering / DA work that does not use LK)**

- Standard EnKF/EAKF literature on localization (Gaspari–Cohn), inflation, relaxation, hybrid covariances, square-root/UD filters (Bierman–Thornton classic papers), and strongly coupled DA (numerous twin-experiment studies). These appear in the reference lists of Wang 2025 and are cited for context, but none combine them with Liang–Kleeman information flow.
- Linear inverse modeling + LK papers (e.g., Lien/Tozuka 2025 PRE; arXiv 2409.06797) estimate LK via LIM but without Kalman filters or DA.
- General information-flow reviews (Liang 2013 Entropy) and multivariate normalizations (Liang 2021 Entropy) provide background but no Kalman.

Clearly marked adjacent: none of the above substitute Pf/Pa for C or modify filters to preserve causal structure via LK.

**D. Contradictions / incompatible meanings of covariance**

- Hagan 2019 / Zhou 2024: Treat the Kalman-tracked covariance as a direct, time-varying surrogate for the sample/signal covariance C required by the original LK estimator. No explicit derivation is given that the filter’s estimation-error covariance P equals (or is a consistent estimator of) the population signal covariance of the underlying dynamical system. The substitution is performed operationally.
- Wang 2025: Uses the classical sample-covariance form of LK on time series, then applies the resulting scalar/flow field to localize a completely different object—the ensemble sample covariance of the EAKF. Ensemble covariance is treated as an approximation to the forecast-error covariance that needs localization; LK is an external causal prior, not a substitute for C inside the LK formula itself.
- Original Liang 2014/2016: C is unambiguously the (sample or population) covariance of the state variables of the dynamical system (or their differences). No filtering or error-covariance interpretation.
- No paper equates Kalman estimation-error P with signal C, nor proves that the substitution preserves the information-flow interpretation. No paper examines whether low observation-noise R contracts the covariance ratio used by LK in a way that systematically biases T.

**E. Missing evidence**

- Full numerical details / pseudocode of the Bierman–Thornton implementation inside Hagan 2019 (appendix describes the UD update but exact state-vector definition and Q/R construction are only partially recoverable from secondary descriptions).
- Any experimental validation that substituting Kalman P (or ensemble sample covariance) for the original C leaves the numerical value and statistical properties of T unchanged, or that the resulting T still satisfies the nil-causality theorem under filtering.
- Public source code or archived repositories matching the seed names (MtvLK code exists for the 2024 paper; Hagan 2019 and Wang 2025 codes not recovered; no SquareRootKalmanFilter2.m, multiLK_code.m, causality_est.m, EWMACovEst.m, bierman.m/thornton.m linked to these papers on GitHub/Internet Archive).
- Any calculation of transient LK from Pf(t) or Pa(t) of a physical-model filter.
- Analysis of the effect of observation-noise level R on the covariance ratios inside LK when the series are themselves filtered.
- Explicit use of covariance inflation, shrinkage, relaxation, hybrid covariances, or smoothing specifically “to retain causal covariance structure” for LK.
- Mathematical derivation justifying the Kalman-for-C substitution from first principles of the information-flow theory.

**F. Final evidence map**

**Established (primary sources, explicit statements or equations):**
- Square-root (Bierman–Thornton UD) Kalman filter can be used as a recursive estimator of the time-varying covariances that enter the linear/multivariate LK formula, producing TvLK (Hagan 2019) and MtvLK (Zhou 2024). LK is evaluated after each covariance update.
- Q and R for that Kalman are obtained offline by moving-average methods (EWMA/UWMA in Zhou 2024; similar in Hagan).
- LK can be used as a causality-strength diagnostic to construct anisotropic localization weights that improve EAKF performance in SCDA twin experiments, especially at small ensemble sizes (Wang 2025).
- Original LK estimator is a function of sample (signal) covariances C of the series and Euler differences (Liang 2014 eq.; recovered in all three applied papers).
- Code for MtvLK is public (GitHub FeihongZhou/MtvLK).

**Only claimed (or operationally performed without further justification):**
- The Kalman-tracked covariance is a valid drop-in replacement for the signal covariance C of the original LK derivation (Hagan/Zhou).
- The resulting time-varying T retains all rigorous properties (nil causality, asymmetry, quantitative magnitude) of the stationary theory under non-stationarity and finite-sample filtering.
- LK-derived localization “preserves” or “physically constrains” the causal structure of the ensemble covariance (Wang 2025).

**Experimental support:**
- Synthetic AR models with known time-varying causality are recovered by TvLK/MtvLK (Hagan, Zhou).
- Real land–atmosphere series produce physically plausible time-varying maps (Hagan, Zhou).
- Twin SCDA experiments show skill improvement of LK-localization over Gaspari–Cohn, especially small ensembles (Wang 2025).
- No experiment directly tests substitution of Pf/Pa for C, or the effect of R-driven covariance contraction on T.

**Remains unknown / unresolved:**
- Whether any author has ever computed transient LK from forecast-error Pf(t), analysis-error Pa(t), or any other filtered error covariance of a geophysical Kalman/EnKF cycle.
- Mathematical justification (or counter-example) for treating Kalman estimation-error P (or ensemble sample covariance) as the signal covariance C required by LK.
- Systematic effect of observation noise R (or inflation/localization) on the covariance ratios that enter the LK formula.
- Whether square-root/UD updates, inflation, shrinkage, relaxation, hybrid covariances, or smoothing have been (or can be) modified specifically to retain the causal structure needed by LK.
- Reproducible public code for the original Hagan 2019 TvLK implementation or for the Wang 2025 localization.
- Behavior of the method when the underlying series are themselves the output of a data-assimilation cycle.

**Exact papers/sections to inspect yourself (highest priority):**
- Hagan et al. (2019): Sections 2b–c (Kalman + TvLK derivation), Appendix A (Bierman–Thornton), Eqs. (8)–(15), synthetic validation, and any Q/R construction text.
- Zhou et al. (2024): Section 2 (MtvLK framework, EWMA/UWMA for Q/R, Bierman–Thornton reference to Hagan), Fig. 1, Appendix B (forward/backward), data-availability statement + GitHub repo.
- Wang et al. (2025): Section 2.2 (LK localization method, Eq. 5), twin-experiment design, comparison with G-C, discussion of directional asymmetry.
- Liang (2014): Derivation of the covariance estimator and the linear-system assumptions.
- Liang (2016): Nil-causality theorem and the general information-flow expressions (to compare with any filtered substitution).

No further directly relevant primary sources combining LK information flow with Kalman/ensemble filters, Pf/Pa, or the listed covariance-preservation techniques were recovered after exhaustive search. All claims above are tied to the cited primary texts; inferences beyond explicit statements are labeled as such.