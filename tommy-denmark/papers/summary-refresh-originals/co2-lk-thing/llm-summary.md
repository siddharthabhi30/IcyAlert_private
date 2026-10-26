# Lu et al. 2022: What the Rolling-Window LK Paper Actually Shows

## Paper

Xunfa Lu, Kai Liu, Xiang San Liang, Kin Keung Lai, and Hairong Cui, “The dynamic causality in sporadic bursts between CO₂ emission allowance prices and clean energy index,” *Environmental Science and Pollution Research* 29, 77724–77736 (2022).

[DOI](https://doi.org/10.1007/s11356-022-21316-5)

## Main question

The paper asks whether causality between two financial markets changes with time:

- European Union emission allowance prices (EUA);
- the S&P Global Clean Energy Index (CEI).

It studies causality both between their **returns** and between their **variances**.

This is not a filtering or data-assimilation paper. It has no process-model ensemble, Kalman gain, \(Q\), \(R\), forecast covariance, or posterior covariance.

## Data

- Daily market observations from 2 January 2013 to 31 December 2020.
- 2,016 matched observations.
- Prices are converted into daily log returns.
- The return series are tested for stationarity, serial correlation, and changing variance.

## What they calculate

### Static LK

They first apply the ordinary bivariate Liang estimator to the entire return record:

\[
T_{2\rightarrow1}
=
\frac{
C_{11}C_{12}C_{2,d1}-C_{12}^{2}C_{1,d1}
}{
C_{11}^{2}C_{22}-C_{11}C_{12}^{2}
}.
\]

Here the covariances are ordinary sample covariances of the two signal time series and the finite-difference tendency series. They are not Kalman error covariances.

### Rolling-window LK

For dynamic causality, they apply exactly the same Liang estimator separately inside consecutive overlapping windows:

1. take 250 trading days;
2. calculate all sample covariances and \(T_{2\rightarrow1}\) inside that window;
3. move the window forward;
4. repeat the calculation;
5. plot the resulting sequence as dynamic causality.

The paper explicitly states that dynamic causality can be obtained by applying the formula “window by window with a rolling window algorithm.” The chosen window contains 250 trading days, approximately one trading year.

This gives a local historical estimate. The value assigned to the current endpoint summarizes the whole preceding window; it is not covariance obtained from one instant.

### Causality in variance

The authors first fit ARMA–GJR–GARCH models to both return series. These models produce time series of conditional variance. They then apply the same rolling-window Liang estimator to the two conditional-variance series.

Therefore the paper has two different rolling-LK calculations:

- LK between market returns;
- LK between GARCH-estimated conditional variances.

### Significance

For each window, the paper calculates a 90% confidence interval. A causal link is declared significant when that interval excludes zero.

## Main results

Across the whole record, CEI significantly influences EUA returns, while the reverse direction is not significant.

The rolling results show little significant causality in returns before early 2020. After March 2020, causality becomes stronger, particularly from CEI to EUA.

For conditional variance, the paper finds several sporadic significant periods before 2020 and stronger bidirectional causality after March 2020. The signs of variance causality can differ from the signs of return causality.

## What this paper establishes for us

This paper gives direct provenance for the following statement:

> Published LK work has estimated time-varying causality by repeatedly applying the ordinary Liang sample-covariance estimator inside a rolling historical window.

This provenance is stronger because X. San Liang is a coauthor.

It also confirms that rolling-window LK uses **signal/time-series covariance**, not posterior filter covariance. In that sense, it remains closer to the statistical object used by the original Liang estimator.

## What this paper does not establish

The paper does not validate the rolling estimator against a synthetic system with known instantaneous information flow.

It does not show that the value from a 250-point historical window equals the physical causality at the window endpoint.

It gives no derivation for an optimal window length. It says that 250 trading days are chosen “without loss of generality,” and the available paper dump contains no window-length sensitivity experiment.

It does not compare rolling-window LK against Hagan's Kalman-based time-varying LK.

It does not compare rolling-window covariance against a live process-model ensemble covariance.

Agreement between the full-record Liang result and the full-record Granger test supports the broad causal direction. It does not validate every change shown in the rolling curve.

Therefore:

> Rolling-window LK is a real published method, but this paper is an application, not a controlled validation of instantaneous dynamic causality.

## Relevance to IcyAlert

Rolling-window LK is now a defensible baseline for our research. We can calculate dynamic signal covariance from recent ERA5 or other physical-variable histories without pretending that posterior EnKF covariance is automatically the same object.

However, the window creates a clear tradeoff:

- short window: more responsive, but noisy and statistically weak;
- long window: more stable, but averages away rapid changes.

This problem is more severe for monthly climate data than for daily financial data because a window containing enough monthly samples may represent many years.

## Experiment this paper motivates

Use a synthetic nonstationary system where the population covariance and true information flow are known at every time. Compare:

1. rolling-window LK at several window lengths;
2. EWMA/soft-window LK;
3. Hagan-style posterior-covariance LK;
4. forecast-ensemble covariance LK;
5. the known instantaneous reference.

That experiment would determine whether rolling-window LK follows real causal changes or merely produces a smooth local average. This paper does not perform that comparison.

## Final verdict

The paper is useful provenance and should be cited when saying that rolling-window LK is an existing approach. It is not evidence that rolling-window covariance is the correct live covariance for IcyAlert. It gives us a legitimate comparator, not the final answer.
