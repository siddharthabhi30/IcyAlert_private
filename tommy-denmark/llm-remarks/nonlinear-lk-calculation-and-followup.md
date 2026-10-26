# Nonlinear LK: the calculation, model assumptions, and author follow-up

Updated: 26 October 2026. This guide consolidates the discussion after the [22 October meeting notes](nonlinear-information-flow-meeting-2026-10-22.md). It is a source-checked explanation for learning, not a claim that the user has mastered the derivation or that a new algorithm has been implemented.

Follow-up: [Neural entropy literature search and full Pires equation walkthrough](nonlinear-entropy-research/README.md), with public-code provenance and executed numerical checks.

## 1. Where the project stands

The scientific task is to estimate information flow between physical variables from measurements, eventually as new measurements arrive. Nir's formulation includes unknown dynamics and indirect, noisy observations. There is no agreed final neural architecture or nonlinear estimator yet.

Nonlinear LK formulas and offline estimation procedures exist. This does not establish a finished solution to online estimation from hidden, noisy states. Stéphane's statement that the full nonlinear online problem is new was qualified by his own knowledge; it is not a verified claim that nobody has studied any related problem.

The semiconductor paper is an example of learning nonlinear dynamics before estimating transfer. Daniel has now confirmed that its full code cannot be shared and that he has moved away from that particular workflow. His reasons and the distinction between the paper and the email are recorded in [the author-response note](../mails-and-imp-notes/daniel-sorensen-code-and-method-followup.md).

## 2. What must a learned function represent?

In a stochastic process model,

\[
dX_i=F_i(X,t)\,dt+\sum_k B_{ik}(X,t)\,dW_k,
\qquad g=BB^{\mathsf T}.
\]

The function \(F_i\) describes the systematic rate of change, given the current state. The matrix \(B\) describes how random disturbances enter; \(g\) is the diffusion covariance. Neither is simply a covariance of recorded physical-variable values.

A predictor of the state six months later is not automatically this instantaneous change rule. A history-based network also does not automatically satisfy a first-order Markov state assumption. The state and sampling interval must be specified.

Learning from accurate state samples and learning from indirect noisy measurements are different tasks. In the latter, state estimation and parameter estimation must account for the observation model. Linear Gaussian cases have established maximum-likelihood and EM methods using Kalman filtering/smoothing. These methods do not guarantee unique recovery from uninformative measurements. [Särkkä and Solin, Chapters 10–11](https://users.aalto.fi/~asolin/sde-book/sde-book.pdf); [Ghahramani and Hinton](https://www.cs.toronto.edu/~hinton/absps/tr-96-2.pdf).

## 3. From a learned nonlinear function to a transfer estimate

This section covers **two variables**, sufficiently regular dynamics/distributions, and the deterministic contribution to transfer. With no process noise or constant additive process noise, it gives the full transfer rate. State-dependent noise requires its stochastic contribution too.

Given \(F_1(X_1,X_2)\) and state samples \((x_{1,n},x_{2,n})\), first calculate

\[
f_n=F_1(x_{1,n},x_{2,n}).
\]

Fit a one-input average curve using \(x_{1,n}\) as input and \(f_n\) as target:

\[
m(u)=E[F_1(X_1,X_2)\mid X_1=u].
\]

This curve averages over the accompanying values of \(X_2\). It is an additional regression, not another forecast model. Its derivative \(m'(u)\) is with respect to the target's value \(u\), not time.

Also differentiate the learned change function with respect to its first argument, holding its second argument fixed. Then evaluate

\[
\widehat T_{2\to1,F}
=\frac{1}{N}\sum_{n=1}^{N}
\left[
\widehat m'(x_{1,n})
-\frac{\partial F_1}{\partial x_1}(x_{1,n},x_{2,n})
\right].
\]

This is the sample-average form of Pires's Equation 11 for this two-variable setting. Their equation is written using the cross-dependent part of \(F_1\); using the full function here is equivalent because purely \(X_1\)-dependent terms cancel. [Equation 11, PDF page 6](https://arxiv.org/pdf/2307.10623#page=6).

The output is an **entropy-transfer rate**, not entropy itself. It measures the driver's contribution to the target's entropy change; with natural logarithms its units are nats per unit time. The formula avoids separately estimating the target's entropy in this calculation. The function alone is insufficient: changing the sampled joint distribution can change the result even when the change equation stays the same.

In more than two dimensions, Equation 11 concerns transfer from all the other variables collectively. It must not be relabelled as one driver's pairwise transfer. Individual and combined contributions require the corresponding multivariate formulas. [Pires, Sections 2–3](https://arxiv.org/pdf/2307.10623).

## 4. What the two slopes mean: teaching example

The following numbers were invented in the chat to explain derivatives. They are not measured climate data, not a result from either paper, and not a validated dynamical benchmark.

Take the illustrative change function

\[
F_1(x_1,x_2)=x_1+x_2^2.
\]

Hold \(x_2=2\). Moving \(x_1\) from 1 to 2 moves the function output from 5 to 6. Therefore,

\[
\frac{\partial F_1}{\partial x_1}=1.
\]

Now average over the accompanying driver values instead of holding them fixed:

| Recorded target values near | Assumed average of \(X_2^2\) | Average of \(F_1\) |
| --- | --- | --- |
| \(X_1=1\) | 2 | 3 |
| \(X_1=2\) | 4 | 6 |

These two rows illustrate a change of 3 in the average output per unit change in \(X_1\). They do not, by themselves, determine a smooth derivative. If a fit to sufficiently many samples gives \(m(u)=3u\) throughout the sampled range, then \(m'(u)=3\), and the simplified calculation gives

\[
T_{2\to1,F}=E[3-1]=2.
\]

The two slopes compare a change in the average response, with the driver taking its accompanying data values, against the response to changing only the target's input coordinate. This example illustrates the arithmetic under the formula's assumptions; it is not a separate demonstration of physical causality.

## 5. Can any nonlinear DNN be fitted and used?

A differentiable model can supply a candidate change function and its derivatives. It still needs to represent the relevant drift adequately, with reliable derivatives and the appropriate distributional and noise calculations. A low prediction error alone is insufficient.

Different estimators have different requirements. Pires's published model-fitting procedure decomposes drift and diffusion into sums of products of single-variable functions; this makes individual-transfer terms computable. An arbitrary network is not automatically a drop-in replacement for those formulas. Their simpler two-variable Equation 11 has a different computational route, described above.

Important distinctions from the conversation:

- The fitted rate of change is not the same as a long-horizon prediction.
- Derivatives of a fitted function are not guaranteed accurate merely because its values fit well.
- Observation noise is not automatically process noise. Raw noisy differences can distort both the drift and residual-noise estimates.
- Hidden drivers, inadequate state definitions, and unsupported extrapolation can undermine causal interpretation.
- Two variables acting together can have an effect not represented by their individual transfer numbers.

The task combines system identification, statistics, stochastic dynamics, and information theory. ML can perform some fitting or estimation steps; it does not define the information-transfer quantity.

## 6. What Pires actually fitted in the Lorenz experiment

Pires, Docquier and Vannitsem compare several methods: using the known equations, fitting unknown equations, a numerical-density reference, and the linear covariance estimator. These are separate comparisons, not interchangeable stages of one run.

For model fitting they estimate finite-increment rates,

\[
v_{i,n}=\frac{X_i(t_n+\Delta t)-X_i(t_n)}{\Delta t},
\]

and use ten polynomial features:

\[
\Psi(X)=
\begin{bmatrix}
1&X_1&X_2&X_3&X_1^2&X_1X_2&X_1X_3&X_2^2&X_2X_3&X_3^2
\end{bmatrix}^{\mathsf T}.
\]

The learned drift is

\[
\widehat F_i(X)=\widehat\theta_i^{\mathsf T}\Psi(X),
\qquad
\widehat\theta_i
=\arg\min_{\theta_i}\sum_n
\left[v_{i,n}-\theta_i^{\mathsf T}\Psi(X(t_n))\right]^2.
\]

The optimisation is linear in the unknown coefficients but the resulting function of the state is nonlinear. Appendix B.1 gives the least-squares solution. Its noise fit uses squared residuals with a \(\Delta t\) factor and requires nonnegative fitted diffusion; squared derivative residuals alone are not the diffusion coefficient. Conditional regressions are then used in the transfer calculation. [Section 6.2 and Appendix B.1](https://arxiv.org/pdf/2307.10623).

For the **known standardized Lorenz equation**, Equation 72e is

\[
T_{3\to2,F}
=-\frac{\sigma_1\sigma_3}{\sigma_2}
E\left[
E(X_1\mid X_2)
\frac{dE(X_3\mid X_2)}{dX_2}
\right].
\]

Here \(\sigma_i\) are the physical variables' standard deviations. This expression must not be presented as the result of an arbitrary fitted DNN. The model-fitting comparison instead uses learned coefficients in Equations 49–50. The numerical examples of minimal conditional regression in Section 6.3 are also distinct from the full model-fitting test.

The discussion's conclusions about linear-estimator bias refer specifically to their Lorenz comparison: Section 6.4, point 4, and Table 2. A linear estimator applied to nonlinear data is not thereby an exact nonlinear-transfer estimator.

## 7. What the wavelet paper did

Daniel Sørensen et al. used equipment logs containing 34 or 42 variables. They computed numerical gradients, selected 30 Ricker-wavelet terms, and refined a wavelet neural network to approximate each variable's change rule. Gaussian basis functions fitted the noise contribution; these are not a Gaussian mixture model. Local polynomial regressions supplied conditional averages and derivatives for Equations 5a–5b. They combined deterministic and stochastic transfer values into a directed graph and assessed significance with surrogate time series. [Section II.B](https://arxiv.org/pdf/2608.14678#page=2).

A wavelet is a shaped function that can be shifted and rescaled. Weighted combinations can approximate complicated functions. It is an optional representation, not the definition of LK or a requirement of nonlinear dynamics.

The paper reports sensitivity to small data changes, inconsistent graphs, and expensive wavelet selection. One expert classified 39% of the strongest examined links as not possible; the paper does not treat that as an absolute physical verdict. [Section IV and Table II](https://arxiv.org/pdf/2608.14678#page=4).

The author's subsequent decision to abandon this RET workflow and his specific interaction example were explained in his private email, not stated as that conclusion in the article. See [the source record](../mails-and-imp-notes/daniel-sorensen-code-and-method-followup.md).

## 8. Individual contributions and joint effects

Daniel's email gives the algebraic example \(Y=XZ\). He is pointing out that X's influence depends on Z: changing X does nothing when Z is zero, but can matter strongly when Z is large. Individual transfer values may not answer his question about that joint action.

The example illustrates a question about interactions; it is not itself a specified stochastic process or a universal proof that individual RET must vanish for products. Its result depends on the dynamics and distribution.

The paper's Equation 3 already distinguishes individual contributions from an extra synergetic contribution. Thus his email should not be recorded as a proof that the complete Pires framework cannot represent nonlinear interactions. It explains why the individual-transfer workflow did not answer his current question.

## 9. How GMM, entropy estimators, and DNN fitting connect

| Tool or quantity | Its job | What remains to establish |
| --- | --- | --- |
| GMM | Fit a probability distribution using weighted Gaussian components | Which state or transition distribution is being fitted, and how to obtain the desired transfer from it |
| Mixture entropy bounds | Bound the entropy of the fitted mixture | How bound errors affect entropy-change and transfer estimates |
| MINE / SMILE | Train neural estimators of mutual information | A justified connection to the desired directed LK quantity |
| Neural Joint Entropy Estimation | Estimate entropy and related quantities, starting from discrete variables | Applicability to the chosen data and LK construction |
| TENDE | Estimate transfer entropy through conditional MI | Whether transfer entropy answers the intended question; it is not automatically LK |
| Nonlinear dynamics fitting | Learn a drift and, where needed, diffusion | Conditional statistics, derivatives, and the appropriate transfer formulas |

These are two parallel research directions: estimate relevant distributions/information quantities, or learn dynamics and evaluate their transfer formulas. A GMM and a wavelet network are not mandatory parts of one combined pipeline. The [meeting guide](nonlinear-information-flow-meeting-2026-10-22.md) contains the definitions, paper links, and the handwritten questions.

## 10. Time, ensembles, covariance, and online estimation

The Pires experiment uses discretely sampled trajectories to estimate a continuous-time transfer rate. This is different from deriving an exact discrete-time LK estimator for an arbitrary learned transition map. The latter was deferred in our discussion. Training on a completed series also does not establish a working online estimator.

The sample-average formulas above can use an ensemble at a specified time or a representative stationary time series under the relevant assumptions. Pooling times and ensemble members changes the sampled distribution and must be an explicit decision. A single state sample does not determine a covariance, conditional distribution, or transfer rate.

In the previously reviewed [v-TimeLKFlow covariance tracker](https://github.com/BIA-Lab-Team/v-TimeLKFlow/blob/2f231c43c65687240eb884379288a516f0719992/mtvlk/core/sqkf.py), the Kalman state stores covariance and state–change-rate covariance entries. Its uncertainty matrix describes error in those estimated entries. That differs from a filter whose state is the physical climate variables. Its covariance tracking does not by itself solve the nonlinear hidden-state problem.

[Wang et al. (2025)](https://doi.org/10.3389/fmars.2025.1600634) apply a covariance-based LK estimator to time series at different grid points and use the resulting localization in ensemble assimilation. The model includes nonlinear processes. Better assimilation in that experiment does not establish exact nonlinear information transfer from the linear estimator.

## 11. Learning prerequisites and current open decisions

The level discussed was strong undergraduate probability/statistics followed by selected graduate topics in stochastic processes and information theory. The immediate conceptual gap was conditional expectation and the derivative of a fitted average curve.

| Order | Foundation | Depth discussed | Earlier rough focused-study estimate |
| --- | --- | --- | --- |
| 1 | Multivariable calculus and linear algebra: partial derivatives, gradients, integration, matrices | Must be usable independently | 5–10 hours of review |
| 2 | Probability: joint, marginal, and conditional distributions and conditional averages | Must be usable independently; builds on 1 | 8–15 hours |
| 3 | Statistical estimation: regression, likelihood, bias, variance, and uncertainty in slopes | Must be usable independently; builds on 1–2 | 8–15 hours |
| 4 | Stochastic dynamics: Markov state, drift/diffusion, measurement versus process noise | Must be usable independently; builds on 1–3 | 10–20 hours |
| 5 | Information theory: entropy, conditional entropy, KL divergence, and MI | Must be usable independently; builds on 2 | 8–15 hours |
| 6 | Nonlinear LK: assumptions, formulas, and a reproducible published calculation | Must be usable independently; builds on 1–5 | 10–20 hours |
| Later | Wavelets as a fitting representation | Skim initially; builds on calculus and regression | 2–4 hours |

The earlier study-hour suggestions were informal estimates, not a validated schedule or a promise of mastery. The learning goal is to explain the assumptions and reproduce a small calculation independently. No new course sequence has been agreed.

The decisions still open are:

- Which variables form the physical state, and what do the instruments observe?
- Is the desired quantity an individual transfer, collective transfer, synergy, MI, or transfer entropy?
- Which distribution or function family does Nir intend in his first option?
- Is an offline known-model benchmark the first task, or has an online estimator been selected?
- How are measurement noise and process noise distinguished?
- Which learned model and derivative estimates satisfy the selected formula's requirements?

The assistant suggested beginning with a controlled two-variable linear benchmark and then a published nonlinear benchmark. That is a recommendation, not a recorded team decision. No new experiment was run or algorithm chosen during this documentation update.

## Sources and related records

- [22 October meeting notes and reading links](nonlinear-information-flow-meeting-2026-10-22.md).
- [Daniel's code and method response](../mails-and-imp-notes/daniel-sorensen-code-and-method-followup.md).
- [Earlier team email](../mails-and-imp-notes/mail-raw-interpretation.md).
- [Pires, Docquier and Vannitsem: nonlinear theory and Lorenz experiments](https://arxiv.org/pdf/2307.10623).
- [Liang: linear estimator and its stated limitation](https://arxiv.org/pdf/1403.6496).
- [Sørensen et al.: neural process fitting and RET](https://arxiv.org/pdf/2608.14678).
- [Future papers and code reading list](../todo/future-readings-code-and-papers.md).

The teaching example, numerical rewriting of the expectation as a sample mean, and scope clarifications are explanations added in the conversation. They must not be attributed as quotations or new experimental results from the papers. Equation delimiters and new local links were checked; visual rendering was not inspected. Older missing reading-list links are recorded in the [migration link-gap record](../todo/documentation-link-gaps.md).
