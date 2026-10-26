# Summary

## What this paper does

Docquier et al. quantify two-way causal links between Arctic sea ice and potential drivers using an EC-Earth3 50-member large ensemble. The analyzed variables include March/September sea-ice area or volume, near-surface temperature, winter sea-ice volume, and ocean heat transport measures.

The paper deliberately uses two estimators. In **member analysis**, LK is computed along the time history of each member separately and then averaged across members. In **time analysis**, data from all 50 members are pooled within each five-year block, giving 250 samples per normal block, and LK is recomputed block by block to show temporal evolution.

## What covariance it uses

This is the clearest ensemble-plus-time precedent for IcyAlert. It does not use only the 50 members at one instant. Its dynamic result combines ensemble members **and** several years in each block.

## Why it matters for IcyAlert

It is David Docquier's direct Arctic method and gives a defensible baseline for dynamic LK from SMILE data. The public tagged code reproduces its figures.

## Limitation

Five-year pooling assumes samples in a block can represent one local distribution. It is not online filtering, and the variables are Arctic aggregates rather than a fully coupled grid state.
