# Trajectory Losses & Long-Horizon Dynamics Learning for Chaotic & Latent State Systems

## Executive Summary & Problem Formulation

In chaotic dynamical systems (such as **Lorenz-96, Kuramoto–Sivashinsky**, and atmospheric/oceanic dynamics), standard point-wise **Mean Squared Error (MSE / RMSE)** presents severe practical and theoretical challenges when used to train state-transition models over extended horizons.

### The Dynamics & Optimization Pitfalls of Pointwise MSE in Chaos

1. **Chaotic Sensitivity to Initial Conditions**: Governed by positive maximal Lyapunov exponents ($\lambda_{\max} > 0$), any infinitesimal error $\delta_0$ in initial state prediction grows exponentially over time:
   ```math
   \|\delta_t\| \sim \|\delta_0\| e^{\lambda_{\max} t}
   ```
2. **Phase Mismatch Penalization**: If a neural model predicts a physically valid trajectory that is slightly shifted in phase (e.g., an oscillatory wave peak arriving slightly early or late), pointwise Euclidean MSE severely penalizes the prediction even though the underlying manifold geometry is structurally correct.
3. **Tendency Toward Mean Averaging**: When trained with one-step or unregularized MSE across non-convex, chaotic trajectories where predictions and ground truth rapidly decorrelate, the loss gradients push the network toward predicting the conditional expectation—often resulting in a blurred, damped statistical average of the attractor rather than generating realistic dynamical orbits.

To train neural transition models (such as the State Transition Model in **D-LSPF / DVSI** or neural Data Assimilation solvers) to learn authentic long-term trajectories, researchers employ **multi-step free-running rollouts**, **filtered likelihoods**, **variational SMC bounds**, and **invariant measure / attractor matching objectives**.

---

## 1. The Core Paradigm: One-Step vs. Multi-Step Free-Running Rollout Loss

The foundational reason for compounding error in learned dynamics is the discrepancy between **Teacher Forcing** (one-step training) and **Student Forcing** (autoregressive rollout at test time).

```
One-Step Training (Teacher Forcing):
  x_t ──────► [ f_θ ] ──────► x̂_{t+1}  (Only 1-step error evaluated; model never sees its own mistakes)

Multi-Step Free-Running Rollout (Student Forcing / Multi-Step Backprop):
  x_t ──────► [ f_θ ] ──────► x̂_{t+1} ──────► [ f_θ ] ──────► x̂_{t+2} ──────► ... ──────► [ f_θ ] ──────► x̂_{t+H}
                 │                           │                                              │
                 ▼                           ▼                                              ▼
            Loss(x̂_{t+1}, x_{t+1})      Loss(x̂_{t+2}, x_{t+2})                         Loss(x̂_{t+H}, x_{t+H})
                 └───────────────────────────┴──────────────────────────────────────────────┘
                                     Total Rollout Loss Backpropagated Through Time
```

### Mathematical Formulation

Instead of training solely on one-step transitions:

```math
\hat{\mathbf{x}}_{t+1} = f_\theta(\mathbf{x}_t)
```

we unroll the model recursively for a prediction horizon of $H$ steps:

```math
\hat{\mathbf{x}}_{t+k} = f_\theta(\hat{\mathbf{x}}_{t+k-1}), \quad k = 1, \dots, H
```

and compute the weighted multi-step simulation loss:

```math
\mathcal{L}_{\text{rollout}}(\theta) = \sum_{k=1}^H w_k \, d(\hat{\mathbf{x}}_{t+k}, \mathbf{x}_{t+k})
```

where $w_k$ are weighting coefficients (e.g., discount factors $\gamma^k$ or normalized weights $1/H$) and $d(\cdot, \cdot)$ is a metric (MSE, Negative Log-Likelihood, or Mahalanobis distance).

### Rigorous Literature on Multi-Step Rollout & Distribution Shift

1. **Venkatraman, Hebert, & Bagnell (AAAI 2015)**: *"Improving Multi-step Prediction of Learned Time Series Models"*
   - **Authors**: Arun Venkatraman, Martial Hebert, J. Andrew Bagnell.
   - **Citation**: [AAAI 2015](https://ojs.aaai.org/index.php/AAAI/article/view/9590).
   - **Exact Contribution**: Investigates autoregressive time-series models $\hat{\mathbf{x}}_{t+1} = f(\hat{\mathbf{x}}_t)$. Demonstrates that one-step trained models suffer from severe distribution shift during autonomous rollout (where errors can compound exponentially if the system dynamics are expansive with Lipschitz constant $L > 1$). They propose the **Data As Demonstrator (DAD)** algorithm to train on states encountered during multi-step rollouts to bound trajectory drift.
2. **Ross, Gordon, & Bagnell (AISTATS 2011)**: *"A Reduction of Imitation Learning and Structured Prediction to No-Regret Online Learning"*
   - **Authors**: Stéphane Ross, Geoffrey J. Gordon, J. Andrew Bagnell.
   - **Citation**: [AISTATS 2011 / PMLR 15:627-635](https://proceedings.mlr.press/v15/ross11a.html).
   - **Exact Contribution**: Formalizes the general phenomenon of *covariate shift* / exposure bias in sequential prediction (Theorem 2.1 in imitation learning with 0–1 loss). Proves that training strictly on expert/ground-truth inputs leads to quadratic compounding error bounds $O(\epsilon T^2)$ when executed autonomously, motivating iterative rollout training (DAgger) to recover $O(\epsilon T)$ bounds.
3. **Benechehab, Thomas, Paolo, Filippone, & Kégl (2024)**: *"A Multi-step Loss Function for Robust Learning of the Dynamics in Model-based Reinforcement Learning"*
   - **Authors**: Abdelhakim Benechehab, Albert Thomas, Giuseppe Paolo, Maurizio Filippone, Balázs Kégl.
   - **Citation**: [arXiv:2402.03146](https://arxiv.org/abs/2402.03146).
   - **Exact Contribution**: Investigates weighted multi-step losses for one-step transition models in model-based RL. Provides theoretical analysis in the linear Gaussian setting showing how multi-step objectives alter parameter bias under observation noise, accompanied by empirical evaluations showing improved long-horizon simulation accuracy on continuous control benchmarks.
4. **Bengio, Vinyals, Jaitly, & Shazeer (NeurIPS 2015)**: *"Scheduled Sampling for Sequence Prediction with Recurrent Neural Networks"*
   - **Authors**: Samy Bengio, Oriol Vinyals, Navdeep Jaitly, Noam Shazeer.
   - **Citation**: [NeurIPS 2015](https://proceedings.neurips.cc/paper/2015/hash/e995f98d56967d946471af29d7bf99f1-Abstract.html).
   - **Exact Contribution**: Addresses exposure bias in recurrent sequence generation by annealing the training input from ground-truth states (Teacher Forcing) to model predictions (Student Forcing) according to a decaying schedule.

---

## 2. Directory of Trajectory & State-Space Losses

```
┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
│                              Trajectory & Dynamics Loss Taxonomy                                │
├───────────────────────────────┬─────────────────────────────────┬───────────────────────────────┤
│ 1. Filtered Likelihoods       │ 2. Variational SMC (VSMC)       │ 3. Invariant Measure / OT     │
│ • EnKF / EKF Log-Likelihood   │ • VSMC ELBO Lower Bound         │ • MMD Attractor Matching      │
│ • Truncated BPTT (TBPTT)      │ • Multi-modal path preservation │ • Optimal Transport / Chaos   │
├───────────────────────────────┼─────────────────────────────────┼───────────────────────────────┤
│ 4. Path-Wise Smoothing (AFSF) │ 5. Flow Matching (CFM)          │ 6. Differentiable DTW         │
│ • Forward filtering flow      │ • Velocity field regression     │ • Soft-DTW phase tolerance    │
│ • Backward transition kernel  │ • Straight probability flows    │ • Time-series shape alignment │
├───────────────────────────────┴─────────────────────────────────┴───────────────────────────────┤
│ 7. Variational Data Assimilation (Weak-Constraint 4D-Var)                                      │
│ • End-to-end neural solvers across multi-step assimilation windows                              │
└─────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

### Loss 1: Forecast Log-Likelihood via Auto-Differentiable Filtering (EnKF / EKF)

Embed the transition model $f_\theta$ inside an auto-differentiable state-space filter (Ensemble Kalman Filter, Extended Kalman Filter, or 3D-Var) and optimize the **marginal log-likelihood of observations** along the trajectory:

```math
\mathcal{L}_{\text{filter}}(\theta, \phi) = \frac{1}{2} \sum_{t=1}^T \left[ \log \det(\mathbf{S}_t) + (\mathbf{y}_t - \mathbf{H}_t \hat{\mathbf{m}}_t^\theta)^\top \mathbf{S}_t^{-1} (\mathbf{y}_t - \mathbf{H}_t \hat{\mathbf{m}}_t^\theta) \right]
```

- **Variables**:
  - $\mathbf{y}_t$: Noisy observation vector at time $t$.
  - $\hat{\mathbf{m}}_t^\theta$: Forecast mean state generated by $f_\theta$.
  - $\mathbf{H}_t$: Observation operator mapping state space to observation space.
  - $\mathbf{S}_t = \mathbf{H}_t \mathbf{C}_t^{\theta, \phi} \mathbf{H}_t^\top + \mathbf{R}_t$: Innovation covariance matrix ($\mathbf{C}_t$ is forecast error covariance, $\mathbf{R}_t$ is observation error covariance).
- **Mechanism**: The innovation residual $(\mathbf{y}_t - \mathbf{H}_t \hat{\mathbf{m}}_t^\theta)$ is normalized by the inverse covariance $\mathbf{S}_t^{-1}$. In regions of dynamical divergence or high state dispersion, the filter's estimated forecast covariance $\mathbf{C}_t$ inflates, which **dynamically scales down the gradient updates** and prevents numerical instabilities.
- **Truncated Backpropagation Through Time (TBPTT)**: Sequential filtering updates are backpropagated over sub-sequences of length $L \ll T$ (e.g., $L = 20$), detaching state tensors across window boundaries to maintain training stability.

---

### Loss 2: Unsupervised Variational SMC (VSMC) Log-Marginal Likelihood

For non-linear, non-Gaussian systems modeled with Differentiable Particle Filters (DPF) and probabilistic transition models $p_\theta(\mathbf{x}_t \mid \mathbf{x}_{t-1})$:

```math
\mathcal{L}_{\text{VSMC}}(\theta, \phi) = -\sum_{t=1}^T \log \left( \frac{1}{N_p} \sum_{i=1}^{N_p} \tilde{w}_t^i \right)
```

- **Variables**: $\tilde{w}_t^i$ are the unnormalized particle importance weights at time step $t$, computed via likelihood weighting $\tilde{w}_t^i = w_{t-1}^i \cdot p(\mathbf{y}_t \mid \mathbf{x}_t^i)$.
- **Key Papers**:
  - *Maddison et al. (ICLR 2017)*, *"Filtering Variational Objectives"*.
  - *Naesseth, Linderman, Ranganath, Blei (AISTATS 2018)*, *"Variational Sequential Monte Carlo"*.
  - *Le, Igl, Rainforth, Jin, Wood (ICLR 2018)*, *"Auto-Encoding Sequential Monte Carlo"*.
- **Mechanism**: Optimizes a variational lower bound (ELBO) over the entire empirical particle distribution. When chaotic dynamics exhibit multi-modal branching (e.g., switching between lobes of a Lorenz attractor), VSMC optimizes the transition kernel to represent valid alternative trajectory paths rather than collapsing to an unphysical blurred mean.

---

### Loss 3: Path-Wise Trajectory Density Loss (AFSF)

- **Framework**: **Amortized Filtering and Smoothing Framework (AFSF)** (*Amortized Filtering and Smoothing with Conditional Normalizing Flows*).
- **Mathematical Formulation**: Trains a forward filtering flow $p_{\theta_1}(\mathbf{u}_t \mid \mathbf{s}_t)$ alongside a **backward smoothing transition flow** $p_{\theta_2}(\mathbf{u}_t \mid \mathbf{u}_{t+1}, \mathbf{s}_t)$ conditioned on a shared summary representation $\mathbf{s}_t$ of observation history $\mathbf{y}_{1:t}$:
  ```math
  \mathcal{L}_{\text{AFSF}} = -\frac{1}{N T} \sum_{i=1}^N \left[ \sum_{t=1}^T \log p_{\theta_1}(\mathbf{u}_t^i \mid \mathbf{s}_t^i) + \lambda \sum_{t=1}^{T-1} \log p_{\theta_2}(\mathbf{u}_t^i \mid \mathbf{u}_{t+1}^i, \mathbf{s}_t^i) \right]
  ```
- **Mechanism**: Coupling the forward filtering distribution and the backward transition kernel under a shared representation induces an **implicit trajectory-level regularization**. Penalizing statistical inconsistency between backward temporal transitions and terminal states ensures consistent smoothed trajectory reconstructions across long time windows.

---

### Loss 4: Attractor Invariant Measure & Distribution Matching (MMD / Optimal Transport)

Beyond a chaotic system's predictability horizon ($t > 1/\lambda_{\max}$), point-by-point trajectory tracking becomes uninformative. Training objectives shift to matching the **invariant measure** $\mu_{\text{true}}$ (the long-term statistical geometry of the chaotic attractor):

```math
\mathcal{L}_{\text{attractor}} = D_{\text{dist}}\left( \text{Law}(f_\theta^{(N)}(\mathbf{x}_0)), \, \mu_{\text{true}} \right)
```

#### Key Papers & Implementations:

1. **Jiang, Lu, Orlova, & Willett (NeurIPS 2023)**: *"Training neural operators to preserve invariant measures of chaotic attractors"*
   - **Citation**: [NeurIPS 2023 / arXiv:2306.01187](https://arxiv.org/abs/2306.01187).
   - **Exact Contribution**: Argues that pointwise MSE is a poor long-term objective for chaotic attractors (such as Lorenz-96 and Kuramoto–Sivashinsky) because small initial errors lead to decorrelation. Proposes training neural operators (e.g., FNOs) using **Physics-Informed Optimal Transport (Wasserstein distance)** and **Contrastive Feature Learning** over unrolled trajectories to preserve the invariant statistical distribution of the attractor.
2. **PhyxMamba (Liu et al., 2024/2025)**: *"PhyxMamba: Physics-Informed Mamba for Chaotic System Dynamics"*
   - **Citation**: OpenReview / arXiv (`changliu01/PhyxMamba`).
   - **Exact Contribution**: Combines a Mamba state-space model with time-delay embedding attractor reconstruction. Employs a **Maximum Mean Discrepancy (MMD)** distributional loss to regularize autoregressive multi-step rollouts toward the true chaotic attractor distribution:
     ```math
     \text{MMD}^2(X, \hat{X}) = \frac{1}{n^2}\sum_{i,j} k(\mathbf{x}_i, \mathbf{x}_j) - \frac{2}{nm}\sum_{i,j} k(\mathbf{x}_i, \hat{\mathbf{x}}_j) + \frac{1}{m^2}\sum_{i,j} k(\hat{\mathbf{x}}_i, \hat{\mathbf{x}}_j)
     ```

---

### Loss 5: Conditional Flow Matching (CFM) Velocity Loss

- **Frameworks**: **FlowDAS** (*Flow-based Data Assimilation*), **EnFF** (*Ensemble Flow Matching*), and Continuous Normalizing Flows (Lipman et al., Albergo et al.).
- **Mathematical Formulation**: Instead of predicting discrete next-step coordinates, train a neural vector field $\mathbf{v}_\theta(\mathbf{z}_\tau, \tau)$ to match the conditional velocity field that transports probability mass along continuous paths:
  ```math
  \mathcal{L}_{\text{CFM}}(\theta) = \mathbb{E}_{\tau \sim \mathcal{U}[0,1], \, \mathbf{z}_0, \mathbf{z}_1} \left[ \| \mathbf{v}_\theta(\mathbf{z}_\tau, \tau) - (\mathbf{z}_1 - \mathbf{z}_0) \|_2^2 \right]
  ```
  where $\mathbf{z}_\tau = (1-\tau)\mathbf{z}_0 + \tau \mathbf{z}_1$ interpolates between coupled states ($\mathbf{z}_0 = \mathbf{x}_t$, $\mathbf{z}_1 = \mathbf{x}_{t+1}$).
- **Mechanism**: Regressing the marginal velocity field creates straight probability paths, avoiding the compounding drift associated with discrete autoregressive step-by-step maps.

---

### Loss 6: Soft-DTW (Differentiable Dynamic Time Warping)

- **Paper**: *Cuturi & Blondel (ICML 2017)*, *"Soft-DTW: a Differentiable Loss Function for Time-Series"*
  - **Citation**: [PMLR 70:894-903](https://proceedings.mlr.press/v70/cuturi17a.html).
- **Mathematical Formulation**: Replaces the non-differentiable minimum operator in classical DTW with a smoothed $\min^\gamma$ soft-minimum:
  ```math
  \text{Soft-DTW}_\gamma(\mathbf{X}, \mathbf{Y}) = -\gamma \log \sum_{\mathbf{A} \in \mathcal{A}_{n,m}} \exp\left(-\frac{\langle \mathbf{A}, \mathbf{\Delta}(\mathbf{X}, \mathbf{Y}) \rangle}{\gamma}\right)
  ```
- **Mechanism**: Evaluates the global geometric shape of time-series trajectories while permitting elastic temporal alignments, preventing excessive penalties for slight phase leads/lags in dynamic wave patterns.

---

### Loss 7: Weak-Constraint 4D-Var & Neural Data Assimilation

1. **Le Dimet & Talagrand (Tellus 1986)**: *"Variational algorithms for analysis and assimilation of meteorological observations: theoretical aspects"*
   - **Citation**: [Tellus A, 38A(2), 97–110](https://doi.org/10.3402/tellusa.v38i2.11706).
   - **Exact Contribution**: Formulates variational data assimilation (4D-Var) over a temporal window where the state trajectory is constrained by the underlying dynamical differential equations, providing the adjoint formulation for trajectory optimization.
2. **Farchi, Chrust, Bocquet, Laloyaux, & Bonavita (JAMES 2023)**: *"Online model error correction with neural networks in the incremental 4D-Var framework"*
   - **Citation**: [Journal of Advances in Modeling Earth Systems, 15(11), e2023MS003684](https://doi.org/10.1029/2023MS003684) / [arXiv:2210.13817](https://arxiv.org/abs/2210.13817).
   - **Exact Contribution**: Demonstrates that neural network model-error corrections can be optimized online directly within the incremental weak-constraint 4D-Var trajectory formulation from observational data.
3. **Fablet, Chapron, Drumetz, Mémin, Pannekoucke, & Rousseau (JAMES 2021)**: *"Learning Variational Data Assimilation Models and Solvers"*
   - **Citation**: [JAMES, 13(7), e2020MS002186](https://doi.org/10.1029/2020MS002186) / [arXiv:2007.12941](https://arxiv.org/abs/2007.12941).
   - **Exact Contribution**: Develops an end-to-end framework combining deep learning with variational data assimilation solvers to reconstruct continuous physical state trajectories from partial, noisy observations.

---

## 3. Application to Deep Variational State Inference (DVSI / D-LSPF)

In **DVSI** and **D-LSPF**, true physical states $\mathbf{z}_t$ are latent and unobserved. An inference model $q_\phi(\mathbf{z} \mid \mathbf{y})$ estimates posterior states, while a State Transition Model (STM) $f_\theta$ models the physical latent evolution.

```
                         ┌────────────────────────────┐
                         │ Observations y_{1:T}       │
                         └─────────────┬──────────────┘
                                       │
                                       ▼
                    ┌──────────────────────────────────────┐
                    │ Inference Model q_φ(z | y)           │
                    └──────────────────┬───────────────────┘
                                       │ Posterior sample ẑ_t
                                       ▼
                    ┌──────────────────────────────────────┐
                    │ STM Free-Running Rollout f_θ (H-step)│
                    └──────────────────┬───────────────────┘
                                       │ Rollout trajectory ẑ_{t+1:t+H}
                   ┌───────────────────┼───────────────────┐
                   ▼                   ▼                   ▼
          [ Observation Loss ] [ Trajectory NLL/MSE ] [ Attractor MMD ]
          h(ẑ) vs y_{t+k}      ẑ vs q-inferred        ẑ vs archival law
```

### Hybrid Training Objective

```math
\boxed{\mathcal{L}_{\text{total}}(\theta, \phi) = \mathcal{L}_{\text{ELBO}}(\theta, \phi) + \lambda_1 \mathcal{L}_{\text{rollout-free}}(\theta) + \lambda_2 \mathcal{L}_{\text{MMD}}(\theta)}
```

1. **Step 1 (Posterior Initialization)**: Initialize the STM from a latent state inferred by the posterior network $\hat{\mathbf{z}}_t \sim q_\phi(\mathbf{z}_t \mid \mathbf{y}_{\le t})$.
2. **Step 2 (Free-Running Student Rollout)**: Roll the STM forward autonomously for $H$ steps using its **own predicted states**:
   ```math
   \hat{\mathbf{z}}_{t+k} = f_\theta(\hat{\mathbf{z}}_{t+k-1}), \quad k = 1, \dots, H
   ```
3. **Step 3 (Multi-Scale Evaluation)**:
   - **Posterior Consistency**: Penalize discrepancy between $\hat{\mathbf{z}}_{t+k}$ and the inference network's posterior distribution $q_\phi(\mathbf{z}_{t+k} \mid \mathbf{y}_{\le t+k})$.
   - **Observation Projection**: Pass $\hat{\mathbf{z}}_{t+k}$ through the observation decoder $\mathbf{h}(\hat{\mathbf{z}})$ and evaluate likelihood against actual observations $\mathbf{y}_{t+k}$.
   - **Attractor Distribution Regularization**: Compute MMD between the ensemble of free-running rollout vectors and the empirical latent training set to ensure long-term topological stability.

---

## 4. PyTorch Reference: Truncated BPTT with Multi-Step Rollout Loss

```python
import torch
import torch.nn as nn

class MultiStepRolloutTrainer:
    def __init__(self, transition_model, obs_decoder, obs_cov_R, horizon=10, lr=1e-3):
        self.model = transition_model       # f_theta(z)
        self.decoder = obs_decoder          # h(z)
        self.R_inv = torch.inverse(obs_cov_R)
        self.horizon = horizon              # H-step rollout
        self.optimizer = torch.optim.Adam(self.model.parameters(), lr=lr)

    def train_chunk(self, z_init, obs_sequence):
        """
        z_init: [batch_size, latent_dim] - Initial posterior state
        obs_sequence: [batch_size, horizon, obs_dim] - Future observations y_{t+1:t+H}
        """
        self.optimizer.zero_grad()
        z_current = z_init
        total_loss = 0.0

        for k in range(self.horizon):
            # Free-running autoregressive rollout step (Student Forcing)
            z_next = self.model(z_current)
            
            # Project latent state to observation space
            y_pred = self.decoder(z_next)
            y_true = obs_sequence[:, k, :]
            
            # Observation innovation loss (Mahalanobis / Weighted NLL)
            diff = y_true - y_pred
            step_loss = torch.mean(torch.sum(diff @ self.R_inv * diff, dim=-1))
            
            # Discounted weight for step k
            weight = (0.95) ** k
            total_loss += weight * step_loss
            
            z_current = z_next

        total_loss.backward()
        nn.utils.clip_grad_norm_(self.model.parameters(), max_norm=1.0)
        self.optimizer.step()
        
        return total_loss.item()
```

---

## 5. Summary Reference Table

| Objective | Target Challenge | Mathematical Formulation | Canonical Reference |
|---|---|---|---|
| **Multi-Step Rollout Loss** | Compounding errors during autonomous rollout | $\sum_{k=1}^H w_k d(\hat{\mathbf{x}}_{t+k}, \mathbf{x}_{t+k})$ | Venkatraman et al. (AAAI 2015); Benechehab et al. (2024) |
| **Filtered Log-Likelihood** | Gradient explosion under trajectory divergence | $\frac{1}{2}\sum_t [\log\det(\mathbf{S}_t) + \mathbf{e}_t^\top \mathbf{S}_t^{-1} \mathbf{e}_t]$ | Auto-diff EnKF / 3D-Var + TBPTT |
| **Variational SMC (VSMC)** | Preserving multi-modal trajectory branches in chaos | $-\sum_t \log\left(\frac{1}{N_p}\sum_i \tilde{w}_t^i\right)$ | Naesseth et al. (AISTATS 2018); Maddison et al. (ICLR 2017) |
| **Path-Wise Smoothing (AFSF)** | Inconsistency between filtering & backward smoothing | $-\sum_t [\log p_{\theta_1}(\mathbf{u}_t) + \lambda \log p_{\theta_2}(\mathbf{u}_t \mid \mathbf{u}_{t+1})]$ | AFSF Normalizing Flows |
| **Attractor Invariant Measure (OT/MMD)** | Pointwise MSE decorrelation past predictability limit | $W_2(\hat{\mu}, \mu_{\text{true}})$ / $\text{MMD}^2(X, \hat{X})$ | Jiang et al. (NeurIPS 2023); PhyxMamba (2024) |
| **Conditional Flow Matching (CFM)** | Error accumulation in discrete autoregressive maps | $\mathbb{E}[\|\mathbf{v}_\theta(\mathbf{z}_\tau) - (\mathbf{z}_1 - \mathbf{z}_0)\|^2]$ | FlowDAS; Ensemble Flow Matching (EnFF) |
| **Soft-DTW** | Phase-shift and timing misalignment penalties | $-\gamma \log \sum_{\mathbf{A}} e^{-\langle \mathbf{A}, \mathbf{\Delta} \rangle / \gamma}$ | Cuturi & Blondel (ICML 2017) |
| **Weak-Constraint 4D-Var** | Trajectory optimization with neural error models | $\frac{1}{2}\|\mathbf{x}_0 - \mathbf{x}_b\|_{\mathbf{B}^{-1}}^2 + \dots$ | Le Dimet & Talagrand (1986); Farchi et al. (JAMES 2023) |
| **Scheduled Sampling** | Exposure bias between teacher and student rollouts | $\epsilon_i$-annealed input selection | Bengio et al. (NeurIPS 2015) |