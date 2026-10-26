# Summary

## What this paper does

Docquier et al. compare LKIF with PCMCI on four synthetic models of increasing complexity and a climate application. Both methods remove links that correlation alone would wrongly retain, but their strengths differ.

LKIF performs well for relatively small variable sets and returns signed directional magnitude. PCMCI is often stronger when many variables and lagged conditional relationships must be searched. Results diverge when coupling is nonlinear, delayed, indirect, or affected by omitted variables.

## What data/covariance it uses

The LK side uses ordinary multivariate time-series covariance and derivative covariance with bootstrap significance. This is not a filtering or ensemble-covariance paper.

## Why it matters for IcyAlert

It is a warning against treating one LK graph as unquestionable truth. The project explicitly plans alternative causal methods; this paper gives the team's own evidence for where LK and PCMCI agree or fail.

## Limitation

Neither method universally dominates. Causal results depend on variable selection, lags, sample size, coupling type, and significance procedure.
