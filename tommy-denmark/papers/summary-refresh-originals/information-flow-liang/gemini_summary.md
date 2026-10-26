# Liang (2016): Theoretical Meaning of Transient Distributions

This skim directly answers your task: *"verify the theoretical meaning of a transient probability distribution"* from Liang (2016).

## 1. Liang's Definition of Probability Density ($\rho$)
In Liang (2016), Information Flow ($T_{2\rightarrow 1}$) is rigorously derived *ab initio* from the Liouville equation (for deterministic systems) and the Fokker-Planck equation (for stochastic systems). 

The foundational quantity in all his derivations is $\rho(\mathbf{x}, t)$, which is the **time-dependent (transient) probability density function**. 
- Liang **does not assume stationarity** in his core mathematical derivations. 
- Equation (6) calculates the instantaneous rate of information flow exactly at time $t$ using the instantaneous marginal density $\rho_1(x_1, t)$.

## 2. Why this validates Stéphane's email
Stéphane’s comment: *"In the case of the transient analysis intended here, the ensemble is evolving in time (with a probability distribution evolving in time)."* 
This aligns perfectly with Liang's fundamental math. Because Liang derives the information flow from the instantaneous evolution of $\rho(t)$, you are absolutely permitted to calculate Information Flow on a transient ensemble as it evolves.

## 3. The Catch for Data Assimilation
Liang (2016) proves that tracking causality dynamically on an evolving (transient) distribution is mathematically valid. **However, this only holds if the distribution $\rho(t)$ is evolving according to the physical Liouville/Fokker-Planck equations.**

When you run an EnKF Analysis step, you abruptly overwrite the physical distribution with an observational update (Bayes' theorem). Liang's derivations **do not account for observational assimilation jumping the distribution.**

**Conclusion:** 
The theory firmly supports measuring causality dynamically on a transient *forecast* ensemble ($P^f$), because it obeys the Fokker-Planck evolution that Liang based his math on. But applying the metric to the observationally-squashed *analysis* ensemble ($P^a$) remains entirely unproven and is the specific gap your research addresses.
