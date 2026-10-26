1
Benchmarking Conditioners in Liang–Kleeman Information Flow:
Application to Land–Atmosphere Interactions
Fareeha Siddique 1†, Daniel Fiifi Tawia Hagan 2†, Guojie Wang 1*, David Docquier 3, Stéphane Vannitsem
4
5 1 School of Remote Sensing and Geomatics Engineering, Nanjing University of Information Science and Technology, 210044
Nanjing, Jiangsu, China.
2 Hydro-Climate Extreme Lab, Ghent University, Ghent 9000, Belgium.
3 Royal Meteorological Institute of Belgium, Avenue Circulaire, 3, 1180 Brussels, Belgium.
4 School of Physical and Mathematical Sciences & The Asian School of the Environment, Nanyang Technological10
University, Singapore.
† These authors contributed equally to this paper
Correspondence to (*): Guojie Wang (gwang_nuist@163.com)
15
Abstract. The Liang–Kleeman Information Flow (LKIF) framework has been increasingly used to identify causality in Earth–
system dynamics in recent years. Yet, uncertainties remain regarding how the causal graph changes when mediators and
confounders (conditioners) are introduced, i.e., divergence between the bivariate and conditioned forms. A controlled synthetic
experiment shows that LKIF preserves correct causal directions under hidden confounding, while differences between bivariate
and multivariate estimates still occur. We characterize these differences using time–varying LKIF (ΔIF) and introduce several20
quantifiers, including Mediator Dominance Index, Moderation Gain, Confounding Pressure, and Convergence Rate, to
evaluate the contributions of conditioners. This is illustrated in an application to soil moisture (SM) and vapor pressure deficit
(VPD) couplings with vegetation (Leaf Area Index (LAI) and Gross Primary Productivity (GPP)). We find that the influence
of SM on LAI remains consistently direct and stable, whereas its influence on GPP and that of VPD on vegetation exhibit
substantial divergence between bivariate and multivariate estimates. This divergence peaks under compound dry–hot25
conditions, with VPD and temperature emerging as dominant mediators. These results demonstrate that bivariate and
multivariate LKIF can yield markedly different conclusions across time and space, especially under compound environmental
stress. This highlights the need for multivariate conditioning when assessing vegetation responses.
1 Introduction30
Land–atmosphere interactions are essential for modulating the flow of energy, water, and carbon between the surface of the
land and the atmosphere, and they are especially responsive to extreme climate events. The soil–vegetation–atmosphere
coupling continuum is central to these interactions, influencing and responding to changes in environmental conditions (Piao
et al., 2019; Cui et al., 2020). Extreme events, like droughts and heatwaves, disrupt these interactions by depleting soil moisture
(SM) and increasing vapor pressure deficit (VPD) – two key drivers of vegetation stress (Novick et al., 2016; Liu et al., 2020;35https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
2
Zhong et al., 2023). While SM regulates the quantity of water accessible for plant absorption (Sperry et al., 2017), VPD
indicates the atmospheric demand for water, affecting plant transpiration and stomatal function (Zhou et al., 2019). The co-
occurrence of restricted water supply and heightened evaporative demand during extreme conditions can significantly stress
plants, leading to a decrease in photosynthesis and hindering growth (Green et al., 2019; Liu et al., 2020). This has significant
implications for food and water security, especially in water-scarce regions. It is, therefore, vital to understand how vegetation40
responds to variations in SM (representing moisture supply) and VPD (representing moisture demand) during extreme events
for assessing ecosystem vulnerability/resilience, and to improve the prediction of vegetation–climate feedbacks. However,
accurate predictions require observing and quantifying/representing these events to better understand them unhindered by
relative sensitivities in climate and weather models.
Most existing studies have investigated the relationships among SM, VPD, and vegetation using conventional statistical45
techniques such as correlation and regression (Yuan et al., 2019; Zhong et al., 2023). While these approaches can reveal co-
variability, they identify symmetrical relationships that do not imply causation or directionality (Stips et al., 2016; Docquier
et al., 2023). As a result, utilizing basic statistical methods makes it challenging to differentiate cause from effect. To address
these limitations, several causal inference techniques, such as Granger Causality (GC) and Peter and Clark Momentary
Conditional Independence (PCMCI), have been suggested to investigate complex land–atmosphere interactions50
(Papagiannopoulou et al., 2017; Krich et al., 2020; Dubey et al., 2023). Although these methods allow to retrieve causal
relationships, they continue to encounter challenges such as inconsistent or method-dependent causal estimates, strong
sensitivity to assumptions (e.g., stationarity), difficulty in representing multiscale feedbacks, and limited robustness in the
presence of hidden or time-varying confounders (Docquier et al., 2024; Shao et al., 2024). Recently, the Liang–Kleeman
information flow (LKIF) has surfaced as an encouraging formalism to quantify cause–effect relationships (Liang, 2013, 2014,55
2016, 2021). This formalism provides a quantitative measure of causation, directly derived from first principles in contrast to
IF being axiomatically proposed as an ansatz, making it well-suited for understanding directional influences in environmental
systems (Liang 2016).
Originally, LKIF assumed stationarity (Liang, 2013, 2014), such that causal relationships were considered constant over time.
However, in reality, interactions like vegetation–climate are fundamentally non-stationary processes, such that assuming60
stationarity could restrict our understanding by overlooking important temporal variations, especially when anomalous events
arise. To address this issue, Hagan et al. (2019) adapted the LKIF framework to handle non–stationarity, which was further
extended by Zhou et al. (2024) (Z24 hereafter), into a multivariate, non-stationary form, building on the multivariate LKIF
approach by Liang (2021). Z24’s multivariate approach allows for the inclusion of mediating and/or confounding variables,
providing deeper insights into causal links. Here, a variable is a mediator (M) if it lies on the causal pathway between a driver65
X and a response Y (X→M→Y). Conditioning on M in the multivariate LKIF framework helps separate the direct information
flow X→Y from indirect contributions transmitted through M. Meanwhile, a confounder is a variable C that influences both Xhttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
3
and Y (C→X and C→Y); omitting C can bias the estimated coupling by inducing a spurious information flow between X and
Y. Z24 demonstrated through theoretical experiments that both the multivariate and bivariate LKIF approaches are valuable
for understanding land–atmosphere interactions, even in the presence of mediators and confounders.70
While the LKIF has been successfully applied to many problems in geoscience, uncertainties remain regarding the physical
limitations of using the bivariate and multivariate forms, especially when applied to land–atmosphere interactions. For
instance, Z24 noted that the multivariate and bivariate forms yield similar results in the presence of external variables but did
not provide conclusive criteria for when the bivariate LKIF may be compromised or less reliable, and more importantly, the
physical limitations leading to their differences. Meanwhile, Docquier et al. (2023) showed that, in a time-invariant LKIF75
analysis, omitting a key state variable can make 2D and multivariate estimates diverge substantially. Furthermore, interactions
in, say, the land–atmosphere continuum, are tightly coupled with overlapping drivers. In such cases, neglecting important
variables could lead to inflated or misleading causal strengths and variabilities. Moreover, the influence of these variables is
not static but depends on the prevailing land–atmosphere state, where different environmental conditions shape how strongly
additional variables contribute to the estimated causal relationships.80
This motivates a key question which we explore in this study: under which conditions do the bivariate and multivariate LKIFs
differ? More precisely, why would they differ in different locations for the same time period, or differ over time for the same
location, even when the same variables are used? This begs a spatio–temporal quality of the role of mediators/confounders in
the causal estimation based on LKIF, especially under a nonstationary assumption. In this study, we investigate the importance
of conditioners (mediators and/or confounders) in estimating vegetation responses, based on Gross Primary Productivity (GPP)85
and Leaf Area Index (LAI), to SM and VPD using the Z24 framework. Indications from Z24 suggest that the influence of
mediators and/or confounders (both named “conditioners”) may rely on the level of dependency between the cause and the
effect variables. Thus, in this study, we leverage this idea to further explore the conditions under which there would be more
relevance for mediators and/or confounders in the LKIF estimation. Understanding these dynamics is critical for accurately
studying vegetation responses to hydroclimatic drivers.90
In the following sections, the datasets and methods are introduced in Sect. 2. Section 3 presents the main results from the real-
world application of the LKIF framework. Section 4 discusses the importance of conditioners in shaping causal relationships.
Conclusions are presented in Sect. 5.
2 Materials and Methods
2.1 Causality Formalism95
The causal inference method applied here is based on the Liang–Kleeman Information Flow (LKIF) causality analysis
formalism, which is rigorously derived and formulated from first principles (Liang, 2014, 2016, 2021). In this context, thehttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
4
causality from one time series (X2) to another (X1) is quantified by the rate at which information flows from X2 to X1. Liang
(2021) extended this approach to a d–dimensional space to include the influence of potential confounding factors that may
impact the relationship between X2 and X1. In a system with d time series, the information flow from X2 to X1, while accounting100
for mediating/confounding variables, is expressed as (Eq. 1):
𝑇2→1∣3,4,…,𝑑 = 1
𝑑𝑒𝑡 𝐶 ⋅ ∑ 𝛥2𝑗𝐶𝑗,𝑑1
𝑑
𝑗=1 ⋅ 𝐶12
𝐶11
(1)
Where 𝑇2→1|3,4,…,𝑑 is the LKIF from X2 to X1 under the influence of various mediators/confounders (X3, . . ., Xd), 𝐶 is the sample
covariance matrix, and det 𝐶 is its determinant. ∆2𝑗 denotes the cofactor of 𝐶. 𝐶j,d1 represents the sample covariance between105
Xj and the temporal derivative dX˙1/dt using Euler's forward differencing, 𝐶12 is the sample covariance between X1 and X2 and
𝐶11 is the sample variance of X1 (for details see Liang, 2021).
Recently, Zhou et al. (2024) extended Liang's multivariate information flow framework by incorporating the Kalman filter to
address non–stationarity, resulting in the Multivariate Time-Varying Liang–Kleeman Information Flow (MtvLK) method. This
approach allows for the dynamic tracking of causality between multiple time series variables. Within this framework, the110
Kalman filter estimates the covariance matrix at each time step, which is then used for calculating the time-varying causality
between the system's variables. The key equation for MtvLK is (Eq. 2):
𝑇𝑡2→1∣3,4,…,𝑑(𝑡) = 1
𝑑𝑒𝑡 𝑃 ∑𝑗=1
𝑑 𝛥˙2𝑗𝑃𝑗,𝑑1
𝑃12
𝑃11
(2)
Where T2→1|3,4,…,d is the IF from X2 to X1 under the influence of various mediators/confounders (X3, . . ., Xd), where 𝑃 is the115
resulting covariance matrix estimated by the Kalman filter and updated at each time step, and det𝑃 denotes its determinant.
Δ˙𝑖𝑗 are the cofactors of the matrix 𝑃. And 𝑃j,d1 are the resulting covariance between 𝑋𝑗 and the temporal derivative dX˙1/dt.
𝑃12 is the covariance between X1 and X2, and 𝑃11 is the variance of X1 (for details, see Zhou et al., 2024).
To evaluate the statistical significance of the Liang–Kleeman information flow at each time step, the information-flow estimate
is treated as approximately normally distributed. Its uncertainty is obtained from the maximum-likelihood parameter120
covariance (inverse Fisher information matrix), and the flow is considered significant when the absolute information flow
exceeds the corresponding significance threshold at the chosen level. A controlled synthetic experiment demonstrating the
behavior of time–varying LKIF under hidden confounding is provided in Appendix A. The results show that LKIF accurately
recovers the correct causal directions and structure even as the strength of unobserved confounding increases. However,
differences between bivariate and multivariate IF estimates may arise, reflecting the influence of unobserved125
confounders/mediators. These findings demonstrate that, while LKIF maintains directional fidelity, conditioning is essential
for isolating direct effects and avoiding misinterpretation of causal strength.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
5
In this study, the Information Flow (IF) from SM and VPD to LAI/GPP is quantified, while also accounting for the influence
of multiple confounding variables (i.e., SM/VPD, temperature, and surface solar radiation). Within the framework for this
study, a coupling is defined as the likelihood of control that one variable has for another, represented by the IF of one variable130
to another, in the bivariate form, and the likelihood of control in the presence of other variable(s) in the multivariate form.
When IF is positive (+IF), this suggests changes in the driver increase the likelihood of extreme (excited) states of the response
variable, thus a potential indication of increased vulnerability in the response variable. In contrast, a negative IF (-IF) value
indicates that changes in the driver increase the likelihood of an equilibrium (reduced excited states) state of the response
variable, and potentially, its increased resilience.135
2.2 Differential Information Flow (ΔIF) Calculation
To assess how the causal influence of individual variables (SM or VPD) on vegetation (LAI/GPP) changes in the presence of
conditioners (whether mediators or confounders), the differential information flow (𝛥𝐼𝐹) is computed. 𝛥𝐼𝐹 is the absolute
difference between the bivariate (𝑇𝑏𝑖) and the multivariate (𝑇𝑚𝑣) IF (Eq. 3). Applied to the physical problem here (Eq. 4–5),
this metric quantifies the absolute change in IF from SM/VPD to the vegetation (bivariate form) and its multivariate form140
(taking into account the influences from VPD/SM, T and SSR). Thus, 𝛥𝐼𝐹 of SM and VPD is calculated using the following
equations:
∆𝐼𝐹(𝑡) = |𝑇𝑏𝑖(𝑡) − 𝑇𝑚𝑣 (𝑡)| (3)
∆𝑆𝑀 (𝑡) = |𝑇𝑆𝑀→𝐿𝐴𝐼\𝐺𝑃𝑃(𝑡) − 𝑇𝑆𝑀→𝐿𝐴𝐼\𝐺𝑃𝑃|𝑉𝑃𝐷,𝑇,𝑆𝑆𝑅 (𝑡)| (4)
∆𝑉𝑃𝐷 (𝑡) = |𝑇𝑉𝑃𝐷→𝐿𝐴𝐼\𝐺𝑃𝑃(𝑡) − 𝑇𝑉𝑃𝐷→𝐿𝐴𝐼\𝐺𝑃𝑃|𝑆𝑀,𝑇,𝑆𝑆𝑅 (𝑡)| (5)145
Based on the computed 𝛥𝐼𝐹 values, we assess the conditions under which the multivariate IF diverges (converges) from (to)
the bivariate form. A small 𝛥𝐼𝐹 indicates that the bivariate form is very similar to the multivariate one. In such cases, the
inclusion of additional variables does not notably alter the causal influence, implying that the key causal pathway is already
captured in the bivariate relationship with little dependency on mediators and/or confounders. Conversely, a large 𝛥𝐼𝐹 suggests
that the causal influence is substantially modified when additional variables are introduced, indicating a more complex causal150
relationship. In this case, mediators and/or confounders provide additional significant information that reshapes the apparent
causal structure. It is essential to note that the change in causal structure by incorporating other variables does not necessarily
imply that the bivariate form is incorrect in isolating dependencies, but rather that the quantitative information gathered is not
accurate. As discussed in Vannitsem et al. (2024), in a simplified setting, the addition of observables can indeed modify the
amplitude or sign of the influence but not the importance of the considered variable in the causal relationship uncovered. The155
emergence of spurious LKIF is, however, possible as illustrated in Docquier et al. (2023).https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
6
To assess the statistical significance of the 𝛥𝐼𝐹 between paired conditions (e.g., with vs. without a mediator), a paired two-
tailed Student’s t-test was applied at each time step. A 95% Confidence Interval (CI) for the difference in means was computed,
and 𝛥𝐼𝐹 was considered statistically significant when the CI did not include zero (equivalent to p < 0.05).
2.3 Information-based correlations (𝒓𝑰𝑭)160
In some cases, large differences may exist between the multivariate and bivariate forms; however, the correlations between
their time–varying estimates could be very high, implying that they capture the same physical process but at different
magnitudes. Therefore, we also assess the Pearson correlation (𝑟𝐼𝐹) between the time-varying bivariate information flow and
the time–varying multivariate one. This allows us to obtain a more holistic view of the conditions for divergence between the
bivariate and multivariate IFs. For regime–specific behavior, rIF is restricted to the subset of months belonging to a defined165
regime (Eq. 6):
𝑟𝐼𝐹 = |𝑐𝑜𝑟𝑟(𝑇𝑏𝑖(t), 𝑇𝑚𝑣(t))regime| (6)
In this study, we use the absolute correlation (|𝑟𝐼𝐹|), focusing on the strength of the temporal covariation. Here, we bin the
time series of SM and VPD into four quantile-based regimes, yielding a 4x4 grid of combined regimes, corresponding to the
combinations of SM and VPD quartiles (Q1, Q2, Q3, Q4 for each). The SM quartiles range from Q1, representing the driest170
conditions, to SM at Q4, representing the wettest conditions. Meanwhile, VPD quartiles range from Q1 (lowest demand) to
Q4 (highest demand). For each quartile, we calculate 𝑟𝐼𝐹 and the median of 𝛥𝐼𝐹.
2.4 Mediator-Based Decomposition of Information Flow Divergence
Understanding why 𝑇𝑚𝑣 diverges from 𝑇𝑏𝑖 leads us to derivable measures to quantify the relevance of the
mediators/confounders. To determine how individual mediators, modify the inferred causal influence between each driver–175
target pair, the differential Information Flow signal 𝛥𝐼𝐹(𝑡) was decomposed into contributions (Eq. 7–9) from progressively
expanded conditioning sets. Let 𝑇𝑏𝑖(𝑡) denote the bivariate IF from the driver (SM or VPD) to the target variable (LAI or
GPP) and let 𝑇𝑚𝑣|𝑚(𝑡) denote the corresponding multivariate IF conditioned on a conditioner set (m1, m2, m3). For a
coupling and a sequence of conditioners, the decomposition follows,
ΔIF𝑚1(𝑡) = 𝑇𝑏𝑖(𝑡) − 𝑇𝑏𝑖 ∣ 𝑚1(𝑡) (7)180
ΔIF𝑚2(𝑡) = 𝑇𝑏𝑖 ∣ 𝑚1(𝑡) − 𝑇𝑏𝑖 ∣ 𝑚1, 𝑚2(𝑡) (8)
ΔIF𝑚3(𝑡) = 𝑇𝑏𝑖 ∣ 𝑚1, 𝑚2(𝑡) − 𝑇𝑏𝑖 ∣ 𝑚1, 𝑚2, 𝑚3(𝑡) (9)https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
7
This decomposition allows us to examine which mediator contributes most to the divergence, and in what direction
(suppression or enhancement). From here, we summarize how each conditioner contributes to the restructuring of Information
Flow based on four indices (Eq. 10–13) computed from the temporal components 𝛥𝐼𝐹𝑚(𝑡).185
2.4.1 Mediator Dominance Index (MDI)
The Mediator Dominance Index (MDI) quantifies the proportion of the conditioner (𝑚) that contributes the most to the total
magnitude of information-flow restructuring (Eq. 10):
𝑀𝐷𝐼𝑚 = ∑ |∆𝐼𝐹𝑚 (𝑡)|𝑡
∑ ∑ |∆𝐼𝐹𝑚́𝑡𝑚́ (𝑡)| (10)
Large MDI𝑚 values identify conditioners that dominate the divergence between bivariate and multivariate couplings.190
2.4.2 Moderation Gain (MG)
Moderation Gain (MG) shows how strongly the conditioner (𝑚) increases the inferred coupling. The gain is defined as (Eq.
11);
𝑀𝐺𝑚 = ∑ max(0, ∆𝐼𝐹𝑚(𝑡)),𝑡 (11)
High 𝑀𝐺𝑚 values identify conditioners that dampen the apparent driver influence in the bivariate signal.195
2.4.3 Confounding Pressure (CP)
Confounding Pressure (CP) measures how strongly the conditioner (𝑚) suppresses inflated bivariate influence and is given in
Eq. 12;
𝐶𝑃𝑚 = ∑ max(0, −∆𝐼𝐹𝑚(𝑡))𝑡 (12)
Large 𝐶𝑃𝑚 values indicate strong confounding by the conditioner.200
2.4.4 Convergence Rate (CR)
Convergence Rate (CR) quantifies how often the bivariate estimate is close to the fully conditioned estimate. We define the
CR using the absolute divergence threshold 𝜀𝑎𝑏𝑠 (Eq. 13);
𝐶𝑅 = 1
𝑁 ∑ (|∆𝐼𝐹(𝑡)| ≤ 𝜀𝑎𝑏𝑠)𝑁
𝑡 (13)https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
8
Here 𝜀𝑎𝑏𝑠 is chosen as a fixed tolerance reflecting a physically meaningful scale of information-flow variation (e.g. the 10th205
percentile of ∆𝐼𝐹 across all couplings). High CR values indicate that the bivariate coupling is sufficiently close to the
multivariate form during a large fraction of the analyzed period.
2.5 Data
The Gross Primary Productivity (GPP) data, reflecting photosynthetic activity of plants, and Leaf Area Index (LAI,
representing vegetation greenness, utilized in this study, are obtained from the Global Land Surface Satellite (GLASS) dataset210
(Liang et al., 2021). The data has a spatial resolution of 0.05°and a temporal resolution of 8 days, covering the period from
1982 to 2018. For consistency with other variables in the analysis, the dataset is resampled to a spatial resolution of 0.25°×
0.25° (longitude × latitude), using bilinear interpolation and then aggregated to monthly timescales. Due to reported
uncertainties in data quality before 2002, the present study utilizes data spanning from 2004 to 2018.
The monthly data on Volumetric Soil Moisture (SM), 2-m air temperature, and Surface Solar Radiation (SSR) used in this215
study are obtained from European Centre for Medium-Range Weather Forecasts’ (ECMWF) datasets, with SM taken from
ERA5-Land and temperature and SSR from ERA5 global atmospheric reanalysis products, covering the period from 2004 to
2018. The weighted average of SM, computed between 0 and 289 cm (all four layers of SM), is used here, with the weights
corresponding to the thickness of each layer (0–7, 7–28, 28–100, and 100–289 cm). The original resolution of the SM data
(0.1⁰ × 0.1⁰) is subsequently re-gridded at a horizontal resolution of 0.25⁰ × 0.25⁰. Vapor pressure deficit (VPD) is estimated220
using ERA5’s 2-m minimum and maximum temperature and 2-m dewpoint temperature (Upreti & Ojha, 2017). The monthly
anomalies for all variables are computed for the period from January 2004 to December 2018 by subtracting the respective
climatological means from the original data.
3 Results
3.1 Real-world applications in land–atmosphere interactions225
Figure 1 illustrates the coupling strength from SM/VPD to LAI (a-b) and from SM/VPD to GPP (c-d), estimated via
Information Flow (IF), for two humid forest biomes: Southeast China (114.25–117.25°E, 25.25–28.25°N) and the Amazon
Basin (54–60°W, 10–15°S), over the period from 2004 to 2018. The locations of these study regions are shown in
Supplementary Fig. S1. Across both regions, the LKIF analysis captures the temporal evolution of vegetation response to
hydroclimatic variability and reveals when conditioning on mediating variables (VPD, T, SSR) alters or preserves the direct230
causal pathways.
a. Role of Conditioners in the Couplings between Soil Moisture / Vapor Pressure Deficit and Vegetationhttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
9
In the Southeast China region (Fig. 1a, top panel), the SM→LAI coupling is weak and mostly insignificant during 2004–2008.
From 2008 onward, the coupling strengthened noticeably, peaking in 2011 with significant positive IF, demonstrating the
increasing importance of SM for the structural variability of vegetation during this period. Conditioning on other variables235
(SM→LAI | VPD; SM→LAI | VPD, T; SM→LAI | VPD, SSR; SM→LAI | VPD, T, SSR) produces only minor changes in
magnitude, showing that the bivariate signal is not strongly confounded by the atmospheric factors used here because the SM
influence dominates. The overall positive IF suggests that changes in SM increase the likelihood of vegetation structural
vulnerability in the region.
In the Amazon Basin (Fig. 1a, bottom panel), the SM→LAI pathway shows broadly similar temporal variability in both the240
bivariate and multivariate estimates, indicating a generally strong hydrological influence on canopy structure. However, the
bivariate estimate remains larger than the multivariate estimates throughout the whole period (except in 2014–2015, when
values are very similar), indicating the confounding/mediating influence of other drivers. From 2004 to 2009, IF gradually
declined toward negative values with a small fluctuation in 2007, suggesting increased structural resilience due to SM, though
IF remains statistically insignificant throughout this period. Between 2010 and 2014, IF increased sharply, indicating245
heightened vegetation structural vulnerability to moisture variability. The bivariate IF becomes significant after 2012,
reflecting an apparent strengthening of the SM→LAI relationship. However, after conditioning on mediating/confounding
variables (SM→LAI | VPD; SM→LAI | VPD, T; SM→LAI | VPD, SSR; SM→LAI | VPD, T, SSR), this significance
disappears. The loss of significance indicates an apparent more direct SM→LAI. In the years after 2014, the IF decreases,
suggesting reduced vegetation vulnerability. Accounting for the conditioners results in only minor adjustments to IF250
magnitude, showing that removing atmospheric influences does not substantially alter the direct SM→LAI coupling. Overall,
although atmospheric variables exert secondary effects, soil moisture remains the primary driver of canopy structural
variability.
Figure 1b shows the VPD→LAI IFs in the two regions. The top and bottom panels show rather different temporal behaviors
in the bivariate and multivariate IFs compared to Fig 1a. In this case, introducing confounding/mediating variables (VPD→LAI255
| SM; VPD→LAI | SM, T; VPD→LAI | SM, SSR; VPD→LAI | SM, T, SSR) substantially modifies the coupling behavior.
However, this behavior remains time-dependent, after 2007, conditioning on the other variables leads to a stronger
modification, with the divergence between the bivariate and multivariate forms increasing in both regions. In Southeast China,
we even find different IF signs between the bivariate and multivariate forms from 2010 to 2016. From 2016 onwards, both
regions show greater variability in IF signs across the multivariate forms. These suggest more complex VPD_driver-based260
couplings for vegetation structure than SM_driver-based couplings.
Figures 1c–d show IFs of SM/VPD to GPP, and their multivariate forms for both regions. As was found in Fig. 1a–b, the GPP
effect-based couplings also show in both regions that conditioning on the other variables results in little adjustments and similar
trends in the SM driver-based couplings, while more variations are seen in the VPD driver-based couplings. The changeshttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
10
towards positive or negative IF are strongly impacted by ecosystem stress, here more consistent with drought occurrences in265
the region (Sun and Yang, 2012; Feldpausch et al., 2016). These results reveal that dependency on conditioners is both spatially
and temporally sensitive, given the same variables. Thus, the practice of just conditioning on other variables, under a stationary
assumption, should be done with caution.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
11
Figure 1: Time series of the information flow (IF) for Southeast China and the Amazon basin (2004 to 2018) for both bivariate and270
multivariate forms. (a) From SM to LAI, (b) From VPD to LAI, (c) From SM to GPP, (d) From VPD to GPP. Dotted lines represent
the overall LKIF, while solid lines indicate statistically significant IF. (LAI= Leaf Area Index, GPP= Gross Primary Production,
SM= Soil Moisture, VPD= Vapor Pressure Deficit, T= Temperature, SSR= Surface Solar Radiation).
3.2 When are Conditioners Important? Δ-Information-Flow Analysis
To further explore the conditions under which more divergence/convergence (large/small ΔIF) between bivariate and275
multivariate estimates occur in the application above, we further analyze the temporal evolution of ΔIF for both
SM/VPD→LAI and the SM/VPD→GPP pathways across Southeast China and the Amazon Basin. ΔIF indicates the degree
of convergence/divergence between the bivariate and multivariate IFs. Here, for the multivariate form, we include all
confounding variables used in this study. Figure 2(a,d) shows the ΔIF of SM/VPD→LAI (ΔSM: blue plots, ΔVPD: red plots),
and Fig. 2(g,j) shows the same as Fig. 2(a,d) but for GPP. Figure 2(a,d) consistently shows high convergence in ΔSM in both280
regions across all times, while ΔVPD shows more time-dependent divergence. The ability of the Z24 to capture immediate
changes in IF plays a pivotal role in shaping these differences. These results indicate that the SM→LAI coupling is direct, as
ΔSM is very small, with negligible influence from mediators/confounders, reflecting a strong hydrological control on canopy
structure in these biomes. In contrast, ΔVPD exhibits marked fluctuations and alternates between positive and negative phases.
Generally, atmospheric water demand (VPD) would depend on land water supply (SM), clear skies (increased SSR), and how285
these increases or decrease T, to impact vegetation density (Ficklin & Novick, 2017; Yuan et al., 2019; Zhou et al., 2019).
Furthermore, VPD is very sensitive to changes in these conditioners, especially the atmospheric ones, making it more
responsive to their impacts. This sensitivity suggests why conditioning on these variables changes the apparent strength of
VPD’s impact on vegetation.
The GPP effect-based ΔIF shows largely different patterns compared to the LAI effect-based ΔIF. Firstly, while Fig. 2(a,d)290
shows consistently convergent patterns across the whole time period for ΔSM in both regions, we find time-varying changes
in ΔSM in Fig. 2(g,j), although this is more distinct in Southeast China than in the Amazon Basin. This implies that while SM
has a more direct impact on LAI, it is a less direct driver of GPP. On the other hand, ΔVPD shows rather different patterns
across both regions. In southeast China, ΔVPD shows continuously high convergence during most of the time period; however,
as with ΔSM, it is characterized by fluctuations and alternates between positive and negative phases. Thus, VPD→GPP295
coupling is more direct in Southeast China than in the Amazon Basin.
Figure 2(a,d,g,j) shows that regions with rich/strong coupling/feedback, particularly the Amazon Basin, exhibit large
differences in ΔIF, indicating substantial divergence between the bivariate and multivariate pathways.
To dig deeper into the potential reasons for these nuanced patterns of ΔIF, we illustrate the causal graphs for (1) a time-point
where ΔIF is large (stronger divergence) and (2) a time point where ΔIF is small (stronger convergence) for both regions (Fig.300https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
12
2b–c, e–f, h–i, k–l). The results suggest that stronger divergence is associated with richer coupling/feedback time points, while
stronger convergence occurs when there are fewer couplings. These results agree with a previous study, which suggested that
couplings/feedback reduce under drought conditions (Ruddell & Kumar, 2009). This could also explain why ΔVPD converges
in Southeast China around the neighborhood time of 2011, since these periods were marked by recurrent droughts in the region
(Sun and Yang, 2012). Under such drier conditions, VPD becomes a more dominant driver of vegetation, consistent with the305
findings of a recent study (Yuan et al., 2019). These results illustrate how ΔIF variability translates into shifts in the underlying
causal structure. High-ΔIF years correspond to more complex, mediator-driven pathway configurations, whereas low-ΔIF
years reflect simpler and predominantly direct interactions.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
13
Figure 2: Time series of differential Information Flow (ΔIF) for Southeast China and the Amazon Basin (2004–2018). (a,d) for310
SM/VPD to LAI, and (g,j) from SM/VPD to GPP. Solid lines denote periods where ΔIF is statistically significant (p < 0.05); dotted
lines indicate non-significant values. Shaded bands represent the 95% confidence interval. (∆SM=|TSM→LAI/GPP-
TSM→LAI/GPP|VPD, T, SSR| and ∆VPD =|TVPD→LAI/GPP-TVPD→LAI/GPP|SM, T, SSR|). Vertical tick marks denote the time
points selected for causal graph construction. Summary of the causal graphs for years exhibiting large and small IF divergence for
LAI (b–c, e–f), and for GPP (h–i, k–l). Stronger ΔIF corresponds to years with richer coupling and feedback structure, whereas315https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
14
smaller ΔIF reflects periods with fewer couplings. (LAI= Leaf Area Index, GPP= Gross Primary Production, SM= Soil Moisture,
VPD= Vapor Pressure Deficit, T= Temperature, SSR= Surface Solar Radiation).
3.3 State-Dependent patterns of changes in information flow
To further assess when and where bivariate and multivariate IFs estimates diverge, we computed the differential information
flow (|ΔIF|, Section 2.2) and the information-based correlation (|rIF|, Section 2.3). To jointly visualize the two diagnostics320
across the combined regimes, we use the split-triangle heatmap layout. For each 4×4 panel, we overlay grid lines, label the
axes by SM and VPD quartiles, and hatch any cells with zero samples using diagonal stripes; this immediately flags regimes
where no robust causal inference is possible. This is routinely repeated for all four couplings, focusing on southern China, to
show how |ΔIF| and |rIF| between bivariate and multivariate IF depend jointly on SM and VPD regimes.
The SM→LAI pathway (Fig. 3a), exhibits uniformly high rIF and low ΔIF across nearly all SM–VPD quartile combinations.325
This concentrated pattern demonstrates that the SM–LAI coupling is both strong and consistently direct, with minimal
differences between bivariate and multivariate IF estimates. The uniformity across hydroclimatic states indicates that
vegetation structural responses to soil moisture in humid forests are stable and largely insensitive to atmospheric variables. In
contrast, the SM→GPP (Fig. 3c) shows high correlation and larger ΔIF values. Although the SM–GPP coupling remains strong
across quartiles (as revealed by the large correlation), the pronounced difference in information flow between the bivariate and330
multivariate forms indicates that mediator inclusion alters the estimated causal strength more substantially than in the
SM→LAI case. This reflects the higher complexity of productivity (GPP) responses relative to canopy structure (LAI); GPP
integrates more processes and is therefore more sensitive to the removal of atmospheric confounding.
The VPD→LAI and VPD→GPP pathways (Fig. b-d) show wider variability in both rIF and ΔIF. Correlations range from
weak to strong, and ΔIF spans small to large magnitudes across quartiles. This broad spread highlights the more nonlinear and335
state-dependent behavior of VPD-driven couplings. Supplementary Fig. S2(a-c) shows the detailed ΔIF structure across
regimes of water supply and atmospheric demand for all conditioning levels.
Overall, Fig. 3 shows that SM-based couplings (a-c) exhibit much greater uniformity than VPD-based couplings (b-d). The
SM panels display consistent correlation strength and ΔIF patterns, whereas the VPD panels show substantial variation in both
metrics. This suggests that VPD-driven interactions are more sensitive to environmental conditions and may require additional340
conditioning variables to achieve the stability seen in SM-driven couplings.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
15
Figure 3: Differences (ΔIF) and correlations (rIF) between bivariate and multivariate Information Flow across SM and VPD
quartiles (Q1–Q4) for Southeast China. (a) SM→LAI, (b) VPD→LAI, (c) SM→GPP, and (d) VPD→GPP. Each cell is divided into
an upper triangle (|rIF|: magnitude of Pearson correlation between bivariate and multivariate IF) and a lower triangle (|ΔIF|:345
absolute difference between bivariate and multivariate IF). Colour intensities are scaled independently for each triangle using
separable colormaps. Cross-hatched cells indicate quartile combinations with no data. (SM= Soil Moisture, VPD= Vapor Pressure
Deficit, LAI= Leaf Area Index, GPP= Gross Primary Production).
3.4 ANOVA of Regime-dependent Changes in Information Flowhttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
16
This ANOVA framework (Appendix B) provides a formal variance-partitioning approach to identify the hydroclimatic350
conditions under which mediator removal alters coupling strength most strongly, thereby isolating the environmental regimes
that drive the largest departures between bivariate and fully conditioned information-flow estimates.
a. Two-way ANOVA: moisture–demand control of |∆IF|
Across all four pathways (SM→LAI, VPD→LAI, SM→GPP, VPD→GPP), the SM and VPD regimes exert a clear influence
on the magnitude of |∆IF| (Fig. 4a). For the SM-driven pathways, the SM main effect dominates, indicating that differences355
between bivariate and multivariate estimates grow primarily across the wet–dry gradient. VPD contributes very little to |ΔIF|
for these pathways, reinforcing that LAI and GPP responses to SM are largely direct and only weakly mediated by atmospheric
demand.
For VPD-driven pathways, the SM×VPD interaction is the only meaningful component, showing that the divergence between
bivariate and multivariate pathways is controlled mainly by the combined moisture–demand regime rather than by either factor360
independently. These patterns reveal that LAI pathways exhibit small |ΔIF| and weaker regime sensitivity, whereas GPP
pathways show larger |ΔIF| and stronger dependence on moisture–demand structure. The largest departures occur under
compound dry and high-VPD conditions.
b. Thermal modulation: SM×VPD×T structure
Introducing temperature as a third factor (Fig. 4b) substantially increases the explanatory power of the ANOVA for the GPP365
pathways. The T main effect is pronounced for both SM→GPP and VPD→GPP, indicating that hot regimes amplify
differences between bivariate and multivariate causal estimates. This reflects the strong co-variation between T and VPD
during warm months, which intensifies atmospheric demand and modifies the relative contributions of SM and VPD to
ecosystem functioning. High-order interactions involving T, notably VPD×T and SM×VPD×T, explain large fractions of
variance in |ΔIF| for GPP. These terms demonstrate that differences between bivariate and fully conditioned estimates arise370
not only from moisture or demand individually but from their joint modulation under thermal stress. For the LAI pathways,
temperature effects remain detectable but generally weaker, consistent with the slower structural response of canopy
development.
c. Radiative modulation: SM×VPD×SSR structure
Surface solar radiation further modulates the divergence between bivariate and multivariate couplings (Fig. 4c). The SSR main375
effect is most evident for the GPP pathways, indicating that bright conditions heighten the influence of moisture and demand
on the inferred causal structure. Under high radiation, photosynthesis becomes increasingly limited by stomatal regulation and
water supply, making SM–VPD–SSR interactions more dominant.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
17
Figure 4: ANOVA results showing the explained standard deviation (√AEV) of |ΔIF| for Southeast China. Columns represent the380
four pathways: SM→LAI, VPD→LAI, SM→GPP, and VPD→GPP. (a) Two-way ANOVA with factors SM and VPD. (b) Three-
way ANOVA including SM, VPD, and T. (c) Three-way ANOVA including SM, VPD, and SSR. Bars show the explained SD for each
factor or factor interaction; error bars indicate the 95% confidence interval. (SM= Soil Moisture, VPD= Vapor Pressure Deficit, T=
Temperature, SSR= Solar Surface Radiation). Note that the Y-axis range differs in each panel to better see the different values.
The SM×SSR and VPD×SSR interactions explain sizable fractions of the variance for SM→GPP and VPD→GPP,385
respectively, demonstrating that the largest changes in ΔIF arise under bright–dry and bright–high-demand conditions. The
three-way SM×VPD×SSR interaction is also non-negligible, particularly for the GPP pathways, indicating that the breakdown
of bivariate couplings is strongest under simultaneously dry, high-VPD, and high-radiation regimes. Whereas, LAI pathways
exhibit weaker radiative interactions, reflecting their slower structural adjustment timescale and lower instantaneous sensitivity
to radiative conditions. The corresponding variance fractions (ω²) for each pathway are shown in Supplementary Fig. S3.390
Altogether, the ANOVA results show that the divergence between bivariate and multivariate couplings is strongly regime
dependent and reaches its maximum under compound environmental stress. The largest explained standard deviation (SD)
values occur in dry–high-VPD regimes, particularly when combined with hot or high-radiation conditions, indicating that thehttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
18
system’s causal architecture fundamentally changes under simultaneous supply, demand, and energy limitations. In these
states, strong SM×VPD and SM×VPD×energy (T or SSR) interaction terms reveal that multiple constraints act jointly on the395
ecosystem, causing the bivariate IF to conflate several distinct processes. Importantly, the analysis also reveals a clear
difference between structural and functional responses: LAI-based couplings exhibit minimal regime dependence and
consistently small explained SD, reflecting their stable and weakly mediated behavior. In contrast, GPP-based couplings show
much larger explained SD and strong sensitivity to moisture–demand–energy interactions, demonstrating that GPP responds
nonlinearly to compound stress and is far more strongly mediated than LAI.400
4. Discussion: Diagnosing the importance of conditioners
Based on the results so far, we provide four indices that could be used to summarize how individual mediators/confounders
reshape the couplings by examining: (1) mediator dominance (MDI), (2) moderation gain (MG), (3) confounding pressure
(CP), and (4) convergence rate (CR). Here, we select the SM_cause-based couplings in Southeast China to simplify the
demonstration. We thus highlight why SM→LAI and SM→GPP couplings behave so differently in terms of ΔIF. We note that405
for the purposes of this study, all the definitions provided here are strictly with respect to the Liang-Kleeman information flow.
MDI (Fig. 5a) quantifies the relative share of |ΔIF| attributable to each mediator. VPD emerges as the dominant mediator for
both pathways, but especially for SM→GPP. For SM→LAI, VPD accounts for roughly two-thirds of the total |ΔIF|, while the
remainder is distributed between T and SSR. This indicates that although VPD is the primary contributor, ΔIF for SM→LAI
still reflects multiple environmental influences. In contrast, the SM→GPP pathway is almost entirely driven by VPD-related410
restructuring, with MDI close to 1 and only minor contributions from temperature and radiation. This concentration reveals
that the discrepancy between bivariate and multivariate SM→GPP couplings is predominantly determined by VPD co-
variation.
MG (Fig. 5b) captures the sum of positive ΔIF values and identifies mediators that amplify the deviation between bivariate
and multivariate IF. For SM→LAI, MG is small for all mediators, increasing slightly from VPD to T and reaching its largest415
values for SSR. This pattern shows that radiative and thermal conditions modestly enhance departures from the bivariate
estimate, whereas VPD contributes relatively little positive deviation. In stark contrast, SM→GPP exhibits strong MG
dominated by temperature: T produces far larger moderation gain than VPD or SSR. Warm conditions, therefore, play a central
role in amplifying GPP-related ΔIF, with SSR providing additional but smaller contributions.
CP (Fig. 5c) measures the accumulated negative ΔIF and therefore the degree to which mediators inflate the bivariate coupling420
relative to the multivariate one. SM→LAI displays very low CP, indicating minimal inflation of its bivariate estimate and
confirming that its bivariate IF is only weakly distorted by confounding. SM→GPP, however, shows large CP, revealing thathttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
19
confounding from VPD, T, and SSR substantially exaggerates the apparent SM→GPP influence. This confirms that the
bivariate representation of SM→GPP can markedly overstate the true conditioned coupling.
425
Figure 5. Importance of conditioning variables for |ΔIF| based on (a) Mediator Dominance Index (MDI), (b) Moderation Gain (MG),
(c) Confounding Pressure (CP), and (d) Convergence Rate (CR), for the SM→LAI and SM→GPP couplings in Southeast China.
CR (Fig. 5d) quantifies the percentage of time windows in which |ΔIF| remains below a small threshold and thus reflects how
often the bivariate estimate is effectively sufficient. SM→LAI has a CR near 100%, indicating that the bivariate and
multivariate IF almost always agree and that conditioning on mediators is rarely necessary. In contrast, SM→GPP shows a430
much lower CR, meaning that the bivariate estimate frequently diverges from the multivariate one, and mediator conditioning
is essential for an accurate causal representation.
Figure 5 demonstrates a clear structural–functional divide in vegetation–climate coupling. The SM→LAI pathway is
structurally simple and largely causally sufficient: mediator effects are small, confounding pressure is negligible, and bivariate
and multivariate IF show consistent agreement. In contrast, the SM→GPP pathway is strongly mediator-dependent. VPD435
dominates its ΔIF structure, temperature and radiation amplify deviations, and confounding pressure materially affects itshttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
20
bivariate representation. These findings show that some vegetation couplings (e.g., SM→LAI) are robust and require minimal
conditioning, whereas other pathways, such as SM→GPP, depend critically on accounting for mediator effects to correctly
characterize their causal behavior. The corresponding SM–VPD quartile-specific results are shown in Supplementary Fig. S4.
5. Conclusion440
This study investigated when and why conditioners may alter information flow pathways. We achieve this by analyzing
divergence between the bivariate and multivariate formulations of Liang–Kleeman Information Flow, and how these
differences reflect the contribution of the conditioners to an application in land–atmosphere interactions. A synthetic validation
(Appendix A) showed that LKIF preserves directional fidelity under hidden confounding, though differences between bivariate
and multivariate estimates still occur.445
A real-world application revealed that the impacts of conditioners on causal structures vary across time and space,
demonstrating that spatial and temporal averaging could mask the relevance of conditioners. In our study, SM→LAI,
representing vegetation structure, showed consistently more direct behavior in different locations across different periods of
time, with minimal mediator influence, and high causal sufficiency. In contrast, SM→GPP, representing vegetation function,
exhibited strong mediator dependence, substantial divergence, and marked temporal variability. These differences were450
particularly pronounced during periods of compound stress, when atmospheric demand, temperature, or radiation jointly
altered the inferred causal pathway. VPD emerged as the dominant mediator shaping ΔIF for SM→GPP, while temperature
showed the largest increase in the coupling when included as a conditioner. Together, these patterns demonstrate that
conditioning variables are essential for functional pathways but comparatively unimportant for structural ones.
We also found that the physical states of the driver variables further controlled the degree of divergence. SM-driven couplings455
showed stable behavior across supply–demand states, whereas VPD-driven pathways displayed wide variability in both rIF
and ΔIF. ANOVA confirmed that the largest departures occurred under combinations of dryness, high VPD, and elevated
T/SSR conditions known to intensify plant stress. These state-dependent effects explain why mediators appear intermittently,
because their influence strengthens only when climatic conditions amplify dependencies among drivers. Importantly, this study
shows that when driver-response relationships are predominantly more direct, mediators/confounders contribute little460
(Docquier et al., 2024). However, under more complex or compound-stress conditions, mediators/confounders become critical
to capture the underlying causal mechanisms.
While this work does not include all potential mediators, the selected variables represent dominant environmental controls and
yield physically interpretable causal signals. The IF framework provides a transparent, first-principles basis for causal
estimation; however, future work should explore nonlinear extensions (Pires et al., 2024; Vannitsem et al., 2025) to better465
capture complex feedbacks that arise during extreme events.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
21
Our findings provide conceptual and practical frameworks for deciding when conditioning is necessary and highlight the
importance of considering mediators in future applications of Information Flow to land–atmosphere systems. Furthermore,
there is a potentially important application for feature selection for machine learning model development, which is yet to be
explored.470
Appendix A: Theoretical experiments
We begin by demonstrating how hidden confounders influence information-flow estimation through a controlled synthetic
experiment. The goal is to assess whether LKIF can still recover a faithful causal structure when parts of the underlying system
are unobserved, a situation frequently encountered in Earth-system applications. The experiment uses a five-dimensional,
linear, stable Vector Autoregressive (VAR1) process defined as (Eq. A1);475
x𝑡 = 𝐴x𝑡−1 + 𝜀𝑡, 𝜀𝑡 ∼ 𝒩(0, Σ), (A1)
Where x𝑡 = (𝑥1,𝑡, 𝑥2,𝑡, 𝑥3,𝑡, 𝑥4,𝑡, 𝑥5,𝑡)⊤ are the five different time series and Σ = diag(𝑏1
2, 𝑏2
2, 𝑏3
2, 𝑏4
2, 𝑏5
2), with bi being the
stochastic perturbation amplitudes The coefficient matrix A is (Eq. A2);
𝐴 =
(
𝜙 𝑐21 𝑐31 𝛾 0
𝑐12 𝜙 𝑐32 𝛾 0
0 0 𝜙 0 0
0 0 0 𝜙 𝜂
0 0 0 0 𝜙)
(A2)
encodes all causal interactions, where 𝜙 = 0.40, 𝑐21 = 0.05, 𝑐31 = 0.55, 𝑐32 = 0.12, 𝑐12 = 0.45, 𝜂 = 0.70, and 𝛾 is a480
parameter that varies between 0 and 0.9. The innovation scales are (𝑏1, 𝑏2, 𝑏3, 𝑏4, 𝑏5) = (0.6,0.5,0.5,0.6,0.6). Expanding
(VAR1) by rows gives (Eq. A3);
𝑥1,𝑡 = 𝜙𝑥1,𝑡−1 + 𝑐21𝑥2,𝑡−1 + 𝑐31𝑥3,𝑡−1 + 𝛾𝑥4,𝑡−1 + 𝜀1,𝑡,
𝑥2,𝑡 = 𝜙𝑥2,𝑡−1 + 𝑐12𝑥1,𝑡−1 + 𝑐32𝑥3,𝑡−1 + 𝛾𝑥4,𝑡−1 + 𝜀2,𝑡
𝑥3,𝑡 = 𝜙𝑥3,𝑡−1 + 𝜀3,𝑡
𝑥4,𝑡 = 𝜙𝑥4,𝑡−1 + 𝜂𝑥5,𝑡−1 + 𝜀4,𝑡
𝑥5,𝑡 = 𝜙𝑥5,𝑡−1 + 𝜀5,𝑡.
(A3)
This structure separates the system into observable and hidden components. Only 𝑥1, 𝑥2, 𝑥3are assumed observable and are
used for the IF estimation, whereas 𝑥4 and 𝑥5 act as hidden confounders. The causal design includes a bidirectional interaction485
between 𝑥1 and 𝑥2, unidirectional influences 𝑥3 → 𝑥1 and 𝑥3 → 𝑥2, and a hidden driver 𝑥4 that drive both 𝑥1 and 𝑥2. A deeper,
nested confounder 𝑥5 drives 𝑥4 (Fig. A1(a)). This nested confounding structure aims to mimic realistic Earth-system
conditions where unobserved processes can influence, or even generate, additional confounders. To examine how confoundinghttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
22
strength affects IF estimation, we vary the parameter γ ∈ {0.0, 0.1, … , 0.9}, which controls the influence of the hidden
confounder 𝑥4 on the observable variables 𝑥1 and 𝑥2. For each 𝛾, multiple independent realizations of length N=3000 are490
generated.
For every 𝛾 value, we compute the bivariate information flows 𝑇1→2
(𝑏𝑖) and 𝑇1→3
(𝑏𝑖) each using only the two variables involved,
and the multivariate (conditioned) information flows 𝑇1→2|3
(𝑚𝑣) and 𝑇1→3|2
(𝑚𝑣) where one additional observed variable is included as
a conditioning variable. To evaluate how conditioning alters the estimated causal strength, we compute the differential
information flows using Eq. (3) as (Eq. A4-A5);495
∆𝐼𝐹1→2 = 𝑇1→2
(𝑏𝑖) − 𝑇1→2|3
(𝑚𝑣) (A4)
∆𝐼𝐹1→3 = 𝑇1→3
(𝑏𝑖) − 𝑇1→3|2
(𝑚𝑣) (A5)
Across 200 realizations, we compute bootstrap mean bands for each 𝛾 using B=1000 resamples, and percentile ribbons at the
1–99 % range. A significance mask marks ΔIF (or T) as significant when the bootstrap band excludes zero. These estimations
are repeated for 𝑥3 → 𝑥2, as well to also quantify the influence of the mediator 𝑥1.500
The results are summarized in Fig. A1, which illustrates the causal structure and clearly distinguishes observed and hidden
components. The green region highlights the observable variables (𝑥1, 𝑥2, 𝑥3) used to compute IF. The grey regions contain
the hidden confounders 𝑥4 and 𝑥5, which influence the system but are deliberately excluded from the estimation. The hidden
confounder 𝑥4 injects shared variability into both 𝑥1 and 𝑥2, while the additional variable 𝑥5 introduces a deeper causal layer,
creating a confounder-of-a-confounder structure. As 𝛾 increases, the influence of the hidden confounder 𝑥4 on the observed505
variables becomes stronger, amplifying the confounding pressure that cannot be removed through conditioning on observed
variables alone. This ensures that the observable system is subjected to increasing and unresolvable confounding, allowing the
experiment to test whether IF remains reliable under such challenging conditions.
Figure A1(b) shows that the IF from 𝑥1 → 𝑥3 remain essentially zero across all 𝛾 values. This behavior is fully consistent with
the underlying system, which contains no direct causalities from 𝑥1 to 𝑥3. Both the bivariate and multivariate IF estimates510
demonstrate that the presence of hidden confounders does not induce spurious causal inference in these couplings. In contrast,
the causal pathway 𝑥1 → 𝑥2is consistently detected, although it strengthens as 𝛾 increases. The IF values for this pathway show
a rise with increasing hidden confounder strength, reflecting the fact that 𝑥4 amplifies the coupling between 𝑥1 and 𝑥2 since
𝑥4 increases the feedback between 𝑥1 and 𝑥2 . Importantly, the bivariate and multivariate IF curves remain nearly
indistinguishable throughout the entire 𝛾 range, indicating that conditioning on the third observed variable 𝑥3 provides only a515
negligible adjustment. The 𝑥3 → 𝑥2 coupling also tests how IF responds to mediators (𝑥1). Figure A1(c) shows that 𝑥1 doeshttps://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
23
not alter the inferred causal direction between 𝑥3 and 𝑥2. This confirms that IF preserves directional fidelity under substantial
hidden confounding, while still reflecting the influence of confounders and mediators (conditioners) on the estimated coupling
strength.
Overall, this theoretical experiment demonstrates that LKIF retains directional fidelity under increasing and nested hidden520
confounding. True causal connections, such as 𝑥1 → 𝑥2, are consistently recovered, while nonexistent connections remain near
zero. This result is consistent with the findings in Vannitsem et al (2024).
Figure A1: Toy-model experiment illustrating the effect of hidden confounders on Liang–Kleeman Information Flow (LKIF). (a)
Causal graph for a five-variable system with three observed variables (𝒙𝟏, 𝒙𝟐, 𝒙𝟑) and two hidden confounders (𝒙𝟒,𝒙𝟓). Directed525
arrows show the true causal pathways; blue arrows represent pathways originating from hidden confounders, the red arrow denotes
the bidirectional coupling between 𝒙𝟏 and 𝒙𝟐, and the pink arrows denote the causality of 𝒙𝟑 → 𝒙𝟏and 𝒙𝟑 → 𝒙𝟐. Estimated bivariate
(solid lines) and multivariate (dashed lines) IF for (b) 𝒙𝟏 → 𝒙𝟐 and 𝒙𝟏 → 𝒙𝟑 and (c) 𝒙𝟑 → 𝒙𝟐under increasing confounder strength
𝜸, with the brown line showing the normalized differences (right y-axis). The shaded band shows the 95% confidence intervals.
Appendix B: ANalysis Of Variance (ANOVA)530https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
24
ANalysis Of Variance (ANOVA) was applied to the ΔIF values to quantify how their variability is structured across different
hydroclimatic regimes. Monthly SM, VPD, T, and SSR were each partitioned into quartiles (Q1–Q4) using empirical quantiles.
These quartile categories were then treated as factors in the ANOVA, which reports variance components across quartiles
rather than individual quartile means. Three experimental designs were used:
(1) a two-way ANOVA: SMq × VPDq.535
(2) a three-way thermal ANOVA: SMq × VPDq × 𝑇q.
(3) a three-way radiative ANOVA: SMq × VPDq × 𝑆𝑆𝑅.
These designs represent water-supply (SM), atmospheric-demand (VPD), and energy-constraint (Temperature or SSR)
regimes.
For each design, ANOVA decomposed the variability in |ΔIF| according to the general multi-factor model (Eq. B1),540
𝑌 = μ + 𝛼𝑖 + 𝛽𝑗 + 𝛾𝑘 + 𝛿𝑙 + (𝛼𝛽)𝑖𝑗 + (𝛼𝛾)𝑖𝑘 + (𝛽𝛾)𝑗𝑘 + (𝛼𝛽𝛾)𝑖𝑗𝑘 +· · · +𝜀𝑖𝑗𝑘𝑙, (B1)
In this model, Y denotes the ΔIF values for each combination of SM, VPD, and T/SSR quartiles. The term μis the grand mean,
while
αi,βj,γk and
δl represent the main effects of SM, VPD, T, and SSR quartiles. The interaction terms
αβij,αγik,βγjk, and
(αβγ)ijk capture how combinations of these factors jointly modify ΔIF beyond their individual effects. The residual
εijkl
accounts for unexplained variability.545
In Eq. (B2), the total variability was partitioned into sums of squares using
𝑆𝑆𝑇𝑜𝑡𝑎𝑙 = ∑ (𝑦𝑡 − 𝑦̅)2𝑁
𝑡=1 (B2)
Here, 𝑦𝑡 represents each ΔIF value, 𝑦̅ is the overall mean across all ΔIF values, and 𝑆𝑆𝑇𝑜𝑡𝑎𝑙 measures the total variability in
ΔIF before attributing it to any factor or interaction.
In Eq. (B3),550
𝑆𝑆𝑋 = ∑ 𝑛𝑖(𝑦𝑖̅ − 𝑦̅ )2
𝑖 (B3)
𝑆𝑆𝑋 quantifies the amount of ΔIF variability explained by a specific factor X (SM, VPD, temperature, SSR). Here, 𝑦𝑖̅ is the
mean ΔIF for level
i of factor X,
ni is the number of observations in that level, and 𝑦̅ is the overall mean. The same structure
applies to interaction terms (e.g., 𝑆𝑆𝑆𝑀×𝑉𝑃𝐷), where the means 𝑦𝑖̅𝑗 correspond to pairs (or triples) of factor levels.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
25
The residual variability is (Eq. B4),555
𝑆𝑆𝐸𝑟𝑟𝑜𝑟 = 𝑆𝑆𝑇𝑜𝑡𝑎𝑙 − ∑ 𝑆𝑆𝑋𝑋 (B4)
represents the portion of ΔIF not accounted for by any main factor or interaction term.
To characterize the strength of each regime effect, the bias-corrected omega-squared statistic was used (Eq. B5),
𝜔𝑋 =
2 𝑆𝑆𝑋−𝑑𝑓𝑋 𝑀𝑆𝐸𝑟𝑟𝑜𝑟
𝑆𝑆𝑇𝑜𝑡𝑎𝑙+ 𝑀𝑆𝐸𝑟𝑟𝑜𝑟
(B5)
This equation defines omega-squared for factor X, which measures the proportion of the variance in ΔIF that is attributable to560
that factor after correcting for bias. 𝑆𝑆𝑋 is the sum of squares explained by factor X, and 𝑑𝑓𝑋 is the degrees of freedom
associated with it. 𝑀𝑆𝐸𝑟𝑟𝑜𝑟 is the mean square of the residual error and equal to 𝑀𝑆𝐸𝑟𝑟𝑜𝑟 = 𝑆𝑆𝐸𝑟𝑟𝑜𝑟 /𝑑𝑓𝐸𝑟𝑟𝑜𝑟. 𝑆𝑆𝑇𝑜𝑡𝑎𝑙 is the
total sum of squares of ΔIF.
Omega-squared provides a bias-corrected estimate of the fraction of total ΔIF variability explained by factor X. Larger values
of 𝜔𝑋
2 indicate that the environmental regime represented by X plays a stronger role in shaping ΔIF.565
The corresponding physically interpretable magnitude was given by the explained standard deviation (Eq. B6),
𝑆𝐷ₓ = 𝜎ᵧ √𝜔ₓ2 (B6)
expressed in the same units as |ΔIF|, where 𝜎ᵧ is the standard deviation of ΔIF and 𝜔ₓ2 is the variance explained by factor X.
Bootstrap resampling within each SM×VPD (or SM×VPD×T / SM×VPD×SSR) regime provided 95% confidence intervals
for both 𝜔2 and 𝑆𝐷.570
Code and data availability. The ERA5 climate variable data are publicly available from the Copernicus Climate Data Store at
https://cds.climate.copernicus.eu/. The GLASS GPP and LAI datasets (Liang et al., 2021) are accessible at www.glass.umd.edu.
The scripts used to compute the rate of information transfer and to generate the figures presented in this study are available at
(https://github.com/FareehaSiddique/Conditioners-LKIF).
575
Author contribution. FS, DFTH, and GW conceptualized and designed the study. FS and DFTH developed and implemented
the computational workflow, performed the analyses, produced the figures, and interpreted the results. FS and DFTH wrote
the manuscript with contributions from GW. DD and SV contributed to the methodological design and interpretation of the
results. DD also provided feedback and suggestions to improve the figures. DD, SV, and GW reviewed and edited the
manuscript. All authors reviewed the final version of the manuscript.580https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
26
Competing interests. The authors declare that they have no conflict of interest.
Acknowledgements. We are grateful to X. San Liang for his valuable discussions and for developing the Information Flow
framework that forms the foundation of this work. We also thank Diego G. Miralles for helpful feedback on the manuscript,
as well as for his broader contributions to the understanding of land–atmosphere interactions. We further thank Rukhshinda
Aftab and Feihong Zhou for their support and constructive discussions throughout this study.585
Financial support. This study was supported by the NSFC–FWO Bilateral Research Cooperation Program CausalHeat
(G0AOO25N), and by the National Natural Science Foundation of China (Regular Project: Causal Inference of Vegetation–
Climate Interactions, Project Number: 42275028). DD is funded by the Novo Nordisk Foundation (NNF) IcyAlert project
(grant no. NNF25OC0097271).
References590
Cui, J., Piao, S., Huntingford, C., Wang, X., Lian, X., Chevuturi, A., Turner, A. G., and Kooperman, G. J.: Vegetation forcing
modulates global land monsoon and water resources in a CO₂-enriched climate, Nat. Commun., 11, 1–11,
https://doi.org/10.1038/s41467-020-18992-7, 2020.
Docquier, D., Vannitsem, S., and Bellucci, A.: The rate of information transfer as a measure of ocean–atmosphere interactions,
Earth Syst. Dynam., 14, 577–591, https://doi.org/10.5194/esd-14-577-2023, 2023.595
Docquier, D., Di Capua, G., Donner, R. V., Pires, C. A. L., Simon, A., and Vannitsem, S.: A comparison of two causal methods
in the context of climate analyses, Nonlinear Process. Geophys., 31, 115–136, https://doi.org/10.5194/npg-31-115-2024, 2024.
Dubey, N., and Ghosh, S.: The relative role of soil moisture and vapor pressure deficit in affecting the Indian vegetation
productivity, Environ. Res. Lett., 18, 064012, https://doi.org/10.1088/1748-9326/acd2ef, 2023.
Feldpausch, T. R., Phillips, O. L., Brienen, R. J. W., Gloor, E., Lloyd, J., Lopez-Gonzalez, G., Monteagudo-Mendoza, A.,600
Malhi, Y., Alarcón, A., Álvarez Dávila, E., Alvarez-Loayza, P., Andrade, A., Aragao, L. E. O. C., Arroyo, L., Aymard C., G.
A., Baker, T. R., Baraloto, C., Barroso, J., Bonal, D., … Vos, V. A.: Amazon forest response to repeated droughts, Glob.
Biogeochem. Cycles, 30, 964–982, https://doi.org/10.1002/2015GB005133, 2016.
Ficklin, D. L., and Novick, K. A.: Historic and projected changes in vapor pressure deficit suggest a continental-scale drying
of the United States atmosphere, J. Geophys. Res.-Atmos., 122, 2061–2079, https://doi.org/10.1002/2016JD025855, 2017.605https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
27
Green, J. K., Konings, A. G., Alemohammad, S. H., Berry, J., Entekhabi, D., Kolassa, J., Lee, J. E., and Gentine, P.: Regionally
strong feedbacks between the atmosphere and terrestrial biosphere, Nat. Geosci., 10, 410–414,
https://doi.org/10.1038/ngeo2957, 2017.
Hagan, D. F. T., Wang, G., Liang, X. S., and Dolman, H. A. J.: A time-varying causality formalism based on the Liang-
Kleeman information flow for analyzing directed interactions in nonstationary climate systems, J. Climate, 32, 7521–7537,610
https://doi.org/10.1175/JCLI-D-18-0881.1, 2019.
Krich, C., Runge, J., Miralles, D. G., Migliavacca, M., Perez-Priego, O., El-Madany, T., Carrara, A., and Mahecha, M. D.:
Estimating causal networks in biosphere–atmosphere interaction with the PCMCI approach, Biogeosciences, 17, 1033–1061,
https://doi.org/10.5194/bg-17-1033-2020, 2020.
Liang, X. S.: The Liang–Kleeman information flow: Theory and applications, Entropy, 15, 327–360,615
https://doi.org/10.3390/e15010327, 2013.
Liang, X. S.: Unraveling the cause–effect relation between time series, Phys. Rev. E, 90, 052150,
https://doi.org/10.1103/PhysRevE.90.052150, 2014.
Liang, X. S.: Information flow and causality as rigorous notions ab initio, Phys. Rev. E, 94, 052201,
https://doi.org/10.1103/PhysRevE.94.052201, 2016.620
Liang, X. S.: Normalized multivariate time series causality analysis and causal graph reconstruction, Entropy, 23, 679,
https://doi.org/10.3390/e23060679, 2021.
Liang, S., Cheng, J., Jia, K., Jiang, B., Liu, Q., Xiao, Z., Yao, Y., et al.: The global land surface satellite (GLASS) product
suite, Bull. Am. Meteorol. Soc., 102, E323–E337, https://doi.org/10.1175/BAMS-D-18-0341.1, 2021.
Liu, L., Gudmundsson, L., Hauser, M., Qin, D., Li, S., and Seneviratne, S. I.: Soil moisture dominates dryness stress on625
ecosystem production globally, Nat. Commun., 11, 1–10, https://doi.org/10.1038/s41467-020-18631-1, 2020.
Novick, K. A., Ficklin, D. L., Stoy, P. C., Williams, C. A., Bohrer, G., Oishi, A. C., Papuga, S. A., et al.: The increasing
importance of atmospheric demand for ecosystem water and carbon fluxes, Nat. Clim. Change, 6, 1023–1027,
https://doi.org/10.1038/nclimate3114, 2016.
Papagiannopoulou, C., Miralles, D. G., Dorigo, W. A., Verhoest, N. E. C., Depoorter, M., and Waegeman, W.: Vegetation630
anomalies caused by antecedent precipitation in most of the world, Environ. Res. Lett., 12, 074016,
https://doi.org/10.1088/1748-9326/aa7145, 2017.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
28
Piao, S., Wang, X., Park, T., Chen, C., Lian, X., He, Y., et al.: Characteristics, drivers and feedbacks of global greening, Nat.
Rev. Earth Environ., 1, 14–27, https://doi.org/10.1038/s43017-019-0001-x, 2020.
Pires, C. A., Docquier, D., and Vannitsem, S.: A general theory to estimate information transfer in nonlinear systems, Physica635
D, 458, 133988, https://doi.org/10.1016/j.physd.2023.133988, 2024.
Ruddell, B. L., and Kumar, P.: Ecohydrologic process networks: 1. Identification, Water Resour. Res., 45, W03419,
https://doi.org/10.1029/2008WR007279, 2009.
Shao, Y., Hagan, D. F. T., Li, S., Zhou, F., Zou, X., and Cabral, P.: The many shades of the vegetation–climate causality: A
multimodel causal appreciation, Forests, 15, 81430, https://doi.org/10.3390/f15081430, 2024.640
Sperry, J. S., Venturas, M. D., Anderegg, W. R. L., Mencuccini, M., Mackay, D. S., Wang, Y., and Love, D. M.: Predicting
stomatal responses to the environment from the optimization of photosynthetic gain and hydraulic cost, Plant Cell Environ.,
40, 816–830, https://doi.org/10.1111/pce.12852, 2017.
Stips, A., Macias, D., Coughlan, C., Garcia-Gorriz, E., and Liang, X. S.: On the causal structure between CO₂ and global
temperature, Sci. Rep., 6, 21691, https://doi.org/10.1038/srep21691, 2016.645
Sun, C., and Yang, S.: Persistent severe drought in southern China during winter–spring 2011: Large-scale circulation patterns
and possible impacting factors, J. Geophys. Res.-Atmos., 117, D10112, https://doi.org/10.1029/2012JD017500, 2012.
Upreti, H., and Ojha, C. S. P.: Estimation of relative humidity and dew point temperature using limited meteorological data,
J. Irrig. Drain. Eng., 143, 04017034, https://doi.org/10.1061/(ASCE)IR.1943-4774.0001225, 2017.
Vannitsem, S., Pires, C. A., and Docquier, D.: Causal dependencies and Shannon entropy budget: Analysis of a reduced-order650
atmospheric model, Q. J. R. Meteorol. Soc., 150, 4066–4085, https://doi.org/10.1002/qj.4805, 2024.
Vannitsem, S., Liang, X. S., and Pires, C. A.: Nonlinear causal dependencies as a signature of the complexity of the climate
dynamics, Earth Syst. Dynam., 16, 703–719, https://doi.org/10.5194/esd-16-703-2025, 2025.
Yuan, W., Zheng, Y., Piao, S., Ciais, P., Lombardozzi, D., Wang, Y., et al.: Increased atmospheric vapor pressure deficit
reduces global vegetation growth, Sci. Adv., 5, eaax1396, https://doi.org/10.1126/sciadv.aax1396, 2019.655
Zhong, Z., He, B., Wang, Y.-P., Chen, H. W., Chen, D., Fu, Y. H., et al.: Disentangling the effects of vapor pressure deficit
on northern terrestrial vegetation productivity, Sci. Adv., 9, adf3166, https://doi.org/10.1126/sciadv.adf3166, 2023.https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.
29
Zhou, F., Hagan, D. F. T., Wang, G., Liang, X. S., Li, S., Shao, Y., Yeboah, E., and Wei, X.: Estimating time-dependent
structures in a multivariate causality for land–atmosphere interactions, J. Climate, 37, 1853–1876,
https://doi.org/10.1175/JCLI-D-23-0207.1, 2024.660
Zhou, S., Williams, A. P., Berg, A. M., Cook, B. I., Zhang, Y., Hagemann, S., Lorenz, R., Seneviratne, S. I., and Gentine, P.:
Land–atmosphere feedbacks exacerbate concurrent soil drought and atmospheric aridity, Proc. Natl. Acad. Sci. U.S.A., 116,
18848–18853, https://doi.org/10.1073/pnas.1904955116, 2019.
665https://doi.org/10.5194/egusphere-2026-267
Preprint. Discussion started: 26 January 2026
c© Author(s) 2026. CC BY 4.0 License.