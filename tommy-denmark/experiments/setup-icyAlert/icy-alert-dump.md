tell me this , you knwo the ICyaler tright??


NewsTeamResearchWPPapersOutreachCollaboratorsContact
Research
1. Context

Arctic summer sea ice has been declining at an unprecedented rate, mainly caused by anthropogenic global warming (IPCC, 2021). The visible transition from ice-covered (high albedo) to ice-free (low albedo) ocean in summer amplifies solar heat absorption, intensifying surface warming (Stroeve & Notz, 2018). This positive feedback accelerates polar amplification, drives further sea ice loss, and triggers cascading impacts on the global climate (Meier & Stroeve, 2022). Since 1979, the Arctic has warmed nearly four times faster than the global average (Rantanen et al., 2022).

While the Intergovernmental Panel on Climate Change (IPCC) projects a summer ice-free Arctic (sea-ice area below 1 million km²) by mid-century (IPCC, 2021), emerging research highlights significant uncertainties, suggesting that the first ice-free day could occur as early as 2030, with timing projections varying widely across models and scenarios (Jahn et al., 2024). Moreover, the loss of summer sea ice undermines climate stability at high and mid-latitudes, potentially fueling extreme weather and causing regional impacts, even if large uncertainties remain (e.g. Outten et al., 2023).

In IcyAlert, we propose to address these uncertainties and to refine predictions of ice-free Arctic summers based on global climate models and satellite observations combined with causal analysis and explainable artificial intelligence (AI). This approach will not only improve the prediction accuracy of ice-free Arctic summers but will also provide deeper insights into the drivers of Arctic sea-ice variability, enabling more reliable early warning systems for regional climate impacts.

 
2. Objectives

In IcyAlert, we propose to develop an early warning system for summer ice-free Arctic predictions (sea-ice area below 1 million km²) and its climate impacts.

The three key project objectives of IcyAlert are:

Objective 1: Build a prototype IcyAlert system with bias correction and precondition detection using integrated observations and CMIP6 data. We aim to derive the dynamical driving ice-free conditions in the Arctic, providing a baseline method for future model evaluation.

Objective 2: Optimize IcyAlert with AI-driven ensemble simulations and causal analysis for prioritized key climate processes. We aim to refine predictions and uncover key Arctic sea-ice impacts.

Objective 3: Apply IcyAlert to CMIP7 data for downscaled year-round climate impact simulations and deliver risk alerts for the Arctic and extratropics. By leveraging a hierarchy of models, from AI/ML-enhanced predictions to downscaled impact models, we aim to use causal networks to enable localized risk assessments and actionable insights into abrupt climate changes and extreme events.

 
3. Methods
Climate data

IcyAlert will use climate datasets from CMIP6 (~1° resolution) and the upcoming CMIP7 to analyze large-scale Arctic climate variability. A single-model initial-condition large ensemble (SMILE) will also be employed to extend training data from CMIP6/CMIP7 and enhance probabilistic predictions. IcyAlert will integrate winter conditions from the Copernicus Climate Change Service (C3S) multi-model seasonal forecasting system to improve next-year Arctic predictions. Model performance will be validated against satellite and reanalysis data.
Causal analysis

IcyAlert will use the Liang-Kleeman information flow (LKIF) method as a primary causal method to quantify causal interactions between the different climate variables. This causal method will allow us to go beyond classical correlation analyses and identify the predictors of ice-free Arctic conditions, as well as its climate impacts. In IcyAlert, we will combine LKIF with explainable AI to improve ice-free Arctic predictions and assess its regional climate impacts. To ensure robustness, we will also compare results against alternative causal methods.
AI-powered climate emulators

IcyAlert will develop a probabilistic ice-free Arctic predictor that maps inputs from integrated preconditions and drivers to outputs of summer sea-ice metrics and climate impact indices. Using advanced probabilistic techniques such as Graph Neural Networks (e.g. GraphCast) and diffusion models (e.g. GenCast), the model will generate risk-informed predictions of ice-free conditions. This will form a prototype ice-free emulator, simulating ice-free scenarios under varying initial conditions and providing probabilistic outputs for decision-making and scenario analysis.
Gefion

IcyAlert will use the Gefion supercomputer to perform its computations.

    Intelligent Climate Early Warning Alert for Arctic Ice-Free Summers

A project funded by the Novo Nordisk Foundation (grant NNF25OC0097271)


and 

this is

[icenet-ai/icenet](https://github.com/icenet-ai/icenet)

/home/abhi/code/defence/icenet

and this 

So bascilyl we have everythign here

about icynet 

--

where do we go from here, tell me

---

# Research dump and current understanding

Updated: 2026-08-03

## The actual immediate goal

1. Understand precisely what IcyAlert proposes.
2. Identify and obtain the climate-model dataset that the project is most likely to use.
3. Treat the coupled climate model that generated those simulations as the first process model; do not begin by choosing an unrelated AI architecture.
4. Reproduce Liang-Kleeman information flow (LKIF) on that dataset so the data-to-causality pipeline is visible and testable.
5. Investigate ensemble Kalman filtering or another assimilation method as a separate layer, using an ensemble that is valid for assimilation.
6. Only after the baseline works, compare LKIF variants, filters, AI emulators, or foundation models.

## What IcyAlert explicitly says

The public project description commits to:

- CMIP6 data at approximately 1-degree resolution, followed later by CMIP7;
- a single-model initial-condition large ensemble (SMILE);
- winter initial conditions from the Copernicus Climate Change Service (C3S) multi-model seasonal forecasting system;
- validation against satellite observations and reanalyses;
- LKIF as the primary causal method, with alternative causal methods used for robustness;
- AI-enhanced ensemble simulation and a probabilistic ice-free-Arctic emulator;
- an ice-free threshold of sea-ice area below 1 million square kilometres.

The public description does **not** name one approved CMIP6 model, exact ensemble members, a specific satellite product, an EnKF implementation, or a final AI architecture.

## Strongest dataset evidence found

The kick-off agenda includes David Docquier's presentation, *Drivers of summer sea-ice extent in CMIP6 large ensembles based on information flow*. The corresponding 2024 Scientific Reports paper uses the same variables shown in the IcyAlert work-package diagram and applies LKIF to five CMIP6 large ensembles.

The five ensembles are:

| Coupled climate model | Members used | Process-model components |
|---|---:|---|
| EC-Earth3 | 50 | IFS cy36r4 + NEMO3.6-LIM3 |
| CESM2 | 50 | CAM6 + POP2-CICE5 |
| ACCESS-ESM1.5 | 40 | UM + MOM5-CICE4 |
| CanESM5 | 49 | CanAM5 + NEMO3.4-LIM2 |
| MPI-ESM1.2-LR | 30 | ECHAM6 + MPIOM |

Study configuration:

- frequency: monthly means;
- period: 1970-2060;
- forcing: CMIP6 `historical` for 1970-2014, followed by `ssp370` for 2015-2060;
- target: September Arctic sea-ice extent;
- main drivers: March sea-ice volume, annual Arctic 2 m air temperature, annual Atlantic ocean heat transport, and annual Pacific ocean heat transport;
- optional driver experiment: replace air temperature with net shortwave and downward longwave surface radiation.

This is currently the best-supported interpretation of the CMIP6/SMILE data behind IcyAlert's first causal baseline. It is stronger evidence than the earlier IceNet, ClimaX, GraphCast, or GenCast guesses because the paper is by an IcyAlert researcher, its title appears in the project kick-off, and its variables match the project diagram.

## Recommended first model, clearly marked as an inference

Start the prototype with the **EC-Earth3 50-member large ensemble**.

Reasons:

- EC-EARTH appears explicitly in IcyAlert WP3's hybrid prediction framework;
- the research team's earlier Arctic LKIF study used EC-Earth3 alone;
- it has 50 members and approximately 1-degree ocean/sea-ice resolution;
- it provides a direct path from an existing process-based ensemble to the IcyAlert causal baseline.

This is a recommendation, not proof that the IcyAlert team has officially selected EC-Earth3 as its sole dataset. The later scientific comparison should include all five ensembles because the published causal result is multi-model.

## Exact published LKIF construction to reproduce

From each ensemble member, derive:

- summer sea-ice extent: September area north of 40 degrees N with sea-ice concentration at least 15%;
- winter sea-ice volume: March equivalent ice thickness times grid-cell area, summed north of 40 degrees N;
- surface air temperature: annual mean 2 m temperature averaged north of 70 degrees N;
- Atlantic ocean heat transport: annual transport through the Barents Sea Opening, Fram Strait, and Davis Strait;
- Pacific ocean heat transport: annual transport through the Bering Strait.

For the main 1970-2060 calculation, the paper removes the ensemble mean from each member to reduce the forced trend, computes LKIF for each member, uses 1,000 bootstrap samples at a 5% significance level, and then combines results across members.

Published benchmark behavior:

- 2 m air temperature significantly drives September sea-ice extent in all five models;
- March sea-ice volume is significant in three models;
- Atlantic ocean heat transport is significant in two models;
- Pacific ocean heat transport is not significant in any of the five models.

These results give us a concrete regression test for our implementation.

## Observation and reanalysis products used in that paper

These are confirmed for the Docquier et al. study, but are not yet confirmed as the official IcyAlert operational choices:

- OSI SAF OSI-420 v2.2: sea-ice extent;
- PIOMAS: sea-ice volume;
- HadCRUT5: Arctic near-surface temperature;
- ORAS5: ocean temperature and velocities used for ocean heat transport;
- CERES EBAF surface: shortwave and longwave radiation.

This explains why OSI SAF appeared in earlier discussion. It was not invented, but it should have been presented as the paper's reference product rather than as an officially frozen IcyAlert choice.

## Process model versus AI model

EC-Earth3, CESM2, ACCESS-ESM1.5, CanESM5, and MPI-ESM1.2-LR are process-based coupled climate models. Their CMIP6 ensemble simulations already exist; we download the outputs rather than train those climate models.

An AI emulator is a learned approximation or predictor built from those simulations and observations. Training an emulator is a later task, not a prerequisite for reproducing the CMIP6-to-LKIF baseline.

## Where the previously discussed AI projects fit

- **IceNet:** an Arctic sea-ice forecasting system. The original seasonal model used a standard U-Net ensemble, pretrained on CMIP6 simulations and fine-tuned on observations. It is relevant later as an AI baseline, but it is not the coupled process model producing the IcyAlert CMIP6 ensemble.
- **DeepSensor:** a general neural-process toolkit for sparse environmental sensing and prediction. It is not IceNet and is not required for the first IcyAlert baseline.
- **ClimaX:** a CMIP6-pretrained climate foundation model, but its released pretraining focuses on atmospheric variables rather than a ready-made Arctic sea-ice target.
- **GraphCast and GenCast:** medium-range weather models. Their graph and diffusion techniques are examples in the proposal, not evidence that their released checkpoints are the IcyAlert sea-ice model.

## Important EnKF separation

A CMIP6 SMILE is excellent for climate statistics and LKIF because its members share external forcing and differ in initial conditions. However, those members are not initialized hindcasts synchronized to the actual observed weather sequence.

Therefore:

- use the CMIP6/SMILE dataset first to reproduce the causal baseline;
- do not naively assimilate yearly observations into arbitrary CMIP6 members as though they were an operational forecast ensemble;
- for a defensible EnKF experiment, use an initialized ensemble such as C3S seasonal hindcasts/forecasts or a specifically initialized EC-Earth ensemble;
- compare LKIF before and after assimilation only after defining the forecast state, observations, observation operator, cadence, and covariance assumptions.

## Verified primary links

- IcyAlert-related causal study: https://doi.org/10.1038/s41598-024-76056-y
- Article and full methods: https://www.nature.com/articles/s41598-024-76056-y
- CMIP6 outputs except CESM2 in the study: https://esgf-index1.ceda.ac.uk/search/cmip6-ceda/
- CESM2 Large Ensemble: https://www.earthsystemgrid.org/dataset/ucar.cgd.cesm2le.output.html
- LKIF implementation cited by the paper: https://github.com/Climdyn/Liang_Index_climdyn
- OSI SAF reference product: https://doi.org/10.15770/EUM_SAF_OSI_0022

## Unresolved questions that require team confirmation

- Is EC-Earth3 the approved first SMILE, or will all five ensembles be supplied?
- Which exact member identifiers and ESGF versions are approved?
- Is the first target September extent, September area, concentration maps, or probability of crossing 1 million square kilometres?
- Is C3S used only as a predictor input, or as the initialized ensemble for data assimilation?
- Which satellite/reanalysis products are frozen for IcyAlert evaluation?
- Is EnKF actually part of an assigned work package, or an experimental contribution we are proposing?

---

# Factual source-of-truth ledger

This section records all technically relevant facts from the IcyAlert material supplied in this task. It intentionally distinguishes project statements, published evidence, and our own proposed implementation.

## Evidence labels

- **PROJECT FACT:** stated directly on the supplied IcyAlert research page or work-package image.
- **KICK-OFF FACT:** stated in the supplied IcyAlert kick-off agenda.
- **PAPER FACT:** stated in a directly related peer-reviewed paper by IcyAlert team members.
- **LOCAL CODE FACT:** verified by inspecting a local repository.
- **PROPOSAL:** our current engineering recommendation; not an official IcyAlert decision.
- **UNKNOWN:** not specified in the supplied project material.

## Project identity and organizations

- **PROJECT FACT:** Full title: *Intelligent Climate Early Warning Alert for Arctic Ice-Free Summers*.
- **PROJECT FACT:** Short name: IcyAlert.
- **PROJECT FACT:** Funding: Novo Nordisk Foundation, grant `NNF25OC0097271`.
- **PROJECT FACT:** The supplied work-package figure names DMI, RMI, and DTU under IcyAlert.
- **PROJECT FACT:** Computation is intended to use the Gefion supercomputer.
- **KICK-OFF FACT:** The supplied meeting agenda names Tian Tian as PI and IcyAlert project leader.
- **KICK-OFF FACT:** The supplied core team/hosts are Tian Tian, Tommy Alstrøm, Stéphane Vannitsem, and David Docquier.

## Scientific problem and intended outcome

- **PROJECT FACT:** The project addresses declining Arctic summer sea ice and uncertainty in the timing of ice-free conditions.
- **PROJECT FACT:** IcyAlert defines an ice-free Arctic summer using sea-ice area below 1 million square kilometres.
- **PROJECT FACT:** It aims to predict both ice-free Arctic conditions and associated regional/extratropical climate impacts.
- **PROJECT FACT:** It combines global climate models, satellite observations, causal analysis, explainable AI, and probabilistic prediction.

## Three stated objectives

1. **PROJECT FACT — Objective 1:** Build a prototype with bias correction and precondition detection from integrated observations and CMIP6 data, and derive dynamical conditions driving ice-free events as a baseline for model evaluation.
2. **PROJECT FACT — Objective 2:** Improve the system using AI-driven ensemble simulations and causal analysis of prioritized climate processes, refining predictions and identifying sea-ice impacts.
3. **PROJECT FACT — Objective 3:** Apply the system to CMIP7, perform downscaled year-round climate-impact simulations, and deliver Arctic and extratropical risk alerts using a hierarchy of models and causal networks.

## Stated climate-data strategy

- **PROJECT FACT:** Use CMIP6 at approximately 1-degree resolution.
- **PROJECT FACT:** Use CMIP7 later.
- **PROJECT FACT:** Use a single-model initial-condition large ensemble (SMILE) to enlarge the training/evaluation sample and support probabilistic prediction.
- **PROJECT FACT:** Integrate winter conditions from the C3S multi-model seasonal forecasting system for next-year Arctic predictions.
- **PROJECT FACT:** Validate model performance against satellite and reanalysis data.
- **UNKNOWN:** The supplied public text does not freeze one CMIP6 model, exact member identifiers, ESGF versions, observation products, train/test split, or data contract.

## Stated causal strategy

- **PROJECT FACT:** LKIF is the primary causal method.
- **PROJECT FACT:** Its role is to quantify interactions among climate variables, identify predictors of ice-free conditions, and study climate impacts beyond ordinary correlation.
- **PROJECT FACT:** LKIF will be combined with explainable AI.
- **PROJECT FACT:** Alternative causal methods will be used for robustness comparison.
- **UNKNOWN:** The project material does not say that an EnKF covariance is to be inserted into LKIF, nor does it specify a Kalman/LKIF coupling formula.

## Stated AI strategy

- **PROJECT FACT:** Develop a probabilistic predictor mapping integrated preconditions and drivers to summer sea-ice metrics and climate-impact indices.
- **PROJECT FACT:** The system should simulate ice-free scenarios under different initial conditions and provide risk-oriented probabilistic outputs.
- **PROJECT FACT:** Graph neural networks, with GraphCast as an example, and diffusion models, with GenCast as an example, are mentioned as advanced techniques.
- **UNKNOWN:** The public text does not state that released GraphCast or GenCast checkpoints will be used directly.
- **UNKNOWN:** No public IcyAlert model checkpoint, final neural architecture, input tensor, output tensor, or training recipe was supplied.

## Work-package workflow visible in the supplied image

Source image:
`/home/abhi/.codex/attachments/e76910e9-e0d6-4f7f-968e-dcea5bcf1757/Screenshot 2026-08-03 at 4.28.47 PM.png`

- **PROJECT FACT:** WP1 performs data retrieval and preprocessing.
- **PROJECT FACT:** WP2 identifies drivers using Liang-Kleeman information flow.
- **PROJECT FACT:** WP2 includes a baseline statistical model for predicting ice-free-Arctic summers.
- **PROJECT FACT:** Development of AI/ML prototype models spans WP2-WP3.
- **PROJECT FACT:** WP3 contains AI-enhanced ensemble initialization and causally informed dynamical prediction in a hybrid prediction framework.
- **PROJECT FACT:** EC-EARTH is shown inside that WP3 hybrid framework.
- **PROJECT FACT:** WP4 performs causally informed probabilistic ice-free-Arctic prediction.
- **PROJECT FACT:** WP5 develops causal AI for regional climate impacts.
- **PROJECT FACT:** The two displayed high-level outcomes are improved future ice-free-Arctic predictions at multi-seasonal time scale and improved climate-impact predictions.
- **PROJECT FACT:** The figure says IcyAlert contains six scientific work packages and one management work package.
- **PROJECT FACT:** The visible variable set is summer sea-ice extent (SSIE), winter sea-ice volume (WSIV), mean surface air temperature (T2m), and ocean heat transport (OHT).
- **UNKNOWN:** The supplied screenshot cuts off the complete WP6 description, so it is not reconstructed here.

## Relevant technical signals from the supplied kick-off agenda

- **KICK-OFF FACT:** David Docquier presented *Drivers of summer sea-ice extent in CMIP6 large ensembles based on information flow*.
- **KICK-OFF FACT:** X. San Liang presented information flow, quantitative causality, and causal discovery in Earth-system science.
- **KICK-OFF FACT:** Stéphane Vannitsem covered ML and causal analysis.
- **KICK-OFF FACT:** Robert Jenssen presented Earth foundation models and IceNet toward continuous-function modelling.
- **KICK-OFF FACT:** Daniel Hagan presented tracking causality through time and a poster benchmarking LKIF in high dimensions.
- **KICK-OFF FACT:** Carlos Pires presented causal inference using models and time series; his poster concerned Shannon-entropy information transfer in nonlinear systems.
- **KICK-OFF FACT:** Marisa Wodrich presented uncertainty in graph neural networks.
- **KICK-OFF FACT:** Lars Uebbing presented neural-operator function embeddings for climate data.
- **KICK-OFF FACT:** Athanasios Athanasiadis presented explainable AI for feature selection in satellite-based sea-ice mapping.
- **KICK-OFF FACT:** Till S. Rasmussen presented the path from observations to sea-ice forecasts.
- **KICK-OFF FACT:** Elena Tomasi presented latent-diffusion emulation of dynamical downscaling for high-resolution climate projections.

These talks indicate relevant research directions; they do not prove that each method is an adopted IcyAlert implementation component.

## Closest published causal-data baseline

- **PAPER FACT:** Docquier et al. (2024) apply multivariate LKIF to five CMIP6 large ensembles over 1970-2060.
- **PAPER FACT:** They use monthly CMIP6 `historical` output for 1970-2014 and `ssp370` output for 2015-2060.
- **PAPER FACT:** The ensembles are EC-Earth3 (50 members), CESM2 (50), ACCESS-ESM1.5 (40), CanESM5 (49), and MPI-ESM1.2-LR (30).
- **PAPER FACT:** The main target is September Arctic sea-ice extent.
- **PAPER FACT:** The main drivers are March Arctic sea-ice volume, annual Arctic 2 m temperature, annual Atlantic OHT, and annual Pacific OHT.
- **PAPER FACT:** Optional analyses use net shortwave and downward longwave surface radiation, surface winds, 300 hPa geopotential height, and sea-surface temperature.
- **PAPER FACT:** Extent is calculated north of 40 degrees N using a 15% sea-ice-concentration threshold.
- **PAPER FACT:** Arctic 2 m temperature is spatially averaged north of 70 degrees N.
- **PAPER FACT:** Atlantic OHT is the sum across the Barents Sea Opening, Fram Strait, and Davis Strait; Pacific OHT is computed at Bering Strait.
- **PAPER FACT:** For the full-period LKIF calculation, the ensemble mean is removed from each member before calculating LKIF member by member.
- **PAPER FACT:** The study uses 1,000 bootstrap realizations with 5% significance and aggregates member results for each model.
- **PAPER FACT:** The published qualitative benchmark is: T2m significant for all five models, WSIV significant for three, Atlantic OHT significant for two, and Pacific OHT significant for none.
- **PAPER FACT:** The reference products are OSI SAF OSI-420 v2.2 for sea-ice extent, PIOMAS for sea-ice volume, HadCRUT5 for near-surface temperature, ORAS5 for ocean variables/OHT, and CERES EBAF for radiation.

Primary paper: https://doi.org/10.1038/s41598-024-76056-y

## What "get the process model running" means here

There are three different tasks that must not be mixed:

### A. Reproduce the process-model causal dataset

- **PAPER FACT:** EC-Earth3 and the other CMIP6 models have already been run; their output is the dataset.
- **PROPOSAL:** Download a small EC-Earth3 ensemble subset, derive SSIE/WSIV/T2m, and reproduce LKIF.
- This does not require compiling or retraining EC-Earth3.

### B. Run an initialized forecast plus data assimilation

- **PROJECT FACT:** C3S winter seasonal forecasts are intended to improve next-year prediction.
- **PAPER FACT:** Ordinary CMIP6 historical/SSP ensemble members are free-running climate trajectories, not observation-synchronized historical forecasts.
- **PROPOSAL:** Use C3S hindcast/forecast ensembles, or a dedicated initialized EC-Earth forecast ensemble, for EnKF experiments.
- This stage requires a state, observation operator, observation uncertainty, update cadence, and forecast/analysis verification.

### C. Run or train an AI emulator

- **PROJECT FACT:** IcyAlert intends to develop a probabilistic emulator.
- **PROPOSAL:** Train/adapt it only after the target, predictors, horizon, and CMIP6/C3S interface are frozen.
- IceNet, ClimaX, GraphCast, and GenCast are possible references or components, not substitutes for defining this contract.

## Current executable milestone

The first defensible runnable milestone is:

```text
EC-Earth3 CMIP6 monthly ensemble output
    historical 1970-2014 + SSP3-7.0 2015-2060
        |
        v
derive September SSIE + March WSIV + annual Arctic T2m
        |
        v
remove EC-Earth3 ensemble mean from each member
        |
        v
run and test multivariate LKIF
        |
        v
compare sign/significance/ranking with Docquier et al. 2024
```

Then add 3-D ocean fields and the Atlantic/Pacific OHT calculations. Only after that baseline is reproduced should the work branch into an initialized C3S/EnKF experiment and an AI-emulator experiment.

## Current decision status

- **Supported dataset family:** the five Docquier CMIP6 SMILEs.
- **PROPOSAL for first subset:** EC-Earth3 because it is explicitly shown in WP3 and is already used in the team's LKIF lineage.
- **First computational objective:** reproduce published LKIF, not train GraphCast/GenCast.
- **First assimilation objective:** still undefined until an initialized ensemble and observation contract are selected.
- **Official team approval:** still required for the final model/member/product choices.

## Provenance of supplied local material

- IcyAlert research text supplied by the user:
  `/home/abhi/.codex/attachments/38ed4bbf-69a1-4105-bfc1-7ccc74f2f7ea/pasted-text.txt`
- IcyAlert work-package screenshot supplied by the user:
  `/home/abhi/.codex/attachments/e76910e9-e0d6-4f7f-968e-dcea5bcf1757/Screenshot 2026-08-03 at 4.28.47 PM.png`
- IcyAlert kick-off agenda supplied by the user:
  `/home/abhi/.codex/attachments/0c27f6a6-98d5-452f-87ce-e0634a76af98/pasted-text.txt`
- IceNet website text supplied by the user:
  `/home/abhi/.codex/attachments/daaf478b-fddb-46a4-85da-3df40e2846e7/pasted-text.txt`
- Local IceNet repository inspected earlier:
  `/home/abhi/code/defence/icenet`

## Warning about planning documents

`context.md`, `README.md`, and the benchmark plan in this folder include our implementation planning. They are not official IcyAlert specifications. In particular, any instruction to run GraphCast/GenCast first or to use EnKF is a proposed experiment unless separately confirmed by the team.

---

# Agreed filtering interpretation

Updated: 2026-08-03

## User's research objective

The immediate research objective is to develop or improve an **online filtering/data-assimilation method**, such as EnKF, and potentially compare it with alternatives such as 4D-Var.

The required experimental ingredients are:

1. a climate/sea-ice dataset;
2. a process or state-transition model that can propagate a state from one time to the next;
3. observations and an observation operator;
4. an online filtering/update mechanism;
5. known truth or observations for evaluation;
6. later, the time-evolving filter covariance as an input to the time-varying LK formulation.

LKIF is a later integration step. The immediate task is the filtering testbed.

## Why EC-Earth3/CMIP6 is valid for filtering

EC-Earth3 CMIP6 output can provide a complete **synthetic** filtering benchmark, even though its simulated calendar years are not synchronized with the real Earth's internal weather.

Proposed observing-system simulation experiment (OSSE):

```text
several EC-Earth3 ensemble members
        |
        v
train a differentiable state-transition emulator: x(t) -> x(t+1)

one completely held-out EC-Earth3 member
        |
        +--> treated as the hidden truth
        +--> passed through H and observation noise to create observations

emulator forecast + synthetic observations
        |
        v
EnKF / improved online filter / differentiable 4D-Var
        |
        v
compare the analysis and forecast with the fully known held-out truth
```

This is scientifically useful for method development because the truth is completely known, observation density/noise can be controlled, and updated states can be propagated repeatedly by the emulator.

The limitation is only real-world alignment: a free-running EC-Earth3 member labelled 2005 is not a reconstruction or forecast of the Earth's actual 2005 internal weather. Therefore, it should not be directly scored against real 2005 observations as if their weather states were synchronized.

## Why C3S is also useful

C3S seasonal hindcasts/forecasts are initialized and correspond to real historical forecast cycles. They are therefore appropriate for:

- seasonal experiments from different initialization months;
- updating a real forecast ensemble using contemporaneous observations;
- testing whether filtering improves predictions of the observed Earth;
- measuring seasonal forecast skill and calibration.

However, archived C3S forecast output does not automatically provide an interface for inserting our updated analysis state back into each contributing process model and rerunning the next forecast step. That capability depends on access to the underlying executable, restart files, and initialization system.

Therefore C3S directly supports:

```text
C3S forecast ensemble -> filtering/post-processing update -> verification
```

Fully closed-loop cycling:

```text
forecast -> filter update -> insert analysis into model -> next forecast
```

requires either model/restart access or a process emulator that accepts the updated state.

## Agreed two-track design

### Track A — controlled algorithm-development benchmark

- Dataset: EC-Earth3 CMIP6/SMILE trajectories.
- Process model: differentiable emulator trained on those trajectories.
- Truth: held-out EC-Earth3 member.
- Observations: controlled noisy/sparse samples generated from the truth.
- Methods: EnKF, proposed improved filter, and potentially differentiable 4D-Var.
- Advantage: genuine repeatable online cycling with known truth.

### Track B — real seasonal forecast benchmark

- Dataset/process forecast: C3S initialized seasonal hindcasts and ensembles.
- Observations: agreed satellite and reanalysis products.
- Methods: ensemble filtering or forecast-output correction, depending on available state and restart access.
- Advantage: real dates, different seasonal initializations, and real-world verification.

The two tracks answer different questions and should both be retained:

- Track A asks whether the filtering algorithm works under controlled conditions.
- Track B asks whether it improves real initialized seasonal predictions.

## 4D-Var clarification

Classical 4D-Var requires a tangent-linear/adjoint capability or an equivalent way to obtain gradients through the forecast model over an assimilation window. It does not specifically require a neural network or modern automatic differentiation.

If the EC-Earth3-trained process emulator is differentiable, automatic differentiation can provide the required gradients, making an experimental 4D-Var implementation feasible. EnKF does not require model derivatives. Ensemble/hybrid variational approaches may also avoid a conventional hand-written adjoint.

Thus the method comparison can be:

```text
same differentiable emulator
same held-out truth and observations
same assimilation windows
        |
        +--> EnKF
        +--> improved online filter
        +--> differentiable 4D-Var
```

This comparison must use identical observations, initialization, forecast horizon, and evaluation metrics.

---

# EC-Earth3 verification

Updated: 2026-08-04

## Confirmed

- **PROJECT FACT:** IcyAlert specifies CMIP6, a SMILE, C3S seasonal winter conditions, satellite/reanalysis validation, and a probabilistic emulator.
- **PROJECT FACT:** EC-EARTH appears in the IcyAlert WP3 hybrid framework for AI-enhanced ensemble initialization and dynamic prediction.
- **MODEL FACT:** `EC-Earth3` is the name of the basic standard-resolution atmosphere-ocean physical configuration, one of eight EC-Earth3 configurations contributed to CMIP6.
- **MODEL FACT:** The relevant base configuration couples IFS atmospheric dynamics/HTESSEL with NEMO 3.6 ocean and LIM3 sea ice.
- **PAPER FACT:** The directly related Docquier et al. LKIF study uses a 50-member EC-Earth3 large ensemble with IFS cy36r4 and NEMO3.6-LIM3.
- **PAPER FACT:** That study uses monthly historical and SSP3-7.0 process-model output and derives sea-ice, atmospheric, and oceanic indices from it.

## Correct interpretation

EC-Earth3 is strongly supported as the **physical data-generating process model** for the first controlled experiment. The CMIP6 files are saved trajectories previously generated by EC-Earth3.

For repeated online filtering, there are two possibilities:

1. obtain and operate the full EC-Earth3 executable, initialization, restart, and HPC workflow; or
2. learn a smaller differentiable transition model from EC-Earth3 trajectories and use that emulator inside the filter.

The second option is currently the practical proposal. It preserves EC-Earth3 as the physical source while giving EnKF and gradient-based 4D-Var a callable state-transition model.

## Not yet confirmed

- IcyAlert has not publicly frozen EC-Earth3 as its only CMIP6/SMILE source.
- Access to the full EC-Earth3 executable, restart files, and initialization workflow has not been established.
- The full EC-Earth3 model is not automatically differentiable through a modern autodiff framework.
- The exact state variables, observation variables, time step, and filtering benchmark have not yet been frozen.

## Verified sources

- IcyAlert research: https://icyalert.github.io/research
- IcyAlert work packages: https://icyalert.github.io/wp
- Official EC-Earth3 configurations: https://ec-earth.org/ec-earth/ec-earth3/
- EC-Earth3 model paper: https://doi.org/10.5194/gmd-15-2973-2022
- CMIP6 large-ensemble LKIF study: https://doi.org/10.1038/s41598-024-76056-y
- Supplied EC-Earth3 configuration screenshot:
  `/home/abhi/.codex/attachments/062d5eaa-b85b-4431-a09c-d4282c2ed39a/Screenshot 2026-08-04 at 3.58.55 AM.png`

## Beginner explainer

The climate, dataset, observation, SMILE, process-model, filtering, and causality concepts are explained from first principles in:

`icyalert-from-zero.md`

---

# Terminology checkpoint and filtering ownership

Updated: 2026-08-04

## Exact terminology

- **Process model:** A physical simulator such as EC-Earth3, CESM2, or another coupled atmosphere-ocean-sea-ice model. It contains equations/rules for advancing a climate state through time.
- **One run/member:** One trajectory generated by a process model from one initial condition.
- **Ensemble:** A collection of model runs.
- **SMILE:** A methodology/experimental design—**not a model**. It means running one process model many times with slightly different initial conditions. The resulting collection of trajectories is a SMILE ensemble dataset.
- **CMIP6:** A coordinated experiment framework and archive—not one model. It stores standardized outputs produced by many climate models. Some models contribute many ensemble members that can form a SMILE.
- **C3S seasonal forecasts:** A service/dataset containing initialized ensemble predictions from several operational seasonal process-model systems. It includes forecasts and retrospective forecasts (hindcasts) associated with real calendar start dates.
- **Satellite observations:** Measurements/retrievals describing the actual Earth, such as sea-ice concentration.
- **Reanalysis:** A gridded reconstruction of the actual Earth produced by combining observations with a physical forecast model through data assimilation.

## Engine analogy

```text
EC-Earth3 process model = an engine

SMILE = run the same engine 50 times
        from slightly different starting positions

CMIP6 = the library/rulebook containing recorded trips
        from EC-Earth3 and many other engines

C3S = a live seasonal forecast service using several engines
      started close to today's estimated Earth state

satellite/reanalysis = information about where the real Earth actually is
```

## Corrected current understanding

1. CMIP6 supplies long simulated climate trajectories.
2. A SMILE supplies many trajectories from one consistent process model and is useful for training, uncertainty, and controlled experiments.
3. C3S supplies initialized ensemble predictions for real historical or current forecast dates.
4. C3S is not the observation. Its systems are initialized using estimates of the real Earth; satellite/reanalysis products remain the observation/reference sources.
5. The first direct filtering benchmark can use C3S forecasts as the prior ensemble and satellite/reanalysis as observations, without first training another model.
6. A CMIP6/SMILE-trained emulator is useful later when repeated propagation from the filter-corrected state or differentiable 4D-Var is required.

## IcyAlert work-package story

```text
WP1: retrieve climate and observation data
  -> WP2: identify important drivers and causal relationships
  -> WP3: initialize ensembles and improve dynamic prediction
  -> WP4: predict future ice-free-Arctic events
  -> WP5: estimate regional climate impacts
  -> WP6: synthesize results into risk assessment
```

WP7 covers management and research training.

## Filtering task placement

The filtering task fits most directly in **WP3: AI-enhanced ensemble initialization and dynamic prediction**.

Its interfaces are:

- WP1 provides C3S, CMIP6/SMILE, satellite, and reanalysis data;
- WP3 uses ensemble forecasts plus observations to improve the Arctic state and prediction;
- WP4 consumes the improved forecast to estimate ice-free risk;
- WP2/RMI becomes relevant later when filter covariance is investigated for time-varying LKIF.

The public IcyAlert page does not explicitly prescribe EnKF. Using EnKF or an improved online filter is the proposed technical contribution within the WP3 ensemble-initialization/dynamic-prediction role.

## Team interfaces for filtering

- **DMI / Tian Tian, Nishka Dasgupta:** data retrieval, observations, CMIP6 evaluation, and project-level integration.
- **DMI / Shuting Yang:** EC-Earth process-model expertise and contribution to WP3-WP5.
- **DTU / Tommy Alstrøm, Clara Edmonds:** WP3 machine learning, numerical modelling, ensemble initialization, dynamic prediction, and HPC.
- **RMI / Stéphane Vannitsem, David Docquier:** causal methods and later LKIF integration.

Sources:

- https://icyalert.github.io/team
- https://icyalert.github.io/wp
- https://icyalert.github.io/research

---

# Reanalysis, time-varying LK, and IceNet model assessment

Updated: 2026-08-04

This section records evidence added after CARRA2, ERA5, the Hagan et al. time-varying LK paper, the Environmental Data Science IceNet notebook, and the local IceNet source tree were inspected. Facts, interpretations, and proposed experiments are separated explicitly.

## Personally shared dataset candidates

Two reanalysis products were personally identified as interesting for IcyAlert:

1. **CARRA2**, the second-generation Copernicus Arctic Regional Reanalysis.
2. **ERA5**, the fifth-generation ECMWF global reanalysis.

This is evidence that the products are relevant candidates. It does not by itself establish that either product is the project's exclusive or final dataset.

### CARRA2 facts

- CARRA2 is a **pan-Arctic reanalysis**, not a free-running climate simulation and not a multi-seasonal forecast system.
- It is generated with the HARMONIE-AROME regional numerical weather-prediction model, observations, ERA5 boundary conditions, and surface physiographic data.
- The CDS catalogue describes a 2.5 km polar-stereographic grid, 3-hourly analyses, and hourly short forecasts, including forecasts up to 18 hours from 00 and 12 UTC analyses.
- Relevant available fields include sea-ice area fraction, sea-ice thickness, snow on sea ice, sea-surface temperature, 2 m air temperature, wind, pressure, radiation, precipitation, clouds, snow, and atmospheric variables on several vertical coordinate systems.
- The December 2025 first-release announcement listed 24 intermittent years between 1986 and 2023. It said the completed product would cover 1986-2025. The current catalogue advertises the full nominal 1986-2025 coverage; actual requested-date availability should still be checked through the CDS API before fixing a split.
- Because ERA5 supplies CARRA2 boundary conditions, CARRA2 and ERA5 should not be treated as two fully independent ground truths.
- CARRA2 is especially attractive for Arctic spatial detail and sea-ice thickness/volume. Its native 2.5 km grid is unnecessarily large for a first filtering benchmark and should initially be subset or aggregated.

Sources:

- https://climate.copernicus.eu/first-carra2-data-release-offers-new-insights-arctic-extremes
- https://cds.climate.copernicus.eu/datasets/reanalysis-pan-carra
- https://cds.climate.copernicus.eu/datasets/reanalysis-pan-carra-means

### ERA5 facts

- ERA5 is a **global reanalysis**: observations and short physical-model forecasts are repeatedly combined by data assimilation to reconstruct a complete history of the Earth's atmosphere and surface.
- The supplied single-level product covers 1940 to the present, is hourly, and is distributed on a regular 0.25-degree atmospheric grid.
- An underlying 10-member uncertainty ensemble is sampled every three hours at 0.5-degree atmospheric resolution; precomputed ensemble mean and spread are available.
- ERA5 provides a long, continuous, lower-cost baseline. It is the natural modern successor to the ERA-Interim data used in the Hagan et al. time-varying LK application.
- The ERA5 uncertainty ensemble does not automatically make the time-varying LK method an EnKF. It is an optional source for uncertainty and sensitivity experiments.

Source:

- https://cds.climate.copernicus.eu/datasets/reanalysis-era5-single-levels

## Two different Kalman-filter roles must not be mixed

### Role A: square-root Kalman filter inside time-varying LK

The Hagan et al. (2019) paper, *A Time-Varying Causality Formalism Based on the Liang-Kleeman Information Flow for Analyzing Directed Interactions in Nonstationary Climate Systems*, uses a square-root Kalman filter to estimate time-varying parameters needed by the LK causality formalism.

- The filter tracks a changing statistical/causal relationship.
- It does not assimilate observations into EC-Earth, IceNet, or another sea-ice forecast model.
- The real-data example used daily ERA-Interim first-layer soil moisture and 2 m air temperature at 0.25 degrees for January 2012 through December 2015 over two regions in China.
- ERA5 can serve as a modern reproduction dataset for that example.

### Role B: EnKF around a climate or sea-ice forecast

The proposed IcyAlert filtering track has a different purpose:

- a forecast model or emulator advances a climate/sea-ice state;
- observations update a forecast ensemble;
- the corrected state is propagated again;
- the result is evaluated against known synthetic truth or real observations.

This second role requires a callable state transition for genuine closed-loop cycling. It is separate from reproducing the Hagan time-varying LK method. A later study can connect the two, but that connection is a new experiment rather than a step already specified by the paper.

Sources:

- https://www.jstor.org/stable/26831777
- https://doi.org/10.1175/JCLI-D-18-0881.1

## IceNet findings

### What IceNet is

IceNet is a sea-ice-specific learned forecast system. It is not a coupled physical atmosphere-ocean-sea-ice model, but it can potentially act as a learned forecast/emulator component in a reduced sea-ice filtering system.

The original 2021 research system:

- used an ensemble of 25 U-Net neural networks;
- predicted the next six months of monthly Arctic sea-ice concentration classes/probabilities;
- operated on a 25 km, 432 x 432 EASE2 polar grid;
- consumed 50 input channels made from sea-ice history, climate variables, statistical sea-ice forecasts, and static/calendar metadata;
- was pre-trained on 2,220 years of CMIP6 simulation data and then fine-tuned on the observational/reanalysis period;
- reported probabilistically calibrated output and strong seasonal summer sea-ice performance relative to the SEAS5 dynamical baseline.

The newer `icenet-ai/icenet` library is a refactored operational ecosystem that supports end-to-end download, preprocessing, training, prediction, ensembling, and forecast products. The Environmental Data Science notebook demonstrates daily rather than monthly prediction and uses a deliberately tiny dataset for teaching and runtime reasons.

Sources:

- https://www.nature.com/articles/s41467-021-25257-4
- https://edsbook.org/67a1e320-7c47-4ea9-8df8-e868326bc90b/notebook
- https://github.com/icenet-ai/icenet
- https://github.com/tom-andersson/icenet-paper

### Original IceNet data contract

The Nature Communications configuration used:

- **Target/reference sea ice:** OSI-SAF sea-ice concentration.
- **Observed/reanalysis predictors:** ERA5 monthly surface and pressure-level fields.
- **CMIP6 pre-training:** five EC-Earth3 members and five MRI-ESM2-0 members, joining `historical` with SSP2-4.5 trajectories.
- **Forecast benchmark:** ECMWF SEAS5 seasonal forecasts.
- **Observation fine-tuning:** 1980 through mid-2011 in the published configuration.
- **Validation:** 2012 through mid-2017.
- **Held-out testing:** 2018 onward in the paper setup.

The climate-variable channels in the published configuration were:

- near-surface air temperature (`tas`);
- 500 hPa air temperature (`ta500`);
- sea-surface temperature (`tos`);
- downward and upward surface shortwave radiation (`rsds`, `rsus`);
- mean sea-level pressure (`psl`);
- 500 and 250 hPa geopotential height (`zg500`, `zg250`);
- 10 hPa zonal wind (`ua10`);
- near-surface zonal and meridional wind (`uas`, `vas`).

It also used up to 12 months of previous sea-ice concentration, a linear-trend sea-ice forecast, land metadata, and circular month metadata.

Exact published configuration:

- https://raw.githubusercontent.com/tom-andersson/icenet-paper/main/dataloader_configs/2021_06_15_1854_icenet_nature_communications.json

### Data interfaces in the current library

The inspected IceNet library includes interfaces/processors for:

- OSI-SAF sea-ice concentration and masks;
- ERA5 atmospheric and surface reanalysis;
- CMIP6 through ESGF;
- ORAS5 ocean reanalysis, including ocean temperature, salinity, currents, sea-surface height, and mixed-layer thickness;
- ECMWF HRES forecasts;
- ECMWF long-range seasonal forecasts.

CARRA2 is not a built-in named downloader in the inspected source. It can be added through the extensible producer/processor interface or preprocessed externally onto IceNet's grid. Its sea-ice thickness field is a particularly relevant new input that the original IceNet paper explicitly left for future work.

### Local repository audit

Inspected path:

`/home/abhi/code/defence/icenet`

Local facts at inspection time:

- branch: `main`;
- version: `0.2.9`;
- inspected commit: `23743c4814661722dc482494ac338d9b873801c0`, dated 2026-07-01;
- source-tree size: approximately 3.4 MB;
- no downloaded NetCDF/Zarr climate dataset was present;
- no `.h5`, `.keras`, or checkpoint weights were present;
- the `icenet-notebooks` git submodule was not initialized;
- the active `torch` Conda environment did not have IceNet, TensorFlow, or CDS API packages installed;
- local GPU: NVIDIA GeForce GTX 1650 with 4 GB memory, suitable for small demonstrations and inference but not a reproduction of the full 25-member, multi-millennial training campaign.

Relevant local implementations:

- ERA5: `icenet/data/interfaces/cds.py`
- CMIP6: `icenet/data/interfaces/esgf.py`
- ORAS5: `icenet/data/interfaces/cmems.py`
- HRES/seasonal: `icenet/data/interfaces/mars.py`
- U-Net: `icenet/model/models.py`

### Filtering limitation and opportunity

The current U-Net directly emits all configured future sea-ice maps in its output channels. It is not, as written, a complete coupled transition of every atmospheric, oceanic, and sea-ice variable.

For a first reduced-state filtering experiment, IceNet can still be adapted as follows:

1. obtain individual IceNet ensemble-member sea-ice forecasts;
2. treat those fields as a prior ensemble over sea-ice concentration;
3. update the ensemble with OSI-SAF or CARRA2 sea-ice observations;
4. shift the corrected sea-ice field into the lagged input history;
5. issue the next forecast when the next update time arrives.

This is a valid proposed experiment, but it requires an adapter and careful treatment of bounded concentration values. It should not be described as capability already provided by unmodified IceNet.

## GraphCast and GenCast findings

### GraphCast

- GraphCast is a graph-neural-network global **weather** model.
- The published high-resolution system predicts atmospheric and surface weather on a 0.25-degree global grid.
- It takes the previous and current weather state, predicts the state six hours later, and rolls forward autoregressively for medium-range forecasts up to about 10 days.
- This callable one-step structure is process-model-like and naturally compatible with cycling data assimilation for the variables it predicts.
- Its pretrained model is not a six-month Arctic sea-ice predictor and does not directly solve the IcyAlert ice-free-summer problem.

Possible IcyAlert roles:

1. provide short-range predicted atmospheric drivers such as temperature, wind, and pressure;
2. provide a graph-network architecture to retrain or extend for an Arctic coupled state;
3. act as a short-range atmospheric baseline alongside a sea-ice model.

### GenCast

- GenCast is a diffusion-based global **probabilistic weather** model.
- It generates coherent ensembles of weather trajectories, globally at approximately 1 degree, for medium-range forecasts up to about 15 days.
- Its ensemble supplies a distribution and forecast covariance rather than only one future weather path.
- Its pretrained system is not a seasonal sea-ice predictor.

Possible IcyAlert roles:

1. generate multiple plausible atmospheric forcing futures;
2. provide prior uncertainty/covariance for an ensemble filtering experiment over its predicted variables;
3. provide a diffusion-model design pattern for a custom probabilistic Arctic emulator trained on CMIP6/SMILE data.

GraphCast and GenCast do not themselves perform the proposed EnKF update. They provide forecasts or forecast ensembles; an assimilation method remains a separate layer.

Sources:

- https://github.com/google-deepmind/weathernext
- https://deepmind.google/blog/graphcast-ai-model-for-faster-and-more-accurate-global-weather-forecasting/
- https://deepmind.google/research/publications/gencast-learning-skillful-ensemble-forecasting-of-medium-range-weather/

## Current recommendation, recorded as a proposal

For the fastest source-aligned vertical slice:

1. install the current IceNet environment and initialize its notebook submodule;
2. run the small official IceNet demonstration;
3. obtain published pre-trained weights instead of reproducing the full training campaign locally;
4. generate and verify one Arctic sea-ice forecast;
5. expose individual network/member predictions and implement a first reduced-state sea-ice EnKF adapter;
6. compare raw and filtered forecasts across start dates, seasons, and lead times;
7. add CARRA2 thickness and detailed Arctic drivers as a later extension/fine-tuning study;
8. retain GraphCast and GenCast as atmospheric-driver, architectural, ensemble-generation, or comparison candidates rather than assuming their pretrained checkpoints already predict seasonal sea ice.

This proposal makes IceNet the first sea-ice forecast baseline. It does not claim that IceNet is the final IcyAlert model or a full coupled physical process model.
