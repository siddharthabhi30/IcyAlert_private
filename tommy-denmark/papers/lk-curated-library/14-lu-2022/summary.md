# Summary

## What this paper does

Lu et al. study changing causality between carbon-emission allowance prices and a clean-energy index. The important methodological contribution for us is explicit: ordinary LK is applied **window by window** using a rolling window algorithm.

They select 250 trading days, calculate the LK statistics inside that window, move the window forward, and repeat. The resulting sequence is called dynamic causality. They analyze causality in both returns and variance and identify intervals where direction and sign change.

## What data/covariance it uses

Every displayed dynamic value is based on covariance across the samples inside the current historical window. It is not a current ensemble covariance and not a Kalman-filter estimator. The window length is chosen for that financial application, not derived as a universal LK constant.

## Why it matters for IcyAlert

This is direct provenance that rolling-window LK is a published dynamic-causality approach. For IcyAlert the analogous window length must be selected and sensitivity-tested against climate timescales and sample sufficiency.

## Limitation

A rolling window smooths abrupt changes and mixes all regimes inside the window. Short windows are noisy; long windows hide change. The paper does not resolve this tradeoff for climate ensembles.
