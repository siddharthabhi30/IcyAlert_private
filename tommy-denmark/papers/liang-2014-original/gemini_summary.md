# Liang (2014): Bivariate LK from Observed Time Series

## Paper question

Given two sampled time series, can we estimate the direction and magnitude of causal information flow using ordinary sample statistics?

## Model and estimator

Liang represents the two series as a realization of a two-dimensional stochastic dynamical system. Under the fitted linear-drift form, maximum-likelihood estimation produces a closed-form expression for information flow from X2 to X1.

The estimator uses:

- Cij: sample covariance between Xi and Xj;
- Ci,dj: sample covariance between Xi and an estimated time derivative of Xj;
- a forward finite difference to construct the derivative series.

The covariance is calculated **across samples in a time series**. It is not covariance across ensemble members at one time.

## Core interpretation

- T2→1 is directional and generally differs from T1→2.
- If the evolution of X1 is independent of X2, T2→1 vanishes under the model assumptions.
- Positive information flow increases the entropy/uncertainty of the receiving variable; negative flow reduces it.
- The unit is information per unit time.

The sign should not be simplified into “good” or “bad.” It describes how the source contributes to the recipient's marginal entropy rate.

## Validation and application

The paper tests the estimator on benchmark time series with known one-way structure and applies it to El Niño and the Indian Ocean Dipole. The application illustrates that asymmetric information flow can distinguish directions that correlation alone cannot.

## Relevance to IcyAlert

This is the base formula for:

- the Vannitsem two-variable benchmark;
- ordinary LK on ERA5 or model time series;
- later rolling-window applications;
- comparison with dynamic Kalman-based LK.

## Assumptions and limitations

- Enough samples are required for stable covariance and derivative estimates.
- The ordinary single estimate treats the selected record as statistically coherent/stationary enough for one result.
- A bivariate link can be altered by omitted mediators or confounders.
- The paper does not specify how to obtain an instantaneous causal rate from current forecast ensembles.

## Source

- DOI: https://doi.org/10.1103/PhysRevE.90.052150
- Local source: `paper_dump.md`
