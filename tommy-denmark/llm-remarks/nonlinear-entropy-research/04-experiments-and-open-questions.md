# Experiments suggested by the evidence

Proposed tests, not team decisions. Completed checks used synthetic benchmark data, not climate observations.

## 1. Choose the output

The immediate choice is between:

| Output | What we would measure | Natural starting point |
|---|---|---|
| \(H(X_t)\) | The uncertainty of a variable at each time | KNIFE or REMEDI |
| \(dH(X_t)/dt\) | Its change through physical time | Consecutive entropy estimates, or dynamics/score-based entropy balance |
| \(T_{j\to i}(t)\) | A driver's contribution under the LK definition | Pires's drift/diffusion and conditional-average formulas |
| \(\mathrm{TE}_{j\to i}\) | Whether past driver values improve the next prediction | TENDE, conditional-MI methods |

Nir's entropy question corresponds to row one, with public code; driver-specific LK is row three. Entropy checks test a component only.

## 2. Completed component checks

**Learned entropy:** the KNIFE author class estimated three known Gaussian entropies within about \(0.01\) nat in this one-seed check. The REMEDI author network also corrected the entropy of a bimodal distribution to 1.422 nats against a numerical reference of 1.419.

**Nonlinear transfer:** the independent Lorenz script estimated \(X_3\to X_2\) using fitted conditional averages. It also fitted the drift from sample increments and applied the termwise transfer formula. Its linear covariance comparison was near zero while nonlinear estimates were negative.

Substantial conditional-degree sensitivity requires derivative checks; it does not establish a universally best regression degree.

## 3. Next test for entropy changing over time

Use a controlled process with an analytic evolving distribution. An Ornstein–Uhlenbeck relaxation supplies a simple first check:

\[
dX=-\lambda X\,dt+\sqrt{2D}\,dW.
\]

For initial variance \(v_0\),

\[
v(t)=\frac{D}{\lambda}
+\left(v_0-\frac{D}{\lambda}\right)e^{-2\lambda t},
\]

and its one-dimensional Gaussian entropy is

\[
H(t)=\frac12\log(2\pi e\,v(t)).
\]

Generate an ensemble, estimate entropy separately at each physical time, and compare the entropy curve and interval differences with the analytic values. Split ensemble members for fitting/evaluation. Do not pool all dates and then call that a current-time distribution.

Not run. The linear model provides a known entropy reference, not a nonlinear-causality test.

## 4. Next test for online nonlinear LK

Start with a known nonlinear system and a transient ensemble. At each time \(t\), use members at that same time to represent \(p_t(X)\).

A concrete first case is a two-variable system with constant additive process noise. For its target \(X_1\), the deterministic/total driver transfer can be evaluated through the appropriate two-variable CSM formula:

\[
T_{2\to1}(t)=
E_{p_t}\!\left[
\frac{d}{dX_1}E_{p_t}[F_1(X,t)\mid X_1]
-\frac{\partial F_1}{\partial x_1}(X,t)
\right].
\]

First use the known \(F_1\) to test the conditional-statistics estimator. Only then fit \(F_1\) from member-matched successive states. The increment target becomes available after the next sample; “current-time” estimation may therefore carry a one-step delay unless the tendency is supplied.

A DNN implementation could use smooth networks for the drift and conditional average, with automatic differentiation. This would be an implementation and validation task based on Pires's formula; this search did not find a verified author package already performing that entire online climate workflow.

For three or more variables, use the individual-transfer formulas with the outer-variable averaging. Do not use the collective Equation 11 and name it one driver's result.

## 5. How to test whether the number deserves trust

Use cases with known absent links, known nonlinear links, and known joint interactions. Compare:

- known equations versus fitted equations;
- an accurate numerical reference versus the sample estimator;
- several ensemble sizes and independently generated runs;
- several sampling intervals;
- regression choices and their first/second derivatives;
- individual and collective/synergy transfer;
- noise-free, constant-noise, and state-dependent-noise cases.

A low prediction MSE alone does not establish correct derivatives, diffusion, or transfer. Report uncertainty from refitting across independent ensembles or suitable dependent-data resampling, not just Monte Carlo error of a final average.

A shifted or shuffled driver can serve as a diagnostic only if the shuffling respects the question and time dependence. It is not a universal causal-ground-truth test.

## 6. Where Gaussian mixtures, DNNs, and alternative representations enter

| Component | An established role | What would still need validation here |
|---|---|---|
| Gaussian mixture | Flexible density estimate; entropy bounds or sample estimates | Adequacy for the evolving state distribution |
| REMEDI correction network | Correct a base-density entropy estimate through learned KL | Online adaptation and derivative stability |
| DNN drift | Approximate expected short-time state changes | State sufficiency, sampling effects, derivative accuracy, noise separation |
| Conditional-mean DNN | Fit the conditional curves required by CSM | Stable state derivatives and correct conditioning |
| Neural score | Estimate \(\nabla\log p\) for probability-flow/entropy formulas | The intended physical-time and driver-specific formula |
| Koopman/learned representation | Seek simpler dynamics in transformed coordinates | Information transfer may concern transformed quantities, not the original physical variables |
| Wavelet basis | One choice of flexible fitted function family | Selection, coverage, derivative quality; it is not mandatory |

A Gaussian mixture for the state distribution is different from a mixture of process equations. The emails and handwritten notes do not by themselves select one architecture.

## 7. What must be clarified before real sea-ice measurements

A climate forecast ensemble can represent a model's current state distribution. An analysis ensemble may instead represent uncertainty remaining after observations. Either interpretation must be stated before applying a distribution-dependent transfer formula.

Indirect observations add another distinction: satellite measurements are not automatically direct samples of every physical state variable required by a Markov process model. Observation noise can also contaminate increment-based drift and diffusion fitting.

Sea-ice concentration is bounded. It can also have probability mass at exactly zero or one. A continuous-density estimator and differential entropy formula require care in that setting; fitting an unconstrained Gaussian mixture does not settle boundary fluxes or discrete masses. This should be resolved when selecting physical variables and the estimator.

These distribution/model questions do not require choosing a Kalman filter now.

## 8. Specific questions to take to Nir and Stéphane

1. Is the first target total entropy change, an individual LK rate, or a different directed-information quantity?
2. Should we first reproduce the stationary nonlinear Lorenz example, or move directly to a transient known-equation ensemble?
3. For an online extension, may the nonlinear drift be known initially while only the conditional averages evolve?
4. Must joint/synergy contributions be reported alongside individual links?
5. Are states directly available from the chosen simulations, and what should their ensemble distribution represent?
6. Is an approximate local SDE acceptable for the selected sampling interval, or is an explicitly discrete-map definition required?

