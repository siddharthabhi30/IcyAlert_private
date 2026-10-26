# Summary

## What this paper adds

Hagan et al. develop time-varying bivariate LK (TvLK) for nonstationary relationships. Instead of computing one covariance over an entire stationary time series, a square-root Kalman filter recursively estimates the statistics needed by the LK formula at each time step.

The square-root/Bierman-Thornton form is used for numerical stability and positive-definite covariance handling. The paper validates the method on synthetic time-varying systems and applies it to soil-moisture/air-temperature coupling; wavelets are used afterward to inspect timescales.

## What the Kalman filter is doing

It is **not** an EnKF assimilating weather-model state ensembles. The filter is the estimator inside the causal method: it tracks the time-varying covariance/statistical state from a sequential time series. The process and measurement noise covariances (Q(t)) and (R(t)) are computed offline and strongly affect the result.

## Why it matters for IcyAlert

This is direct provenance that live/time-dependent LK can be estimated without a long rolling window. It also exposes our unresolved problem: selecting or learning (Q(t)) and (R(t)) reliably.

## Limitation

The method's accuracy is sensitive to the offline (Q/R) construction. It does not prove that the analysis covariance of a physical-state EnKF should be inserted into LK.
