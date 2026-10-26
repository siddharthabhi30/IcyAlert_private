# Meeting notes: nonlinear information flow, Gaussian mixtures, and neural estimators

Date: 22 October 2026. Follow-up indexed on 26 October 2026.

Read the [subsequent calculation and author follow-up](nonlinear-lk-calculation-and-followup.md) for the later discussion. Daniel's reply about code restrictions and leaving the method is recorded [separately](../mails-and-imp-notes/daniel-sorensen-code-and-method-followup.md).

These are working notes for learning, based on the two handwritten pages, the emails shared in the conversation, and the sources below. Section 1 records the meeting points; later sections supply the explanations requested afterwards. Examples are explanatory examples, not statements attributed to Nir or Stéphane. Unclear handwriting is listed at the end rather than reconstructed as a claim.

## 1. What the meeting notes are asking

The two pages bring together these questions:

- Write down the information-transfer quantity that we actually want to estimate.
- Understand the linear case and what changes in the nonlinear case.
- Explore a distribution family that can be fitted to measurements and has usable entropy estimates or bounds.
- Understand Gaussian mixture models (GMMs), especially the note about relatively tight entropy bounds.
- Explore a parallel neural-estimation direction: DNNs, MINE, SMILE, and entropy estimation.
- Distinguish the graph describing dependencies in the dynamics from the graph defined by the estimated information flow.
- Decide what is known, what is fitted, and what has to update as measurements arrive.

These are questions and candidate directions. The pages do not establish a selected distribution family, neural architecture, or finished estimator.

## 2. The problem from the emails

Nir proposed a hidden state that evolves according to a linear stochastic equation, with unknown dynamics coefficients and process-noise parameters. Only noisy measurements are available, through a known observation function. Stéphane agreed with this formulation and emphasised estimating the desired properties as time advances.

Stéphane then raised two nonlinear questions: whether the linear approach can adequately estimate transfer in a nonlinear system, and whether full nonlinear transfer can be estimated without approximating the underlying dynamics. He described the latter with real-time evaluation as unexplored to his knowledge, not as an established impossibility or a verified literature-wide claim.

In the later email, Nir suggested two routes:

1. Choose a family of functions for which entropy and the desired transfer calculation are manageable, then fit a member of that family to data.
2. Transform the variables so their evolution admits a linear description, drawing on Koopman ideas, and study transfer in those transformed variables.

He preferred the first because transformed variables may lack a clear physical interpretation. His email does not specify whether the proposed family describes probability distributions, change equations, or both. It also does not select regression or a DNN.

Stéphane separately mentioned constructing new observables for a linear approach, with exploratory work on sea ice. He did not name squared terms or products in that email; those were illustrations introduced in the chat.

The earlier mail record is available in [Stéphane's email and interpretation](../mails-and-imp-notes/mail-raw-interpretation.md). The later October email excerpts were pasted into this conversation.

## 3. State, measurements, dynamics, and distribution

| Object | Plain meaning | What it describes |
| --- | --- | --- |
| State \(X_t\) | The physical quantities at time \(t\), such as ice concentration and temperature | A vector of values |
| Measurement \(Y_t\) | What the instruments report | An observation of the state, possibly indirect and noisy |
| Change rule \(F\) | How the current quantities affect their rates of change | The dynamics |
| Distribution \(p_t\) | Which combinations of state values are likely at time \(t\) | Statistical variability or uncertainty |

Calling a state distribution Gaussian means describing its possible values by a bell-shaped probability density. It does not mean that the physical variables themselves are equations or Gaussian functions.

A state-space model describes how the state changes and how measurements arise from it. A Gaussian distribution or GMM fitted to a collection of samples is not, by itself, a complete state-space model. See [Särkkä and Solin, Chapters 10–11](https://users.aalto.fi/~asolin/sde-book/sde-book.pdf).

## 4. What a Gaussian mixture model is

A single Gaussian describes one probability cloud using a mean and covariance. A GMM describes a distribution using several such clouds with different weights:

\[
p(x)=\sum_{k=1}^{K}\pi_k\,\mathcal{N}(x;\mu_k,\Sigma_k),
\qquad \pi_k\geq 0,\qquad \sum_{k=1}^{K}\pi_k=1.
\]

Here, \(K\) is the number of components; \(\pi_k\) is a component's weight; \(\mu_k\) is its centre; and \(\Sigma_k\) describes its spread and the relationships between its coordinates. Components need not correspond to real physical regimes.

Fitting a GMM means learning those weights, centres, and covariance matrices from samples. A standard method is expectation–maximization (EM): alternate between estimating how much each component accounts for each sample and updating the component parameters. This does not require a DNN. [Official GMM documentation](https://scikit-learn.org/stable/modules/mixture.html).

### How does this relate to nonlinear dynamics?

A mixture can represent a more complicated, non-Gaussian distribution than one Gaussian. That flexibility is about the distribution's shape; it does not automatically identify the equation governing change.

For a dynamic problem, we must specify what is being fitted: the current state distribution, a joint distribution of successive states, or a conditional distribution of the next state given the current state. These are different models. Fitting an unordered collection of states does not recover their temporal evolution.

Thus, “use a GMM for the nonlinear case” is an incomplete proposal until the distribution and the information-transfer calculation are specified. This distinction is an interpretation of what remains to be decided, not an additional meeting decision.

## 5. Entropy and the note about GMM bounds

For a continuous state, differential entropy is

\[
H(X)=-\int p(x)\log p(x)\,dx.
\]

It is a property of the whole distribution. It depends on the chosen coordinates and units, so comparisons require consistent definitions.

One nonsingular Gaussian has a closed-form entropy. A general Gaussian mixture usually does not. Consequently, fitting a mixture does not make its exact entropy immediately available.

The handwritten note about good GMM entropy bounds has a relevant published reference: Kolchinsky and Tracey, *Estimating Mixture Entropy with Pairwise Distances*. It gives computable lower and upper bounds, including formulas for Gaussian mixtures. How close the bounds are depends on the components; tightness is not universal. The corrected arXiv version also notes corrections to the published mutual-information bounds. [Paper, corrected version](https://arxiv.org/abs/1706.02419v4).

A bound brackets a quantity rather than necessarily giving its exact value. Furthermore, a bound on entropy does not automatically yield a valid bound on its time derivative or on LK. That additional step still requires justification.

## 6. Three information quantities that appear in the discussion

| Quantity | Question it asks | What it does not provide by itself |
| --- | --- | --- |
| Entropy \(H(X)\) | How spread out is the probability distribution? | Which other variable is responsible for its change |
| Mutual information \(I(X;Y)\) | How statistically dependent are these variables? | A direction: it is symmetric |
| LK information-transfer rate \(T_{j\to i}\) | How does the driver contribute to the target's entropy-change rate? | A number obtainable from arbitrary entropy estimates without the remaining LK construction |

Transfer entropy is another directed time-series quantity, defined through conditional mutual information involving past and future values. TENDE estimates transfer entropy. It should not be renamed LK: using an estimator for one quantity does not establish an estimator for the other. [TENDE, Sections 1–2](https://arxiv.org/pdf/2510.14096).

The linear LK covariance estimator has an implicit fitted linear stochastic model behind it. The ability to compute it on nonlinear data does not make it an exact nonlinear estimator. [Liang, Sections III and VI](https://arxiv.org/pdf/1403.6496).

## 7. What the DNN does in MINE and SMILE

### MINE

MINE is *Mutual Information Neural Estimation*. It trains a neural scoring function using paired samples from the joint distribution and samples representing the product of the marginals. Its training objective gives a variational estimate of mutual information.

The network is therefore an information estimator. It is not necessarily learning the physical change equation or forecasting the next state. The paired-versus-independent distinction supplies the training construction; externally supplied numerical MI labels are not required. [Belghazi et al., 2018](https://proceedings.mlr.press/v80/belghazi18a.html).

### SMILE

SMILE is the estimator introduced by Song and Ermon in *Understanding the Limitations of Variational Mutual Information Estimators*. It uses clipping in the density-ratio calculation to manage the trade-off between systematic estimation error and variability. It does not remove those problems in every setting. Their paper also analyses limitations of estimators including MINE. [Paper, Sections 3–5](https://arxiv.org/pdf/1910.06222).

### Where backpropagation fits

Backpropagation updates the network weights according to the chosen loss. It can train a network to estimate an information quantity or to approximate dynamics, but those are different objectives. The word “DNN” alone does not specify which job the network performs.

MINE and SMILE target MI. The first paper added to the reading list, *Neural Joint Entropy Estimation*, instead develops neural estimators for entropy and related quantities, starting with discrete random variables. That scope matters when considering continuous climate measurements. [Paper](https://arxiv.org/pdf/2012.11197).

## 8. The two parallel research directions

### A. Estimate distributions or information quantities

Candidate tools include fitted mixture distributions, mixture-entropy bounds, and neural information estimators. These are alternatives or components to investigate; the meeting did not establish that all should be combined.

The missing connection to specify is: which distributions or expectations must be estimated to calculate the intended LK quantity? An accurate marginal entropy or MI estimate alone does not answer that question.

### B. Fit nonlinear dynamics and then evaluate nonlinear LK

The nonlinear stochastic model can be written as

\[
dX_i=F_i(X,t)\,dt+\sum_k B_{ik}(X,t)\,dW_k.
\]

\(F_i\) describes the systematic rate of change. \(B\) describes noise amplitudes and mixing; the diffusion matrix is \(g=BB^{\mathsf T}\). These functions need not be linear.

Pires, Docquier and Vannitsem give an existing offline route: fit unknown drift and diffusion terms, estimate the required conditional averages and their derivatives, and use their nonlinear information-transfer formulas. Their model-fitting formulation uses sums of products of functions of individual variables. They test it on Lorenz. [Sections 4.3 and 6](https://arxiv.org/pdf/2307.10623).

Conditional averages mean, for example, the average of one quantity among samples where another has a specified value. The derivative describes how that average changes with the conditioning value; it is not a time derivative.

The semiconductor paper fits the drift with a wavelet neural network, estimates diffusion from squared residuals, and uses conditional regressions in its nonlinear transfer calculation. This is a published neural-model example, not verification that any arbitrary DNN can be substituted unchanged. [Section II.B](https://arxiv.org/pdf/2608.14678).

## 9. Do we have the entropy-transfer equation?

Yes. For a two-variable system, the LK definition compares two entropy-change rates:

\[
T_{2\to1}
=\frac{dH(X_1)}{dt}
-\left.\frac{dH(X_1)}{dt}\right|_{X_2\text{ frozen}}.
\]

The second term comes from the mathematical evolution with the driver's evolution frozen over the infinitesimal interval. It is not obtained merely by deleting the driver's data column or replacing it with zero.

The definition answers *what to calculate*. The nonlinear formulas and their statistical estimators answer *how to calculate it from a specified system or data*. The covariance expression is one specialised route, not the definition of all information transfer. [Liang, information flow and frozen-variable evolution](https://arxiv.org/pdf/1503.08389).

This document leaves the discrete-time formulation for the later discussion requested. Ordinary consecutive-time entropy differences alone do not isolate one driver's contribution.

## 10. The graphs and symbols on the second page

The page names a coupling graph using nonzero \(A_{ij}\), and also mentions a complete graph. In a linear equation, a nonzero coefficient records a direct dependence of one variable's change rule on another. With the convention \(dX_i=\sum_j A_{ij}X_j\,dt+\cdots\), the corresponding direction is \(j\to i\).

This graph should be distinguished from a graph whose edges are estimated information-transfer rates, and from a complete graph used as an initial set of candidates. The page alone does not establish which graph is fixed, inferred, or used to restrict the estimator. Those remain meeting questions.

The boxed notation near the top appears to involve \(\Omega\), subscripts, cardinality-like bars, and \(\theta\). Its exact symbols and definitions are unclear. The lines numbered 2.1 and 2.2 mention a family/function, but their full wording is also unclear. The bottom handwritten line is not reliably readable. These details need the author's clarification; no equations have been invented to fill them in.

## 11. What remains to learn or confirm

- What exactly is Nir's proposed family: distributions, dynamic functions, or a model containing both?
- For a GMM, which random vector and which time dependence are being modelled?
- Which entropy or information-flow expression would be evaluated from that family?
- If bounds are used, how do their errors affect entropy-change and transfer estimates?
- Are MINE/SMILE exploratory MI baselines, possible ingredients for a new LK estimator, or alternatives using a different information measure?
- How will the hidden physical state be distinguished from its noisy measurements?
- What are the meanings of the graph symbols and boxed parameters in the handwritten page?
- Which of the two research directions is intended first, and which parts must work online?

These questions preserve the current uncertainty. They are not claims that the discussed ideas cannot work.

## 12. Reading links

| Topic | Source | What to look for |
| --- | --- | --- |
| Gaussian mixtures and fitting | [Official GMM guide](https://scikit-learn.org/stable/modules/mixture.html) | Components, weights, covariance, and EM |
| Mixture entropy bounds | [Kolchinsky and Tracey, corrected version](https://arxiv.org/abs/1706.02419v4) | Which quantity is bounded and when bounds become tight |
| MINE | [Belghazi et al., 2018](https://proceedings.mlr.press/v80/belghazi18a.html) | Neural MI objective and paired versus independent samples |
| SMILE | [Song and Ermon, ICLR 2020](https://arxiv.org/pdf/1910.06222) | Clipping and estimation-error trade-offs |
| Neural entropy estimation | [Neural Joint Entropy Estimation](https://arxiv.org/pdf/2012.11197) | Its discrete-data starting point and entropy objective |
| Neural MI estimation | [Mutual Information Estimation via f-Divergence and Data Derangements, NeurIPS 2024](https://proceedings.neurips.cc/paper_files/paper/2024/file/bdcfa850adac4a1088153881282ca972-Paper-Conference.pdf) | MI target and construction of marginal training samples |
| Neural transfer entropy | [TENDE](https://arxiv.org/pdf/2510.14096) | Conditional MI definition and diffusion-based estimation |
| Nonlinear LK from fitted dynamics | [Pires et al., 2024](https://arxiv.org/pdf/2307.10623) | Section 4.3, then Lorenz in Section 6 |
| Neural dynamics followed by nonlinear transfer | [Sørensen et al., 2026](https://arxiv.org/pdf/2608.14678) | Section II.B, followed by validation limitations |

The three requested reading links are also in the [future-reading file](../todo/future-readings-code-and-papers.md#entropy-mutual-information-and-transfer-entropy-estimation).

## Source photographs

- [First handwritten page](/home/abhi/.codex/attachments/97e3ae47-5a3d-447c-8ef1-8eeef23db522/20261022_165251.jpg).
- [Second handwritten page](/home/abhi/.codex/attachments/d387cc6f-0c38-49ca-bdfc-d507fd53a2ca/20261022_165248.jpg).

These photograph links refer to local chat attachments rather than files stored in this research folder.
