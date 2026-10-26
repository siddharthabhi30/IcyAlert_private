# Summary

## What this paper establishes

This paper turns the earlier theory into a practical **bivariate time-series estimator**. From two sampled series, it estimates the information flow (T_{2\rightarrow1}) using sample covariances, including covariances with a finite-difference estimate of the time derivative.

Its essential causal property is the nil-causality result: if the evolution of (X_1) is independent of (X_2), the estimated flow from (X_2) to (X_1) vanishes. Direction is therefore built into the dynamics rather than inferred from correlation symmetry.

## What data/covariance it uses

The covariance is calculated **across samples in a time series**. It is not the covariance among physical ensemble members at one instant. The estimator assumes enough samples for stable statistics and, in its ordinary form, treats the relation as stationary over the selected sample.

## Why it matters for IcyAlert

This is the direct source for the ordinary formula already replicated in the two-variable stochastic experiment. It is also the base estimator used by many later climate papers and rolling-window applications.

## Limitation

The bivariate result can be biased when relevant third variables are omitted. It also does not by itself say how to choose a rolling window or estimate a truly instantaneous covariance.
