# Summary

## What this paper does

This paper applies the nonlinear entropy-budget framework to a 12-variable reduced-order atmospheric model. The model contains baroclinic/barotropic instabilities, orography, surface friction, energy imbalance, and nonlinear advection, producing chaotic large-scale atmospheric behavior.

It decomposes the entropy budget and shows that nonlinear advection is often dominant. For some variables, joint nonlinear co-variability (synergy) contributes more than the sum of isolated pairwise effects. It also discusses how these rates can be estimated from time series.

## What data/covariance it uses

The paper analyzes long model trajectories and estimates transfer terms from time-series statistics/regressions. It is not a data-assimilation paper and does not use physical forecast ensembles as the primary estimator.

## Why it matters for IcyAlert

This is the natural second benchmark after the two-variable stochastic model, and it likely matches Stéphane's email reference to a more sophisticated 12-variable model. It tests whether a method preserves a larger causal/entropy structure with nonlinear interactions.

## Limitation

Pairwise linear LK cannot recover all reported synergy. We should first reproduce the paper's provided quantities before testing a learned filter on this model.
