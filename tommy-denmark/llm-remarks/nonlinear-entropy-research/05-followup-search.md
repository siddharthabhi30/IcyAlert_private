# Follow-up methods and remaining gaps

Checked on 26 October 2026, after the initial 24-paper review. Targeted, not exhaustive. Added methods include neural entropy evolution; inspection/execution status is stated per method.

## 1. Score-Based Transport Modeling (SBTM)

**Boffi and Vanden-Eijnden, Probability flow solution of the Fokker–Planck equation**, Machine Learning: Science and Technology 4, 035012 (2023). [Paper, pinned v3](https://arxiv.org/pdf/2206.04642v3); [DOI](https://doi.org/10.1088/2632-2153/ace2aa); [author code](https://github.com/nmboffi/sbtm).

This method evolves samples of a distribution and learns its log-density gradient as it goes. It provides entropy and entropy-change calculations. The simulation's drift and diffusion are supplied; learning the score does not identify unknown physical dynamics from measurements.

For constant scalar diffusion \(D\), its probability-flow velocity is

\[
v_t(x)=F(x,t)-D\,s_t(x),
\qquad s_t(x)\approx\nabla\log p_t(x).
\]

The distribution evolves under this velocity. Under the required regularity and boundary conditions, its joint differential entropy satisfies

\[
\frac{dH(t)}{dt}=E_{p_t}[\nabla\cdot v_t(X)].
\]

Inspected implementation:

| Step | What enters or happens | Actual code |
|---|---|---|
| 1 | Supply initial samples, the forcing/drift, diffusion, and time steps | Simulation configuration and `SBTMSim` |
| 2 | Learn a score network using the current samples | `losses.py`; sequential subclasses |
| 3 | Move samples using the drift minus diffusion times the score | `updates.update_particles` |
| 4 | Refit the score after moving the samples | `SequentialSBTM.solve_fpe_sequential` |
| 5 | Differentiate the probability-flow velocity with respect to the state | `sbtm_analysis.compute_sample_entropy_rate` |
| 6 | Take the trace of that Jacobian, then average across samples | `compute_entropy_rate` |

The inspected `div=True` branch computes `trace(jacfwd(drift)(sample))`, where its local variable `drift` is the probability-flow velocity. This calculates a temporal entropy-change rate.

In this implementation, `self.entropies` receives values from `compute_entropy_rate`. Those stored values are rates, despite the container name.

Source locations: paper Equations 3–6, Section 3 / Algorithm 1, and Section 4.1. The paper sometimes calls \(dH/dt\) “entropy production rate”; this must be distinguished from the nonnegative total thermodynamic entropy production used by other papers.

### Scope

This estimates **changing joint entropy with known dynamics**. Marginal entropy and driver-specific LK require separate formulas.

Its “online” learning follows modeled distribution evolution, not recovery of unknown dynamics from noisy climate observations.

Pinned source: [sequential loop](https://github.com/nmboffi/sbtm/blob/8a2843bbdec1cdbc15f86cb4cca640aae3593976/sbtm_sequential.py#L146), [entropy-rate calculation](https://github.com/nmboffi/sbtm/blob/8a2843bbdec1cdbc15f86cb4cca640aae3593976/sbtm_analysis.py#L155), and [particle update](https://github.com/nmboffi/sbtm/blob/8a2843bbdec1cdbc15f86cb4cca640aae3593976/updates.py).

The author code was inspected at commit `8a2843bbdec1cdbc15f86cb4cca640aae3593976`. It uses JAX/Haiku. It was **not executed** in this follow-up.

## 2. Neural methods that learn the missing dynamics

These public-code methods learn dynamics, a separate step from entropy estimation.

| Source | What it contributes | Verified code status |
|---|---|---|
| **Identifying Latent Stochastic Differential Equations**, Hasan et al. [Paper](https://arxiv.org/abs/2007.06075v5) | Learns a latent state, its observation mapping, and SDE coefficients using a variational model | [Author repository](https://github.com/alluly/ident-latent-sde): README and selected loss code inspected; not run |
| **Neural SDEs as Infinite-Dimensional GANs**, Kidger et al., ICML 2021. [Paper](https://proceedings.mlr.press/v139/kidger21b.html) | Fits a stochastic trajectory generator by comparing generated and observed paths | [Paper example in torchsde](https://github.com/google-research/torchsde/blob/master/examples/sde_gan.py) identified; implementation not downloaded or run in this pass |
| **Closing the Approximation Gap in Simulation-free Latent SDEs**, Smith, Trippe and Linderman, 2026 preprint, marked to appear at NeurIPS. [Paper](https://arxiv.org/abs/2606.16138v2) | Fits latent stochastic dynamics from noisy observations with a more expressive variational posterior | [Helmholtz-SDE](https://github.com/lindermanlab/helmholtz-sde): drift/diffusion and observation-likelihood classes inspected; not run |

In Helmholtz-SDE, `helmholtz_sde/sde.py` supplies a `NeuralSDE` with separate drift and diffusion functions. `likelihood.py` supplies the observation model. `train.py` combines observation and path-discrepancy objectives. Evolution and measurement uncertainty are separate. The inspected Helmholtz-correction branch assumes state-independent diffusion.

Pinned code: `lindermanlab/helmholtz-sde` at `0479878eaae79aa0a0cad84c3c5998aa8215885d`; `alluly/ident-latent-sde` at `48be08c5221a12d8b07947fae693ae02414c955e`.

These tools do not implement Pires transfer. Their learned latent coordinates need not correspond to physical climate variables.

## 3. Entropy does not determine dynamics

**Bartosh and Naesseth, Gaussian Flow Dynamics: Simulation-Free Neural SDE Learning Beyond One-Time Marginals**, October 2026 preprint. [Paper](https://arxiv.org/abs/2610.04390v1).

This paper explicitly addresses the fact that the distribution at each time does not uniquely determine a process's temporal dynamics. Different processes can share those distributions. Its proposed parameterization makes additional temporal degrees of freedom explicit.

Therefore, even perfect \(p_t(X)\) and entropy estimates do not identify the intended dynamical relationships or LK flow.

This is a recent preprint. The abstract and relevant opening discussion were checked; the full method was not audited. No author-code link was found in the inspected PDF text, so code availability remains unverified.

## 4. A newer Liang paper addresses coarse sampling

**Liang, Estimation of Information Flow-Based Causality with Coarsely Sampled Time Series**, Entropy 28, 34 (2026). [Paper](https://doi.org/10.3390/e28010034); [PDF](https://www.mdpi.com/1099-4300/28/1/34/pdf?version=1766763856).

This paper studies errors caused by widely spaced samples. Its Equation 13 estimates a finite-interval propagator and uses a matrix logarithm to recover a generator. The approach remains in the original linear framework, although nonlinear oscillator examples are tested.

Sampling interval affects increment-based estimation. The method does not make covariance-based LK generally exact for nonlinear dynamics.

The paper points to [the author's code page](https://www.ncoads.org/article/show/67.aspx). That page timed out in this pass; the specific released implementation was not retrieved or executed. Full-page access was intermittent; the paper's published formula, scope, and code statement were checked through the primary PDF/article text.

## 5. A discrete-time information-transfer branch exists

**Sinha and Vaidya, On Data-Driven Computation of Information Transfer for Causal Inference in Discrete-Time Dynamical Systems**, Journal of Nonlinear Science 30, 1651–1676 (2020). [DOI](https://doi.org/10.1007/s00332-020-09620-1); [earlier manuscript](https://arxiv.org/pdf/1803.08558v1).

This work approximates distribution evolution from time-series pairs using transfer operators, and computes a frozen-dynamics information-transfer measure. The manuscript presents nonlinear examples as well as linear ones.

Its conditional-entropy comparison uses original and modified dynamics; equivalence to Pires's continuous-time LK rate is not established.

The earlier manuscript's Section II gives the definition; Section V develops the nonlinear calculation. No complete public author implementation was verified in this search. Two related application papers explicitly offer code upon request, which is not evidence of a public downloadable pipeline:

- [Aerosol application, 2024](https://www.nature.com/articles/s41598-024-59887-7).
- [Network-dynamics application, 2023](https://www.nature.com/articles/s41598-023-32762-7).

## 6. Online entropy optimization is an older, separate thread

**Schraudolph, Gradient-Based Manipulation of Nonparametric Entropy Estimates**, IEEE Transactions on Neural Networks 15(4), 828–837 (2004). [Author PDF](https://nic.schraudolph.org/pubs/Schraudolph04.pdf); [DOI](https://doi.org/10.1109/TNN.2004.828766).

This paper derives entropy-based gradients for adapting a system's output. Section III-D discusses batching/sliding windows. Section III-E distinguishes true online variants, including alternative objectives and a parametric reference density.

A differentiable entropy objective changes a network's output distribution through gradients in **network parameters**, distinct from entropy change in **physical time**.

No standalone author software release was verified.

## 7. Search results that do not supply the missing nonlinear LK estimator

**GL-LFGNN**, a 2026 neural-network paper using LK for EEG, explicitly assumes a linear stochastic system when constructing its covariance estimator in Section 3.1, Equation 1. The graph network's nonlinearity does not change that estimator into general nonlinear LK. [Primary PDF](https://arxiv.org/pdf/2605.25061).

The already downloaded [Conditioners-LKIF code](../../papers/lk-curated-library/code/conditioners-lkif/README.md) is also relevant to conditioning and covariance-based LK, rather than a substitute for CSM. In `Multi_LKIF/multi_causality_est.m` it forms `C=cov(x)`, solves for linear coefficients using state–increment covariance, then computes `C(1,2)/C(1,1)*a12`.

Searches for “causal sensitivity” also returned sensitivity-to-confounding methods in treatment-effect estimation. They answer a different question from Pires's Causal Sensitivity Method and were excluded.

## 8. Findings and open work

| Claim | Status after this follow-up |
|---|---|
| Public neural entropy estimators exist | Established, with the earlier KNIFE/REMEDI checks |
| Neural evolution of a distribution and entropy-change calculation has provenance | Established for specified models; SBTM code path inspected |
| Unknown/noisy-state dynamics have learning methods and public code | Established for specified latent-SDE models; applicability to our physical variables is untested |
| A published nonlinear LK calculation exists | Established through Pires; independent selected-formula reconstruction already run |
| Any one of these packages immediately solves online nonlinear climate LK | Not established |
| Nothing relevant remains to search | Not a defensible conclusion |

**Suggested reading/tests:** SBTM for entropy change, Pires for driver-specific LK, and latent-SDE learning when dynamics or states are unknown. These are proposals, not team decisions.

Remaining research targets: physical-coordinate recovery, derivative reliability, noise, discrete/continuous definitions, and online validation.

## 9. Follow-up search record

Additional searches included:

- `"Liang Kleeman" "neural" nonlinear estimator`
- `"causal sensitivity" "neural" information transfer`
- `"online" "differential entropy" neural estimator time dependent`
- `"discrete" "Liang" "neural" information flow`
- `"Pires" "causal sensitivity method" code`
- `"Boffi" "probability flow" "github" 2023`
- `"2206.04642" code`
- `"Gradient-Based Manipulation of Nonparametric Entropy Estimates" Schraudolph pdf code`
- `"Estimation of Information Flow-Based Causality with Coarsely Sampled Time Series"`
- `"information transfer" "Sinha" "Vaidya" code nonlinear`
- `"neural SDE" "measurement noise" "github" drift diffusion inference`
- `"Neural SDEs as Infinite-Dimensional GANs" code`

Download hashes and repository commits: [follow-up source record](followup-source-record.json). No models were trained in this follow-up.

