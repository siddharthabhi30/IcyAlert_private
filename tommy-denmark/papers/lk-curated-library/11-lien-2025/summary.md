# Summary

## What this paper adds

Lien et al. combine LK information flow with linear inverse modeling (LIM). LIM estimates a linear stochastic dynamics model from lagged covariance functions and can represent either white environmental noise or memory-bearing Ornstein-Uhlenbeck colored noise.

This permits self-causality and mutual/asymmetric coupling and separates how fitted dynamics and covariance contribute to the final causal rate. The climate application revisits ENSO-IOD relationships and shows sensitivity to the noise-memory model.

## What data/covariance it uses

The method starts from historical observations, especially zero-lag and lagged covariance matrices, fits the LIM operator/noise model, and then evaluates LK. It is not current-time ensemble covariance and not a physical-state filter.

## Why it matters for IcyAlert

It offers a process-model-from-data route when the physical transition model is unavailable and warns that assuming white noise can change causal interpretation. It may be useful for ERA5 exploratory work or for a learned surrogate baseline.

## Limitation

The linear fitted model can miss nonlinear Arctic processes. Its causality is only as credible as the chosen lag, stationarity/cyclostationarity treatment, and noise model.
