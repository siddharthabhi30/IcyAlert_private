# 2025 LIM–LK Paper: Summary and Reading Guide

## Paper

Lien, J., Ando, H., Kim, Y.-Y., and Tozuka, T. (2025), *Linear-Inverse-Modeling Approach to Estimating Liang–Kleeman Information Flow in a Cyclostationary Process under Memoryless and Persistent Noise*.

[Official paper](https://doi.org/10.1103/5cd4-5cb4) · [Local paper text](hagan-paper/lian-et-al-dump.md)

---

## The paper in one paragraph

The paper combines linear inverse modeling (LIM) with Liang–Kleeman (LK) information flow. It first learns an explicit seasonal linear stochastic model from repeated cycles of observed data. The learned model separates three contributors to the evolution of a target variable: other state variables, persistent colored noise, and memoryless white noise. It then calculates how much each contributor excites or stabilizes the target. The output changes with seasonal phase, such as month of the year. The method is demonstrated on the two-way relationship between Pacific sea-surface temperature and the Indian Ocean Dipole.

---

## First intuition

Suppose the target is Pacific sea-surface temperature.

Its change is represented as:

$$
\text{change in Pacific SST}
=
\text{seasonal system dynamics}
+\text{persistent forcing}
+\text{memoryless forcing}.
$$

The paper first learns these parts from historical data. It then asks:

- How much does the Indian Ocean affect Pacific SST?
- How much does Pacific SST affect itself?
- How much uncertainty enters from persistent forcing?
- How much uncertainty enters from short-lived random forcing?
- How do all of these change across the seasonal cycle?

This is the central workflow:

$$
\text{data}
\longrightarrow
\text{seasonal lag correlations}
\longrightarrow
\text{learned LIM dynamics and noise}
\longrightarrow
\text{LK information flow}.
$$

---

## The core contribution

The method has two stages:

### Stage 1 — Learn the dynamical system with LIM

Estimate:

$$
A(\theta),\quad Q,\quad D(\theta),\quad \gamma.
$$

These describe the seasonal dynamics, persistent noise, memoryless noise, and noise-memory time.

### Stage 2 — Calculate LK information flow

Use the learned dynamics and the observed signal covariance to calculate:

$$
T_{x_j\rightarrow x_i}(\theta).
$$

The method therefore connects a causal value directly to an explicit learned dynamical model.

---

## What “cyclostationary” means

Cyclostationary does **not** mean that the exact observations repeat every year.

It means that statistical quantities repeat with a known period. For example:

- all Januaries share one covariance structure;
- all Februaries share another;
- and the pattern repeats each year.

The phase variable $\theta$ identifies the position inside the cycle. For monthly climate data, $\theta$ can be understood as the month of the year.

Therefore, this paper estimates:

$$
T_{x_j\rightarrow x_i}(\theta),
$$

which is causality by seasonal phase. It does not estimate a completely independent causal value for every unique observation time.

---

## The model

The paper models the state vector $\mathbf{x}$ as:

$$
\frac{d\mathbf{x}}{dt}
=
A(t)\mathbf{x}
+\sqrt{2Q}\,\boldsymbol{\eta}
+\sqrt{2D(t)}\,\boldsymbol{\xi}.
\tag{1}
$$

### What each term means

#### $\mathbf{x}$

The variables being modeled.

In the application, the state contains:

- Pacific SST at one grid point;
- the Dipole Mode Index (DMI).

#### $A(t)\mathbf{x}$

The linear system dynamics.

- Diagonal entries $A_{ii}$ describe how a variable affects its own evolution.
- Off-diagonal entries $A_{ij}$ describe how $x_j$ enters the evolution of $x_i$.
- $A(t)$ changes periodically with seasonal phase.

#### $\boldsymbol{\eta}$

Persistent colored noise.

It has memory: a forcing acting now remains correlated with forcing shortly afterward.

#### $Q$

The matrix controlling persistent colored forcing.

In this paper, $Q$ is time independent.

#### $\boldsymbol{\xi}$

Memoryless white noise.

It has no temporal memory.

#### $D(t)$

The seasonal matrix controlling memoryless white forcing.

#### $\gamma$

The correlation time of the persistent noise.

A larger $\gamma$ means that the forcing remembers its past for longer.

---

## Important notation warning

The symbols in this paper are not identical to the symbols in Hagan et al. (2019).

- Hagan's $Q(t)$ is Kalman process-noise covariance.
- Hagan's $R(t)$ is Kalman measurement-noise covariance.
- Lien's $Q$ controls persistent colored forcing.
- Lien's $D(t)$ controls memoryless white forcing.
- This LIM–LK paper does not use Hagan's Kalman recursion.

The shared symbol $Q$ should not be taken to mean that the two papers use the same construction.

---

## The signal covariance and lag correlation

The signal covariance is:

$$
C(\theta)
=
E[\mathbf{x}(t)\mathbf{x}(t)^T].
$$

The phase-dependent lag correlation is:

$$
K(\tau,\theta)
=
E[\mathbf{x}(t+\tau)\mathbf{x}(t)^T].
$$

Here:

- $\theta$ identifies seasonal phase;
- $\tau$ is the time lag;
- $C(\theta)=K(0,\theta)$.

The inverse method estimates $K$ directly from repeated cycles in the data:

$$
\widehat K(\tau,\theta)
=
\frac{1}{N_s}
\sum_{\omega(t)=\theta}
\mathbf{x}(t+\tau)\mathbf{x}(t)^T.
$$

This is why the method is offline and batch based. It needs many observations from the same phase across multiple cycles.

---

## LK flow between state variables

For the linear model, the information flow from $x_j$ to $x_i$ is:

$$
T_{x_j\rightarrow x_i}(\theta)
=
A_{ij}(\theta)
\frac{C_{ij}(\theta)}{C_{ii}(\theta)}.
\tag{6}
$$

This formula contains two different pieces.

### $A_{ij}$

How $x_j$ enters the evolution equation for $x_i$.

### $C_{ij}/C_{ii}$

How the two variables are statistically arranged at that seasonal phase, normalized by the variance of the target.

### Why both pieces are needed

- Covariance without dynamical coupling is not enough.
- Dynamical coupling without the current statistical relationship is also not enough.
- LK flow combines both.

If $A_{ij}=0$, then:

$$
T_{x_j\rightarrow x_i}=0,
$$

even if $x_i$ and $x_j$ are correlated.

For $j=i$:

$$
T_{x_i\rightarrow x_i}=A_{ii},
$$

which is the paper's self-causality term.

---

## How to interpret the sign

### Positive flow

$$
T_{x_j\rightarrow x_i}>0
$$

$x_j$ excites $x_i$: it contributes uncertainty or variance to the target.

### Negative flow

$$
T_{x_j\rightarrow x_i}<0
$$

$x_j$ stabilizes $x_i$: it removes uncertainty or damps the target.

### Zero flow

$$
T_{x_j\rightarrow x_i}=0
$$

The model assigns no directed information flow from $x_j$ to $x_i$ at that phase.

The sign is about excitation versus stabilization. It is not simply the sign of an ordinary correlation.

---

## Information flow from external noise

The paper also calculates entropy entering the state from latent stochastic forcing.

### Persistent colored noise

For one colored-noise component:

$$
T_{\eta_j\rightarrow x_i}
=
\frac{
(\sqrt{2Q})_{ij}
(C_{\eta x}^{T})_{ij}
}{
C_{ii}
}.
\tag{7}
$$

Colored noise is correlated with the state through the noise-state coupling matrix:

$$
C_{\eta x}(\theta)
=
E[\boldsymbol{\eta}(t)\mathbf{x}(t)^T].
$$

Because it has memory and couples with the state, its contribution can excite or stabilize an individual variable.

### Memoryless white noise

The white-noise contribution is:

$$
T_{\xi\rightarrow x_i}
=
\frac{D_{ii}}{C_{ii}}
>0.
\tag{8}
$$

White noise only injects uncertainty in this formulation, so its flow is positive.

---

## The variance budget

The paper connects all information flows to the seasonal change in target variance:

$$
\frac{d}{d\theta}\ln C_{ii}
=
2\left(
\sum_j T_{x_j\rightarrow x_i}
+T_{\eta\rightarrow x_i}
+T_{\xi\rightarrow x_i}
\right).
\tag{9}
$$

Intuitively:

$$
\text{change in target uncertainty}
=
\text{state contributions}
+\text{persistent-noise contribution}
+\text{white-noise contribution}.
$$

This is the paper's main connection between causality and system dynamics.

The paper also defines a normalized flow in Eq. (10) to report the relative contribution of one source to this budget.

---

## Why persistent and memoryless noise are separated

The distinction matters for predictability.

### White noise

- has no temporal memory;
- introduces unpredictable variation;
- causes correlation skill to fall rapidly.

### Colored noise

- persists through time;
- can be partly predictable over short leads;
- can sustain short-range correlation skill;
- still transfers entropy into or out of the target.

The paper therefore separates “uncertainty that immediately disappears into randomness” from “uncertainty carried by a forcing with temporal structure.”

---

## Forward problem versus inverse problem

### Forward problem

Assume the system parameters are already known:

$$
A,\quad Q,\quad D,\quad \gamma.
$$

Then calculate:

- covariance and lag correlation;
- state-to-state flow;
- colored-noise flow;
- white-noise flow;
- the variance budget.

### Inverse problem

Start only with observed time-series data.

Then estimate:

$$
\text{data}
\longrightarrow
\widehat K
\longrightarrow
\widehat A,\widehat Q,\widehat D,\widehat\gamma
\longrightarrow
\widehat T.
$$

The inverse problem is the practical contribution used in the application.

---

## End-to-end inverse algorithm

### Step 1 — Prepare the data

1. Arrange the observations into an $n$-dimensional state vector.
2. Remove the mean or seasonal climatology as required.
3. Identify the repeated phase $\theta$.
4. Ensure uniform sampling.

### Step 2 — Estimate seasonal lag correlations

5. Estimate $K(\tau,\theta)$ from observations belonging to the same phase across repeated cycles.
6. Apply phase smoothing when the phase-wise estimate is noisy.
7. Set:

   $$
   C(\theta)=K(0,\theta).
   $$

### Step 3 — Test a candidate noise-memory time

8. Choose a candidate $\gamma$.
9. Estimate the right derivatives:

   $$
   K_\tau(0,\theta),
   \qquad
   K_{\tau\tau}(0,\theta).
   $$

10. Solve the paper's Eq. (4) for the periodic dynamical matrix $A(\theta)$.
11. Reject the estimate if the resulting periodic dynamics are unstable.

### Step 4 — Estimate the persistent forcing

12. Solve the auxiliary periodic equation:

   $$
   B'
   =
   -B\gamma^{-1}
   +AB
   +\gamma^{-1}I.
   \tag{2}
   $$

13. Estimate $Q$ by least squares using:

   $$
   \operatorname{Sym}[K_\tau(0,\theta)]
   =
   \operatorname{Sym}[AC+QB^T].
   \tag{12}
   $$

### Step 5 — Estimate the memoryless forcing

14. Estimate $D(\theta)$ from the fluctuation-dissipation relation:

   $$
   C'
   =
   \operatorname{Sym}
   \left(
   AC+QB^T+D
   \right).
   \tag{13}
   $$

15. If estimated $Q$ or $D$ has negative eigenvalues, the implementation adjusts them to obtain valid stochastic matrices.

### Step 6 — Select $\gamma$

16. Generate the correlation function implied by the estimated model.
17. Compare it with the observed correlation function.
18. Select:

   $$
   \widehat\gamma
   =
   \arg\min_\gamma
   \left\|
   K^{(\gamma)}-\widehat K
   \right\|_{[0,l]}.
   \tag{14}
   $$

### Step 7 — Rescale and calculate information flow

19. The appendix searches over a small set of scaling factors for $Q$ to reduce covariance mismatch after eigenvalue adjustment.
20. Insert the estimated $A,Q,D,\gamma,C$, and noise-state coupling into Eqs. (6)–(8).
21. Report state, colored-noise, and white-noise information flows by phase.

### Step 8 — Estimate uncertainty

22. Split the record into overlapping complete-cycle segments.
23. Resample their correlation functions.
24. Re-estimate the model and information flows.
25. Use the empirical bootstrap distribution to form confidence intervals.

---

## What is learned and what is observed

### Observed or directly estimated from data

- state time series $\mathbf{x}(t)$;
- seasonal covariance $C(\theta)$;
- lag correlation $K(\tau,\theta)$;
- numerical lag derivatives of $K$.

### Learned through LIM

- seasonal dynamical matrix $A(\theta)$;
- colored-noise matrix $Q$;
- white-noise matrix $D(\theta)$;
- noise-memory time $\gamma$;
- auxiliary coupling quantities.

### Calculated through LK

- state-to-state information flow;
- self-information flow;
- colored-noise entropy flow;
- white-noise entropy flow;
- normalized contributions;
- confidence intervals.

---

## Relationship with original LK

The original multivariate LK estimator uses signal and derivative covariances. This paper shows that, under stationary and white-noise assumptions, that estimator corresponds to a special LIM–LK case.

The useful conceptual identity is:

$$
\text{original LK}
\approx
\text{stationary white-noise LIM}
+\text{LK Eq. (6)}.
$$

The new framework expands this to:

- periodic dynamics;
- persistent colored noise;
- memoryless white noise;
- entropy flow from latent environmental forcing.

---

## Relationship with Hagan et al. (2019)

| Question | Hagan TvLK (2019) | Lien LIM–LK (2025) |
|---|---|---|
| Main goal | Causality at each time step | Causality at each phase of a repeated cycle |
| Main engine | Square-root Kalman filter | Cyclostationary linear inverse model |
| Covariance used | Kalman matrix $P(t)$ | Signal covariance $C(\theta)=K(0,\theta)$ |
| Dynamics | Generic state-space form; application matrices not fully specified | Explicit $A(\theta)$ estimated from lag-correlation derivatives |
| Noise | Kalman $Q(t),R(t)$ estimated offline | Persistent $Q$, memoryless $D(\theta)$, correlation time $\gamma$ |
| External-noise flow | Not separated in LK output | Colored- and white-noise flows estimated separately |
| Time meaning | Filter time index $t$ | Seasonal phase $\theta$ |
| Data mode | Recursive filter, with offline noise preprocessing | Offline batch estimation over repeated cycles |
| Kalman filter | Yes | No |

### Does this paper fill Hagan's missing implementation?

No.

It gives a much clearer and more explicit model for **its own method**, but it does not reveal:

- Hagan's exact state vector;
- Hagan's measurement vector;
- Hagan's $A,B,H$ construction;
- how Hagan produced $P_{i,dj}$.

LIM–LK is a cleaner alternative formulation, not missing documentation for TvLK.

---

## Real-data application

### Scientific question

What is the seasonal two-way causal relationship between:

- ENSO/Pacific SST;
- the Indian Ocean Dipole, represented by DMI?

The paper also asks how persistent and memoryless atmospheric forcing affect Pacific SST.

### Data and preprocessing

- Monthly Pacific SST and DMI.
- Period: 1958–2010.
- Pacific domain: $150^\circ$E–$70^\circ$W, $20^\circ$N–$20^\circ$S.
- Resolution: $2^\circ\times2^\circ$.
- Climatological mean removed.
- Three-month running average.
- Phase smoothing of the estimated cyclostationary correlation.
- Six-month comparison window used when selecting $\gamma$.
- The method is applied separately at each Pacific grid point with DMI included in the state.

### Interpretation of the model components

- Deterministic dynamics: intrinsic ocean dynamics and large-scale interbasin interaction.
- Colored noise: persistent monthly atmospheric processes or remote influences.
- White noise: short-lived atmospheric perturbations.

These interpretations are physically motivated labels for latent forcing inferred by the model; the noise components are not individually observed atmospheric processes.

---

## Main reported results

### Pacific self-causality

- Pacific SST generally stabilizes itself.
- Over Niño 3.4, this changes toward self-excitation during boreal autumn.
- The paper associates this seasonal change with ENSO phase locking.

### Indian Ocean to Pacific

- IOD influence is weaker than Pacific self-causality.
- IOD tends to excite the eastern Pacific.
- It tends to stabilize the central Pacific, especially during boreal summer and autumn.
- The influence weakens during boreal spring and winter.
- The Niño 3.4 influence is reported as weak but statistically significant during part of the developing season.

### Persistent colored forcing

- Produces strong and comparatively seasonally consistent excitation.
- Is concentrated over equatorial Pacific and Niño regions.
- Estimated noise memory is approximately one to two months.

### Memoryless white forcing

- Shows stronger seasonal modulation.
- Appears over coastal Niño regions in spring and spreads westward.
- Peaks during the period associated with the spring prediction barrier.

### Pacific to Indian Ocean

- Pacific SST excites DMI mainly from July to September.
- It stabilizes DMI from November into January.
- The paper concludes that Pacific and Indian Ocean influence is mutual but seasonally asymmetric.

---

## Predictability interpretation

The paper connects its flows with two ENSO features.

### Phase locking

The seasonal cycle of internal Pacific dynamics changes how entropy is removed or accumulated. The authors connect this with why ENSO variance tends to peak during a preferred part of the year.

### Spring prediction barrier

Memoryless noise injects unpredictable entropy during the ENSO development period, reducing short-range forecast skill.

Persistent forcing also injects entropy, but because it has memory, part of its effect can remain predictable over short leads.

The paper therefore does not treat every positive entropy input as equally damaging to prediction.

---

## What the paper contributes

1. Combines cyclostationary LIM with LK information flow.
2. Learns an explicit seasonal dynamical matrix from lag correlations.
3. Connects LK flow with a fluctuation-dissipation variance budget.
4. Separates causal contributions from state variables, persistent noise, and memoryless noise.
5. Estimates the persistence time of latent forcing.
6. Provides bootstrap confidence intervals.
7. Relates original LK and several LIM variants within one framework.
8. Applies the framework to seasonal Pacific–Indian Ocean interaction and ENSO predictability.

---

## What the paper does not establish

1. **It does not reconstruct Hagan's Kalman filter.**
2. **It is not an online or observation-by-observation method.** It estimates phase-dependent statistics from repeated cycles.
3. **It is not arbitrary nonstationarity.** It assumes a repeating cyclostationary structure.
4. **It is not nonlinear causal discovery.** The working model is linear with additive noise.
5. **It does not capture non-Gaussian structure.** Skewness and higher moments are outside the model.
6. **It does not directly observe “colored” and “white” physical processes.** They are latent model components inferred from statistics.
7. **It is sensitive to data length, sampling interval, phase smoothing, and derivative estimation.**
8. **It requires a known periodic structure.**
9. **It is not a controlled physical intervention.** Its causal output is conditional on the LIM–LK stochastic model.
10. **It does not guarantee that every physical mechanism is uniquely identifiable.** The paper discusses a basis-identification issue for colored noise and adopts normalized colored noise to avoid ambiguity.

---

## Numerical details worth knowing

- $K_\tau$ and $K_{\tau\tau}$ use forward finite differences.
- The derivative of $A$ uses a centered difference.
- Stability is checked through Floquet exponents.
- Invalid unstable estimates are returned as NaN.
- Negative eigenvalues of estimated $Q$ and $D$ are set to zero, with positive eigenvalues rescaled.
- $Q$ is rescaled after eigenvalue adjustment to reduce covariance mismatch.
- The rescaling factor is chosen from:

  $$
  \{0.8,0.9,1.0,1.1,1.2\}.
  $$

- $\gamma$ is selected by matching model-generated and observed lag correlations.

These choices matter for reproduction and should not be treated as minor implementation details.

---

## Reading path

### Abstract

**READ CAREFULLY — 3 minutes**

Own the two-stage idea:

$$
\text{LIM first, LK second}.
$$

### Section I — Introduction

**SKIM — 8 minutes**

Look for:

- the limitation of existing LK applications under persistent noise;
- why LIM is introduced;
- why cyclostationarity matters;
- the three intended outputs: state causality, environmental entropy flow, and dynamical interpretation.

Do not memorize the LiNGAM literature survey.

### Section II.A.1 — Forward LIM formulation

**READ CAREFULLY — 20 minutes**

Own Eq. (1) and the roles of:

$$
A,\quad Q,\quad D,\quad \gamma,\quad \eta,\quad \xi.
$$

Do not derive the augmented colored-noise system on the first read.

### Section II.A.2 — LK information flow

**READ MOST CAREFULLY — 20 minutes**

Own:

$$
T_{x_j\rightarrow x_i}
=
A_{ij}\frac{C_{ij}}{C_{ii}},
$$

and understand the difference among:

- state flow;
- colored-noise flow;
- white-noise flow.

Read Eq. (9) as a budget, not merely another algebraic identity.

### Section II.B — Inverse method

**READ MOST CAREFULLY — 30 minutes**

Trace:

$$
K
\rightarrow
A
\rightarrow
B
\rightarrow
Q
\rightarrow
D
\rightarrow
\gamma
\rightarrow
T.
$$

This is the operational core of the paper.

### Section II.C — Relationship with previous methods

**READ SELECTIVELY — 15 minutes**

Own:

- original LK is a special stationary white-noise case;
- different LIM choices lead to different LIM–LK variants;
- the 2025 method adds periodicity and simultaneous white/colored forcing.

The long taxonomy of LIM variants can be revisited only if implementing comparisons.

### Section III — Real-world application

**READ SELECTIVELY — 25 minutes**

Track four causal contributors:

1. target self-dynamics;
2. the other ocean basin;
3. colored noise;
4. white noise.

Focus on the Niño 3.4 monthly curves before inspecting every map.

### Section IV — Conclusion

**READ CRITICALLY — 15 minutes**

Separate:

- methodological results;
- oceanographic interpretation;
- predictability interpretation;
- stated limitations.

### Appendix A

**SKIP ON FIRST READ**

Return when deriving the forward equations.

### Appendix B

**READ CAREFULLY FOR IMPLEMENTATION — 20 minutes**

This contains:

- finite-difference choices;
- stability checks;
- eigenvalue corrections;
- $Q$ rescaling;
- $\gamma$ selection details.

Estimated reading time after basic LK: **about two to three hours**.

---

## Minimal foundations required

Before reading deeply, understand:

1. covariance and lagged covariance;
2. a linear state equation;
3. white noise versus temporally correlated noise;
4. periodic statistics;
5. positive versus negative LK flow;
6. numerical differentiation at a basic level.

You do not need to complete measure-theoretic probability, stochastic calculus, or a full statistical-physics course before understanding the paper's main method.

---

## Post-reading checkpoint

After reading, be able to answer:

1. Why does the paper estimate a dynamical model before calculating LK flow?
2. What is the difference between $A(\theta)$ and $C(\theta)$?
3. Why are both present in $T_{x_j\rightarrow x_i}$?
4. What is the difference between colored and white noise?
5. Why can colored-noise flow be stabilizing or exciting?
6. Why is white-noise flow always positive in this formulation?
7. How is $\gamma$ selected?
8. Why does the method require repeated cycles?
9. What does Eq. (9) say about the target's variance budget?
10. Why is this method offline rather than a streaming filter?
11. What does the ENSO–IOD application actually demonstrate?
12. Why does this paper not solve Hagan's missing state-vector problem?

---

## Final takeaway

Hagan TvLK says:

$$
\text{use a Kalman covariance }P(t)
\text{ inside LK}.
$$

Lien LIM–LK says:

$$
\text{learn explicit seasonal dynamics and noise from lag correlations,}
$$

then:

$$
\text{calculate LK flow from the learned dynamics and signal covariance}.
$$

The second route is more explicit and easier to audit, but it answers a seasonal batch-estimation problem rather than reproducing Hagan's time-indexed Kalman method.
