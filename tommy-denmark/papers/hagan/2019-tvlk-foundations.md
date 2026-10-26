# Foundations for the 2019 Time-Varying Liang–Kleeman Paper

## Scope

This file contains only the foundations needed to read:

> Hagan, Wang, Liang, and Dolman (2019), *A Time-Varying Causality Formalism Based on the Liang–Kleeman Information Flow for Analyzing Directed Interactions in Nonstationary Climate Systems*.

[Official paper](https://doi.org/10.1175/JCLI-D-18-0881.1) · [Local paper text](/home/abhi/code/defence/defence/learning/deep-stats-learning/signal-processing/weather-data/hagan-paper/paper-dump.md)

It does not attempt to teach causal inference generally. The goal is to make the paper's equations and algorithm readable without detours.

---

## Foundation map

| Module | Depth | What must be owned |
|---|---:|---|
| 1. Correlation versus directed influence | MUST | Explain why co-movement alone gives no direction |
| 2. Stationary versus time-varying relationships | MUST | Explain why one covariance over the whole record can hide changing coupling |
| 3. A time series and its derivative series | MUST | Construct $\dot X_j$ and interpret $C_{i,dj}$ |
| 4. Where covariance comes from (and why LK uses it) | MUST | Understand that covariance is the arithmetic tool to estimate the physical push $a_{12}$ |
| 5. LK information flow | MUST | Explain Eqs. (7)–(8), including sign, magnitude, and units |
| 6. How the Kalman filter provides time-varying covariance | MUST | Explain why $P(t)$, not the filtered mean, is inserted into the LK formula |
| 7. The state-vector question: how $P$ contains derivative entries | MUST | Understand the augmented state and the paper's omission |
| 8. Why $P(t)$ is not "covariance from one point" | MUST | Explain the recursive memory and the historical window |
| 9. Process and measurement noise covariance | MUST | Explain why $Q(t)$ and $R(t)$ control the TvLK result |
| 10. Square-root/UD filtering | SKIM | Know why $P=UDU^T$ is propagated; skip the factor-update derivation |
| 11. Wavelet postprocessing | SKIM | Know what time-frequency decomposition adds and what it does not add |
| 12. Significance testing | SKIM | Know that nonzero numerical output is insufficient without uncertainty testing |

Suggested preparation time: **90–120 minutes** if covariance and Kalman filtering are already familiar.

---

## 1. Correlation is symmetric; causal direction is not

Suppose soil moisture $X_1$ and air temperature $X_2$ move together.

Their covariance satisfies

$$
C_{12}=C_{21}.
$$

Therefore covariance cannot distinguish

$$
X_1\rightarrow X_2
\qquad\text{from}\qquad
X_2\rightarrow X_1.
$$

The paper needs two separate quantities:

$$
T_{2\rightarrow1}
\qquad\text{and}\qquad
T_{1\rightarrow2}.
$$

They need not be equal. This asymmetry is the first reason for using Liang–Kleeman information flow rather than correlation alone.

### Physical example: a heater and a room

- $X_2(t)$: Heater dial setting (0 = OFF, 10 = MAX).
- $X_1(t)$: Room temperature.

If you plot heater vs. room temperature over a day, they correlate. But $\text{Cov}(X_1, X_2) = \text{Cov}(X_2, X_1)$. The number cannot tell you whether the heater is warming the room or the room is somehow turning up the heater. You need a method that can produce two different numbers for the two directions.

**Deliverable:** Explain why a large $C_{12}$ can establish association but cannot determine who drives whom.

---

## 2. One full-record covariance can hide a changing relationship

Consider a relationship that switches halfway through a record:

$$
X_1(t+1)=
\begin{cases}
+X_2(t)+\epsilon(t), & t<500,\\
-X_2(t)+\epsilon(t), & t\ge 500.
\end{cases}
$$

During the first half, high $X_2$ tends to increase $X_1$. During the second half, high $X_2$ tends to decrease $X_1$.

If one covariance is calculated from all 1000 points, the positive and negative periods can partially cancel. The final statistic can suggest weak coupling even though the relationship was strong at every time.

This is the distinction:

- **Stationary LK:** one set of covariance terms $C_{ij}$ for the record.
- **TvLK:** changing covariance terms $P_{ij}(t)$, producing $T_{2\rightarrow1}(t)$.

TvLK is trying to preserve changing direction and strength instead of averaging them away.

It still cannot estimate covariance from one scalar observation. Its time-local estimate borrows information through the recursive filter and through the historical window used to estimate $Q(t)$ and $R(t)$.

**Deliverable:** Explain why "one causal number for the entire record" may be misleading for seasonal or regime-changing climate interactions.

---

## 3. The derivative series

### What is it?

For an equally spaced time series $X_j$, the paper constructs the forward rate of change:

$$
\dot X_j(t)
=
\frac{X_j(t+k\Delta t)-X_j(t)}
{k\Delta t}.
$$

The later 2024 paper writes the same object as $\dot X_j$.

For $k=1$ and daily observations ($\Delta t = 1$):

$$
\dot X_1(t)=X_1(t+1)-X_1(t)
$$

in units of $X_1$ per day.

### Why does LK need the derivative?

Back to the heater example:

- **Standard covariance** $\text{Cov}(X_2, X_1)$: Compares heater setting right now with room temperature right now. Symmetric: tells you they move together, not who drives whom.
- **Derivative cross-covariance** $\text{Cov}(X_2, \dot X_1)$: Compares heater setting right now ($X_2$) with how fast the room temperature is about to rise ($\dot X_1$).

If turning up the heater ($X_2$ high) causes the room temp to start rising faster ($\dot X_1$ high), then $\text{Cov}(X_2, \dot X_1) > 0$.

Now flip it: $\text{Cov}(X_1, \dot X_2)$ compares room temperature right now with how fast the heater dial is changing. The room does not physically turn the heater dial, so this would be near zero.

**This asymmetry is the key.** $\text{Cov}(X_2, \dot X_1)$ and $\text{Cov}(X_1, \dot X_2)$ are generally different numbers. That breaks the symmetry that plain covariance cannot break.

### Cross-covariance notation

$$
C_{2,d1}
=
\mathrm{Cov}(X_2,\dot X_1)
$$

asks:

> When $X_2$ is above or below its mean, does the subsequent rate of change of $X_1$ also tend to be above or below its mean?

The `d1` does **not** mean "day one." It means "derivative of variable 1."

### Toy values

$$
X_2=[-1,0,1,2],
\qquad
\dot X_1=[-2,0,2,4].
$$

Both rise together, so $C_{2,d1}>0$. This is more directional than $\mathrm{Cov}(X_1,X_2)$ because it connects the present value of $X_2$ with the change of $X_1$.

However, $C_{2,d1}>0$ alone still does not prove $X_2\rightarrow X_1$. It can be produced by:

- $X_1$'s own persistence;
- correlation between $X_1$ and $X_2$;
- or a third variable driving both.

The full LK estimator combines $C_{2,d1}$ with $C_{1,d1}$, $C_{11}$, $C_{22}$, and $C_{12}$ to isolate the contribution of $X_2$.

**Deliverable:** Given two short time series, construct $\dot X_1$ and explain what $C_{2,d1}$ measures.

---

## 4. Where does covariance come from, and why does LK use it?

### The foundational question

You might ask: "Why is LK built on covariance at all? Is covariance the definition of causality?"

**No.** Covariance is not the definition. It is the arithmetic tool used to estimate a physical parameter from data.

### The physical starting point

Liang started from a physical rate equation (a linear stochastic differential equation):

$$
\frac{dX_1}{dt}
=
f_1+a_{11}X_1+a_{12}X_2+\text{noise}.
$$

The parameter $a_{12}$ is the **physical push**: how much $X_2$ contributes to the rate of change of $X_1$.

- If $a_{12}=0$: $X_2$ has zero physical push on $X_1$, regardless of correlation.
- If $a_{12}>0$: $X_2$ pushes $X_1$'s rate of change upward.
- If $a_{12}<0$: $X_2$ pushes $X_1$'s rate of change downward.

### The problem: you don't know $a_{12}$

You observe $X_1(t)$ and $X_2(t)$ from sensors. You do not observe $a_{12}$ directly. So you need to solve for it from measured data.

### How to solve for $a_{12}$ from data

From the linear model, you can write a system of equations relating $a_{12}$ to the sample covariances. Solving gives:

$$
\widehat a_{12}
=
\frac{
-C_{12}C_{1,d1}+C_{11}C_{2,d1}
}{
C_{11}C_{22}-C_{12}^{2}
}.
$$

**This is where covariance enters.** Covariance terms ($C_{11}, C_{12}, C_{22}, C_{1,d1}, C_{2,d1}$) are the measurable statistics that let you back-calculate the unmeasurable physical push $a_{12}$.

### How covariance is calculated in original (static) LK

In original LK, covariance is calculated using the standard formula over the **entire time series**:

$$
C_{12} = \frac{1}{N-1} \sum_{t=1}^{N} (X_1(t) - \bar{X}_1)(X_2(t) - \bar{X}_2)
$$

This requires many data points and their means $\bar{X}_1, \bar{X}_2$. It gives **one single, constant number** for the whole record.

### Key assumption

The entire LK framework assumes that the relationship between $X_1$ and $X_2$ is **linear**. If the real system is wildly nonlinear, this linear model is a simplified approximation.

**Deliverable:** Explain that covariance is the tool to estimate $a_{12}$, not the definition of causality itself.

---

## 5. From $a_{12}$ to information flow

The population LK information flow is:

$$
T_{2\rightarrow1}
=
\frac{\sigma_{12}}{\sigma_{11}}a_{12}.
$$

This equation combines:

1. **Dynamic influence:** $a_{12}$.
2. **How the two variables are statistically arranged:** $\sigma_{12}/\sigma_{11}$.

If $a_{12}=0$, then $T_{2\rightarrow1}=0$, even when $X_1$ and $X_2$ are correlated. This is the paper's "nil-causality" idea for the assumed system.

### The full bivariate estimator (Eq. 8)

Substituting $\widehat a_{12}$ gives:

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

The reverse direction is obtained by switching indices:

$$
T_{1\rightarrow2}
=
\frac{C_{21}}{C_{22}}
\frac{
-C_{21}C_{2,d2}+C_{22}C_{1,d2}
}{
C_{22}C_{11}-C_{21}^{2}
}.
$$

### The five covariance terms

For $T_{2\rightarrow1}$, you need exactly these five numbers:

| Term | Meaning |
|---|---|
| $C_{11}$ | Variance of $X_1$ |
| $C_{22}$ | Variance of $X_2$ |
| $C_{12}$ | Covariance between $X_1$ and $X_2$ |
| $C_{1,d1}$ | Covariance between $X_1$ and $\dot X_1$ (how $X_1$'s current value relates to its own rate of change) |
| $C_{2,d1}$ | Covariance between $X_2$ and $\dot X_1$ (how $X_2$'s current value relates to $X_1$'s rate of change) |

### What the result means

The unit is **nats per unit time**.

- $T_{2\rightarrow1}>0$: $X_2$ contributes to increasing the marginal entropy or uncertainty of $X_1$.
- $T_{2\rightarrow1}<0$: $X_2$ contributes to reducing or stabilizing that entropy.
- $T_{2\rightarrow1}=0$: no information flow under the assumed model.
- $|T_{2\rightarrow1}|$: strength of the information-flow rate.

The sign is about entropy change. It does not mean that $X_2$ physically increases or decreases the numerical value of $X_1$.

This is also not the statement:

> Increasing $X_2$ by one physical unit changes $X_1$ by exactly $T_{2\rightarrow1}$ units.

That physical response coefficient is closer to $a_{12}$; LK information flow is an entropy-rate quantity.

**Deliverable:** Starting from $\widehat a_{12}$, explain every term in $T_{2\rightarrow1}$ and interpret positive, negative, and zero values.

---

## 6. The Kalman filter has a different role here

### Why does the 2019 paper need a Kalman filter at all?

In original LK, you compute the five covariance terms ($C_{11}, C_{22}, C_{12}, C_{1,d1}, C_{2,d1}$) once over the entire record using the sample mean. That gives one static answer.

The 2019 paper wants those five numbers to **change at every time step**. It needs a machine that takes data step by step and outputs an updated covariance matrix at each step.

That machine is the Kalman filter. The paper is **not** using the Kalman filter to forecast soil moisture or temperature. It is using the Kalman filter as a **covariance-tracking machine**.

### The Kalman recursion

The ordinary prediction and correction equations are:

$$
\widehat x_k^-
=
A\widehat x_{k-1}+Bu_k,
$$

$$
P_k^-
=
AP_{k-1}A^T+Q_k,
$$

$$
K_k
=
P_k^-H^T
\left(HP_k^-H^T+R_k\right)^{-1},
$$

$$
\widehat x_k
=
\widehat x_k^-+K_k(y_k-H\widehat x_k^-),
$$

$$
P_k
=
(I-K_kH)P_k^-.
$$

### What matters for TvLK

- $\widehat x_k$ is an internal filtered state estimate. It feeds forward to the next step. It is **not** the final scientific output.
- $P_k$ is the error covariance matrix. This is the part inserted into the causal estimator.
- $T_{2\rightarrow1}(t)$ and $T_{1\rightarrow2}(t)$ are the scientific outputs.

The paper replaces the fixed sample-covariance entries $C$ in Eq. (8) with time-indexed covariance entries from $P$:

$$
T_{2\rightarrow1}(t)
=
\frac{P_{12}(t)}{P_{11}(t)}
\frac{
-P_{12}(t)P_{1,d1}(t)
+P_{11}(t)P_{2,d1}(t)
}{
P_{11}(t)P_{22}(t)-P_{12}^{2}(t)
}.
$$

Do not confuse $P_k$ here with an EnKF analysis covariance being used to update a physical weather ensemble. The authors are using its entries as time-local substitutes for the covariance terms required by LK.

**Deliverable:** Explain precisely why the paper runs a Kalman filter and identify which filter output enters Eq. (15).

---

## 7. The state-vector question: how $P$ contains derivative entries

### The critical question

The TvLK formula needs these entries from $P(t)$:

$$
P_{11},\;P_{22},\;P_{12},\;P_{1,d1},\;P_{2,d1},
$$

and the corresponding terms for the reverse direction.

But the Kalman filter only produces covariance entries between things that are **in the state vector**. If the state vector only contains $X_1$ and $X_2$, you get a $2 \times 2$ matrix. That matrix does not contain $P(X_2, \dot X_1)$.

So: **how does $P$ contain derivative entries?**

### The answer: the derivatives must be inside the Kalman filter somehow

For the Kalman filter to produce $P(X_2, \dot X_1)$, the derivative $\dot X_1$ must be part of the filter's state or observation pipeline. There are two standard ways to do this:

**Option A: Pre-calculate derivatives and include them as observations.** Since you have the full recorded time series, you can compute $\dot X_1(t) = X_1(t+1) - X_1(t)$ before running the filter. Then the observation vector at time $t$ contains all four values: $X_1, X_2, \dot X_1, \dot X_2$. The filter state vector is also four-dimensional, and $P$ is $4 \times 4$.

**Option B: Let the state transition matrix $A$ encode the physics.** You include $\dot X_1$ in the state vector but only observe $X_1$ and $X_2$ directly. The matrix $A$ contains the kinematic link $X_1(t+1) = X_1(t) + \Delta t \cdot \dot X_1(t)$, and the Kalman gain automatically updates $\dot X_1$ through the cross-covariance in $P^-$.

### What the paper says (and does not say)

> **The article presents the generic Kalman equations but does not spell out, component by component, the exact augmented state vector, measurement vector, and matrices ($A$, $B$, $H$) used to produce all these entries.**

This is stated explicitly as a reproducibility gap. The paper writes down:

- the generic state-space model;
- the generic Kalman recursion;
- the covariance entries required by Eq. (15);
- and the EWMA/UWMA approach for $Q(t)$ and $R(t)$.

It does **not** give:

- the exact augmented state vector;
- the exact measurement vector;
- every entry of $A$, $B$, and $H$;
- the exact offline $Q(t)$/$R(t)$ calculation for each experiment.

**This is a limitation of the method description, not a foundation the reader has failed to understand.** If you feel confused about how the state vector is constructed, that confusion is correct — the paper left this out. Do not silently invent that mapping while reading. Mark it as an implementation detail that requires the authors' code or a later methodological clarification.

**Deliverable:** Explain why the state vector must include derivative variables and identify what the paper omits about its exact construction.

---

## 8. Why $P(t)$ is not "covariance from one point"

### The trap

When the paper says "at time $t$, use $P(t)$ to compute $T_{2\rightarrow1}(t)$," it sounds like you are computing covariance from a single data point at time $t$.

**That is mathematically impossible.** Variance and covariance require multiple data points. You cannot compute $\text{Var}(X)$ from one number.

### Where $P(t)$ actually gets its numbers

$P(t)$ is **not** a sample covariance calculated from time $t$ alone. It gets its numbers from two sources of history:

**Source 1: Recursive memory ($P_{t-1} \rightarrow P_t$).**

$$
P_t^- = AP_{t-1}A^T + Q_t
$$

$P(t)$ at time 100 is built on top of $P(99)$, which was built on $P(98)$, all the way back to your initial setup $P(0)$. The Kalman recursion carries the accumulated history of all past steps forward through time.

**Source 2: The historical window for $Q(t)$ and $R(t)$.**

To run the Kalman filter at time $t$, you need the process noise $Q(t)$ and measurement noise $R(t)$. The authors estimate these using a **sliding historical window** (e.g., a 30-day or 50-day lookback window of past data points, via EWMA or UWMA).

### Comparison

| Method | What provides the covariance | Result |
|---|---|---|
| **Original LK** | Standard sample formula over all $N$ points using the global mean $\bar{X}$ | One static covariance $C$ for the entire record |
| **2019 TvLK** | Kalman recursive memory $P_{t-1}$ + sliding window for $Q(t)$, $R(t)$ | A time-varying covariance $P(t)$ at every step |

### Consequences

1. TvLK is not using only one observation at time $t$.
2. The early part of the causal series is unavailable because the moving average needs initial history.
3. Responsiveness and noise are controlled partly by the window and smoothing choices.

**Deliverable:** Explain why $P(t)$ is not computed from a single point and identify the two sources of historical information it relies on.

---

## 9. Why $Q(t)$ and $R(t)$ matter so much

In the filter:

- $Q_k$ describes uncertainty added by the process evolution.
- $R_k$ describes uncertainty in the measurement equation.

They affect

$$
P_k^-=AP_{k-1}A^T+Q_k
$$

and

$$
K_k=P_k^-H^T(HP_k^-H^T+R_k)^{-1}.
$$

They therefore affect $P_k$, and $P_k$ directly determines TvLK. Poor $Q_k$ or $R_k$ estimates can produce poor causal estimates.

The authors do not keep $Q$ and $R$ constant. They estimate them offline at each time using smoothed surrogates based on:

- exponentially weighted moving averages (EWMA);
- or unweighted moving averages (UWMA).

This introduces a lookback-window choice. The consequences are:

1. TvLK is not using only one observation at time $t$.
2. The early part of the causal series is unavailable because the moving average needs initial history.
3. Responsiveness and noise are controlled partly by the window and smoothing choices.
4. The paper explicitly reports that accuracy is highly dependent on estimating $Q$ and $R$ well.

The 2019 paper considered forward-backward smoothing to fill the missing beginning but did not adopt it. The 2024 extension later used a backward calculation, while warning that the reverse-time part is weak for physical interpretation.

**Deliverable:** Trace how changing $Q_k$ or $R_k$ changes $P_k$ and therefore changes the reported causal information flow.

---

## 10. Square-root filtering: what to know and what to skip

The standard covariance recursion can accumulate round-off errors and lose symmetry or positive definiteness.

The paper propagates a modified Cholesky factorization:

$$
P=UDU^T,
$$

where:

- $U$ is unit upper triangular;
- $D$ is diagonal.

The Bierman update handles the measurement step. The Thornton update handles the time step.

For this paper, the conceptual point is:

> The square-root/UD implementation is intended to calculate the same Kalman covariance more robustly; it does not define a new form of causality.

Safe to black-box on the first read:

- the rank-one factor updates;
- Eqs. (A2)–(A8);
- the detailed Bierman–Thornton implementation.

Do not black-box:

- why the factorization is used;
- that Eq. (15) ultimately requires the reconstructed entries of $P$.

**Deliverable:** Explain the numerical purpose of $P=UDU^T$ without deriving the UD algorithm.

---

## 11. Wavelet analysis is postprocessing

TvLK produces a causal time series:

$$
T_{2\rightarrow1}(t).
$$

The authors then apply a continuous wavelet transform:

$$
T_{2\rightarrow1}(t)
\longrightarrow
W_{2\rightarrow1}(t,s),
$$

where $s$ represents scale.

This answers:

> At which times, and at which approximate periods or frequencies, is the causal signal active?

Example:

- TvLK: $X_1\rightarrow X_2$ is significant during the second half.
- Wavelet result: that signal is concentrated near $0.1$ Hz.

The wavelet transform does **not**:

- create causal direction;
- estimate the Kalman covariance;
- remove a common driver;
- or turn an insignificant TvLK signal into established causality.

The paper calls TvLK plus this spectral postprocessing **TFvLK**.

**Deliverable:** Explain the difference between detecting when causality occurs and identifying the time scale on which its signal varies.

---

## 12. A nonzero estimate is not automatically significant

Sampling noise can produce a nonzero $T_{2\rightarrow1}$ even when the true flow is zero.

For the time-domain TvLK result, the paper obtains uncertainty using a Fisher-information calculation derived from the maximum-likelihood estimator.

For the wavelet result, it uses Monte Carlo significance testing.

The reading-level requirement is:

> Causality is reported only when the magnitude of the estimated information flow exceeds its significance threshold.

The detailed Fisher-information derivation in Appendix C can be black-boxed on the first read. Retain its assumptions:

- large-sample asymptotic normality;
- the assumed stochastic/linear estimation model;
- correct construction of the derivative and covariance terms.

**Deliverable:** Explain why $T_{2\rightarrow1}(t)\ne0$ is not sufficient evidence by itself.

---

## Context: LK is not the only causality method

There are four major frameworks for time-series causality. LK is one of them:

| Method | How it defines "who is driving whom" |
|---|---|
| **Granger Causality** | Prediction: does knowing past $X_2$ help predict future $X_1$ better than past $X_1$ alone? |
| **Transfer Entropy** | Information: how much does knowing $X_2$'s history reduce the uncertainty of future $X_1$? |
| **PCMCI** | Independence: tests conditional independence across many variables to eliminate fake links. |
| **Liang–Kleeman (LK)** | Physics / Differential Equations: models the system as a continuous rate equation and computes entropy flow rate. |

LK's distinguishing feature is that it starts from a physical dynamical equation and derives a closed-form estimator. Its limitation is the linear assumption.

---

## Foundation closure checklist

Before reading the paper, be able to answer:

1. Why can $C_{12}$ not distinguish $X_1\rightarrow X_2$ from $X_2\rightarrow X_1$?
2. What exactly is $\dot X_1$, and what does $C_{2,d1}$ measure?
3. Why does LK use covariance? (Answer: to estimate the physical push $a_{12}$, not as the definition of causality.)
4. In the linear model, what is the difference between $a_{12}$ and $T_{2\rightarrow1}$?
5. Why can one full-record LK estimate miss a relationship that switches with time?
6. Which Kalman output is inserted into TvLK: $\widehat x_k$, $K_k$, or $P_k$?
7. Why does $P(t)$ need the derivative variables inside the state vector or observation pipeline?
8. Why is $P(t)$ not "covariance from one point"? What are its two sources of historical information?
9. Why does selecting $Q_k$, $R_k$, and a lookback window affect the causal result?
10. What does a negative information flow mean?
11. What extra information does the wavelet transform add?
12. What did the paper omit about the exact state-space construction?

If questions 2–9 are unclear, they are genuine blockers for Section 2 of the paper. The UD-factor derivation and Fisher-information derivation are not blockers for the first read.
