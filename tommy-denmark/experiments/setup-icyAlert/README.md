# IcyAlert Emulator and Filtering Setup

## Purpose

Build a working experimental pipeline aligned with the public IcyAlert research plan:

```text
CMIP6 and related climate data
        |
        v
probabilistic Arctic emulator
        |
        v
model forecast / prior
        |
        + new satellite or reanalysis observation
        v
Kalman-based update
        |
        v
filtered estimate and next forecast
```

The first deliverable is not the complete IcyAlert system. It is a reproducible vertical slice showing that actual climate data, a probabilistic model and observation-driven filtering work together end to end.

## Source-Aligned Scope

The [IcyAlert research page](https://icyalert.github.io/research) states that the project will use:

- CMIP6 data at approximately 1-degree resolution;
- CMIP7 later in the project;
- a single-model initial-condition large ensemble (SMILE);
- C3S multi-model seasonal forecasts for winter preconditions;
- satellite and reanalysis data for validation;
- LKIF causal analysis;
- probabilistic emulators using approaches such as GraphCast-like graph neural networks and GenCast-like diffusion models;
- summer sea-ice metrics and climate-impact indices as outputs.

### Not publicly specified

The public material does not yet specify:

- a released IcyAlert implementation repository;
- a trained IcyAlert model or checkpoint;
- the exact CMIP6 models, members and variables to use;
- the emulator's input tensor and output tensor;
- the forecast initialization date and prediction horizon;
- the exact sea-ice target or climate-impact indices;
- the filtering state, process model, observation operator or error statistics;
- whether filtering is intended for emulator initialization, emulator outputs, LKIF covariance estimation, or a combination of these.

These omissions must not be silently filled with assumptions.

## Reference Implementations

### GraphCast and GenCast

Official implementation:

[Google DeepMind WeatherNext repository](https://github.com/google-deepmind/weathernext)

The repository includes GraphCast and GenCast code, pretrained checkpoints, normalization statistics and demonstration notebooks.

Running a pretrained GraphCast or GenCast checkpoint is a **software-stack smoke test**. It does not by itself produce the IcyAlert ice-free-Arctic emulator because the published models use their own weather variables, grids, training data and forecast horizons.

### Why the reference run is still useful

It verifies:

- JAX and accelerator support;
- checkpoint loading;
- gridded climate-data handling;
- autoregressive rollout;
- probabilistic ensemble generation for GenCast;
- the reusable graph/diffusion model components available for adaptation.

## Implementation Strategy

## Phase 0 — Freeze the First Data Contract

Before training, record the following in a machine-readable configuration:

| Item | Required decision |
|---|---|
| Spatial domain | Pan-Arctic boundary and grid |
| Resolution | Approximately 1 degree for the first CMIP6 experiment |
| Temporal resolution | Monthly, daily or another agreed interval |
| Initialization | Which months or winter window provide preconditions |
| Forecast horizon | Next summer, several months, or multi-seasonal |
| Target | Sea-ice area, extent, concentration map, probability of crossing 1 million km², or an agreed combination |
| Predictors | Agreed atmospheric, oceanic and sea-ice variables |
| CMIP6 sources | Models, experiments and ensemble members |
| Observation sources | Satellite product and reanalysis product |
| Train/validation/test split | Split by time and, where required, by model or ensemble member |

No model comparison is meaningful until this contract is fixed.

## Phase 1 — Run the Published Reference Model

1. Clone the WeatherNext repository.
2. Create its supported Python/JAX environment.
3. Run the smallest published GraphCast example.
4. Run the smallest published GenCast example.
5. Save environment versions, input schema, runtime, memory use and generated outputs.

**Exit condition:** both published demonstrations run reproducibly, or a documented hardware/dependency limitation is identified.

## Phase 2 — Build a Small Real CMIP6 Dataset

Start with a deliberately small subset rather than downloading the entire archive.

### Initial dataset workflow

1. Select one CMIP6 model and one or a few ensemble members.
2. Select the historical experiment and the required scenario only when the target period needs it.
3. Download only the variables in the frozen data contract.
4. Crop to the Arctic domain.
5. Regrid all variables to the common approximately 1-degree grid.
6. Harmonize calendars, units, missing values and coordinate conventions.
7. Calculate the agreed sea-ice target.
8. Save processed data as chunked NetCDF or Zarr with provenance metadata.

### Data checks

- dimensions and coordinates are consistent;
- units are correct;
- sea-ice concentration remains within its physical range;
- the area calculation accounts for grid-cell area;
- calendar conversion does not shift dates;
- missing values and land masks are preserved correctly;
- train and test periods do not leak into each other.

**Exit condition:** one small processed dataset can be loaded into a training batch and its target can be independently recalculated.

## Phase 3 — Establish Forecast Baselines

Before adapting GraphCast or GenCast, create simple baselines using the same data contract:

- climatology;
- persistence;
- linear trend;
- an agreed lightweight statistical or neural baseline.

These are required to establish whether the later emulator adds predictive value.

**Exit condition:** every baseline produces predictions in the same output format and is evaluated through the same metric code.

## Phase 4 — Build the First Probabilistic Emulator

The first emulator should implement the frozen IcyAlert input/output contract. GraphCast-like GNN components or GenCast-like diffusion components can then be adapted rather than assuming their published checkpoints already solve the task.

### Minimum requirements

- consumes the processed CMIP6 preconditions and drivers;
- predicts the agreed summer sea-ice target;
- produces probabilistic output or an ensemble;
- saves checkpoints and complete configuration;
- supports deterministic reproduction from a recorded random seed;
- exposes a forecast interface that the filtering layer can call.

### Training order

1. Overfit a tiny subset to verify the implementation.
2. Train on the small CMIP6 subset.
3. Compare with the baselines.
4. Increase variables, ensemble members and spatial coverage only after the small experiment works.
5. Add SMILE, C3S and later CMIP7 through the same data interface.

**Exit condition:** a held-out CMIP6 experiment produces a probabilistic forecast and evaluation report.

## Phase 5 — Connect Real Observations

Satellite and reanalysis data must be transformed into the same representation as the model state or predicted target.

Required steps:

1. acquire the agreed satellite sea-ice product;
2. acquire the agreed reanalysis variables;
3. regrid them to the emulator grid;
4. apply the same units and normalization contract;
5. create historical observation cycles for hindcast testing;
6. record product uncertainty and missing-data masks.

CMIP6 simulations are not synchronized reconstructions of individual observed weather years. They can support training and climate statistics, but initialized hindcasts or seasonal forecast products are needed when a forecast must correspond to a particular historical observation cycle.

**Exit condition:** model forecast and observation pairs exist for reproducible historical update cycles.

## Phase 6 — First Kalman-Based Vertical Slice

The filtering experiment begins only after the emulator forecast and observation interfaces exist.

### Generic interface

The emulator supplies a prior estimate:

```text
prior state or target estimate
prior uncertainty or forecast ensemble
```

The observation pipeline supplies:

```text
observation
observation operator
observation uncertainty
quality and missing-data mask
```

The filter produces:

```text
updated estimate
updated uncertainty
diagnostics for the next forecast cycle
```

### First implementation boundary

Begin by filtering the agreed low-dimensional sea-ice metric or small regional state. This makes the process model, observation mapping and covariance diagnostics inspectable.

Moving to a complete Arctic grid or neural latent state is a later step. A high-dimensional nonlinear ensemble forecast may require an ensemble Kalman method or another data-assimilation method rather than a classical linear Kalman filter.

### Covariance inputs

The implementation must explicitly document how it obtains:

- prior covariance from an ensemble or another uncertainty model;
- process-error covariance;
- observation-error covariance;
- cross-covariance between observed and unobserved quantities;
- regularization, localization or dimension reduction when required.

These quantities must not be invented merely to make the filter run. A temporary experimental assumption is allowed only when labelled and followed by sensitivity analysis.

**Exit condition:** at least one historical cycle runs as:

```text
forecast -> observation -> analysis update -> next forecast
```

## Phase 7 — Evaluation

Compare at least:

```text
baseline forecast
unfiltered emulator forecast
filtered emulator forecast
```

Evaluation should cover the agreed target and include:

- deterministic forecast error where applicable;
- probabilistic skill and calibration;
- performance by lead time and season;
- ice-free threshold-event performance when part of the target;
- filter innovation and consistency diagnostics;
- ablations for process and observation uncertainty choices.

Satellite and reanalysis data are the observational references specified by IcyAlert. They are not perfect ground truth, so product uncertainty and disagreement should be retained in the report.

## Relationship to LKIF

LKIF remains a separate causal-analysis stream during the initial emulator and filtering setup.

Do not assume that the Kalman covariance used for state estimation is automatically the covariance required by a time-varying LK implementation. Integration requires an explicit mathematical and software contract from the IcyAlert team.

Possible integration should be considered only after both components work independently and the intended role of filtering in LKIF has been confirmed.

## Proposed Repository Layout

```text
setup-icyAlert/
├── README.md
├── configs/
│   ├── data-contract.yaml
│   ├── cmip6-small.yaml
│   └── experiment.yaml
├── environments/
├── scripts/
│   ├── download/
│   ├── preprocess/
│   ├── train/
│   ├── forecast/
│   └── evaluate/
├── src/
│   ├── data/
│   ├── models/
│   ├── filtering/
│   └── evaluation/
├── notebooks/
├── tests/
├── artifacts/
└── reports/
```

Large datasets and model checkpoints should not be committed to Git. Each artifact should be reproducible from a configuration and retain source provenance.

## Immediate Next Actions

1. Obtain the internal IcyAlert data and prediction contract from the team.
2. Record the first target, horizon, variables, model/member selection and observation sources in `configs/data-contract.yaml`.
3. Run the official GraphCast and GenCast demonstrations.
4. Download and preprocess one small CMIP6 Arctic subset.
5. Implement climatology, persistence and linear-trend baselines.
6. Train the smallest compatible probabilistic emulator.
7. Construct one synchronized historical forecast-observation cycle.
8. Add the first inspectable Kalman-based update.

## Questions Requiring IcyAlert Team Confirmation

1. Which work package owns the filtering component?
2. Is filtering meant for initialization, emulator output correction, LKIF, or several of these?
3. What is the first exact prediction target and lead time?
4. Which CMIP6 models, experiments, ensemble members and variables are approved?
5. Which SMILE and C3S products will be supplied?
6. Which satellite and reanalysis products are authoritative for validation and assimilation?
7. Is there an internal process model, emulator repository or preprocessing pipeline already available?
8. Is sequential operation required, or are windowed historical batches acceptable?
9. What hardware and storage are available before Gefion access is required?
10. Which metrics determine success for the emulator and filtering components?
