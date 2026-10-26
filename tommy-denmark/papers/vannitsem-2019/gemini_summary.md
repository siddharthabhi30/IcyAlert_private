# Vannitsem, Dalaiden, and Goosse (2019): Benchmark and Antarctic Application

## Why this paper matters

This is the exact first benchmark proposed by Stéphane. It combines a two-variable linear stochastic model with a climate-model application, allowing the LK estimator to be checked where the directional coupling is known.

## Synthetic model methodology

The process model has two stochastic state variables with linear drift and white-noise forcing. Coupling coefficients a12 and a21 determine whether one variable appears in the evolution equation of the other.

For this linear system, the rate from X2 to X1 simplifies to

\[
T_{2\rightarrow1}=a_{12}\frac{C_{12}}{C_{11}}.
\]

This reference uses the process coefficient a12 and the climatological covariance of the stochastic system. In the numerical experiment, the covariance is estimated across a sufficiently long free-running trajectory. No Kalman filter or observation assimilation is used in the paper's benchmark.

The paper varies coupling parameters and compares analytical and estimated information transfer. This is what makes it a clean unit test: the expected direction comes from the model equations.

## Antarctic application

The authors apply LK to long historical runs from MPI-ESM-P and CESM1-CAM5. The target is Antarctic surface mass balance, with possible drivers including surface temperature, sea-ice concentration, and large-scale climate modes.

The analysis shows that many significant correlations do not correspond to significant directional information transfer. Results common to the models include a strong role for surface temperature and sea-ice concentration over the Antarctic Plateau, while dependencies differ in coastal regions.

## Covariance source

Both parts use covariance across time-series samples. This is neither current-time ensemble covariance nor EnKF analysis covariance.

## Relevance to our experiment

We have reproduced the free-running two-variable reference. Applying EnKF and calculating LK from forecast or analysis ensemble covariance is our extension, not something validated in this paper.

Therefore a decrease of T after filtering should be described as a property of that chosen covariance estimator. The paper does not say the filter must preserve the climatological T value.

## Source

- DOI: https://doi.org/10.1029/2019GL084329
- Local source: `paper-dump.md`
