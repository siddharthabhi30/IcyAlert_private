# Summary

## What this paper adds

This preprint studies what happens when mediators and confounders, collectively called conditioners, are added to LK. Synthetic tests and land-atmosphere applications compare bivariate with multivariate, time-varying estimates.

The main result is that bivariate and conditioned LK can differ strongly across time and space, particularly during compound dry-hot conditions. The paper introduces diagnostics for mediator dominance, moderation gain, confounding pressure, and convergence.

## What covariance it uses

Its time-varying analysis follows the MtvLK approach: a Kalman filter updates the covariance/statistical state sequentially, and the resulting matrix enters the multivariate LK formula. It does not equate this with a weather-state EnKF posterior.

## Why it matters for IcyAlert

It is the best current implementation resource for conditioned and time-varying LK. The public repository includes MATLAB/Python notebooks, a synthetic toy model, multivariate LK functions, and time-varying Kalman-based code.

## Limitation

It is a 2026 preprint, so the results are not yet a settled standard. Its code should be audited and reproduced rather than treated as a black box.
