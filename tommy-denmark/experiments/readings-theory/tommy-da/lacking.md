# Foundational Gaps for Data Assimilation and Forecasting

This is a durable two-lane foundation plan. It is **not** a plan to imitate particular papers, continue AD-EnFF, or prematurely choose a future architecture.

The two lanes should run in parallel:

1. **Deep foundations:** the mathematical and scientific ideas needed to derive, criticize, and extend methods.
2. **Application foundations:** enough modern architecture and workflow knowledge to understand why researchers use particular tools, how they are trained, and where they fail.

Application reading does not need to wait until every deep foundation is complete.

The broader `foundational/card.md` already covers mathematics, probability, stochastic processes, signals, linear systems, numerical methods, PDEs, optimization, and Kalman filtering. This file adds the foundations needed to reason about data assimilation, chaotic prediction, uncertainty, and weather/climate research.

## What I already know

Through EnFF, AD-EnFF, and the covariance-paper study, I already understand:

- recursive Bayesian filtering;
- forecast prior, likelihood, analysis posterior, posterior mean, and posterior particles;
- state space, observation space, nonlinear observation operators, and innovations;
- model error, observation error, unknown observation noise, `Q`, and `R`;
- forecast covariance, observation variance, and state–observation cross-covariance;
- EnKF-style updates, localization, and inflation at a practical level;
- particle flow, ensembles, collapse, spread, coverage, and calibration;
- learned model correction and history-dependent filtering;
- end-to-end training through a differentiable filter.

Therefore, basic Bayes, covariance, innovation, or ensemble explanations are revision rather than current gaps.

---

## Mandatory foundation 1 — Smoothing and trajectory inference

**This is mandatory. Do not skip it.**

Filtering estimates the present from observations available so far. Smoothing revises past states using later observations. This idea appears in tracking, reanalysis, parameter estimation, inverse problems, and offline reconstruction—not only in weather forecasting.

Learn:

- fixed-interval and fixed-lag smoothing;
- the Rauch–Tung–Striebel backward pass;
- why future observations contain information about a past state;
- filtering distributions versus smoothing distributions;
- state smoothing versus parameter or forcing estimation;
- the connection between smoothing and inference over a whole trajectory.

### Completion test

Implement a Kalman filter and RTS smoother for a small linear system. Explain why the smoothed estimate changes earlier states, why its uncertainty normally decreases, and why filtering and smoothing agree at the final time.

---

## Mandatory foundation 2 — Variational DA as an inverse problem

**Variational DA is important enough to learn. It is not automatically better than Kalman or ensemble methods.** It is another computational view of inference: optimize a state or trajectory instead of explicitly carrying its full posterior distribution.

Learn:

- the background and observation terms in a variational cost function;
- `3D-Var`, strong-constraint `4D-Var`, and weak-constraint `4D-Var`;
- the control variable and the role of the background covariance `B`;
- tangent-linear models and adjoints;
- gradient checking and Gauss–Newton intuition;
- the relation among maximum a posteriori estimation, least squares, and variational DA;
- observability, identifiability, and regularization;
- why a good optimum can still represent a poor or non-identifiable scientific model.

The required depth is: derive the objective, understand the gradient machinery, and implement a toy example. Learning every operational 4D-Var or EnVar variant is unnecessary now.

### Completion test

Implement toy 3D-Var and strong-constraint 4D-Var on a linear system or Lorenz-63. Check the gradient against finite differences. Then add model error conceptually and explain what changes in weak-constraint 4D-Var.

---

## Mandatory foundation 3 — Nonlinear dynamics, predictability, and model error

Knowing a filter is not enough when the underlying system is chaotic. Learn how errors evolve before deciding how an algorithm should correct them.

Learn:

- local linearization and finite-amplitude error growth;
- Lyapunov-exponent and unstable-direction intuition;
- finite-time versus asymptotic predictability;
- error saturation and predictability horizons;
- initial-condition error versus model error;
- bias, stochastic model error, structural error, and unresolved scales;
- assimilation frequency versus dynamical error growth;
- why uncertainty can concentrate in a smaller unstable subspace;
- the difference between a model that predicts the state and one that merely fits observations.

### Completion test

Perturb initial conditions in Lorenz-63 or Lorenz-96 and measure error growth. Repeat with a deliberately imperfect model. Explain which error comes from initialization, which comes from the model, and when the two become difficult to separate.

---

## Mandatory foundation 4 — Ensembles, probability forecasts, and verification

An ensemble is useful only if its probabilities mean something. RMSE alone cannot establish that.

Learn:

- calibration, sharpness, resolution, and discrimination;
- spread–skill relationships and rank or PIT histograms;
- proper scoring rules;
- CRPS and energy score for continuous outcomes;
- Brier score for events;
- reliability diagrams and probabilistic skill relative to a reference;
- deterministic accuracy versus distributional quality;
- fair evaluation when ensemble size is limited;
- spatial and multivariate dependence, not only marginal calibration.

### Completion test

Create underdispersed, overdispersed, biased, and calibrated toy ensembles. Calculate RMSE, CRPS or energy score, coverage, spread–skill, and reliability. Explain why no single metric is sufficient.

---

## Mandatory foundation 5 — Time dependence, nonstationarity, and scientific validation

Random train/test splitting is often invalid for dynamical and weather data. Nearby samples share regimes, initial conditions, and temporal information.

Learn:

- autocorrelation and effective sample size;
- blocked, rolling, and hindcast-style evaluation;
- season, regime, location, resolution, and lead-time shifts;
- model upgrades and changing observing systems;
- climatology, persistence, and simple statistical baselines;
- bootstrap or uncertainty estimates that respect temporal dependence;
- leakage through preprocessing, normalization, overlapping windows, or shared trajectories;
- robustness to rare events and out-of-distribution conditions.

### Completion test

Compare a random split with a blocked-time split on one dynamical dataset. Audit every preprocessing step for leakage and explain any loss of apparent performance.

---

## Mandatory foundation 6 — Weather and climate workflow literacy

A full atmospheric-science degree is not required before collaboration. However, enough domain literacy is required to understand what the data and experiments actually mean.

Learn:

- analysis time, initialization time, lead time, and valid time;
- observation, analysis, reanalysis, forecast, hindcast, and truth proxy;
- deterministic/control forecasts and perturbed ensemble members;
- grids, vertical levels, station data, interpolation, and observation operators;
- resolved dynamics versus parameterized sub-grid processes;
- forecast cycling, quality control, bias correction, and delayed observations;
- atmosphere, ocean, land, and sea-ice components and their different time scales;
- coupled versus uncoupled initialization;
- NetCDF/GRIB structure, `xarray`, regridding, masks, and area weighting;
- why reanalysis is an estimate produced by a model-plus-DA system, not exact truth.

### Completion test

Take one small forecast/reanalysis dataset and document every dimension, timestamp, unit, mask, reference field, and evaluation target. Explain exactly what would be available at real forecast time.

---

## Important consolidation, but not the first priority

These topics improve precision and vocabulary after the six mandatory foundations:

1. stochastic versus deterministic/square-root EnKF;
2. ensemble-mean updates versus anomaly transforms;
3. covariance, observation, and domain localization;
4. multiplicative, additive, relaxation, and adaptive inflation;
5. prescribed, ensemble, localized, and hybrid background covariance;
6. particle proposals, weighting, resampling, and high-dimensional degeneracy;
7. hybrid ensemble–variational methods and iterative ensemble smoothers;
8. observation representativeness and correlated observation errors;
9. non-Gaussian variables and transformations;
10. coupled data assimilation and time-scale separation;
11. forecast postprocessing: bias correction, EMOS, quantile methods, and dependence reconstruction.

Hybrid EnVar taxonomy is useful for reading the literature, but it is not more urgent than smoothing, variational fundamentals, predictability, and verification.

---

## Parallel real-world application foundation — spatial and probabilistic ML

PCA, SVD, and attention are already known. The remaining goal is not to become an expert in every architecture. It is to understand the **purpose, mechanism, training signal, output, and failure modes** well enough to read modern application papers and design sensible experiments.

This lane is not merely project-specific. Spatial forecasting, latent state modelling, neural operators, conditional reconstruction and spatiotemporal learning are now part of real-world weather, climate and fluid-modelling research. They should be learned in parallel with classical DA foundations. Only the choice to use one particular architecture in a future project should wait for project evidence.

### 1. Spatial architecture choices

Understand the different biases of:

- **CNNs and U-Nets:** local structure, multiscale encoder–decoder paths, and skip connections;
- **Vision Transformers:** patch/token construction, positional information, global attention, and computational scaling;
- **hybrid CNN–transformers:** local feature extraction combined with longer-range interaction;
- **neural operators:** learning mappings between fields rather than only fixed-size image mappings.

The important question is not “Is ViT better than U-Net?” It is whether the problem needs local detail, multiscale reconstruction, long-range interaction, resolution transfer, or some combination.

### 2. Learned latent representations

Understand:

- deterministic autoencoders and variational autoencoders;
- spatial versus flattened latent variables;
- latent dynamics using GRUs, LSTMs, state-space models, or transformers;
- joint versus separately trained encoder, dynamics, and assimilation components;
- reconstruction loss versus downstream forecast or assimilation loss;
- posterior inference in latent space and decoding an ensemble back to physical space.

For every latent method, ask what information is compressed, what is irreversibly lost, and whether uncertainty remains meaningful after decoding.

### 3. Conditional reconstruction and inpainting

Understand the distinction among:

- deterministic masked reconstruction;
- spatial inpainting conditioned on a mask and observations;
- temporal/video inpainting using previous frames;
- reconstructing a missing field versus performing a Bayesian analysis update;
- generating one plausible completion versus sampling a calibrated conditional distribution.

This is necessary for judging whether an inpainting component is merely filling pixels or genuinely helps route observation information while preserving ensemble uncertainty.

### 4. Generative and score-based methods

Understand at application level:

- diffusion and score models as conditional samplers;
- the forward corruption and reverse denoising processes;
- observation conditioning and posterior sampling;
- why repeated samples can represent uncertainty;
- sampling cost, calibration, mode coverage, and physical-consistency failures;
- how score-based filtering differs from deterministic image generation.

### 5. Spatiotemporal learning

Understand:

- one-frame spatial reconstruction versus sequence modelling;
- recurrent memory, temporal attention, and learned latent dynamics;
- teacher forcing and autoregressive rollout;
- exposure bias, rollout instability, and accumulated model error;
- causal/past-only models versus smoothers that use future frames.

### 6. Learned process and forecast models

Understand:

- supervised field-to-field learning, \(x_t\mapsto x_{t+\Delta t}\);
- one-step, multi-step and different-lead-time training;
- current-state process models versus past-sequence-to-future-sequence models;
- autoregressive rollout and the train–inference distribution shift;
- ViT/Swin spatial models, Fourier/AFNO neural operators and space-time transformers;
- process-model uncertainty, model error and the need for a separate assimilation mechanism.

FourCastNet-style forecasting is primarily supervised dynamics learning, not generic unsupervised learning. Autoencoders, masked reconstruction and other self-supervised objectives may help representation learning, but they are separate from learning the forecast transition itself.

### 7. Scientific evaluation of learned components

Do not judge a spatial model only by image MSE or visual quality. Test:

- local and long-range reconstruction error;
- spectra, gradients, extremes, and conserved or physically meaningful quantities;
- forecast rollout stability;
- ensemble spread, calibration, and posterior skill;
- unseen regimes, resolutions, masks, sensor layouts, and noise levels;
- computational cost against classical and simpler learned baselines.

### Application completion tests

1. Compare PCA with a small autoencoder using both reconstruction error and downstream forecast/assimilation quality.
2. Compare a small U-Net and ViT on masked spatial reconstruction, including unseen mask patterns.
3. Add a GRU or temporal model and test whether history improves genuinely missing information rather than merely smoothing the output.
4. Compare deterministic completion with multiple conditional samples and measure calibration and ensemble spread.

These are application foundations. A particular architecture becomes a research priority only after identifying a concrete failure such as:

- the physical state is too large;
- the ensemble covariance is too noisy;
- long-range dependence is missed;
- a forecast model is too expensive;
- the posterior is strongly non-Gaussian;
- an observation operator or error model is unknown.

Then ask whether learning is the right intervention.

For a latent method, require tests of:

- reconstruction error and retained small-scale structure;
- local and long-range physical relationships;
- observability of the latent variables from sparse measurements;
- conservation or dynamical consistency;
- ensemble spread and posterior calibration after encoding and decoding;
- performance under unseen regimes and sensor patterns;
- comparison with PCA/SVD and non-latent baselines.

A latent space can help with dimension and computation, but it can also erase spatial detail, merge physically different states, and produce misleading uncertainty. Therefore, latent methods belong in the parallel application lane: they should be understood and tested without being assumed to be the final solution.

---

## Research reasoning habits to build

To converse and think well with strong researchers, practice this order:

1. **State the scientific question.** What quantity must be inferred or predicted?
2. **Write the data-generating story.** Dynamics, observations, hidden variables, and noise.
3. **Make an error budget.** Initial condition, model, observation, representation, sampling, and numerical error.
4. **Check identifiability.** Does the available data actually contain the requested information?
5. **Use a baseline ladder.** Climatology or persistence, classical statistical method, established DA method, then learned method.
6. **Choose evaluation before architecture.** Include proper scores, uncertainty, temporal splits, and meaningful references.
7. **Inspect mechanisms and failures.** Ask when and why a method works, not only whether its average score is lower.
8. **Separate evidence from interpretation.** A learned attention map is not automatically covariance, causality, or physical coupling.
9. **Test generalization scientifically.** New years, regimes, locations, lead times, noise levels, or observing networks.
10. **Prefer the smallest justified learned component.** Add complexity only where the baseline exposes a real bottleneck.

This way of working is more durable than learning whichever architecture appears in the latest paper.

---

## Recommended learning order

Run both tracks together.

### Deep-foundation track

1. Formal Kalman smoothing and a small RTS implementation.
2. MAP, 3D-Var, strong/weak 4D-Var, and adjoint gradient checking.
3. Error growth, predictability, and model-error experiments.
4. Ensemble verification and proper scoring rules.
5. Nonstationary, temporally valid experiment design.
6. Weather/reanalysis/forecast workflow and one real-data audit.
7. Consolidate EnKF variants, localization, inflation, particles, and hybrid methods as needed.

### Application-foundation track

This is a real-world application foundation, not a list of optional tricks for one covariance project.

1. Learn U-Net, ViT/Swin and Fourier/FNO/AFNO mechanisms for spatial fields.
2. Learn supervised one-step and multi-step process-model training, autoregressive rollout and forecast error accumulation.
3. Follow the latent route: autoencoder/VAE basics → Latent-EnSF → LD-EnSF.
4. Follow the learned-process route: ViT/Swin and Fourier/operator basics → ViT + EnSF → FourCastNet or Stormer → Earthformer or another genuine space-time model.
5. Follow the reconstruction route: spatial image inpainting → ViT inpainting → causal temporal/video inpainting.
6. Learn conditional diffusion or score-based sampling when distributional reconstruction is required.
7. Evaluate every learned component using physical, temporal and probabilistic tests rather than image MSE alone.

These routes need not be completed strictly one after another; they can run beside the deep-foundation track. The mechanisms are broadly relevant to modern weather and field modelling. Deep specialization, architectural commitment and full implementation can wait for a concrete research problem.

---

## Core resources

### Smoothing

- Särkkä and Svensson, [Bayesian Filtering and Smoothing](https://users.aalto.fi/~ssarkka/) — read the Kalman and RTS smoothing material.

### Variational inference and DA

- Evensen, Vossepoel, and van Leeuwen, [Data Assimilation Fundamentals](https://link.springer.com/book/10.1007/978-3-030-96709-3) — primary textbook; focus on MAP, strong/weak 4D-Var, Kalman/3D-Var, ensemble methods, and localization.
- Ross Bannister, [Elementary 4D-Var](https://www.met.reading.ac.uk/~ross/Documents/Var4d.html) — short bridge into the cost function and gradient.
- ECMWF, [Tangent-Linear and Adjoint Models](https://confluence.ecmwf.int/download/attachments/131371575/Training_course_2019_TLAD.pdf?api=v2) — gradient machinery.
- Carrassi et al., [Data Assimilation in the Geosciences](https://arxiv.org/abs/1709.02798) — overview and map of the field.

### Predictability and ensemble forecasting

- ECMWF, [Predictability and Ensemble Forecasting course](https://www.ecmwf.int/en/learning/training/predictability-and-ensemble-forecasting) — operational bridge from chaotic dynamics to ensembles.
- Vannitsem, [Predictability of Large-Scale Atmospheric Motions](https://arxiv.org/abs/1703.04284) — error growth and predictability limits.

### Probabilistic verification and postprocessing

- ECMWF, [Probabilistic statistical concepts](https://confluence.ecmwf.int/spaces/FUG/pages/673551875/Section%2B12.B%2BStatistical%2BConcepts%2B-%2BProbabilistic%2BData) — reliability, resolution, skill, and interpretation.
- Vannitsem et al., [Statistical Postprocessing for Weather Forecasts](https://journals.ametsoc.org/view/journals/bams/102/3/BAMS-D-19-0308.1.xml) — broad review of calibration and postprocessing.

### Application-foundation reading map

These are mechanism papers. Read them to understand the tool and its assumptions, not as a claim that it should be used in the future project.

- Ronneberger et al., [U-Net](https://arxiv.org/abs/1505.04597) — multiscale encoder–decoder structure and skip connections.
- Dosovitskiy et al., [An Image Is Worth 16×16 Words](https://arxiv.org/abs/2010.11929) — ViT patch tokens, positional embeddings, and global attention.
- He et al., [Masked Autoencoders Are Scalable Vision Learners](https://arxiv.org/abs/2111.06377) — masked spatial representation learning; distinguish pretraining from scientific inpainting.
- Kingma and Welling, [Auto-Encoding Variational Bayes](https://arxiv.org/abs/1312.6114) — probabilistic latent variables and the reconstruction–regularization trade-off.
- Shi et al., [Convolutional LSTM Network](https://arxiv.org/abs/1506.04214) — preserving spatial structure while modelling temporal evolution.
- Li et al., [Fourier Neural Operator](https://arxiv.org/abs/2010.08895) — learning mappings between fields and the motivation for operator learning.
- Song et al., [Score-Based Generative Modeling through Stochastic Differential Equations](https://arxiv.org/abs/2011.13456) — conditional sampling and the score/SDE view behind many diffusion methods.
- Thiry et al., [Online Real-Time Memory-Based Video Inpainting Transformers](https://openaccess.thecvf.com/content/CVPR2024W/NTIRE/html/Thiry_Towards_Online_Real-Time_Memory-based_Video_Inpainting_Transformers_CVPRW_2024_paper.html) — causal temporal memory for inpainting; an application precedent, not a DA solution.

## Current discussed-paper map

This section preserves the concrete papers already discussed. They are **application literature**, not an imposed research direction or a replacement for the two foundation tracks.

The detailed local map remains in the [covariance and sparse-observation index](../../../filtering/kalman/paper/cov-paper-summary/INDEX.md), with the source-checked comparison in [cov-paper-summary.md](../../../filtering/kalman/paper/cov-paper-summary/cov-paper-summary.md).

### Covariance, gain, and small-ensemble correction

- Vishny et al., [High-Dimensional Covariance Estimation From a Small Number of Samples — NICE/PANIC](https://doi.org/10.22541/essoar.171501094.44068137/v1)
- Popov et al., [A Stochastic Covariance Shrinkage Approach in Ensemble Transform Kalman Filtering](https://arxiv.org/abs/2003.00354)
- Wang et al., [Convolutional Neural Network-Based Adaptive Localization for an Ensemble Kalman Filter](https://doi.org/10.1029/2023MS003642)
- Yao et al., [Enabling High-Accuracy Data Assimilation With Limited Ensembles via Machine Learning-Based Covariance Correction](https://arxiv.org/abs/2605.11639)
- Sacco et al., [UnnKF](https://arxiv.org/abs/2305.08874)
- Lu et al., [UNetKF: Machine Learning-Based Prediction of Flow-Dependent Covariance for Ensemble Data Assimilation](https://arxiv.org/abs/2403.12366)

### Sparse observations and moving unobserved variables

- [EnSF-LR](https://arxiv.org/abs/2606.28264)
- [Ensemble Score Filter With Image Inpainting for Partial Observations](https://arxiv.org/abs/2501.12419)
- Hu and van Leeuwen, [Localized Particle Flow Filter](https://arxiv.org/abs/1911.01511)

### Latent filtering and learned process models

- [Latent-EnSF](https://arxiv.org/abs/2409.00127)
- [LD-EnSF](https://arxiv.org/abs/2411.19305)
- [ETKF-Q-L](https://arxiv.org/abs/2104.00430)
- [Double ETKF-VAE](https://arxiv.org/abs/2502.12987)
- [Deep Latent Space Particle Filter](https://arxiv.org/abs/2406.02204)
- [ViT Surrogate With EnSF](https://arxiv.org/abs/2407.12168)
- [FourCastNet](https://arxiv.org/abs/2202.11214)
- [ViT and video-transformer process-model reading list](../../../filtering/kalman/paper/cov-paper-summary/vit-process-model-reading-list.md) — concise route through ViT + EnSF, Stormer, Earthformer, Video Swin, Pangu-Weather and fluid/video precedents.

### Spatial and temporal inpainting

- [EnSF With Image Inpainting](https://arxiv.org/abs/2501.12419) — direct DA bridge.
- Kim et al., [Deep Video Inpainting](https://openaccess.thecvf.com/content_CVPR_2019/html/Kim_Deep_Video_Inpainting_CVPR_2019_paper.html) — recurrent feedback and temporal memory.
- Ren et al., [DLFormer](https://openaccess.thecvf.com/content/CVPR2022/html/Ren_DLFormer_Discrete_Latent_Transformer_for_Video_Inpainting_CVPR_2022_paper.html) — discrete-latent temporal transformer.
- Zhou et al., [ProPainter](https://openaccess.thecvf.com/content/ICCV2023/html/Zhou_ProPainter_Improving_Propagation_and_Transformer_for_Video_Inpainting_ICCV_2023_paper.html) — propagation plus mask-guided transformer.
- Thiry et al., [Online Real-Time Memory-Based Video Inpainting Transformers](https://openaccess.thecvf.com/content/CVPR2024W/NTIRE/html/Thiry_Towards_Online_Real-Time_Memory-based_Video_Inpainting_Transformers_CVPRW_2024_paper.html) — causal, past-only temporal memory.

The dedicated [temporal-inpainting reading pack](../../../filtering/kalman/paper/temporal-inpainting/reading-list.md) contains the reading order and the boundary between natural-video reconstruction and data assimilation.

---

## Reference only when needed

- Bannister, [Review of Operational Variational and Ensemble-Variational DA](https://rmets.onlinelibrary.wiley.com/doi/10.1002/qj.2982) — EnVar taxonomy and operational details.
- Tondeur et al., [Temporal Scale Separation in Coupled Data Assimilation](https://link.springer.com/article/10.1007/s10955-020-02525-z) — coupled multiscale systems.
- [EUPPBench](https://essd.copernicus.org/articles/15/2635/2023/index.html) — realistic postprocessing data structure and benchmarking.
- ECMWF, [Data-Driven Ensemble Forecasting With AIFS](https://www.ecmwf.int/en/newsletter/181/earth-system-science/data-driven-ensemble-forecasting-aifs) — modern learned ensemble forecasting example, not a foundation.

---

## Final judgement

- **Smoothing:** mandatory.
- **Variational DA and adjoints:** mandatory at conceptual, derivation, and toy-implementation level.
- **Predictability and model error:** mandatory.
- **Proper probabilistic verification:** mandatory.
- **Nonstationary scientific validation:** mandatory.
- **Weather workflow literacy:** mandatory for collaboration, without attempting an entire meteorology degree first.
- **Every EnVar/4D-Var variant:** not mandatory now.
- **Latent space, ViT, diffusion, inpainting, and neural operators:** required at application-foundation level; deep specialization remains problem-dependent.

This foundation is broad enough to understand the assumptions, experiments, and arguments behind future DA, weather, climate, signal-processing, or probabilistic-ML work without pre-committing to their methods.
