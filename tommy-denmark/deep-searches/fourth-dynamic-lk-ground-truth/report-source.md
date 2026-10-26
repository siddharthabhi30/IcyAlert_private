# Dynamic Liang–Kleeman ground truth at time \(t\)

## Question

Is there a dataset or published benchmark for which the true Liang–Kleeman information flow \(T_{2\rightarrow1}(t)\) is known separately at every time \(t\), so that a dynamic covariance/filter method can be checked point by point?

## Verdict

- **Synthetic systems: yes.** A rigorous per-time reference can be calculated when the stochastic process and its probability distribution are known.
- **Real Arctic products such as ERA5, C3S seasonal forecasts, and OSI SAF: no.** They provide states, forecasts, observations, members, or uncertainty estimates, but no true causal coefficient \(T_{2\rightarrow1}(t)\).
- Hagan et al. (2019) and Zhou et al. (2024) estimate LK at each time using a Kalman recursion and validate the estimated curve against a prescribed time-varying causal structure. Their estimated current-time covariance is not an independent ground-truth covariance.

## The cleanest exact benchmark

Liang (2014) gives the linear stochastic system

\[
dX_1=(-X_1+0.5X_2)dt+0.1dW_1,
\]

\[
dX_2=-X_2dt+0.1dW_2.
\]

For a linear Gaussian system, the population covariance \(\Sigma(t)\) evolves according to

\[
\frac{d\Sigma(t)}{dt}
=A\Sigma(t)+\Sigma(t)A^\mathsf{T}+BB^\mathsf{T}.
\]

The exact information flow at that same time is

\[
T_{2\rightarrow1}^{\mathrm{true}}(t)
=a_{12}\frac{\Sigma_{12}(t)}{\Sigma_{11}(t)}.
\]

Liang initializes \(\Sigma_{11}(0)=\Sigma_{22}(0)=0.1\) and \(\Sigma_{12}(0)=0\). Therefore the exact curve begins at zero during spin-up and approaches \(0.1111\). The paper explicitly calls Figure 1 the accurate time evolution and says the value can differ during spin-up. This is the required published, dynamic, point-by-point target. It is generated from equations rather than downloaded as a table.

Primary source: [Liang, “Unraveling the cause–effect relation between time series”](https://arxiv.org/abs/1403.6496), especially Eqs. (3)–(10) and Fig. 1.

## What “covariance at the current time” means here

At one time \(t\), one state vector is not enough to calculate covariance. We need a distribution at that time. There are two equivalent reference constructions for this synthetic linear system:

1. Solve the covariance differential equation above to obtain exact \(\Sigma(t)\).
2. Run a very large number of independent realizations from the same initial distribution and calculate covariance across those realizations at time \(t\). As the ensemble size grows, this Monte Carlo covariance approaches \(\Sigma(t)\).

This is different from calculating covariance across a rolling time window. A rolling window uses neighbouring times as samples and estimates a locally averaged quantity. It is also different from an analysis covariance after assimilating observations: that is the conditional uncertainty left after observing data, not automatically the uncontrolled process population covariance.

## Published dynamic-LK estimators

### Hagan et al. (2019)

Hagan et al. use a square-root Kalman filter to estimate the covariance/statistical quantities needed by LK at every time step. Their first synthetic VAR model switches the prescribed direction of coupling halfway through 1,000 samples. It is a useful benchmark for detecting the correct direction and switch time.

Important limitation: the prescribed coupling coefficient in the generator is known, but it should not be silently treated as an independently derived exact LK value at every time. The paper validates agreement of causal direction, timing, frequency, and approximate strength.

Primary source: [Hagan et al., “A Time-Varying Causality Formalism…”](https://journals.ametsoc.org/view/journals/clim/32/21/jcli-d-18-0881.1.xml), especially Eq. (17) and Fig. 1.

### Zhou et al. (2024)

Zhou et al. extend the method to multivariate time-varying LK. Their synthetic systems prescribe causal links that increase, decrease, appear, or disappear. Results are averaged over 1,000 realizations and checked against that predetermined structure. This is a stronger multivariate structural benchmark, but again the published estimator output is not a separate exact causal label supplied with every sample.

Primary source: [Zhou et al., “Estimating Time-Dependent Structures in a Multivariate Causality…”](https://doi.org/10.1175/JCLI-D-23-0207.1), especially synthetic models in Eqs. (17)–(19).

### Pires, Docquier, and Vannitsem (2024)

Pires et al. explicitly allow a **time-evolving transient ensemble**: averages can be taken across many model realizations at a particular time instead of across one long stationary time series. When the full probability density is known, their expensive analytical/numerical integration method is treated as the benchmark; cheaper causal-sensitivity estimates are compared with it. They also state that this construction can be applied to forecast ensembles, where entropy represents forecast-error uncertainty and ensemble spread.

This supplies direct methodological provenance for current-time ensemble causality. It does not supply a ready Arctic dataset with known true \(T(t)\).

Primary source: [Pires, Docquier, and Vannitsem, “A general theory to estimate Information transfer in nonlinear systems”](https://arxiv.org/abs/2307.10623), particularly Sections 4.1–4.2, Section 7, and Appendix B.

## Real IcyAlert data

- [ERA5](https://cds.climate.copernicus.eu/datasets/reanalysis-era5-single-levels?tab=overview) is a reanalysis that combines a model and observations through data assimilation.
- [C3S seasonal data](https://cds.climate.copernicus.eu/datasets/seasonal-original-single-levels?tab=documentation) contains real-time forecasts and retrospective forecasts from multiple seasonal prediction systems.
- [OSI SAF sea-ice concentration](https://osi-saf.eumetsat.int/products/osi-450-a) is a satellite-derived climate data record with per-grid uncertainty information.

These products can be used to estimate LK and to test forecast or state-estimation accuracy. None provides a label saying the true physical \(T_{2\rightarrow1}(t)\) at each time. On real data, agreement between methods is validation evidence, not causal ground truth.

## Recommended experiment sequence

1. **Exact transient benchmark:** reproduce Liang's Figure 1 from the covariance ODE. This gives \(T^{\mathrm{true}}(t)\) at every time.
2. Generate a large “truth ensemble” from the SDE and verify that its current-time sample covariance approaches exact \(\Sigma(t)\).
3. Add a known observation model \(Y_t=HX_t+V_t\), run the proposed filter with a much smaller ensemble, and compare its chosen causal estimate against \(T^{\mathrm{true}}(t)\).
4. Use Hagan/Zhou synthetic changing-coupling models to test whether the method detects causal changes, while reporting that their truth is primarily the prescribed graph/coupling schedule.
5. Only then use ERA5/C3S/OSI SAF. Report those results as real-data estimates, not as recovery of a known true LK curve.

## Critical evaluation distinction

If the output being evaluated is the filter's covariance itself, an ordinary linear Kalman filter supplies the exact posterior covariance for the linear-Gaussian test. If the output being evaluated is physical-process LK, the reference is the process distribution \(\Sigma(t)\) above. Those are different targets, and low observation noise legitimately makes posterior covariance shrink. A test must state which target it is scoring.
