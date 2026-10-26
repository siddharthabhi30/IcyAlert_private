# Wang et al. (2020): Multiscale LK from Solar Irradiance to Ocean Heat Content

## Paper question

Does total solar irradiance (TSI) directionally influence ocean heat-content anomaly (OHCA), and does that influence vary by location, historical period, and timescale?

## Data

The study uses reconstructed TSI and NODC ocean heat-content anomaly data over 1955–2017. The ocean product includes seasonal time series and gridded upper-ocean heat content, allowing global, basin, grid, and empirical-orthogonal-function analyses.

## Methodology

The base calculation is ordinary bivariate LK from sample covariance and derivative-covariance terms. The authors apply it to:

- global and basin-mean OHCA time series;
- gridded OHCA fields, repeating the time-series calculation at locations;
- leading spatial-mode coefficients.

To examine changing timescales, they repeat LK within sliding windows and across multiple window lengths. The output is therefore indexed by historical position and window length. Statistical confidence is evaluated for the local estimates.

## Covariance source

All LK covariance is calculated across the time samples inside the selected full record or window. A gridded causal map means repeating this time-series calculation at grid points; it is not a full instantaneous grid-to-grid covariance matrix.

## Results

The paper reports significant TSI-to-OHCA influence whose location and magnitude depend on timescale. Basin and spatial-mode results suggest that the response is geographically heterogeneous rather than a uniform global-ocean signal.

## Relevance to IcyAlert

- published example of time-varying/multiscale LK;
- example of producing a spatial map from local time-series calculations;
- warning that causal conclusions can change with temporal scale.

## Limitations

- window length controls both temporal resolution and statistical stability;
- mapped local LK is not cross-grid causality;
- multiscale patterns require careful significance/multiple-testing treatment;
- it is not a filtering or data-assimilation paper.

## Source

- DOI: https://doi.org/10.1038/s41598-020-74331-2
- Local source: `paper-dump.md`
