# Summary

## What this paper adds

Pires, Docquier, and Vannitsem develop a general nonlinear information-transfer theory and a practical Causal Sensitivity Method (CSM). It estimates conditional expectations of nonlinear forcing terms and their derivatives instead of numerically integrating a full multivariate probability density.

The method decomposes information transfer into deterministic and stochastic parts and further separates single-variable effects from genuinely nonlinear synergy among groups of variables. It is tested on a potential model and the Lorenz system against a more expensive probability-density benchmark.

## What data/covariance it accepts

The paper explicitly allows two sampling regimes: a long trajectory sampling an ergodic/stationary density, or a **time-evolving transient ensemble** sampling the distribution at a particular time. This is important provenance that ensemble-time distributions are theoretically meaningful, but it does not state that EnKF posterior covariance alone is sufficient.

## Why it matters for IcyAlert

It provides the bridge beyond linear covariance-only LK when Arctic interactions are nonlinear or synergistic. It also supports Stéphane's distinction between climatological long-time information transfer and transient evolving-ensemble transfer.

## Limitation

CSM requires fitting or evaluating nonlinear conditional relationships. That is a later step; it should not replace the linear benchmark before our covariance estimator is understood.
