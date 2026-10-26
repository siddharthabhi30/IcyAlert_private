# 2019 TvLK Paper: Summary and Reading Guide

## Paper

Hagan, D. F. T., Wang, G., Liang, X. S., and Dolman, H. A. J. (2019), *A Time-Varying Causality Formalism Based on the Liang–Kleeman Information Flow for Analyzing Directed Interactions in Nonstationary Climate Systems*.

[Official paper](https://doi.org/10.1175/JCLI-D-18-0881.1) · [Local paper text](/home/abhi/code/defence/defence/learning/deep-stats-learning/signal-processing/weather-data/hagan-paper/paper-dump.md) · [Required foundations](2019-tvlk-foundations.md)

---

## The paper in one paragraph

The original Liang–Kleeman estimator gives two directed information-flow values, $T_{2\rightarrow1}$ and $T_{1\rightarrow2}$, from covariance statistics computed over a time series. That produces one relationship for the analyzed record and therefore assumes that the relationship is sufficiently stationary. Hagan et al. want the direction and strength to change with time. They run a square-root Kalman filter to produce a covariance matrix $P(t)$ at every time, substitute its entries for the fixed sample-covariance terms in the bivariate LK formula, and obtain $T_{2\rightarrow1}(t)$ and $T_{1\rightarrow2}(t)$. They then optionally apply a wavelet transform to these causal time series to show when the interaction appears and at which time scales.

---

## What problem is being solved?

Soil moisture and air temperature can influence one another differently across:

- seasons;
- wet and dry regimes;
- locations;
- and temporal scales.

A full-record correlation gives no causal direction. A full-record LK estimate gives direction, but one average causal relationship can hide changes over time.

The target output is therefore:

$$
\left\{
T_{2\rightarrow1}(t),
T_{1\rightarrow2}(t)
\right\}_{t=1}^{N},
$$

not one covariance, not one Kalman analysis, and not one forecast trajectory.

With the optional wavelet layer, the output becomes a time-frequency map of each directional causal series.

---

## The core contribution in one sentence

$$
C\longrightarrow P(t)
$$

Replace the static, full-record sample covariance $C$ in the bivariate LK formula with a time-varying Kalman error covariance $P(t)$ at every time step.

---

## Input and output

### Inputs

- Two equally sampled time series $X_1(t)$ and $X_2(t)$.
- Sampling interval $\Delta t$.
- Forward-difference lag $k$.
- A Kalman state/measurement model (exact matrices $A$, $H$ are **not** specified in the paper — see "Important implementation ambiguity" below).
- Time-varying $Q(t)$ and $R(t)$, estimated offline using EWMA or UWMA.
- Initial state and covariance.
- A chosen wavelet, if TFvLK is required.

### Intermediate quantities

- Derivative series $\dot X_1$ and $\dot X_2$.
- Kalman state estimate $\widehat x(t)$.
- Kalman error covariance $P(t)$.
- Significance thresholds.

### Outputs

- $T_{2\rightarrow1}(t)$: time-varying information flow from $X_2$ to $X_1$.
- $T_{1\rightarrow2}(t)$: reverse flow.
- Units: nats per unit time.
- Optional time-frequency maps after wavelet decomposition.

---

## The two formulas side by side

### Original stationary LK

Estimate one covariance structure from the entire record:

$$
C_{11},\;C_{22},\;C_{12},\;C_{1,d1},\;C_{2,d1},
$$

then compute:

$$
T_{2\rightarrow1}
=
\frac{C_{12}}{C_{11}}
\frac{
-C_{12}C_{1,d1}+C_{11}C_{2,d1}
}{
C_{11}C_{22}-C_{12}^{2}
}.
$$

### Hagan's time-varying version (Eq. 15)

At every time $t$, obtain covariance entries from the Kalman filter:

$$
P_{11}(t),\;P_{22}(t),\;P_{12}(t),
\;P_{1,d1}(t),\;P_{2,d1}(t),
$$

then compute:

$$
T_{2\rightarrow1}(t)
=
\frac{P_{12}(t)}{P_{11}(t)}
\frac{
-P_{12}(t)P_{1,d1}(t)+P_{11}(t)P_{2,d1}(t)
}{
P_{11}(t)P_{22}(t)-P_{12}^{2}(t)
}.
$$

The reverse flow is obtained by switching the target and source indices.

---

## End-to-end algorithm

### Stage 1 — Prepare the signals

1. Start with $X_1(t)$ and $X_2(t)$.
2. Construct the forward derivative series:

   $$
   \dot X_1(t)
   =
   \frac{X_1(t+k\Delta t)-X_1(t)}
   {k\Delta t},
   $$

   and similarly $\dot X_2(t)$.

3. Choose the history length required by EWMA or UWMA.

### Stage 2 — Estimate the filter-noise statistics offline

4. Smooth the observed series to create a surrogate for the unavailable true process.
5. Use the moving-average residual structure to estimate $Q(t)$ and $R(t)$.
6. Accept that the first lookback-window portion will be unavailable in a forward-only calculation.

This stage is not a minor preprocessing choice. The paper states that TvLK accuracy depends heavily on $Q(t)$ and $R(t)$.

### Stage 3 — Run the square-root Kalman recursion

7. Predict the state and covariance:

   $$
   \widehat x_k^- = A\widehat x_{k-1}+Bu_k,
   \qquad
   P_k^-=AP_{k-1}A^T+Q_k.
   $$

8. Compute the Kalman gain:

   $$
   K_k=P_k^-H^T(HP_k^-H^T+R_k)^{-1}.
   $$

9. Correct the state and covariance:

   $$
   \widehat x_k
   =
   \widehat x_k^-+K_k(y_k-H\widehat x_k^-),
   $$

   $$
   P_k=(I-K_kH)P_k^-.
   $$

10. Perform the covariance operations through the Bierman–Thornton $UDU^T$ factors for numerical robustness.

### Stage 4 — Calculate causality

11. Extract the required covariance entries from $P_k$.
12. Insert them into Eq. (15) to obtain both directions:

   $$
   T_{2\rightarrow1}(k),
   \qquad
   T_{1\rightarrow2}(k).
   $$

13. Compare their magnitudes with the significance thresholds.

### Stage 5 — Optional time-frequency analysis

14. Apply a continuous wavelet transform separately to each directional causal series.
15. Report when significant causal signals occur and the periods/frequencies at which they are concentrated.

---

## What the Kalman filter is and is not doing

It **is**:

- recursively carrying a changing covariance estimate;
- combining a state model, observations, $Q(t)$, and $R(t)$;
- providing the $P(t)$-entries used by TvLK;
- using a square-root/UD implementation for numerical stability.

It is **not**:

- performing an EnKF update on a weather ensemble;
- producing the final causal direction from the innovation alone;
- using $XX^T/R$ as a particle-flow likelihood pull;
- or making the filtered physical state the final reported result.

The final Eq. (15) uses $P(t)$, not the filtered mean $\widehat x(t)$.

### Why $P(t)$ is not "covariance from one data point"

$P(t)$ is **not** a sample covariance calculated from time $t$ alone. That would be mathematically impossible (you cannot compute variance from a single number).

$P(t)$ gets its numbers from two sources of history:

1. **Recursive memory**: $P_t^- = AP_{t-1}A^T + Q_t$. The matrix $P$ is carried forward from $P(0)$ through every past step. It accumulates the history of all past observations.
2. **The sliding historical window for $Q(t)$ and $R(t)$**: The noise statistics are estimated using a lookback window (e.g., 30–50 past data points), not from a single point.

---

## Important implementation ambiguity

The paper gives:

- the generic state-space model;
- the generic Kalman recursion;
- the covariance entries required by Eq. (15);
- and the EWMA/UWMA approach for $Q(t)$ and $R(t)$.

It does **not** give a fully explicit, component-level construction of:

- the augmented state vector containing the original and derivative variables;
- the exact measurement vector;
- every entry of $A$, $B$, and $H$;
- and the exact offline $Q(t)$/$R(t)$ calculation used for each reported experiment.

### Why this matters

The TvLK formula needs $P(X_2, \dot X_1)$ — the covariance between $X_2$ and the derivative of $X_1$. For the Kalman filter to produce this entry, $\dot X_1$ must be somewhere inside the filter (either in the state vector or in the observation vector). The paper never specifies exactly how.

The article also mentions two variants, one of which first fits an autoregressive model to determine transition functions, but does not develop the difference in enough detail for a fully reproducible implementation from the prose alone.

**This is a limitation of the method description, not a foundation the reader has failed to understand.** When you read the paper and feel confused about the exact state-space setup, that confusion is correct. Mark it and move on.

---

## Synthetic experiment 1

### Construction

Two autoregressive series of length 1000:

$$
x_1(t)
=
0.36x_1(t-1)-0.41x_1(t-2)
+c_{2\rightarrow1}(t)x_2(t-1)+\epsilon_1(t),
$$

$$
x_2(t)
=
0.36x_2(t-1)-0.41x_2(t-2)
+c_{1\rightarrow2}(t)x_1(t-1)+\epsilon_2(t).
$$

The noise terms are white, zero mean, and unit variance.

### Preset causality

For the first half:

$$
c_{2\rightarrow1}=0,
\qquad
c_{1\rightarrow2}=2.
$$

For the second half:

$$
c_{2\rightarrow1}=2,
\qquad
c_{1\rightarrow2}=0.
$$

The generated oscillation is near $0.2$ Hz.

### What TvLK recovered

- Significant $X_1\rightarrow X_2$ in the first half.
- Significant $X_2\rightarrow X_1$ in the second half.
- The wavelet result located the interaction near the preset $0.2$-Hz band.

This test checks direction switching and frequency recovery.

---

## Synthetic experiment 2

### Preset causality

For approximately the first 550 points:

$$
c_{1\rightarrow2}=c_{2\rightarrow1}=0.
$$

Afterward:

$$
c_{2\rightarrow1}=0.95,
\qquad
c_{1\rightarrow2}=0.45.
$$

The two directions are designed to act at different frequencies:

- $X_1\rightarrow X_2$: about $0.1$ Hz.
- $X_2\rightarrow X_1$: about $0.2$ Hz.

### What TvLK/TFvLK recovered

- Nil causality during the initial interval.
- Mutual causality afterward.
- Stronger magnitude for the direction with the larger preset coupling.
- Separate frequency bands for the two directions.

This test checks nil causality, unequal strength, simultaneous bidirectionality, and different temporal scales.

---

## Real-data application

### Data

- ECMWF ERA-Interim.
- Daily data from January 2012 through December 2015.
- Horizontal resolution: $0.25^\circ$.
- First-layer volumetric soil moisture.
- 2-m air temperature.
- No preprocessing before the information-flow calculation.

### Regions

- **RA:** transitional partly wet–partly dry region in East China.
- **RB:** wetter region in South China.

### Main reported interpretation

In RA:

- soil moisture $\rightarrow$ air temperature is significant mainly in spring;
- the reverse direction is mostly insignificant;
- the soil-moisture influence appears on longer time scales.

In RB:

- soil moisture $\rightarrow$ air temperature appears from late winter into early spring, concentrated roughly in 4–30-day cycles;
- air temperature $\rightarrow$ soil moisture becomes more prominent later, including late spring and summer;
- the two directions appear at different time scales.

These are causal interpretations under the bivariate TvLK model applied to reanalysis data. They are not controlled physical interventions.

---

## What the paper contributes

1. Converts one fixed bivariate LK estimate into a time-indexed causal series.
2. Uses a Kalman covariance recursion rather than recomputing a completely separate full-window LK estimate at every time.
3. Uses a square-root/UD filter to protect covariance numerics.
4. Adds wavelet postprocessing to identify causal time scales.
5. Demonstrates direction switching, nil causality, unequal bidirectional strength, and frequency separation on designed synthetic systems.
6. Applies the method to seasonal soil-moisture/temperature coupling.

---

## What it does not establish

1. **No multivariate conditioning.** The 2019 method is bivariate. A third driver can still create misleading interpretation. The 2024 MtvLK paper addresses multivariate conditioning.
2. **No covariance from a single point.** Historical support enters through the recursion and the moving-average estimation of $Q(t)$ and $R(t)$.
3. **No physical intervention.** The output is directed entropy flow under the assumed stochastic model, not the response to experimentally forcing one variable.
4. **No neural or nonlinear learned causal model.** The usable closed-form estimator is based on a linear dynamical approximation.
5. **No complete implementation specification in the prose.** Important state-space and noise-estimation details remain underspecified (exact $A$, $H$, state vector, measurement vector).
6. **No removal of confounding by wavelets.** Frequency separation can provide diagnostic evidence, but it is not equivalent to conditioning on a third variable.
7. **No free "instantaneous change" detection.** Responsiveness still depends on initialization, $Q(t)$, $R(t)$, and lookback/smoothing choices.
8. **No exact truth in the real application.** ERA-Interim is itself a model-plus-assimilation product, and its soil/temperature relationships are partly inherited from that system.

---

## Reading path

### Before Section 1

Read [2019-tvlk-foundations.md](2019-tvlk-foundations.md), concentrating on Modules 2–9.

Do not delay the paper for:

- a full stochastic-calculus course;
- derivation of the Fokker–Planck equation;
- a complete wavelet course;
- or implementation of the Bierman–Thornton algorithm.

### Abstract

**READ CAREFULLY — 3 minutes**

**Takeaway:** The claimed novelty is time-varying LK through square-root Kalman covariance estimation, with optional wavelet decomposition.

**Ignore:** Broad claims about applicability until the experiments and limitations have been inspected.

### Section 1 — Introduction

**SKIM — 8 minutes**

Look for:

- why correlation lacks direction;
- why stationary LK is insufficient;
- why the authors select a Kalman filter;
- why they add wavelets.

Do not memorize the land–atmosphere literature survey.

### Section 2a — Information-flow causality

**READ CAREFULLY — 20 minutes**

Own:

$$
T_{2\rightarrow1}
=
\frac{\sigma_{12}}{\sigma_{11}}a_{12}
$$

and Eq. (8), including the derivative-covariance terms.

**Math flag:**

- Explain Eqs. (7) and (8) without notes.
- Black-box the derivation of general Eq. (2) on the first read.
- Know that Eq. (2) defines information flow as the source's contribution to the target's entropy-rate change.

**Key insight to carry:** Covariance is the arithmetic tool to estimate the physical push $a_{12}$ from data. It is not the definition of causality.

### Section 2b — Kalman filter

**READ CAREFULLY — 20 minutes**

Look for:

- the distinction between $\widehat x_k$ and $P_k$;
- why the final causal calculation needs $P_k$;
- where $Q_k$ and $R_k$ enter;
- why the authors use $UDU^T$.

**Math flag:**

- Explain Eqs. (11)–(15).
- Do not derive the square-root update yet.

**Warning:** When you look for the exact state vector and measurement model, you will not find them spelled out. This is the paper's implementation gap. Note it and move on.

### Section 2c — TvLK framework

**READ MOST CAREFULLY — 15 minutes**

This is the main contribution.

Own:

$$
C\longrightarrow P(t)
$$

inside the LK estimator.

Mark the missing state-vector and measurement-model specification rather than repeatedly rereading the generic Kalman equations looking for it.

### Section 2d — Wavelets

**SKIM — 8 minutes**

Own the interface:

$$
T(t)\longrightarrow W(t,s).
$$

Black-box the detailed continuous-wavelet formula unless reproducing the plots.

### Section 3 — Synthetic tests

**READ CAREFULLY — 20 minutes**

For each experiment, write down:

1. the preset direction;
2. the switching time;
3. the preset strength;
4. the preset frequency;
5. what TvLK recovered.

Do not spend time reconstructing every plotted confidence band.

### Section 4 — Soil moisture and temperature

**READ SELECTIVELY — 15 minutes**

Own:

- data source and period;
- the difference between RA and RB;
- when each causal direction is reported;
- how the wavelet plot changes the interpretation.

Skim the longer physical-climatology explanations unless land–atmosphere coupling is the immediate research topic.

### Section 5 — Discussion

**READ CRITICALLY — 15 minutes**

Separate:

- results demonstrated by the synthetic tests;
- claims inherited from earlier LK theory;
- claims inferred from the real application;
- limitations admitted by the authors.

Pay special attention to:

- single-realization claim;
- bivariate limitation;
- dependence on $Q$ and $R$;
- and the claim that frequency separation helps with statistical pitfalls.

### Appendix A — Bierman–Thornton

**SKIP ON FIRST READ**

Return only when implementing the square-root filter.

### Appendix B — Framework and tuning

**READ CAREFULLY — 12 minutes**

This appendix contains operationally important information absent from the main equations:

- EWMA/UWMA estimation of $Q(t)$ and $R(t)$;
- the lookback window;
- missing initial output;
- approximately three-times-higher cost than original LK;
- the unadopted forward-backward smoother.

### Appendix C — Significance

**SKIM — 5 minutes**

Own the role of the Fisher information and large-sample uncertainty. Black-box its full derivation until significance testing is implemented.

Estimated paper-reading time after foundations: **about two hours**.

---

## Post-reading checkpoint

After reading, be able to answer these without quoting the abstract:

1. Starting from two observed time series, trace every major intermediate quantity until $T_{2\rightarrow1}(t)$ is produced.
2. Explain why $P_{2,d1}(t)$ is required and why $P_{12}(t)$ alone cannot give causal direction.
3. Explain exactly how the 2019 method differs from computing stationary LK independently over one long record.
4. Explain how a bad $Q(t)$, $R(t)$, or lookback choice can create a misleading time-varying causal series.
5. Separate what was established by the synthetic experiments from what was only interpreted in the ERA-Interim application.
6. Explain why wavelet decomposition reveals time scale but does not solve confounding.
7. State which implementation details cannot be recovered unambiguously from the article alone (exact state vector, $A$, $H$, measurement model).
8. Explain why $P(t)$ is not "covariance from a single data point."

---

## Later papers and further directions

These should not block the 2019 read. See [IcyAlert LK and filtering status](../../llm-remarks/icyalert-lk-filtering-status.md) for:

- multivariate TvLK (Zhou et al. 2024);
- LKIF versus PCMCI comparison (Docquier et al. 2024);
- state-dependent causality critiques;
- neural and nonlinear causality methods;
- and a comparison table of all major time-series causality frameworks.
