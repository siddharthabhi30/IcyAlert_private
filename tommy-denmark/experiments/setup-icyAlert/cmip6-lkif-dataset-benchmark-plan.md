# IcyAlert CMIP6-to-LKIF dataset and benchmark plan

Updated: 2026-08-03

## Purpose

Create a small, independently verifiable experiment that starts from a real process-based climate-model ensemble and ends with reproducible Liang-Kleeman information flow (LKIF) values for Arctic summer sea-ice drivers.

This document separates:

- **confirmed evidence** from IcyAlert material and published work;
- **our recommended first experiment**;
- **open decisions** that still require confirmation from the IcyAlert team.

## 1. Evidence-backed dataset family

The most relevant published baseline is Docquier et al. (2024), *Drivers of summer Arctic sea-ice extent at interannual time scale in CMIP6 large ensembles revealed by information flow*.

Why this is probably the intended starting point:

1. David Docquier is part of IcyAlert and presented this exact topic at the kick-off meeting.
2. The paper uses LKIF, IcyAlert's stated primary causal method.
3. The paper's variables match the work-package diagram: summer sea-ice extent, winter sea-ice volume, 2 m air temperature, and ocean heat transport.
4. It uses CMIP6 SMILEs at approximately the resolution described by IcyAlert.

Primary source: https://doi.org/10.1038/s41598-024-76056-y

## 2. Ensembles used by the published baseline

| Model/source ID | Members used | Atmosphere | Ocean and sea ice | Nominal ocean resolution |
|---|---:|---|---|---:|
| EC-Earth3 | 50 | IFS cy36r4 | NEMO3.6-LIM3 | 1 degree |
| CESM2 | 50 | CAM6 | POP2-CICE5 | 1 degree |
| ACCESS-ESM1.5 | 40 | UM | MOM5-CICE4 | 1 degree |
| CanESM5 | 49 | CanAM5 | NEMO3.4-LIM2 | 1 degree |
| MPI-ESM1.2-LR | 30 | ECHAM6 | MPIOM | 1.5 degrees |

Common experiment contract:

| Field | Value |
|---|---|
| Frequency | Monthly means |
| Historical segment | `historical`, 1970-2014 |
| Future segment | `ssp370`, 2015-2060 |
| Complete analysis period | 1970-2060 |
| Ensemble property | Same external forcing, different initial conditions |
| Main target | September Arctic sea-ice extent |
| Main drivers | March sea-ice volume, annual Arctic T2m, annual Atlantic OHT, annual Pacific OHT |

Data locations stated by the paper:

- ESGF/CEDA for EC-Earth3, ACCESS-ESM1.5, CanESM5, and MPI-ESM1.2-LR: https://esgf-index1.ceda.ac.uk/search/cmip6-ceda/
- NCAR Climate Data Gateway for CESM2-LE: https://www.earthsystemgrid.org/dataset/ucar.cgd.cesm2le.output.html

## 3. Recommended first downloadable subset

Start with **EC-Earth3**, one member, 1970-2060, monthly data. After all derived indices and tests pass, expand to all 50 members and then the other four models.

This is an engineering recommendation, not a documented final IcyAlert selection.

Why EC-Earth3 first:

- it appears in the IcyAlert WP3 diagram;
- the team's earlier Arctic LKIF study was based on EC-Earth3;
- its 50-member ensemble supports uncertainty statistics;
- its coupled atmosphere-ocean-sea-ice output is already the result of a process model.

## 4. Raw fields required

The paper retrieves the following monthly model fields. The candidate CMIP6 names below must be checked against each model's ESGF catalogue before download.

| Physical field | Candidate CMIP6 variable | Why needed |
|---|---|---|
| Sea-ice concentration | `siconc` | September sea-ice extent |
| Equivalent/actual sea-ice thickness | `sithick` or model-provided equivalent thickness/volume field | March sea-ice volume |
| Grid-cell area | `areacello` | Extent and volume integration |
| Near-surface air temperature | `tas` | Arctic T2m driver |
| Ocean potential temperature | `thetao` | Ocean heat transport |
| Zonal ocean velocity | `uo` | Ocean heat transport at gateways |
| Meridional ocean velocity | `vo` | Ocean heat transport at gateways |
| Surface downward shortwave | `rsds` | Optional radiation-driver experiment |
| Surface upward shortwave | `rsus` | Optional net-shortwave calculation |
| Surface downward longwave | `rlds` | Optional radiation-driver experiment |

Do not assume that every model uses identical table names, grids, thickness definitions, or file versions. Save the ESGF dataset ID, version, grid label, member ID, checksum, units, and calendar in a manifest.

## 5. Derived annual indices

Reproduce the paper's definitions exactly before changing them.

### Target

**September summer sea-ice extent (SSIE)**

- select ocean cells north of 40 degrees N;
- mark a cell ice-covered when concentration is at least 15%;
- sum the full area of marked cells;
- report in million square kilometres.

### Preconditions and drivers

**March winter sea-ice volume (WSIV)**

- convert concentration/thickness into equivalent ice volume consistently with the model field definition;
- multiply equivalent thickness by ocean-cell area;
- sum north of 40 degrees N;
- report in thousand cubic kilometres or another documented unit.

**Annual Arctic 2 m air temperature (T2m)**

- annual mean;
- area-weighted mean north of 70 degrees N;
- retain a documented Kelvin or Celsius convention.

**Annual Atlantic ocean heat transport**

- Barents Sea Opening + Fram Strait + Davis Strait;
- integrate temperature times the velocity normal to each gateway over depth and section;
- document constants, reference temperature, masks, sign convention, and units.

**Annual Pacific ocean heat transport**

- compute through Bering Strait using the same convention.

Ocean heat transport is the most technically expensive derived variable. Validate the first three indices before adding it.

## 6. Data-quality tests

Every model/member must pass these checks before LKIF:

| Test | Expected condition |
|---|---|
| Time continuity | Every month from January 1970 through December 2060 exists after stitching experiments |
| Scenario boundary | `historical` ends in 2014 and `ssp370` begins in 2015 without overlap or gap |
| Member continuity | The same realization/initialization/physics/forcing labels are used across the boundary |
| Units | Converted once and recorded in metadata |
| Sea-ice concentration | Physically within 0-1 or 0-100 according to source units |
| Area | Positive, finite, compatible with the sea-ice grid |
| Extent range | Between 0 and the Arctic ocean area |
| Volume | Non-negative and finite |
| Temperature | Plausible Arctic annual means |
| OHT | Gateway direction and sign checked visually and numerically |
| Missing values | No unhandled land/fill values enter regional sums |
| Reproducibility | Derived index can be recalculated from the saved manifest and configuration |

## 7. LKIF reproduction benchmark

### Published full-period procedure

For each model separately:

1. Derive one annual value per variable and member for 1970-2060: 91 values per member.
2. At each year, calculate the model ensemble mean for each variable.
3. Remove that ensemble mean from every member to reduce the externally forced trend.
4. Compute multivariate LKIF separately for each member.
5. Use 1,000 bootstrap realizations and a 5% significance threshold.
6. Aggregate LKIF across members and combine member-level significance using Fisher's method.
7. Report normalized absolute information flow and ordinary correlations side by side.

### Expected scientific regression results

The implementation should broadly reproduce:

| Driver to September extent | Published result |
|---|---|
| Annual Arctic T2m | Significant in all five models; strongest main driver |
| March sea-ice volume | Significant in three models |
| Atlantic OHT | Significant in two models, including EC-Earth3 and CanESM5 |
| Pacific OHT | Not significant in the five models |

Exact numerical tolerance must account for dataset versions, masks, grids, gateway definitions, detrending, derivative implementation, and bootstrap randomness. A mismatch should first trigger a provenance and preprocessing audit, not an immediate conclusion that LKIF is wrong.

Reference LKIF code cited in the paper: https://github.com/Climdyn/Liang_Index_climdyn

## 8. Minimal benchmark ladder

| Stage | Data | Result required before advancing |
|---|---|---|
| A | Synthetic linear system | Correct causal direction and no false reverse link |
| B | One EC-Earth3 member, SSIE/WSIV/T2m | Complete derived time series and finite LKIF |
| C | All EC-Earth3 members | Ensemble LKIF, confidence intervals, and comparison with the paper |
| D | EC-Earth3 with Atlantic/Pacific OHT | Full four-driver causal reproduction |
| E | All five SMILEs | Multi-model reproduction table |
| F | Reference observations/reanalyses | Descriptive comparison, with short-record limitation stated |
| G | Initialized forecast ensemble | Separate EnKF experiment |

## 9. Observation/reanalysis references used by the paper

| Quantity | Product | Period used in paper |
|---|---|---:|
| Sea-ice extent | OSI SAF OSI-420 v2.2 | 1979-2023 |
| Sea-ice volume | PIOMAS | 1979-2023 |
| Near-surface temperature | HadCRUT5 | 1970-2023 |
| Ocean temperature/velocity and OHT | ORAS5 | 1979-2018 |
| Surface radiation | CERES EBAF Ed4 | 2001-2023 |

These products verify the published paper. IcyAlert may later approve different products.

## 10. EnKF/Kalman track: keep separate from the first LKIF reproduction

CMIP6 SMILE members are process-model climate trajectories, but their internal weather sequences are not synchronized with a particular observed year. They should not automatically be treated as operational forecast particles around the observed state.

A scientifically defensible EnKF experiment needs:

1. an initialized forecast/hindcast ensemble, likely from C3S or a dedicated EC-Earth setup;
2. a defined state vector;
3. observation products and uncertainties;
4. an observation operator mapping model state to measurements;
5. an assimilation cadence;
6. localization/inflation choices and ensemble-size diagnostics;
7. forecast-only, observation-only, and assimilated baselines.

After that, calculate LKIF on consistently defined forecast and analysis indices and test whether assimilation changes causal estimates. This is a new experiment; it is not part of the published Docquier LKIF baseline.

### Two valid filtering testbeds

The lack of synchronization with real observations does **not** prevent CMIP6 from being used for filter development. It only determines what can be treated as truth.

#### A. EC-Earth3 synthetic online-filter benchmark

1. Train a state-transition emulator on multiple EC-Earth3 members.
2. Reserve one or more complete members as unseen truth trajectories.
3. Generate sparse/noisy observations with a documented observation operator.
4. Propagate forecasts with the emulator.
5. Apply EnKF, an improved filter, or differentiable 4D-Var.
6. Propagate the updated state again and repeat online.
7. Evaluate against the complete held-out state.

This is a valid observing-system simulation experiment. It supports controlled noise, missingness, observation-frequency, ensemble-size, and state-dimension experiments.

#### B. C3S real seasonal benchmark

C3S initialized seasonal hindcasts allow forecast ensembles to be aligned with real historical observations and tested across different seasonal initialization dates.

Archived C3S output directly supports forecast correction and verification. Complete closed-loop cycling—injecting the filtered state back into the originating forecast model—additionally requires access to that model's executable/restarts or a compatible emulator.

Use C3S to answer whether filtering improves real seasonal forecasts. Use EC-Earth3 plus an emulator to answer whether the online algorithm works under controlled, fully observed truth.

### 4D-Var option

A differentiable EC-Earth3-trained emulator makes gradient-based 4D-Var feasible through automatic differentiation. Classical 4D-Var can instead use tangent-linear and adjoint models. EnKF requires neither. Compare them only with identical truth trajectories, observations, assimilation windows, and metrics.

## 11. Human-verification checklist

Before downloading large volumes of data, independently confirm:

- [ ] The IcyAlert team accepts the Docquier five-SMILE setup as the causal baseline.
- [ ] EC-Earth3 is approved for the first prototype.
- [ ] Exact member IDs and ESGF versions are frozen.
- [ ] `historical + ssp370` is the intended scenario chain.
- [ ] The target is September extent rather than area or a concentration map.
- [ ] The threshold and Arctic boundaries match the paper.
- [ ] The thickness field definition is correct for each model.
- [ ] The exact gateway masks and OHT convention are available.
- [ ] The LKIF script and formula reproduce a synthetic unit test.
- [ ] EnKF is treated as a separate initialized-forecast experiment.

## 12. Immediate next action

Query ESGF for the EC-Earth3 monthly `historical` and `ssp370` holdings and create a manifest of available ensemble members for `siconc`, the appropriate thickness field, `areacello`, and `tas`. Download only one member and a small Arctic/time subset first. Do not begin with all 50 members or 3-D ocean fields.

Once SSIE, WSIV, and T2m reproduce sensible time series, add the remaining members, then ocean temperature/velocity for OHT, and finally run the published LKIF benchmark.

## Sources

- Docquier, D. et al. (2024), Scientific Reports: https://doi.org/10.1038/s41598-024-76056-y
- Full article, methods, and data availability: https://www.nature.com/articles/s41598-024-76056-y
- CMIP6 project description: https://doi.org/10.5194/gmd-9-1937-2016
- ESGF/CEDA CMIP6 search: https://esgf-index1.ceda.ac.uk/search/cmip6-ceda/
- CESM2 Large Ensemble data: https://www.earthsystemgrid.org/dataset/ucar.cgd.cesm2le.output.html
- LKIF implementation cited in the paper: https://github.com/Climdyn/Liang_Index_climdyn
- OSI SAF OSI-420 product: https://doi.org/10.15770/EUM_SAF_OSI_0022
