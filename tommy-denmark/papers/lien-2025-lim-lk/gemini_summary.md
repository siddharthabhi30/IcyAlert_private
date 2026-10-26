# Lien et al. (2025): LK with Linear Inverse Modeling

## Problem

Ordinary linear LK is usually presented with white stochastic forcing. Real environmental forcing can retain memory, so the paper asks how inferred causality changes when the noise is colored and when the dynamics must be learned from observations.

## Methodology

The authors combine LK information flow with linear inverse modeling (LIM). Historical zero-lag and lagged covariance functions are used to estimate a linear stochastic transition operator.

Two noise models are compared:

- Gaussian white noise without temporal memory;
- Ornstein–Uhlenbeck colored noise with memory.

Once the LIM operator and covariance/noise terms are estimated, LK rates are calculated. The formulation permits self-causality and mutual asymmetric coupling and helps separate contributions associated with the fitted dynamics from contributions associated with state correlation.

## Application and results

The method is applied to ENSO and the Indian Ocean Dipole. Both noise assumptions produce mutual but asymmetric links, while the colored-noise model reveals spatial structure in noise memory and changes the quantitative decomposition of information flow.

The paper's point is not that colored noise is always superior. It shows that the assumed environmental-noise structure can materially affect causal interpretation.

## Covariance source

This is a **historical time-series and lagged-covariance** method. It does not use current-time forecast ensembles or an assimilation posterior.

## Relevance to IcyAlert

LIM is a possible data-driven process-model baseline when a physical transition model is unavailable. It is especially relevant if Arctic variables display persistent forcing that cannot be treated as white noise.

## Limitations

- fitted linear dynamics can miss nonlinear feedbacks;
- results depend on sampling interval, lag choice, and stationarity/cyclostationarity assumptions;
- it does not solve sparse satellite assimilation or high-dimensional ensemble covariance.

## Source

- arXiv: https://arxiv.org/abs/2409.06797
- Local full source: `paper_dump_raw.md`
