# IcyAlert LK and Filtering: Evidence, Results, and Next Decisions

Historical experiment and evidence summary. For the later unknown-dynamics/nonlinear discussion, author code response, and current unresolved decisions, read [the 26 October follow-up](nonlinear-lk-calculation-and-followup.md). The earlier next-step list below is not a newly approved plan.

## 1. What we are trying to do

Our contribution is the filtering and covariance-estimation part of IcyAlert:

\[
\text{process-model forecast}
+
\text{observations}
\rightarrow
\text{filter}
\rightarrow
\text{time-dependent covariance}
\rightarrow
\text{Liang–Kleeman information flow}.
\]

The immediate technical problem is not choosing a neural architecture. It is deciding which covariance should be supplied to LK and demonstrating that we can estimate it correctly.

## 2. Current conclusion

Four covariance objects must not be treated as interchangeable:

1. **Historical signal covariance:** covariance of physical-variable values across a time series.
2. **Time-block and ensemble covariance:** covariance from several times pooled across several process-model members.
3. **Forecast covariance \(P_t^f\):** uncertainty across the forecast ensemble before assimilating the latest observation.
4. **Analysis covariance \(P_t^a\):** remaining state-estimation uncertainty after the observation update.

The literature supports three established routes:

- Original LK and rolling-window applications use signal covariance across time.
- Docquier’s dynamic Arctic analyses pool a short time block across climate-model ensemble members.
- Hagan and Zhou use an updated Kalman covariance to produce one LK estimate at each time.

No paper identified here validates ordinary LK recomputed every assimilation cycle directly from a physical EnKF forecast or posterior ensemble as a drop-in replacement for Liang’s time-series covariance. That remains the main open methodological question.

## 3. Why the covariance distinction matters

For physical variables,

\[
C_x(t)=\operatorname{Cov}(x_t)
\]

describes the distribution of the system state. In filtering,

\[
P_t^f=\operatorname{Cov}(x_t-\hat{x}_t^f),
\qquad
P_t^a=\operatorname{Cov}(x_t-\hat{x}_t^a)
\]

describe forecast and analysis estimation errors.

The original Liang estimator is based on covariances of observed variables and finite-difference tendencies. A Kalman covariance instead describes uncertainty about an estimate. Hagan uses the latter inside a time-varying LK construction, but the paper does not fully explain why it is interchangeable with Liang’s original signal covariance.

This is not merely notation. A very accurate observation can legitimately make \(P_t^a\) small, even while the physical relationship between the underlying variables remains strong.

## 4. What the main papers actually do

### 4.1 Liang’s original practical estimator

Liang’s estimator uses sample covariances of physical-variable time series and their finite-difference tendencies. It does not introduce a Kalman estimation-error covariance.

Local source: [Liang paper dump](../papers/information-flow-liang/paper-dump.md)

### 4.2 Vannitsem et al. 2019: our first controlled reference

Stéphane asked us to begin with the paper’s two-variable stochastic model. For its chosen unidirectional setup,

\[
T_{2\rightarrow1}
=a_{12}
\frac{\operatorname{Cov}(X_1,X_2)}{\operatorname{Var}(X_1)}.
\]

The stationary free-process reference is approximately \(0.1111\). This is a climatological or long-run reference, not a requirement that every transient filtered covariance must reproduce the same value.

Local source: [Vannitsem et al. 2019](../papers/vannitsem-2019/paper-dump.md)

### 4.3 Pires et al. 2024: stationary versus transient distributions

Pires distinguishes:

- a long time series sampling an approximately stationary distribution;
- an ensemble sampling a distribution that evolves with time.

The paper also contains nonlinear and synergistic information-transfer terms. Therefore, its Lorenz results cannot be reproduced by inserting an ordinary two-variable covariance into the linear LK formula.

Local source: [Pires et al. 2024](../papers/pires/paper-dump.md)

### 4.4 Hagan et al. 2019: pointwise time-varying LK

Hagan replaces static sample covariances with time-dependent entries denoted by \(P(t)\), calculated through a square-root Kalman recursion. The derivative sequences are constructed from observed time-series differences. The updated covariance is inserted into the time-varying LK formula, producing one causal-flow value at each time.

However, the paper does not explicitly provide enough information to reproduce the exact filter:

- complete state and measurement vectors;
- exact \(A\), \(B\), and \(H\) matrices;
- how derivative sequences enter the filter;
- how derivative cross-covariances such as \(P_{2,d1}(t)\) are produced;
- why the Kalman error covariance may replace the signal covariance in the original LK derivation.

An augmented state, fitted VAR model, or constant-velocity transition is therefore a possible reconstruction, not a documented fact about Hagan’s implementation.

The paper’s former MtvLK repository names MATLAB files that likely contained these details, but the source is not currently verified as publicly retrievable. Cached filenames are not sufficient evidence of the implementation.

Sources: [local Hagan paper](../papers/hagan/paper_dump.md), [published Hagan paper](https://doi.org/10.1175/JCLI-D-18-0881.1)

### 4.5 Zhou et al. 2024: multivariate TvLK

Zhou extends the bivariate Hagan method to condition on additional variables. This addresses the problem in which a third variable drives both members of a pair and creates a misleading bivariate link.

Zhou confirms that \(P_{j,d1}\) involves the derived \(\dot X_1\) series, but still does not close the missing state-space specification in Hagan’s implementation.

Source: [Zhou et al. 2024](https://doi.org/10.1175/JCLI-D-23-0207.1)

### 4.6 Docquier et al. 2022: Arctic sea ice, time, and ensembles

This study uses 50 EC-Earth3 members and has two analyses.

**Member analysis:**

- remove the ensemble-mean forced signal from every member;
- calculate LK across the long time series separately for each member;
- combine the resulting LK estimates across members.

**Time analysis:**

- take one five-year period;
- pool five years from each of the 50 members;
- calculate LK from \(5\times50=250\) samples;
- repeat for later five-year periods.

This is strong direct provenance for combining temporal and ensemble information in Arctic sea-ice causality. It is not current-time EnKF covariance.

Sources: [Docquier et al. 2022](https://doi.org/10.1029/2021GL095892), [authors’ LK code](https://github.com/ddocquier/Liang_Index/tree/v2.1)

### 4.7 Docquier et al. 2024: multiple CMIP6 large ensembles

The later Arctic study calculates LK over the whole 1970–2060 time series separately for each member and then combines results. For evolving causality, it pools every member within separate ten-year periods, producing around 300–500 samples per period depending on the model. The authors also test five-year periods.

This is currently the closest published IcyAlert precedent:

\[
\text{short time block}
\times
\text{ensemble members}
\rightarrow
\text{covariance and LK}.
\]

Source: [Docquier et al. 2024](https://www.nature.com/articles/s41598-024-76056-y)

### 4.8 Rolling-window LK

Rolling-window applications calculate ordinary LK within one recent time window, move the window, and repeat. This gives a time-dependent curve while retaining the original time-series interpretation of covariance.

- [Wang et al. 2020](https://www.nature.com/articles/s41598-020-74331-2) provides climate/ocean precedent.
- [Lu et al. 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9186288/) uses successive 250-trading-day windows in finance.

These papers establish rolling-window LK as a published practice. They do not prove that a particular window is optimal or that rolling covariance equals a known instantaneous physical covariance. Short windows respond faster but contain fewer samples; long windows are more stable but hide faster change.

### 4.9 Wang et al. 2025: LK used inside ensemble filtering

Wang first calculates an LK causal map from a long historical model time series. That map is fixed before data assimilation and used for causal localization in an ensemble adjustment Kalman filter. The live forecast ensemble covariance remains part of the filter, but LK itself is not recomputed from the live ensemble during every cycle.

Therefore, Wang keeps two roles separate:

- historical signal covariance produces the LK map;
- current ensemble covariance performs the filter update.

The paper presents flow-dependent or dynamic causal localization as future work. It must not be cited as validation of LK calculated from current posterior covariance.

Local source: [Wang et al. 2025](../papers/wang-2025-causality-localization/paper-dump.md)

### 4.10 Lien et al. 2025: LIM-LK

LIM-LK starts from an explicit periodically varying linear stochastic model and uses signal covariance directly:

\[
T_{x_j\rightarrow x_i}(\theta)
=A_{ij}(\theta)
\frac{C_{ij}(\theta)}{C_{ii}(\theta)}.
\]

It is useful because the learned dynamics \(A\), signal covariance \(C\), and noise terms are explicit. It is not a Kalman filter, and it assumes repeated seasonal or cyclostationary structure rather than arbitrary observation-by-observation change.

Sources: [published paper](https://journals.aps.org/pre/abstract/10.1103/5cd4-5cb4), [preprint](https://arxiv.org/html/2409.06797v1)

## 5. David Docquier’s relevance to IcyAlert

David’s work connects sea-ice physics, climate-model ensembles, satellite products, and LK causal analysis. His main relevant projects are:

- **IcyAlert:** causal-analysis contribution at RMI;
- **RESIST:** causes and effects of recent Arctic and Antarctic sea-ice lows;
- **ROADMAP:** ocean–atmosphere–sea-ice interactions using causal methods;
- **OSeaIce:** controlled EC-Earth3 experiments changing ocean heat transport and examining sea-ice response;
- **PRIMAVERA:** evaluation of sea-ice and ocean processes across climate-model resolutions.

Sources: [current research](https://sites.google.com/view/daviddocquier/my-current-research), [past research](https://sites.google.com/view/daviddocquier/my-past-research), [publications](https://sites.google.com/view/daviddocquier/my-publications)

His established workflow is generally:

\[
\text{model or satellite time series}
\rightarrow
\text{detrending or time/ensemble pooling}
\rightarrow
\text{LK}
\rightarrow
\text{bootstrap significance and physical interpretation}.
\]

His email saying that our KF method “could potentially be used” for information transfer should be treated as interest in a possible method, not confirmation that live posterior covariance is already the intended IcyAlert solution.

### Spatial work: exact boundary

David’s 2023 satellite study calculates LK locally from SST, SST tendency, and turbulent heat-flux time series, then repeats the calculation over geographical cells to produce maps. A 2024 Barents–Kara study co-authored by David replaces regional sea-ice area with local sea-ice concentration and repeats LK at every cell against regional drivers.

These are spatially mapped LK analyses. They do not calculate the complete covariance between every pair of grid cells.

Sources: [ocean–atmosphere satellite study](https://esd.copernicus.org/articles/14/577/2023/index.html), [Barents–Kara study](https://doi.org/10.1029/2024GL108195)

### Method validation work

Docquier et al. compare LK with PCMCI on synthetic systems, Lorenz-63, and climate indices. The useful conclusion is not that one method always wins: method performance changes with dimensionality, confounding, and nonlinearity. This supports validating the IcyAlert estimator on controlled systems before interpreting real Arctic results.

Source: [Docquier et al. 2024](https://npg.copernicus.org/articles/31/115/2024/)

## 6. What our experiments established

### Completed

1. **Stationary two-variable reference reproduced.** The free stochastic process produced \(T_{2\rightarrow1}\) close to \(0.1111\). This checks the process model, discrete process-noise scaling, and simplified LK calculation.

2. **EnKF checked against the analytical Kalman covariance recursion.** The EnKF transient analysis produced approximately \(0.0387\), while the analytical Kalman calculation produced approximately \(0.0403\). Their agreement shows that the lower filtered value is not simply an EnKF implementation bug.

3. **Observation value separated from covariance update.** In the tested linear setup, fixed and moving observation values gave the same covariance recursion, although state-estimation errors differed.

4. **Observation noise investigated.** Lower \(R\) caused stronger contraction of the analysis covariance and degraded the chosen LK ratio in our observation setup.

5. **Exploratory preservation methods tested.** Momentum covariance, covariance blending, and Cholesky resampling did not recover the stationary reference. They are exploratory modifications, not established parts of the Vannitsem benchmark.

### Correct interpretation of the low-\(R\) result

Low observation noise does not universally destroy every LK ratio. The effect depends on the observation operator and which variable is observed.

For example, if only state 1 is observed in a two-state linear system, the Kalman update can scale \(P_{11}\) and \(P_{12}\) by the same factor, preserving \(P_{12}/P_{11}\). If state 2 or both states are observed accurately, variance and cross-covariance can contract differently.

Our degradation is real for our tested observation configuration. It does not establish a universal law, and legitimate posterior contraction should be distinguished from finite-ensemble collapse.

## 7. Candidate ways to estimate evolving covariance

These are alternatives answering different questions, not interchangeable implementations.

### A. Hagan/Zhou posterior covariance

Use the recursively updated Kalman covariance for pointwise TvLK. This has published end-to-end synthetic demonstrations, but the link between Kalman error covariance and Liang signal covariance remains insufficiently explained.

### B. Forecast ensemble covariance

Calculate covariance before observing the next measurement. It preserves model-generated uncertainty before posterior contraction. No identified LK paper validates it directly as a cycle-by-cycle replacement for signal covariance.

### C. Rolling-window signal covariance

Use recent physical-variable history:

\[
C_t^{\mathrm{roll}}
=\operatorname{Cov}(x_{t-L+1},\ldots,x_t).
\]

This has direct published usage and stays close to Liang’s time-series estimator, but the window length must be justified and tested.

### D. Pooled time-block and process-model ensembles

Follow Docquier by combining a short period with ensemble members. This is the strongest direct Arctic precedent, although its temporal resolution is limited by the block size.

### E. EWMA signal covariance

Maintain a soft temporal window:

\[
C_t^{\mathrm{EWMA}}
=\alpha C_{t-1}^{\mathrm{EWMA}}
+(1-\alpha)(x_t-\mu_t)(x_t-\mu_t)^T.
\]

This resembles covariance momentum but must operate on a clearly defined signal and be validated. No identified LK paper establishes it as the correct IcyAlert estimator.

### F. Wang-style separation

Calculate a historical LK map for localization or structure, while using the live ensemble covariance only for data assimilation. This is established by Wang but answers a different question from live causal estimation.

### Supporting covariance tools

Localization, shrinkage, inflation, and hybrid climatological–ensemble covariance can reduce finite-ensemble estimation error. They improve an estimator after its target covariance has been defined; they do not decide which covariance LK theoretically needs.

## 8. Decisions to obtain from the IcyAlert team

### Stéphane and David

1. Is the desired transient LK based on Hagan-style updated Kalman covariance, a recent signal window, Docquier-style pooled time and ensemble samples, or more than one reference method?
2. Is the output intended to represent posterior uncertainty causality or physical-variable causality?
3. For spatial IcyAlert analysis, do they need local driver-to-grid-cell LK maps or full cross-grid covariance?
4. Should the first real-data experiment use ERA5 only as a reference time series, as Stéphane suggested, before introducing seasonal-forecast ensembles?

### Tommy

1. What will the learned process model output: a deterministic state, an ensemble, explicit uncertainty, or some combination?
2. Which state variables, resolution, time step, and observation products will be used in the first shared experiment?

## 9. Next controlled experiment

Before selecting one covariance estimator, build a nonstationary synthetic system whose evolving physical covariance is independently measurable.

1. Define a linear system with known time-varying coupling.
2. Propagate a very large Monte Carlo population to estimate reference physical covariance \(C_x(t)\).
3. Generate observations and run both the analytical Kalman filter and EnKF.
4. Retain at every time:
   - reference population covariance;
   - rolling-window covariance;
   - EWMA covariance;
   - forecast covariance \(P_t^f\);
   - analysis covariance \(P_t^a\);
   - Docquier-style pooled time–ensemble covariance where applicable.
5. Calculate LK from every candidate.
6. Sweep observation noise, observation operator, ensemble size, and memory/window length.

This experiment asks which online estimate follows known physical information flow. It is more informative than forcing the analysis covariance toward the stationary \(0.1111\) value.

## 10. Reading order

### Must read

1. **Vannitsem et al. 2019:** two-variable model and stationary reference. [Local paper](../papers/vannitsem-2019/paper-dump.md)
2. **Pires et al. 2024:** stationary versus transient distributions; nonlinear and synergistic transfer. [Local paper](../papers/pires/paper-dump.md)
3. **Hagan et al. 2019:** Sections 2b–2c and Equation 15; record the exact implementation gaps. [Local paper](../papers/hagan/paper_dump.md)
4. **Docquier et al. 2022 and 2024:** member analysis versus pooled time–ensemble analysis. [2022 paper](https://doi.org/10.1029/2021GL095892), [2024 paper](https://www.nature.com/articles/s41598-024-76056-y)
5. **Wang et al. 2025:** historical LK for localization, separate from the live EAKF covariance. [Local paper](../papers/wang-2025-causality-localization/paper-dump.md)

### Read next

1. **Docquier et al. 2023:** observational and spatially mapped LK. [Paper](https://esd.copernicus.org/articles/14/577/2023/index.html)
2. **Docquier et al. 2024:** LK versus PCMCI and controlled benchmarks. [Paper](https://npg.copernicus.org/articles/31/115/2024/)
3. **Zhou et al. 2024:** conditioned multivariate TvLK. [Paper](https://doi.org/10.1175/JCLI-D-23-0207.1)
4. **Lien et al. 2025:** explicit seasonal dynamics and signal covariance. [Paper](https://journals.aps.org/pre/abstract/10.1103/5cd4-5cb4)

### Later only if needed

- **Granger causality:** asks whether the past of one variable improves prediction of another, normally through a linear VAR model.
- **Transfer entropy:** measures directed predictive information and can capture nonlinear dependence, but generally needs more data.
- **PCMCI:** conditioned multivariate time-series discovery intended to reduce indirect or confounded links; relevant when the variable count grows.
- **Nonlinear information transfer:** Pires, Docquier, and Vannitsem extend beyond covariance-only linear LK using conditional expectations and nonlinear regression.
- **State-dependent causality:** asks how causality changes with system state rather than only clock time. The [2025 observational-causality paper](https://www.nature.com/articles/s42005-025-02447-w) is the relevant lead.
- **Neural Granger and reservoir causality:** nonlinear predictive-causality alternatives.
- **SPACETIME:** combines temporal-regime identification with changing causal graphs.
- **JIT-LiNGAM:** fits local linear non-Gaussian causal models around the current time or state.
- **Partial symbolic transfer entropy:** a rank-based nonparametric alternative.
- **Normalizing Kalman filters:** flexible nonlinear/non-Gaussian filtering, not an LK justification by itself.
- EarthNet for spatiotemporal satellite completion and 4DVarNet for reconstruction of incomplete space–time fields. These concern missing-observation reconstruction, not the immediate covariance-definition question.

## 11. Boundaries and known gaps

- No clean head-to-head paper was identified showing that time-varying LK generally outperforms static LK on the same realistic system. Time-varying methods are motivated by nonstationarity, but performance depends on whether the true relationship actually changes.
- The Hagan implementation cannot presently be reproduced exactly from the paper alone.
- The former MtvLK repository must not be described as publicly available until its source can actually be retrieved.
- Rolling-window LK has published provenance, but no identified source proves an optimal window or pointwise consistency for our problem.
- Docquier’s spatial maps do not establish full grid-to-grid covariance estimation.
- The first two-variable experiment validates our code and exposes covariance-choice consequences; it does not decide which covariance IcyAlert scientifically wants.
- ERA5 is already a data-assimilated reanalysis. It can be used as a reference time series for the first causal experiment, but treating it as raw observations would be incorrect.
- The 12-variable model mentioned by Stéphane cannot be implemented faithfully until its exact equations or reference are obtained.

## 12. What not to do yet

- Do not force the EnKF posterior covariance to reproduce the stationary \(0.1111\) reference.
- Do not claim that a live EnKF covariance is already validated for ordinary LK.
- Do not start full C3S/S2S integration before the desired covariance and interpretation are agreed.
- Do not treat spatially mapped LK as a full cross-grid covariance model.
- Do not introduce a neural operator merely because IcyAlert includes AI; the current blocker is the statistical target, not model capacity.
