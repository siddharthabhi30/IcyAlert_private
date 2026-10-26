# Can a neural network estimate entropy and its change?

Checked on 26 October 2026. Claims link to primary papers and author code; [inspection/execution details](03-provenance-and-code.md) are separate.

## 1. Quantities and suitable estimators

| Quantity | Question in ordinary language | What its output means |
|---|---|---|
| Entropy \(H(X_t)\) | How spread out is the distribution of \(X\) at this time? | One uncertainty value for a specified distribution |
| Change \(H(X_{t+\Delta t})-H(X_t)\) | Did that uncertainty increase or decrease? | A difference between two distributions |
| Rate \(dH(X_t)/dt\) | How fast is that uncertainty changing in physical time? | Entropy per unit of physical time |
| Mutual information \(I(X;Y)\) | How much does knowing one variable reduce uncertainty about the other, on average? | Symmetric statistical dependence |
| Transfer entropy | Does the driver's past improve prediction of the target beyond the target's own past? | Conditional information about a later value |
| LK information flow | What part of the target's entropy-change rate is attributed to a selected driver by LK's dynamical definition? | A signed rate, defined using the dynamics |
| Thermodynamic entropy production | How irreversible or dissipative is a stochastic process? | A physical irreversibility measure under specified dynamics and time reversal |

Entropy reduction after conditioning is expressed by MI. Reduction over physical time is expressed by a temporal change. The two questions require different data. A network trained to make confident predictions does not, just through that confidence, measure either one correctly.

The relevant definitions and distinctions appear in [Pires, Sections 1–3](https://arxiv.org/pdf/2307.10623v2), [MINE](https://proceedings.mlr.press/v80/belghazi18a.html), [TENDE, Section 2](https://arxiv.org/pdf/2510.14096), and [Otsubo et al., model and entropy-production definitions](https://www.nature.com/articles/s42005-021-00787-x).

Follow-up: [Additional methods and gaps](05-followup-search.md), including SBTM's entropy-evolution code.

## 2. Reading shortlist

**For “give samples to a learned estimator and obtain entropy”: read KNIFE, then REMEDI.**

**For David and Stéphane's nonlinear LK calculation: read Pires's Equations 11 and 37, then the Lorenz example.** It uses conditional-average functions and their derivatives. The [walkthrough](02-pires-walkthrough.md) connects those steps.

**For neural estimation directly from time series: read TENDE if transfer entropy is an acceptable alternative question.** Its output must retain that name.

**For physical time-dependent entropy production: read Otsubo et al.** It has public code and explicitly time-dependent neural functions. Its output is not pairwise LK transfer.

## 3. Literature map

“Inspected” means selected files were read; “ran” refers only to the stated check.

| # | Paper and primary source | What is learned or calculated | Code and relevance |
|---|---|---|---|
| 1 | Pires, Docquier & Vannitsem, **A general theory to estimate information transfer in nonlinear systems**, Physica D 458 (2024), [DOI](https://doi.org/10.1016/j.physd.2023.133988), [manuscript](https://arxiv.org/pdf/2307.10623v2) | Nonlinear LK rates using conditional expectations; includes model fitting when equations are unknown | No complete author CSM release verified in this search. A local independent reconstruction was run |
| 2 | Liang, **Information flow and causality as rigorous notions ab initio**, PRE 94 (2016), [publisher](https://doi.org/10.1103/PhysRevE.94.052201) | General deterministic/stochastic, discrete/continuous dynamical definitions | Foundation for distinguishing sampled SDEs from genuine discrete maps; no neural online implementation verified here |
| 3 | Pichler et al., **A Differential Entropy Estimator for Training Neural Networks**, ICML 2022, [paper](https://proceedings.mlr.press/v162/pichler22a/pichler22a.pdf) | KNIFE: learnable mixture density and neural conditional density; entropy through average negative log density | [Author code](https://github.com/g-pichler/knife), inspected; marginal estimator ran on the Gaussian check |
| 4 | Nilsson et al., **REMEDI: Corrective Transformations for Improved Neural Entropy Estimation**, ICML 2024, [paper](https://proceedings.mlr.press/v235/nilsson24a.html) | A base-density cross-entropy estimate corrected using a neural relative-entropy estimate | [Author code](https://github.com/viktor765/REMEDI), author network and training function executed on our bimodal check |
| 5 | Ao & Li, **Entropy estimation via uniformization**, Artificial Intelligence 322 (2023), [paper](https://arxiv.org/pdf/2304.09700), [DOI](https://doi.org/10.1016/j.artint.2023.103954) | Normalizing flow transforms samples; nearest-neighbor entropy is corrected by transformation Jacobians | [Paper-linked code](https://github.com/ziq-ao/NFEE), entropy transformation inspected; not run |
| 6 | Shalev, Painsky & Ben-Gal, **Neural Joint Entropy Estimation**, TNNLS 35 (2024), [DOI](https://doi.org/10.1109/TNNLS.2022.3204919), [preprint](https://arxiv.org/pdf/2012.11197) | Chain-rule entropy using neural cross-entropy; conditional, MI and TE extensions | [Author code](https://github.com/YuvalShalev/NJEE), selected example inspected. Discrete-alphabet entropy is the starting point |
| 7 | Belghazi et al., **Mutual Information Neural Estimation**, ICML 2018, [paper](https://proceedings.mlr.press/v80/belghazi18a.html) | Neural variational lower bound on MI | Executable implementations found within the SMILE author repository; these are not labelled the original MINE authors' code |
| 8 | Song & Ermon, **Understanding the Limitations of Variational Mutual Information Estimators**, ICLR 2020, [paper](https://arxiv.org/pdf/1910.06222) | SMILE clips the partition-function estimate to trade variance against bias | [Author code](https://github.com/ermongroup/smile-mi-estimator), estimator functions inspected; not run |
| 9 | Letizia, Novello & Tonello, **Mutual Information Estimation via f-Divergence and Data Derangements**, NeurIPS 2024, [paper](https://proceedings.neurips.cc/paper_files/paper/2024/file/bdcfa850adac4a1088153881282ca972-Paper-Conference.pdf) | Neural density-ratio MI estimators, with deranged sample pairings | [Author code](https://github.com/nicolaNovello/fDIME), README and source inventory checked; not run |
| 10 | Duong & Nguyen, **Diffeomorphic Information Neural Estimation**, AAAI 2023, [paper](https://arxiv.org/abs/2211.10856) | Transforms variables to simplify MI/conditional-MI estimation | [Author code](https://github.com/baosws/DINE), README/API inspected; not run |
| 11 | Tsur et al., **Neural Estimation and Optimization of Directed Information over Continuous Spaces**, IEEE TIT (2023), [paper](https://arxiv.org/pdf/2203.14743) | Recurrent variational estimators for directed-information rate | [Author-group code](https://github.com/zivaharoni/capacity-estimator-via-dine), channel experiment README inspected; not run |
| 12 | Galeano Muñoz et al., **TENDE: Transfer Entropy Neural Diffusion Estimation**, AISTATS 2026, [paper](https://arxiv.org/pdf/2510.14096) | Conditional diffusion scores estimate conditional MI defining transfer entropy | [Author tutorial](https://github.com/giuliofranzese/Cajal/tree/main/tende), notebook inspected; [source/checkpoint/data bundle](https://huggingface.co/GiulioFranzese/cajal-tende) identified, not executed |
| 13 | Franzese, Rossi & Michiardi, **ALICE: In-context, Zero-shot, Mutual Information Estimation**, September 2026 preprint, [paper](https://arxiv.org/abs/2609.34962v2) | A pretrained transformer estimates MI from context samples without fitting anew to each distribution | [Author code](https://github.com/eurecom-probai/alice), public interface inspected; weights not loaded. MI, not LK |
| 14 | Kolchinsky & Tracey, **Estimating Mixture Entropy with Pairwise Distances**, Entropy (2017), [corrected manuscript](https://arxiv.org/abs/1706.02419v4) | Computable upper/lower bounds for mixture entropy | Direct GMM background. Full implementation not inspected in this pass |
| 15 | Maoutsa, Reich & Opper, **Interacting particle solutions of Fokker–Planck equations through gradient–log–density estimation**, Entropy 22 (2020), [paper](https://arxiv.org/pdf/2006.00702) | Learns density scores for particle evolution; Section 4.1 computes temporal entropy change | Not specifically a DNN estimator; a direct bridge from score estimation to \(dH/dt\). Complete code release not verified here |
| 16 | Kim et al., **Learning entropy production via neural networks**, PRL 125 (2020), [paper](https://arxiv.org/pdf/2003.04166) | Neural estimation of irreversibility from trajectories | [Author code](https://github.com/kdkyum/neep), README/example inventory inspected; not run |
| 17 | Otsubo et al., **Estimating time-dependent entropy production from non-equilibrium trajectories**, Communications Physics 5 (2022), [paper](https://www.nature.com/articles/s42005-021-00787-x) | Time-conditioned neural field and variational entropy-production estimates | [Author code](https://github.com/tsuboshun/LearnEntropy), neural field and objectives inspected; not run |
| 18 | Boffi & Vanden-Eijnden, **Deep learning probability flows and entropy production rates in active matter**, PNAS 121 (2024), [paper](https://doi.org/10.1073/pnas.2318106121) | Learns stationary density scores; combines them with known dynamics | [Author code](https://github.com/nmboffi/active_pflows), entropy utilities inspected; not run |
| 19 | Boffi & Vanden-Eijnden, **Model-Free Learning of Probability Flows: Elucidating the Nonequilibrium Dynamics of Flocking**, PRL 135 (2025), [paper](https://doi.org/10.1103/1zqs-nbt7), [preprint](https://arxiv.org/pdf/2411.14317) | Learns probability-current velocities from short trajectory transitions | [Author code](https://github.com/nmboffi/vicsek_public), loss and launcher inspected. Demonstration generates simulator transitions; adaptation is needed for an external dataset |
| 20 | Das & Manikandan, **Localising entropy production along non-equilibrium trajectories**, Communications Physics 9 (2026), [paper](https://www.nature.com/articles/s42005-026-02667-8) | Neural dissipative-force fields and local physical entropy production | Article provides [code archive link](https://doi.org/10.5281/zenodo.19057023) and cites [Inference-short](https://github.com/SreekmInference/Inference-short). Archive contents not verified here |
| 21 | Feutrill & Roughan, **NPD Entropy: A Non-Parametric Differential Entropy Rate Estimator**, [paper](https://arxiv.org/abs/2105.11580) | Entropy rate of continuous-valued stationary time series through quantization | Non-neural comparator; its entropy rate is not the derivative of a time-varying marginal entropy |
| 22 | Vannitsem, **Causal dependencies and Shannon entropy budget: Analysis of a reduced-order atmospheric model**, QJRMS (2024), [DOI](https://doi.org/10.1002/qj.4805) | Linear estimator plus nonlinear-observable extensions in an atmospheric setting | Related climate application. Full-text retrieval failed in this pass; no detailed equation/code claim made |
| 23 | van Leeuwen, **Information Flow in Geophysical Systems**, JAMES (2026), [paper](https://doi.org/10.1029/2026MS005876) | An alternative relative-entropy information-flow framework for geophysical models | A different definition from Pires's Shannon/LK transfer; article links a shallow-water simulator, not a verified complete released analysis pipeline |
| 24 | Sørensen et al., **Information-Theoretic Causal Modelling of Semiconductor Process Dynamics**, [paper](https://arxiv.org/pdf/2608.14678) | Wavelet-based nonlinear fitting and individual entropy-transfer estimates | Prior local author response confirms code cannot be shared under institutional IP rules; see the [response record](../../mails-and-imp-notes/daniel-sorensen-code-and-method-followup.md) |

The two methods called **DINE** in rows 10 and 11 are different. The first estimates MI/CMI using transformations; the second estimates directed information using recurrent models.

## 4. How KNIFE and REMEDI actually produce entropy

For a continuous variable, the target is

\[
H(p)=-E_{X\sim p}[\log p(X)].
\]

A learned density \(q_\theta\) is fitted by minimizing average negative log density. Training needs samples, rather than a supplied entropy label for each sample. Evaluate it on separate samples:

\[
\widehat H_{\mathrm{cross}}
=-\frac1M\sum_{m=1}^{M}\log q_\theta(x_m).
\]

This approaches entropy when the fitted density matches the data. Its population value is \(H(p)+\mathrm{KL}(p\|q_\theta)\); an imperfect fit can overestimate entropy. In KNIFE's released implementation, `MargKernel.logpdf` evaluates a Gaussian mixture and `forward` returns the average negative log density. The conditional version uses feedforward networks to set mixture parameters.

REMEDI supplies an explicit bridge between a fitted mixture and a DNN correction. It estimates the discrepancy between the base density \(q\) and the data density \(p\):

\[
H(p)=H(p,q)-\mathrm{KL}(p\|q).
\]

Its neural correction uses

\[
\mathrm{KL}(p\|q)
=\sup_f\{E_p[f(X)]-\log E_q[e^{f(X)}]\}.
\]

Fit the base density, train the correction network, then subtract its estimated discrepancy. The source implements this subtraction in `Entropy estimation/REMEDI.py`. In our separate bimodal check, the base estimate was 2.142 nats; the neural correction was 0.719, giving 1.422 against a numerical reference of 1.419. This executed the authors' network and training function on a small independent example. These population identities do not remove finite-sample or fitting error. [KNIFE, Section 2](https://arxiv.org/pdf/2202.06618); [REMEDI, Section 3 and Appendix E](https://arxiv.org/pdf/2402.05718).

## 5. How Gaussian mixtures fit the meeting discussion

A Gaussian mixture describes a distribution using several weighted Gaussian components:

\[
q(x)=\sum_{k=1}^{K}\pi_k\,\mathcal N(x;\mu_k,\Sigma_k).
\]

Several peaks do not imply linear dynamics. A mixture models the distribution; it does not by itself specify the equation that moves the state.

Each component has a simple entropy formula. The mixture usually needs estimation or bounds because a logarithm contains a sum. The [Kolchinsky–Tracey paper](https://arxiv.org/abs/1706.02419v4) provides bounds. KNIFE and REMEDI provide learned-estimator routes.

A GMM base density and DNN correction can form one entropy estimator. This does not yet supply online nonlinear LK.

## 6. What “dynamic entropy” would require

At each physical time, obtain representative samples of the state distribution. Fit or update the estimator and evaluate the entropy on independent samples. With ensembles, each timestamp supplies a distribution across members.

For two times:

\[
\widehat r_t
=\frac{\widehat H_{t+\Delta t}-\widehat H_t}{\Delta t}.
\]

This is an estimated average change over the interval. It does not identify which other variable caused that change. Small \(\Delta t\) also amplifies estimation errors.

Use fixed physical units and a fixed preprocessing transformation across dates. Standardizing each date independently can erase the distribution-width change we are trying to measure.

This snapshot extension is proposed, not validated by KNIFE/REMEDI for streaming climate data.

For a direct formula connecting dynamics and entropy change, Maoutsa et al. give, for constant isotropic diffusion \(dX=F\,dt+\sigma\,dW\),

\[
\frac{dH}{dt}
=E[\nabla\!\cdot F(X)]
+\frac{\sigma^2}{2}E[\|\nabla\log p(X)\|^2].
\]

Their Section 4.1, Equation 13, uses a learned gradient of log density, also called a **score**. This is the entropy rate of the whole distribution under that model. Pires's driver-specific calculation requires its own entropy-transfer decomposition.

Do not calculate the derivative by taking only \(-E_p[\partial_t\log p]\). Under regularity, that expectation is zero; it omits the changing distribution in the expectation.

## 7. Why the time-dependent entropy-production papers are relevant

Otsubo's code learns a function of **state and time** from transition ensembles to estimate physical entropy-production rates under Langevin/Markov assumptions.

Boffi's later model-free work also learns from transitions rather than requiring the exact microscopic force law for its inference principle. However, the released demonstration generates transitions using its simulator. Neither result supplies pairwise climate LK values merely by running a downloaded script.

Physical entropy production can remain positive at a steady distribution. Meanwhile \(dH/dt\) is then zero. Thus an entropy-production plot cannot substitute for the marginal-entropy-change plot requested in the meeting.

The similarly named [Neural Entropy, NeurIPS 2025](https://papers.neurips.cc/paper_files/paper/2025/hash/1f2dbafda518a76a57381548453f337a-Abstract-Conference.html) concerns information restored by a generative diffusion model. Its diffusion clock is an artificial noising/denoising coordinate, not the physical climate clock.

## 8. What the search establishes and what remains open

| Question | Finding |
|---|---|
| Are there neural estimators of entropy with public code? | Yes: KNIFE, REMEDI, and NJEE for its specified discrete setup |
| Can neural methods handle time-dependent information quantities? | Yes, for specified quantities and assumptions: time-conditioned entropy production, time-series TE/DI, and snapshot entropy estimates |
| Do MINE and SMILE directly return nonlinear LK? | No. They estimate MI-related variational quantities |
| Does knowing \(H(X_t)\) identify the driver-specific LK rate? | No. Entropy change contains combined effects |
| Is there a published nonlinear LK calculation from fitted dynamics? | Yes: Pires MF followed by CSM; the semiconductor paper is another fitting-based example |
| Did this search verify a ready-to-run online nonlinear climate LK pipeline? | No. That complete combination remains unverified |

The two threads are learned entropy estimation and nonlinear LK from dynamics/conditional statistics. Choose the target quantity before combining them.

