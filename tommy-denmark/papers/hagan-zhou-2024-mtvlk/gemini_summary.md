# Zhou et al. (2024): Multivariate Time-Varying LK

## Problem

Hagan's TvLK is bivariate. Land–atmosphere interactions contain multiple coupled variables, so a bivariate estimate can change after conditioning on mediators or common drivers. Zhou et al. extend the sequential method to multivariate LK.

## Methodology

The paper combines Liang's multivariate estimator with a Bierman–Thornton square-root Kalman filter. The filter recursively estimates a time-dependent covariance/statistical matrix; its cofactors and derivative-covariance terms enter the multivariate LK expression.

Because Q(t) and R(t) are difficult to know, the paper estimates them offline using exponentially weighted and unweighted moving-average procedures before running the filter iteration.

The method is evaluated on synthetic systems with known changing couplings and then applied to land–atmosphere variables, including soil moisture, vapor-pressure deficit, and gross primary productivity.

## What the results establish

The synthetic experiments show that MtvLK can recover designed time-dependent directional structures under the tested conditions and that conditioning can remove links attributable to indirect paths. The real-data analysis finds time-varying and conditioned relationships that differ from bivariate estimates.

The paper does **not** establish that every recovered link is exact, that multivariate LK always isolates the true causal graph, or that one variable universally has no direct physical effect on another.

## Covariance source

The matrix is learned sequentially from time-series observations by the MtvLK estimator. It is not covariance across members of a numerical forecast ensemble at a single time.

## Relevance to IcyAlert

This is the closest published formulation to conditioned dynamic LK. It is important once we include temperature, sea ice, ocean heat transport, and other drivers together.

## Limitations

- Q/R and moving-average choices influence the result;
- the matrix dimension and conditioning burden grow rapidly;
- finite samples can make cofactors/determinants unstable;
- no verified original Zhou MtvLK repository was found.

Related code is available in the later Siddique `Conditioners-LKIF` repository and should be audited separately.

## Source

- DOI: https://doi.org/10.1175/JCLI-D-23-0207.1
- Local source: `paper_dump.md`
