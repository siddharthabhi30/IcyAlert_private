# Docquier et al. (2022): Arctic Sea Ice, Drivers, and Ensemble-Time LK

## Paper question

Which Arctic climate variables directionally influence sea-ice area/volume, and how does sea ice influence those variables in return?

## Data and variables

The study uses a 50-member EC-Earth3 large ensemble covering historical and future climate. Its analyzed quantities include:

- March or September sea-ice area;
- March or September sea-ice volume;
- Arctic near-surface air temperature;
- Arctic sea-surface temperature;
- total Arctic Ocean heat transport;
- ocean heat transport at 70°N;
- atmospheric heat transport at 70°N;
- Arctic Oscillation index.

“Seven variables” in the paper refers to one sea-ice target plus six accompanying drivers/variables in a given calculation. Sea ice is substituted among March/September area/volume variants; it is not eight simultaneous independent variables in every calculation.

## Two methodologies

### Member analysis

For every ensemble member, the ensemble-mean trajectory is removed to reduce the forced trend. LK is then calculated along that member's long time series. Results are averaged across the 50 members, with combined significance testing.

### Time analysis

The record is divided into five-year blocks. Within each block, the five years from all 50 ensemble members are combined, producing 250 samples per ordinary block. LK is computed separately for each block to obtain an evolving causal curve.

## Covariance source

Member analysis uses time covariance within each member. Time analysis uses covariance across **ensemble members and several years together**. Neither method uses only the 50-member covariance at a single date.

## Main contribution

The paper demonstrates changing two-way relationships among Arctic sea ice, temperature, and heat-transport variables and shows that ensemble pooling can reduce uncertainty from internal variability.

## Relevance to IcyAlert

This is the strongest direct precedent for our ensemble-plus-time LK baseline. It also supplies an Arctic variable set and public reproduction code.

The paper does not imply that T2m/SST are necessarily the “two datasets” mentioned in an email, and it does not describe satellite-to-process-model data assimilation.

## Sources

- DOI: https://doi.org/10.1029/2021GL095892
- Code: https://github.com/ddocquier/Liang_Index/tree/v2.1
- Local source: `paper-dump.md`
