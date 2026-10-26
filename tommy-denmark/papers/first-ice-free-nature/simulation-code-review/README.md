# First ice-free day: what the simulations actually run

Checked 9 October 2026. This is a source-code reading, not a reproduced climate simulation.

Follow-up: [ensemble initialization and exact selected-member metadata](ensemble-initialization.md), including CanESM source checks at the revision recorded by r8/r9.

**The selected runs are physics-based climate projections.** They carry atmosphere, ocean, land and ice states forward under prescribed climate scenarios. The Nature paper then reads their saved results and finds when the remaining ice area reaches its threshold.

**Kalman assimilation and Fourier calculations are different things.** A Kalman filter corrects a model using observations. A Fourier transform changes how a field is represented for numerical calculations. Spectral and time filters can also suppress numerical noise inside a physics model. A simulation can therefore use Fourier calculations and still run without observation assimilation.

## 1. Paper code and selected runs

- Paper: Heuzé & Jahn (2024), [The first ice-free day in the Arctic Ocean could occur before 2030](https://doi.org/10.1038/s41467-024-54508-3); [author-hosted full PDF](https://cheuze.com/wp-content/uploads/2024/12/heuzejahn_ncomms_2024.pdf).
- Analysis source: [author GitHub](https://github.com/cheuze/First_ice_free_day), [archived v1.2](https://zenodo.org/records/14030745), [local source](../code/cheuze-First_ice_free_day-c4bbc8f/README.md).
- The local inner ZIP matches Zenodo's published MD5: `ebd4d494a979e2f7e3c99651df5e6ca3`. The outer `14030745.zip` is a container for that ZIP.

The study screens 29 models, retains 11 and analyses 366 scenario runs. It uses historical September ice area and the timing of the annual minimum to screen models. It then examines nine rapid-loss runs in detail. These are two separate selection stages, not a search for the best daily weather forecast. [Methods](https://cheuze.com/wp-content/uploads/2024/12/heuzejahn_ncomms_2024.pdf).

The nine runs below are read directly from the authors' [ChosenOnes.xlsx](../code/cheuze-First_ice_free_day-c4bbc8f/ChosenOnes.xlsx). Years are the difference between its `YearFree` and `Year2023` columns.

| Model | Member | Scenario | Years from 2023-equivalent ice area to first ice-free day |
| --- | --- | --- | --- |
| ACCESS-CM2 | r6i1p1f1 | SSP3-7.0 | 6 |
| ACCESS-CM2 | r7i1p1f1 | SSP1-2.6 | 4 |
| CanESM5 | r8i1p1f1 | SSP1-2.6 | 4 |
| CanESM5 | r9i1p1f1 | SSP1-2.6 | 6 |
| EC-Earth3 | r4i1p1f1 | SSP1-2.6 | 3 |
| EC-Earth3 | r8i1p1f1 | SSP1-2.6 | 5 |
| EC-Earth3 | r12i1p1f1 | SSP2-4.5 | 5 |
| MPI-ESM1-2-LR | r38i1p1f1 | SSP3-7.0 | 6 |
| MPI-ESM1-2-LR | r43i1p1f1 | SSP2-4.5 | 6 |

The 11-model list is in [Models_v1.xlsx](../code/cheuze-First_ice_free_day-c4bbc8f/Models_v1.xlsx), exported here as [retained-models.csv](retained-models.csv). The nine complete spreadsheet rows are exported as [rapid-transition-runs.csv](rapid-transition-runs.csv).

**“2023-equivalent” does not mean initialized with actual 2023 weather.** The analysis identifies a simulated year whose annual minimum ice area meets the observed 2023 reference, then counts forward. Spreadsheet calendar years belong to model trajectories; they are not forecasts of the observed weather in those individual years. [Methods](https://cheuze.com/wp-content/uploads/2024/12/heuzejahn_ncomms_2024.pdf).

### What the analysis scripts do

This is faithful pseudocode for the main data path; the MATLAB scripts are separate analysis stages.

```text
Read already-simulated daily ice concentration and grid-cell areas.
For each day, sum cell area × ice fraction over the selected northern domain.
Find the first day with total ice area <= 1,000,000 km².
Find the last annual minimum meeting the 2023 reference of 3,390,000 km².
Count the years between these two points.
For selected rapid transitions, inspect simulated ice mass,
temperature and pressure to describe the events leading to ice loss.
```

Code mapping:

- [compute_SIA_SIE_daily.m](../code/cheuze-First_ice_free_day-c4bbc8f/compute_SIA_SIE_daily.m), lines 57–86: reads `siconc`, converts percent to fraction, selects latitude >= 30°N, and calculates `SIA`. It separately calculates `SIE` with a 15% threshold. The ice-free test uses **area**, not extent.
- [detect_firsticefreeday.m](../code/cheuze-First_ice_free_day-c4bbc8f/detect_firsticefreeday.m), lines 83–90: `find(T.SIA<=1E12,1,'first')`; input area is in square metres. This stage stores the crossing year.
- [detect_2023.m](../code/cheuze-First_ice_free_day-c4bbc8f/detect_2023.m), lines 93–109: annual minima, then the last minimum >= `3.39E12`.
- [Historical-evaluation notebook](../code/cheuze-First_ice_free_day-c4bbc8f/Process_and_evaluate_daily_CMIP6_SIA_SIE_clean_for_resubmission.ipynb): loads existing historical output and NOAA/NSIDC records, handles calendars, compares historical statistics and specifies selected models/members.
- [storyline_atmosphere_anomalies.m](../code/cheuze-First_ice_free_day-c4bbc8f/storyline_atmosphere_anomalies.m) and the `RILE_test_*` notebooks analyse the selected trajectories. They are not the atmosphere/ocean engines.

There is no neural-network training or Kalman update in this traced analysis path. Historical observations screen the results; they are not repeatedly fed into these scripts to correct the simulated future state.

## 2. Actual engine source: CanESM5

**This is the strongest directly inspectable example among the four rapid-transition models.** The developers identify release `v5.0.3` as the source release capable of producing their CMIP6 submissions. I downloaded its super-repository and all five pinned submodules. [Developer code-availability statement](https://gmd.copernicus.org/articles/12/4823/2019/#section11), [official release](https://gitlab.com/cccma/canesm/-/tree/v5.0.3).

The components are CanAM5 for atmosphere/land, CanNEMO for ocean/ice and CanCPL for exchanges between them. The released ocean configuration uses LIM2 sea ice. These are compiled physical models, not neural networks.

### Setup → state → repeated steps → saved output

The [running instructions](sources/CanESM5/Running_readme.md) describe `setup-canesm`, editing `canesm.cfg`, compiling executables, loading restart files and submitting a job. These scripts target ECCC's computers; downloading the source does not make it a ready-to-run laptop installation.

The concrete SSP1-2.6 branch in [canesm.cfg](sources/CanESM5/CONFIG/ESM/canesm.cfg), lines 1543–1566, chooses scenario files for greenhouse gases, aerosols, ozone, land cover and solar forcing. Lines 2179–2223 select the ocean/ice configuration, restart-based initialization and a 3600-second ocean time step. These inputs describe a climate scenario and starting model state; they are not live satellite radiances.

The following joins the inspected drivers conceptually. Atmosphere and ocean are separate processes coordinated by coupling events, not one Python-style serial loop.

```text
Load configuration, grids, forcing files and restart states.
Initialize atmosphere, ocean, sea ice and coupling clocks.

Until the requested end time:
    Advance the atmosphere with dynamics and physical tendencies.
    Exchange atmosphere/ocean/ice fields at scheduled coupling times.

    For each ocean time step:
        Receive surface forcing and advance the sea-ice model:
            calculate ice motion;
            transport ice;
            calculate freezing/melting and changed ice coverage;
            return heat, freshwater and salt fluxes to the ocean.
        Calculate ocean temperature/salinity tendencies and advance them.
        Calculate ocean momentum tendencies and advance velocities.
        Send required surface fields back through the coupler.

    Write configured diagnostic/history output and restart states.
```

Actual implementation links:

1. **Atmosphere:** [gcm18.dk](sources/CanAM5/lsmod/agcm/gcm18/gcm18.dk), `PROGRAM GCM18`. Initialization calls `INGCM12` at line 1367. The coupled loop starts at 3052; the time-step loop at label `200`, line 3277. Physics calls `CORE18P` at 4912. `GCMTYM2X` advances the clock at 5345, and line 5434 repeats until `KOUNT` reaches `KTOTAL`. `COUPLER_OUT` sends surface fluxes/fields before the next coupling interval. The `.dk` file is legacy source-deck format used to generate Fortran, not a notebook.
2. **Coupling:** [cpl_main.F90](sources/CanCPL/src/drivers/cpl_main.F90), `TIME_LOOP` at 412 and `execute_event` at 776. Scheduled events call `transfer_data`: receive fields, optionally remap grids (`regrid_field`, line 1229), store/send them. Its job is exchanging model fields, not fitting an observation correction.
3. **Ocean loop:** [nemogcm.F90](sources/CanNEMO/nemo/NEMO/OPA_SRC/nemogcm.F90), `nemo_gcm`, lines 126–165: initialize, then repeatedly call `stp(istp)` until the end step or an error.
4. **Ocean step:** [step.F90](sources/CanNEMO/nemo/NEMO/OPA_SRC/step.F90), `stp`: `sbc` at 98, temperature/salinity advection and mixing at 191–216, momentum terms at 230–241, and coupled field sending at 279. The prognostic temperature/salinity and velocity arrays persist between steps.
5. **Ice dispatch:** [sbcmod.F90](sources/CanNEMO/nemo/NEMO/OPA_SRC/SBC/sbcmod.F90), line 308 chooses `sbc_ice_lim_2` for `nn_ice=2`.
6. **Ice step:** [sbcice_lim_2.F90](sources/CanNEMO/nemo/NEMO/OPA_SRC/SBC/sbcice_lim_2.F90), lines 203–227: `lim_dyn_2`, `lim_trp_2`, `lim_thd_2`, then `lim_sbc_flx_2`. These calculate ice dynamics, transport, thermodynamics and ocean surface fluxes.
7. **A real ice-fraction change:** [limthd_lac_2.F90](sources/CanNEMO/nemo/NEMO/LIM_SRC_2/limthd_lac_2.F90), `lim_thd_lac_2`, lines 107–149. The routine calculates the open-water heat budget, converts it into a change in open-water fraction and writes the new `frld_1d`. This is physical freezing, not an observation update. After hemisphere bookkeeping, `frld` represents open-water fraction; [limwri_2.F90](sources/CanNEMO/nemo/NEMO/LIM_SRC_2/limwri_2.F90), line 343, writes the corresponding ice fraction as `1.-frld`. This legacy output path is not itself the complete CMIP6 export pipeline.

### Kalman/assimilation check

The released SSP configuration has **atmospheric nudging off**: `relax=off` in `canesm.cfg`, line 264. A separate historical-nudging experiment enables it; that is a different branch.

For ocean assimilation, the selected [compile-key file](sources/CanNEMO/nemo/CONFIG/CCC_CANCPL_ORCA1_LIM_CMOC/cpp_CCC_CANCPL_ORCA1_LIM_CMOC.fcm) contains no `key_asminc`. In [asminc.F90](sources/CanNEMO/nemo/NEMO/OPA_SRC/ASM/asminc.F90), lines 53–57, absence of that key sets `lk_asminc=.FALSE.`. The shipped [namelist](sources/CanNEMO/nemo/CONFIG/CCC_CANCPL_ORCA1_LIM_CMOC/EXP00/namelist), lines 951–966, also disables tracer, velocity, sea-level and assimilation-forcing increments. [namelist_ice](sources/CanNEMO/nemo/CONFIG/CCC_CANCPL_ORCA1_LIM_CMOC/EXP00/namelist_ice), line 18, disables ice restoring.

**Conclusion supported by these files:** the inspected standard CanESM5 SSP setup advances the coupled physics without these observation-assimilation updates. Optional assimilation code existing elsewhere in NEMO does not show it was used here. The [follow-up](ensemble-initialization.md) retrieves the source revision recorded in published r8/r9 output and checks the relevant files there too. Member-specific configuration overrides and binaries remain unavailable; this is not bit-for-bit verification of those jobs.

### Fourier and numerical-filter check

- [core18p.dk](sources/CanAM5/lsmod/agcm/gcm18/core18p.dk), lines 369 and 899, calls `FOURF` and `FOURB` to move between Fourier and grid representations.
- [ffgfw4.f](sources/CanAM5/lssub/model/agcm/gcm18/trans/ffgfw4.f), lines 45–65, zeroes coefficients beyond the wave-number truncation and calls the FFT routine `VFFT3`.
- [swaps2f.f](sources/CanAM5/lssub/model/agcm/gcm18/trans/swaps2f.f), lines 23–40, multiplies spectral coefficients by `HOSKF`: a Hoskins spectral-filter path. Its strengths come from input coefficients; I have not recovered the exact coefficients for r8/r9.
- [tfiltre.f](sources/CanAM5/lssub/model/agcm/gcm18/modl/tfiltre.f) applies the Robert numerical time filter. Its call in `gcm18.dk`, lines 5284–5288, is conditional on the time-stepping state. It operates on model fields at neighbouring time levels, not satellite observations.

Therefore “physics simulation” and “uses Fourier/numerical filters” are both compatible descriptions. Neither makes this an observation-assimilating Kalman system.

## 3. What could be inspected for the other three models

| Model | Physical components | Actual source inspected | Boundary of the check |
| --- | --- | --- | --- |
| ACCESS-CM2 | UM atmosphere, CABLE land, MOM5 ocean, CICE5.1.2 ice | Public CICE5 fork and MOM5 driver files | Related component code, not the exact CMIP6 r6/r7 build; UM is licensed |
| EC-Earth3 | IFS atmosphere, HTESSEL land, NEMO ocean, LIM3 ice | Public runtime/container files | Launch/setup code, not full model internals; full source access requires permission |
| MPI-ESM1-2-LR | ECHAM6.3 atmosphere, JSBACH land, MPIOM ocean/ice | Model documentation and older ECHAM6 user-guide code descriptions | Full source not obtained; download page redirects to login |

### ACCESS-CM2: physical ice code, with a version boundary

The [ACCESS-CM2 methods paper](https://connectsci.au/es/article/70/1/225/73456/Configuration-and-spin-up-of-ACCESS-CM2-the-new) identifies CICE5.1.2 and MOM5. The related [ACCESS-OM2 methods paper](https://gmd.copernicus.org/articles/13/401/2020/) links the public COSIMA CICE5 fork. This establishes component provenance; it does **not** establish that its current ACCESS driver is identical to the Nature paper's CM2 jobs.

In that downloaded fork, [CICE.F90](sources/ACCESS-CICE5/drivers/access/CICE.F90), lines 44–56, initializes, runs and finalizes the ice model. [CICE_RunMod.F90](sources/ACCESS-CICE5/drivers/access/CICE_RunMod.F90), lines 184–192, receives surface boundary fields and calls `ice_step`. Lines 419–456 call thermodynamics, dynamics, radiation and preparation of coupling fields.

[ice_step_mod.F90](sources/ACCESS-CICE5/source/ice_step_mod.F90) follows those calls into vertical thermodynamics (line 513), lateral melting (931), ice stress/dynamics (1119), advection (1127–1129) and ridging (1141). [ice_itd.F90](sources/ACCESS-CICE5/source/ice_itd.F90), line 343, sums category areas into `aice`, the total ice fraction. This is concrete code for evolving physical ice coverage.

The public [MOM5 driver](sources/ACCESS-MOM5/ocean_model.F90) also contains an **optional** ocean-assimilation branch guarded by `ENABLE_ODA` (lines 2022–2071). This is why finding “assimilation” somewhere in an engine is insufficient. I did not obtain the chosen CM2 jobs' compile flags. The [Met Office states that UM requires a licence](https://www.metoffice.gov.uk/research/approach/modelling-systems/unified-model), so its complete atmosphere source was not inspected.

### EC-Earth3: checked wrapper, restricted full engine

The downloaded [ece-esm.sh.tmpl](sources/EC-Earth3-public-runtime/ece-esm.sh.tmpl) generates component namelists and launches IFS/NEMO executables (`launch $cmd`, line 1377). The [container recipe](sources/EC-Earth3-public-runtime/Dockerfile.ecearth3), line 38, requires a separately supplied `ec-earth.tar`. It does not contain the engine source. Its [README](sources/EC-Earth3-public-runtime/Readme.md), line 73, says the demonstration uses IFS+AMIP; this is not a reproduced selected SSP run.

The [developer model description](https://gmd.copernicus.org/articles/15/2973/2022/) specifies IFS CY36R4 solving physical atmospheric equations, with spectral derivatives and grid-space nonlinear calculations. Its code-availability section explains the full-source access and ECMWF licence restriction. I could inspect the public wrapper, but cannot claim to have traced its full IFS or LIM3 internals.

### MPI-ESM: source access genuinely requires registration

The [MPI-ESM1.2 developer paper](https://doi.org/10.1029/2018MS001400) identifies ECHAM6.3, JSBACH3.2, MPIOM1.6 and OASIS3-MCT. The [MPI source-download page](https://code.mpimet.mpg.de/projects/mpi-esm-users/files) redirected to login when checked. The [licence page](https://code.mpimet.mpg.de/projects/mpi-esm-license) requires registration and licence acceptance.

The public [ECHAM6 model manual](https://pure.mpg.de/pubman/item/item_1810480_15/component/file_1810481/WEB_BzE_135.pdf), sections 2.1.2–2.1.4, documents spectral/Fourier calculations and an Asselin time filter. These are numerical methods in the atmosphere engine. The downloaded [older ECHAM6 user guide](docs/echam6-userguide.pdf) is explicitly version 6.1.00, dated 22 February 2012; it is supporting documentation, **not** the selected MPI-ESM1.2 source.

The [follow-up](ensemble-initialization.md) checks the MPI-GE CMIP6 developers' ensemble methodology and a direct comparison with a separate EnKF-initialized experiment. This supports identifying the selected MPI runs as uninitialized climate projections. I have not source-audited their exact numerical-filter settings or every optional branch of the licensed code.

## 4. What this means for IcyAlert

CMIP6 is a coordinated collection of model experiments and results, not one executable. Its [ScenarioMIP protocol](https://gmd.copernicus.org/articles/9/3461/2016/) defines future climate scenarios. In the runs studied here, the useful distinction is:

```text
Existing model state + prescribed future scenario
    → repeated atmosphere/ocean/ice physics
    → simulated daily ice concentration
    → the paper's area calculation and threshold crossing.
```

An ensemble here means multiple model trajectories; it does not imply an ensemble Kalman filter. Observations can support initialization, tuning or historical evaluation without being assimilated every time step. For example, the CanESM5 model description reports ocean climatology at the beginning of a long spin-up, followed by control/historical runs; it does not start each scenario day from a satellite ice map.

A separate [ECMWF seasonal-prediction example](https://www.ecmwf.int/en/newsletter/154/meteorology/using-ec-earth-climate-prediction-research) does use a sea-ice reanalysis made with an ensemble Kalman filter for initialization. That is a different experiment from the selected SSP projections; an engine's use in one does not prove use in the other.

**For reading a selected simulation engine next, start with CanESM5:** its relevant release source is public, and the direct ice update can be followed from `nemo_gcm` → `stp` → `sbc` → `sbc_ice_lim_2` → `lim_thd_2` → `lim_thd_lac_2`. Begin with the loop, then the ice-fraction calculation, then atmosphere/coupler details.

## 5. Verification and remaining limits

- Verified the analysis archive checksum, all nine spreadsheet rows and their elapsed years; cross-checked the paper's Table 1. The downloaded source pins and file hashes are in [source-manifest.json](source-manifest.json), with a complete [file checksum list](source-file-sha256.txt).
- CanESM5 source versions are pinned by the release's actual Git submodule entries. Public ACCESS and EC-Earth component/wrapper versions are separately pinned, without claiming exact member-build identity.
- **A reproducibility detail needs checking before rerunning model selection:** the Methods say minimum **SIA** timing, while the released evaluation notebook's cells 12 and 16 calculate spread/check bounds using `SIE_min_day`. Both variables exist in cell 10. I did not execute this notebook with its historical input files or determine whether this changes the retained models. The nine-run spreadsheet is nevertheless explicit.
- No engine was compiled or run; no complete original CMIP6 input/restart package or member-specific binary was obtained. Downloaded source is organized for inspection, not as an executable configured checkout; archive symlinks were not reconstructed. These limits matter for reproducing exact trajectories, not for recognizing the inspected physical time-step calculations.
- Full source inspection remains unavailable for licensed UM, full EC-Earth3 and MPI-ESM. Their internals are distinguished from directly inspected code throughout this report.
