# Siddique et al. (2026): Conditioners in Time-Varying LK

## Problem

Bivariate LK can differ from multivariate LK after adding mediators or confounders, which the paper collectively calls conditioners. The study asks where, when, and why these differences become large in land–atmosphere systems.

## Methodology

The paper builds on multivariate time-varying LK. A square-root Kalman framework estimates the evolving covariance/statistical matrix, and the authors compare bivariate information flow with flows conditioned on additional variables.

The main comparison is differential information flow, the magnitude of the difference between bivariate and conditioned estimates. Additional diagnostics include:

- Mediator Dominance Index;
- Moderation Gain;
- Confounding Pressure;
- Convergence Rate.

A controlled synthetic VAR experiment checks behavior under hidden confounding. Real applications analyze soil moisture and vapor-pressure deficit effects on leaf-area index and gross primary productivity, including compound dry-hot regimes.

## Results

Under the tested synthetic setup, the method preserves the expected causal directions, although bivariate and conditioned magnitudes differ. In the land–atmosphere analysis, soil-moisture influence on leaf-area index is comparatively stable, while several GPP and VPD relationships change substantially after conditioning, especially during compound stress.

These results show sensitivity to variable inclusion. They do not prove that every large bivariate/multivariate difference is a uniquely identified mediator or confounder in the real world.

## Covariance source

The time-dependent matrix is estimated sequentially from historical time-series observations using MtvLK. It is not a current physical forecast-ensemble covariance.

## Relevance to IcyAlert

This is important when sea ice, temperature, ocean heat transport, and atmospheric variables are analyzed together. The public repository also provides the most useful currently available code for multivariate/time-varying LK.

## Status and limitation

This is a 2026 preprint. Its code and conclusions should be reproduced and audited before being treated as the project standard.

## Sources

- DOI: https://doi.org/10.5194/egusphere-2026-267
- Code: https://github.com/FareehaSiddique/Conditioners-LKIF
- Local source: `paper-dump.md`
