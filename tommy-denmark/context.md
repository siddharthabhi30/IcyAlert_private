# IcyAlert research: context and handoff

Updated: 26 October 2026. Canonical research folder: `/home/abhi/code/defence/tracker/learning/consolidated/research/tommy-denmark`.

**Current work:** information transfer between physical variables with nonlinear dynamics and changing distributions. Published formulas, public entropy-estimation code, and offline checks are documented below. Online climate validation and method selection remain open.

Use the canonical tracker folder, not the old `defence/defence` location.

## 1. How to work with the user

- Give concise, connected, semi-layman explanations: inputs, calculation, output. In documentation, remove repeated commentary; preserve findings, assumptions, limitations, provenance, and unresolved questions.
- Never invent references, data/code availability, results, or requirements. Verify implementation claims against primary methods and code.
- Distinguish author statements, interpretation, executed results, and proposals; downloaded, inspected, and executed code are different statuses.
- Preserve the user's scientific target. Retrieval, forecasting, filtering, entropy estimation, and causal estimation are different tasks. Do not silently substitute one for another.
- Prefer lean, readable code and standard implementations with provenance; avoid machinery unrelated to the agreed experiment.
- For user-led derivations, hint or check the requested step. Complete explicitly requested research/documentation autonomously.
- Use inline mathematics between `\(` and `\)`. Put display delimiters `\[` and `\]` on separate lines. Avoid `\operatorname` and fenced `math` blocks: these caused rendering problems previously.
- Treat private email material as private context. Do not send messages or publish correspondence without authorization.

## 2. Wider project and current contribution

IcyAlert's wider goal is early warning of Arctic summers with sea-ice area below one million km², and their climate impacts. Its public proposal mentions CMIP6/CMIP7, single-model initial-condition large ensembles (SMILEs), C3S seasonal forecasts, satellite/reanalysis evaluation, causal analysis, and probabilistic AI emulators. GraphCast and GenCast are examples in the proposal, not a selected or released local IcyAlert model.

The contribution under discussion is directional information transfer as observations or ensembles arrive, with unknown nonlinear dynamics and indirect noisy measurements. Variables, observation operator, resolution, ensemble format, and output contract remain unspecified.

Earlier retrieval experiments mapped measurements such as AMSR2 brightness temperatures to **same-time** sea-ice concentration (SIC), distinct from future SIC forecasting. Prepared AI4Arctic data supported architecture tests but did not establish preprocessing for newly downloaded measurements. Missing later retrieval-pipeline records are listed in Section 10.

## 3. What Nir and Stéphane were asking

The [team-mail record](mails-and-imp-notes/mail-raw-interpretation.md), [22 October meeting notes](llm-remarks/nonlinear-information-flow-meeting-2026-10-22.md), and [calculation guide](llm-remarks/nonlinear-lk-calculation-and-followup.md) contain the discussion.

Nir asked how a slide specifying the target equation for \(Y\), with drivers \(C_j\), justifies assuming two coupled Ornstein–Uhlenbeck equations. The slide does not specify the driver's evolution or dependence on \(Y\). A directional calculation may use target evolution and joint statistics under its assumptions; the full process model is not established by that slide.

Stéphane distinguished a linear approximation from full nonlinear transfer, with real-time estimation a further difficulty. His novelty comment was qualified by his knowledge, not an exhaustive literature finding.

The emails discuss fitting a tractable family of functions/distributions, or finding transformed observables with a linear description, as in Koopman approaches. Nir raised the loss of physical interpretation in transformed coordinates. Stéphane discussed expanding observables to represent nonlinearities. Squares and products were explanatory examples, not a selected feature list. Neither a Gaussian mixture nor a DNN has been agreed as the final method.

## 4. The two current research threads

**Neural entropy estimation:** can a model estimate uncertainty from samples, or its change as a distribution evolves? GMM, KNIFE, REMEDI, MINE, SMILE, and score-based methods enter this discussion, but estimate different quantities.

**Nonlinear LK:** after specifying or fitting dynamics, how do conditional statistics and derivatives produce a particular driver's contribution to a target's entropy change? Pires–Docquier–Vannitsem is the main worked reference here.

| Quantity | Meaning and limitation |
|---|---|
| Entropy \(H(X_t)\) | Uncertainty of a distribution at one time |
| Entropy change \(dH/dt\) | How that uncertainty changes in physical time |
| Mutual information (MI) | Symmetric dependence; not directional LK |
| Transfer entropy (TE) | Predictive information from a driver's past beyond the target's past; not automatically LK |
| LK transfer | Signed, driver-specific contribution to target entropy change under the chosen framework |
| Thermodynamic entropy production | Irreversibility; can remain positive when the distribution's entropy is stationary |

An entropy gradient with respect to network weights is not physical-time entropy change. Even complete one-time distributions do not uniquely identify dynamics or driver-specific transfer.

## 5. Read the current evidence in this order

| Order | File | What it supplies |
|---|---|---|
| 1 | [Research entry point](llm-remarks/nonlinear-entropy-research/README.md) | Scope, executed results, and links to code/figures |
| 2 | [Neural entropy search](llm-remarks/nonlinear-entropy-research/01-neural-entropy-search.md) | Initial 24-paper map; what each method estimates and public-code status |
| 3 | [Pires equation walkthrough](llm-remarks/nonlinear-entropy-research/02-pires-walkthrough.md) | Model, conditional averages, derivatives, and an actual Lorenz link through the equations |
| 4 | [Provenance and code audit](llm-remarks/nonlinear-entropy-research/03-provenance-and-code.md) | Paper versions, exact source locations, repository commits, inspected versus executed code |
| 5 | [Follow-up search](llm-remarks/nonlinear-entropy-research/05-followup-search.md) | SBTM entropy evolution, latent-SDE learning, discrete-time alternatives, and false positives |
| 6 | [Experiments and open questions](llm-remarks/nonlinear-entropy-research/04-experiments-and-open-questions.md) | Proposed tests; not an agreed team implementation plan |

For introductory explanations, use [the calculation guide](llm-remarks/nonlinear-lk-calculation-and-followup.md). For original GMM/entropy-bound/MINE/SMILE notes, use [the meeting record](llm-remarks/nonlinear-information-flow-meeting-2026-10-22.md). The calculation guide labels its artificial teaching example separately from paper results.

## 6. The nonlinear calculation we have actually traced

Main reference: Pires, Docquier and Vannitsem, *A general theory to estimate information transfer in nonlinear systems*, Physica D 458, 133988 (2024), [DOI](https://doi.org/10.1016/j.physd.2023.133988). Equation numbers below refer to the 51-page [arXiv 2307.10623v2](https://arxiv.org/pdf/2307.10623v2).

Its starting point is a continuous-time nonlinear SDE:

\[
dX_i=F_i(X,t)\,dt+\sum_k B_{ik}(X,t)\,dW_k,
\qquad g=BB^{\mathsf T}.
\]

Here \(F\) is the systematic expected rate of change. \(B\) controls random disturbances; \(g\) is their covariance rate. Neither is the covariance of state values. Measurement noise is also distinct from process noise.

For the **two-variable deterministic contribution**, Equation 11 can be written:

\[
m(u)=E[F_1(X_1,X_2)\mid X_1=u],
\qquad
T_{2\to1,F}=E[m'(X_1)]-E\left[\frac{\partial F_1}{\partial x_1}\right].
\]

This means: evaluate the fitted change rule, fit its average conditional on the target value, differentiate that average, subtract the change rule's derivative holding the driver fixed, and average over the sampled distribution. These derivatives are with respect to the target's value, not time. No separate entropy estimate is required by this particular calculation.

In more than two dimensions, Equation 11 concerns collective transfer, not automatically one chosen driver. Individual multivariate links need the corresponding formulas. State-dependent diffusion adds a stochastic contribution; fitting \(F\) alone is then insufficient.

The paper's model-fitting route fits increments and diffusion residuals with sampling-interval scaling, then estimates conditional averages/slopes. Its Lorenz example uses ten polynomial features up to degree two and conditional regressions up to degree ten. Wavelets are not mandatory. An arbitrary DNN is not automatically compatible with every separable-term formula or guaranteed to provide accurate derivatives.

The walkthrough follows the Lorenz \(X_3\to X_2\) link through Equation 72e. The minimal approximation near \(-0.883\) in Equation 79c is not a universal exact Lorenz answer. Joint interactions may not be captured by individual-transfer values. A sampled continuous SDE and an exact discrete-time map also require different reasoning; published discrete-time routes are mapped in the research package.

## 7. Executed checks and their limits

Completed on 26 October: offline checks, without climate or online validation.

| Check | Result | Limit |
|---|---|---|
| Independent noise-free Lorenz reconstruction, known drift | \(X_3\to X_2\) about −0.888 with degree-2 conditional fits; −0.904 with degree 6; −0.692 with degree 10 | One trajectory, fit/evaluation split; material degree sensitivity |
| Same calculation using fitted drift | About −0.926, −0.943, −0.724 respectively | Our reconstruction of selected formulas, not author code or full replication |
| Full linear covariance estimator on the same evaluation series | About 0.00000349 | Shows this linear calculation misses the chosen nonlinear link in this check |
| KNIFE author marginal estimator, three Gaussian tests | Exact entropies 2.838, 2.125, 1.452; estimates 2.845, 2.134, 1.457 nats | Three separately fitted static distributions; one seed |
| REMEDI author neural network/training routine, bimodal test | Corrected estimate 1.422 versus numerical reference 1.419 nats; base estimate 2.142 | Static density check, not entropy change or LK |

Lorenz parameters were \(\sigma=10\), \(R_a=27\), \(\beta=8/3\); sampling interval 0.01, burn-in 100, duration 1200, and 120,000 increments split equally for fitting/evaluation. No physical diffusion was inferred from numerical residuals. Rates use model time, not climate years. No independent-seed confidence interval was established.

Inspect [scripts](llm-remarks/nonlinear-entropy-research/code/), [results](llm-remarks/nonlinear-entropy-research/results/), and [verification.json](llm-remarks/nonlinear-entropy-research/verification.json). Checks include drift identities, derivative consistency, absent-link behavior, and reduction to the linear formula. Source, repository, and artifact-hash manifests accompany the checks. Arithmetic checks do not validate every scientific assumption.

## 8. Code availability and execution status

| Method | Verified status and role |
|---|---|
| KNIFE | Selected author code ran on Gaussian samples. Its marginal module is a learnable Gaussian mixture, rather than a deep network. |
| REMEDI | Author network and training routine ran on the static bimodal check. |
| SBTM, Boffi–Vanden-Eijnden | Public JAX/Haiku code inspected, not run. Known drift/diffusion plus a learned density score evolve samples; velocity-divergence code computes joint entropy-change rate. It does not directly deliver driver-specific LK or infer unknown dynamics from noisy observations. |
| Latent-SDE tools | Selected Hasan and Helmholtz-SDE code inspected, not trained here; torchsde GAN example identified. These learn dynamics/observation mappings, not the required LK calculation. Learned latent coordinates need not retain physical meaning. The inspected Helmholtz correction assumes state-independent diffusion. |
| MINE / SMILE / TENDE | MI or TE tools, not drop-in nonlinear LK estimators. Paper/code-specific status is in the audit. |
| Daniel Sørensen semiconductor WNN/RET | Author confirmed institutional IP prevents code sharing. He moved away from that workflow; his private response raises individual-versus-joint interaction limitations, not a rejection of nonlinear LK theory. [Response record](mails-and-imp-notes/daniel-sorensen-code-and-method-followup.md). |
| v-TimeLKFlow | Previously inspected public implementation tracks covariance and state–increment moments with a Kalman filter, then applies the linear covariance LK calculation. The filter's hidden state contains moment entries; its uncertainty covariance is uncertainty about those entries. It is not a physical-state EnKF or a general nonlinear LK estimator. |

The [audit](llm-remarks/nonlinear-entropy-research/03-provenance-and-code.md) and [follow-up source record](llm-remarks/nonlinear-entropy-research/followup-source-record.json) contain pinned versions. Inspection/execution status is method-specific.

## 9. Earlier linear covariance/filtering work

Detailed history: [LK/filtering evidence and results](llm-remarks/icyalert-lk-filtering-status.md). Its ERA5-first sequence is an earlier proposal.

For a linear stochastic model, the two-variable covariance estimator uses state covariances and state–increment covariances. Under the relevant assumptions it reduces to:

\[
T_{2\to1}=a_{12}\frac{\mathrm{Cov}(X_1,X_2)}{\mathrm{Var}(X_1)}.
\]

The covariance formula is not generally exact for nonlinear dynamics. For calculations from data, show the full state–increment covariance estimator, not only this coefficient form.

Earlier controlled work in [the IcyAlert code folder](/home/abhi/code/defence/IcyAlert) reproduced a stationary two-variable reference near 0.1111, checked a stochastic EnKF, and compared forecast/posterior/momentum covariances. Strong observations contracted posterior covariance; the analytical Kalman covariance showed the same qualitative effect. This did not prove that physical causality disappeared: posterior state uncertainty and stationary process covariance are different objects. Momentum was experimental, not a validated correction. These earlier runs were not rerun during the neural-entropy search.

Time series, rolling windows, same-time ensembles, pooled time/member blocks, and sequential moments are different sampling choices. The user requested time-based versus current-ensemble transfer; do not silently pool dates.

Published precedents recorded in the status guide:

- Docquier et al. (2022), [DOI](https://doi.org/10.1029/2021GL095892): EC-Earth3 SMHI-LENS, 50 members; separate member analysis and 5-year-by-ensemble blocks, 250 samples per block.
- Docquier et al. (2024), [DOI](https://doi.org/10.1038/s41598-024-76056-y): five CMIP6 large ensembles; 10-year blocks with roughly 300–500 samples. Neither study is a single-time EnKF posterior calculation.
- Hagan (2019)/Zhou (2024): a continuous research lineage tracking time-varying moments with a square-root Kalman formulation. Later inspected implementation availability does not establish original authors' code availability.
- Rolling-window ordinary LK has published applications. Vannitsem–Liang sliding averaging for low-pass timescale separation is a different operation.

Earlier advice: known-answer two-variable tests, then Lorenz and real-data series. Later discussion added the nonlinear questions.

## 10. Folder, data, and migration map

| Location | Use |
|---|---|
| [llm-remarks/INDEX.md](llm-remarks/INDEX.md) | Discussion and consolidated-note navigation |
| [todo/future-readings-code-and-papers.md](todo/future-readings-code-and-papers.md) | Wider paper/code backlog, including retrieval history |
| [papers/lk-curated-library/INDEX.md](papers/lk-curated-library/INDEX.md) | Curated LK sources and summaries |
| [papers/SUMMARY-REFRESH-REPORT.md](papers/SUMMARY-REFRESH-REPORT.md) | Earlier summary/source audit |
| [experiments/setup-icyAlert/README.md](experiments/setup-icyAlert/README.md) | Earlier forecast/filter setup proposal; not the final approved architecture |
| [experiments/setup-icyAlert/icy-alert-dump.md](experiments/setup-icyAlert/icy-alert-dump.md) | Broader project-source material |
| [/home/abhi/code/defence/IcyAlert](/home/abhi/code/defence/IcyAlert) | Earlier controlled experiments and project code |
| [/home/abhi/code/icyalert/v-TimeLKFlow](/home/abhi/code/icyalert/v-TimeLKFlow) | Local time-varying linear-LK implementation |
| [/home/abhi/code/defence/AI4ArcticSeaIceChallenge](/home/abhi/code/defence/AI4ArcticSeaIceChallenge) | Earlier satellite-retrieval notebooks/code |
| [/home/abhi/code/defence/icenet](/home/abhi/code/defence/icenet) | Sea-ice forecasting reference checkout |

External directories were checked for existence, not current execution state. Ten older references remain missing, including supervised-retrieval pipeline documents: [documentation-link-gaps.md](todo/documentation-link-gaps.md). The full library has not been audited.

Data roles: ERA5/ERA5T are reanalysis estimates, not raw observations. CMIP6/7 contain climate-model simulations; SMILE denotes many initial-condition runs of one model, not a neural architecture. C3S initialized seasonal forecasts are distinct from CMIP projections. Model ensemble, Kalman covariance, and spectral numerical filtering are not interchangeable terms.

## 11. What remains open and where to resume

Unvalidated: online nonlinear climate LK, real-time Lorenz estimation, learned-filter improvement, and final IcyAlert integration. ERA5 dynamic-LK and Docquier block-analysis replications are not confirmed complete. SBTM has not been executed; latent-SDE tools have not been trained here. Searches were targeted, not exhaustive.

**Suggested next steps, not team decisions:** use Pires and the Lorenz check for driver-specific transfer; inspect/test SBTM for entropy change with supplied dynamics. Consider latent-SDE learning if recovering dynamics or hidden states is required. Gaussian-mixture entropy bounds remain a reading topic, not a validated full solution.

For the next experiment, specify quantity, variables, sampling axis, time step, available state/measurement information, and reference answer. A low forecast loss alone does not validate transfer estimates. Resume from the chosen thread and its execution record.
