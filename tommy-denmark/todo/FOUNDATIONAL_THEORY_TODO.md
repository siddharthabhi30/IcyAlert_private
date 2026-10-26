# Foundational Theory & Mathematical Statistics Learning TODO

> **Location**: `research/tommy-denmark/todo/FOUNDATIONAL_THEORY_TODO.md`  
> **Topic**: Academic statistical theory and mathematical physics prerequisites behind Liang-Kleeman causality and ensemble meta-analysis.

---

## 📋 Learning Roadmap

```
  ┌────────────────────────────────────────────────────────────┐
  │  Module 1: Non-Parametric Bootstrap Resampling             │
  │  (Uncertainty estimation without distribution assumptions) │
  └─────────────────────────────┬──────────────────────────────┘
                                │
  ┌─────────────────────────────▼──────────────────────────────┐
  │  Module 2: Hypothesis Testing & Wald Z-Test                │
  │  (Determining if causal links are nonzero, p-values)       │
  └─────────────────────────────┬──────────────────────────────┘
                                │
  ┌─────────────────────────────▼──────────────────────────────┐
  │  Module 3: Fisher's Combined Probability Meta-Analysis     │
  │  (Combining 50 independent ensemble p-values)              │
  └─────────────────────────────┬──────────────────────────────┘
                                │
  ┌─────────────────────────────▼──────────────────────────────┐
  │  Module 4: SDEs & Information Flow Formalism               │
  │  (Liang 2014, 2021 matrix cofactors & transfer rate)       │
  └─────────────────────────────┬──────────────────────────────┘
                                │
  ┌─────────────────────────────▼──────────────────────────────┐
  │  Module 5: Dynamic Filter Error Covariance (IcyAlert)      │
  │  (Replacing sample cov C with Kalman error covariance P)   │
  └────────────────────────────────────────────────────────────┘
```

---

## 1. Module 1: Bootstrap Resampling Theory
* **Core Reference**: Efron, B. (1979). *"Bootstrap methods: another look at the jackknife."* The Annals of Statistics.
* **Concepts to Master**:
  - [ ] Non-parametric empirical distribution function $\hat{F}_n$.
  - [ ] Sampling with replacement $B = 1000$ times.
  - [ ] Standard error estimation $\text{SE}(\hat{\tau}) = \sqrt{\frac{1}{B-1}\sum_{b=1}^B (\tau^{*b} - \bar{\tau}^*)^2}$.
  - [ ] Block bootstrapping for autocorrelated time series.
* **Practical Check**: Write a 5-line script with `scipy.stats.bootstrap` to compute confidence intervals on a toy autoregressive series.

---

## 2. Module 2: Wald / $Z$-Test & $p$-Value Calculation
* **Core Reference**: Altman, D. G., & Bland, J. M. (2011). *"How to obtain the P value from a confidence interval."* BMJ, 343:d2304.
* **Concepts to Master**:
  - [ ] Null hypothesis definition: $H_0: \tau = 0$ (no causality).
  - [ ] Standard normal test statistic: $z = \frac{\hat{\tau}}{\text{SE}(\hat{\tau})}$.
  - [ ] Numerical approximation for 2-sided $p$-value:
    $$p \approx \exp\left(-0.717 |z| - 0.416 z^2\right)$$
  - [ ] Relationship between 95% confidence intervals ($z > 1.96$) and significance threshold $\alpha = 0.05$.

---

## 3. Module 3: Fisher's Combined Probability Test
* **Core Reference**: Fisher, R. A. (1925). *"Statistical Methods for Research Workers."* Oliver and Boyd.
* **Concepts to Master**:
  - [ ] Why simple averaging of $p$-values is mathematically invalid.
  - [ ] Probability Integral Transform: If $H_0$ is true, $p_i \sim \text{Uniform}(0, 1)$.
  - [ ] Log-transform property: $-2 \ln(p_i) \sim \chi^2_2$ (Chi-squared with 2 degrees of freedom).
  - [ ] Sum of $k = 50$ independent tests:
    $$X^2 = -2 \sum_{i=1}^k \ln(p_i) \sim \chi^2_{2k} \quad (\text{with } 2k = 100 \text{ degrees of freedom})$$
  - [ ] Using `scipy.stats.combine_pvalues(p_list, method='fisher')`.

---

## 4. Module 4: Stochastic Differential Equations & Liang-Kleeman Math
* **Core References**:
  1. Liang, X. S. (2014). *"Unraveling the cause-effect relation between time series."* Physical Review E, 90(5), 052150.
  2. Liang, X. S. (2021). *"Normalized multivariate time series causality analysis and causal graph reconstruction."* Entropy, 23(6), 679.
* **Concepts to Master**:
  - [ ] Linear Langevin system: $dx_i = \left( f_i + \sum_k a_{ik} x_k \right) dt + dw_i$.
  - [ ] State covariance $C$ and state-tendency covariance $dC$.
  - [ ] Invariance under coordinate transformations.
  - [ ] Cofactor matrix derivation $\Delta = \det(C) \cdot (C^{-1})^T$.
  - [ ] Normalizer $Z_i$ and the distinction between information transfer ($T$) vs correlation ($R$).

---

## 5. Module 5: Bridge to Kalman Filtering (For IcyAlert)
* **Goal**: Transitioning from offline climate simulations to real-time state estimation.
* **Concepts to Master**:
  - [ ] Difference between **Sample Covariance** ($C = \frac{1}{N-1} X_{\text{cen}} X_{\text{cen}}^T$) and **Filter Error Covariance** ($\mathbf{P}^f = \mathbb{E}[(x - x^f)(x - x^f)^T]$).
  - [ ] Online causality tracking: Plugging $\mathbf{P}_t$ and $\dot{\mathbf{P}}_t$ directly into Liang's matrix equation at every time step $t$.
  - [ ] Eliminating the need for 50 pooled ensemble runs.
