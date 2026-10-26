# IcyAlert: Ensemble Filtering and Causality Pipeline

This document serves as the single source of truth for the experimental setup, consolidating multiple iterations of research planning. It leads with the **final, correct pipeline**, followed by a summary of past iterations for context on why certain datasets and models were chosen or deferred.

---

## 1. The Final Pipeline (Ground Truth)

**Goal:** Demonstrate an adaptive ensemble filter that produces reliable time-varying covariance matrices, and feed those covariances into time-varying Liang–Kleeman information flow (TvLK). 

Your primary contribution is **improving the filter itself**, not building a new sea-ice predictor.

### The Exact Execution Flow
```text
C3S ensemble sea-ice forecast
        ↓
OSI SAF sea-ice observation at same valid month
        ↓
Adaptive square-root ensemble filter
        ↓
Corrected forecast + time-varying covariance P(t)
        ↓
Time-varying Liang–Kleeman analysis
```

### Dataset Mapping & Rules
1. **Process Model Forecasts:** Use the **Copernicus Climate Change Service (C3S)**.
   * *Detail:* C3S provides forecast outputs from physical process models (not the runnable model itself). Download individual ensemble-member hindcasts from one chosen system (e.g., ECMWF).
   * *Variables:* sea-ice cover, temperature, SST, winds, radiation.
2. **Sea-Ice Observations:** Use **OSI SAF** (OSI-450-a1, covering 1978–2020).
   * *Detail:* Provides satellite-derived sea-ice concentration observations, including uncertainty estimates.
3. **Atmospheric Observations:** Use **ERA5**.
   * *Detail:* OSI SAF supplies only sea ice; for temperature, wind, and radiation observations, you must use ERA5.
4. **Validation/Reference:** Use **CARRA2** for high-resolution Arctic comparison, and **ORAS5** for ocean/thickness reference.

### Six Strict Implementation Requirements
1. **Select one** C3S model/system version.
2. Use **individual ensemble members** to naturally estimate the prior covariance.
3. Match the exact same **forecast-valid month** between C3S and observations.
4. Aggregate daily OSI SAF data to **monthly** frequency.
5. Regrid OSI SAF to the C3S **1° grid**.
6. Compare the exact same physical quantity (sea-ice concentration/cover or derived sea-ice area).

*Note on closed-loop filtering:* For archived forecast-versus-observation filtering and covariance calculation, this setup is sufficient. Feeding the corrected state back into the original physical model would later require executable model access (or a trained surrogate process emulator).

### Target State Variables (5–7 maximum)
Keep the state vector small but physically meaningful (matching Docquier's LKIF baselines):
1. Sea-ice cover / area
2. Sea-ice thickness / volume
3. Arctic 2m air temperature
4. Sea-surface temperature (SST)
5. Surface downward thermal radiation
6. Surface solar radiation or 10m wind speed

---

## 2. Filter Design & Evaluation

### Filter Progression
1. **Baseline Process Model:** C3S fixed forecast without filtering.
2. **Standard Kalman Filter:** For baseline comparison.
3. **Square-Root Kalman Filter (ETKF / Bierman-Thornton UD):** Natively handles ensembles and stably computes required time-varying covariances $P(t)$.
4. **Adaptive Square-Root Filter (Your Contribution):** Adaptively adjust process covariance $Q_t$ and observation covariance $R_t$ based on the innovation statistics (observation - predicted observation).

### Evaluating the Filter
Do not claim the adaptive filter is better merely because the causal plots "look smoother". Evaluate:
* **Filter Quality:** Normalized innovation squared, innovation whiteness, covariance remaining positive-definite without collapse.
* **Forecast Quality:** RMSE, MAE.
* **Causal Robustness:** Ensure the filter recovers correct causality in synthetic tests, and produces stable time-varying curves (e.g., Temperature → Ice Area) on real data.

---

## 3. Historical Iterations and Context (Condensed)

The project path underwent several iterations before arriving at the C3S seasonal setup above. These are preserved here so we remember *why* certain models and datasets were deferred.

### Iteration A: "Build a new AI forecasting model" (Deferred)
* **Initial Idea:** Use AI models (SICNetseason, IceNet, ClimaX, GenCast) to predict sea ice directly.
* **Why it was dropped:** The core research contribution of this project is the **causally informed adaptive ensemble filter**, not building another climate foundation model. IcyAlert explicitly relies on physical seasonal predictions (C3S).
* **Takeaway:** Filter first, model later. An AI emulator can be introduced later if a surrogate is needed for closed-loop cycling, but it's not the immediate focus.

### Iteration B: "Minimal VAR Process Model with ERA5/CARRA2" (Deferred)
* **Initial Idea:** Use ERA5 or CARRA2 data to fit a small VAR(1) vector autoregression model, and use that as the callable process model for filtering.
* **Why it was dropped:** While mathematically sound for time-varying Liang-Kleeman (as done in the original Hagan et al. paper), CARRA2 is essentially short-term (up to 18 hours), and ERA5 is a reanalysis. IcyAlert is focused on **multi-month seasonal prediction**.
* **Takeaway:** We must use a true seasonal forecast system (C3S). CARRA2 remains useful for high-resolution atmospheric validation, but not as the primary sea-ice process model.

### Iteration C: "Filter over HARMONIE-AROME" (Deferred)
* **Initial Idea:** Use archived HARMONIE-AROME forecasts from CARRA2 as the physical process model and CARRA2 analyses as observations.
* **Why it was dropped:** Again, CARRA2 forecasts are too short (18 hours) and keep sea-ice concentration constant during the forecast. This does not support dynamically forecasting sea-ice evolution over 6 months, which is the core IcyAlert goal.
