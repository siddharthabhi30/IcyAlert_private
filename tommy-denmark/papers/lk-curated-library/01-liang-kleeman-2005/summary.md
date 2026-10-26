# Summary

## What this paper establishes

This is the starting theoretical paper. It defines information transfer between components of a dynamical system when the governing dynamics and probability density are known. The key move is to split the entropy change of one component into its own evolution and the contribution transferred from another component.

The resulting transfer is directional: transfer from (X_2) to (X_1) need not equal transfer from (X_1) to (X_2). The derivation covers continuous flows and discrete maps and is checked on the baker transformation and Hénon map.

## What data/covariance it uses

This paper does **not** present the practical covariance estimator used on observed time series. It assumes access to the dynamics and probability density. It therefore supplies the physical definition, not our final implementation recipe.

## Why it matters for IcyAlert

It is the provenance for calling LK information flow a directional physical quantity rather than another correlation score. Read it for the entropy decomposition and asymmetry, then use Liang (2014/2021) for data estimators.

## Limitation

It does not solve transient estimation, finite ensembles, spatial covariance, observation filtering, or hidden confounding.
