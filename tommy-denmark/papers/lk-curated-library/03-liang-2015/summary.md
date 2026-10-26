# Summary

## What this paper adds

Raw LK flow has units and its numerical size alone does not tell us whether it is important in the recipient variable's entropy budget. This paper introduces a normalization based on the competing contributions to the entropy change of the receiving variable.

The paper argues that absolute and normalized flow should both be reported. Equal absolute flows in opposite directions can have very different relative importance because each belongs to a different recipient's entropy balance.

## What data/covariance it uses

It builds on the ordinary time-series LK estimator. The normalization is not a replacement covariance estimator and does not solve the transient or ensemble problem.

## Why it matters for IcyAlert

If we compare causal strengths across variables with different units or variability, normalized LK is more interpretable than raw (T) alone. We should nevertheless keep raw (T), uncertainty/significance, and the normalizer visible so normalization does not hide weakly estimated quantities.

## Limitation

Normalization cannot repair a bad covariance estimate, omitted confounders, insufficient samples, or filter-induced covariance collapse.
