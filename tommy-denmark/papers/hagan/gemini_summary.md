# Hagan et al. (2019): Time-Varying Bivariate LK

## Problem

Ordinary LK calculates sample covariance over a record and therefore gives one approximately stationary causal estimate. Hagan et al. seek a causal estimate that changes through time without requiring one long stationary record for every estimate.

## Methodology

The paper uses a Kalman filter to recursively estimate the statistical quantities/covariances needed by the bivariate LK formula. A Bierman–Thornton square-root implementation propagates a factorized covariance representation to improve numerical stability and positive-definiteness.

The process and measurement noise covariances Q(t) and R(t) are calculated offline and then supplied to the recursion. The paper explicitly states that accurate results depend strongly on these estimates.

At each step:

1. predict the filter's statistical state and error covariance;
2. update them with the current measurement;
3. obtain the required covariance terms;
4. evaluate time-varying LK;
5. optionally apply a wavelet transform to the resulting causal series to study timescales.

## Critical distinction

This Kalman filter is part of the **causality estimator** operating on a sequential historical time series. It is not an EnKF assimilating satellite observations into a numerical weather-state ensemble. Its covariance should not be silently equated with forecast or analysis covariance from our DA experiment.

The wavelet transform decomposes the estimated causal curve by time and frequency. It does not, by itself, remove hidden confounders.

## Validation and application

The paper tests whether TvLK follows changing causal coefficients in synthetic systems and applies it to soil-moisture/air-temperature coupling using ERA-Interim data. The results demonstrate time-local and scale-dependent coupling patterns that a single stationary estimate would hide.

## Relevance to IcyAlert

TvLK is a published alternative to rolling-window LK and current-time ensemble covariance. It makes Q/R estimation a central design problem and gives us a method to reproduce before inventing a new covariance estimator.

## Limitations

- sensitivity to offline Q/R estimates;
- bivariate formulation can omit relevant conditioners;
- no proof that its covariance equals physical-state uncertainty;
- no direct comparison with rolling-window or ensemble-plus-time LK.

## Source

- DOI: https://doi.org/10.1175/JCLI-D-18-0881.1
- Local source: `paper_dump.md`
