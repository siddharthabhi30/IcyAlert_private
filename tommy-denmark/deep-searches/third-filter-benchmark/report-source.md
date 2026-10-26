# Deep search: a ground-truth LK benchmark for the IcyAlert filter

## Exact question

Find a reproducible experiment containing:

1. a process model;
2. observations corresponding to that process;
3. a published Liang-Kleeman (LK) answer for the same underlying system.

The filter is the method under test. Its output trajectory should recover the published causal direction and magnitude.

## Verdict

I did not find a public, ready-to-run climate package that provides all three items and publishes LK calculated from the **filtered output** as the target.

The strongest defensible first benchmark is therefore an observing-system simulation experiment (OSSE) built around the published two-variable Liang/Vannitsem stochastic system. This is not an arbitrary toy model: Liang publishes its analytical causal answer, and Vannitsem et al. use it as the finite-time validation model that Stéphane explicitly asked us to test.

The existing experiment already has most components. The important correction is the evaluation target:

- do not compare the one-cycle EnKF posterior covariance \(P_a(t)\) directly with the stationary value \(0.1111\);
- store the filter's state estimate at every time step, giving a reconstructed time series;
- calculate ordinary LK across that reconstructed time series;
- compare it with LK from the matching hidden-truth trajectory and with the published asymptotic answer.

This tests whether the filter preserves/reconstructs the causal dynamics. It does not incorrectly demand that posterior uncertainty equal climatological process variability.

## Recommended benchmark: two-variable OSSE

### Published process

Liang's validation system is

\[
dX_1=(-X_1+0.5X_2)dt+0.1\,dW_1,
\]

\[
dX_2=-X_2dt+0.1\,dW_2.
\]

Its published stationary answers are

\[
T_{2\rightarrow1}=0.1111,
\qquad
T_{1\rightarrow2}=0.
\]

The exact answer comes from the process equation: \(X_2\) enters the evolution of \(X_1\), while \(X_1\) does not enter the evolution of \(X_2\). Liang also notes that estimates during spin-up can differ from the stationary result.

Primary sources:

- X. San Liang, *Unraveling the cause-effect relation between time series*: https://doi.org/10.1103/PhysRevE.90.052150
- Vannitsem et al., *Testing for Dynamical Dependence: Application to the Surface Mass Balance Over Antarctica*: https://doi.org/10.1029/2019GL084329

### Create observations without changing the causal ground truth

Run one independent process trajectory as hidden truth and generate measurements with

\[
y_k=Hx_k^{\mathrm{truth}}+v_k,
\qquad
v_k\sim\mathcal N(0,R).
\]

Start with \(H=I\), so both variables are observed. Sparse or partial observations should be a later difficulty level.

This gives a clean separation:

- process model: the published two-variable SDE;
- hidden truth: one independently generated trajectory;
- observations: noisy measurements of that truth;
- forecast ensemble: independent model trajectories propagated by the same published process;
- published causal target: \(0.1111\) forward and \(0\) reverse.

### Correct comparison

For each random seed and observation-noise level:

1. discard spin-up;
2. compute ordinary LK on the hidden-truth time series;
3. compute ordinary LK on the noisy observation time series;
4. run an exact Kalman filter, an ordinary EnKF, and the proposed filter;
5. save each method's analysis-mean trajectory through time;
6. compute ordinary LK on each reconstructed trajectory;
7. report state RMSE and LK error.

The main filter score should be

\[
\left|\widehat T^{\mathrm{filter}}_{2\rightarrow1}
-\widehat T^{\mathrm{truth}}_{2\rightarrow1}\right|.
\]

Also report distance from the published asymptotic value and false reverse flow:

\[
\left|\widehat T^{\mathrm{filter}}_{2\rightarrow1}-0.1111\right|,
\qquad
\left|\widehat T^{\mathrm{filter}}_{1\rightarrow2}\right|.
\]

The same-realization truth estimate is the fairest primary target because finite sample length and finite-difference step size cause estimation error. Vannitsem et al. explicitly report a small discretization discrepancy when the process is sampled every 0.1 time unit.

### Minimum experiment matrix

| Variable | First values |
|---|---|
| Methods | exact KF, EnKF, proposed filter |
| Observation operator | \(H=I\) |
| Observation variance | at least three levels: low, medium, high |
| Randomness | at least 10 independent seeds |
| Scores | state RMSE, \(T_{2\to1}\) error, false \(T_{1\to2}\), interval coverage |
| LK input | complete reconstructed trajectory after spin-up, not a single-time posterior ensemble |

## Candidate ranking

| Candidate | Process model | Observations | Published LK truth | Reproducibility | Decision |
|---|---|---|---|---|---|
| Liang 2014 / Vannitsem 2019 two-variable SDE | Exact equations and parameters | Must be generated from hidden truth | Exact scalar: \(0.1111\), reverse \(0\) | Easy; current repository already implements most of it | **Use now** |
| Hagan et al. 2019 TvLK synthetic model | Exact bivariate equations with causal direction switched halfway | Must be generated if testing a DA filter | Prescribed time-varying direction/strength, shown in published figures | Moderate; no verified original public code | **Use second** |
| Vannitsem, Pires & Docquier 2024 12-variable atmosphere model | Twelve ODEs and parameters published in Appendix A | Must be generated | Published nonlinear information-transfer tables | Moderate process implementation, difficult causal estimator | **Use after 2D** |
| Wang et al. 2025 coupled-model twin experiment | Intermediate 64x54 atmosphere-ocean-land model | Synthetic noisy observations are used | LK maps are computed before DA and then frozen | No complete public code/data package located; paper evaluates RMSE, not recovery of post-filter LK | Do not start here |
| Docquier et al. 2022 Arctic SMILE | EC-Earth3 SMHI-LENS model output | No forecast-versus-observation filtering pair in the paper | Published member/time-block LK results | Figure code is public; model data are on ESGF but not bundled with code | Real Arctic application later, not first filter proof |

## Why the alternatives are not the first benchmark

### Hagan 2019 and Zhou 2024

Their Kalman filter is part of a **time-varying LK estimator**: it sequentially estimates the statistical quantities needed by LK from a time series. It is not the weather-state filtering problem being tested here. Hagan's synthetic models are valuable as the second test because their causal direction changes during the run.

Sources:

- Hagan et al. 2019: https://doi.org/10.1175/JCLI-D-18-0881.1
- Zhou et al. 2024: https://doi.org/10.1175/JCLI-D-23-0207.1

### Wang et al. 2025

This is the closest direct LK-plus-data-assimilation paper found. It creates a true coupled model, a parameter-biased forecast model, noisy observations, and runs EAKF twin experiments. However, it computes LK from 9,600 model output times **before** the first DA cycle, assumes those causal relationships stay fixed, and uses them for localization. It does not publish a target LK coefficient that the filtered trajectory must reproduce. Its data statement points to the paper/supplement and author inquiries rather than a runnable release.

Source: https://doi.org/10.3389/fmars.2025.1600634

### Docquier et al. 2022

This is the most IcyAlert-relevant real-data/model-output precedent. It calculates LK from EC-Earth3 SMHI-LENS in two ways: separately across each member's time history, and by pooling 50 ensemble members within five-year blocks. The code is public and the model output is identified on ESGF. But it does not provide a hidden truth, noisy observations, and forecast ensemble for testing a filter.

Sources:

- Paper: https://doi.org/10.1029/2021GL095892
- Figure code: https://doi.org/10.5281/zenodo.6375655
- Model archive: https://esgf-node.llnl.gov/search/cmip6/

## Exact next implementation

Reuse the current two-variable process and observation models, but add one new experiment whose outputs are time series:

- `truth[t, 2]`
- `observation[t, 2]`
- `kf_analysis_mean[t, 2]`
- `enkf_analysis_mean[t, 2]`
- `proposed_analysis_mean[t, 2]`

Run the audited RMI ordinary-LK implementation on every complete trajectory. Keep the current single-cycle forecast/posterior covariance plot as a separate diagnostic; it is not the pass/fail causal score.

Verified local LK baseline:

`/home/abhi/code/defence/defence/learning/consolidated/research/tommy-denmark/papers/lk-curated-library/code/climdyn-lkif/function_liang.py`

Current experiment to extend:

`/home/abhi/code/defence/IcyAlert/`

## Search conclusion

No further climate-data download is needed for the first defensible filter test. The published process itself generates the hidden truth, and the declared observation model generates measurements. This is stronger for method validation than starting with ERA5 or satellite data, because real data do not provide an exact causal ground truth.

After the method passes this test, move to Hagan's causal-switch model, then the 12-variable atmospheric model, and only then to the Docquier Arctic/SMILE application.
