# Curated Liang–Kleeman Library for IcyAlert

## Purpose

This library answers one practical question: **what covariance/statistical distribution is each LK paper actually using, and how does that connect to IcyAlert filtering?**

Each numbered folder contains:

- `paper.pdf` when an accessible full PDF was verified;
- `paper-dump.md`, extracted from that PDF with `pdftotext -layout`;
- `summary.md`, focused on method, covariance source, IcyAlert relevance, and limitations.

Two papers have complete text dumps but no local PDF because their institutional/publisher endpoints returned HTTP 403. See `DOWNLOAD-REPORT.md`.

## The answer from the literature

The papers do **not** establish one universal covariance for LK. They support four distinct estimators:

1. **Long time-series covariance:** ordinary Liang (2014/2021), Vannitsem (2019), and most climate applications.
2. **Rolling/block time covariance:** Lu (2022) uses a rolling window; Docquier (2022) pools ensemble members within five-year blocks.
3. **Sequential time-varying statistical covariance:** Hagan (2019) and Zhou (2024) use a square-root Kalman filter to track the LK statistics. This filter is part of the causality estimator, not a weather-state EnKF.
4. **Transient ensemble distribution:** Pires (2024) permits a time-evolving ensemble as a representation of the transient probability density. It does not say that an EnKF posterior covariance alone is always the correct physical-causality covariance.

Wang (2025) takes a fifth, downstream route: calculate LK from a long pre-assimilation time series, freeze it, and use it to localize an ensemble filter.

## Read these first

1. **06 Vannitsem 2019** — the exact two-variable benchmark requested by Stéphane.
2. **15 Docquier 2022** — the IcyAlert team's ensemble-across-time Arctic precedent.
3. **07 Hagan 2019** — bivariate time-varying LK with a square-root Kalman estimator.
4. **08 Zhou 2024** — multivariate time-varying LK and explicit (Q(t),R(t)) construction.
5. **09 Pires 2024** — nonlinear theory and the distinction between long trajectories and transient ensembles.
6. **17 Docquier 2024 CMIP6** — the most direct driver/variable/SMILE blueprint for IcyAlert.
7. **20 Wang 2025** — historical spatial LK used to improve filter localization.
8. **12 Siddique 2026** — conditioners/confounders plus the most useful public time-varying LK code.
9. **10 Vannitsem–Pires–Docquier 2024** — the 12-variable nonlinear atmospheric benchmark.

## Foundation track

| Folder | Paper | Ownership outcome |
|---|---|---|
| `01-liang-kleeman-2005` | Liang & Kleeman (2005) | Understand the entropy decomposition and directional transfer definition. |
| `02-liang-2014` | Liang (2014) | Derive and implement ordinary bivariate LK from a time series. |
| `03-liang-2015` | Liang (2015) | Distinguish absolute flow from normalized importance. |
| `04-liang-2016` | Liang (2016) | Understand the nil-causality theorem and theoretical scope. |
| `05-liang-2021` | Liang (2021) | Compute conditioned multivariate LK and causal graphs. |

## Dynamic, ensemble, and nonlinear track

| Folder | Paper | Ownership outcome |
|---|---|---|
| `06-vannitsem-2019` | Vannitsem et al. (2019) | Reproduce the analytical two-variable reference. |
| `07-hagan-2019` | Hagan et al. (2019) | Explain how TvLK sequentially tracks covariance statistics. |
| `08-zhou-2024` | Zhou et al. (2024) | Explain MtvLK and how offline EWMA/UWMA estimates enter (Q,R). |
| `09-pires-2024` | Pires et al. (2024) | Separate stationary-trajectory from transient-ensemble information transfer. |
| `10-vannitsem-pires-docquier-2024` | Vannitsem et al. (2024) | Move from two variables to the nonlinear 12-variable benchmark. |
| `11-lien-2025` | Lien et al. (2025) | Understand an LIM/colored-noise alternative built from lagged covariance. |
| `12-siddique-2026` | Siddique et al. (2026) | Test how mediators/confounders alter time-varying LK. |

## Application and spatial track

| Folder | Paper | Ownership outcome |
|---|---|---|
| `13-wang-2020` | Wang et al. (2020) | Distinguish spatially mapped/multiscale time-series LK from grid covariance. |
| `14-lu-2022` | Lu et al. (2022) | Verify published rolling-window dynamic LK. |
| `15-docquier-2022` | Docquier et al. (2022) | Understand member analysis versus five-year ensemble-time analysis. |
| `16-docquier-2023` | Docquier et al. (2023) | See local gridded LK maps with SST, SST tendency, and heat flux. |
| `17-docquier-2024-cmip6` | Docquier et al. (2024) | Identify IcyAlert-relevant Arctic drivers and SMILE use. |
| `18-docquier-2024-methods` | Docquier et al. (2024) | Know when LKIF and PCMCI agree or fail. |
| `19-lv-2025` | Lv et al. (2025) | Obtain observational sea-ice/ocean heat-source variables. |
| `20-wang-2025-localization` | Wang et al. (2025) | Use historical spatial LK as fixed DA localization. |

## What this means for the next experiment

The original EnKF experiment was useful, but it answered a narrower question: **what happens if LK is calculated from the current physical-state analysis ensemble?** Low observation noise contracts the posterior covariance and can change the derived LK. The literature does not require that posterior covariance to preserve the stationary process-model value.

The next controlled comparison should keep the same known two-variable system and compare:

1. long time-series LK;
2. rolling-window LK;
3. Hagan/Zhou sequential time-varying LK;
4. ensemble-plus-time block LK modeled on Docquier (2022);
5. current forecast and analysis ensemble LK, retained as experimental baselines.

Only after that comparison should the project move to the 12-variable model and then to CMIP6/SMILE Arctic variables.

## Known gaps

- No verified public repository was found for the original Hagan/Zhou MtvLK authors. Do not cite the nonexistent `FeihongZhou/MtvLK` repository.
- Two PDFs still require manual download; their complete text dumps and summaries are present.
- The papers do not settle an optimal way to combine ensemble and temporal covariance. That remains a method-design question.
- High-dimensional grid covariance, localization, variable selection, and significance testing remain separate problems.

## Supporting files

- `CODE-AND-DATA.md` — verified local code repositories and what each implements.
- `DOWNLOAD-REPORT.md` — PDF provenance and verification status.
- `SOURCES.tsv` — machine-readable paper manifest.
- `pdf-audit.tsv` — pages, bytes, and extraction status.
