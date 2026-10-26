# Verified LK Code and Data Entry Points

## Local code snapshots

The following repositories were cloned into `code/` at fixed commits.

### `code/climdyn-lkif`

- Upstream: https://github.com/Climdyn/Liang_Index_climdyn
- Commit: `f9841b0143ddd89ccefe5e1f4bd7f70df4c4f5c6`
- Maintainer: Climdyn/Royal Meteorological Institute of Belgium; code attributed to David Docquier.
- Contains: bivariate `function_liang.py` and multivariate `function_liang_nvar.py`.
- Best use: audited ordinary LK baseline for time-series data.

### `code/docquier-arctic-v2.1`

- Upstream: https://github.com/ddocquier/Liang_Index/tree/v2.1
- Commit: `ede08ca6b143e592570f86ee2741e992ef9663f9`
- Contains: `fig1.py`, `fig2.py`, `fig3-4.py`, and multivariate LK code for Docquier et al. (2022).
- Best use: reproduce member analysis and five-year ensemble-time analysis from the Arctic paper.
- Tagged release: `v2.1`.

### `code/conditioners-lkif`

- Upstream: https://github.com/FareehaSiddique/Conditioners-LKIF
- Commit: `403a47218749efb747d0d5848060cef53a24d0d8`
- Contains: multivariate LK, synthetic toy models, EWMA/UWMA covariance estimators, Bierman/Thornton square-root Kalman routines, and conditioner-analysis notebooks.
- Best use: inspect and reproduce time-varying multivariate LK.
- Caution: accompanies a 2026 preprint and must be audited before reuse.

### `code/liang-causality-python`

- Upstream: https://github.com/dykuang/Liang-Causality
- Commit: `f2462b4fdfa87608580b229a8f4c4f777472ac1b`
- Contains: NumPy and PyTorch multivariate LK estimators plus a synthetic example.
- Best use: independent cross-check against the RMI implementation.
- Caution: useful third-party implementation, not the official code for the IcyAlert papers.

## Important negative finding

No usable public `MtvLK` repository by Feihong Zhou was found. The GitHub profile currently exposes no such code. The Siddique repository is the available implementation that explicitly includes multivariate/time-varying Kalman-based LK components.

## Paper-specific data/code

- Docquier et al. (2022) code release: https://doi.org/10.5281/zenodo.6375655
- RMI LKIF tool page: https://climdyn.meteo.be/research/codes-models-tools/lkif
- Individual papers contain their dataset provenance in their local `paper-dump.md`.

The code repositories were downloaded; large external climate datasets were not duplicated into this paper library.
