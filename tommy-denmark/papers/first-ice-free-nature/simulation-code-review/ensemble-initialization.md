# How the selected sea-ice ensembles are built

Checked 9 October 2026. Companion to the [source-code trace](README.md) and [nine selected runs](rapid-transition-runs.csv).

**These are coupled physical climate simulations, run repeatedly from different model states. Their SSP projections do not continually correct sea ice with incoming satellite observations through a Kalman filter.** The evidence is the experiment methodology, published member metadata and the available engine source, rather than absence of the word “Kalman” in a search.

## Starting states and ensemble members

A pre-industrial control (`piControl`) is a long simulation with fixed pre-industrial forcing. Developers save different states from it, start separate historical simulations, then continue those into future emissions/concentration scenarios. Starting states include the ocean, atmosphere and ice, so the resulting ice trajectories differ even under the same scenario.

| Model used in the nine rapid-loss examples | Historical ensemble initialization | Sea-ice component | Primary evidence |
| --- | --- | --- | --- |
| ACCESS-CM2: r6, r7 | States from control, 50 model years apart; scenarios continue historical runs | CICE5.1.2 | [Experiment methodology, Tables 2–3](https://connectsci.au/es/article/72/2/93/73656/ACCESS-datasets-for-CMIP6-methodology-and); [developer log explicitly covering r6–r10 SSP runs](https://forum.access-hive.org.au/t/access-cm2-ssp-scenario-ensemble-runs/952) |
| CanESM5: r8, r9 | States from control, 50 model years apart | LIM2 in CanNEMO | [Developer paper, Section 3](https://gmd.copernicus.org/articles/12/4823/2019/); member headers below |
| EC-Earth3: r4, r8, r12 | Historical members branched at 20-year control intervals | LIM3 in NEMO | [Developer paper, Section 5](https://gmd.copernicus.org/articles/15/2973/2022/); member headers below |
| MPI-ESM1-2-LR: r38, r43 | States approximately 25 years apart from a 1000-year control; scenarios continue historical runs | MPIOM ocean/ice | [MPI-GE CMIP6, Sections 2.1–2.2](https://doi.org/10.1029/2023MS003790) |

The MPI-GE description specifies MPI-ESM `1.2.01p7`, ECHAM `6.3.05p2`, JSBACH `3.20p1` and MPIOM `1.6.3p4`. It describes 30 members, being extended to 50 for 2024, and daily sea-ice output. This identifies the relevant CMIP6 ensemble methodology; it is not a recovered binary for r38/r43. The older 100-member MPI-GE with CMIP5 forcing is a different ensemble. [Developer paper](https://doi.org/10.1029/2023MS003790).

## Exact published member metadata

Fetched the small OPeNDAP attribute headers (`.das`), without downloading the multi-decade arrays, for all nine selected `SIday/siconc` datasets. Every header declares `parent_experiment_id="historical"`. Saved queries, URLs and errors are in [ensemble-metadata](ensemble-metadata/).

Eight headers declare the same realization number for child and historical parent. **EC-Earth3 SSP245 r12 instead declares historical parent r1.** That is what the published header says; the reason was not established. Do not assume realization labels always map one-to-one. This does not establish an observation-assimilation step. [Saved r12 header](ensemble-metadata/EC-Earth3_r12i1p1f1_ssp245.das).

These are currently accessible published datasets matching the paper's model/member/scenario identifiers. They are not proven to be byte-identical files used by the authors in 2024.

## CanESM: source revision recorded by the selected members

Both r8/r9 headers record `CCCma_model_hash=24718c8346665b218729640ffe79d263b76456c4`, with historical parents `rc3.1-his08` and `rc3.1-his09` and scenario branches on 1 January 2015. [r8 metadata](ensemble-metadata/CanESM5_r8i1p1f1_ssp126.das), [r9 metadata](ensemble-metadata/CanESM5_r9i1p1f1_ssp126.das).

That revision differs from the initially downloaded `v5.0.3` release. Retrieved its [official source revision](https://gitlab.com/cccma/canesm/-/tree/24718c8346665b218729640ffe79d263b76456c4), root tree, configuration and 15 relevant component files at their recorded submodule revisions. [Source pins and checksums](ensemble-metadata/exact-source-files.json).

The resulting execution path is:

1. [canesm.cfg](ensemble-metadata/canesm-exact-member.cfg), SSP126 branch at line 1173: choose greenhouse-gas, aerosol, ozone and land-cover scenario inputs. Lines 1588–1631 select ocean/LIM2, restart initialization and a 3600-second ocean step.
2. [nemogcm.F90](sources/CanESM5-exact-r8-r9/CanNEMO/nemo/NEMO/OPA_SRC/nemogcm.F90), `nemo_gcm`: initialize at line 126; repeat `stp` at line 163.
3. [sbcmod.F90](sources/CanESM5-exact-r8-r9/CanNEMO/nemo/NEMO/OPA_SRC/SBC/sbcmod.F90), line 300: dispatch LIM2.
4. [sbcice_lim_2.F90](sources/CanESM5-exact-r8-r9/CanNEMO/nemo/NEMO/OPA_SRC/SBC/sbcice_lim_2.F90), lines 191–207: calculate ice motion, transport, thermodynamics and heat/salt/mass fluxes.
5. [limthd_lac_2.F90](sources/CanESM5-exact-r8-r9/CanNEMO/nemo/NEMO/LIM_SRC_2/limthd_lac_2.F90), lines 107–149: heat budget changes open-water fraction. [limwri_2.F90](sources/CanESM5-exact-r8-r9/CanNEMO/nemo/NEMO/LIM_SRC_2/limwri_2.F90), line 343: output corresponding ice fraction.

At this source revision, the standard configuration has atmospheric nudging off (`relax=off`, line 183). Its [ocean compile keys](sources/CanESM5-exact-r8-r9/CanNEMO/nemo/CONFIG/CCC_CANCPL_ORCA1_LIM_CMOC/cpp_CCC_CANCPL_ORCA1_LIM_CMOC.fcm) omit `key_asminc`; [asminc.F90](sources/CanESM5-exact-r8-r9/CanNEMO/nemo/NEMO/OPA_SRC/ASM/asminc.F90), lines 53–57, therefore disables that interface. Shipped assimilation increments and ice restoring are also off. This checks source/configuration at the recorded revision; member-specific configuration overrides and binaries were not recovered.

The atmosphere routines at that revision also contain Fourier transforms and numerical filtering. The inspected `core18p.dk`, `ffgfw4.f`, `swaps2f.f` and `tfiltre.f` are byte-identical to those in the earlier release. They operate inside the physical solver; they are not satellite-driven Kalman updates.

## Direct evidence that an ensemble is not automatically EnKF

A separate MPI study explicitly distinguishes its **EnKF-initialized prediction system** from the **uninitialized CMIP6 MPI-GE ensemble**, despite using the same model version. The former uses ocean EnKF/PDAF and atmospheric nudging; the latter supplies the comparison simulations. [Düsterhus et al. (2023), Section 2](https://link.springer.com/article/10.1007/s00382-023-06941-1).

## Sea-ice result for IcyAlert

For each member, retain its daily concentration maps, calculate total ice area and find its first day below the threshold. Compare the resulting dates across members and scenarios, rather than calculating only one date from an ensemble-mean ice map. The nine rapid-loss examples describe selected extreme trajectories; they alone cannot establish the probability of an early ice-free day. [Nature paper and analysis code](https://github.com/cheuze/First_ice_free_day).

Full licensed ACCESS atmosphere, EC-Earth engine and MPI source were not inspected. Their ensemble construction is supported by developer methods and exact member metadata; CanESM additionally has source-level checks. No climate engine was compiled or executed.
