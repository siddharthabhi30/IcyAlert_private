# Summary

## What this paper establishes

This is the broad first-principles theory paper. It derives information flow for deterministic and stochastic continuous systems and discrete mappings. Its central result is the principle of nil causality as a theorem: when the evolution law of (X_i) is independent of (X_j), information flow from (X_j) to (X_i) is zero.

For linear systems it also shows analytically why causation implies correlation within this framework, while correlation alone does not establish causation. The paper validates the formulas on several benchmark dynamical systems.

## What data/covariance it uses

The main contribution is theoretical and assumes the underlying dynamics/probability law. The practical linear time-series formulas appear as consequences, but this paper is not an EnKF or rolling-window method.

## Why it matters for IcyAlert

Use it as provenance for the physical meaning and the nil-causality test. A synthetic process model with (a_{21}=0) is therefore a valid directional benchmark: a correct estimator should recover (T_{1\rightarrow2}=0) within sampling error.

## Limitation

The theorem does not guarantee correct causal recovery from short, filtered, nonstationary, or incompletely observed data.
