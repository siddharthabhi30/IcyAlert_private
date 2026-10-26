# AMSR2 measurements → same-day sea-ice concentration

Checked 30 September 2026. SIC means the fraction of an ocean patch covered by sea ice.

**Executed 1 October 2026:** [real AMSR2 → DMI/CIS chart-SIC experiment](../../papers/auto-ice/data/retrieval-check/README.md), with ViT/U-Net code, input-availability masks, checkpoints and test results. The ERA5 experiment below remains an earlier proposal, not the target used in these runs.

## Published retrievals

| Paper | Measurements and other inputs | Training targets |
|---|---|---|
| [Chi et al. (2019)](https://doi.org/10.1016/j.rse.2019.05.023), §§2.1–2.2, 3.4 | 14 AMSR2 microwave brightness temperatures; JAXA daily Level-3, 10 km polar grid | Ice fraction calculated from MODIS/Terra MOD09GA optical images using spectral unmixing |
| [Han et al. (2021)](https://repository.kopri.re.kr/handle/201206/12980) | AMSR2 temperatures and channel ratios, plus ERA5 water vapour, wind and air temperatures; random forest | Ice fraction calculated from KOMPSAT-5 radar images, July–September 2015–2017 |
| [Wulf et al. (2024)](https://tc.copernicus.org/articles/18/5277/2024/), §§2–3 | Sentinel-1 HH/HV radar images plus AMSR2 brightness temperatures; convolutional network | Concentrations assigned to regions in DMI/CIS ice charts |
| [Ma et al. (2024)](https://www.researchgate.net/publication/386217286_Multi-Task_Retrieval_of_Sea_Ice_Based_on_GNSS-R_An_Integrated_Framework_Guided_by_Semi-Supervised_Anomaly_Detection), §II.B and §III.C | TechDemoSat-1 GNSS reflections represented as delay-Doppler maps; neural retrieval | ERA5 sea-ice cover matched by observation location/time; SIC retrieval trained with mean squared error |

ERA5 is an **input**, not the SIC training target, in Han. Ma provides explicit provenance for using ERA5 SIC as a satellite-retrieval target, with a different measurement type. An exact published **AMSR2 → ERA5-SIC** training recipe was not located.

## Chi: what evaluation data actually exist?

- Publication year: **2019**. Training: **72 April–September 2016 image mosaics**; evaluation: **72 April–September 2017 mosaics**, §3.4. This is not a 2019 evaluation dataset.
- The authors calculated their reference concentrations from MODIS images. These are estimates from another sensor, not direct measurements of every patch of ice.
- [Paper PDF](../../papers/amsr2-chi-2019/paper.pdf); [institutional source](https://repository.kopri.re.kr/bitstream/201206/10919/1/2019-0107.pdf).
- Source images: [NASA MOD09GA](https://ladsweb.modaps.eosdis.nasa.gov/missions-and-measurements/products/MOD09GA). Downloading images alone does **not** provide the authors' calculated SIC labels.
- No author-released code or downloadable package of the exact paired labels was located in the paper or publisher/institutional records searched. Recreating those labels would require implementing their image processing; exact reproduction is not yet verified.

## Observation access

- **Full-channel option:** [JAXA AMSR2 brightness temperatures](https://www.eorc.jaxa.jp/AMSR/datacatalog/tb/index_en.html), July 2012 onward. Daily Level-3 is gridded measurement data, not an ice-concentration product. Full downloads require G-Portal registration.
- [JAXA's official sample files](https://www.eorc.jaxa.jp/AMSR/resources/): North Hemisphere, 10 km Level-3 archive. Local download and inventory: [sample directory](../../papers/amsr2-chi-2019/data/). This is a format/observation sample, not a labelled training dataset.
- **Downloaded and inspected:** 1 January 2013; seven frequency files per ascending/descending pass, each containing H/V brightness temperatures. Arrays are 1120 × 760; units K; stored integers have scale factor 0.01. [File inventory](../../papers/amsr2-chi-2019/data/measurement-inventory.json). The archive also contains separate retrieved SIC products; they were not extracted as training labels.
- **Recent-data alternative:** [NSIDC-0802 v2](https://nsidc.org/data/nsidc-0802/versions/2), January 2023 onward, 25 km NetCDF. It has **five channels**, not Chi's fourteen. Its [user guide, §1.5.2](https://nsidc.org/sites/default/files/documents/user-guide/nsidc-0802-v002-userguide.pdf) states daily updates with a one-day lag. Download requires Earthdata login. Changing to this product requires matching historical inputs and checking calibration, grid and channel differences.
- [JAXA's September 2026 notice](https://gportal.jaxa.jp/gpr/notice/notice/view/1497?lang=en): standard products continue; Level-1 delivery is now four batches/day; Level-3 timing is unchanged. This notice does not establish the Level-3 delivery delay.

## Proposed first experiment

1. Inspect a real AMSR2 measurement file; confirm channels, units, valid-pixel masks and coordinates.
2. Pair historical AMSR2 measurements with ERA5 SIC for corresponding dates and places, on a common grid. Train a small DNN to estimate SIC from measurements alone. **This ERA5 target is our proposed adaptation.**
3. If testing against 2018–2021 ice charts, exclude those years from training and tuning. Aggregate predictions over each chart region before comparing its assigned concentration; a chart region is not an independently measured label at every image pixel.
4. Compare against established AMSR2 retrievals, such as [Bremen ASI](https://seaice.uni-bremen.de/sea-ice-concentration/amsre-amsr2/), on the same dates and regions. Agreement with ERA5 alone cannot establish greater accuracy than ERA5.

**Started:** AMSR2 and [ERA5 SIC](../../papers/amsr2-chi-2019/data/ERA5_SIC_20130101.nc) are downloaded for 1 January 2013 and inspected. [Download/inspection details](../../papers/amsr2-chi-2019/data/README.md). Next: align grids and masks. One day is a pipeline check, not a training/evaluation dataset.

**Why ERA5 needs care:** [Copernicus documentation](https://climate.copernicus.eu/ESOTC/2019/sea-ice), “Data sources and processing”, says its SIC comes from external OSI SAF satellite products, with regridding and removal of concentrations below 15%. ERA5 is an available reference target, not independent ground truth; its processing can affect low-concentration ice near the ice edge.

**2018–2019 reference option:** Wulf identifies 461 samples in [AI4Arctic/ASIP version 2](https://doi.org/10.11583/DTU.13011134.v3), with Sentinel-1, AMSR2 and DMI charts. Wulf's extended 2018–2021 ASIDv2+ is a different dataset; the paper says its release was planned, not already available. The [AI4Arctic challenge dataset](https://doi.org/10.11583/DTU.21316608.v3) is another public collection: verify its scene dates and grid before selecting evaluation samples. Do not equate the three datasets.
