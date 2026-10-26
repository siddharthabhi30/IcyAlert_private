# Pires, Docquier, and Vannitsem (2024): Nonlinear Information Transfer

## Problem

Linear covariance-based LK can miss nonlinear and joint effects. This paper develops a more general method for information transfer in nonlinear stochastic systems without requiring direct numerical integration of the complete multivariate probability density.

## Causal Sensitivity Method

The Causal Sensitivity Method (CSM) estimates conditional expectations of model forcing terms and their derivatives using differentiable nonlinear regression. If equations are unavailable, a nonlinear model can first be fitted from data and CSM then applied to that fitted dynamics.

The framework separates:

- deterministic and stochastic entropy-transfer contributions;
- one-to-one transfers;
- nonlinear synergistic effects of groups of variables;
- state-dependent/local transfer within state space.

The authors compare CSM with a computationally expensive probability-density benchmark and a multivariate linear approximation using a potential model and the stochastic Lorenz system.

## Data/distribution used

The required expectations may be estimated from:

- a long trajectory that samples an ergodic stationary distribution; or
- a time-evolving ensemble that samples a transient distribution at a given time.

This is direct support for studying information transfer in an evolving ensemble distribution. It does not determine whether an EnKF forecast ensemble, posterior analysis ensemble, or their covariance alone gives the correct estimate.

## Main results

CSM is substantially cheaper and less data-demanding than the full probability-density calculation in the tested systems. The Lorenz experiments show that joint nonlinear synergy can be important and cannot generally be reconstructed from isolated pairwise covariance terms.

## Relevance to IcyAlert

- supports Stéphane's stationary-versus-transient distinction;
- motivates the 12-variable nonlinear benchmark;
- warns us not to interpret a linear covariance-only T as the entire causal structure in nonlinear climate dynamics.

## Recommended sequencing

Keep the two-variable linear system as the filter/covariance unit test. Use Pires only after that baseline works, because otherwise nonlinear synergy and filtering errors become mixed together.

## Source

- DOI: https://doi.org/10.1016/j.physd.2023.133988
- Local source: `paper-dump.md`
