# Summary

## What this paper does

Wang et al. use LK to examine causal influence from total solar irradiance to global and regional ocean heat-content anomaly. They combine ordinary information flow with multiscale decomposition to show that causal influence can appear differently at interannual and decadal scales.

The analysis includes global time series, spatial maps over gridded ocean heat content, and empirical orthogonal function coefficients. A spatial map here means repeating a time-series LK calculation for locations or modes, not estimating full grid-to-grid covariance at one instant.

## What data/covariance it uses

Covariance is calculated across historical time-series samples. The multiscale result comes from decomposing/filtering timescales and recomputing the causal measure, not from an ensemble Kalman covariance.

## Why it matters for IcyAlert

It is evidence that LK can be mapped spatially and separated by timescale. This may matter when air-temperature/sea-ice influence differs between seasonal, interannual, and decadal scales.

## Limitation

Repeated local calculations do not solve cross-grid covariance or finite-ensemble localization. Statistical confidence and scale-selection must be checked carefully.
