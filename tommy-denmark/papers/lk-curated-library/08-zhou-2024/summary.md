# Summary

## What this paper adds

Zhou et al. extend Hagan's bivariate time-varying method to **multivariate time-varying LK (MtvLK)**. A square-root Kalman filter recursively estimates a covariance matrix at each time, and the multivariate LK formula uses that matrix to quantify conditioned causal links.

They test the method on synthetic systems and apply it to time-varying soil moisture, vapor-pressure deficit, and gross primary productivity interactions. The purpose is to recover seasonal or intraseasonal changes that a single stationary estimate can hide.

## What covariance it uses

The covariance is a sequential statistical estimate produced by the causal estimator. It is not simply covariance across the current members of a forecast ensemble. (Q(t)) and (R(t)) are estimated offline using exponentially weighted and unweighted moving averages, then supplied to the Kalman recursion.

## Why it matters for IcyAlert

This is the closest published method to the requested dynamic, conditioned LK. It provides a concrete alternative to both one long stationary window and instantaneous ensemble covariance.

## Limitation

The state becomes large as variables/grid points are added, and the method inherits sensitivity to (Q/R), conditioning choices, and covariance estimation. The original authors' MtvLK repository could not be verified; however, the 2026 Siddique repository contains related MtvLK code.
