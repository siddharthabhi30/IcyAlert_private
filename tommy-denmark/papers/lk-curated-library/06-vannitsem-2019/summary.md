# Summary

## What this paper does

This is the paper Stéphane asked us to replicate. It first uses a two-variable linear stochastic system whose directional coupling is known, so the numerical LK estimate can be compared with an analytical reference. It then applies ordinary LK to Antarctic surface mass balance and possible climate drivers in long climate-model runs.

The synthetic system demonstrates the exact distinction we need: (X_2) appears in the evolution equation of (X_1), while the reverse coupling can be set to zero. The expected direction and magnitude therefore come from the process equation rather than from the estimated correlation.

## What data/covariance it uses

For the benchmark and climate application, covariance is estimated **across a sufficiently long trajectory/time series**. There is no physical-state EnKF assimilation in this paper. The analytical linear expression is the reference against which our simulation was checked.

## Why it matters for IcyAlert

It is the correct first unit test for the filtering project. We have already shown that ordinary time-series LK converges to the expected value; the remaining question is what covariance a transient/filtering version should provide.

## Limitation

Success on the stationary two-variable model does not establish that posterior covariance from an EnKF preserves physical-process information flow.

## Local source status

The complete text dump is present. The institutional PDF endpoint returned HTTP 403, so the PDF itself still requires manual download from the DOI or ORFeO record.
