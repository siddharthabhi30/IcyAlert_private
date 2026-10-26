# Summary

## What this paper does

Docquier et al. apply multivariate LK to ocean-atmosphere interactions using sea-surface temperature (SST), SST tendency, and turbulent heat flux (THF). They compare observations and models and produce geographical maps of directed influence.

The main physical result is widespread two-way ocean-atmosphere influence, with stronger ocean control in many tropical regions and stronger atmospheric influence in much of the extratropics. Including SST tendency changes the inferred links, illustrating omitted-variable bias.

## What spatial calculation it uses

The method constructs time series at geographical locations and repeats the LK calculation across the map. A 120-month running mean is also used for decadal variability. This is spatial mapping of local/multivariate time-series LK, not one enormous instantaneous grid-to-grid covariance matrix.

## Why it matters for IcyAlert

It shows how the IcyAlert team already handles gridded climate fields: choose physically meaningful variables, calculate LK over time at locations, map results, and control multiple testing.

## Limitation

The paper warns about hidden variables, linear approximation, sampling frequency, and multiple comparisons. It does not provide an online assimilation covariance estimator.
