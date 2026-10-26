# Lu et al. (2022): Rolling-Window Dynamic LK

## Paper question

Does directional causality between European carbon-emission allowance prices and a clean-energy index change through time, both for returns and for market variance?

## Data

The authors use matched daily observations of European Union Allowance prices and the S&P Global Clean Energy Index from 2013–2020. Prices are converted to log returns. Conditional-variance series are separately estimated using ARMA–GJR–GARCH models.

## Methodology

The paper first calculates ordinary bivariate LK over the full record. For dynamic causality, it applies the same estimator repeatedly in a rolling window:

1. select 250 trading days;
2. calculate the sample covariance and derivative-covariance terms in that window;
3. calculate directional LK;
4. advance the window and repeat;
5. form confidence intervals for each local estimate.

The procedure is applied separately to return series and GARCH conditional-variance series.

## Covariance source

Each dynamic point comes from covariance **across historical samples inside the active window**. It is not covariance from an ensemble at one time, a Kalman posterior, or a process-model forecast.

## Results

The full-record analysis finds stronger influence from the clean-energy index toward allowance returns. Rolling results show that significant causal episodes are concentrated in particular periods and strengthen around 2020. Variance causality contains additional sporadic and bidirectional intervals.

## What this establishes for IcyAlert

It is direct published provenance for calling repeated window-by-window LK a form of dynamic causality. The method can therefore be used as a baseline on recent ERA5/model histories.

## What it does not establish

- 250 samples is an application choice, not a universal optimum.
- A window estimate is a local historical average, not exact instantaneous causality.
- The paper does not compare rolling LK with Hagan/Zhou Kalman-based LK or ensemble-time LK.
- The paper does not validate its dynamic curve against a synthetic system with known instantaneous T(t).

For monthly climate variables, window sensitivity is particularly important because statistically sufficient windows may span many years.

## Source

- DOI: https://doi.org/10.1007/s11356-022-21316-5
- Local source: `paper-dump.md`
