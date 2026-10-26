# Data Assimilation in the Geosciences

**Data Assimilation (DA)** is the sequence of operations that estimates the state of a large dynamical system by combining observations with statistical and dynamical information, such as an evolution model. 

While DA is a standard practice in numerical weather prediction (NWP), its application is now widespread across climate, atmosphere, ocean, and environmental modeling. The complexity of DA arises from its interdisciplinary nature—spanning statistics, dynamical systems, and numerical optimization—as well as the increasing sophistication of environmental models.

## State Estimation: Formulation of the Problem

### Premises

The core problem is estimating the state of a system (e.g., the atmosphere or ocean) at any arbitrary time using two complementary, but incomplete and inaccurate, sources of information: **observations** and the **dynamical model**. DA extracts synergies between these sources to exploit their respective informational content.

In geosciences, DA is typically formalized as a discrete-model/discrete-observation estimation problem.

**Notation Conventions:**
*   $x \in \mathbb{R}^m$: An $m$-dimensional state vector of real numbers.
*   $f: \mathbb{R}^l \rightarrow \mathbb{R}^n$: A function transforming an $l$-dimensional vector into an $n$-dimensional one.
*   $x_k = x(t_k)$: Model values at discrete times $t_k$.

### The Dynamical Model

A model of the natural processes of interest is often formulated as a discrete stochastic-dynamical system:

$$
x_k = M_{k:k-1}(x_{k-1}, \lambda) + \eta_k
$$

*   $x_k \in \mathbb{R}^m$: The model state vector.
*   $\lambda \in \mathbb{R}^p$: The parameter vector (e.g., external forcings, boundary conditions).
*   $M_{k:k-1}$: A nonlinear, possibly chaotic, function propagating the state from $t_{k-1}$ to $t_k$.
*   $\eta_k \in \mathbb{R}^m$: The **model error**, formulated as an additive stochastic term.

**Model Error ($\eta_k$)** accounts for:
*   Errors in the parameters ($\lambda$).
*   Errors in the numerical schemes used for integration.
*   The effect of unresolved scales resulting from spatio-temporal discretization (e.g., transitioning from continuous Navier-Stokes equations to discrete grids).

*Note: Models can explicitly depend on time (non-autonomous systems), such as when forced by climate change. In these cases, the system lacks statistical equilibrium, potentially requiring concepts like pullback or random attractors.*

### The Observation Model

Noisy observations of $x_k$ at discrete times are represented by the vector $y_k \in \mathbb{R}^d$:

$$
y_k = H_k(x_k) + \epsilon_k
$$

*   $H_k: \mathbb{R}^m \rightarrow \mathbb{R}^d$: The **observation operator** mapping the model space to the observational space (e.g., spatial interpolations or physical transformations).
*   $\epsilon_k \in \mathbb{R}^d$: The **observational error**, modeled as an additive stochastic term.

**Observational Error ($\epsilon_k$)** accounts for:
*   Instrumental errors of the observing devices.
*   Deficiencies in the formulation of the observation operator.
*   **Error of representativeness**: The impact of unresolved scales on the explicitly resolved model scales.

#### Unique Challenges in the Geosciences
*   **Data Scarcity ($d \ll m$)**: Observations are insufficient to fully describe the system. The model is essential for propagating information across spatial and temporal gaps (e.g., unobserved ocean areas).
*   **Massive Datasets and Dimensions**: Geosciences deal with massive amounts of data ($d \approx \mathcal{O}(10^7)$) and immense model states ($m \approx \mathcal{O}(10^9)$). DA methods must perform efficient data-model fusion rapidly (e.g., 3–6 hours for NWP), representing a formidable **big-data** challenge.

### Bayesian Formulation of the State Estimation Problem

Assuming the model and observational errors are random, they can be described using probability density functions (pdfs). The Bayesian approach naturalizes the fusion of model and data by outputting a **posterior distribution** $p(x|y)$ of the unknown state $x$ conditioned on data $y$, via Bayes' rule:

$$
p(x|y) = \frac{p(y|x)p(x)}{p(y)}
$$

*   **$p(x)$ (Prior)**: The prior knowledge about the system before assimilating new data (e.g., climatology, physical principles).
*   **$p(y|x)$ (Likelihood)**: The probability of observing the data given a known true state.
*   **$p(y)$ (Marginal distribution)**: A normalization coefficient independent of $x$.

#### Time Sequences and the Hidden Markov Chain
Define the state and observation sequences as $x_{K:0} = \{x_K, x_{K-1}, ..., x_0\}$ and $y_{K:1} = \{y_K, y_{K-1}, ..., y_1\}$. 

Assuming errors are independent in time and mutually independent, we link pdfs to the model and observation equations:
$$
p(x_k|x_{k-1}) = p_\eta [x_k - M_{k:k-1}(x_{k-1})]
$$
$$
p(y_k|x_k) = p_\epsilon[y_k - H_k(x_k)]
$$

Assuming the process is **Markovian** (the state at $t_k$ only depends on $t_{k-1}$), the prior pdf splits into:
$$
p(x_{K:0}) = p(x_0) \prod_{k=1}^K p(x_k|x_{k-1}) = p(x_0) \prod_{k=1}^K p_\eta [x_k - M_{k:k-1}(x_{k-1})]
$$

Combining the split prior and observation likelihoods, the posterior distribution is given by the **hidden Markov chain** equation:

$$
p(x_{K:0}|y_{K:1}) \propto p(x_0) \prod_{k=1}^K p(y_k|x_k)p(x_k|x_{k-1}) = p(x_0) \prod_{k=1}^K p_\epsilon[y_k-H_k(x_k)]p_\eta [x_k-M_{k:k-1}(x_{k-1})]
$$

*Note: While assuming uncorrelated-in-time errors provides mathematical convenience and yields the equation above, it is rarely valid in realistic geosciences applications where model errors are naturally time-correlated.*

---

## State Estimation Problems

Observational errors can be time-correlated, for instance, when measurements are taken by the same instrument (e.g., successive satellite passes) and processed using physical models. Depending on the time period required, state estimation is categorized into three fundamental problems:

*   **Prediction:** Estimate $p(x_l|y_{k:1})$ with $l > k$.
*   **Filtering:** Estimate $p(x_k|y_{k:1})$.
*   **Smoothing:** Estimate $p(x_{K:0}|y_{K:1})$, or selected marginals like $p(x_l|y_{K:1})$ where $0 \leq l < K$.

*(See Figure 1 for a schematic illustration of these problems.)*

### Prediction
The prediction problem involves forecasting future states based on current and past observations. Formally, it is addressed by solving the **Chapman-Kolmogorov equation** to propagate the probability density function (PDF):

$$
p(x_l|y_{k:1}) = \int p_\eta [x_l - M_{l:k}(x_k)] p(x_k|y_{k:1}) dx_k
$$

In a typical prediction scenario:
*   An **analysis** is produced at $t_k$ using the forecast and observation at $t_k$. This analysis has a smaller uncertainty than the initial forecast.
*   A prediction is issued from the analysis at $t_k$ forward in time. 
*   Prediction errors grow over time due to the chaotic nature of geophysical systems. Consequently, forecast uncertainty will eventually exceed the initial analysis uncertainty.
*   Information propagates strictly forward in time.

### Filtering
**Filtering** is the most common estimation problem in geophysical applications. It employs sequential processing, utilizing measurements as they become available. It alternates between two steps:

1.  **Analysis Step:** Updates the conditional PDF $p(x_k|y_{k:1})$ using the latest observation $y_k$ via **Bayes' theorem**:

$$
p(x_k|y_{k:1}) = \frac{p_\epsilon[y_k - H_k(x_k)]p(x_k|y_{k-1:1})}{\int p_\epsilon[y_k - H_k(x_k)]p(x_k|y_{k-1:1}) dx_k}
$$

2.  **Forecast Step:** Integrates the Chapman-Kolmogorov equation from $k-1$ to $k$ to propagate the PDF forward to the time of the next observation. This result serves as the prior distribution for the subsequent analysis step.

In the filtering process, a new analysis combining the forecast and observation yields an uncertainty smaller than both the prior forecast and observational uncertainties.

### Smoothing
**Smoothing** estimates the conditional PDF of a state at any time $t_k$ ($0 \leq k \leq K$) based on all available observations (past, present, and future). 

*   It is highly relevant for **retrospective analysis** (e.g., generating historical climate reanalyses) and parameter estimation.
*   It allows simultaneous incorporation of all observations within a smoothing interval $[t_k, t_{k+2}]$. 
*   While smoothing and filtering converge at the final time $t_K$ (having incorporated the same amount of data), smoothing is generally more accurate at any prior time within the window.

The joint smoothing PDF relies on recursively applying Bayes' formula for updates and the Chapman-Kolmogorov equation for propagation. The smoothing distribution at time $t_k$ can be expressed using the subsequent state at $t_{k+1}$:

$$
p(x_k|y_{K:1}) = \int p(x_k|x_{k+1},y_{K:1})p(x_{k+1}|y_{K:1}) dx_{k+1}
$$

Furthermore, because observations $\{y_{k+1},\dots,y_K\}$ are independent of $x_k$ when $x_{k+1}$ is known:

$$
p(x_k|x_{k+1},y_{K:1}) = p(x_k|x_{k+1},y_{k:1}) = \frac{p(x_{k+1}|x_k)p(x_k|y_{k:1})}{p(x_{k+1}|y_{k:1})}
$$

These equations suggest a **forward-backward recursive algorithm**:
1.  **Forward Phase (Filtering):** Sequentially estimate and store the filter PDFs $p(x_k|y_{k:1})$ from $t_1$ to $t_K$.
2.  **Backward Phase (Smoothing):** From $t_{K-1}$ backward to $t_1$, evaluate the recursive equations using the stored filter solutions and the smoothing PDF from the previous iteration.

## A Route to Solutions: The Gaussian Approximation

While the full PDFs describe the probabilities of all possible system states, they are difficult to use directly in estimation algorithms. Two traditional approaches define the best estimator:

*   **Minimum Squared Error Estimators:** Target the **mean** of the distribution. Irrespective of PDF symmetry or modality, the mean always minimizes squared errors.
*   **Maximum A Posteriori (MAP) Estimators:** Target the **mode** (the peak or most probable state) of the distribution.

Due to the immense dimensionality of typical environmental models, fully Bayesian approaches are computationally infeasible. To overcome this, errors and uncertainties are commonly assumed to be **Gaussian distributed**. This crucial assumption allows the PDFs to be completely described by just two moments:
1.  **Mean** (First moment)
2.  **Covariance matrix** (Second moment)

This Gaussian approximation underpins most data assimilation (DA) methods used in geosciences, branching into two main categories:
*   **Minimum Variance Methods (Kalman-like)** 
*   **Maximum A Posteriori Methods (Variational)**

### The Linear and Gaussian Case

When the dynamical and observational models are both **linear**, and all noise is **Gaussian**, we can formulate exact analytical solutions.

**Dynamical Model:**
$$
x_k = M_{k:k-1}x_{k-1} + \eta_k, \quad \eta_k \sim \mathcal{N}(0, Q_k)
$$

**Observational Model:**
$$
y_k = H_kx_k + \epsilon_k, \quad \epsilon_k \sim \mathcal{N}(0, R_k)
$$

Where:
*   $M_{k:k-1}$ and $H_k$ are linear matrices.
*   Observational ($\epsilon_k$) and model ($\eta_k$) noises are mutually uncorrelated, unbiased, and Gaussian with covariance matrices $R_k$ and $Q_k$, respectively.

#### The Kalman Filter (KF)
Under these linear and Gaussian hypotheses, the **Kalman Filter (KF)** is the optimal recursive solution to estimate the conditional mean and covariance of the filtering PDF $p(x_k|y_{k:0})$. It is known as the Best Linear Unbiased Estimator (BLUE).

The KF alternates between two steps (where superscripts $f$ and $a$ denote forecast and analysis):

**Forecast Step:**
$$
x^f_k = M_{k:k-1}x^a_{k-1}
$$
$$
P^f_k = M_{k:k-1}P^a_{k-1}M^T_{k:k-1} + Q_k
$$

**Analysis Step:**
$$
K_k = P^f_k H^T_k (H_k P^f_k H^T_k + R_k)^{-1}
$$
$$
x^a_k = x^f_k + K_k(y_k - H_k x^f_k)
$$
$$
P^a_k = (I_k - K_k H_k)P^f_k
$$

Here, $K_k$ is the **Kalman Gain**, representing the optimal linear combination weights between the prior forecast and the new observations.

#### The Kalman Smoother (KS)
The **Kalman Smoother (KS)** (specifically, the Rauch-Tung-Striebel smoother) extends the KF to recursively estimate the PDF at any arbitrary time within the observation window, conditioned on *all* observations in that window. 

After running the forward-in-time KF and storing the forecast and analysis parameters, the KS runs backward in time ($k = K-1, \dots, 1$) using the smoothing mean $x^{sm}_k$ and covariance $P^{sm}_k$:

$$
S_k = P^a_k M^T_{k+1:k} (P^f_{k+1})^{-1}
$$

**KS Mean:**
$$
x^{sm}_k = x^a_k + S_k(x^{sm}_{k+1} - x^f_{k+1})
$$

**KS Covariance:**
$$
P^{sm}_k = P^a_k + S_k(P^{sm}_{k+1} - P^f_{k+1})S^T_k
$$

At the final time $t_K$, the KS is initialized with the KF analysis: $x^{sm}_K = x^a_K$ and $P^{sm}_K = P^a_K$.

### The Variational Approach
**Variational methods** aim to estimate the model trajectory that globally "best fits" all observations within a defined window $[t_0, t_K]$. Because the trajectory is adjusted to fit all data simultaneously, any state estimate within the window is influenced by all available observations.

The solution is found by minimizing a scalar cost function $J(x_{K:0})$ that quantifies the model-to-data misfit:

$$
x^a_{K:0} = \text{argmin}(J(x_{K:0}))
$$

The optimal trajectory $x^a_{K:0}$ minimizes this cost function while remaining dynamically consistent with the model over the entire observing window.

---

## 3.2 Variational Data Assimilation

The variational problem does not strictly require a linear model or specific hypotheses on the statistical nature of errors. However, common formulations in the geosciences introduce assumptions to make optimization tractable. 

If observational and model errors are assumed uncorrelated in time, unbiased, and Gaussian distributed with covariances $R_k$ and $Q_k$ respectively, these errors are penalized in a cost function:

$$
J(x_{K:0}) = \frac{1}{2} \sum_{k=0}^{K} \|y_k - H_k(x_k)\|^2_{R_k^{-1}} + \frac{1}{2} \sum_{k=1}^{K} \|x_k - M_{k:k-1}(x_{k-1})\|^2_{Q_k^{-1}} + \frac{1}{2} \|x_0 - x^b\|^2_{B^{-1}} \quad (24)
$$

**Key variables:**
* $\|x\|^2_A = x^T A x$: The weighted Euclidean norm.
* $x^b \in \mathbb{R}^m$: The prior or **background** mean at the start of the window.
* $B \in \mathbb{R}^{m \times m}$: The background error covariance matrix.

### Solving the Variational Problem

The calculus of variations finds the extremum of $J(x_{K:0})$ by deriving the **Euler-Lagrange equations**. This involves appending the model dynamics to the cost function using a Lagrange multiplier vector ($\Gamma_k \in \mathbb{R}^m$):

$$
L(x_{K:0},\Gamma) = J(x_{K:0}) + \sum_{k=1}^{K} \Gamma_k^T \left( x_k - M_{k:k-1}(x_{k-1}) - \psi_k \right) \quad (25)
$$

Here, $\psi_k$ represents a deterministic model error term.

Solving these equations for realistically scaled geophysical systems is practically impossible without major approximations:
* **Representer Method**: Reduces the problem dimension to the number of measurements. Useful for linear dynamics and limited data (Bennett, 1992), but unscalable to modern high-dimensional Numerical Weather Prediction (NWP).
* **Descent Methods**: Relies on iterative minimization using the gradient vector of the cost function (Talagrand and Courtier, 1987). Widely used in operational NWP centers.

At the cost function minimum, its gradient must vanish and its Hessian matrix must be positive definite:

$$
\nabla_{x_{K:0}} J(x_{K:0}) = 0, \quad \nabla^2_{x_{K:0}} J(x_{K:0}) > 0 \quad (26)
$$

### 3.2.1 Statistical Interpretation and 4DVar

The cost function dictates the balance between observational data and the model. A statistically natural choice is to set the cost function proportional to the conditional posterior probability density function (pdf), $p(x_{K:0} | y_{K:0})$. Under Gaussian assumptions, Bayes' rule yields a posterior that is the product of three Gaussian pdfs:

$$
\ln p(x_{K:0}|y_{K:0}) \propto - \frac{1}{2} \left[ \sum_{k=0}^{K} \|y_k - H_k(x_k)\|^2_{R_k^{-1}} + \sum_{k=1}^{K} \|x_k - M_{k:k-1}(x_{k-1})\|^2_{Q_k^{-1}} + \|x_0 - x^b\|^2_{B^{-1}} \right] \quad (28)
$$
$$
= -J_{w4DVar}(x_{K:0}) \quad (29)
$$

Maximizing $\ln p(x_{K:0}|y_{K:0})$ is exactly equivalent to minimizing the corresponding **Weak-Constraint 4DVar** ($w4DVar$) cost function.

### Weak-Constraint vs. Strong-Constraint 4DVar

**Weak-Constraint 4DVar ($w4DVar$)**
* **Premise**: The model dynamics contain errors and serve merely as a "weak constraint." 
* **Control Variable**: The full trajectory across the time window, $x_{K:0}$. Optimization happens with respect to the entire trajectory simultaneously.
* **Advantages**: Can naturally handle stochastic errors without requiring time-correlated model error assumptions. When both the dynamical and observational models are linear, the $w4DVar$ solution matches the Kalman Smoother.
* **Limitations**: Highly computationally demanding due to a massive control variable size $\mathcal{O}(m \times K)$ and difficulties in estimating model error covariances $Q_k$. 

**Strong-Constraint 4DVar ($s4DVar$)**
* **Premise**: The model is assumed to be **perfect** ($\psi_k = 0$). This deterministic assumption simplifies the problem from a constrained to an unconstrained optimization.
* **Control Variable**: Reduced to just the initial state at the start of the window, $x_0$.
* **Cost Function**: State variables follow purely from the initial state via $x_k = M_{k:0}(x_0)$:

$$
J_{s4DVar}(x_0) = \frac{1}{2} \sum_{k=0}^{K} \|y_k - H_k \circ M_{k:0}(x_0)\|^2_{R_k^{-1}} + \frac{1}{2} \|x_0 - x^b\|^2_{B^{-1}} \quad (30)
$$

* **Gradient and Adjoints**: Differentiating the composition of functions via the chain rule requires the **adjoint operator** ($M^T_{k:0}$), which performs a backward integration from $t_k$ to $t_0$:

$$
\nabla_{x_0} J_{s4DVar}(x_0) = - \sum_{k=0}^{K} M^T_{k:0} H^T_k R_k^{-1} [y_k - H_k \circ M_{k:0}(x_0)] + B^{-1}(x_0 - x^b) \quad (31)
$$

In a linear system, the $s4DVar$ analysis at the end of the window matches the Kalman Filter. Minimization requires iteratively calculating forward nonlinear and backward adjoint integrations until convergence. 

*(Figure 2 contrasts these: $w4DVar$ corrects the entire trajectory, $s4DVar$ corrects $x_0$ and relies on a forward run, and 3DVar computes isolated corrections sequentially at each observation time).*

---

## 4. Ensemble Methods

**Ensemble-based methods** leverage a Monte Carlo approach to approximate transition densities using an ensemble of model dynamics realizations. The most prominent examples are the **Ensemble Kalman Filter (EnKF)** and the **Ensemble Kalman Smoother (EnKS)**.

**Key Characteristics:**
* **Gaussian Hypothesis**: The update step still fundamentally relies on analyzing mean and covariance.
* **Error Representation**: Instead of storing massive covariance matrices, error statistics are approximated via an ensemble of finite size $N$. Sampling errors decrease proportionally to $1/\sqrt{N}$.
* **Computational Efficiency**: A surprisingly small number of particles ($N \approx 100$) often suffices, rendering the EnKF feasible for heavily parameterized geoscientific problems.
* **Operational Success**: The EnKF is deployed operationally by major meteorological and oceanic forecasting centers (e.g., Canada's CMC and Norway's TOPAZ system for the Copernicus Marine Services).

### 4.1 Stochastic Ensemble Kalman Filter

Introduced by Evensen (1994) and formalized in subsequent studies, the **Stochastic EnKF** relies directly on an ensemble representation for error covariances. By representing uncertainty mathematically through an ensemble of states, the Stochastic EnKF avoids propagating explicit covariance matrices and effortlessly adapts to both linear and nonlinear observation operators.

---

## 4.1.1 Representation of Error Statistics

Given an ensemble of model realizations at a given time, we introduce the **ensemble matrix**:

$$
E^{f,a} = [x_1^{f,a}, \dots, x_N^{f,a}] \in \mathbb{R}^{m \times N}
$$

which contains the $N$ ensemble members in its columns. Since the true state is not known, we define the **ensemble-anomaly covariance matrices** around the ensemble mean instead. 

First, we define the **ensemble mean**:

$$
\bar{x}^{f,a} = \frac{1}{N} \sum_{n=1}^{N} x_n^{f,a}
$$

Using this, the **ensemble-anomaly matrix** is given by:

$$
X^{f,a} = \frac{1}{\sqrt{N-1}} \left[ x_1^{f,a} - \bar{x}^{f,a}, \dots, x_N^{f,a} - \bar{x}^{f,a} \right] \in \mathbb{R}^{m \times N}
$$

The ensemble-based error covariance matrices for the forecast (superscript $f$) and analysis (superscript $a$) ensembles are:

$$
(P^e)^f = X^f (X^f)^T
$$
$$
(P^e)^a = X^a (X^a)^T
$$

The superscript $e$ denotes quantities estimated based on the ensemble. This formulation assumes the ensemble mean is the best state estimate, and the ensemble spread represents the natural error in that mean. The ensemble of model states serves as a **Monte Carlo representation** of the probability density function (PDF).

## 4.1.2 Prediction of Error Statistics

To predict the joint PDF over a time interval, each realization of $x$ is integrated according to the model equations. This finite ensemble of model states provides an ensemble approximation of the joint PDF for the desired time interval.

## 4.1.3 Analysis Scheme

The **Ensemble Kalman Filter (EnKF)** analysis scheme avoids computing full covariances by applying standard Kalman Filter updates directly to each ensemble member. To ensure the EnKF analysis error covariance is consistent with the standard Kalman Filter, observations must be treated as random variables.

For an observation vector $y \in \mathbb{R}^d$, we define an ensemble of **perturbed observations**:

$$
y_n = y + \epsilon_n, \quad 1 \leq n \leq N
$$

These are stored in the **observation matrix**:

$$
Y^o = [y_1, \dots, y_N] \in \mathbb{R}^{d \times N}
$$

We define the **normalized anomaly ensemble of observations**:

$$
(Y')^o = \frac{1}{\sqrt{N-1}} [y_1 - y, \dots, y_N - y] = \frac{1}{\sqrt{N-1}} [\epsilon_1, \dots, \epsilon_N]
$$

Subtracting the non-zero mean from the random draws ensures the perturbations have a zero ensemble-mean, preventing bias. The ensemble covariance matrix of measurement errors is:

$$
R^e = (Y')^o \left( (Y')^o \right)^T
$$

As $N \to \infty$, $R^e$ converges to the exact error covariance matrix $R$.

Each ensemble member is updated via:

$$
x_n^a = x_n^f + (P^e)^f H^T \left( H (P^e)^f H^T + R^e \right)^{-1} (y_n - H x_n^f), \quad 1 \leq n \leq N
$$

This yields the updated **ensemble mean**:

$$
\bar{x}^a = \bar{x}^f + (P^e)^f H^T \left( H (P^e)^f H^T + R^e \right)^{-1} (y - H \bar{x}^f)
$$

The updated **analyzed covariance** is:

$$
(P^e)^a = [I - K^e H](P^e)^f
$$

where $K^e$ is the ensemble-based Kalman gain matrix.

**Key characteristics of the EnKF Analysis Scheme**:
* **Approximate for non-Gaussian**: It does not correctly account for non-Gaussian contributions in the predicted ensemble.
* **Preserves prior non-Gaussian structures**: Because only the updates added to the prior non-Gaussian ensemble are linear, the updated ensemble inherits non-Gaussian properties from the forecast ensemble.
* **Computationally efficient**: It avoids full re-sampling of the posterior distribution.

## 4.1.4 Formulation in Terms of the Ensemble

We can rewrite the analysis equation without explicitly referencing the error covariance matrices:

$$
E^a = E^f + X^f (X^f)^T H^T \left( H X^f (X^f)^T H^T + (Y')^o \left( (Y')^o \right)^T \right)^{-1} [Y^o - H E^f]
$$

This simplifies to:

$$
E^a = E^f T
$$

where the **transformation matrix** $T \in \mathbb{R}^{N \times N}$ is:

$$
T = I_N + Y^T C^{-1} (Y^o - H E^f)
$$

Here, the **observed ensemble-anomaly matrix** is:

$$
Y = H X^f \in \mathbb{R}^{d \times N}
$$

and $C$ is defined as:

$$
C = Y Y^T + (Y')^o \left( (Y')^o \right)^T \in \mathbb{R}^{d \times d}
$$

This indicates that the updated ensemble $E^a$ is formed from a linear combination of the forecast ensemble members and resides within the space spanned by the forecast ensemble.

There are two primary sources of sampling error in the stochastic EnKF:
1. The finite number of ensemble realizations.
2. The introduction of stochastic measurement perturbations.

## 4.2 Deterministic Square-Root Schemes

**Square-root schemes** (e.g., ETKF, EAKF, MLEF) eliminate the sampling error caused by stochastic measurement perturbations by calculating the analysis update deterministically.

### 4.2.1 Updating the Mean

The analyzed ensemble mean is updated using the standard Kalman Filter analysis equation, without perturbed observations:

$$
\bar{x}^a = \bar{x}^f + X^f Y^T C^{-1} (y - H \bar{x}^f)
$$

Here, $C$ utilizes the exact measurement covariance $R$ instead of perturbed ensembles:

$$
C = Y Y^T + R
$$

### 4.2.2 Updating the Ensemble Perturbations

Starting from the ensemble-based covariance update:

$$
(P^e)^a = (P^e)^f - (P^e)^f H^T \left( H (P^e)^f H^T + R \right)^{-1} H (P^e)^f
$$

We rewrite it using the anomaly matrices:

$$
X^a (X^a)^T = X^f \left[ I_N - Y^T C^{-1} Y \right] (X^f)^T = X^f \left[ I_N + Y^T R^{-1} Y \right]^{-1} (X^f)^T
$$

Using the eigenvalue factorization $I_N - Y^T C^{-1} Y = Z \Lambda Z^T$, the simplest square-root update is:

$$
X^a = X^f Z \sqrt{\Lambda}
$$

However, this creates a bias and does not preserve the zero mean. A **symmetric square root** resolves this by preserving the zero mean in the updated perturbations:

$$
X^a = X^f Z \sqrt{\Lambda} Z^T
$$

This ensures that any non-Gaussian distribution shape in the predicted ensemble is retained (though variance is reduced).

An alternative approach uses a **random rotation** to generate updated perturbations that better approximate a Gaussian distribution:

$$
X^a = X^f Z \sqrt{\Lambda} Z^T \Phi^T
$$

where $\Phi$ is a mean-preserving random orthogonal matrix. Unlike EnKF's stochastic measurements, this random rotation eliminates prior non-Gaussian structures from the forecast ensemble.

---

## 4.3 Ensemble Kalman Smoother (EnKS)

The **Ensemble Kalman Smoother (EnKS)** is a straightforward extension of the EnKF that uses the EnKF output as a prior. While the EnKF uses ensemble covariances to spread information spatially, the EnKS uses them to spread information **both spatially and temporally** (including backward in time).

Assume measurements are available at discrete times $t_k$ for $k = 1, \dots, K$. The EnKF solution is computed recursively by assimilating observations as they arrive and propagating the ensemble forward. 

The analysis update at time $t_k$ (which does not have to be an observation time) from measurements available at a later time $t_j$ ($1 \leq k < j \leq K$) is given by:

$$ E^a_k = E^f_k + X^f_k Y^T_j C^{-1}_j (Y_{o,j} - Y_j) $$

where $Y_j$ and $C_j$ are evaluated using the ensemble and measurements at $t_j$. The product $X^f_k Y^T_j$ represents the covariance between the predicted measurements at $t_j$ and the model state at $t \leq t_j$. The update at $t_k$ uses the exact same combination of ensemble members defined by the transform matrix $T_k$ for the EnKF analysis at time $t_k$.

Thus, the EnKS analysis can be compactly written as:

$$ E^{a,\text{EnKS}}_k = E^{a,\text{EnKF}}_k \prod_{j=\hat{k}}^K T_j $$

where $\hat{k}$ is the first data time after $t_k$, and $t_K$ is the last measurement time. 

**Key Implementation Details:**
* **Efficiency:** The EnKS analysis can be computed immediately after the EnKF solution is found. It requires storing only the transform matrices $T_k \in \mathbb{R}^{N \times N}$ and the EnKF ensemble matrices at the desired smoother times.
* **Memory Management:** To handle large ensemble matrices, variables can be stored only at selected locations where the EnKS solution is needed.
* **No-Cost Smoother:** Also known as **Running in Place (RIP)**, this implementation computes the weights of ensemble members at the end of the assimilation window and applies them throughout. It accelerates the spin-up of filters like the Local Ensemble Transform Kalman Filter (LETKF) and Ensemble Square-Root Filter (EnSRF).

## 4.4 Making it Work: Localization and Inflation

The dimensionality reduction achieved through the Monte Carlo treatment in the EnKF comes at a cost. With a limited number of anomalies ($N$), the sample covariance matrix $P_e$ becomes severely rank-deficient. 

For a true error covariance matrix $B$, the sample covariance error between two distinct entry indices $i$ and $j$ (corresponding to distinct locations) is:

$$ \mathbb{E} \left[ [P_e - B]^2_{ij} \right] = \frac{1}{N-1} \left( [B]^2_{ij} + [B]_{ii}[B]_{jj} \right) $$

In most spatial geophysical systems, the true covariance $[B]_{ij}$ vanishes exponentially with distance. However, for a finite ensemble size ($N \ll m$), the sample variance approaches a non-zero value for large separation distances:

$$ \mathbb{E} \left[ [P_e - B]^2_{ij} \right] \xrightarrow{|i-j| \to \infty} \frac{1}{N-1} [B]_{ii}[B]_{jj} $$

This approximation generates **spurious correlations** between distant parts of the system. Over multiple assimilation cycles, the accumulation of these sampling errors almost systematically causes the EnKF to diverge in high-dimensional systems. Two complementary techniques are heavily used to stabilize the filter: **localization** and **inflation**.

### 4.4.1 Localization

Localization assumes that the interdependence of distant parts of a physical system is negligible, leveraging the natural exponential decrease of correlations with distance. 

#### Covariance Localization (CL)
Covariance localization regularizes the sample error covariance matrix to mitigate rank-deficiency and suppress spurious correlations. This is achieved by computing the Schur (Hadamard) product of $P_e$ with a well-chosen smooth correlation function $\rho$:

$$ [\rho \circ P_e]_{ij} = [\rho]_{ij} [P_e]_{ij} $$

The Schur product theorem ensures the resulting matrix remains positive semi-definite. The correlation function $\rho$ typically relies on the **Gaspari-Cohn (GC) function**, a fifth-order piecewise rational function that mimics a Gaussian distribution but drops to exactly zero beyond a localization radius $c$. For a normalized distance $r$, the GC function $G(r)$ is defined as:

$$ G(r) = \begin{cases} 1 - \frac{5}{3}r^2 + \frac{5}{8}r^3 + \frac{1}{2}r^4 - \frac{1}{4}r^5, & \text{if } 0 \leq r < 1 \\ 4 - 5r + \frac{5}{3}r^2 + \frac{5}{8}r^3 - \frac{1}{2}r^4 + \frac{1}{12}r^5 - \frac{2}{3r}, & \text{if } 1 \leq r < 2 \\ 0, & \text{if } r \geq 2 \end{cases} $$

By setting the localization radius $c$ to the correlation length $L$, we define $[\rho]_{ij} = G(|i-j|/L)$. 

To avoid manipulating excessively large regularized matrices ($m \times m$), implementations often exploit the sparsity of $\rho$, combine CL with domain localization, or apply the Schur product in observation space to compute the Kalman gain more efficiently.

#### Domain Localization (DL)
Domain localization performs the global EnKF analysis as a collection of independent, local analyses. 
* To update a state at location $x$, the filter locally assimilates only observations within a disk of radius $L$ centered on $x$.
* The local observation count must be small enough so that $P_e$ remains locally full rank. 
* Equivalently, infinite variance is assigned to all entries in the observation error covariance matrix $R$ that correspond to sites outside the disk.
* A global analysis is reconstructed by merging the local updates. To ensure smooth transitions, $R^{-1}$ is often tapered using a regularizing cut-off function (like the GC function).

**Advantages of DL:** Local analyses can be performed entirely in parallel, and numerical complexity scales only with the ensemble size and local observation count.

*Note:* For chaotic systems, the minimum ensemble size below which localization becomes mandatory corresponds to the dimension of the system's unstable and neutral subspace.

### 4.4.2 Inflation

While localization addresses rank-deficiency and spurious correlations, residual sampling errors often remain and can still cause long-term divergence. **Inflation** artificially increases the error covariance matrix to compensate.

* **Multiplicative Inflation:** Scales the error covariance matrix by a factor $\lambda^2 \geq 1$:
  $$ P_e \to \lambda^2 P_e $$
  This is commonly implemented by inflating the ensemble anomalies: 
  $$ x_n \to \bar{x} + \lambda(x_n - \bar{x}) $$
* **Additive Inflation:** Adds random noise directly to the ensemble members:
  $$ x_n \to x_n + \epsilon_n \quad \text{with} \quad \mathbb{E}[\epsilon_n \epsilon_n^T] = Q $$

Historically manually tuned, numerous adaptive schemes have been developed to automate the inflation process (e.g., the Deterministic EnKF or DEnKF relies on implicit inflation).

## 4.5 Ensemble Variational Methods (EnVar)

Both **4DVar** and the **EnKF** are widely used in operational meteorology, but they possess fundamental differences:
* **4DVar:** Uses nonlinear optimization to find the maximum a posteriori estimate. It relies on time-independent error statistics and requires the technically challenging derivation of adjoint models.
* **EnKF:** Performs a linear analysis update and propagates "errors of the day" (time-dependent statistics) using the tangent linear of the observation operator and its adjoint within the ensemble subspace.

**Ensemble Variational methods (EnVar)** aim to combine the strengths of both approaches. By merging them, EnVar achieves nonlinear analysis and dynamically evolving error statistics while circumventing the need for complex adjoint models.

---

# Ensemble Variational Data Assimilation (EnVar)

A classification of these methods and terminology distinguishes between four main categories: **hybrid methods**, **ensemble of data assimilation (EDA)**, **4DEnVar**, and full nonlinear four-dimensional EnVar methods, of which the **Iterative Ensemble Kalman Smoother (IEnKS)** is a deterministic exemplar.

## 4.5.1 Hybrid Methods

"Hybrid" can refer to any combination of a variational method and an Ensemble Kalman Filter (EnKF). Most often, it refers to hybridizing a static error covariance matrix with a dynamical one sampled from an ensemble. 

The objective is to use the static covariance of a 3DVar and perform a variational analysis for the analysis step of an EnKF. The effective covariance matrix used for the prior is:

$$ B = \alpha C + (1 - \alpha) X_f X_f^T $$

Where:
*   **$C$**: Static error covariance matrix (as used in 3DVar or optimal interpolation).
*   **$X_f$**: Matrix of the forecast ensemble anomalies.
*   **$\alpha \in [0,1]$**: A scalar that weights the static and dynamical contributions.

The updated ensemble can be obtained within a stochastic EnKF framework using multiple stochastically perturbed variational problems. In a deterministic EnKF framework, updating the anomalies relies on an approximation due to the rank reduction from the hybrid covariance to the new dynamical covariances. Methods like the left-transform update or Lanczos vectors can improve this update. Localization of the sample covariances may also be necessary, defined as $B = \alpha C + (1 - \alpha) \rho \circ X_f X_f^T$, using covariance localization (CL).

## 4.5.2 Ensemble of Data Assimilations (EDA)

Developed by meteorological prediction centers like Météo-France and ECMWF, EDA introduces dynamical errors absent in traditional 4DVar. To build on existing 4DVar systems, it considers an ensemble of $N$ 4DVar analyses.

Each analysis $i$ uses a different first guess $x_0^i$ and observations perturbed with $\epsilon_k^i \sim \mathcal{N}(0, R_k)$ to maintain statistical consistency. Each analysis carries out the minimization of:

$$ J_{EDA}^i(x_0) = \frac{1}{2} \sum_{k=0}^K \| y_k + \epsilon_k^i - H_k \circ M_{k:0}(x_0) \|_{R_k^{-1}}^2 + \frac{1}{2} \| x_0 - x_0^i \|_{B^{-1}}^2 $$

The background covariance $B$ is typically a hybrid (as in the hybrid methods) combining static 4DVar covariances and sampled covariances from dynamical perturbations. This yields an updated ensemble from which a dynamical part of the error covariance matrix can be assessed. 

In linear and Gaussian cases, EDA is exactly Bayesian. EDA also frequently requires covariance localization (CL), which can be enforced via the $\alpha$ control variable trick (mathematically equivalent to CL) or wavelet truncations.

## 4.5.3 4DEnVar

To address the poor scalability and the high maintenance cost of the adjoint model in operational 4DVar, **4DEnVar** was developed. It leverages the EnKF's ability to estimate observation sensitivities to state variables using the full observation model, bypassing the tangent linear and its adjoint.

The sensitivities of the observations within a Data Assimilation Window (DAW) are associated with the composition $H \circ M$ over the DAW. These sensitivities, with respect to the degrees of freedom of each anomaly, can be approximated as:

$$ \varepsilon^{-1} H_k \circ M_{k:0} (x_0 \mathbf{1}^T + \varepsilon X_f) \left( I_m - \frac{1}{m} \mathbf{1} \mathbf{1}^T \right) $$

*   With $0 < \varepsilon \ll 1$, perturbations are seen as generated by the tangent linear of $H_k \circ M_{k:0}$ (via finite differences).
*   With $\varepsilon = \sqrt{m-1}$, perturbations account for the nonlinearity of $H_k \circ M_{k:0}$ as in the EnKF.

These sensitivity vectors form a basis for the analysis. 

**Key characteristics of 4DEnVar:**
*   Avoids the need for a model adjoint and introduces flow-dependent error estimation.
*   Typically utilizes a hybrid background due to its operational NWP origins.
*   Requires localization to mitigate the limited rank of the sample error covariance matrix.
*   Localization must be applied across space and time within the DAW. Since static localization and dynamics generally do not commute, a **covariant localization** that changes in time with the flow is necessary. 

## 4.5.4 The Iterative Ensemble Kalman Smoother (IEnKS)

Unlike other heuristically designed EnVar methods, the **IEnKS** is a four-dimensional EnVar method rigorously derived from Bayes’ rule. It extends the Iterative Ensemble Kalman Filter to a full DAW, catching the best of 4DVar (nonlinear analysis) and EnKF (flow-dependence of error statistics). 

The IEnKS acts as an EnKF where each analysis corresponds to a nonlinear 4DVar analysis within a reduced ensemble subspace. Its cost function is:

$$ J(w) = \frac{1}{2} \| w \|^2 + \frac{1}{2} \sum_{k=L-S+1}^L \| y_k - H_k \circ M_{k:0} (x_0 + X_0 w) \|_{R_k^{-1}}^2 $$

Where:
*   **$L$**: Length of the DAW.
*   **$S$**: Length of the forecast in between cycles.
*   **$X_0$**: Matrix containing the normalized initial anomalies along its columns.
*   **$w$**: Vector of coefficients used to parametrize the state vector ($x = x_0 + X_0 w$).

**Advantages and characteristics of IEnKS:**
*   Minimization is performed in the ensemble subspace using nonlinear optimization (e.g., Gauss-Newton, Levenberg-Marquardt).
*   Sensitivities are computed using an ensemble forecast within the DAW, emulating the tangent and adjoint models without explicitly requiring them.
*   Outperforms standard scalable DA methods in terms of accuracy in chaotic systems for both filtering and smoothing.
*   Can account for temporally correlated errors (e.g., systematic constant biases) within its DAW.

## 5. Special Topics

Key topics related to the application of DA in geosciences include:
*   Dealing with the chaotic nature of the atmosphere and ocean.
*   Adapting DA methods originally devised for Gaussian quantities to tackle non-Gaussian variables.
*   Data assimilation for chemical species (e.g., pollutant dispersion, accidental nuclear release).

### Summary Table: Comparison of EnVar Techniques

*The following table summarizes key properties of the discussed EnVar methods based on whether they use linear/nonlinear analysis, require adjoint models, use flow-dependent backgrounds, and apply localization.*

| Algorithm | Analysis Type | Evol. Model Adjoint? | Obs. Operator Adjoint? | Flow-Dependent Background? | Perturbations | Localization Required? |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **EnKF** | Linear | No | Yes | Both | Sto./Det. | Yes |
| **3DVar** | Nonlinear | No | Yes | No | - | No |
| **4DVar** | Nonlinear | Yes | Yes | No | - | No |
| **EDA w/ 4DVar** | Nonlinear | Yes | Yes | Yes | Stochastic | Partial |
| **4DEnVar** | Linear | No | No | Yes | Stochastic | Yes |
| **IEnKS** | Nonlinear | No | No | Yes | Deterministic | Yes |
| **MLEF** | Nonlinear | No | Yes | Yes | Deterministic | Yes |
| **4D-ETKF** | Linear | No | No | Yes | Deterministic | Yes |

---

## Context: 4DEnVar and Covariance Hybridization

Adjoint models can be bypassed by using an Ensemble Data Assimilation (EDA) of **4DEnVar**. Depending on the implementation, perturbations are often generated by a concomitant Ensemble Kalman Filter (EnKF) and facilitated through the hybridization of covariances.

---

## 5.1 Dealing with Chaotic Dynamics

Many natural systems, including the atmosphere and ocean, exhibit **chaotic dissipative dynamics**. The defining characteristic impacting prediction is their extreme sensitivity to initial conditions. Infinitesimal errors grow exponentially in a highly flow-dependent manner, requiring a shift from single-realization deterministic forecasts to **multi-realization probabilistic forecasts** using ensemble schemes.

### Dimensional Reduction and the Unstable-Neutral Subspace
A major challenge for Data Assimilation (DA) is tracking flow-dependent error growth within extremely large geophysical models ($m \approx O(10^9)$). However, friction induces a dissipative character that naturally reduces the effective dimensionality. The error dynamics are largely confined to an **unstable-neutral subspace** of dimension $n_0 \ll m$.

* **Unstable-Neutral Subspace**: The vector space generated by backward Lyapunov vectors with non-negative Lyapunov exponents. It consists of small perturbations that do not exponentially decay under backward dynamics.
* **Phase-Space Splitting**: The full phase-space splits into a stable subspace and a much smaller unstable-neutral subspace. 

### Impact on DA Performance
The underlying splitting of the phase space governs the success of DA with chaotic models:
* **Ensemble Methods (EnKF/EnKS)**: For deterministic models, the minimum ensemble size must be at least the number of non-negative Lyapunov exponents ($n_0$) to achieve good performance.
* **Variational DA**: Over long DA windows (DAW), stable components dampen, confining the error essentially to the unstable subspace.
* **Covariance Alignment**: The error covariance matrices of the Kalman Filter (KF) and Kalman Smoother (KS) asymptotically converge to the unstable-neutral subspace, with the KS converging faster. In four-dimensional EnVar (IEnKS) applied to a noiseless system, maximum error reduction occurs when the ensemble anomaly subspace fully aligns with the unstable-neutral subspace.

### Assimilation in the Unstable Subspace (AUS)
**AUS** is a DA paradigm that explicitly uses the unstable-neutral subspace to parameterize state estimate uncertainty.
* By monitoring only the $n_0$ unstable-neutral directions, DA can be performed efficiently on high-dimensional systems.
* AUS has been successfully incorporated into the Extended Kalman Filter (EKF) and 4DVar, with extensions to address non-linear error dynamics and imperfect models.

---

## 5.2 Dealing with Non-Gaussian Variables

Linear analysis is inherently sub-optimal for non-Gaussian variables (states, observations, or model parameters). Ignoring non-Gaussian characteristics can lead to systematic biases, underestimated correlation lengths, or non-physical outputs (e.g., negative tracer concentrations).

### Gaussian Anamorphosis (Normal-Score Transform)
To correct non-Gaussian distributions, a strict, monotonically increasing nonlinear function is applied to the cumulative probability density function (pdf) to render it Gaussian.

* **Transformations**: Applied to state variables ($\tilde{x} = \varphi(x)$), observations ($\tilde{y} = \phi(y)$), or parameters. 
* **Matrix Updates**: The standard stochastic models and EnKF/EnKS equations are reused with the transformed variables:

$$
E^{f/a} = \left(\tilde{x}^{f/a}_{[1]}, \tilde{x}^{f/a}_{[2]}, \dots, \tilde{x}^{f/a}_{[N]}\right) \in \mathbb{R}^{m \times N}
$$

$$
Y^o = \left(\tilde{y}_{[1]}, \tilde{y}_{[2]}, \dots, \tilde{y}_{[N]}\right) \in \mathbb{R}^{d \times N}
$$

* **Inverse Transformation**: After the DA update, the inverse transformation $\varphi^{-1}$ is applied to each ensemble member. Monte Carlo techniques are often used to address biased statistics during back-transformation.
* **Design Approaches**: Anamorphosis functions can be simple analytical forms (exponential, gamma, logit), piece-wise linear fits based on data histograms, or adaptive fits to ensemble forecasts.

**Benefits and Limitations**
* **Positivity**: Easily enforces strict bounds, such as positivity constraints in ecosystem and hydrological models.
* **Multi-Gaussian Limitation**: Standard anamorphosis transforms marginal distributions independently. While this often improves multi-Gaussian properties, it does not guarantee a true multi-Gaussian joint distribution (copulas can be introduced to extend functionality).

### Handling Discontinuous Distributions
Gaussian anamorphosis struggles with discontinuous pdfs. A better alternative is the **Truncated Gaussian** framework, where a threshold is defined, and values exceeding it are reset to generate a probability atom.
* **Methods**: Gibbs sampling, Quadratic Programming (which accommodates nonlinear constraints), or moderating the DA strength to avoid reaching distribution discontinuities.
* **Drawbacks**: Computational expense can be a significant limitation (e.g., Gibbs sampling can increase analysis step time by 500%), though these techniques scale far better than generalized Bayesian methods in high-dimensional spaces.

---

## 5.3 Data Assimilation for Chemicals

Chemical DA targets the atmospheric composition and behavior of constituent species. DA design heavily depends on the considered species, as well as temporal and spatial scales:

* **Global Atmospheric Chemistry**: Focuses on long-lived species reacting and transported over vast distances throughout the entire atmospheric column (e.g., greenhouse gases, stratospheric ozone).
* **Air Quality and Urban Scale**: Analyzes complex, short-lived chemical reactions in the boundary layer (roughly 1 km from the ground) at regional or urban scales (e.g., tropospheric ozone treated as a harmful pollutant).

---

## 5. Chemical Data Assimilation

Chemistry and transport models are inherently multivariate, often accounting for hundreds of species (gaseous and aerosols). This significantly increases dimensionality compared to independent atmospheric or ocean models, making the choice of control variables critical.

### Model Types
*   **Offline Models (CTMs):** Chemical Transport Models consider emissions, uptakes, chemistry, loss processes, and transport using pre-provided meteorological fields. Most chemical DA studies are performed offline.
*   **Online Models (CCMMs):** Coupled Chemistry Meteorology Models integrate meteorology with chemistry and transport. They are computationally expensive but enable two-way coupling.

### Characteristics of Chemical DA
Unlike chaotic geofluid dynamics, the dynamics of CTMs are mostly stable; distinct initial conditions typically coalesce. Consequently:
*   **Control Variables:** Initial conditions are rarely the most critical control variables. Species emissions and model error are highly influential input parameters.
*   **Forecast Limit:** Air quality forecasts are rarely useful beyond 48 hours, even with DA.
*   **Applications:** Chemical DA is applied for chemical forecasts, nowcasting, reanalysis, inverse modeling of species emissions, and parameter estimation (e.g., boundary conditions, physical/chemical constants).

### Methods Used
Chemical DA adapts methods from meteorology:
*   **Optimal Interpolation (OI)** and **4DVar** for simultaneous estimation of inputs and parameters.
*   **Ensemble Methods:** Reduced Kalman filters, EnKF, and four-dimensional ensemble variational methods have been increasingly adopted.

---

## 5.4 Operational Data Assimilation and Reanalysis: The TOPAZ System

The **TOPAZ** system is an integrated ocean-ice system for the North Atlantic and Arctic Oceans, utilizing the HYCOM (Hybrid Coordinate Ocean Model) ocean model and the Deterministic Ensemble Kalman Filter (DEnKF).

### The HYCOM State Vector
Using isopycnic (constant density) vertical coordinates, the state vector is structured to preserve geostrophic balance and minimize diapycnal mixing during updates. It includes:
*   **3D Variables:** Layer thickness, current velocity components, temperature, and salinity.
*   **2D Variables:** Barotropic pressure and velocity, and sea ice characteristics (concentration, thickness, snow depth).
*   **Static Parameters:** Bias fields for mean sea level amplitude and sea surface temperature.
*   **Coupled Ecosystem Variables:** Nutrients, phytoplankton, zooplankton, and detritus. 

### DA Configuration & Challenges
*   **Non-Gaussian Variables:** Biological variables are log-transformed, and variables with discontinuous distributions (e.g., sea ice) are bounded to prevent non-physical states.
*   **Localization:** Essential for scaling 100 ensemble members to control roughly 80 million unknowns.
*   **Inflation:** Handled implicitly via the DEnKF and explicitly applied to observation anomalies, though inhomogeneous observation coverage (e.g., in the Arctic) can make constant multiplicative inflation problematic.
*   **Observations:** Asynchronously assimilates sea level anomalies (SLA), sea surface temperatures (SST), sea ice concentrations and drift, along with temperature and salinity profiles from in-situ platforms (e.g., Argo, Ice-Tethered Profilers).

A 24-year TOPAZ4 reanalysis highlighted the critical impact of dense observation networks. For instance, the deployment of Ice-Tethered Profilers during the International Polar Year (IPY) significantly reduced analysis bias and root mean square error.

---

## 6. Perspectives and Future Directions

Data assimilation is constantly adapting to the requirements of modern climate research. The degree of DA sophistication scales with both increased prediction time horizons and decreased model grid sizes.

### High-Resolution Modeling and Non-Gaussianity
As grid sizes decrease, models resolve smaller-scale, inherently nonlinear, and non-Gaussian processes (e.g., convection, turbulence). This transition necessitates fully Bayesian approaches, such as **Particle Filters**, which relax the standard linear and Gaussian assumptions.

### Long-Term Forecasting and Coupled DA (CDA)
Interest in seasonal-to-decadal (s2d) forecasts requires Earth System Models (ESMs) that capture interactions between the atmosphere and slowly varying components (ocean, land surface, cryosphere). Effective use of DA in this context requires **Coupled Data Assimilation (CDA)** strategies to consistently propagate observation information across all coupled model components.

### Lagrangian Data Assimilation
The expansion of non-stationary observation platforms (floats, drifters, gliders) has popularized **Lagrangian DA**. This approach addresses:
*   **Indirect Measurements:** Assimilating data from instruments that follow the flow.
*   **Nonlinear Dynamics:** Managing the complex underlying flow trajectories.
*   **Lagrangian Models:** Adapting DA for models discretized on spatio-temporally varying meshes (e.g., Lagrangian sea-ice models), requiring the DA system to update both the physical variables and the grid coordinates.

---

### 6.1 Bayesian Data Assimilation: Particle Filters

From the Bayesian standpoint, the state estimation problem is formally defined as:

$$
p(\mathbf{x}|\mathbf{y}) = \frac{p(\mathbf{y}|\mathbf{x})p(\mathbf{x})}{p(\mathbf{y})}
$$

---

## 6. Sequential Monte Carlo and Advanced Assimilation

While Gaussian approximations to the sequential estimation problem are common, an alternative brute-force approach relies on Monte Carlo methods. By drawing $N$ samples from the probability distribution, one can asymptotically approximate the conditional density $p(x|y)$ as $N \rightarrow \infty$. In a sequential context, this is known as the **Particle Filter (PF)** or **Sequential Monte Carlo**.

### 6.1.1 Bootstrap Particle Filter and Resampling

The main approximation for finite $N$ assumes the forecast probability density function (pdf) is an empirical distribution composed of delta-Dirac masses $\delta$:

$$ p(x_k|y_{k-1:}) = \sum_{n=1}^N \omega_{k-1}^n \delta(x_k - x_k^n) $$

- $y_{k:}$: The sequence of observations from the far past until time $t_k$.
- $x_k^n$: The **particles** (ensemble members or samples) at time $t_k$.
- $\omega_{k-1}^n$: The positive **weights** attached to each particle, normalized such that $\sum_{n=1}^N \omega_{k-1}^n = 1$.

The analysis at $t_k$ assimilates $y_k$ using Bayes' rule:

$$ p(x_k|y_{k:}) \propto \sum_{n=1}^N \omega_{k-1}^n p(y_k|x_k^n) \delta(x_k - x_k^n) $$

This formulation defines the updated weights simply by multiplying previous weights by the particle's likelihood:

$$ \omega_k^n \propto \omega_{k-1}^n p(y_k|x_k^n) $$

The forecast step applies the Chapman-Kolmogorov equation:

$$ p(x_{k+1}|y_{k:}) = \sum_{n=1}^N \omega_k^n p(x_{k+1}|x_k^n) $$

To maintain a delta-Dirac pdf and cycle the algorithm, two sampling strategies exist:

1. **Bootstrap PF / Sequential Importance Sampling (SIS) PF**: 
   Sample $x_{k+1}^n$ by forecasting $x_k^n$ using the model transition density $p(x_{k+1}|x_k^n)$:
   
   $$ p(x_{k+1}|y_{k:}) \approx \sum_{n=1}^N \omega_k^n \delta(x_{k+1} - x_{k+1}^n) $$

2. **Sequential Importance Resampling (SIR) PF**: 
   Add a resampling step before forecasting. Select particles with probabilities proportional to their importance weights and uniformly reset the weights to $1/N$:
   
   $$ p(x_{k+1}|y_{k:}) \approx \frac{1}{N} \sum_{n=1}^N \delta(x_{k+1} - x_{k+1}^n) $$

**Popular resampling schemes** include multinomial, residual, and stochastic universal (systematic) resampling. The latter minimizes the sampling noise introduced by the procedure.

### 6.1.2 Importance Sampling with a Proposal

Particle filters can leverage a **proposal distribution** $q(x_{k:}|y_{k:})$, an accessible smoothing density used to compute statistical moments of the true conditional probability:

$$ q(x_{k:}|y_{k:}) = \sum_{n=1}^N \omega_k^n \delta(x_{k:} - x_{k:}^n) $$

Using a test function $\phi$, the conditional pdf is represented with weighted samples:

$$ p(x_{k:}|y_{k:}) \approx \sum_{n=1}^N \frac{p(x_{k:}^n|y_{k:})}{q(x_{k:}^n|y_{k:})} \omega_k^n \delta(x_{k:} - x_{k:}^n) $$

Assuming the proposal density factorizes and the dynamics are Markovian, the updated weights at $t_k$ are determined by:

$$ \omega_k^n \propto \frac{p(x_k^n|x_{k-1}^n) p(y_k|x_k^n)}{q(x_k^n|x_{k-1:}^n, y_{k:})} \omega_{k-1}^n $$

Two notable choices for the proposal distribution are:
- **Bootstrap PF**: Choosing $q(x_k|x_{k-1:}, y_{k:}) \equiv p(x_k|x_{k-1})$ yields $\omega_k^n \propto p(y_k|x_k^n) \omega_{k-1}^n$.
- **Optimal Importance Proposal PF**: Choosing $q(x_k^n|x_{k-1:}, y_{k:}) \equiv p(x_k|y_k, x_{k-1})$ yields $\omega_k^n \propto p(y_k|x_{k-1}^n) \omega_{k-1}^n$. This minimizes the theoretical variance of the weights.

### 6.1.3 Degeneracy of the Particle Filter

Particle filters suffer significantly from the **curse of dimensionality**. In sequential schemes, this manifests as **weight degeneracy**: one particle's weight approaches 1 while the rest vanish, collapsing the ensemble.

The required number of particles to avoid degeneracy scales exponentially with the system's dimension:

$$ \ln(N) \propto \text{Var}[\ln(p(y|x))] $$

While an optimal proposal reduces the constant in the exponent, it does not eliminate the exponential trend itself.

### 6.1.4 Smarter Particle Filters for the Geosciences

To mitigate dimensionality issues in high-dimensional models, several strategies have emerged:
- **Implicit Particle Filter**: Combines smoothing and particle filtering over a Data Assimilation Window (DAW).
- **Reduced State Analysis**: Restricts full Bayesian analysis to a limited subset of degrees of freedom, estimating the rest via Gaussian-based methods (e.g., EnKF).
- **Hybrid Approaches**: Mixes Particle Filters with the EnKF using adaptive tuning coefficients to counteract weight degeneracy.
- **Equal Weight PF**: Constructs a specialized proposal ensuring all particles receive the same numerical weight following the analysis step.

### 6.1.5 Localization

Similar to the EnKF, localization mitigates the curse of dimensionality by restricting analyses locally. 
However, implementing localization in Particle Filters is non-trivial:
- A single particle receives distinct local weights across domains, preventing a natural particle update.
- Algorithmic workarounds require carefully gluing local parts of particles during resampling to prevent nonphysical discontinuities.
- As a result, the required localization radius is typically much smaller than in a local EnKF, though it remains a necessary component for high-dimensional geophysical DA.

## 6.2 Coupled Data Assimilation (CDA)

Traditional Data Assimilation (DA) algorithms were designed for Numerical Weather Prediction (NWP) systems with single dominant scales. With the advent of coupled Earth System Models (ESMs) and the need for seasonal-to-decadal (s2d) predictions (time horizons between NWP and centennial projections), tracking multiple dynamical scales simultaneously is required.

**Coupled Data Assimilation (CDA)** ensures effective information propagation across interconnected climate components. Current initialization methods include:

- **Full Field Initialization (FFI)**: Assimilates the best possible estimate of the true state. It significantly reduces initial error, but model deficiencies often cause the forecast trajectory to drift.
- **Anomaly Initialization (AI)**: Assimilates observed anomalies on top of the model's mean climate. While this introduces an initial error proportional to the model bias, the initialized state lies closer to the model's attractor, significantly reducing drift. AI is most effective when the model and observations primarily differ in their bias (first moments).

---

### Weakly Coupled Data Assimilation (wCDA)

Decoupled initialization approaches often induce problems, particularly **imbalances at the boundary** between the ocean and the atmosphere. To address this, **weakly coupled data assimilation (wCDA)** has proven successful. 

In **wCDA**:
- A **coupled model** runs the predictions.
- Observations from different model compartments (atmosphere, ocean, land, and sea-ice) are **used independently**.
- Each component undergoes a **separate analysis**.

#### Key Implementations of wCDA

Early attempts to create weakly coupled reanalyses using global Earth System Models (ESMs) demonstrated significant improvements over uncoupled formulations:
- **NCEP & JAMSTEC**: Utilized **3DVar** and **4DVar**, respectively. JAMSTEC included ocean initial conditions and air-sea flux parameters in its control variable, proving that wCDA successfully produces balanced initial conditions and optimal coupling parameters.
- **UK Met Office**: Developed a weakly coupled atmosphere-ocean assimilation using **incremental 4DVar**, calculating corrections for the atmosphere and ocean independently.
- **ECMWF**: Produced a 20th-century reanalysis based on wCDA.
- **NorESM (Norwegian ESM)**: Used the **Ensemble Kalman Filter (EnKF)** in a wCDA setting to assimilate ocean observations for seasonal-to-decadal (s2d) predictions.
- **GFDL**: Constrained the atmosphere and ocean independently using an ensemble-based **EAKF** approach.

### Strongly Coupled Data Assimilation (sCDA)

In contrast to wCDA, **strongly coupled data assimilation (sCDA)** links different model compartments *during the analysis step*. Observations in one compartment (e.g., the atmosphere) directly impact the state of another (e.g., the ocean). 

Notable sCDA findings include:
- **Operational Ocean-Ice Modeling**: Systems like **TOPAZ** demonstrate that assimilating sea-ice concentrations effectively requires a coupled, multivariate, and time-dependent approach.
- **Improved Performance with Single-Domain Data**: sCDA can yield improvements over wCDA even when restricted to atmospheric observations in a coupled atmosphere-ocean model.
- **AMOC Recovery**: EnKF-based coupled assimilation has been used to track the **Atlantic Meridional Overturning Circulation (AMOC)**. Studies suggest that frequent atmospheric observations alone are generally insufficient to recover the slowly evolving AMOC. However, applying CDA to **time-averaged atmospheric measurements** can track it successfully when ocean observations are scarce.

#### Benefits of CDA
Comparisons of CDA approaches within an incremental **4DVar** framework reveal its key advantages:
- **Balanced Analysis Fields**: CDA produces better-balanced fields compared to uncoupled assimilation, significantly reducing initialization shocks.
- **Forecast Error Reduction**: While uncoupled DA may sometimes yield a lower analysis error, CDA excels at reducing system imbalances, which ultimately leads to **lower forecast errors**.

Coupled data assimilation remains a primary focus of modern DA research, with continued advancements expected in refining earth system initialization.

## 7. Conclusion

Data assimilation (DA) is an essential discipline for the geosciences. This overview serves as a foundational guide for scientists engaging with DA, offering a complete outlook of modern approaches, their theoretical foundations, and the scientific challenges they address.

### 7.1 Summary of Content

- **Estimation Problem & Bayesian Foundations**: We defined dynamical and observational models using a statistical, Bayesian framework. This approach naturally handles uncertainty using probabilities and treats model and observation outputs as realizations of random variables. Formulated as a hidden Markov model, it traditionally assumes time-uncorrelated errors, though extensions exist to bypass this limitation.
- **Gaussian Assumptions & Core Methods**: Due to the massive dimensionality of geoscientific systems, fully Bayesian approaches are often computationally infeasible. Using the **Gaussian hypothesis**, we derived core parametric methods, including the **Kalman filter (KF)**, **Kalman smoother (KS)**, and the **variational approach** (which is less dependent on uncorrelated model errors).
- **Ensemble & Hybrid Techniques**: To handle high-dimensional, nonlinear situations, we introduced Monte Carlo formulations: the **Ensemble Kalman Filter (EnKF)** and **Smoother (EnKS)**. Critical high-dimensional stabilization techniques, such as **localization** and **inflation**, were detailed alongside modern **ensemble-variational hybrid methods** utilized by operational weather centers.
- **Geoscientific Challenges**: DA must adapt to specific challenges, such as:
  - Chaotic dynamics (e.g., atmosphere and ocean).
  - Non-Gaussian variables.
  - Atmospheric chemistry constituents.
  - Operational ocean prediction requirements.
- **Frontiers in DA**: The field is rapidly evolving toward **coupled data assimilation** (essential for climate systems) and **particle filters**, which promise fully nonlinear, Bayesian DA for high-dimensional systems.

### 7.2 Forward Looking: The Future of Data Assimilation

Originally developed for numerical weather prediction (NWP), DA has expanded into broader environmental forecasting across seasonal, interannual, and decadal timescales. The push toward **seamless predictions**—using the same high-resolution coupled models for both short- and long-term forecasts—requires DA methods capable of handling severe nonlinearities and complex coupling mechanisms.

Beyond initialization, DA is increasingly applied to entirely new problem domains:
- **Climate Change Detection & Attribution**: Assessing causal relationships between external forcing (e.g., anthropogenic emissions) and observed responses (e.g., temperature increases).
- **Model Evidence & Selection**: Estimating the marginal likelihood of data to validate models (e.g., modeling glacial-interglacial cycles).
- **Parameter Estimation & Calibration**: From optimizing subgrid-scale parameterizations to estimating radiological plumes.
- **Paleoclimatology & Solid Earth Sciences**: Reconstructing past climates using observation proxies and fusing data for seismological applications.
- **Interdisciplinary Expansion**: DA is making significant inroads into neurosciences, genetics, biology, medicine, sociology, and traffic management.

As computational power grows and observing facilities (such as satellite networks) improve, DA will remain the central theoretical bridge for fusing models with data, maximizing the informational content of both.

## Appendix A: Properties of the Kalman Filter and Smoother

While the straightforward use of the **Kalman filter (KF)** and **Kalman smoother (KS)** in geosciences is restricted by computational limits and the violation of strict statistical/dynamical hypotheses (e.g., Gaussianity and linearity), they remain the theoretical backbone for many operational DA algorithms. The history of KF-like methods in geosciences is characterized by the ongoing search for sub-optimal but effective approximations in nonlinear, high-dimensional spaces. 

Below are the key operational properties and common pitfalls of the KF.

### Time-Dependent Prior
The KF analysis inherently balances its proximity to either the observations or the prior based on their respective estimated covariance matrices: 

$$
R_k
$$
(observation error covariance), and 

$$
P^f_k
$$
(forecast error covariance). 

In geoscientific applications, the observation vector dimension is vastly smaller than the state space:

$$
d \ll m
$$

Consequently, the **prior controls how information spreads** from observed to unobserved areas. The KF recursion provides a **time-dependent estimate** of the prior mean:

$$
x^f_k
$$

and its associated covariance:

$$
P^f_k
$$

This continuous updating is critical for tracking the strongly time-dependent errors typical of chaotic environmental systems.

### Filter Divergence
**Filter divergence** occurs when the KF solution deviates significantly from the true signal and cannot recover. It is typically caused by a repeated under-estimation of the actual error:

$$
P^a_k < P^{truth}_k
$$

The evolution of the error covariance is a balance of two opposing forces:
1. **Forecast Growth**: The analysis error covariance:

$$
P^a_{k-1}
$$

is transformed by chaotic or unstable dynamics into the forecast covariance at the next time step. This often leads to error growth:

$$
P^f_k \ge P^a_{k-1}
$$

2. **Analysis Reduction**: During the analysis step, the observational forcing term:

$$
I_k - K_k H_k
$$

has a stabilizing effect. It strictly bounds the estimated analysis error to be less than or equal to the forecast error:

$$
P^a_k \le P^f_k
$$

If the model dynamics do not sufficiently counteract the covariance reduction during the analysis step, the estimated error covariance aggressively shrinks. Once the projected forecast error is much smaller than the observation error:

$$
H_k P^f_k H^T_k \ll R_k
$$

the filter begins to **ignore new observations**. If the actual system error remains high, the filter solution diverges completely from reality.

**Causes of filter divergence** include:
- Misspecification of the DA setup (e.g., wrongly specified observation error statistics or ignored error correlations).
- Unaccounted model errors.
- Excessive influence from observations.

---

## 4.4 Real-World Countermeasures: Inflation and Localization

### Kalman Filter (KF) as a Diagnostic Tool
A remarkable property of the KF under linear and Gaussian assumptions is that the error covariances—**forecast covariance** ($P_k^f$) and **analysis covariance** ($P_k^a$)—are **unconditional**. They do not depend on observation values because the first and second moments of the system's probability density function (pdf) are independent. This behavior disappears in nonlinear or non-Gaussian scenarios.

Another key feature is the **innovation vector sequence**:
$$
v_k = y_k - H_k x_k^f
$$
This sequence is Gaussian and uncorrelated in time, making it a valuable metric for monitoring hypothesis validity and applying corrections.

### Bias and Covariance Estimation
The optimality of the KF depends strictly on its core assumptions: linear models, linear observation operators, and Gaussian error distributions. Incorrect statistical inputs, such as model or observational error covariances, negate this optimality.

The KF assumes unbiased, Gaussian errors for the model ($\eta_k \sim N(0,Q_k)$) and observations ($\epsilon_k \sim N(0,R_k)$).

*   **Bias Estimation:** If biases exist in the model or observations, the KF analysis will also be biased. This is handled using **state augmentation**, where the state vector is formally expanded to include the bias term, allowing it to be estimated recursively alongside the system state. State augmentation is also widely used for simultaneous state and parameter estimation.
*   **Covariance Estimation:** Unlike biases, incorrect covariance matrices cannot be fixed via state augmentation. Instead, when all error covariances are correct, innovations are distributed as $v_k \sim N(0,\Sigma_k)$, where:
    $$
    \Sigma_k = H_k(M_{k:k-1}P_{k-1}^a M_{k:k-1}^T + Q_k)H_k^T + R_k
    $$
    A **maximum likelihood** approach can estimate the optimal $Q_k$ and $R_k$ by maximizing $p(v_k|Q_k,R_k)$. However, due to the massive size of these matrices, this is only feasible if they are parameterized with very few variables. 
    
Estimating **model error ($Q_k$)** is particularly challenging because of the limited number of available observations compared to the massive state dimension, along with diverse error sources (e.g., incorrect parameters, discretization errors, unrepresented scales). Recent approaches combine Bayesian estimation with Monte Carlo approximations to estimate these covariances efficiently.

For the **observational error covariance ($R_k$)**, computing the Kalman gain requires inverting the matrix $(H_k P_k^f H_k^T + R_k) \in \mathbb{R}^{d \times d}$. To make this computationally tractable, $R_k$ is usually assumed to be diagonal (i.e., spatially uncorrelated observations). Ignoring actual spatial correlations—a common issue in remote sensing data—can significantly degrade filter performance.

### Dependence on Initial Conditions
The reliability of the initial error covariance, $P_0$, dictates the filter's **stability**—its ability to converge to an asymptotic sequence independent of initial conditions. While optimality does not guarantee stability, a stable filter eventually wipes out errors originating from the initial conditions ($x_0$ and $P_0$).

For a stochastically-driven dynamical system, stability requires the system to be both **uniformly observable** and **controllable**.

*   **Observability:** The ability to uniquely reconstruct the initial state using a finite number of observations. For a discrete, autonomous, deterministic model ($x_k = M x_{k-1}$) observed $n$ times ($y_k = H x_k$), the sequence is:
    $$
    \begin{bmatrix} y_0 \\ y_1 \\ \vdots \\ y_{n-1} \end{bmatrix} = \begin{bmatrix} H \\ HM \\ \vdots \\ HM^{n-1} \end{bmatrix} x_0 = \Psi^T x_0
    $$
    The system is observable if the $n \times n$ matrix $\Psi$ is invertible (full rank).
    *   *Example:* Given a $2 \times 2$ system dynamics matrix $M = \begin{bmatrix} 2 & 1 \\ 0 & 1 \end{bmatrix}$. Observing only the first component ($H = [1, 0]$) yields a determinant of 1, making it observable (the first component contains information about the second). Observing only the second component ($H = [0, 1]$) yields a determinant of 0, meaning the system is unobservable.
*   **Controllability:** The ability to move the system from any initial state to a desired state over a finite time interval, largely governed by the properties of the system noise ($Q_k$).

Recent proofs establish KF stability for deterministic systems ($Q_k = 0$) given uniform observability, firmly connecting it to the stability of the underlying dynamics. These concepts have also been extended to rank-deficient initial error covariances using the system's unstable modes.

---

## Appendix B: Minimization Process in Variational Methods
Variational Data Assimilation relies on iterative minimization of a cost function $J$. The state is updated at each iteration $i$:
$$
x_0^i = x_0^{i-1} + \gamma_{i-1} v_{i-1}
$$
where $v_{i-1}$ is the search direction and $\gamma_{i-1}$ is the step size.

Algorithms that select a search direction oriented strictly more than 90 degrees away from the gradient ($(v_i)^T \nabla_x J(x_i) < 0$) are called **descent methods**.

*   **Steepest Descent:** Sets the search direction opposite to the gradient: $v_i = -\nabla_x J(x_i)$. This performs well (linear convergence) if the cost function is uniformly strictly convex. However, convergence can become extremely slow, and geosciences cost functions are rarely globally convex.
*   **Newton’s Method:** Approximates the cost function locally via a quadratic expansion around $x_i$:
    $$
    J_{Newt}(x) = J(x_i) + \nabla_x J(x_i)(x - x_i) + \frac{1}{2}(x - x_i)^T \nabla_x^2 J(x_i)(x - x_i)
    $$
    Setting the gradient of this approximation to zero yields the search direction:
    $$
    v_i = -[\nabla_x^2 J(x_i)]^{-1} \nabla_x J(x_i)
    $$
    This leverages the local curvature (the **Hessian matrix**, $\nabla_x^2 J(x_i)$) to point more directly toward the minimum, ensuring rapid convergence. However, computing and inverting the massive, ill-conditioned Hessian matrix is computationally unfeasible in most geophysical applications.

Modern operational DA minimization algorithms strike a practical balance between the rapid convergence of Newton's method and the lower computational cost of steepest descent.

---

## Appendix C: Comments on Variational Methods

### The Gaussian Hypothesis
The Gaussian assumption not only provides an analytic form for the cost function but also offers a vital physical interpretation: unimodality guarantees that the most likely state is also the mean (the minimum variance estimate). Without this, the mean state might fall into a low-probability region or lack physical plausibility altogether. 

### Linearity vs. Nonlinearity
While 4DVar does not strictly require linearity for dynamical or observational models, the presence of nonlinearity heavily dictates both analysis accuracy and algorithmic complexity.

*   **Linear Systems:** With linear models and independent Gaussian errors, the 4DVar cost function is perfectly quadratic. The Hessian is spherical, and the gradient leads directly to a unique global minimum. In this scenario, the 4DVar solution exactly matches the mean solution of a **Kalman Smoother (KS)**, obtaining the best estimate without explicit matrix inversions.
*   **Nonlinear Systems:** The cost function ceases to be quadratic and typically develops multiple local minima where the minimization algorithm can become trapped. To mitigate this, **preconditioning** (via invertible control variable transformations) is commonly applied to force the cost function to behave "more quadratically."

### Error Covariance Limitations
A major limitation of variational methods is that they inherently compute only the first statistical moment (the mean state), failing to provide the posterior covariance. 

While the exact (for linear cases) or approximate (for nonlinear cases) analysis error covariance is mathematically given by the **inverse Hessian** of the cost function, explicitly calculating this massive matrix for real geophysical applications is intractable. Instead, a fixed, time-invariant matrix is typically used to represent background errors at the start of each DA cycle.

In **strong-constraint 4DVar (s4DVar)**, background error covariance implicitly evolves over the assimilation window. However, this dynamically updated covariance cannot be explicitly extracted to initialize the next cycle. This inability to directly propagate a time-dependent description of state uncertainty is a key reason why sequential methods (like KF and KS) remain heavily favored for chaotic dynamical models.

---

We have seen in Sect. 4.5 that the recent promising efforts toward **hybrid variational-ensemble methods** are also aiming to cope with this issue, thus endowing the **4DVar** with a flow-dependent estimate of the error covariance.

## Appendix D: Some Popular Approximations

We briefly describe some of the early, successful approximations of the Kalman filter and the variational approach that have made their implementation possible in the geosciences.

### Extended Kalman Filter (EKF)

The **Extended Kalman Filter (EKF)** represents a first-order expansion of the Kalman filter (KF) and extends its use to nonlinear dynamics. 

- **Sequential Update:** Like KF, it is sequential. The system state and associated error covariance are updated at discrete observation times and evolved between them.
- **Propagation & Linearization:** The mean state estimate is propagated by the full nonlinear model, but the error covariance evolution is approximated using the tangent linear one. The linearization is taken around the nonlinear model solution, making the Jacobian of the model state-dependent.
- **Assumptions & Limitations:** 
  - **Gaussian Errors:** Assumes errors are Gaussian distributed. Under nonlinear dynamics, even an initial Gaussian error covariance will not stay Gaussian, so the EKF only provides an approximate description of the estimation error distribution.
  - **Nonlinearity:** The accuracy scales with the degree of nonlinearity in the model. 
  - **Error Growth:** Tangent linear operators can lead to unbounded error growth because the nonlinear saturation contained in higher-order moments of the error covariance equations is neglected in the EKF closure.
  - **Computational Cost:** Propagating error covariance requires massive computational resources, involving the storage of full covariance matrices and applying the tangent linear model a number of times (twice the state vector dimension).

Despite these limitations, the EKF has been successful in pioneering data assimilation applications in meteorology, oceanography, coupled data assimilation (e.g., atmosphere-ocean models), and joint state/parameter estimation via the state-augmentation approach.

### Incremental 4DVar and 3DVar

The **incremental formulation** employs a linearization of the problem around the background trajectory. Both the dynamical and observational models are linearized.

The cost function of the incremental (strong-constraint) 4DVar is formulated as:

$$ J_{s4DVar-Incr}(\delta x_0) = \frac{1}{2} \sum_{k=0}^{K} \|v_k - H_k M_{k:0} \delta x_0\|^2_{R_k^{-1}} + \frac{1}{2} \|\delta x_0\|^2_{B^{-1}} \quad (85) $$

- The **increment**, $\delta x_0 = x_0 - x_b$, is the control variable for the minimization.
- The **innovation vector** is defined as $v_k = y_k - H_k(x_k) = y_k - H_k \circ M_{k:0}(x_0)$.

Because the cost function is now quadratic, it possesses a unique absolute minimum and can be minimized much more easily:
- **Outer Loop:** Computes the innovations using the full nonlinear models, $H$ and $M$.
- **Inner Loop:** Evaluates the cost function using the linearized models, $H$ and $M$, and calculates the gradient using the adjoint $M^T$.

This procedure returns the analysis increment, $\delta x_0$, which is used for the next outer loop until convergence. It deals with small nonlinearities incrementally by cyclically updating the linearized models. Often, a simplified version of the model (coarser resolutions, simplified physics) is used in the inner loop, which has been pivotal for the operational implementation of incremental 4DVar.

#### 3DVar
**3DVar** is a special case of 4DVar where the time dimension is removed, and only observations at the analysis time are assimilated. 

- The control variable is the state at $t_0$, denoted as $x_0$.
- In operational implementations, all observations within a specific interval, $[t_0 - \Delta t, t_0 + \Delta t]$ (typically $\Delta t = 3 \text{ hrs}$), are used to update $x_0$.

**FGAT 3D-Var (First Guess at Appropriate Time):** Uses the unity operator for the resolvent of the tangent linear system and its adjoint. It conceptually takes the form of a 4DVar but reduces computations to those of a 3DVar.

## Acknowledgements
The authors wish to thank Eugenia Kalnay and another anonymous reviewer for their detailed, deep, and critical reviews. Thanks to P. N. Raanes, A. Farchi, C. Grudzien, J. Xie, and R. Davy for their comments, suggestions, and insightful discussions. Funding was partially provided by the REDDA project (#250711) of the Norwegian Research Council and the EmblA project of Nordforsk. CEREA is a member of Institut Pierre-Simon Laplace (IPSL).

## References
* Aalstad, K., et al. (2018). *Ensemble-based assimilation of fractional snow-covered area satellite retrievals...*
* Ades, M., and P. J. van Leeuwen (2015). *The equivalent-weights particle filter in a high-dimensional system*
* Amezcua, J., and P. J. Van Leeuwen (2014). *Gaussian anamorphosis in the analysis step of the EnKF...*
* Amezcua, J., et al. (2017). *A weak-constraint 4DEnsembleVar. Part I: formulation and simple model experiments*
* Anderson, J. L. (1999, 2001, 2007). *(Assorted publications on Monte Carlo implementation and ensemble filters)*
* Apte, A., and C. K. Jones (2013). *The impact of nonlinearity in Lagrangian data assimilation*
* Arulampalam, S., et al. (2002). *A tutorial on particle filters for online nonlinear non-Gaussian Bayesian tracking*
* Asch, M., M. Bocquet, and M. Nodet (2016). *Data Assimilation: Methods, Algorithms, and Applications*
* Auligné, T., et al. (2016). *Ensemble-variational integrated localized data assimilation*
* Auroux, D., and J. Blum (2008). *A nudging-based data assimilation method: the back and forth nudging (bfn) algorithm*
* Bain, A., and D. Crisan (2009). *Fundamentals of stochastic filtering*
* Ballabrera-Poy, J., et al. (2009). *Data assimilation in a system with two scalescombining two initialization techniques*
* Bannister, R. N. (2017). *A review of operational methods of variational and ensemble-variational data assimilation*
* Barth, A., et al. (2015). *Assimilation of sea surface temperature, ice concentration and ice drift in a model of the Southern Ocean*
* Bauer, P., A. Thorpe, and G. Brunet (2015). *The quiet revolution of numerical weather prediction*
* Bell, B. M. (1994). *The iterated Kalman smoother as a Gauss-Newton method*
* Bengtsson, L., M. Ghil, and E. Källén (Eds.) (1981). *Dynamic Meteorology: Data Assimilation Methods*
* Bennett, A. F. (1992). *Inverse methods in physical oceanography*
* Berre, L., H. Varella, and G. Desroziers (2015). *Modelling of flow-dependent ensemble-based backgrounderror correlations using a wavelet formulation in 4D-Var at Météo-France*
* Bertino, L., G. Evensen, and H. Wackernagel (2003). *Sequential data assimilation techniques in oceanography*
* Beskos, A., et al. (2017). *A stable particle filter for a class of high-dimensional state-space models*
* Bishop, C. H., et al. (2001). *Adaptive sampling with the ensemble transform Kalman filter...*
* Bleck, R. (2002). *An oceanic general circulation model in pressure coordinates*
* Bocquet, M., et al. (2010–2017). *(Assorted publications on ensemble Kalman filtering, iterative smoothers, etc.)*
* Bonan, B., et al. (2017). *Data assimilation for moving mesh methods with an application to ice sheet modelling*
* Bonavita, M., et al. (2011, 2012). *(Publications on ECMWF EDA background error variances)*
* Bowler, N. E., et al. (2017). *Inflation and localization tests in the development of an ensemble of 4D-ensemble variational assimilations*
* Brankart, J.-M., et al. (2010, 2012). *(Publications on efficient adaptive error parameterizations and ocean uncertainties)*
* Brusdal, K., et al. (2003). *An evaluation of ensemble based assimilation methods with a layered OGCM*
* Buehner, M., et al. (2005–2015). *(Publications on ensemble-derived background-error covariances and deterministic weather forecasting systems)*
* Burgers, G., P. J. van Leeuwen, and G. Evensen (1998). *Analysis scheme in the ensemble Kalman filter*
* Carmichael, G. R., et al. (2008). *Predicting air quality: Improvements through advanced methods...*
* Carrassi, A., and S. Vannitsem (2010). *Accounting for model error in variational data assimilation...*
* Carrassi, A., and S. Vannitsem (2011). *State and parameter estimation with the extended Kalman filter...*

---

## References

- Soc., 137, 435–451, 2011.
- Carrassi, A., and S. Vannitsem, Deterministic treatment of model error in geophysical data assimilation, in Mathematical Paradigms of Climate Science, pp. 175–213, Springer, 2016.
- Carrassi, A., A. Trevisan, and F. Uboldi, Adaptive observations and assimilation in the unstable subspace by breeding on the data-assimilation system, Tellus A, 59, 101–113, 2007.
- Carrassi, A., M. Ghil, A. Trevisan, and F. Uboldi, Data assimilation as a nonlinear dynamical systems problem: Stability and convergence of the prediction-assimilation system, Chaos, 18, 023,112, 2008a.
- Carrassi, A., A. Trevisan, L. Descamps, O. Talagrand, and F. Uboldi, Controlling instabilities along a 3DVar analysis cycle by assimilating in the unstable subspace: a comparison with the EnKF, Nonlinear Proc. Geoph., 15, 503–521, 2008b.
- Carrassi, A., S. Vannitsem, D. Zupanski, and M. Zupanski, The maximum likelihood ensemble filter performances in chaotic systems, Tellus A, 61, 587–600, 2009.
- Carrassi, A., R. Hamdi, P. Termonia, and S. Vannitsem, Short time augmented extended Kalman filter for soil analysis: a feasibility study, Atmos. Sci. Lett., 13, 268–274, 2012.
- Carrassi, A., R. Weber, V. Guemas, F. Doblas-Reyes, M. Asif, and D. Volpi, Full-field and anomaly initialization using a low-order climate model: a comparison and proposals for advanced formulations, Nonlinear Proc. Geoph., 21, 521–537, 2014.
- Carrassi, A., V. Guemas, F. Doblas-Reyes, D. Volpi, and M. Asif, Sources of skill in near-term climate prediction: generating initial conditions, Clim. Dyn., 47, 3693–3712, 2016.
- Carrassi, A., M. Bocquet, A. Hannart, and M. Ghil, Estimating model evidence using data assimilation, Q J Roy. Meteor. Soc., 143, 866–880, 2017.
- Carson, J., M. Crucifix, S. Preston, and R. D. Wilkinson, Bayesian model selection for the glacial– interglacial cycle, J. R. Stat. Soc. C-Appl., 2017.
- Chekroun, M., E. Simonnet, and M. Ghil, Stochastic climate dynamics: random attractors and time-dependent invariant measures, Physica D, 240, 1685–1700, 2011.
- Chen, Z., Bayesian filtering: From Kalman filters to particle filters, and beyond, Statistics, 182, 1–69, 2003.
- Chil`es, J. P., and P. Delfiner, Geostatistics: Modeling Spatial Uncertainty, Wiley, New York, 2012.
- Chorin, A. J., and X. Tu, Implicit sampling for particle filters, PNAS, 106, 17,249–17,254, 2009.
- Chustagulprom, N., S. Reich, and M. Reinhardt, A hybrid ensemble transform particle filter for nonlinear and spatially extended dynamical systems, SIAM/ASA J. Uncertainty Quantification, 4, 592–608, 2016.
- Clayton, A. M., A. C. Lorenc, and D. M. Barker, Operational implementation of a hybrid ensemble/4D-Var global data assimilation system at the Met Oﬃce, Q J Roy. Meteor. Soc., 139, 1445–1461, 2013.
- Cohn, S. E., An Introduction to Estimation Theory (Special Issue — Data Assimilation in Meteology and Oceanography: Theory and Practice), J. Meteorol. Soc. Jpn., 75, 257–288, 1997.
- Cohn, S. E., and D. P. Dee, Observability of discretized partial diﬀerential equations, SIAM J. Numer. Anal., 25, 586–617, 1988.
- Constantinescu, E. M., A. Sandu, T. Chai, and G. R. Carmichael, Ensemble-based chemical data assimilation. I: General approach, Q J Roy. Meteor. Soc., 133, 1229–1243, 2007a.
- Constantinescu, E. M., A. Sandu, T. Chai, and G. R. Carmichael, Ensemble-based chemical data assimilation. II: Covariance localization, Q J Roy. Meteor. Soc., 133, 1245–1256, 2007b.
- Cosme, E., J. Verron, P. Brasseur, J. Blum, and D. Auroux, Smoothing problems in a Bayesian framework and their linear Gaussian solutions, Mon. Weather Rev., 140, 683–695, 2012.
- Counillon, F., I. Bethke, N. Keenlyside, M. Bentsen, L. Bertino, and F. Zheng, Seasonal-to-decadal predictions with the ensemble Kalman filter and the Norwegian Earth System Model: A twin experiment, Tellus A, 66, 21,074, 2014.
- Counillon, F., N. Keenlyside, I. Bethke, Y. Wang, S. Billeau, M. L. Shen, and M. Bentsen, Flowdependent assimilation of sea surface temperature in isopycnal coordinates with the Norwegian Climate Prediction Model, Tellus A, 68, 1–17, 2016.
- Courtier, P., J.-N. Th´epaut, and A. Hollingsworth, A strategy for operational implementation of 4D-Var, using an incremental approach, Q J Roy. Meteor. Soc., 120, 1367–1387, 1994.
- Daley, R., Atmospheric data analysis, Cambridge university press, 1993.
- de Rosnay, P., G. Balsamo, C. Albergel, J. Mu˜noz-Sabater, and L. Isaksen, Initialisation of land surface variables for numerical weather prediction, Surveys in Geophysics, 35, 607–621, 2014.
- Dee, D., S. Cohn, A. Dalcher, and M. Ghil, An eﬃcient algorithm for estimating noise covariances in distributed systems, IEEE Trans. Automatic Control, 30, 1057–1065, 1985.
- Dee, D., S. Uppala, A. Simmons, P. Berrisford, P. Poli, S. Kobayashi, U. Andrae, M. Balmaseda, G. Balsamo, P. Bauer, et al., The ERA-Interim reanalysis: Configuration and performance of the data assimilation system, Q J Roy. Meteor. Soc., 137, 553–597, 2011.
- Dee, D. P., On-line estimation of error covariance parameters for atmospheric data assimilation, Mon. Weather Rev., 123, 1128–1145, 1995.
- Dee, D. P., Bias and data assimilation, Q J Roy. Meteor. Soc., 131, 3323–3343, 2005.
- Desroziers, G., J.-T. Camino, and L. Berre, 4DEnVar: Link with 4D state formulation of variational assimilation and diﬀerent possible implementations, Q J Roy. Meteor. Soc., 140, 2097–2110, 2014.
- Desroziers, G., E. Arbogast, and L. Berre, Improving spatial localization in 4DEnVar, Q J Roy. Meteor. Soc., 142, 3171–3185, 2016, accepted for publication. Dijkstra, H., Nonlinear Climate Dynamics, Cambridge University Press, Cambridge, 2013.
- Doblas-Reyes, F. J., J. Garc´ıa-Serrano, F. Lienert, A. P. Biescas, and L. R. Rodrigues, Seasonal climate predictability and forecasting: Status and prospects, Wiley Interdisciplinary Reviews: Climate Change, 4, 245–268, 2013.
- Douc, R., and O. Capp´e, Comparison of resampling schemes for particle filtering, in Image and Signal Processing and Analysis, 2005.
- Proceedings of the 4th International Symposium on, pp. 64–69, 2005.
- Doucet, A., S. Godsill, and C. Andrieu, On sequential Monte Carlo sampling methods for Bayesian filtering, Stat. Comput., 10, 197–208, 2000.
- Doucet, A., N. de Freitas, and N. Gordon (Eds.), Sequential Monte Carlo Methods in Practice, Springer-Verlag New York Inc., 2001.
- Dreano, D., P. Tandeo, M. Pulido, B. Ait-El-Fquih, T. Chonavel, and I. Hoteit, Estimating model error covariances in nonlinear state-space models using Kalman smoothing and the expectationmaximisation algorithm, Q J Roy. Meteor. Soc., 2017.
- Duane, G. S., J. J. Tribbia, and J. B. Weiss, Synchronicity in predictive modelling: A new view of data assimilation, Nonlin. Proc. Geophys., 13, 601–612, 2006.
- Dubinkina, S., and H. Goosse, An assessment of particle filtering methods and nudging for climate state reconstructions, Climate of the Past, 9, 1141–1152, 2013.
- Elbern, H., A. Strunk, H. Schmidt, and O. Talagrand, Emission rate and chemical state estimation by 4-dimensional variational inversion, Atmos. Chem. Phys., 7, 3749–3769, 2007.
- Emili, E., S. Gurol, and D. Cariolle, Accounting for model error in air quality forecasts: an application of 4DEnVar to the assimilation of atmospheric composition using QG-Chem 1.0, Geosci. Model Dev., 9, 3933–3959, 2016.
- Evensen, G., Using the extended Kalman filter with a multilayer quasi-geostrophic ocean model, J. Geophys. Res., 97, 17,905–17,924, 1992.
- Evensen, G., Sequential data assimilation with a nonlinear quasi-geostrophic model using Monte Carlo methods to forecast error statistics, J. Geophys. Res., 99, 10,143–10,162, 1994.
- Evensen, G., The ensemble Kalman filter: Theoretical formulation and practical implementation, Ocean Dynamics, 53, 343–367, 2003.
- Evensen, G., Sampling strategies and square root analysis schemes for the EnKF, Ocean Dynamics, 54, 539–560, 2004.
- Evensen, G., The ensemble Kalman filter for combined state and parameter estimation, IEEE Control Systems Magazine, 29, 83–104, 2009a.
- Evensen, G., Data Assimilation: The Ensemble Kalman Filter, second ed., SpringerVerlag/Berlin/Heildelberg, 2009b.
- Evensen, G., Analysis of iterative ensemble smoothers for solving inverse problems, Accepted for publication in Computat. Geosci., 2018.
- Fairbairn, D., S. R. Pring, A. C. Lorenc, and I. Roulstone, A comparison of 4DVar with ensemble data assimilation methods, Q J Roy. Meteor. Soc., 140, 281–294, 2014.
- Farchi, A., and M. Bocquet, Review article: Comparison of local particle filters and new implementations, Nonlinear Proc. Geoph. Disc., 2018, 1–63, 2018.
- Fichtner, A., H.-P. Bunge, and H. Igel, The adjoint method in seismology: II. Applications: traveltimes and sensitivity functionals, Physics of the Earth and Planetary Interiors, 157, 105–123, 2006.
- Fisher, M., and E. Andersson, Developments in 4D-Var and Kalman filtering, Technical Memorandum 347, European Centre for Medium-Range Weather Forecasts, 2001.
- Fisher, M., and S. G¨urol, Parallelization in the time dimension of four-dimensional variational data assimilation, Q J Roy. Meteor. Soc., 143, 1136–1147, 2017.
- Fisher, M., M. Leutbecher, and G. Kelly, On the equivalence between Kalman smoothing and weakconstraint four-dimensional variational data assimilation, Q J Roy. Meteor. Soc., 131, 3235–3246, 2005.
- Fisher, M., Y. Tremolet, H. Auvinen, D. Tan, and P. Poli, Weak-constraint and long-window 4D-Var, ECMWF Techn. Rep, 655, 2011.
- Fitzgerald, R., Divergence of the Kalman filter, IEEE Transactions on Automatic Control, 16, 736–747, 1971.
- Fletcher, S. J., Data Assimilation for the Geosciences: From Theory to Application, Elsevier, 2017.
- Frei, M., and H. R. K¨unsch, Bridging the ensemble Kalman and particle filters, Biometrika, 100, 781–800, 2013.
- Gaspari, G., and S. E. Cohn, Construction of correlation functions in two and three dimensions, Q J Roy. Meteor. Soc., 125, 723–757, 1999.
- Gelb, A., Applied optimal estimation, MIT press, 1974.
- Gharamti, M., A. Samuelsen, L. Bertino, E. Simon, A. Korosov, and U. Daewel, Online tuning of ocean biogeochemical model parameters using ensemble estimation techniques: Application to a one-dimensional model in the North Atlantic, J. Marine Systems, 168, 1–16, 2017a.
- Gharamti, M. E., J. Tjiputra, I. Bethke, A. Samuelsen, I. Skjelvan, M. Bentsen, and L. Bertino, Ensemble data assimilation for ocean biogeochemical state and parameter estimation at diﬀerent sites, Ocean Modell, 112, 65–89, 2017b.
- Ghil, M., and P. Malanotte-Rizzoli, Data assimilation in meteorology and oceanography, Adv. Geophys., 33, 141–266, 1991.
- Ghil, M., S. Cohn, J. Tavantzis, K. Bube, and E. Isaacson, Applications of estimation theory to numerical weather prediction, in Dynamic meteorology: data assimilation methods, SpringerVerlag, New York, 1981.
- Giﬃn, A., and R. Urniezius, The kalman filter revisited using maximum relative entropy, Entropy, 16, 1047–1069, 2014.
- Golub, G. H., and C. F. van Loan, Matrix computations, vol. 3, JHU Press, 2013.
- Gordon, N. J., D. J. Salmond, and A. F. M. Smith, Novel approach to nonlinear/non-Gaussian Bayesian state estimation, IEE Proc.-F, 140, 107–113, 1993.
- Greybush, S. J., E. Kalnay, T. Miyoshi, K. Ide, and B. R. Hunt, Balance and ensemble Kalman filter localization techniques, Mon. Weather Rev., 139, 511–522, 2011.
- Griﬃth, A. K., and N. K. Nichols, Adjoint methods in data assimilation for estimating model error, Flow, turbulence and combustion, 65, 469–488, 2000.
- Grudzien, C., A. Carrassi, and M. Bocquet, Chaotic dynamics and the role of covariance inflation for reduced rank kalman filters with model error, Nonlinear Proc. Geoph. Disc., 2018, 1–25, 2018a.
- Grudzien, C., A. Carrassi, and M. Bocquet, Asymptotic forecast uncertainty and the unstable subspace in the presence of additive model error, SIAM/ASA J. Uncertainty Quantification, submitted, 2018b.
- Gurumoorthy, K. S., C. Grudzien, A. Apte, A. Carrassi, and C. K. Jones, Rank deficiency of Kalman error covariance matrices in linear time-varying system with deterministic evolution, SIAM J. Control Optim., 55, 741–759, 2017.
- Gustafsson, N., J. Bojarova, and O. Vignes, A hybrid variational ensemble data assimilation for the HIgh Resolution Limited Area Model (HIRLAM), Nonlinear Proc. Geoph., 21, 303–323, 2014.
- Hamill, T. M., and C. Snyder, A hybrid ensemble Kalman filter-3D variational analysis scheme, Mon. Weather Rev., 128, 2905–2919, 2000.
- Hamill, T. M., J. S. Whitaker, and C. Snyder, Distance-dependent filtering of background error covariance estimates in an ensemble Kalman filter, Mon. Weather Rev., 129, 2776–2790, 2001.
- Hanea, R. G., G. J. M. Velders, A. J. Segers, M. Verlaan, and A. W. Heemink, A hybrid Kalman filter algorithm for large-scale atmospheric chemistry data assimilation, Mon. Weather Rev., 135, 140–151, 2007.
- Hannart, A., A. Carrassi, M. Bocquet, M. Ghil, P. Naveau, M. Pulido, J. Ruiz, and P. Tandeo, DADA: data assimilation for the detection and attribution of weather and climate-related events, Climatic Change, 136, 155–174, 2016.
- Harlim, J., and A. J. Majda, Filtering turbulent sparsely observed geophysical flows, Mon. Weather Rev., 138, 1050–1083, 2010.
- Harlim, J., A. J. Majda, et al., Catastrophic filter divergence in filtering nonlinear dissipative systems, Communications in Mathematical Sciences, 8, 27–43, 2010.
- Haugen, V. E., and G. Evensen, Assimilation of SLA and SST data into an OGCM for the Indian ocean, Ocean Dynamics, 52, 133–151, 2002.
- Haussaire, J.-M., and M. Bocquet, A low-order coupled chemistry meteorology model for testing online and oﬄine data assimilation schemes: L95-GRS (v1.0), Geosci. Model Dev., 9, 393–412, 2016.
- Hazeleger, W., V. Guemas, B. Wouters, S. Corti, I. Andreu-Burillo, F. Doblas-Reyes, K. Wyser, and M. Caian, Multiyear climate predictions using two initialization strategies, Geophys. Res. Let., 40, 1794–1798, 2013.
- Hoke, J. E., and R. A. Anthes, The initialization of numerical models by a dynamic-initialization technique, Mon. Weather Rev., 104, 1551–1556, 1976.
- Horn, R. A., and C. R. Johnson, Matrix analysis, Cambridge university press, 2012.
- Hoteit, I., D.-T. Pham, M. Gharamti, and X. Luo, Mitigating observation perturbation sampling errors in the stochastic EnKF, Mon. Weather Rev., 143, 2918–2936, 2015.
- Houtekamer, P., and F. Zhang, Review of the ensemble Kalman filter for atmospheric data assimilation, Mon. Weather Rev., 144, 4489–4532, 2016.
- Houtekamer, P. L., and H. L. Mitchell, A sequential ensemble Kalman filter for atmospheric data assimilation, Mon. Weather Rev., 129, 123–137, 2001.
- Houtekamer, P. L., H. L. Mitchell, G. Pellerin, M. Buehner, M. Charron, L. Spacek, and B. Hansen, Atmospheric data assimilation with an ensemble Kalman filter: Results with real observations, Mon. Weather Rev., 133, 604–620, 2005.
- Hunt, B., E. J. Kostelich, and I. Szunyogh, Eﬃcient data assimilation for spatiotemporal chaos: A local ensemble transform Kalman filter, Physica D, 230, 112–126, 2007.
- Hunt, B. R., E. Kalnay, E. J. Kostelich, E. Ott, D. J. D. J. Patil, T. Sauer, I. Szunyogh, J. A. Yorke, and A. V. Zimin, Four-dimensional ensemble Kalman filtering, Tellus A, 56, 273–277, 2004.
- Ide, K., L. Kuznetsov, and C. K. Jones, Lagrangian data assimilation for point vortex systems*, J. Turbul., 3, 2002.
- Janji´c, T., D. McLaughlin, S. E. Cohn, and M. Verlaan, Conservation of Mass and Preservation of Positivity with Ensemble-Type Kalman Filter Algorithms, Mon. Weather Rev., 142, 755–773, 2014.
- Janji´c, T., N. Bormann, M. Bocquet, J. A. Carton, S. E. Cohn, S. L. Dance, S. N. Losa, N. K. Nichols, R. Potthast, J. A. Waller, and P. Weston, On the representation error in data assimilation, Q J Roy. Meteor. Soc., 0, 0–0, 2017, accepted for publication. Jardak, M., and O. Talagrand, Ensemble variational assimilation as a probabilistic estimator. part i: The linear and weak non-linear case, Nonlinear Proc. Geoph. Disc., 2018, 1–39, 2018.
- J¨arvinen, H., E. Andersson, and F. Bouttier, Variational assimilation of time sequences of surface observations with serially correlated errors, Tellus A, 51, 469–488, 1999.
- Jazwinski, A. H., Stochastic Processes and Filtering Theory, Academic Press, New-York, 1970.
- Kadakia, N., E. Armstrong, D. Breen, U. Morone, A. Daou, D. Margoliash, and H. D. Abarbanel, Nonlinear statistical data assimilation for hvc-RA neurons in the avian song system, Biological cybernetics, 110, 417–434, 2016.
- Kalman, R. E., A new approach to linear filtering and prediction problems, J. Fluid. Eng., 82, 35–45, 1960.
- Kalnay, E., Atmospheric Modeling, Data Assimilation and Predictability, Cambridge University Press, Cambridge, 2002.
- Kalnay, E., and A.

---

## References

- **Dalcher**, Forecasting forecast skill, *Mon. Weather Rev.*, 115, 349–356, 1987.
- **Kalnay, E., and S.-C. Yang**, Accelerating the spin-up of ensemble Kalman filtering, *Q J Roy. Meteor. Soc.*, 136, 1644–1651, 2010.
- **Kalnay, E., H. Li, T. Miyoshi, S.-C. Yang, and J. Ballabrera-Poy**, 4-D-Var or ensemble Kalman filter?, *Tellus A*, 59, 758–773, 2007.
- **Kalnay, E., Y. Ota, T. Miyoshi, and J. Liu**, A simpler formulation of forecast sensitivity to observations: application to ensemble Kalman filters, *Tellus A*, 64, 18,462, 2012.
- **Kang, J.-S., E. Kalnay, J. Liu, I. Fung, T. Miyoshi, and K. Ide**, Variable localization in an ensemble Kalman filter: Application to the carbon cycle data assimilation, *J. Geophys. Res.*, 116, D09,110, 2011.
- **Kepert, J. D.**, Covariance localisation and balance in an ensemble Kalman filter, *Q J Roy. Meteor. Soc.*, 135, 1157–1176, 2009.
- **Kleist, D. T., and K. Ide**, An OSSE-based evaluation of hybrid variational–ensemble data assimilation for the NCEP GFS. Part I: System description and 3D-hybrid results, *Mon. Weather Rev.*, 143, 433–451, 2015.
- **Kondrashov, D., C. Sun, and M. Ghil**, Data assimilation for a coupled ocean–atmosphere model. Part II: Parameter estimation, *Mon. Weather Rev.*, 136, 5062–5076, 2008.
- **Kong, A., J. S. Liu, and W. H. Wong**, Sequential imputations and Bayesian missing data problems, *Journal of the American statistical association*, 89, 278–288, 1994.
- **Kotsuki, S., T. Miyoshi, K. Terasaki, G. Y. Lien, and E. Kalnay**, Assimilating the global satellite mapping of precipitation data with the nonhydrostatic icosahedral atmospheric model (NICAM), *Journal of Geophysical Research*, 122, 631–650, 2017.
- **Kuptsov, P. V., and U. Parlitz**, Theory and computation of covariant Lyapunov vectors, *J. Nonlinear Sci.*, 22, 727–762, 2012.
- **Kuznetsov, L., K. Ide, and C. K. Jones**, A method for assimilation of lagrangian data, *Mon. Weather Rev.*, 131, 2247–2260, 2003.
- **Lakshmivarahan, S., and J. M. Lewis**, Nudging methods: A critical overview, in Data Assimilation for Atmospheric, Oceanic and Hydrologic Applications (Vol. II), edited by S. K. Park and L. Xu, pp. 27–57, Springer Berlin Heidelberg, 2013.
- **Laloyaux, P., M. Balmaseda, D. Dee, K. Mogensen, and P. Janssen**, A coupled data assimilation system for climate reanalysis, *Q J Roy. Meteor. Soc.*, 142, 65–78, 2016.
- **Lauvernet, C., J.-M. M. Brankart, F. Castruccio, G. Broquet, P. Brasseur, and J. Verron**, A truncated Gaussian filter for data assimilation with inequality constraints: Application to the hydrostatic stability condition in ocean models, *Ocean Modell*, 27, 1–17, 2009.
- **Law, K., A. Stuart, and K. Zygalakis**, Data assimilation: A mathematical introduction, vol. 62, Springer, 2015.
- **Lawless, A., N. Nichols, C. Boess, and A. Bunse-Gerstner**, Using model reduction methods within incremental four-dimensional variational data assimilation, *Mon. Weather Rev.*, 136, 1511–1522, 2008.
- **Le Dimet, F.-X., and O. Talagrand**, Variational algorithms for analysis and assimilation of meteorological observations: theoretical aspects, *Tellus A*, 38, 97–110, 1986.
- **Le Gland, F., V. Monbet, and V.-D. Tran**, Large sample asymptotics for the ensemble kalman filter, Ph.D. thesis, INRIA, 2009.
- **Legras, B., and R. Vautard**, A guide to Liapunov vectors, in Proceedings 1995 ECMWF Seminar on Predictability, vol. 1, pp. 143–156, Citeseer, 1996.
- **Leutbecher, M., and T. N. Palmer**, Ensemble forecasting, *J. Comput Phys*, 227, 3515–3539, 2008.
- **Lewis, J. M., and J. C. Derber**, The use of adjoint equations to solve a variational adjustment problem with advective constraints, *Tellus A*, 37, 309–322, 1985.
- **Li, H., E. Kalnay, and T. Miyoshi**, Simultaneous estimation of covariance inflation and observation errors within an ensemble Kalman filter, *Q J Roy. Meteor. Soc.*, 135, 523–533, 2009.
- **Li, L., H. Zhou, H. J. Hendricks Franssen, and J. J. Gómez-Hernández**, Groundwater flow inverse modeling in non-MultiGaussian media: Performance assessment of the normal-score Ensemble Kalman Filter, *Hydrology and Earth System Sciences*, 16, 573–590, 2012.
- **Liang, X., X. Zheng, S. Zhang, G. Wu, Y. Dai, and Y. Li**, Maximum likelihood estimation of inflation factors on error covariance matrices for ensemble Kalman filter assimilation, *Q J Roy. Meteor. Soc.*, 138, 263–273, 2012.
- **Lien, G. Y., E. Kalnay, and T. Miyoshi**, Effective assimilation of global precipitation: Simulation experiments, *Tellus A*, 65, 2013.
- **Lien, G.-Y., E. Kalnay, T. Miyoshi, and G. J. Huffman**, Statistical Properties of Global Precipitation in the NCEP GFS Model and TMPA Observations for Data Assimilation, *Mon. Weather Rev.*, 144, 663–679, 2016a.
- **Lien, G.-Y., T. Miyoshi, and E. Kalnay**, Assimilation of TRMM Multisatellite Precipitation Analysis with a Low-Resolution NCEP Global Forecast System, *Mon. Weather Rev.*, 144, 643–661, 2016b.
- **Lindskog, M., D. Dee, Y. Tremolet, E. Andersson, G. Radnoti, and M. Fisher**, A weak-constraint four-dimensional variational analysis system in the stratosphere, *Q J Roy. Meteor. Soc.*, 135, 695–706, 2009.
- **Lions, J. L.**, Optimal control of systems governed by partial differential equations, Springer, 1971.
- **Lisæter, K. A., J. Rosanova, and G. Evensen**, Assimilation of ice concentration in a coupled iceocean model, using the ensemble Kalman filter, *Ocean Dynamics*, 53, 368–388, 2003.
- **Liu, C., Q. Xiao, and B. Wang**, An ensemble-based four-dimensional variational data assimilation scheme. Part I: Technical formulation and preliminary test, *Mon. Weather Rev.*, 136, 3363–3373, 2008.
- **Liu, C., Q. Xiao, and B. Wang**, An ensemble-based four-dimensional variational data assimilation scheme. Part II: Observing system simulation experiments with advanced research WRF (ARW), *Mon. Weather Rev.*, 137, 1687–1704, 2009.
- **Liu, Y., J.-M. Haussaire, M. Bocquet, Y. Roustan, O. Saunier, and A. Mathieu**, Uncertainty quantification of pollutant source retrieval: comparison of Bayesian methods with application to the Chernobyl and Fukushima-Daiichi accidental releases of radionuclides, *Q J Roy. Meteor. Soc.*, 143, 2886–2901, 2017.
- **Livings, D. M., S. L. Dance, and N. K. Nichols**, Unbiased ensemble square root filters, *Physica D*, 237, 1021–1028, 2008.
- **Lorenc, A.**, Analysis methods for numerical weather prediction, *Q J Roy. Meteor. Soc.*, 112, 1177–1194, 1986.
- **Lorenc, A.**, Recommended nomenclature for EnVar data assimilation methods, Online: http://www.wcrp-climate.org/WGNE/BlueBook/2013/individual-articles/01_Lorenc_Andrew_EnVar_nomenclature.pdf, 2013.
- **Lorenc, A. C.**, The potential of the ensemble Kalman filter for NWP — a comparison with 4D-Var, *Q J Roy. Meteor. Soc.*, 129, 3183–3203, 2003.
- **Lorenc, A. C., and T. Payne**, 4D-Var and the butterfly effect: Statistical four-dimensional data assimilation for a wide range of scales, *Q J Roy. Meteor. Soc.*, 133, 607–614, 2007.
- **Lorenc, A. C., N. E. Bowler, A. M. Clayton, S. R. Pring, and D. Fairbairn**, Comparison of hybrid4DEnVar and hybrid-4DVar data assimilation methods for global NWP, *Mon. Weather Rev.*, 143, 212–229, 2015.
- **Lorenz, E.**, Deterministic non-periodic flow, *J. Atmos. Sci.*, 20, 130–141, 1963.
- **Lorenz, E. N.**, Predictability – a problem partly solved, in Seminar on Predictability, vol. 1, 1996.
- **Lorenz, E. N.**, Designing chaotic models, *J. Atmos. Sci.*, 62, 1574–1587, 2005.
- **Lorenz, E. N., and K. A. Emanuel**, Optimal sites for supplementary weather observations: simulation with a small model, *J. Atmos. Sci.*, 55, 399–414, 1998.
- **Lu, F., Z. Liu, S. Zhang, and Y. Liu**, Strongly coupled data assimilation using leading averaged coupled covariance (LACC). Part I: Simple model study, *Mon. Weather Rev.*, 143, 3823–3837, 2015.
- **MacKay, D. J. C.**, Information Theory, Inference and Learning Algorithms, Cambridge University Press, Cambridge, 2003.
- **Magnusson, L., M. Alonso-Balmaseda, S. Corti, F. Molteni, and T. Stockdale**, Evaluation of forecast strategies for seasonal and decadal forecasts in presence of systematic model errors, *Clim. Dyn.*, 41, 2393–2409, 2013.
- **Mandel, J., E. Bergou, S. Gürol, S. Gratton, and I. Kasanický**, Hybrid Levenberg-Marquardt and weak-constraint ensemble Kalman smoother method, *Nonlinear Proc. Geoph.*, 23, 59, 2016.
- **Miller, R., M. Ghil, and F. Gauthiez**, Advanced data assimilation in strongly nonlinear dynamical systems, *J. Atmos. Sci.*, 51, 1037–1056, 1994.
- **Mitter, S. K., and N. J. Newton**, Information and entropy flow in the kalman–bucy filter, *Journal of Statistical Physics*, 118, 145–176, 2005.
- **Miyoshi, T.**, The Gaussian approach to adaptive covariance inflation and its implementation with the local ensemble transform Kalman filter, *Mon. Weather Rev.*, 139, 1519–1535, 2011.
- **Miyoshi, T., E. Kalnay, and H. Li**, Estimating and including observation-error correlations in data assimilation, *Inverse Probl. Sci. Eng.*, 21, 387–398, 2013.
- **Morzfeld, M., X. Tu, E. Atkins, and A. J. Chorin**, A random map implementation of implicit filters, *J. Comput Phys*, 231, 2049–2066, 2012.
- **Natvik, L. J., and G. Evensen**, Assimilation of ocean colour data into a biochemical model of the North Atlantic. Part 1. Data assimilation experiments, *J. Marine. Sys.*, 40-41, 127–153, 2003.
- **Nerger, L., T. Janjić, J. Schröter, and W. Hiller**, A unification of ensemble square root Kalman filters, *Mon. Weather Rev.*, 140, 2335–2345, 2012.
- **Ng, G.-H. C., D. McLaughlin, D. Entekhabi, and A. Ahanin**, The role of model dynamics in ensemble Kalman filter performance for chaotic systems, *Tellus A*, 63, 958–977, 2011.
- **Ngodock, H., and M. Carrier**, A 4DVAR system for the Navy Coastal Ocean Model. Part II: Strong and weak constraint assimilation experiments with real observations in Monterey Bay, *Mon. Weather Rev.*, 142, 2108–2117, 2014.
- **Ni, B., and Q. Zhang**, Stability of the Kalman filter for continuous time output error systems, *Syst. Control. Lett.*, 94, 172–180, 2016.
- **Nicolis, C.**, Dynamics of model error: Some generic features, *J. Atmos. Sci.*, 60, 2208–2218, 2003.
- **Nino Ruiz, E. D., and A. Sandu**, A derivative-free trust region framework for variational data assimilation, *J. Comput Appl Math*, 293, 164–179, 2016.
- **Nodet, M.**, Variational assimilation of lagrangian data in oceanography, *Inverse Probl.*, 22, 245, 2006.
- **Ott, E., B. R. Hunt, I. Szunyogh, A. V. Zimin, E. J. Kostelich, M. Corazza, E. Kalnay, D. J. Patil, and A. Yorke**, A local ensemble Kalman filter for atmospheric data assimilation, *Tellus A*, 56, 415–428, 2004.
- **Palatella, L., and A. Trevisan**, Interaction of Lyapunov vectors in the formulation of the nonlinear extension of the Kalman filter, *Phys. Rev. E.*, 91, 042,905, 2015.
- **Palatella, L., A. Carrassi, and A. Trevisan**, Lyapunov vectors and assimilation in the unstable subspace: theory and applications, *J. Phys. A: Math. Theor.*, 46, 254,020, 2013a.
- **Palatella, L., A. Trevisan, and S. Rambaldi**, Nonlinear stability of traffic models and the use of lyapunov vectors for estimating the traffic state, *Phys. Rev. E.*, 88, 022,901, 2013b.
- **Pazo, D., A. Carrassi, and J. Lopez**, Data assimilation by delay-coordinate nudging, *Q J Roy. Meteor. Soc.*, 142, 1290–1299, 2016.
- **Penenko, V., and N. Obraztsov**, A variational initialization method for the fields of the meteorological elements, *Soviet Meteorol. Hydrol.*, pp. 1–11, 1976.
- **Penny, S. G., and T. M. Hamill**, Coupled data assimilation for integrated earth system analysis and prediction, *Bull. Amer. Meteor. Soc.*, 2017.
- **Penny, S. G., and T. Miyoshi**, A local particle filter for high dimensional geophysical systems, *Nonlinear Proc. Geoph.*, 23, 391–405, 2016.
- **Pham, D. T.**, Stochastic methods for sequential data assimilation in strongly nonlinear systems, *Mon. Weather Rev.*, 129, 1194–1207, 2001.
- **Pham, D. T., J. Verron, and M. C. Roubaud**, A singular evolutive extended Kalman filter for data assimilation in oceanography, *J. Marine Systems*, 16, 323–340, 1998.
- **Pires, C., R. Vautard, and O. Talagrand**, On extending the limits of variational assimilation in nonlinear chaotic systems, *Tellus A*, 48, 96–121, 1996.
- **Poli, P., H. Hersbach, D. P. Dee, P. Berrisford, A. J. Simmons, F. Vitart, P. Laloyaux, D. G. Tan, C. Peubey, J.-N. Thépaut, et al.**, Era-20c: An atmospheric reanalysis of the twentieth century, *J. Climate*, 29, 4083–4097, 2016.
- **Poterjoy, J.**, A localized particle filter for high-dimensional nonlinear systems, *Mon. Weather Rev.*, 144, 59–76, 2016.
- **Poterjoy, J., and F. Zhang**, Systematic comparison of four-dimensional data assimilation methods with and without the tangent linear model using hybrid background error covariance: E4DVar versus 4DEnVar, *Mon. Weather Rev.*, 143, 1601–1621, 2015.
- **Pulido, M., P. Tandeo, M. Bocquet, A. Carrassi, and M. Lucini**, Stochastic parameterization identification using ensemble kalman filtering combined with maximum likelihood methods, *Tellus A*, 70, 1442,099, 2018.
- **Quinn, J. C., and H. D. Abarbanel**, State and parameter estimation using Monte Carlo evaluation of path integrals, *Q J Roy. Meteor. Soc.*, 136, 1855–1867, 2010.
- **Raanes, P. N.**, On the ensemble rauch-tung-striebel smoother and its equivalence to the ensemble Kalman smoother, *Q J Roy. Meteor. Soc.*, 142, 1259–1264, 2016.
- **Raanes, P. N., A. Carrassi, and L. Bertino**, Extending the square root method to account for additive forecast noise in ensemble methods, *Mon. Weather Rev.*, 143, 3857–3873, 2015.
- **Rampal, P., S. Bouillon, E. Olason, and M. Morlighem**, neXtSIM: a new Lagrangian sea ice model, *Cryosphere*, 10, 2016.
- **Raynaud, L., L. Berre, and G. Desroziers**, Objective filtering of ensemble-based background-error variances, *Q J Roy. Meteor. Soc.*, 135, 1177–1199, 2009.
- **Raynaud, L., L. Berre, and G. Desroziers**, An extended specification of flow-dependent background error variances in the Météo-France global 4D-Var system, *Q J Roy. Meteor. Soc.*, 137, 607–619, 2011.
- **Reich, S.**, A nonparametric ensemble transform method for Bayesian inference., *SIAM J. Sci. Comput.*, 35, A2013–A2014, 2013.
- **Reich, S., and C. Cotter**, Probabilistic Forecasting and Bayesian Data Assimilation, Cambridge University Press, Cambridge, 2015.
- **Robert, C., S. Durbiano, E. Blayo, J. Verron, J. Blum, and F. X. Le Dimet**, A reduced-order strategy for 4D-Var data assimilation, *J. Marine Systems*, 57, 70–82, 2005.
- **Robert, S., and H. R. Künsch**, Localizing the ensemble Kalman particle filter, *Tellus A*, 69, 1282,016, 2017.
- **Saha, S., S. Moorthi, H.-L. Pan, X. Wu, J. Wang, S. Nadiga, P. Tripp, R. Kistler, J. Woollen, D. Behringer, et al.**, The ncep climate forecast system reanalysis, *Bull. Amer. Meteor. Soc.*, 91, 1015–1057, 2010.
- **Sakov, P., and L. Bertino**, Relation between two common localisation methods for the EnKF, *Computat. Geosci.*, 15, 225–237, 2011.
- **Sakov, P., and P. R. Oke**, Implications of the form of the ensemble transform in the ensemble square root filters, *Mon. Weather Rev.*, 136, 1042–1053, 2008a.
- **Sakov, P., and P. R. Oke**, A deterministic formulation of the ensemble Kalman filter: an alternative to ensemble square root filters, *Tellus, Ser. A*, 60, 361–371, 2008b.
- **Sakov, P., G. Evensen, and L. Bertino**, Asynchronous data assimilation with the EnKF, *Tellus Ser A*, 62A, 24–29, 2010.
- **Sakov, P., F. Counillon, L. Bertino, K. Lisæter, P. Oke, and A. Korablev**, TOPAZ4: an ocean-sea ice data assimilation system for the North Atlantic and Arctic, *Ocean Sci.*, 8, 633, 2012a.
- **Sakov, P., D. S. Oliver, and L. Bertino**, An iterative EnKF for strongly nonlinear systems, *Mon. Weather Rev.*, 140, 1988–2004, 2012b.
- **Salman, H., L. Kuznetsov, C. Jones, and K. Ide**, A method for assimilating Lagrangian data into a shallow-water-equation ocean model, *Mon. Weather Rev.*, 134, 1081–1101, 2006.
- **Santitissadeekorn, N., and C. Jones**, Two-stage filtering for joint state-parameter estimation, *Mon. Weather Rev.*, 143, 2028–2042, 2015.
- **Sasaki, Y.**, Some basic formalism in numerical variational analysis, *Mon. Weather Rev.*, 98, 875–883, 1970.
- **Schölzel, C., and P. Friederichs**, Multivariate non-normally distributed random variables in climate research-introduction to the copula approach, *Nonlinear Proc. Geoph.*, 15, 761–772, 2008.
- **Simon, E., and L. Bertino**, Application of the Gaussian anamorphosis to assimilation in a 3-D coupled physical-ecosystem model of the North Atlantic with the EnKF: a twin experiment, *Ocean Sci.*, 5, 495–510, 2009.
- **Simon, E., and L. Bertino**, Gaussian anamorphosis extension of the DEnKF for combined state parameter estimation: Application to a 1D ocean ecosystem model, *J. Marine Systems*, 89, 1–18, 2012.
- **Simon, E., A. Samuelsen, L.**

---

## References

- **Bertino, and S. Mouysset**, "Experiences in multiyear combined state-parameter estimation with an ecosystem model of the North Atlantic and Arctic Oceans using the Ensemble Kalman Filter," *J. Marine Systems*, 152, 1–17, 2015.
- **Slivinski, L., and C. Snyder**, "Exploring practical estimates of the ensemble size necessary for particle filters," *Mon. Weather Rev.*, 144, 861–875, 2016.
- **Slivinski, L., E. Spiller, A. Apte, and B. Sandstede**, "A hybrid particle-ensemble Kalman filter for Lagrangian data assimilation," *Mon. Weather Rev.*, 143, 195–211, 2015.
- **Sluka, T. C., S. G. Penny, E. Kalnay, and T. Miyoshi**, "Assimilating atmospheric observations into the ocean using strongly coupled ensemble data assimilation," *Geophys. Res. Let.*, 43, 752–759, 2016.
- **Smith, D. M., and J. M. Murphy**, "An objective ocean temperature and salinity analysis using covariances from a global climate model," *J. Geophys. Res. Oceans*, 112, 2007.
- **Smith, D. M., R. Eade, and H. Pohlmann**, "A comparison of full-field and anomaly initialization for seasonal to decadal climate prediction," *Clim. Dyn.*, 41, 3325–3338, 2013.
- **Smith, P. J., A. M. Fowler, and A. S. Lawless**, "Exploring strategies for coupled 4D-Var data assimilation using an idealised atmosphere–ocean model," *Tellus A*, 67, 27,025, 2015.
- **Snyder, C., T. Bengtsson, P. Bickel, and J. L. Anderson**, "Obstacles to high-dimensional particle filtering," *Mon. Weather Rev.*, 136, 4629–4640, 2008.
- **Snyder, C., T. Bengtsson, and T. Morzfeld**, "Performance bounds for particle filters using the optimal proposal," *Mon. Weather Rev.*, 143, 4750–4761, 2015.
- **Stewart, L. M., S. Dance, and N. Nichols**, "Correlated observation errors in data assimilation," *Int. J. Numer. Methods Fluids*, 56, 1521–1527, 2008.
- **Stockdale, T. N.**, "Coupled ocean–atmosphere forecasts in the presence of climate drift," *Mon. Weather Rev.*, 125, 809–818, 1997.
- **Stordal, A. S., H. A. Karlsen, G. Nævdal, H. J. Skaug, and B. Vallès**, "Bridging the Ensemble Kalman Filter and particle filters: the adaptive Gaussian mixture filter," *Computat. Geosci.*, 15, 293–305, 2011.
- **Stott, P., M. Allen, N. Christidis, R. Dole, M. Hoerling, C. Huntingford, P. Pall, J. Perlwitz, and D. Stone**, "Attribution of weather and climate-related events," in *Climate Science for Serving Society: Research, Modelling and Prediction Priorities*, G.R. Asrar and J. W. Hurrell (Eds.), Springer, 2013.
- **Sugiura, N., T. Awaji, S. Masuda, T. Mochizuki, T. Toyoda, T. Miyama, H. Igarashi, and Y. Ishikawa**, "Development of a four-dimensional variational coupled data assimilation system for enhanced analysis and prediction of seasonal to interannual climate variations," *J. Geophys. Res. Oceans*, 113, 2008.
- **Sun, C., Z. Hao, M. Ghil, and J. D. Neelin**, "Data assimilation for a coupled ocean–atmosphere model. Part I: Sequential state estimation," *Mon. Weather Rev.*, 130, 1073–1099, 2002.
- **Talagrand, O.**, "Assimilation of observations, an introduction (special issue — data assimilation in meteorology and oceanography: Theory and practice)," *J. Meteorol. Soc. Jpn.*, 75, 191–209, 1997.
- **Talagrand, O.**, "Variational assimilation," in *Data assimilation: Making Sense of Observations*, pp. 41–67, Springer, 2010.
- **Talagrand, O., and P. Courtier**, "Variational assimilation of meteorological observations with the adjoint vorticity equation. i: Theory," *Q J Roy. Meteor. Soc.*, 113, 1311–1328, 1987.
- **Tandeo, P., M. Pulido, and F. Lott**, "Offline parameter estimation using EnKF and maximum likelihood error covariance estimates: Application to a subgrid-scale orography parametrization," *Q J Roy. Meteor. Soc.*, 141, 383–395, 2015.
- **Tardif, R., G. J. Hakim, and C. Snyder**, "Coupled atmosphere–ocean data assimilation experiments with a low-order climate model," *Clim. Dyn.*, 43, 1631–1643, 2014.
- **Tardif, R., G. J. Hakim, and C. Snyder**, "Coupled atmosphere–ocean data assimilation experiments with a low-order model and CMIP5 model data," *Clim. Dyn.*, 45, 1415–1427, 2015.
- **Thacker, C.**, "Data assimilation with inequality constraints," *Ocean Modell*, 16, 264–276, 2007.
- **Thompson, P. D.**, "Reduction of analysis error through constraints of dynamical consistency," *J. Appl. Meteor.*, 8, 738–742, 1969.
- **Tippett, M. K., J. L. Anderson, C. H. Bishop, T. M. Hamill, and J. S. Whitaker**, "Ensemble square-root filters," *Mon. Weather Rev.*, 131, 1485–1490, 2003.
- **Trémolet, Y.**, "Accounting for an imperfect model in 4D-Var," *Q J Roy. Meteor. Soc.*, 132, 2483–2504, 2006.
- **Trémolet, Y.**, "Model-error estimation in 4D-Var," *Q J Roy. Meteor. Soc.*, 133, 1267–1280, 2007.
- **Trevisan, A., and L. Palatella**, "On the Kalman filter error covariance collapse into the unstable subspace," *Nonlinear Proc. Geoph.*, 18, 243–250, 2011a.
- **Trevisan, A., and L. Palatella**, "Chaos and weather forecasting: the role of the unstable subspace in predictability and state estimation problems," *Int. J. Bifurcat. Chaos*, 21, 3389–3415, 2011b.
- **Trevisan, A., and F. Uboldi**, "Assimilation of standard and targeted observations within the unstable subspace of the observation-analysis-forecast cycle," *J. Atmos. Sci.*, 61, 103–113, 2004.
- **Trevisan, A., M. D’Isidoro, and O. Talagrand**, "Four-dimensional variational assimilation in the unstable subspace and the optimal subspace dimension," *Q J Roy. Meteor. Soc.*, 136, 487–496, 2010.
- **Uboldi, F., and M. Kamachi**, "Time-space weak-constraint data assimilation for nonlinear models," *Tellus A*, 52, 412–421, 2000.
- **Uboldi, F., and A. Trevisan**, "Detecting unstable structures and controlling error growth by assimilation of standard and adaptive observations in a primitive equation ocean model," *Nonlinear Proc. Geoph.*, 16, 67–81, 2006.
- **Ueno, G., and N. Nakamura**, "Iterative algorithm for maximum-likelihood estimation of the observation-error covariance matrix for ensemble-based filters," *Q J Roy. Meteor. Soc.*, 140, 295–315, 2014.
- **Ueno, G., and N. Nakamura**, "Bayesian estimation of the observation-error covariance matrix in ensemble-based filters," *Q J Roy. Meteor. Soc.*, 142, 2055–2080, 2016.
- **van Leeuwen, P. J.**, "Particle filtering in geophysical systems," *Mon. Weather Rev.*, 137, 4089–4114, 2009.
- **van Leeuwen, P. J., Y. Cheng, and S. Reich**, "Nonlinear data assimilation," vol. 2, Springer, 2015.
- **Vannitsem, S.**, "Predictability of large-scale atmospheric motions: Lyapunov exponents and error dynamics," *Chaos*, 27, 032,101, 2017.
- **Vidard, P., A. Piacentini, and F.-X. Le Dimet**, "Variational data analysis with control of the forecast bias," *Tellus A*, 56, 177–188, 2004.
- **Wackernagel, H.**, "Multivariate Geostatistics," 3rd ed., Springer Verlag, Berlin, 2003.
- **Wang, S., M. Xue, A. D. Schenkman, and J. Min**, "An iterative ensemble square root filter and tests with simulated radar data for storm-scale data assimilation," *Q J Roy. Meteor. Soc.*, 139, 1888–1903, 2013.
- **Wang, X., and C. H. Bishop**, "A comparison of breeding and ensemble transform Kalman filter ensemble forecast schemes," *J. Atmos. Sci.*, 60, 1140–1158, 2003.
- **Wang, X., C. H. Bishop, and S. J. Julier**, "Which is better, an ensemble of positive–negative pairs or a centered spherical simplex ensemble?," *Mon. Weather Rev.*, 132, 1590–1605, 2004.
- **Wang, X., C. Snyder, and T. M. Hamill**, "On the theoretical equivalence of differently proposed ensemble-3DVAR hybrid analysis schemes," *Mon. Weather Rev.*, 135, 222–227, 2007.
- **Wang, Y., F. Counillon, and L. Bertino**, "Alleviating the bias induced by the linear analysis update with an isopycnal ocean model," *Q J Roy. Meteor. Soc.*, 142, 2016.
- **Weber, R. J., A. Carrassi, and F. J. Doblas-Reyes**, "Linking the anomaly initialization approach to the mapping paradigm: a proof-of-concept study," *Mon. Weather Rev.*, 143, 4695–4713, 2015.
- **Whitaker, J. S., and T. M. Hamill**, "Ensemble data assimilation without perturbed observations," *Mon. Weather Rev.*, 130, 1913–1924, 2002.
- **Whitaker, J. S., and T. M. Hamill**, "Evaluating methods to account for system errors in ensemble data assimilation," *Mon. Weather Rev.*, 140, 3078–3089, 2012.
- **Wiener, N.**, "Extrapolation, Interpolation and Smoothing of Stationary Time Series, with Engineering Applications," M.I.T. Press, Cambridge, MA, 1949.
- **Wikle, C. K., and L. M. Berliner**, "A Bayesian tutorial for data assimilation," *Physica D*, 230, 1–16, 2007.
- **Winiarek, V., J. Vira, M. Bocquet, M. Sofiev, and O. Saunier**, "Towards the operational estimation of a radiological plume using data assimilation after a radiological accidental atmospheric release," *Atmos. Environ.*, 45, 2944–2955, 2011.
- **Wu, L., V. Mallet, M. Bocquet, and B. Sportisse**, "A comparison study of data assimilation algorithms for ozone forecasts," *J. Geophys. Res.*, 113, D20,310, 2008.
- **Xie, J., L. Bertino, F. Counillon, K. A. Lisæter, and P. Sakov**, "Quality assessment of the topaz4 reanalysis in the arctic over the period 1991-2013," *Ocean Sci.*, 13, 123, 2017.
- **Yang, S.-C., M. Corazza, A. Carrassi, E. Kalnay, and T. Miyoshi**, "Comparison of local ensemble transform Kalman filter, 3DVAR, and 4DVAR in a quasigeostrophic model," *Mon. Weather Rev.*, 137, 693–709, 2009.
- **Yano, J.-I., M. Z. Ziemiański, M. Cullen, P. Termonia, J. Onvlee, L. Bengtsson, A. Carrassi, R. Davy, A. Deluca, S. L. Gray, et al.**, "Scientific challenges of convective-scale numerical weather prediction," *Bull. Amer. Meteor. Soc.*, 2017.
- **Ye, J., N. Kadakia, P. Rozdeba, H. Abarbanel, and J. Quinn**, "Improved variational methods in statistical data assimilation," *Nonlinear Proc. Geoph.*, 22, 205–213, 2015.
- **Ying, M., and F. Zhang**, "An adaptive covariance relaxation method for ensemble data assimilation," *Q J Roy. Meteor. Soc.*, 141, 2898–2906, 2015.
- **Zhang, M., and F. Zhang**, "E4DVar: Coupling an ensemble Kalman filter with four-dimensional variational data assimilation in a limited-area weather prediction model," *Mon. Weather Rev.*, 140, 587–600, 2012.
- **Zhang, S., M. Harrison, A. Rosati, and A. Wittenberg**, "System design and evaluation of coupled ensemble data assimilation for global oceanic climate studies," *Mon. Weather Rev.*, 135, 3541–3564, 2007.
- **Zhang, Y., M. Bocquet, V. Mallet, C. Seigneur, and A. Baklanov**, "Real-time air quality forecasting, part II: State of the science, current research needs, and future prospects," *Atmos. Environ.*, 60, 656–676, 2012.
- **Zheng, X. G.**, "An adaptive estimation of forecast error covariance parameters for Kalman filtering data assimilation," *Adv. Atmos. Sci.*, 26, 154–160, 2009.
- **Zhou, H., L. Li, H.-J. Hendricks Franssen, and J. J. Gómez-Hernández**, "Pattern Recognition in a Bimodal Aquifer Using the Normal-Score Ensemble Kalman Filter," *Math. Geosci.*, 44, 169–185, 2012.
- **Zhu, M., P.-J. van Leeuwen, and J. Amezcua**, "Implicit equal-weights particle filter," *Q J Roy. Meteor. Soc.*, 142, 1904–1919, 2016.
- **Zupanski, D.**, "A general weak constraint applicable to operational 4DVAR data assimilation systems," *Mon. Weather Rev.*, 125, 2274–2292, 1997.
- **Zupanski, M.**, "A preconditioning algorithm for four-dimensional variational data assimilation," *Mon. Weather Rev.*, 124, 2562–2573, 1996.
- **Zupanski, M.**, "Maximum likelihood ensemble filter: Theoretical aspects," *Mon. Weather Rev.*, 133, 1710–1726, 2005.