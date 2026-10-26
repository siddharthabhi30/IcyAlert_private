# Stéphane's Email: Raw Message and Interpretation

This record preserves the earlier email and interpretation. Later discussion distinguishes the linear covariance estimator from nonlinear formulas; covariance alone is not sufficient for general nonlinear LK. Read [the later calculation guide](../llm-remarks/nonlinear-lk-calculation-and-followup.md) and [Daniel's response](daniel-sorensen-code-and-method-followup.md) for the subsequent context.

## Raw email (verbatim)

> Dear Nir and Siddarth
>
> Thank you very much for your work on this topic. And also sorry for my slow response. Now at a meeting in Japan.
>
> @David: I put you in the loop here. We can discuss together if you wish that I tell you what we discussed with Nir and Siddarth. They have a nice method for computing the Kalman Filtering properties using a NN that could help in computing the rate of information transfer for time series.
>
> Concerning your different points:
>
> 1. The first think I would do is to use a two-variable linear stochastic model to check if the approach is properly providing the right answer. You can find the use of that model in https://agupubs.onlinelibrary.wiley.com/doi/epdf/10.1029/2019GL084329 There should be a clear estimation (to compare with) that one can get by considering the very simple formula of the rate of information transfer:
>
> T(2-->1) = a12 * cov(1,2)/sig^2_1
>
> This should be the reference. A second possibility/test is to use the Lorenz system you have used. We have averaged quantities when the probability density of the ensemble is converging toward the stationary probability density (see table 3 in Pires et al, 2024, https://www.sciencedirect.com/science/article/pii/S0167278923003421).
>
> 2. I suppose that both can be tested.
>
> 3. What we can do here is the experiment mentioned at point 1. We can also use a more sophisticated model (12 variables) I have used and for which one can estimate the averaged rate of information transfer. There are also several model proposed by Liang (2021) that can be used (https://journals.aps.org/pre/abstract/10.1103/PhysRevE.94.052201). Comparing to the next cycle, I am not sure what it means.
>
> 4. I think that these quantitities Q(t), R(t) and the covariance matrix are really the key elements for the atmospheric or climate applications.
>
> There is also a very important point to make here. In our studies above, we were focusing on the rate of information transfer when the covariance matrix is the climatological one. In other words, we were looking at the connections between the variables when the the probability distribution of the ensemble has asymptotically converged for long lead times of the forecasts (this is similar to have a probability distribution which is stationary). In the case of the transient analysis intended here, the ensemble is evolving in time (with a probability distribution evolving in time). So we should not expect the same results as the asymptotic ones (except maybe for very large forecasting windows or large initial condition errors).
>
> I would also personally work with the ERA5 series only or a set of data at a first stage. So the two datasets downloaded by Siddarth, but not with the S2S ensembles yet.
>
> Best regards and looking forward discussing further
>
> Stéphane

## Interpretation

### Central message

Before applying the neural filtering method to the complete IcyAlert seasonal-forecast problem, first prove that it estimates covariance accurately on systems for which the correct information-transfer result is already known.

The immediate scientific question is:

> Does the covariance estimated by the neural filter produce the correct Liang--Kleeman rate of information transfer?

### Proposed validation sequence

#### 1. Two-variable linear stochastic model

Begin with a controlled two-variable system such as

\[
d x_1=(a_{11}x_1+a_{12}x_2)\,dt+\text{noise},
\]

\[
d x_2=(a_{21}x_1+a_{22}x_2)\,dt+\text{noise}.
\]

The connection from variable 2 to variable 1, \(a_{12}\), is known because the model is specified by us. The reference rate of information transfer is

\[
T_{2\rightarrow1}
=a_{12}\frac{\operatorname{Cov}(x_1,x_2)}{\operatorname{Var}(x_1)}.
\]

This creates a known-answer experiment:

1. Simulate the system with known process and observation noise.
2. Run the neural filter.
3. Obtain its estimated covariance matrix.
4. Calculate \(T_{2\rightarrow1}\) from that covariance.
5. Compare it with the analytical/reference value.

This test isolates the filtering and covariance method before introducing the complexity of weather grids.

Reference: [Testing for Dynamical Dependence: Application to the Surface Mass Balance Over Antarctica](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2019GL084329).

#### 2. Lorenz system

The Lorenz system is the next test because it is nonlinear and chaotic, but reference long-run average information-transfer quantities are already available in Table 3 of Pires et al. (2024).

The intended comparison is between the information-transfer rate obtained from our estimated covariance/distribution and the published averaged result once the Lorenz ensemble reaches its stationary regime.

Reference: [A general theory to estimate information transfer in nonlinear systems](https://www.sciencedirect.com/science/article/pii/S0167278923003421).

#### 3. Twelve-variable atmospheric model and other benchmark systems

After the two-variable and Lorenz tests work, move to the 12-variable reduced atmospheric model mentioned by Stéphane. This is an intermediate step between toy dynamics and real climate data. Other systems in Liang's work may provide further controlled benchmarks.

Reference: [Information flow and causality as rigorous notions *ab initio*](https://journals.aps.org/pre/pdf/10.1103/PhysRevE.94.052201).

#### 4. Real climate data

Only after the known-answer tests should the work move to the real IcyAlert setting. Stéphane recommends beginning with ERA5 time series or the simpler downloaded datasets and postponing the S2S seasonal ensembles.

The safest inference from this paragraph is:

- do not begin with the full S2S ensemble problem;
- begin with a simpler real-data time-series experiment;
- introduce the seasonal forecast ensembles after the covariance and information-transfer calculation has been validated.

The phrase "ERA5 series only or a set of data" and the identity of "the two datasets" should be confirmed with Stéphane because the wording does not identify the exact variables or files.

## The important distinction: stationary versus transient analysis

The published reference results generally use a **climatological covariance**. This is the covariance obtained after running the ensemble long enough that its probability distribution settles into its usual stationary behaviour:

\[
P_t\longrightarrow P_\infty.
\]

That produces an asymptotic information-transfer rate:

\[
T_{2\rightarrow1}^{\infty}
=a_{12}\frac{P_{\infty,12}}{P_{\infty,11}}.
\]

Our intended filter instead estimates an ensemble distribution and covariance that evolve during the forecast:

\[
P_0,P_1,P_2,\ldots
\]

Therefore, it produces a time-dependent information-transfer rate:

\[
T_{2\rightarrow1}(t)
=a_{12}\frac{P_{12}(t)}{P_{11}(t)}.
\]

The transient result should not be expected to equal the published climatological value at short forecast times. Approaching the stationary reference at long lead times would be a consistency check, not a requirement at every time.

This distinction may become the scientifically interesting contribution: instead of reporting only the average long-term connection between variables, the method could show how that connection evolves during a forecast.

## Meaning for the filtering work

Stéphane explicitly identifies the following quantities as central to atmospheric and climate applications:

- time-dependent process-noise covariance \(Q(t)\);
- time-dependent observation-noise covariance \(R(t)\);
- time-dependent state/error covariance \(P(t)\).

In a controlled experiment, the true \(Q(t)\), \(R(t)\), covariance, and information-transfer rate can be known. That allows a direct comparison with the neural filter:

| Quantity | Reference | Neural-filter output |
|---|---|---|
| \(Q(t)\) | Specified simulation noise | Estimated \(Q(t)\) |
| \(R(t)\) | Specified observation noise | Estimated \(R(t)\) |
| \(P(t)\) | Empirical/analytical true covariance | Estimated covariance |
| \(T_{2\rightarrow1}(t)\) | Analytical or large-ensemble result | Result computed from the estimated covariance |

The first deliverable should therefore be a known-answer comparison on the two-variable system, followed by Lorenz. Spatial weather-data extensions should come only after this basic covariance-to-information-transfer chain is verified.

## What cannot be inferred from this email alone

Point 2 ("both can be tested") and the sentence about "comparing to the next cycle" answer questions from the preceding email thread. Their precise meanings cannot be recovered safely without those original numbered questions.
