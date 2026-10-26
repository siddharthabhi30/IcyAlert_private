The missing foundation is probably this distinction:

> **A system has both a value that evolves and a probability distribution that evolves.**

LK is mainly about the **distribution**, not simply the observed value.

Imagine many possible versions of tomorrow’s \(X\):

- Without influence from \(Y\): \(X_{\text{next}}\) lies around \(10\pm1\).
- With influence from \(Y\): \(X_{\text{next}}\) lies around \(10\pm5\).

The mean remains 10, but \(Y\) has made \(X\) more uncertain. LK calls this **positive entropy flow from \(Y\) to \(X\)**.

If \(Y\) instead narrows the possibilities from \(10\pm5\) to \(10\pm1\), it stabilises \(X\): negative entropy flow.

So LK is not primarily asking:

- Did \(X\) increase?
- Did \(X\) and \(Y\) move together?
- Can we accurately predict the next \(X\)?

It asks:

> **Does the dynamical influence of \(Y\) widen or narrow the possible values of \(X\)?**

For linear-Gaussian systems, “widen or narrow” is closely connected to variance/covariance. That is why covariance enters the formula.

The foundations to understand, in order, are:

1. One observed value versus a distribution of possible values.
2. Variance as spread and entropy as uncertainty.
3. How a dynamical equation allows \(Y\) to affect the future of \(X\).
4. Why correlation alone is not directed causality.
5. How LK combines the dynamics and covariance into entropy flow.

The **first distinction—value versus distribution—is the premise everything else rests on.**

[MAP]

1. **Foundation — Association vs dynamics**
   Covariance asks whether (X) and (Y) vary together; dynamics asks whether present (Y) helps determine how (X) changes next.
   **DELIVERABLE:** Explain why correlation cannot establish (Y\to X).

2. **Foundation — A variable versus its distribution**
   Separate one observed value of (X) from the collection of possible values represented by (p(X)).
   **DELIVERABLE:** Explain what “uncertainty of (X)” means without confusing it with movement away from the mean.

3. **Foundation — Entropy and entropy-change rate**
   Entropy measures the spread/uncertainty of a distribution; (\frac{dH_X}{dt}) measures how that uncertainty changes as the system evolves.
   **DELIVERABLE:** Interpret increasing or decreasing entropy intuitively.

4. **Foundation — Decomposing the evolution of (X)**
   Understand the picture
   [
   X_{\text{next}}
   =\text{(X)'s own effect}+\text{(Y)'s effect}+\text{noise}.
   ]
   **DELIVERABLE:** Identify what it means for (Y) to participate in (X)'s dynamics.

5. **Main event — Liang–Kleeman information flow**
   LK asks how much the (Y)-dependent part of the dynamics contributes to the entropy change of (X).
   **DELIVERABLE:** State precisely what (T_{Y\to X}) measures and what it does **not** measure.

6. **Main event — Why coefficients and covariance both appear**
   The coupling coefficient describes how (Y) enters (X)'s equation; covariance describes the present statistical arrangement of the variables.
   **DELIVERABLE:** Explain why LK flow is not merely covariance and not merely the coupling coefficient.

7. **Main event — Stationary versus time-varying causality**
   Ordinary LK estimates one overall flow; this paper wants (T_{Y\to X}(t)), which may change over time.
   **DELIVERABLE:** Explain the exact limitation the paper is fixing.

8. **Method — Kalman filter and wavelets**
   The Kalman filter updates the estimated relationship over time; wavelets reveal whether changes occur over days, seasons, or longer scales.
   **DELIVERABLE:** Explain why each tool is added after LK.

Which module do we open?
