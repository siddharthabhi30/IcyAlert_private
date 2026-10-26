# First AMSR2 observation sample

- Source: [JAXA sample-data page](https://www.eorc.jaxa.jp/AMSR/resources/), “Level-3, Polar Stereo, North Hemisphere, 10km-grid”.
- Archive: `AMSR2_L3_PNH.tar.gz`; 40,968,015 bytes. Source URL and SHA-256 are recorded in its `.provenance.json` file.
- Date: **1 January 2013**. This is a historical sample, not a current feed test.
- Extracted folder: `brightness-temperatures/`. Seven frequency files for each orbit direction; each file contains H/V measurements: **14 channels per direction**.
- Grid: PS-N, 10 km; arrays 1120 × 760. Kelvin values use the stored `SCALE FACTOR` of approximately 0.01. Special values must be masked before scaling.
- [Inspection results](measurement-inventory.json): file metadata, array shapes, units, scale factors and special-value counts, read using `netCDF4.Dataset`.
- The original archive also includes JAXA retrieved ice-concentration/snow products. Those were not extracted as labels; they are not Chi's MODIS reference data or ERA5.
- **ERA5 downloaded:** [ERA5_SIC_20130101.nc](ERA5_SIC_20130101.nc), all 24 hours of the same date, 50–90°N, 0.25° grid. Variable `siconc` is “Sea ice area fraction”, in the range 0–1. [Request](era5-sic-sample-request.json), [download status/checksum](era5-sic-sample-status.json), [inspection](era5-sic-sample-inspection.json).
- Both sources have matching dates, but **spatial regridding has not been done**. They are not yet an aligned training array. No training or accuracy evaluation has been run.
- `nsidc0802-catalogue-query.json` records a public NASA catalogue check that returned no granules. The recent-data one-day delay is documented in the provider's guide, not established by this catalogue response.
