# Liang (2016): Information Flow and Causality from First Principles

## Paper question

Can information flow and its connection to causality be derived from dynamical-system theory rather than introduced as an assumed statistical score?

## Methodology

Liang starts from a state probability density ρ(x,t). For deterministic dynamics, its evolution is governed by the Liouville equation; for stochastic dynamics, by the Fokker–Planck equation. He derives the entropy change of a target component and separates the portion produced by another component.

The derivations cover:

- continuous and discrete systems;
- deterministic and stochastic dynamics;
- two-variable and multivariable settings;
- benchmark maps and chaotic systems.

The most important theorem is the **principle of nil causality**: if the evolution equation of Xi is independent of Xj, the information flow from Xj to Xi is zero. For linear systems, the resulting expression also shows that a causal coupling produces correlation, while correlation alone does not prove a causal coupling.

## What “transient probability density” means here

The theoretical density ρ(x,t) can evolve with time; the first-principles derivation is not restricted to a stationary density. Therefore transient information transfer is meaningful in the theory when the evolving distribution and dynamics are known.

This does **not**, by itself, prove that forecast covariance Pf or analysis covariance Pa from an EnKF is the correct replacement for the required probability distribution. That is an interpretation or proposed estimator that must be validated separately.

## Results and contribution

The paper recovers expected directional structures in systems including the Kaplan–Yorke map, Rössler system, baker transformation, Hénon map, and a stochastic potential flow. Its main contribution is theoretical provenance for treating LK information flow as a directional quantity derived from dynamics.

## Relevance to IcyAlert

- It justifies the directional, nil-causality benchmark used in the two-variable experiment.
- It permits us to discuss a time-evolving causal distribution in principle.
- It does not choose between long-time covariance, rolling covariance, sequential statistical covariance, forecast-ensemble covariance, or posterior analysis covariance.

## Do not claim from this paper

- that EnKF posterior covariance is a physical causal covariance;
- that forecast covariance is automatically correct;
- that data assimilation updates are covered by the derivation;
- that a finite ensemble accurately represents ρ(x,t) without additional assumptions.

## Source

- DOI: https://doi.org/10.1103/PhysRevE.94.052201
- Local source: `paper-dump.md`
