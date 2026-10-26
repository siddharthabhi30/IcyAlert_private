# Full-text extraction

- Title: Drivers of Summer Arctic Sea-Ice Extent at Interannual Time Scale in CMIP6 Large Ensembles Revealed by Information Flow
- Year: 2024
- DOI: https://doi.org/10.1038/s41598-024-76056-y
- PDF source: https://www.nature.com/articles/s41598-024-76056-y.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                                                                                     www.nature.com/scientificreports




                OPEN             Drivers of summer Arctic sea-ice
                                 extent at interannual time scale in
                                 CMIP6 large ensembles revealed by
                                 information flow
                                 David Docquier1, François Massonnet2, Francesco Ragone1,2, Annelies Sticker2,
                                 Thierry Fichefet2 & Stéphane Vannitsem1,3
                                 Arctic sea-ice extent has strongly decreased since the beginning of satellite observations in the late
                                 1970s. While several drivers are known to be implicated, their respective contribution is not fully
                                 understood. Here, we apply the Liang-Kleeman information flow method to five different large
                                 ensembles from the Coupled Model Intercomparison Project Phase 6 (CMIP6) over the 1970-2060
                                 period to investigate the extent to which fluctuations in winter sea-ice volume, air temperature and
                                 ocean heat transport drive changes in subsequent summer Arctic sea-ice extent. This allows us to
                                 go beyond classical correlation analyses. Results show that air temperature is the most important
                                 controlling factor of summer sea-ice extent at interannual time scale, and that winter sea-ice
                                 volume and Atlantic Ocean heat transport play a secondary role. If we replace air temperature by net
                                 shortwave and downward longwave radiations, we find that the sum of influences from both radiations
                                 is almost similar to the air temperature influence, with the longwave radiation being dominant in
                                 driving changes in summer sea-ice extent. Finally, we find that the influence of air temperature is more
                                 prominent during periods of large sea-ice reduction and that this temperature influence has overall
                                 increased since 1970.

                                 Keywords Arctic sea ice, Causality, Large ensembles, Air temperature, Ocean heat transport, Atmospheric
                                 heat fluxes

                                 Recent changes in Arctic sea ice are one of the key indicators of the ongoing climate change1. The annual mean
                                 Arctic sea-ice extent has linearly decreased by 2.2 million km2 (−17 %) between 1979 and 2023, with the largest
                                 changes occurring in summer (−44 %) compared to winter (−11 %) based on satellite observations2–5. According
                                 to climate model projections, the Arctic Ocean could be ice free in summer before the middle of this century6–12,
                                 although results depend on the greenhouse gas emission scenario1 and on internal climate variability13–15. In this
                                 context, understanding the causes of the recent Arctic sea-ice loss is highly important. Both anthropogenic global
                                 warming and internal climate variability have played a role in these changes1,16–20, but the relative contribution
                                 from atmospheric and ocean processes leading to these changes is far from being understood.
                                     Arctic sea-ice variability has been shown to be primarily driven by advected air temperature based on
                                 observations, reanalyses and global climate model (GCM) simulations, especially in summer21. In addition,
                                 summertime atmospheric circulation may have contributed as much as 60 % to the September sea-ice extent
                                 decline between 1979 and 2014, through changes in low-level air temperature, integrated atmospheric water
                                 vapour and downward longwave radiation22. While the Arctic Oscillation (AO) was suspected to drive summer
                                 sea-ice extent in earlier studies23, sea-ice extent has continued to decrease regardless of the atmospheric mode24.
                                 Previous causality analysis with the Liang-Kleeman information flow method showed that the AO does not
                                 influence Arctic sea-ice area based on the EC-Earth3 large ensemble25. Atmospheric surface heat fluxes have also
                                 contributed to Arctic sea-ice changes, e.g. the enhanced absorbed shortwave radiation resulting from a reduced
                                 surface albedo leads to further sea-ice decline via the ice-albedo feedback26–28. The previous winter sea-ice extent
                                 and volume are important in setting the course of the following summer sea-ice extent24,29. Furthermore, ocean
                                 heat transport to the Arctic, mainly via the Barents Sea Opening, Fram Strait and Bering Strait, has been shown

                                 1Dynamical Meteorology and Climatology Unit, Royal Meteorological Institute of Belgium, Brussels, Belgium.
                                 2Earth and Climate Research Center, Earth and Life Institute, Université catholique de Louvain, Louvain-
                                 la-Neuve, Belgium. 3Division of Frontier Research, Southern Marine Laboratory, Zhuhai, China. email:
                                 david.docquier@meteo.be


Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                  1
www.nature.com/scientificreports/


                                 to strongly impact Arctic sea ice5,30–35, although this influence mainly occurs in winter25,36,37, when the sea-ice
                                 pack is more extensive.
                                     Previous studies mainly used correlation and regression analyses to infer causal influences, but correlation
                                 does not necessarily imply causation. A significant correlation simply means that there is a relationship, or
                                 synchronous behavior, between two variables without explicitly confirming a causal link between the two. Causal
                                 methods are useful in identifying cause-effect relationships and have started to be widely used in the context
                                 of Earth system sciences38. Contrarily to correlation, they allow to remove spurious links, identify directional
                                 dependencies between variables as well as the presence of confounding variables, and can be used in a multivariate
                                 framework. One such causal method, directly derived from the propagation of information entropy between
                                 variables, is the Liang-Kleeman information flow39–41. It provides a simple expression of the information flowing
                                 from one variable to the other using covariances between all pairs of variables as well as covariances between
                                 all variables and the time derivative of the target variable (see Methods). This causal method assumes linearity
                                 and can be used in the context of this study as the relationships between the variables used here are roughly
                                 linear (e.g. sea-ice extent vs. surface air temperature7,42 and sea-ice extent vs. ocean heat transport43,44), but
                                 we acknowledge that some nonlinear processes could appear and are not taken into account. Also, the method
                                 assumes stationarity and this is dealt with by removing the linear trend (see Methods). This method has recently
                                 been used in various climate studies25,45–49. The first study to apply the method to understand the causes of
                                 recent past and future Arctic sea ice25 showed that surface air temperature, sea-surface temperature and ocean
                                 heat transport were the most important drivers. However, the latter study only investigated one large model
                                 ensemble (EC-Earth3), did not consider the preconditioning (previous winter sea-ice volume) as well as surface
                                 atmospheric heat fluxes, and did not separate periods of large sea-ice reduction from the rest. In our analysis,
                                 we use five different large model ensembles (Table 1, Methods) and compute the rate of information transfer
                                 to better understand the causes of recent and future summer Arctic sea-ice changes at interannual time scale,
                                 including the specific analysis of periods of large sea-ice reduction.

                                 Results
                                 Drivers of summer sea-ice extent
                                 Our period of analysis is from 1970 to 2060. This period is chosen based on the constraints that (i) one of the
                                 large ensembles (EC-Earth3) was run only from 1970 and (ii) ice-free conditions (sea-ice extent below 1 million
                                 km2) in summer (September) are reached for all models (except MPI-ESM1.2-LR) from 2060 onwards (Fig. 1a).
                                 The ensemble mean summer sea-ice extent ranges from 6.9 to 9.1 million km2 in 1970 for the different models to
                                 values between 0.2 and 1.5 million km2 in 2060, with a complete disappearance of summer sea ice by the end of
                                 this century based on the Shared Socioeconomic Pathway 3-7.0 (SSP3-7.0; Fig. 1a). Both ACCESS-ESM1.5 and
                                 MPI-ESM1.2-LR capture the mean summer sea-ice extent reasonably well over the observational time period,
                                 while EC-Earth3 and CanESM5 overestimate it, and CESM2 clearly underestimates it. CESM2 experiences a
                                 unique behavior, with a sharp decline in summer sea-ice extent in the 1990s and 2000s, followed by a recovery
                                 until ∼ 2025, before declining again until the end of the century. The CESM2 behavior is linked to a change
                                 in the biomass burning emission variability through aerosol-cloud interactions50. A common feature is the
                                 large ensemble spread for all models considered, which shows the need for using large ensembles. For a more
                                 detailed visualization of the different members for each separate model, we redirect the interested reader to
                                 Supplementary Figs. S1-S5.
                                     Associated with the strong reduction in summer sea-ice extent, the winter (March) sea-ice extent also
                                 decreases through the recent past and twenty-first century according to all model simulations, although at
                                 a much smaller rate than summer sea-ice extent, except for CanESM5, which displays a large negative trend
                                 (Fig. 1b). Winter sea-ice volume also shows a strong decrease over the whole period, with ACCESS-ESM1.5 and
                                 MPI-ESM1.2-LR being relatively close to the PIOMAS reanalysis51 over the observational period, EC-Earth3 and
                                 CanESM5 overestimating it, and CESM2 underestimating it (Fig. 1c). The annual mean surface air temperature
                                 averaged over the Arctic regions (poleward of 70◦N) increases from ∼ −15◦C (multi-model average) in 1970
                                 to ∼ −7◦C in 2060 (Fig. 1d). CanESM5 and EC-Earth3 have the largest surface air temperature increases
                                 (Fig. 1d), which go in hand with the large decreases in summer sea-ice extent for these two models (Fig. 1a).
                                 Both the Atlantic and Pacific Ocean heat transports to the Arctic increase from 1970 to 2060 (see Methods for
                                 the computation), but with large differences in mean values and trends between models (Fig. 1e,f). ACCESS-
                                 ESM1.5 has a reasonable annual mean Atlantic Ocean heat transport over the historical period compared to


                                  Model                 Members   Atm. model   Atm. resolution          Ocean-SI model   Ocean resolution
                                                                                    ◦
                                  EC-Earth371–73        50        IFS cy36r4   0.7 (30 km)              NEMO3.6-LIM3     1◦ (50 km)
                                                                                ◦
                                  CESM274               50        CAM6         1 (50 km)                POP2-CICE5       1◦ (40 km)
                                                                                    ◦
                                  MPI-ESM1.2-LR75–77    30        ECHAM6       1.8 (70 km)              MPIOM            1.5◦ (40 km)
                                                                                    ◦
                                  CanESM578–80          49        CanAM5       2.8 (110 km)             NEMO3.4-LIM2     1◦ (50 km)
                                  ACCESS-ESM1.581–83    40        UM           1.875◦ × 1.25◦ (70 km)   MOM5-CICE4       1◦ (40 km)


                                 Table 1. Large ensembles used in this study. References are provided for each model, along with the number of
                                 members used here, the atmospheric (atm.) model and its nominal resolution, and the ocean-sea ice (ocean-
                                 SI) model and its nominal resolution. The resolution at 70 ◦N is also provided in parentheses for both the
                                 atmosphere and ocean.


Scientific Reports |   (2024) 14:24236                 | https://doi.org/10.1038/s41598-024-76056-y                                               2
www.nature.com/scientificreports/




                                 Fig. 1. Time series of summer sea-ice extent and its drivers. Time series of the different variables for the five
                                 large ensembles using CMIP6 historical (1970-2014) and SSP3-7.0 (2015-2100) simulations. Solid colored
                                 curves represent ensemble means and shading shows the ensemble spread (between minimum and maximum).
                                 Black dashed lines represent observations / reanalyses. (a) Summer (September) Arctic sea-ice extent. (b)
                                 Winter (March) Arctic sea-ice extent. (c) Winter (March) Arctic sea-ice volume. (d) Annual mean Arctic 2m
                                 air temperature. (e) Annual mean Atlantic Ocean heat transport (OHT). (f) Annual mean Pacific OHT. (g)
                                 Annual mean net shortwave radiation (SWR). (h) Annual mean downward longwave radiation (LWR).




Scientific Reports |   (2024) 14:24236              | https://doi.org/10.1038/s41598-024-76056-y                                                3
www.nature.com/scientificreports/


                                 the ORAS5 reanalysis52, while all other models underestimate it (Fig. 1e). EC-Earth3 and CanESM5 display
                                 the largest increases in Atlantic Ocean heat transport, however with a more progressive increase for the former
                                 model and an acceleration followed by a deceleration for the latter model (Fig. 1e). The Atlantic Ocean heat
                                 transport increases at lower pace for MPI-ESM1.2-LR and ACCESS-ESM1.5, and it remains at relatively low
                                 values for CESM2 through the whole simulation (Fig. 1e). On the Pacific side, the modeled ocean heat transport
                                 is in better agreement with the ORAS5 reanalysis than on the Atlantic side during the observational period,
                                 except for EC-Earth3, which clearly overestimates it (Fig. 1f).
                                     Based on these time series, it is tempting to conclude that the decrease in winter sea-ice extent and volume,
                                 the increase in surface air temperature and the increase in Atlantic and Pacific Ocean heat transports have been
                                 contributing to the reduction in summer sea-ice extent over the recent past and future periods. However, as
                                 already explained, correlation does not necessarily imply causation. In order to remove spurious dependencies
                                 based on correlations and identify true causal links, we compute the rate of information transfer from all
                                 potential drivers considered above (winter sea-ice volume, Arctic surface air temperature, and Atlantic and
                                 Pacific Ocean heat transports) to our target variable (summer sea-ice extent) based on the Liang-Kleeman
                                 information flow41. We make this calculation over the whole period for each model member separately (after
                                 having removed the ensemble mean, which allows to remove the trend) and then compute the model ensemble
                                 mean, taking into account a 5 % significance level (see Methods). Note that the data are not perfectly stationary
                                 after this detrending, but we prefer not to perform any additional data processing to introduce as few changes in
                                 the original data as possible.
                                     Such a computation shows that surface air temperature is clearly the main driver of changes in summer
                                 Arctic sea-ice extent over the period 1970-2060, with all models displaying a statistically significant influence
                                 (Fig. 2a). This result goes in hand with previous studies, which find that surface air temperature leads to strong
                                 changes in summer Arctic sea ice via direct ice melting or via the ice-albedo feedback4,18,42,53. Winter sea-ice
                                 volume appears to be the second main driver (a precursor, more precisely), although two models do not show
                                 a significant influence. A thinner ice pack at the end of the growth season increases the likelihood of reduced
                                 sea-ice extent during summer29. Atlantic Ocean heat transport also plays a role in driving summer sea-ice
                                 extent, but only for two models. This is in agreement with previous studies showing that the Atlantification




                                 Fig. 2. Drivers of summer sea-ice extent over 1970-2060. (a) Rate of information transfer (absolute value)
                                 from winter sea-ice volume (WSIV), 2m air temperature (T2m), Atlantic Ocean heat transport (OHTAtl ) and
                                 Pacific OHT (OHTP ac) to summer sea-ice extent over 1970-2060. (b) Corresponding correlation coefficients.
                                 Colored circles represent the ensemble means of the five large ensembles, with significant values at the 5 %
                                 level highlighted by black contours (the number of members for each model is indicated in parentheses in
                                 the legend). The rates of information transfer and correlation coefficients are first computed for each different
                                 member, and then the ensemble mean is computed. Crosses show observations/reanalyses, with significant
                                 values highlighted by black circles.


Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                    4
www.nature.com/scientificreports/


                                 (i.e. the increasing influence of the warmer and saltier Atlantic water into the Arctic) is under way30,32. Pacific
                                 Ocean heat transport does not influence summer sea-ice extent for any of the models used here, although we
                                 note that the model ocean resolution is 40-50 km at 70◦N, while the width of the Bering Strait is 80 km. Note
                                 that meridional surface wind speed and atmospheric circulation (taken as 300 hPa geopotential height) do
                                 not have any influence on summer sea-ice extent for the models considered here (Supplementary Figs. S6-S7).
                                 An additional analysis with sea-surface temperature shows that it has an influence on summer sea-ice extent
                                 only for one model (Supplementary Fig. S8), and it mainly has an indirect effect via surface air temperature
                                 (not shown). The rates of information transfer coming from observations and reanalyses are relatively small
                                 and not significant (Fig. 2a), even for air temperature, but the computation is based on a relatively short time
                                 period (1979-2018) with only one realization. As the method needs a sufficiently long time series, results from
                                 observations and reanalyses are just indicative and cannot be used in terms of model evaluation.
                                     It is particularly interesting to compare the rates of information transfer with the corresponding correlation
                                 coefficients between summer sea-ice extent and all other variables. In most cases (75%), correlations are
                                 statistically significant (Fig. 2b). Five significant correlations are not associated with a significant causal
                                 influence on summer sea-ice extent, i.e. from winter sea-ice volume for two models and from Pacific Ocean
                                 heat transport for three models. This means that if we had based our analysis only on correlations, we would
                                 have erroneously inferred an influence of Pacific Ocean heat transport on summer sea-ice extent. As such, the
                                 Liang-Kleeman information flow method allows us to remove spurious dependencies based on correlation
                                 analyses only. However, we acknowledge that this result is true for the summer period (an influence from the
                                 Pacific OHT could appear in winter, when the sea-ice cover is larger) and considering the main limitation of
                                 the method (linearity assumption). Despite the short time period, the observed correlation between surface air
                                 temperature and summer sea-ice extent is statistically significant; however, the causal analysis shows that there
                                 is no significant influence from surface air temperature to summer sea-ice extent in the observations. We stress
                                 again that this finding should be taken with care since the sample size in observations is severely limited by the
                                 length of the observational period.
                                     The combination of rates of information transfer (Fig. 2a) with correlation coefficients (Fig. 2b) allows to
                                 provide information on how a specific variable affects the target variable. In our case, since winter sea-ice volume
                                 influences summer sea-ice extent in three models and the correlation coefficient is positive, this means that
                                 a decrease in winter sea-ice volume results in a reduction in summer sea-ice extent for these three models.
                                 Surface air temperature influences summer sea-ice extent for all models, with a negative correlation coefficient,
                                 meaning that an increase in surface air temperature leads to a reduction in summer sea-ice extent, in agreement
                                 with previous literature21,22,42. For two models (EC-Earth3 and CanESM5), an increase in Atlantic Ocean
                                 heat transport leads to a decrease in summer sea-ice extent, which also goes in the same direction as previous
                                 studies33, even if this impact is reduced in summer compared to winter25.
                                     When replacing winter sea-ice volume by winter sea-ice extent, the latter has less influence on summer sea-
                                 ice extent for all models, and only EC-Earth3 shows a significant rate of information transfer (Supplementary
                                 Fig. S9). Additionally, the influence of surface air temperature becomes slightly larger (compared to the case in
                                 which sea-ice volume is included), which compensates for the decreased influence of winter sea-ice extent. The
                                 Atlantic and Pacific Ocean heat transport influences remain very similar between the case with winter sea-ice
                                 volume and the one with winter sea-ice extent. These results suggest that it is important to consider not only the
                                 areal extent of winter sea ice, but also winter sea-ice thickness (e.g. through sea-ice volume), as a precursor of
                                 summer sea-ice extent variations54.

                                 Atmospheric surface heat fluxes
                                 Due to the prominent role of Arctic surface air temperature in driving changes in summer sea-ice extent and the
                                 tight connection between surface air temperature and atmospheric surface heat fluxes, we then replace annual
                                 mean surface air temperature by annual mean net shortwave and downward longwave radiations and repeat the
                                 causal analysis. Turbulent heat fluxes are not considered here because they are oriented towards the atmosphere
                                 for all models on an annual basis, suggesting that these fluxes respond rather than drive sea-ice variability, in
                                 agreement with previous studies55–57. However, it might well be that during certain seasons, these fluxes are
                                 oriented towards the surface, which would imply a possible driving influence of the turbulent heat fluxes on
                                 sea-ice extent.
                                     EC-Earth3, CanESM5 and ACCESS-ESM1.5 present radiation values that are in broad agreement with
                                 satellite observations over the recent period, while CESM2 and MPI-ESM1.2-LR underestimate the net
                                 shortwave radiation (Fig. 1g) and overestimate the downward longwave radiation (Fig. 1h). Previous studies
                                 have analyzed the role of atmospheric fluxes in driving changes in Arctic sea ice35,58,59, but this is the first time a
                                 causal method is used to make such an analysis.
                                     We find that the downward longwave radiation is the most important driver of changes in summer sea-ice
                                 extent over 1970-2060, with all models displaying a significant impact (Fig. 3a). The influence of downward
                                 longwave flux was also found in previous studies22,35,55,60–62. According to Burt et al.60, a thinner sea-ice
                                 cover leads to larger surface air temperature, increased water vapor and enhanced cloud cover, which results
                                 in increased downward longwave radiation, ultimately leading to further sea-ice melting. The net shortwave
                                 radiation also has some influence, but only for two models (EC-Earth3 and CESM2; Fig. 3a). Shortwave radiation
                                 is tightly linked to the ice-albedo feedback, which mainly operates in spring and summer28: as the atmosphere
                                 warms, sea-ice extent decreases, leading to enhanced open-water area. As the ocean has a much lower albedo
                                 than sea ice, this results in an increased absorption of shortwave radiation, a warmer atmosphere and more sea-
                                 ice melting. The larger influence of downward longwave radiation compared to net shortwave radiation will be
                                 analyzed in more details in the next section, in which we look at the temporal evolution of the causal influences.



Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                     5
www.nature.com/scientificreports/




                                 Fig. 3. Drivers of summer sea-ice extent over 1970-2060, including surface heat fluxes. (a) Rate of information
                                 transfer (absolute value) from winter sea-ice volume (WSIV), net (downward) shortwave radiation (NSWR),
                                 downward longwave radiation (DLWR), Atlantic Ocean heat transport (OHTAtl ) and Pacific OHT (OHTP ac)
                                 to summer sea-ice extent over 1970-2060. (b) Corresponding correlation coefficients. Colored circles represent
                                 the ensemble means of the five large ensembles, with significant values at the 5% level highlighted by black
                                 contours (the number of members for each model is indicated in parentheses in the legend). The rates of
                                 information transfer and correlation coefficients are first computed for each different member, and then the
                                 ensemble mean is computed.



                                     All other influences (winter sea-ice volume, Atlantic and Pacific Ocean heat transports) remain similar
                                 compared to the case where we consider surface air temperature, which provides confidence in the robustness
                                 of our results. It is particularly interesting to see that the sum of the rates of information transfer from both net
                                 shortwave and downward longwave radiations to summer sea-ice extent (Fig. 3a) is approximately equal to the
                                 rate of information transfer from surface air temperature alone to sea-ice extent (Fig. 2a). This suggests that the
                                 effect of surface air temperature is comparable to the combined influence of longwave and shortwave radiations.
                                 We will see in the next section that the sum of both radiation influences is relatively similar to the surface air
                                 temperature influence over the majority of the period and for most models.
                                     Combining rates of information transfer (Fig. 3a) with correlation coefficients (Fig. 3b), we show more
                                 precisely that an increase in downward longwave radiation leads to reduced summer Arctic sea-ice extent for
                                 all models, and an increase in net shortwave radiation results in lower sea-ice extent for two models. The sole
                                 analysis of correlation coefficients between summer sea-ice extent and atmospheric surface heat fluxes would
                                 have provided approximately the same contribution to both shortwave and longwave radiations (Fig. 3b).
                                 However, the causal method used here reveals that the latter has a larger impact compared to the former (Fig. 3a).

                                 Non-stationarity of causal influences
                                 In the previous sections, we computed the rate of information transfer between variables over the whole 1970-
                                 2060 period for each different member, after which we computed the ensemble mean rate of information transfer.
                                 However, causal influences of the different potential drivers of summer Arctic sea-ice extent may change over
                                 time. That is why we conduct an additional analysis in which we compute the rate of information transfer across
                                 all members of the same model for each 10-year period (see Methods). This way, we are able to investigate the
                                 temporal evolution of the rate of information transfer from the different drivers to summer sea-ice extent.
                                     We find that the effect of winter sea-ice volume generally decreases until 2060, except for ACCESS-ESM1.5
                                 (Fig. 4a), while the influence of surface air temperature increases over that time period for three models
                                 (CanESM5, MPI-ESM1.2-LR and CESM2; Fig. 4b). For EC-Earth3, the effect of surface air temperature
                                 increases on average until 2030-2040 and sharply decreases afterwards, which provides a negative trend overall
                                 (Fig. 4b). This goes in hand with a decrease in the influence of winter sea-ice volume until 2030-2040, followed

Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                   6
www.nature.com/scientificreports/




                                 Fig. 4. Temporal evolution of drivers of summer sea-ice extent. Temporal evolution of the rate of information
                                 transfer (absolute value) from (a) winter sea-ice volume (SIV), (b) 2m air temperature, (c) Atlantic Ocean
                                 heat transport (OHT), and (d) Pacific OHT to summer sea-ice extent (SIE) for each period of 10 years over
                                 1970–2060 (the starting year is indicated on the x-axis). Temporal evolution of the percentage of (e) years of
                                 sea-ice lows and (f) years of rapid sea-ice decline. The five large ensembles are represented by different colors,
                                 with error bars indicating the 95% confidence level based on bootstrap resampling (the number of members
                                 for each model is indicated in parentheses in the legend). In panels (a) and (b), straight lines represent the
                                 linear regressions for the five different models; solid (dotted) lines are used when the slope is (not) statistically
                                 significant at the 10% level.



                                 by an increase for this model (Fig. 4a). These results suggest that, when the effect of winter sea-ice volume on
                                 summer sea-ice extent is stronger, the influence of surface air temperature is lower, and conversely. However, the
                                 influence of winter sea-ice volume from CESM2 and ACCESS-ESM1.5 is not significant over the main part of
                                 the period. Also, the influence of surface air temperature from ACCESS-ESM1.5 exhibits an oscillatory behavior,
                                 with a first peak in 1980-1990, followed by a second peak in 2040-2050.
                                     The impact of Atlantic and Pacific Ocean heat transports remains relatively small over the whole period
                                 (Fig. 4c,d), with the exception of the influence of Atlantic Ocean heat transport in 1970-1990 and 2010-2020
                                 for CanESM5 (Fig. 4c). A strong increase in Atlantic Ocean heat transport is modeled by CanESM5 in 2010-
                                 2020 (Fig. 1e), and it could explain the increased influence over that period. EC-Earth3 also shows a significant
                                 influence of Atlantic Ocean heat transport in the beginning of the period, but with relatively small values
                                 of the rate of information transfer (Fig. 4c). The effect of the four drivers (winter sea-ice volume, surface air
                                 temperature, Atlantic and Pacific Ocean heat transports) does not change substantially when looking at five-year
                                 periods instead of 10 years, but error bars become larger due to the lower number of years taken into account
                                 (Supplementary Fig. S10).
                                     We then replace surface air temperature by net shortwave and downward longwave radiations and repeat
                                 the analysis for each 10-year period. The temporal evolution of the net shortwave radiation influence displays
                                 a general decrease (except for MPI-ESM1.2-LR; Fig. 5a). This suggests that, as the sea-ice extent progressively
                                 decreases over the twenty-first century, the effect of the ice-albedo feedback is reduced. This could partly explain
                                 why the effect of the shortwave radiation is lower compared to the longwave radiation when computed over
                                 the whole 1970-2060 period (Fig. 3a). The influence of the downward longwave radiation generally increases
                                 for three models (MPI-ESM1.2-LR, CanESM5 and CESM2), while the trend is close to 0 for ACCESS-ESM1.5
                                 and slightly negative for EC-Earth3 (Fig. 5b). This makes sense from a physical point of view, as the progressive
                                 reduction in sea-ice extent and thickness increases surface air temperature, water vapor and cloudiness, leading
                                 to enhanced downward longwave radiation and further melting of sea ice.



Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                    7
www.nature.com/scientificreports/




                                 Fig. 5. Temporal evolution of drivers of summer sea-ice extent, including surface heat fluxes. Temporal
                                 evolution of the rate of information transfer (absolute value) from (a) net shortwave radiation (NSWR), (b)
                                 downward longwave radiation (DLWR), (c) sum of both NSWR (dark colors) and DLWR (light colors), (d)
                                 2m air temperature, and (e) difference between the sum of NSWR and DLWR and air temperature to summer
                                 sea-ice extent (SIE) for each period of 10 years over 1970–2060 (the starting year is indicated on the x-axis).
                                 The five large ensembles are represented by different colors, with error bars indicating the 95% confidence level
                                 based on bootstrap resampling. In panels (a) and (b), straight lines represent the linear regressions for the five
                                 different models; solid (dotted) lines are used when the slope is (not) statistically significant at the 10 % level.



                                     Overall, for the majority of models and 10-year periods (82 % of the case), the influence of downward
                                 longwave radiation is larger compared to the one of net shortwave radiation, especially toward the end of the
                                 period (Fig. 5c). This suggests that, as the sea-ice extent and volume decrease over time, the effect of the ice-albedo
                                 feedback on summer sea-ice extent becomes weaker, while the effect of downward longwave radiation increases,
                                 potentially via a warmer atmosphere, enhanced humidity and increased cloudiness. A notable exception is the
                                 dominant influence of net shortwave radiation for CESM2 between 1980 and 2010. This goes in hand with the
                                 large reduction in summer sea-ice extent associated with this model (Fig. 1a). A more detailed analysis looking
                                 at different seasons, and potentially different sectors, could be done to better understand the difference between
                                 shortwave and longwave radiation influences, and this will be the subject of future work.
                                     We highlight the almost similarity between the summed influence of net shortwave and downward longwave
                                 radiations (Fig. 3a) and the influence of surface air temperature (Fig. 2a) in the previous section. We show
                                 that this similarity holds during most 10-year periods and for all models (compare Fig. 5c with Fig. 5d). The
                                 difference in rate of information transfer between the sum of both radiations and surface air temperature is
                                 relatively close to 0 in most cases, with only one 10-year period for CESM2 (1990-2000) showing a difference
                                 larger than 5 % (Fig. 5e). However, we acknowledge that a seasonal analysis would provide additional insights to
                                 confirm this result, but this is beyond the scope of this paper.

                                 Drivers of sea-ice lows
                                 The recent decline in summer Arctic sea-ice extent has not been monotonic, with large interannual variations
                                 (Fig. 1a). Over the observational period starting in 1979, two sea-ice lows (see Methods for exact definition),
                                 presenting a large drop in sea-ice extent compared to the previous years, have been recorded, i.e. 2007 and 2012
                                 (Fig. 1a). The 2007 event has been associated with wind stress, surface air temperature and preconditioning (long-
                                 term ice thinning)63,64. The 2012 sea-ice low has been attributed to the combined impact of preconditioning
                                 and a strong storm65. It is likely that other sea-ice lows will occur in the future. Furthermore, rapid sea-ice
                                 declines (see exact definition in the Methods), featuring at least four years with a strong sea-ice extent reduction,
                                 although not present in the observational time period, could happen in the future33. These events can have


Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                     8
www.nature.com/scientificreports/




                                 Fig. 6. Drivers of sea-ice lows and rapid sea-ice declines. (a) Rate of information transfer (absolute value) from
                                 winter sea-ice volume (WSIV), 2m air temperature (T2m), Atlantic Ocean heat transport (OHTAtl ) and Pacific
                                 OHT (OHTP ac) to summer sea-ice extent over 1970-2060, only considering sea-ice lows. (b) Same as (a), only
                                 considering years of rapid sea-ice decline. (c) Correlation coefficients corresponding to (a) (sea-ice lows). (d)
                                 Correlation coefficients corresponding to (b) (rapid sea-ice declines). Colored circles represent the five large
                                 ensembles, with significant values at the 5 % level highlighted by black contours. The number of sea-ice lows
                                 (SIL) and years of rapid sea-ice decline (RSID) for each model is indicated in parentheses in the legend of
                                 panels (c) and (d), respectively.



                                  Model           Number of sea-ice lows   Number of years of rapid sea-ice decline
                                  EC-Earth3       149                      183
                                  CESM2             0                      166
                                  MPI-ESM1.2-LR   111                       29
                                  CanESM5          55                       53
                                  ACCESS-ESM1.5   159                       80


                                 Table 2. Number of sea-ice lows and years of rapid sea-ice decline for each model over 1970-2060 (considering
                                 all model members).



                                 profound influences on the global climate, ecosystems and societies, and identifying their potential drivers is
                                 thus important.
                                     In the models studied, the percentage of sea-ice lows generally increases over time, although a peak is found
                                 around 2030-2050 for EC-Earth3 and around 2030-2040 for CanESM5 (Fig. 4e). The temporal evolution of the
                                 percentage of rapid sea-ice decline years is less clear, with model-dependent variations (Fig. 4f). These results
                                 suggest that, as the number of sea-ice lows increases over the twenty-first century, the influence of surface air
                                 temperature increases (Fig. 4b) and the one of winter sea-ice volume decreases (Fig. 4a).
                                     Next, we compute the rate of information transfer over the whole period but only considering sea-ice lows
                                 or rapid sea-ice declines (Fig. 6). Starting with sea-ice lows, as the summer sea-ice extent from CESM2 strongly
                                 decreases in the 1990s and the 2000s (Fig. 1a), the historical trend line of this model is more negative than other
                                 models and no sea-ice low is present in CESM2. Also, only 55 sea-ice lows are present in CanESM5 (Table 2),
                                 so results from this model need to be taken with caution. These considerations taken apart, we find that the


Scientific Reports |   (2024) 14:24236                  | https://doi.org/10.1038/s41598-024-76056-y                                              9
www.nature.com/scientificreports/


                                 influence of surface air temperature on summer sea-ice extent is larger when only considering sea-ice lows
                                 (τ > 15 %; Fig. 6a) compared to the whole period (τ =9-15 %; Fig. 2a).
                                     Other influences (winter sea-ice volume, Atlantic and Pacific Ocean heat transports) remain small and not
                                 significant (Fig. 6a), and are weaker compared to the whole period (Fig. 2a). In a similar way as for the whole
                                 period, if we had only considered the correlation coefficient, we would have ended up with biased conclusions.
                                 In particular, the correlation between winter sea-ice volume and summer sea-ice extent is significant for all
                                 models, while no causal influence of winter sea-ice volume exists (Fig. 6c). In addition, EC-Earth3 presents a
                                 significant correlation between ocean heat transport (both on the Atlantic and Pacific sides) and summer sea-ice
                                 extent, but no causal influence is detected.
                                     When we only consider years of rapid sea-ice decline, the influence of surface air temperature is also larger
                                 (τ > 15 %; Fig. 6b) than the whole period. Again, the effect of other drivers is small and not significant, despite
                                 significant correlations (Fig. 6d). Note that some caution needs to be taken with MPI-ESM1.2-LR and CanESM5,
                                 which present only 29 and 53 years of rapid sea-ice decline, respectively (Table 2).

                                 Conclusions
                                 By using a relatively novel causal method, the Liang-Kleeman rate of information transfer, we find that surface
                                 air temperature is the largest driver of summer sea-ice extent over 1970-2060 according to five different CMIP6
                                 large ensembles (Fig. 2a). We also show that the previous winter sea-ice volume and the annual mean Atlantic
                                 Ocean heat transport have some influence for some models. When replacing the surface air temperature by
                                 downward atmospheric surface heat fluxes and repeating the computation, we find that the downward longwave
                                 radiation has the largest influence on summer sea-ice extent, with additional impact of the net shortwave
                                 radiation (Fig. 3a). The sum of both downward longwave and net shortwave radiation influences is comparable
                                 to the influence of surface air temperature alone for each model; further analysis could be done in the future
                                 to better understand the connection between surface air temperature, atmospheric heat fluxes and summer
                                 sea-ice extent during different seasons. The temporal evolution of the rate of information transfer from each
                                 driver to summer sea-ice extent shows that the winter sea-ice volume influence decreases over time and the
                                 air temperature influence increases, in conjunction with an increase in the percentage of sea-ice lows (Fig. 4).
                                 In addition, the effect of downward longwave radiation generally increases, while the impact of net shortwave
                                 radiation decreases overall (Fig. 5). A final analysis of the causal method only considering sea-ice lows or years of
                                 rapid sea-ice decline reveals that the effect of surface air temperature becomes stronger and the other influences
                                 are weaker (Fig. 6) compared to the whole period.
                                     The Liang-Kleeman information flow method allows to go beyond classical correlation analyses and to
                                 remove spurious dependencies based on correlations66. Its advantages compared to other causal methods are its
                                 derivation from first principles of information entropy and its relative simplicity40,41. However, some limitations
                                 exist, the main one being the linearity assumption. For some highly nonlinear problems, this causal method may
                                 not be accurately computed. In a recent study, Pires et al.67 developed a nonlinear version of the Liang-Kleeman
                                 information flow method and showed that indeed some nonlinear causal links correctly appear in theoretical
                                 models presenting strong nonlinearities, which is not the case when using the original linear formulation. Thus,
                                 testing this newly developed version on real world-case studies will be the subject of further investigation. In the
                                 case of this study, despite the relatively linear relationships between the target variable and the drivers used here,
                                 some nonlinearities could appear. The use of the nonlinear version of the causal method could add some insights,
                                 but this goes beyond the scope of the current analysis as the nonlinear version of the method is new and needs
                                 additional tests on simpler systems68. Another limitation is that the method needs to be used with approximately
                                 stationary time series. We coped with this limitation by detrending the data (removing the ensemble mean; see
                                 Methods). However, we acknowledge that even after this detrending, the residuals are not perfectly stationary.
                                 Additionally, the method is less robust than causal network algorithms, such as the Peter and Clark momentary
                                 conditional independence (PCMCI)69, when the number of variables taken into account is larger than 7-1066. In
                                 our study, we use six variables maximum, so that we reduce the impact of this problem. Finally, the use of this
                                 causal method needs to be accompanied by a good physical understanding of the processes at play.
                                     Our study has focused on Arctic summer sea-ice extent, as this variable has considerably changed over the
                                 past decades4. A similar analysis could be conducted with Arctic winter sea-ice extent, as well as Antarctic sea
                                 ice. Some work using the same causal tool has already been carried out with Arctic winter sea-ice extent, but only
                                 using EC-Earth3. We showed that winter sea-ice extent is influenced by both the atmosphere (Arctic surface
                                 air temperature) and the ocean (total Arctic Ocean heat transport and sea-surface temperature)25. Another
                                 recent study using the Liang-Kleeman information flow method showed the important influence of ocean heat
                                 transport on annual mean Barents Sea ice area49. Thus, results depend on the time of the year (i.e. whether we
                                 focus on summer or winter sea ice) and on the region analyzed (total Arctic or a specific Arctic region). It would
                                 also be possible to investigate spatial variations of the rate of information transfer, as was done in a previous
                                 study48. Additionally, the definition of rapid sea-ice declines could be extended to take longer periods (e.g.
                                 10 years). Finally, a more detailed analysis of the energy budget could be done, especially looking at different
                                 seasons, to check whether the influence of longwave and shortwave radiations changes with the time of the year.

                                 Methods
                                 Climate models
                                 We retrieve monthly mean model outputs from five different large ensembles using the forcing from the Coupled
                                 Model Intercomparison Project Phase 6 (CMIP6)70. Our analysis period is from 1970 (due to the availability of
                                 EC-Earth3) to 2060 (summer sea-ice extent becomes close to zero around that year for the majority of models;
                                 Fig. 1a). CMIP6 historical forcing is used from 1970 to 2014, and the Shared Socioeconomic Pathway 3-7.0


Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                  10
www.nature.com/scientificreports/


                                 (SSP3-7.0) is used from 2015 to 2060. The latter scenario is chosen because it is the only scenario that was run by
                                 the CESM2 model. All five models have at least 30 members, which were run with the same external forcing but
                                 using different initializations that are detailed in the references mentioned in Table 1. Note that we only keep the
                                 50 CESM2 members using the CMIP6 biomass burning protocol, and the other 50 members (smoothed biomass
                                 burning) were excluded from our analysis, to allow for a fair comparison with other models. We also discard one
                                 of the CanESM5 members (out of 50) as the 3D ocean variables are not available for that member.
                                     Both EC-Earth3 and CanESM5 use the same ocean and sea-ice models, although the version of the former
                                 model is newer. Beside of that, all other models present different atmosphere and ocean models. The nominal
                                 atmospheric resolution varies between 0.7◦ (EC-Earth3; ∼ 30 km at 70◦N) and 2.8◦ (CanESM5; ∼ 110 km at 70◦
                                 N), while the nominal ocean resolution is 1◦ for all models (40-50 km at 70◦N), except MPI-ESM1.2-LR (1.5◦).
                                 Thus, there is a relatively large variety of atmospheric resolutions, while the ocean resolution is relatively similar
                                 among models. More information about the different models can be found in the references that are provided
                                 in Table 1.
                                     From these models, we retrieve sea-ice concentration, equivalent sea-ice thickness (sea-ice volume per area;
                                 except for CanESM5, which only provides actual sea-ice thickness, from which we derive equivalent sea-ice
                                 thickness), surface (2 m) air temperature, ocean potential temperature (all vertical levels), ocean zonal and
                                 meridional velocities (all levels), downward and upward shortwave radiations at the surface, downward longwave
                                 radiation at the surface, meridional surface wind speed, 300 hPa geopotential height and sea-surface temperature.
                                 We compute the net shortwave radiation as the difference between downward and upward shortwave radiations.
                                 Both net shortwave and downward longwave radiations are positive downward.
                                     From these model outputs, Arctic sea-ice extent is computed as the areal sum of all ocean grid points north
                                 of 40◦N that have at least 15 % sea-ice concentration. Arctic sea-ice volume is the product of equivalent sea-ice
                                 thickness and grid-cell area summed over the ocean region north of 40◦N. Summer sea-ice extent corresponds
                                 to September, while winter sea-ice extent and volume are taken in March. Arctic surface air temperature,
                                 atmospheric surface heat fluxes, 300 hPa geopotential height and sea-surface temperature are spatially averaged
                                 north of 70◦N. For atmospheric surface heat fluxes (shortwave and longwave radiations), we only compute the
                                 spatial average over ocean grid points. The Arctic meridional surface wind speed is taken as the average over a
                                 latitudinal band between 68◦N and 72◦N. Atlantic Ocean heat transport is the sum of ocean heat transport at
                                 the Barents Sea Opening, Fram Strait and Davis Strait, while Pacific Ocean heat transport corresponds to ocean
                                 heat transport at the Bering Strait. Ocean heat transport at each gate is computed via the product of monthly
                                 mean ocean temperature and velocity integrated across depth and the corresponding transects, neglecting sub-
                                 monthly anomalies. The location of the four gates (Barents Sea Opening, Fram Strait, Davis Strait, Bering Strait)
                                 is provided in Supplementary Fig. S11.

                                 Reference products
                                 In order to evaluate the model results, we use monthly mean data from both satellite observations and reanalyses
                                 as references products. For each variable, we tried to get the best available dataset, taking the length of the time
                                 period into account. For Arctic sea-ice extent, we retrieve the sea-ice index (OSI-420, version 2.2; computed
                                 from the 25 km resolution sea-ice concentration product) from the European Organisation for the Exploitation
                                 of Meteorological Satellites (EUMETSAT) Ocean and Sea Ice Satellite Application Facility (OSI SAF)2 from
                                 1979 to 2023. We also use the Arctic sea-ice volume from the Pan-Arctic Ice-Ocean Modeling and Assimilation
                                 System (PIOMAS51; 22 km resolution) from 1979 to 2023. PIOMAS provides reasonable agreement with satellite
                                 observations51 and has the advantage to span a longer time period than satellite observations, which enhances the
                                 robustness of our results. Version 5 of the Hadley Centre/Climatic Research Unit Temperature (HadCRUT583;
                                 5◦ grid) is also used for computing the reference Arctic near-surface temperature (spatial average north of
                                 70◦N) from 1970 to 2023. We retrieve ocean potential temperature, zonal and meridional velocities from the
                                 European Centre for Medium-Range Weather Forecasts (ECMWF) Ocean Reanalysis System 5 (ORAS552; 0.25◦
                                 resolution) from 1979 to 2018. Ocean heat transport at the different Arctic gates is computed in a similar way as
                                 with model outputs. We also use net shortwave radiation and downward longwave radiations at the surface from
                                 the Clouds and the Earth’s Radiant Energy System (CERES84; 1◦ resolution) Edition 4.0 (Ed4) Energy Balanced
                                 and Filled (EBAF)-surface data product from 2001 to 2023.

                                 Liang-Kleeman information flow
                                 The rate of information transfer from variable xj to variable xi, noted Tj→i, is computed in a multivariate
                                 framework via41:

                                                                                          d
                                                                                  1                   Cij
                                                                      Tj→i =          ·   ∆jk Ck,di ·     ,(1)
                                                                                det C                 Cii
                                                                                         k=1


                                 where C is the covariance matrix, d is the number of variables, ∆jk are the cofactors of C (∆jk = (−1)j+k Mjk
                                 , where Mjk are the minors), Ck,di is the sample covariance between all xk and the Euler forward difference
                                 approximation of dxi/dt (annual derivatives are used for all variables in our study), Cij is the sample covariance
                                 between xi and xj , and Cii is the sample variance of xi. To be able to compare causal influences between each
                                 other, we normalize the rate of information transfer as in Liang41 and express it in percent:
                                                                                           Tj→i
                                                                                  τj→i =        ,(2)
                                                                                            Zi



Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                  11
www.nature.com/scientificreports/


                                 where Zi is the normalizer, computed as follows:
                                                                                  d
                                                                                                  noise 
                                                                                                   dH    
                                                                           Zi =         |Tk→i| +  i      ,(3)
                                                                                                      dt 
                                                                                  k=1


                                 where the first term on the right-hand side represents the information flowing from all variables xk to the target
                                 variable xi (including the influence of xi on itself), and the last term is the effect of noise (taking stochastic effects
                                 into account). When τj→i is significantly different from 0, xj has an influence on xi, while if τj→i = 0 there is no
                                 influence. In our study, we only use the absolute value of τ , which indicates the strength of the causal influence. A
                                 value of |τj→i| = 100 % would mean that xj causes a maximal impact on xi. However, this is rarely the case, and
                                 usually this value is not much larger than ∼ 30 %, except for the self-influence (i.e. τi→i), which often displays a
                                 value larger than ∼ 40-50 %. Note that the normalization includes a noise term (Eq. (3)). Due to the presence of
                                 the self-influence and the noise term, we cannot simply infer that |τj→i| = 10 % means that xj influences xi for 10
                                 %. However, if |τj→i| = 10 % and |τl→i| = 5 % (where xl is a third variable), xj is twice more important than xl in
                                 leading to changes in xi. Statistical significance of τj→i is computed via bootstrap resampling with replacement
                                 of all terms included in equations (1)-(3), with 1000 bootstrap realizations, and using a significance level α = 5
                                 %. The rate of information transfer τ is computed for each bootstrap realization, and the error in τ , which we
                                 refer to as ϵτ , is calculated as the standard deviation across all τ bootstrapped values. If the confidence interval
                                 τ ± 1.96 ϵτ does not contain the zero value, then τ is significant at the 5 % level; otherwise, it is not significant.

                                 As a first analysis (sections ‘Drivers of summer sea-ice extent’ and ‘Atmospheric surface heat fluxes’), we
                                 compute the rate of information transfer |τ | (absolute value) from drivers depicted in Fig. 1 (winter [March]
                                 sea-ice volume, annual mean surface air temperature, annual mean Atlantic Ocean heat transport and annual
                                 mean Pacific Ocean heat transport) to our target variable (summer [September] sea-ice extent) for each model
                                 member separately. Taking annual means has the advantage to consider not only the previous summer, but also
                                 the previous winter and spring months. Note that we detrend all variables before computing |τ | by removing
                                 the ensemble mean from each member. Due to the almost absence of summer sea ice after 2060, we compute
                                 |τ | over the period 1970-2060, meaning that we have 91 data points for each member (1 point each year).
                                 After that, we compute the ensemble mean rate of information transfer for each different model and check the
                                 statistical significance by combining the p-values from the different members (which were previously computed
                                 via bootstrap resampling, see previous paragraph) via the Fisher’s method for multiple tests. This analysis is
                                 repeated by replacing winter sea-ice volume by winter sea-ice extent to check whether the latter has a larger or
                                 lower influence on summer sea-ice extent compared to the former. This analysis is also done by replacing surface
                                 air temperature by atmospheric surface heat fluxes (net shortwave and downward longwave radiations). Finally,
                                 supplementary analyses with meridional surface wind speed, 300 hPa geopotential height and sea-surface
                                 temperature have also been performed. To compute the rate of information transfer on observed and reanalysis
                                 products (excluding surface heat fluxes as the temporal coverage is too short), we use the 1979-2018 period. As
                                 only one realization is available for observations and reanalyses, we remove the linear trend before applying the
                                 causal method.
                                      Second (section ‘Non-stationarity of causal influences’), we compute |τ | for each range of 10 years separately
                                 across all members of the same model, meaning that we have between 300 and 500 data points for each 10-year
                                 range depending on the model. This allows to check the temporal evolution of the rate of information transfer
                                 between our drivers and the target variable. No detrending is performed in this case as the time duration is
                                 relatively short and includes all members. Statistical significance is computed in the same way as the boostrap
                                 method described above (1000 bootstrap realizations and α = 5 %) for each 10-year period. We repeat this
                                 analysis for 5-year periods (i.e. between 150 and 250 data points) to check the sensitivity to the time duration.
                                 Due to the availability of only one realization in observations and reanalyses, we do not compute the rate of
                                 information transfer for those.
                                      Finally (section ‘Drivers of sea-ice lows’), we compute |τ | from the same drivers as the first analysis only
                                 considering years with large sea-ice reduction. For characterizing such years, we either use sea-ice lows or
                                 rapid sea-ice declines. A sea-ice low is an event during which the September Arctic sea-ice extent is below
                                 the historical (1970-2014) trend line by more than three standard deviations of the modeled variability and is
                                 below the previous year by more than one standard deviation. A rapid sea-ice decline is a period of at least four
                                 years for which the trend in the five-year running mean September sea-ice extent is lower than -0.3 million
                                 km2/year, as defined by Auclair and Tremblay33. The number of sea-ice lows and years of rapid sea-ice decline
                                 per model over 1970-2060 is presented in Table 2. The reason we use two different definitions for years with
                                 large sea-ice reduction is because CESM2 does not present any sea-ice low and CanESM5 only has 55 sea-ice
                                 lows over all its members and for the period 1970-2060 on the one hand, and MPI-ESM1.2-LR and CanESM5
                                 present a limited number of years of rapid sea-ice decline (29 and 53 years, respectively). Before computing the
                                 rate of information transfer, we remove the ensemble mean from each model member, exactly the same way as
                                 in the first analysis above. We also compute the temporal derivatives of the detrended data. Then, we compute
                                 the rate of information transfer over all sea-ice lows or years of rapid sea-ice decline (period 1970-2060) for
                                 each different model. Statistical significance is also computed via the boostrap method described above (1000
                                 bootstrap realizations and α = 5 %).

                                 Data Availability
                                 All CMIP670 model outputs (except CESM2) used in this study (historical and SSP3-7.0 simulations) were re-
                                 trieved from the Earth System Grid Federation (ESGF) nodes: https://esgf-index1.ceda.ac.uk/search/cmip6-ce-


Scientific Reports |   (2024) 14:24236                | https://doi.org/10.1038/s41598-024-76056-y                                                     12
www.nature.com/scientificreports/


                                 da/. Table 1 provides the references of the model simulations used. CESM274 model outputs were retrieved from
                                 the National Center for Atmospheric Research (NCAR) Climate Data Gateway: https://www.earthsystemgrid.
                                 org/dataset/ucar.cgd.cesm2le.output.html.
                                     The observed sea-ice extent from OSI SAF2 can be accessed through the EUMETSAT repository: https://
                                 doi.org/10.15770/EUM_SAF_OSI_0022. The PIOMAS51 sea-ice volume data can be accessed via the Polar
                                 Science Center of the University of Washington: http://psc.apl.uw.edu/research/projects/arctic-sea-ice-vol-
                                 ume-anomaly. The HadCRUT584 near-surface temperature was retrieved from the Climatic Research Unit
                                 (University of East Anglia) and Met Office: https://crudata.uea.ac.uk/cru/data//temperature/. The ORAS552
                                 ocean temperature and velocity data were accessed via the portal of the Center for Earth System Research and
                                 Sustainability (CEN) from the University of Hamburg: https://www.cen.uni-hamburg.de/icdc/data/ocean/easy-
                                 init-ocean/ecmwf-oras5.html. The CERES85 surface heat flux data were retrieved from the NASA CERES Data
                                 Products: https://ceres.larc.nasa.gov/data/.
                                     The Python script to compute the Liang-Kleeman rate of information transfer is available on
                                 GitHub: https://github.com/Climdyn/Liang_Index_climdyn.

                                 Received: 17 May 2024; Accepted: 10 October 2024


                                 References
                                  1. Fox-Kemper, B. et al.Ocean, Cryosphere and Sea Level Change. In: Climate Change 2021: The Physical Science Basis. Contribution of
                                     Working Group I to the Sixth Assessment Report of the Intergovernmental Panel on Climate Change [Masson-Delmotte, V., P. Zhai,
                                     A. Pirani, S. L. Connors, C. Péan, S. Berger, N. Caud, Y. Chen, L. Goldfarb, M. I. Gomis, M. Huang, K. Leitzell, E. Lonnoy, J. B. R.
                                     Matthews, T. K. Maycock, T. Waterfield, O. Yelekçi, R. Yu and B. Zhou (eds.)] (Cambridge University Press, Cambridge, United
                                     Kingdom and New York, NY, USA, 2021).
                                  2. EUMETSAT Ocean and Sea Ice Satellite Application Facility. OSI SAF Sea ice index 1978-onwards, version 2.2, OSI-420, Data
                                     extracted from OSI SAF FTP server: 1979-2023, Northern Hemisphere, accessed 2024-01-31, https://doi.org/10.15770/EUM_
                                     SAF_OSI_0022 (2023).
                                  3. Onarheim, I. H., Eldevik, T., Smedsrud, L. H. & Stroeve, J. C. Seasonal and regional manifestation of Arctic sea ice loss. Journal of
                                     Climate 31, 4917–4932. https://doi.org/10.1175/JCLI-D-17-0427.1 (2018).
                                  4. Stroeve, J. & Notz, D. Changing state of Arctic sea ice across all seasons. Environmental Research Letters 13, 103001. https://doi.
                                     org/10.1088/1748-9326/aade56 (2018).
                                  5. Docquier, D. & Koenigk, T. A review of interactions between ocean heat transport and Arctic sea ice. Environmental Research
                                     Letters 16, https://doi.org/10.1088/1748-9326/ac30be (2021).
                                  6. Wang, M. & Overland, J. E. A sea ice free summer Arctic within 30 years?. Geophysical Research Letters 36, L07502. https://doi.
                                     org/10.1029/2009GL037820 (2009).
                                  7. Notz, D. and SIMIP Community. Arctic sea ice in CMIP6. Geophysical Research Letters 47, e2019GL086749, https://doi.
                                     org/10.1029/2019GL086749 (2020).
                                  8. Arthun, M., Onarheim, I. H., Dörr, J. & Eldevik, T. The seasonal and regional transition to an ice-free Arctic. Geophysical Research
                                     Letters 48, e2020GL090825, https://doi.org/10.1029/2020GL090825 (2021).
                                  9. Docquier, D. & Koenigk, T. Observation-based selection of climate models projects Arctic ice-free summers around 2035.
                                     Communications Earth and Environment 2, https://doi.org/10.1038/s43247-021-00214-7 (2021).
                                 10. Zhao, J., He, S., Wang, H. & Li, F. Constraining CMIP6 projections of an ice-free Arctic using a weighting scheme. Earth’s Future
                                     10, e2022EF002708, https://doi.org/10.1029/2022EF002708 (2022).
                                 11. Kim, Y.-H., Min, S.-K., Gillett, N. P., Notz, D. & Malinina, E. Observationally-constrained projections of an ice-free Arctic even
                                     under a low emission scenario. Nature Communications 14, https://doi.org/10.1038/s41467-023-38511-8 (2023).
                                 12. Jahn, A., Holland, M. M. & Kay, J. E. Projections of an ice-free Arctic Ocean. Nature Reviews Earth and Environment 5, 164–176.
                                     https://doi.org/10.1038/s43017-023-00515-9 (2024).
                                 13. Screen, J. A. & Deser, C. Pacific Ocean variability influences the time of emergence of a seasonally ice-free Arctic Ocean. Geophysical
                                     Research Letters 46, 2222–2231. https://doi.org/10.1029/2018GL081393 (2019).
                                 14. Topal, D. & Ding, Q. Atmospheric circulation-constrained model sensitivity recalibrates Arctic climate projections. Nature Climate
                                     Change 13, 710–718. https://doi.org/10.1038/s41558-023-01698-1 (2023).
                                 15. Jahfer, S., Ha, K.-J., Chung, E.-S., Franzke, C. L. E. & Sharma, S. Unveiling the role of tropical Pacific on the emergence of ice-free
                                     Arctic projections. Environmental Research Letters 19, 044033. https://doi.org/10.1088/1748-9326/ad3141 (2024).
                                 16. Notz, D. & Marotzke, J. Observations reveal external driver for Arctic sea-ice retreat. Geophysical Research Letters 39, L08502.
                                     https://doi.org/10.1029/2012GL051094 (2012).
                                 17. Swart, N. C., Fyfe, J. C., Hawkins, E., Kay, J. E. & Jahn, A. Influence of internal variability on Arctic sea-ice trends. Nature Climate
                                     Change 5, 86–89. https://doi.org/10.1038/nclimate2483 (2015).
                                 18. Notz, D. & Stroeve, J. Observed Arctic sea-ice loss directly follows anthropogenic CO2 emission. Science 354, 747–750. https://doi.
                                     org/10.1126/science.aag2345 (2016).
                                 19. England, M., Jahn, A. & Polvani, L. Non-uniform contribution of internal variability to recent Arctic sea ice loss. Journal of Climate
                                     32, 4039–4053. https://doi.org/10.1175/JCLI-D-18-0864.1 (2019).
                                 20. Meredith, M. et al.Polar Regions. In: IPCC Special Report on the Ocean and Cryosphere in a Changing Climate [H.-O. Pörtner, D.C.
                                     Roberts, V. Masson-Delmotte, P. Zhai, M. Tignor, E. Poloczanska, K. Mintenbeck, A. Alegria, M. Nicolai, A. Okem, J. Petzold, B.
                                     Rama, N.M. Weyer (eds.)] (Cambridge University Press, Cambridge, United Kingdom and New York, NY, USA, 2019).
                                 21. Olonscheck, D., Mauritsen, T. & Notz, D. Arctic sea-ice variability is primarily driven by atmospheric temperature fluctuations.
                                     Nature Geoscience 12, 430–434. https://doi.org/10.1038/s41561-019-0363-1 (2019).
                                 22. Ding, Q. et al. Influence of high-latitude atmospheric circulation changes on summertime Arctic sea ice. Nature Climate Change 7,
                                     289–295. https://doi.org/10.1038/nclimate3241 (2017).
                                 23. Rigor, I. G., Wallace, J. M. & Colony, R. L. Response of sea ice to the Arctic Oscillation. Journal of Climate 15, 2648–2663. DOI:
                                     https://doi.org/10.1175/1520-0442(2002)015<2648:ROSITT>2.0.CO;2 (2002).
                                 24. Meier, W. N. & Stroeve, J. An updated assessment of the changing Arctic sea ice cover. Oceanography 35, 10–19. https://doi.
                                     org/10.5670/oceanog.2022.114 (2022).
                                 25. Docquier, D., Vannitsem, S., Ragone, F., Wyser, K. & Liang, X. S. Causal links between Arctic sea ice and its potential drivers
                                     based on the rate of information transfer. Geophysical Research Letters 49, e2021GL095892, https://doi.org/10.1029/2021GL095892
                                     (2022).
                                 26. Manabe, S. & Stouffer, R. J. Sensitivity of a global climate model to an increase of CO2 concentration in the atmosphere. Journal of
                                     Geophysical Research: Oceans 85, 5529–5554. https://doi.org/10.1029/JC085iC10p05529 (1980).



Scientific Reports |   (2024) 14:24236                   | https://doi.org/10.1038/s41598-024-76056-y                                                                    13
www.nature.com/scientificreports/


                                 27. Pithan, F. & Mauritsen, T. Arctic amplification dominated by temperature feedbacks in contemporary climate models. Nature
                                     Geoscience 7, 181–184. https://doi.org/10.1038/NGEO2071 (2014).
                                 28. Goosse, H. et al. Quantifying climate feedbacks in polar regions. Nature Communications 9, 1–13. https://doi.org/10.1038/s41467-
                                     018-04173-0 (2018).
                                 29. Babb, D. G., Galley, R. J., Barber, D. G. & Rysgaard, S. Physical processes contributing to an ice free Beaufort Sea during September
                                     2012. Journal of Geophysical Research: Oceans 121, 267–283. https://doi.org/10.1002/2015JC010756 (2016).
                                 30. Arthun, M., Eldevik, T., Smedsrud, L. H., Skagseth, O. & Ingvaldsen, R. B. Quantifying the influence of Atlantic heat on Barents
                                     Sea ice variability and retreat. Journal of Climate 25, 4736–4743. https://doi.org/10.1175/JCLI-D-11-00466.1 (2012).
                                 31. Onarheim, I. H., Eldevik, T., Arthun, M., Ingvaldsen, R. B. & Smedsrud, L. H. Skillful prediction of Barents Sea ice cover.
                                     Geophysical Research Letters 42, 5364–5371. https://doi.org/10.1002/2015GL064359 (2015).
                                 32. Polyakov, I. V. et al. Greater role for Atlantic inflows on sea-ice loss in the Eurasian Basin of the Arctic Ocean. Science 356, 285–291.
                                     https://doi.org/10.1126/science.aai8204 (2017).
                                 33. Auclair, G. & Tremblay, L. B. The role of ocean heat transport in rapid sea ice declines in the Community Earth System Model Large
                                     Ensemble. Journal of Geophysical Reseach: Oceans 123, 8941–8957. https://doi.org/10.1029/2018JC014525 (2018).
                                 34. Serreze, M. C., Barrett, A. P., Crawford, A. D. & Woodgate, R. A. Monthly variability in Bering Strait oceanic volume and heat
                                     transports, links to atmospheric circulation and ocean temperature, and implications for sea ice conditions. Journal of Geophysical
                                     Research: Oceans 124, 9317–9337. https://doi.org/10.1029/2019JC015422 (2019).
                                 35. Oldenburg, D. et al. The respective roles of ocean heat transport and surface heat fluxes in driving Arctic Ocean warming and sea
                                     ice decline. Journal of Climate 37, 1431–1448. https://doi.org/10.1175/JCLI-D-23-0399.1 (2024).
                                 36. Arthun, M., Eldevik, T. & Smedsrud, L. H. The role of Atlantic heat transport in future Arctic winter sea ice loss. Journal of Climate
                                     32, 3327–3341. https://doi.org/10.1175/JCLI-D-18-0750.1 (2019).
                                 37. Dörr, J., Arthun, M., Eldevik, T. & Sandø, A. B. Expanding influence of Atlantic and Pacific ocean heat transport on winter sea-ice
                                     variability in a warming Arctic. Journal of Geophysical Reseach: Oceans 129, e2023JC019900, https://doi.org/10.1029/2023JC019900
                                     (2024).
                                 38. Runge, J. et al. Inferring causation from time series in Earth system sciences. Nature Communications 10, 2553. https://doi.
                                     org/10.1038/s41467-019-10105-3 (2019).
                                 39. Liang, X. S. & Kleeman, R. Information transfer between dynamical system components. Physical Review Letters 95, 244101.
                                     https://doi.org/10.1103/PhysRevLett.95.244101 (2005).
                                 40. Liang, X. S. Information flow and causality as rigorous notions ab initio. Physical Review E 94, 052201. https://doi.org/10.1103/
                                     PhysRevE.94.052201 (2016).
                                 41. Liang, X. S. Normalized multivariate time series causality analysis and causal graph reconstruction. Entropy 23, 679. https://doi.
                                     org/10.3390/e23060679 (2021).
                                 42. Mahlstein, I. & Knutti, R. September Arctic sea ice predicted to disappear near 2◦ C global warming above present. Journal of
                                     Geophysical Research: Atmospheres 117, D06104. https://doi.org/10.1029/2011JD016709 (2012).
                                 43. Docquier, D., Fuentes-Franco, R., Koenigk, T. & Fichefet, T. Sea ice - ocean interactions in the Barents Sea modeled at different
                                     resolutions. Frontiers in Earth Science 8, https://doi.org/10.3389/feart.2020.00172 (2020).
                                 44. Aylmer, J. R., Ferreira, D. & Feltham, D. L. Impact of ocean heat transport on sea ice captured by a simple energy balance model.
                                     Communications Earth and Environment 5, https://doi.org/10.1038/s43247-024-01565-7 (2024).
                                 45. Vannitsem, S., Dalaiden, Q. & Goosse, H. Testing for dynamical dependence: Application to the surface mass balance over
                                     Antarctica. Geophysical Research Letters 46, 12125–12135. https://doi.org/10.1029/2019GL084329 (2019).
                                 46. Hagan, D. F. T. et al. Contrasting ecosystem constraints on seasonal terrestrial CO2 and mean surface air temperature causality
                                     projections by the end of the 21st century. Environmental Research Letters 17, 124019. https://doi.org/10.1088/1748-9326/aca551
                                     (2022).
                                 47. Vannitsem, S. & Liang, X. S. Dynamical dependencies at monthly and interannual time scales in the climate system: Study of the
                                     North Pacific and Atlantic regions. Tellus A 74, 141–158, https://doi.org/10.16993/tellusa.44 (2022).
                                 48. Docquier, D., Vannitsem, S. & Bellucci, A. The rate of information transfer as a measure of ocean-atmosphere interactions. Earth
                                     System Dynamics 14, 577–591. https://doi.org/10.5194/esd-14-577-2023 (2023).
                                 49. Dörr, J., Arthun, M., Docquier, D., Li, C. & Eldevik, T. Causal links between sea-ice variability in the Barents-Kara Seas and oceanic
                                     and atmospheric drivers. Geophysical Research Letters 51, e2024GL108195, https://doi.org/10.1029/2024GL108195 (2024).
                                 50. DeRepentigny, P. et al. Enhanced simulated early 21st century Arctic sea ice loss due to CMIP6 biomass burning emissions. Science
                                     Advances 8, eabo2405, https://doi.org/10.1126/sciadv.abo2405 (2022).
                                 51. Schweiger, A. et al. Uncertainty in modeled Arctic sea ice volume. Journal of Geophysical Research: Oceans 116, https://doi.
                                     org/10.1029/2011JC007084 (2011).
                                 52. Zuo, H., Balmaseda, M. A., Tietsche, S., Mogensen, K. & Mayer, M. The ECMWF operational ensemble reanalysis-analysis system
                                     for ocean and sea ice: a description of the system and assessment. Ocean Science 15, 779–808. https://doi.org/10.5194/os-15-779-
                                     2019 (2019).
                                 53. Niederdrenk, A. L. & Notz, D. Arctic Sea Ice in a 1.5◦ C Warmer World. Geophysical Research Letters 45, 1963–1971, https://doi.
                                     org/10.1002/2017GL076159 (2018).
                                 54. Zhou, X., Wang, B. & Huang, F. Evaluating sea ice thickness simulation is critical for projecting a summer ice-free Arctic Ocean.
                                     Environmental Research Letters 17, 114033. https://doi.org/10.1088/1748-9326/ac9d4d (2022).
                                 55. Lee, S., Gong, T., Feldstein, S. B., Screen, J. A. & Simmonds, I. Revisiting the cause of the 1989–2009 Arctic surface warming
                                     using the surface energy budget: Downward infrared radiation dominates the surface fluxes. Geophysical Research Letters 44,
                                     10654–10661. https://doi.org/10.1002/2017GL075375 (2017).
                                 56. Blackport, R., Screen, J. A., van der Wiel, K. & Bintanja, R. Minimal influence of reduced Arctic sea ice on coincident cold winters
                                     in mid-latitudes. Nature Climate Change 9, 697–704. https://doi.org/10.1038/s41558-019-0551-4 (2019).
                                 57. Jiang, Z., Feldstein, S. B. & Lee, S. Two atmospheric responses to winter sea ice decline over the Barents-Kara Seas. Geophysical
                                     Research Letters 48, e2020GL090288, https://doi.org/10.1029/2020GL090288 (2021).
                                 58. Urrego-Blanco, J. R., Hunke, E. C. & Urban, N. Emergent relationships among sea ice, longwave radiation, and the Beaufort High
                                     circulation exposed through parameter uncertainty analysis. Journal of Geophysical Research: Oceans 124, 9572–9589. https://doi.
                                     org/10.1029/2019JC014979 (2019).
                                 59. Dai, A. & Jenkins, M. T. Relationships among Arctic warming, sea-ice loss, stability, lapse rate feedback, and Arctic amplification.
                                     Climate Dynamics 61, 5217–5232. https://doi.org/10.1007/s00382-023-06848-x (2023).
                                 60. Burt, M. A., Randall, D. A. & Branson, M. D. Dark warming. Journal of Climate 29, 705–719. https://doi.org/10.1175/
                                     JCLI-D-15-0147.1 (2016).
                                 61. Wang, B., Zhou, X., Ding, Q. & Liu, J. Increasing confidence in projecting the Arctic ice-free year with emergent constraints.
                                     Environmental Research Letters 16, 094016. https://doi.org/10.1088/1748-9326/ac0b17 (2021).
                                 62. Sauer, J., Demaeyer, J., Zappa, G., Massonnet, F. & Ragone, F. Extremes of summer Arctic sea ice reduction investigated with a rare
                                     event algorithm. Climate Dynamics 62, 5219–5237. https://doi.org/10.1007/s00382-024-07160-y (2024).
                                 63. Kauker, F. et al. Adjoint analysis of the 2007 all time Arctic sea-ice minimum. Geophysical Research Letters 36, L03707. https://doi.
                                     org/10.1029/2008GL036323 (2009).
                                 64. Lindsay, R. W., Zhang, J., Schweiger, A., Steele, M. & Stern, H. Arctic sea ice retreat in 2007 follows thinning trend. Journal of
                                     Climate 22, 165–176. https://doi.org/10.1175/2008JCLI2521.1 (2009).


Scientific Reports |   (2024) 14:24236                   | https://doi.org/10.1038/s41598-024-76056-y                                                                     14
www.nature.com/scientificreports/


                                 65. Parkinson, C. L. & Comiso, J. C. On the 2012 record low Arctic sea ice cover: Combined impact of preconditioning and an August
                                     storm. Geophysical Research Letters 40, 1356–1361. https://doi.org/10.1002/grl.50349 (2013).
                                 66. Docquier, D. et al. A comparison of two causal methods in the context of climate analyses. Nonlinear Processes in Geophysics 31,
                                     115–136. https://doi.org/10.5194/npg-31-115-2024 (2024).
                                 67. Pires, C. A., Docquier, D. & Vannitsem, S. A general theory to estimate information transfer in nonlinear systems. Physica D:
                                     Nonlinear Phenomena 458, https://doi.org/10.1016/j.physd.2023.133988 (2024).
                                 68. Vannitsem, S., Pires, C. A. & Docquier, D. Causal dependencies and Shannon entropy budget: Analysis of a reduced-order
                                     atmospheric model. Quaterly Journal of the Royal Meteorological Society, https://doi.org/10.1002/qj.4805 (2024).
                                 69. Runge, J., Nowack, P., Kretschmer, M., Flaxman, S. & Sejdinovic, D. Detecting and quantifying causal associations in large
                                     nonlinear time series datasets. Science Advances 5, eaau4996, https://doi.org/10.1126/sciadv.aau4996 (2019).
                                 70. Eyring, V. et al. Overview of the Coupled Model Intercomparison Project Phase 6 (CMIP6) experimental design and organization.
                                     Geoscientific Model Development 9, 1937–1958. https://doi.org/10.5194/gmd-9-1937-2016 (2016).
                                 71. EC-Earth-Consortium. EC-Earth-Consortium EC-Earth3 model output prepared for CMIP6 CMIP historical. Version 20200412.
                                     https://doi.org/10.22033/ESGF/CMIP6.4700 (2019). Earth System Grid Federation.
                                 72. EC-Earth-Consortium. EC-Earth-Consortium EC-Earth3 model output prepared for CMIP6 ScenarioMIP ssp370. Version
                                     20210101. https://doi.org/10.22033/ESGF/CMIP6.4884 (2019). Earth System Grid Federation.
                                 73. Wyser, K. et al. The SMHI Large Ensemble (SMHI-LENS) with EC-Earth3.3.1. Geoscientific Model Development 14, 4781–4796,
                                     https://doi.org/10.5194/gmd-14-4781-2021 (2021).
                                 74. Rodgers, K. B. et al. Ubiquity of human-induced changes in climate variability. Earth System Dynamics 12, 1393–1411. https://doi.
                                     org/10.5194/esd-12-1393-2021 (2021).
                                 75. Wieners, K.-H. et al. MPI-M MPI-ESM1.2-LR model output prepared for CMIP6 CMIP historical. Version 20190710. https://doi.
                                     org/10.22033/ESGF/CMIP6.6595 (2019). Earth System Grid Federation.
                                 76. Wieners, K.-H. et al. MPI-M MPI-ESM1.2-LR model output prepared for CMIP6 ScenarioMIP ssp370. Version 20190710. https://
                                     doi.org/10.22033/ESGF/CMIP6.6695 (2019). Earth System Grid Federation.
                                 77. Olonscheck, D. et al. The New Max Planck Institute Grand Ensemble with CMIP6 forcing and high-frequency model output.
                                     Journal of Advances in Modeling Earth Systems 15, e2023MS003790, https://doi.org/10.1029/2023MS003790 (2023).
                                 78. Swart, N. C. et al. The Canadian Earth System Model version 5 (CanESM5.0.3). Geoscientific Model Development 12, 4823–4873,
                                     https://doi.org/10.5194/gmd-12-4823-2019 (2019).
                                 79. Swart, N. C. et al. CCCma CanESM5 model output prepared for CMIP6 CMIP historical. Version 20190429. https://doi.
                                     org/10.22033/ESGF/CMIP6.3610 (2019). Earth System Grid Federation.
                                 80. Swart, N. C. et al. CCCma CanESM5 model output prepared for CMIP6 ScenarioMIP ssp370. Version 20190429. https://doi.
                                     org/10.22033/ESGF/CMIP6.3690 (2019). Earth System Grid Federation.
                                 81. Ziehn, T. et al. CSIRO ACCESS-ESM1.5 model output prepared for CMIP6 CMIP historical. Version 20200803. https://doi.
                                     org/10.22033/ESGF/CMIP6.4272 (2019). Earth System Grid Federation.
                                 82. Ziehn, T. et al. CSIRO ACCESS-ESM1.5 model output prepared for CMIP6 ScenarioMIP ssp370. Version 20210624. https://doi.
                                     org/10.22033/ESGF/CMIP6.4324 (2019). Earth System Grid Federation.
                                 83. Ziehn, T. et al. The Australian Earth System Model: ACCESS-ESM1.5. Journal of Southern Hemisphere Earth Systems Science 70,
                                     193–214, https://doi.org/10.1071/ES19035 (2020).
                                 84. Morice, C. P. et al. An updated assessment of near-surface temperature change from 1850: The HadCRUT5 data set. Journal of
                                     Geophysical Research: Atmospheres 126, e2019JD032361, https://doi.org/10.1029/2019JD032361 (2021).
                                 85. Kato, S. et al. Surface irradiances of Edition 4.0 Clouds and the Earth’s Radiant Energy System (CERES) Energy Balanced and Filled
                                     (EBAF) data product. Journal of Climate 31, 4501-4527, https://doi.org/10.1175/JCLI-D-17-0523.1 (2018).

                                 Acknowledgements
                                 This study is supported by the Belgian Science Policy Office (BELSPO) under the RESIST project (contract no.
                                 RT/23/RESIST). David Docquier is funded by BELSPO through the RESIST project. François Massonnet is a
                                 F.R.S.-FNRS Research Associate.

                                 Author contributions
                                 D.D. led the work with contributions from F.M., F.R., A.S., T.F. and S.V. D.D. performed the computations, an-
                                 alysed the results, produced the figures and led the paper writing. All authors participated in the design of the
                                 study, the interpretation of the results and the writing of the paper.

                                 Declarations
                                 Competing Interests
                                 The authors declare no competing interests.

                                 Additional information
                                 Supplementary Information The online version contains supplementary material available at https://doi.
                                 org/10.1038/s41598-024-76056-y.
                                 Correspondence and requests for materials should be addressed to D.D.
                                 Reprints and permissions information is available at www.nature.com/reprints.
                                 Publisher’s note Springer Nature remains neutral with regard to jurisdictional claims in published maps and
                                 institutional affiliations.




Scientific Reports |   (2024) 14:24236                  | https://doi.org/10.1038/s41598-024-76056-y                                                               15
www.nature.com/scientificreports/


                                 Open Access This article is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives
                                 4.0 International License, which permits any non-commercial use, sharing, distribution and reproduction in
                                 any medium or format, as long as you give appropriate credit to the original author(s) and the source, provide
                                 a link to the Creative Commons licence, and indicate if you modified the licensed material. You do not have
                                 permission under this licence to share adapted material derived from this article or parts of it. The images or
                                 other third party material in this article are included in the article’s Creative Commons licence, unless indicated
                                 otherwise in a credit line to the material. If material is not included in the article’s Creative Commons licence and
                                 your intended use is not permitted by statutory regulation or exceeds the permitted use, you will need to obtain
                                 permission directly from the copyright holder. To view a copy of this licence, visit http://creativecommons.org/
                                 licenses/by-nc-nd/4.0/.

                                 © The Author(s) 2024




Scientific Reports |   (2024) 14:24236               | https://doi.org/10.1038/s41598-024-76056-y                                                 16
