# IceNet: local code reading and first experiment

Inspected 2026-09-30. Checkout: `/home/abhi/code/defence/icenet`, commit `23743c4814661722dc482494ac338d9b873801c0`, upstream [icenet-ai/icenet](https://github.com/icenet-ai/icenet). Findings below come from this checkout. No model has been trained or run during this inspection.

## What this code does

It learns to predict **future daily sea-ice concentration** from earlier daily maps. The current network outputs continuous fractions between 0 and 1, using a sigmoid U-Net and weighted MSE. This is a different implementation from the original paper's monthly ice-class forecasts.

The default data source for observed SIC is OSI SAF. ERA5 variables can be added as inputs; CMIP6 can supply simulation datasets. Neither is required by the single-dataset training command. This is forecasting from gridded fields; raw AMSR2 radiances are not part of the traced input path.

## Execution story

| Phase | Actual entry / implementation | What passes to the next phase |
| --- | --- | --- |
| Obtain maps and masks | `icenet_data_sic`; [SICDownloader.download](/home/abhi/code/defence/icenet/icenet/data/sic/osisaf.py:399), `icenet_data_masks` | Daily OSI SAF concentration, converted from percent to fraction; masks and yearly NetCDF files. Downloader uses anonymous FTP and OSI-450/430 archive paths. Live archive access was not tested. |
| Prepare inputs | `icenet_process_sic`; [IceNetOSIPreProcessor](/home/abhi/code/defence/icenet/icenet/data/processors/osi.py:15), [IceNetPreProcessor._save_variable](/home/abhi/code/defence/icenet/icenet/data/process.py:238) | Interpolated SIC fields and `loader.NAME.json`, including selected train/validation/test dates. SIC is excluded from numeric normalization by default. Optional anomalies use training-period monthly means. |
| Add optional features | `icenet_process_metadata`; [IceNetMetaPreProcessor](/home/abhi/code/defence/icenet/icenet/data/processors/meta.py:14) | Land map and sine/cosine of calendar day, stored as input channels. ERA5/CMIP processors are separate optional paths. |
| Construct examples | `icenet_dataset_create`; [create](/home/abhi/code/defence/icenet/icenet/data/loader.py:99), [generate_sample](/home/abhi/code/defence/icenet/icenet/data/loaders/dask.py:361) | Past-field input `x`, future SIC target `y`, and pixel/day weights; saved as TFRecords with `dataset_config.NAME.json`. |
| Read batches | [SplittingMixin.get_split_datasets](/home/abhi/code/defence/icenet/icenet/data/datasets/utils.py:98) | TFRecord decoding, optional training shuffle, batches and prefetch for three predefined splits. |
| Learn | `icenet_train`; [train_model](/home/abhi/code/defence/icenet/icenet/model/train.py:33), [unet_batchnorm](/home/abhi/code/defence/icenet/icenet/model/models.py:49) | Adam updates a CNN U-Net; validation drives checkpointing and early stopping. Saves weights, model and training history. |
| Evaluate | [evaluate_model](/home/abhi/code/defence/icenet/icenet/model/train.py:209) | Per-lead MAE, RMSE and ice/no-ice accuracy. Uses test data when its configured count is positive; otherwise falls back to validation. |
| Forecast and export | `icenet_predict`; [predict_forecast](/home/abhi/code/defence/icenet/icenet/model/predict.py:21), `icenet_output`; [create_cf_output](/home/abhi/code/defence/icenet/icenet/process/predict.py:154) | Loads trained weights, constructs past inputs without future labels, writes `.npy` maps. Export combines network members into NetCDF mean and standard deviation. |

## Master algorithm

```text
download SIC and masks
select separate train, validation, test dates
prepare absolute SIC and any optional features; save loader configuration
for each split and each first-target date t:
    x = configured fields at t-1, t-2, ..., t-L
    y = SIC at t, t+1, ..., t+D-1
    weights = active-ocean masks, with missing target days excluded
    save (x, y, weights) as a training record
initialize U-Net with C input channels and D sigmoid output channels
for each training epoch:
    optimize weighted squared SIC error on training batches
    measure validation errors; checkpoint improvements; check early stopping
save final network; evaluate on test batches when available
for each requested first-target date:
    build x from past fields; run network without gradient updates
    save forecast maps; optionally combine separate network members
```

`generate_sample` implements the date construction; `train_model` calls `network.fit` for batching, gradients and optimizer updates. `predict_forecast` calls the trained network with `training=False`. There is no online weight adaptation in this path.

## Shapes and loss

| Meaning | Code identifier / shape |
| --- | --- |
| Grid | `shape`, default preprocessing grid 432 × 432 |
| Input feature count | `num_channels`: lagged variables plus optional trends/metadata |
| Forecast length | `n_forecast_days`; CLI default 93 |
| Input record | `x`: height × width × channels |
| Target and mask records | `y`, `sample_weights`: height × width × forecast days × 1 |
| Network output | Batch × height × width × forecast days |
| Error | [WeightedMSE](/home/abhi/code/defence/icenet/icenet/model/losses.py:4) scales target and prediction by 100 before squared error |
| Ice-edge metric | [WeightedBinaryAccuracy](/home/abhi/code/defence/icenet/icenet/model/metrics.py:85) thresholds SIC at 0.15 |

Inputs and targets need not contain the same variables. The loader specifically selects `siconca_abs` for its target. With observed OSI SAF data, this is a satellite retrieval estimate; with a CMIP dataset it is simulated SIC. Multiple independently trained networks provide ensemble spread, not an automatically validated probability of an ice-free Arctic.

## Findings to address before evaluation

- **Date mismatch:** [target construction](/home/abhi/code/defence/icenet/icenet/data/loaders/dask.py:399) starts at `t`, but [NetCDF export](/home/abhi/code/defence/icenet/icenet/process/predict.py:218) labels its first output `t+1`. Fix or explicitly reconcile this before scoring forecasts or showing dates.
- **Best checkpoint overwritten:** [checkpoint setup](/home/abhi/code/defence/icenet/icenet/model/train.py:122) saves validation improvements, but [final save](/home/abhi/code/defence/icenet/icenet/model/train.py:200) writes final-epoch weights to the same path. Early stopping does not request restoration of the best weights. Final evaluation therefore does not necessarily use the best validation epoch.
- **Split boundaries:** labels span multiple days after each configured date. Exclude training start dates whose targets reach validation/test periods; the date parser and loader do not automatically enforce this separation.
- **Missing input dates:** `generate_sample` substitutes zeros when a requested input date is unavailable. Confirm the downloaded lag window rather than silently accepting those replacements.
- **Old downloader description:** its docstring says OpenDAP/monthly averages; the actual implementation uses FTP and daily resampling. Check code and provider access before attempting a large download.
- **Grid assumptions:** `sic_interpolate` hardcodes 432 × 432. Reducing network width is a simpler initial resource adjustment than changing this grid.

These are source-inspection findings, not failures reproduced in an end-to-end runtime test. TensorFlow target/prediction shape handling and all download endpoints still need a real sample run.

## What is available locally

- GPU query: NVIDIA GeForce GTX 1650, 4096 MiB total; 3712 MiB free at inspection. Training time and memory use have not been measured.
- Active Python: 3.11.14 in the `torch` environment. TensorFlow, Dask, distributed, Iris and xarray were absent in that interpreter.
- Checkout contains no `.nc` data, JSON configurations, TFRecords or `.h5` weights. Notebook submodule directory is empty.
- [Requirements](/home/abhi/code/defence/icenet/requirements.txt) constrain TensorFlow below 2.16 and NetCDF4 below 1.6.1. Use a separate environment and verify imports before data preparation.
- The supplied tests check entry-point imports; the other test is a placeholder. They do not establish forecast accuracy or validate the scientific pipeline.

## Proposed first experiment — not a reproduced result

1. Establish a separate working environment; download a small real OSI SAF interval and masks. Verify dates, fractions and missing cells.
2. Build a **SIC-only seven-day forecast**: past seven daily maps → next seven daily maps. Use batch size 1 and `--n-filters-factor 0.125` as a starting resource choice; actual fit on the 4 GB GPU must be measured. Training and inference must use the same width.
3. Generate one real batch, check exact input/target dates, run a training step, and compare saved/reloaded predictions. Address the date and checkpoint issues before evaluating.
4. Expand to several years with separate validation and test years. Compare SIC error and ice-edge error against persistence: keeping the last observed map unchanged. A short data interval only checks the pipeline.
5. Extend lead time toward 30–90 days and test forecasts made before summer. Add ERA5 inputs and CMIP pretraining only after the baseline is understood. This does not reproduce the original IceNet paper automatically.
6. For IcyAlert, calculate Arctic sea-ice **area** from predicted concentration times grid-cell area over a defined Arctic mask, then evaluate summer area errors. The first-ice-free threshold and rare-event probabilities require additional validation and climate simulations.

## Reading route and scope

Read `setup.py` → `data/sic/osisaf.py` → `data/processors/osi.py` and `data/process.py` → `data/loaders/dask.py::generate_sample` → `model/models.py` → `model/losses.py` → `model/train.py` → `model/predict.py` → `process/predict.py`.

Secondary: `data/loaders/base.py`, `data/datasets/utils.py`, `model/metrics.py`, `data/processors/meta.py`. Optional ERA5/CMIP processor entry points were inspected; their full download/regridding paths were not traced. Plotting, Azure upload, marine/HRES interfaces and other deployment paths were not audited.
