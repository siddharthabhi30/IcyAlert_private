# Summary

## What this paper adds

This paper generalizes the practical LK estimator from two variables to multivariate time series. It estimates the directed flow from one variable to another while accounting for the other included variables, supports normalization and significance testing, and reconstructs directed causal graphs including self-loops.

The multivariate formulation is important because a bivariate link can change after conditioning on mediators or confounders. The paper demonstrates recovery under heavy noise, synchronization, and confounding in synthetic networks.

## What data/covariance it uses

It uses covariance and derivative-covariance statistics calculated **over time-series samples**. The covariance matrix grows with the number of variables, so conditioning becomes statistically and numerically demanding in large spatial systems.

## Why it matters for IcyAlert

This is the main formula for going beyond isolated pairs such as temperature and sea ice. It is also the basis of David Docquier's public multivariate implementation. For IcyAlert, it means variable selection and conditioning are part of the causal definition, not optional preprocessing.

## Limitation

It does not solve the high-dimensional small-sample covariance problem. Applying it blindly to every grid cell and variable can make the covariance matrix ill-conditioned and produce unstable links.
