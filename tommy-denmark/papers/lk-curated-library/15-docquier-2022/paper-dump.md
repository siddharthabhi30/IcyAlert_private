# Full-text extraction

- Title: Causal Links Between Arctic Sea Ice and Its Potential Drivers Based on the Rate of Information Transfer
- Year: 2022
- DOI: https://doi.org/10.1029/2021GL095892
- PDF source: https://www.ncoads.org/upload/202205/08/202205082115276977.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

RESEARCH LETTER                             Causal Links Between Arctic Sea Ice and Its Potential Drivers
10.1029/2021GL095892
                                            Based on the Rate of Information Transfer
Key Points:
                                            D. Docquier1      , S. Vannitsem1      , F. Ragone1,2    , K. Wyser3      , and X. S. Liang4
• The Liang-Kleeman rate of
   information transfer allows              1
                                              Royal Meteorological Institute of Belgium, Brussels, Belgium, 2Université catholique de Louvain, Louvain-la-Neuve,
   quantification of the directional
                                            Belgium, 3Rossby Centre, Swedish Meteorological and Hydrological Institute, Norrkoping, Sweden, 4Fudan University,
   dependence between Arctic sea ice
   and its drivers                          Shanghai, China
• Recent and future changes in Arctic
   sea ice are mainly driven by air and
   sea-surface temperatures and ocean       Abstract Arctic sea ice has substantially changed over the past four decades, with a large decrease in
   heat transport
                                            sea-ice area and volume. The exact causes of these changes are not entirely known. In our study, we make
• The influence of Arctic sea ice on air
   temperature and ocean heat transport     use of the Swedish Meteorological and Hydrological Institute Large Ensemble. This ensemble consists of 50
   progressively decreases through the      members realized with the EC-Earth3 global climate model and covers the period 1970-2100. We apply for
   twenty-first century
                                            the first time the Liang-Kleeman information flow method to analyze the cause-effect relationships between
                                            Arctic sea ice and its potential drivers. We show that recent and future changes in Arctic sea ice are mainly
Supporting Information:                     driven by air and sea-surface temperatures and ocean heat transport. Conversely, changes in Arctic sea ice
Supporting Information may be found in      also considerably impact temperature and ocean heat transport. Finally, we find a progressive decrease in the
the online version of this article.
                                            influence of sea-ice area and volume on air temperature and ocean heat transport through the twenty-first
                                            century.
Correspondence to:
D. Docquier,                                Plain Language Summary The Arctic has been warming at a larger rate than the rest of the
david.docquier@meteo.be
                                            world, resulting in a substantial loss of sea ice since the late 1970s. This has had and will continue to have
                                            an impact on our climate and societies. The exact causes of the ongoing sea-ice loss are not entirely known,
Citation:
                                            and understanding them is important in order to better prepare our societies for future climate changes. In our
Docquier, D., Vannitsem, S., Ragone,
F., Wyser, K., & Liang, X. S. (2022).       study, we apply a relatively novel approach that quantifies the cause-effect relationships between Arctic sea
Causal links between Arctic sea ice and     ice and its potential drivers. We make use of a large range of model simulations performed with the EC-Earth3
its potential drivers based on the rate     global climate model covering the period 1970-2100. We find that air temperature, sea-surface temperature,
of information transfer. Geophysical
Research Letters, 49, e2021GL095892.        and the transport of heat by the ocean are important drivers of the ongoing and future retreat of Arctic sea
https://doi.org/10.1029/2021GL095892        ice. Conversely, changes in Arctic sea ice also affect the three former quantities. Our study demonstrates the
                                            performance of causal inference methods in the quest for a better understanding of relationships between
Received 25 AUG 2021                        climate variables. The geophysical and climate communities could greatly benefit from using these methods
Accepted 27 APR 2022
                                            more intensively.

Author Contributions:
Conceptualization: D. Docquier, S.          1. Introduction
Vannitsem, F. Ragone, K. Wyser, X. S.
Liang                                       Arctic sea ice has been retreating and thinning since the beginning of satellite observations in the late 1970s.
Data curation: D. Docquier
Formal analysis: D. Docquier, S.
                                            Arctic sea-ice area, defined as the total area of the Arctic Ocean covered by sea ice, has decreased by ∼2 million
Vannitsem, F. Ragone, K. Wyser, X. S.       km 2 (in annual mean) since 1979, with stronger loss in summer compared to winter (IPCC, 2019; Onarheim
Liang                                       et al., 2018; Stroeve & Notz, 2018). As sea ice has also been thinning (Kwok, 2018; Lindsay & Schweiger, 2015),
Investigation: D. Docquier, S. Vannitsem
Methodology: D. Docquier, S.
                                            the annual mean Arctic sea-ice volume has decreased by ∼12,000 km 3 since 1979 (Schweiger et al., 2019). Model
Vannitsem, F. Ragone, K. Wyser, X. S.       projections show a more or less rapid continuation of this ongoing process depending on the greenhouse gas
Liang                                       emission scenario, with likely summer ice-free Arctic conditions (September Arctic sea-ice area lower than 1
Software: D. Docquier
Supervision: S. Vannitsem
                                            million km 2) occurring before 2050 (Arthun et al., 2021; Docquier & Koenigk, 2021; SIMIP Community, 2020).
Validation: D. Docquier
                                            Recent changes in Arctic sea ice have been linked to both anthropogenic global warming (Notz & Stroeve, 2016)
                                            and climate internal variability (Swart et al., 2015). However, the exact drivers influencing sea-ice loss and their
                                            respective contributions are not fully understood. Both atmospheric (Ding et al., 2017) and ocean (Carmack
© 2022. The Authors.                        et al., 2015) processes play a role in Arctic sea-ice changes. Typically, changes in near-surface air temperature
This is an open access article under        strongly control the variability in Arctic sea-ice area over short time scales (Olonscheck et al., 2019), while ocean
the terms of the Creative Commons
Attribution License, which permits use,     heat transport has a stronger impact on longer time scales (Onarheim et al., 2015).
distribution and reproduction in any
medium, provided the original work is       The influence of atmospheric and ocean processes on Arctic sea ice is usually quantified via correlation and
properly cited.                             regression analyses, including or not a lag (Arthun et al., 2012; Auclair & Tremblay, 2018; Sando et al., 2014).


DOCQUIER ET AL.                                                                                                                                               1 of 11
                                               Geophysical Research Letters                                                   10.1029/2021GL095892


Visualization: D. Docquier, S. Vannitsem   However, the presence of a correlation between one variable and another does not firmly demonstrate a causal
Writing – original draft: D. Docquier,
                                           influence between these variables. In order to identify such a causal link, causal inference frameworks can be
S. Vannitsem, F. Ragone, K. Wyser, X.
S. Liang                                   used (Granger, 1969; Krakovska et al., 2018; Liang, 2014; Runge et al., 2019; Sugihara et al., 2012) and have
Writing – review & editing: D.             been applied to climate studies (e.g., Deza et al., 2015; Harries & O’Kane, 2021; Kretschmer et al., 2016; Mose-
Docquier, S. Vannitsem, F. Ragone, K.
                                           dale et al., 2006; Tsonis et al., 2015; Vannitsem & Ekelmans, 2018). The Liang-Kleeman information flow
Wyser, X. S. Liang
                                           method (Liang & Kleeman, 2005) is particularly interesting because it allows identifying of the direction and
                                           magnitude of the cause-effect relationships between variables (Liang, 2014, 2021). This novel method has been
                                           successfully applied to several climate studies, for example, the causal structure between greenhouse gases and
                                           global mean surface temperature (Stips et al., 2016) and the dynamical dependence between key observables
                                           and the Antarctic surface mass balance (Vannitsem et al., 2019). It constitutes an adequate framework to identify
                                           causal relationships between different climate variables.

                                           In our study, we use the Liang-Kleeman information flow method to analyze the influence of several potential
                                           climate drivers on Arctic sea-ice area and volume, as well as the reverse impact of sea-ice area and volume on
                                           these drivers. We make use of the Swedish Meteorological and Hydrological Institute Large Ensemble (SMHI-
                                           LENS) to perform this analysis. We describe the data and methodology in Section 2, present our main results in
                                           Section 3, and provide our conclusions in Section 4.



                                           2. Data and Methods
                                           SMHI-LENS is one of the largest existing single-model large ensembles (Deser et al., 2020) using the Coupled
                                           Model Intercomparison Project 6 (CMIP6; Eyring et al. [2016]) forcing scenarios. It consists of 50 members
                                           realized with the global climate model EC-Earth3 (Döscher et al., 2022; Wyser et al., 2021). The atmosphere
                                           component, IFS cy36r4, has a horizontal resolution of ∼80 km, while the ocean component, NEMO3.6 (includ-
                                           ing the sea-ice model LIM3), has a horizontal resolution of ∼1°. The 50 ensemble members were started in 1970
                                           from 50 different initial conditions using CMIP6 historical forcing and run until 2014. From 2015 until the end of
                                           the century, each member was run several times to take into account different greenhouse gas emission scenarios
                                           based on the Shared Socioeconomic Pathways (SSP; O’Neill et al. [2016]). More details about the SMHI-LENS
                                           protocol can be found in Wyser et al. (2021). In our study, we use the 50 members of SMHI-LENS over the
                                           historical period (1970-2014) and over the two most extreme SSP scenarios (2015-2100), that is, SSP1-1.9 and
                                           SSP5-8.5, corresponding to an increase in global mean near-surface temperature of less than 2°C and ∼6°C,
                                           respectively, between 1970 and 2100 (Wyser et al., 2021).

                                           From the model monthly mean outputs, we compute Arctic sea-ice area (volume) based on the product of sea-ice
                                           concentration (sea-ice volume per area, respectively) in each grid point and grid-cell area, summed over all grid
                                           points north of 40°N. We focus on sea-ice area and volume in March and September, as these are months of maxi-
                                           mum and minimum sea-ice area, respectively. We also compute six quantities that constitute potential atmos-
                                           pheric and ocean drivers of changes in Arctic sea ice based on the available literature: Arctic near-surface air
                                           temperature (Olonscheck et al., 2019), Arctic sea-surface temperature (SST, Docquier et al. [2021]), total Arctic
                                           Ocean heat transport (Onarheim et al., 2015), ocean heat transport at 70°N (Burgard & Notz, 2017), atmospheric
                                           heat transport at 70°N (Burgard & Notz, 2017), and Arctic Oscillation Index (AOI, Kretschmer et al. [2016]). We
                                           take the annual mean (January-December) for the first five quantities and the winter (January-March) average for
                                           AOI. Results of the method do not strongly depend on the starting month for computing the annual mean. In our
                                           study, by using annual means, we focus on the interannual time scale, and we acknowledge that the decadal time
                                           scale is not taken into account. More details about how the different quantities are computed are included in the
                                           Supporting Information.

                                           In the high-emission scenario (SSP5-8.5), the ensemble mean March sea-ice area and volume decrease by 63%
                                           and 94%, respectively, across the 131 years of model simulation and the September sea ice completely disap-
                                           pears around 2060 (Figures 1a and 1b). This sea-ice loss is associated with an increase in Arctic near-surface
                                           temperature and SST of 18°C and 7°C, respectively (Figure 1c), an enhanced total Arctic Ocean heat transport
                                           of 180 TW (Figure 1d), and an increase in ocean heat transport at 70°N of 0.1 PW (Figure 1e) at the end of the
                                           century compared to 1970. The atmospheric heat transport at 70°N decreases by 0.3 PW across the twenty-first
                                           century (Figure 1e) and no significant change is detected for AOI due to large interannual variability (Figure 1f).
                                           In the low-emission scenario (SSP1-1.9), these changes are also apparent but with a much lower magnitude and a


DOCQUIER ET AL.                                                                                                                                       2 of 11
                                             Geophysical Research Letters                                                         10.1029/2021GL095892




Figure 1. Time series of all considered variables for the 50 EC-Earth3 members (thin lines) and the ensemble mean (dark thick lines) over 1970-2100 (historical
Coupled Model Intercomparison Project 6 run and SSP5-8.5 scenario). (a) March and September Arctic sea-ice area (SIA); (b) March and September Arctic sea-ice
volume (SIV); (c) annual mean Arctic near-surface temperature (T2m) and Arctic sea-surface temperature (SST); (d) annual mean total Arctic Ocean heat transport
(OHTA); (e) annual mean poleward ocean and atmospheric heat transports at 70°N (OHT70N and AHT70N); (f) winter (JFM) Arctic Oscillation index (AOI).


                                         stabilization around the middle of the century (Figure S1). Especially, Arctic sea ice is still present in September
                                         and the ensemble mean September sea-ice area stabilizes at 1.8 million km 2 from around 2040 to 2100. In our
                                         study, we focus on SSP5-8.5 as the results between the two scenarios are relatively consistent in terms of transfer
                                         of information, but we also discuss differences between scenarios if they exist.

                                         The absolute rate of information transfer from variable Xj to variable Xi is computed following Liang (2021):



DOCQUIER ET AL.                                                                                                                                             3 of 11
                      Geophysical Research Letters                                                      10.1029/2021GL095892



                                                                             𝑑𝑑
                              1                          𝐶𝐶𝑖𝑖𝑖𝑖
                  (1)
                                   ∑
                  𝑇𝑇𝑗𝑗→𝑖𝑖 =      ⋅     Δ𝑗𝑗𝑗𝑗 𝐶𝐶𝑘𝑘𝑘𝑘𝑘𝑘𝑘 ⋅        ,
                            det𝐂𝐂 𝑘𝑘=1                   𝐶𝐶𝑖𝑖𝑖𝑖

                  where C is the covariance matrix, d is the number of variables (d = 7 in our case), Δjk are the cofactors of C, Ck,di
                  is the sample covariance between all Xk and the Euler forward difference approximation of dXi/dt (t is time), Cij
                  is the sample covariance between Xi and Xj, Cii is the sample variance of Xi. When Tj→i is statistically different
                  from 0, Xj has an influence on Xi, while if Tj→i = 0 there is no influence. Statistical significance is computed via
                  bootstrap resampling with replacement of all terms included in Equation 1 using 1,000 realizations. The rate of
                  information transfer is normalized following Liang (2021) and is expressed in percent (see Supporting Informa-
                  tion for more details).

                  We compute the transfer of information including the seven variables described above, where sea ice is either
                  March sea-ice area, September sea-ice area, March sea-ice volume, or September sea-ice volume. This allows
                  checking the role of sea-ice seasonality and the effect of using sea-ice thickness information or not. Two differ-
                  ent methods for computing the rate of information transfer are used. In the first method, hereafter referred to as
                  ‘member analysis’, the rate of information transfer is computed for each member separately. As the information
                  flow method applies to stationary time series (see Supporting Information), we detrend each quantity before
                  computing the rate of information transfer by removing the ensemble mean for each model member (Figure S2).
                  Due to the limited amount of September sea ice after 2040 and as the two last decades show a strong acceler-
                  ation in the reduction of March sea-ice area in the high-emission scenario (Figure 1a), we limit our analysis to
                  1970-2040 for September (71 data points for each member) and 1970-2080 for March (111 data points for each
                  member). We take the ensemble mean rate of information transfer and check the statistical significance via the
                  Fisher's method for multiple tests (Fisher [1992]; Figure 2). In the second method, hereafter referred to as ‘time
                  analysis’, the rate of information transfer is computed for each range of 5 years separately (across the member
                  space, resulting in 250 data points for each period of 5 years, except for the last period 2095-2100 including 6
                  years). The latter method allows checking the time evolution of the rate of information transfer between variables
                  (Figures 3 and 4). Having 50 ensemble members allows to reduce the uncertainty related to internal variability
                  (Jahn et al., 2016) for the member analysis, and brings a sufficient number of data points for the time analysis.



                  3. Results
                  3.1. Member Analysis: Rate of Information Transfer Across the Full Time Series

                  We first look at drivers of Arctic sea-ice variability over the whole time period. Figure 2 provides a summary
                  of results from the member analysis as matrices of the ensemble mean relative rate of information transfer and
                  correlation coefficient between March/September sea-ice area and its potential drivers based on SSP5-8.5. The
                  self-influence of variables (shown in the matrix diagonals) is the largest compared to other influences
                                                                                                                    𝐴𝐴    (|𝜏𝜏| ranging
                  between 36% and 63%; Figures 2a and 2c). In the current framework, a self-influence means that the dynamics
                  of the variable state depend on the variable state itself (Liang, 2021).

                  Beside these self-influences, there is a two-way significant information transfer between March sea-ice area on
                  the one hand, and near-surface temperature, Arctic SST and Arctic Ocean heat transport on the other hand, as
                  well as a significant influence of ocean heat transport at 70°N on March sea-ice area (Figure 2a). The causal
                  links are stronger from March sea-ice area to near-surface temperature 𝐴𝐴     (|𝜏𝜏| = 13%), to𝐴𝐴SST (|𝜏𝜏| = 9%), and to
                  Arctic Ocean heat transport
                                         𝐴𝐴      (|𝜏𝜏| = 9%; first row in Figure 2a), than the reverse (first column in Figure 2a). This
                  suggests that recent and future changes in March sea-ice area have a strong impact on Arctic temperatures (both
                  at the sea surface and air surface) and ocean heat transport. The influence of sea-ice area on sea-surface and air
                  temperatures is strongly linked to the ice-albedo feedback (Andry et al., 2017; Massonnet et al., 2018; Wunder-
                  ling et al., 2020). One potential mechanism by which ocean heat transport is affected by sea-ice changes is the
                  following: the decline in Arctic sea ice leads to smaller ice export through Fram Strait and to an increase in Green-
                  land Sea salinity. The latter lower sea-surface height and strengthens the cyclonic gyre circulation in the Nordic
                  Seas, resulting in increased volume and heat transport of Atlantic water into the Arctic Ocean through Fram Strait
                  (Wang et al., 2020). Additionally, correlation coefficients are negative between March sea-ice area and Arctic
                  near-surface temperature (R = −0.79), Arctic SST (R = −0.75), and Arctic Ocean heat transport (R = −0.59;
                  Figure 2b). Thus, combining the relative rates of information transfer and correlation coefficients, we can infer


DOCQUIER ET AL.                                                                                                                  4 of 11
                                               Geophysical Research Letters                                                            10.1029/2021GL095892




Figure 2. Matrices of EC-Earth3 ensemble mean (a, c) relative rate of information transfer τ (in absolute value; unit: %) and (b, d) correlation coefficient R between (a,
b) March Arctic sea-ice area (MSIA, 1970-2080), (c, d) September sea-ice area (SSIA, 1970-2040) and the six drivers for which acronym definitions are provided in the
caption of Figure 1, based on historical Coupled Model Intercomparison Project 6 run and SSP5-8.5 scenario. The highlighted elements are significant at the 5% level
based on Fisher's method for multiple tests.


                                           that the ongoing decrease in March sea-ice area leads to larger SST, larger near-surface temperature, and larger
                                           ocean heat transport in the Arctic. Although slightly weaker, a similar conclusion can be drawn for the influence
                                           of air temperature, SST and ocean heat transport on March sea-ice area.


DOCQUIER ET AL.                                                                                                                                                   5 of 11
                      Geophysical Research Letters                                                               10.1029/2021GL095892




                  Figure 3. Time evolution of the relative rate of information transfer τ (in absolute value; left axis) and correlation coefficient
                  R (right axis) for each period of 5 years between 1970 and 2100 (historical Coupled Model Intercomparison Project 6 run
                  and SSP5-8.5 scenario), computed over the 50 EC-Earth3 members. (a) Transfer of information from annual mean Arctic
                  near-surface air temperature (T2m) to March Arctic sea-ice area (MSIA) (red circles), from MSIA to T2m (blue circles), and
                  correlation coefficient between T2m and MSIA (black crosses). (b) Transfer of information from annual mean total Arctic
                  Ocean heat transport (OHTA) to MSIA (red circles), from MSIA to OHTA (blue circles), and correlation coefficient between
                  OHTA and MSIA (black crosses). The error bars show the 95% confidence intervals for τ using bootstrap with replacement.


                  By contrast with March, September sea-ice area has a significant influence only on near-surface temperature
                  (but this is relatively reduced,
                                               𝐴𝐴 i.e., |𝜏𝜏| = 5%; Figure 2c). Also, while changes in March sea-ice area are driven by
                  changes in air and sea-surface temperature, as well as ocean heat transport (Figure 2a), changes in September
                  sea-ice area primarily come from changes in near-surface temperature𝐴𝐴     (|𝜏𝜏| = 16%; Figure 2c). Arctic sea-ice area
                  is more than twice larger in March compared to September (Figure 1a), and sea ice is present in March in (or close
                  to) regions where large increases in ocean heat transport and SST have been reported in the past years, such as
                  the Barents Sea (Arthun et al., 2012), Laptev Sea (Polyakov et al., 2017), and Chukchi Sea (Serreze et al., 2019).
                  Thus, the role of a warming ocean and enhanced ocean heat transport on sea ice is greater in March compared to
                  September. As sea ice is much more confined to the central Arctic in September, the primary driver of September
                  sea-ice area decrease in the past and future years is the air temperature.

                  Results from the member analysis are relatively similar for the weak greenhouse gas emission scenario (SSP1-
                  1.9), with a larger influence of March sea-ice area on Arctic near-surface temperature and ocean heat transport
                  than the reverse, a larger impact of air temperature on the sea-ice area in September than in March, and a stronger
                  causal link from the ocean (SST) to the sea-ice area in March (Figure S3). An exception in SSP1-1.9, compared
                  to SSP5-8.5, is that there is no significant information transfer from air temperature and Arctic Ocean heat trans-
                  port to March sea-ice area. When taking sea-ice volume instead of sea-ice area, the influence of near-surface


DOCQUIER ET AL.                                                                                                                             6 of 11
                      Geophysical Research Letters                                                            10.1029/2021GL095892




                  Figure 4. Time evolution of relative rate of information transfer τ (in absolute value; left axis) and correlation coefficient
                  R (right axis) for each period of 5 years between 1970 and 2100 (historical Coupled Model Intercomparison Project 6 run
                  and SSP5-8.5 scenario), computed over the 50 EC-Earth3 members. (a) Transfer of information from annual mean Arctic
                  near-surface air temperature (T2m) to March Arctic sea-ice volume (MSIV) (red circles), from MSIV to T2m (blue circles),
                  and correlation coefficient between T2m and MSIV (black crosses). (b) Transfer of information from annual mean total Arctic
                  Ocean heat transport (OHTA) to MSIV (red circles), from MSIV to OHTA (blue circles), and correlation coefficient between
                  OHTA and MSIV (black crosses). The error bars show the 95% confidence intervals for τ using bootstrap with replacement.


                  temperature and SST on March sea-ice volume becomes larger than the reverse in the two emission scenarios
                  (Figures S4a and S5a). This suggests that temperature changes at the surface of the ocean and above greatly affect
                  sea-ice thickness. In September, near-surface temperature constitutes by far the largest driver of sea-ice volume,
                  similar to the sea-ice area, but during this month sea-ice volume also affects SST and Arctic Ocean heat transport
                  (Figures S4c and S5c), while it is not the case for the sea-ice area (Figures 2c and S3c in Supporting Informa-
                  tion S1). Thus, changes in sea-ice thickness play an important role in driving changes in ocean temperature and
                  heat transport.

                  For the two scenarios, no causal influence is detected between sea-ice area and volume in March and September
                  on the one hand, and AOI on the other hand. While no influence of sea-ice area and volume on the ocean and
                  atmospheric heat transport at 70°N is found in any of the two scenarios, ocean heat transport at 70°N appears to
                  cause changes in March sea-ice area (Figures 2a-S3a in Supporting Information S1), in agreement with results
                  found in Burgard and Notz (2017) and Docquier et al. (2019), and atmospheric heat transport has an influence
                  on March sea-ice volume (Figures S4a-S5a). Interestingly, a significantly positive correlation appears between
                  March sea-ice area and atmospheric heat transport at 70°N (R = 0.56; Figure 2b), but no significant transfer of
                  information exists (Figure 2a). This suggests that an external driver causes concomitant changes in the sea-ice
                  area and atmospheric heat transport, while these two quantities do not influence each other. The main suspect is


DOCQUIER ET AL.                                                                                                                          7 of 11
                           Geophysical Research Letters                                                    10.1029/2021GL095892


                       SST as it influences both variables: an increase in SST leads to the lower sea-ice area and lower atmospheric heat
                       transport at 70°N (Figures 2a and 2b). This further demonstrates that correlation does not mean causation and
                       shows the strength of the Liang-Kleeman information flow method (Liang, 2014).



                       3.2. Time Analysis: Evolution of the Rate of Information Transfer

                       Based on the previous member analysis (Section 3.1), near-surface temperature, SST and Arctic Ocean heat
                       transport constitute the most important drivers of changes in Arctic sea ice, and conversely. For the time analysis,
                       we focus on the cause-effect relationships between near-surface air temperature and Arctic Ocean heat transport
                       on the one hand, and Arctic sea-ice area and volume on the other hand. We do not consider SST as this quantity
                       is somewhat integrated into ocean heat transport and is thus redundant. The goal of the time analysis is to clarify
                       the modifications in the rate of information transfer under climate change.

                       The correlation coefficient between March Arctic sea-ice area and Arctic near-surface temperature stays relatively
                       constant through the whole time period with large negative values (R = −0.75 to −0.9; Figure 3a), in agreement
                       with previous studies (e.g., Olonscheck et al., 2019). The relative rate of information transfer from near-surface
                       temperature to March sea-ice area shows a large 5-year variability, with a peak in 1975–1979𝐴𝐴     (|𝜏𝜏| ≈ 23%) and
                       four additional 5-year periods having a significant influence (Figure 3a). The number of periods with a significant
                       rate of information transfer from March sea-ice area to near-surface temperature is twice more important (i.e.,
                       11 periods) than the reverse influence (Figure 3a), which confirms previous results from the member analysis
                       (Section 3.1). Additionally, no significant influence of March sea-ice area on near-surface temperature remains
                       after 2050, while one 5-year period shows an influence of temperature on sea-ice area after 2050 (Figure 3a). In
                       September, the rate of information transfer from near-surface temperature to sea-ice area is generally larger than
                       from sea-ice area to temperature, and peaks in 2025–2029 before decreasing (Figure S6a).

                       As for the information transfer from March sea-ice area to near-surface temperature, the rate of information
                       transfer from March sea-ice area to the Arctic Ocean heat transport generally decreases over time, with almost
                       no significant influence after 2050 (Figure 3b). For the reverse transfer of information from ocean heat transport
                       to Arctic sea-ice area, eight periods are significant, with five periods after 2050, but with relatively low values
                  𝐴𝐴   (|𝜏𝜏| = 6-7%). Year 2050 also marks a threshold after which the correlation coefficient between March sea-ice area
                       and ocean heat transport starts decreasing from R ≈ −0.7 on average for 1970-2049 to R = −0.25 in 2095–2100
                       (Figure 3b). Thus, as the sea-ice area becomes smaller, the two-way influence between sea-ice area and near-sur-
                       face temperature and ocean heat transport becomes weaker. This is also the case in September with a decrease
                       starting earlier on due to lower sea-ice area during that month (Figure S6b). Results are qualitatively similar in
                       the low greenhouse gas emission scenario (Figures S7-S8).

                       Contrarily to the rate of information transfer from near-surface temperature to March sea-ice area, the informa-
                       tion transfer from near-surface temperature to March sea-ice volume remains strong almost until the end of the
                       century, with values
                                        𝐴𝐴 of |𝜏𝜏| between ∼10% and 35% (Figure 4a). This means that the increase in air temperature
                       leads to a decrease in sea-ice volume until the end of the century. This result is counter-intuitive as sea ice is
                       getting thinner and sea-ice area and volume are expected to behave in a more similar way across the twenty-first
                       century. Changes in March sea-ice volume also influence changes in near-surface temperature, but with lower
                       values of information transfer than the reverse influence and a progressive decrease across time (Figure 4a). In
                       September, the information transfer is also generally larger from near-surface temperature to sea-ice volume than
                       the reverse, except at the beginning of the model simulation (1970-1995; Figure S9a).

                       As for the March sea-ice area - ocean heat transport relationship, the correlation coefficient between March
                       sea-ice volume and ocean heat transport decreases over time (Figure 4b). This coincides with a decrease over time
                       in the influence of March sea-ice volume on ocean heat transport. The transfer of information from ocean heat
                       transport to March sea-ice volume stays relatively low through the whole twenty-first century, with only three
                       5-year periods showing a significant transfer of information (Figure 4b). Results are qualitatively similar when
                       considering September sea-ice volume (Figure S9b), as well as the SSP1-1.9 scenario (Figures S10-S11). The use
                       of slightly smaller (3–4 years) or larger (10 years) periods does not change our key results.




DOCQUIER ET AL.                                                                                                                    8 of 11
                                                  Geophysical Research Letters                                                                            10.1029/2021GL095892



                                             4. Conclusions and Perspectives
                                             In our study, we have applied for the first time the Liang-Kleeman information flow method to the analysis of
                                             causal influences between Arctic sea-ice area and volume and their potential drivers using SMHI-LENS (50
                                             members simulated with EC-Earth3). We found that the recent and future changes in Arctic sea-ice area and
                                             volume are mainly driven by near-surface air temperature, sea-surface temperature, and ocean heat transport, in
                                             agreement with previous studies (Olonscheck et al., 2019; Onarheim et al., 2015). More surprisingly, the reverse
                                             influence of sea-ice area and volume on temperature and ocean heat transport also exists and is sometimes larger
                                             than the reverse influence depending on the quantity (sea-ice area or volume) and the month of the year (March
                                             or September). This two-way influence indicates that the current decrease in Arctic sea-ice area and volume is
                                             not solely related to air temperature and, consequently to greenhouse gas emissions (Notz & Stroeve, 2016),
                                             but is also potentially driven by feedback mechanisms between sea ice, the atmosphere and the ocean (Goosse
                                             et al., 2018; Pithan & Mauritsen, 2014).

                                             Our results also show a progressive loss of influence of sea-ice area and volume on air temperature and ocean
                                             heat transport through the twenty-first century on the one hand. This indicates that interactions between sea ice,
                                             the atmosphere, and the ocean, especially the ice-albedo feedback (Wunderling et al., 2020), become weaker as
                                             sea-ice area decreases. On the other hand, the rate of information transfer from air temperature to September
                                             Arctic sea-ice area and volume (in both March and September) remains more constant through time and relatively
                                             large. This suggests that changes in near-surface temperature have a long-lasting effect on September sea-ice area
                                             and March and September sea-ice volume. Identifying the thermo-dynamical mechanisms causing these differ-
                                             ences in directional dependence across time should be addressed in the future. This could be achieved via an anal-
                                             ysis of the exact processes by which sea ice melts and refreezes, combined with the Liang-Kleeman information
                                             flow method. Finally, as sea-ice changes are not spatially uniform (Arthun et al., 2021; Onarheim et al., 2018),
                                             extending this analysis to different regions of the Arctic could also provide more insight into the spatial variability
                                             of the information transfer between Arctic sea ice and its drivers.



                                             Data Availability Statement
                                             Model data from EC-Earth3 SMHI-LENS (Wyser et al., 2021) are available on the Earth System Grid Federation
                                             (ESGF) nodes (https://esgf-node.llnl.gov/search/cmip6) via a search for ‘Source ID’ = EC-Earth3 and ‘Variant
                                             Label’ = r101i1p1f1 to r150i1p1f1. The Python scripts to produce the figures of this article are available on
                                             Zenodo: https://zenodo.org/record/6375655 (Docquier, 2022).


Acknowledgments                              References
We thank two anonymous reviewers
for their valuable feedback that helped      Andry, O., Bintanja, R., & Hazeleger, W. (2017). Time-dependent variations in the Arctic’s surface albedo feedback and the link to seasonality in
improve this manuscript as well as the         sea ice. Journal of Climate, 30(1), 393–410. https://doi.org/10.1175/JCLI-D-15-0849.1
GRL editorial team for handling our          Arthun, M., Eldevik, T., Smedsrud, L. H., Skagseth, O., & Ingvaldsen, R. B. (2012). Quantifying the influence of Atlantic heat on Barents Sea
paper. The EC-Earth3 simulations were          ice variability and retreat. Journal of Climate, 25(13), 4736–4743. https://doi.org/10.1175/JCLI-D-11-00466.1
enabled by resources provided by the         Arthun, M., Onarheim, I. H., Dorr, J., & Eldevik, T. (2021). The seasonal and regional transition to an ice-free Arctic. Geophysical Research
Swedish National Infrastructure for            Letters, 48(1), e2020GL090825. https://doi.org/10.1029/2020GL090825
Computing (SNIC), partially funded by        Auclair, G., & Tremblay, B. (2018). The role of ocean heat transport in rapid sea ice declines in the Community Earth System Model Large
the Swedish Research Council through           Ensemble. Journal of Geophysical Research, 123(12), 8941–8957. https://doi.org/10.1029/2018JC014525
grant agreement no. 2018-05973. D.           Burgard, C., & Notz, D. (2017). Drivers of Arctic Ocean warming in CMIP5 models. Geophysical Research Letters, 44(9), 4263–4271. https://
Docquier and S. Vannitsem acknowledge          doi.org/10.1002/2016GL072342
partial support from ROADMAP (Role of        Carmack, E., Polyakov, I., Padman, L., Fer, I., Hunke, E., Hutchings, J., et al. (2015). Toward quantifying the increasing role of oceanic heat in sea
ocean dynamics and Ocean-Atmosphere            ice loss in the new Arctic. Bulletin of the American Meteorological Society, 96(12), 2079–2105. https://doi.org/10.1175/BAMS-D-13-00177.1
interactions in Driving cliMAte variations   Deser, C., Lehner, F., Rodgers, K. B., Ault, T., Delworth, T. L., DiNezio, P. N., et al. (2020). Insights from Earth system model initial-condition
and future Projections of impact-relevant      large ensembles and future prospects. Nature Climate Change, 10, 277–286. https://doi.org/10.1038/s41558-020-0731-2
extreme events; http://www.jpi-climate.      Deza, J. I., Barreiro, M., & Masoller, C. (2015). Assessing the direction of climate interactions by means of complex networks and information
eu/joint-activities/joint-calls/CPILoud/       theoretic tools. Chaos, 25, 033105. https://doi.org/10.1063/1.4914101
ROADMAP), a coordinated JPI-Cli-             Ding, Q., Schweiger, A., L’Heureux, M., Battisti, D. S., Po-Chedley, S., Johnson, N. C., et al. (2017). Influence of high-latitude atmospheric
mate/JPI-Oceans project, financed by           circulation changes on summertime Arctic sea ice. Nature Climate Change, 7, 289–295. https://doi.org/10.1038/nclimate3241
the Belgian Federal Science Policy           Docquier, D. (2022). Liang Index to quantify causal links between Arctic sea ice and its drivers (v2.1). Zenodo. https://doi.org/10.5281/
Office under contract B2/20E/P1/               zenodo.6375655
ROADMAP. X. S. Liang was funded by           Docquier, D., Grist, J. P., Roberts, M. J., Roberts, C. D., Semmler, T., Ponsoni, L., et al. (2019). Impact of model resolution on Arctic sea ice and
the National Science Foundation of China       North Atlantic Ocean heat transport. Climate Dynamics, 53, 4989–5017. https://doi.org/10.1007/s00382-019-04840-y
under Grant 41975064.                        Docquier, D., & Koenigk, T. (2021). Observation-based selection of climate models projects Arctic ice-free summers around 2035. Communica-
                                               tions Earth and Environment, 2(144). https://doi.org/10.1038/s43247-021-00214-7




DOCQUIER ET AL.                                                                                                                                                                          9 of 11
                       Geophysical Research Letters                                                                         10.1029/2021GL095892


                  Docquier, D., Koenigk, T., Fuentes-Franco, R., Karami, M. P., & Ruprich-Robert, Y. (2021). Impact of ocean heat transport on the Arctic sea-ice
                     decline: A model study with EC-Earth3. Climate Dynamics, 56, 1407–1432. https://doi.org/10.1007/s00382-020-05540-8
                  Döscher, R., Acosta, M., Alessandri, A., Anthoni, P., Arsouze, T., Bergman, T., et al. (2022). The EC-Earth3 Earth system model for the Coupled
                     Model Intercomparison Project 6. Geoscientific Model Development, 15, 2973–3020. https://doi.org/10.5194/gmd-15-2973-2022
                  Eyring, V., Bony, S., Meehl, G. A., Senior, C. A., Stevens, B., Stouffer, R. J., & Taylor, K. E. (2016). Overview of the Coupled Model Inter-
                     comparison Project Phase 6 (CMIP6) experimental design and organization. Geoscientific Model Development, 9, 1937–1958. https://doi.
                     org/10.5194/gmd-9-1937-2016
                  Fisher, R. A. (1992). Statistical methods for research workers. In S.Kotz, & N.L.Johnson (Eds.), Breakthroughs in Statistics. Springer series in
                     Statistics (Perspectives in Statistics): Springer. https://doi.org/10.1007/978-1-4612-4380-9_6
                  Goosse, H., Kay, J. E., Armour, K. C., Bodas-Salcedo, A., Chepfer, H., Docquier, D., et al. (2018). Quantifying climate feedbacks in polar regions.
                     Nature Communications, 9(1919), 1–13. https://doi.org/10.1038/s41467-018-04173-0
                  Granger, C. W. (1969). Investigating causal relations by econometric models and cross-spectral methods. Econometrica, 37(3), 424–438. https://
                     doi.org/10.2307/1912791
                  Harries, D., & O’Kane, T. J. (2021). Dynamic Bayesian networks for evaluation of Granger causal relationships in climate reanalyses. Journal of
                     Advances in Modeling Earth Systems, 13(5), e2020MS002442. https://doi.org/10.1029/2020MS002442
                  IPCC. (2019). Summary for Policymakers. In H.-O.Pörtner, D.C.Roberts, V.Masson-Delmotte, P.Zhai, M.Tignor, E.Poloczanska, K.Mintenbeck,
                     A.Alegria, M.Nicolai, A.Okem, J.Petzold, B. Rama, & N.M.Weyer (Eds.), IPCC Special Report on the Ocean and Cryosphere in a Changing
                     Climate: Cambridge University Press.
                  Jahn, A., Kay, J. E., Holland, M. M., & Hall, D. M. (2016). How predictable is the timing of a summer ice-free Arctic? Geophysical Research
                     Letters, 43(17), 9113–9120. https://doi.org/10.1002/2016GL070067
                  Krakovska, A., Jakubik, J., Chvostekova, M., Coufal, D., Jajcay, N., & Palus, M. (2018). Comparison of six methods for the detection of causality
                     in a bivariate time series. Physical Review E, 97(4), 042207. https://doi.org/10.1103/PhysRevE.97.042207
                  Kretschmer, M., Coumou, D., Donges, J. F., & Runge, J. (2016). Using causal effect networks to analyze different Arctic drivers of midlatitude
                     winter circulation. Journal of Climate, 29(11), 4069–4081. https://doi.org/10.1175/JCLI-D-15-0654.1
                  Kwok, R. (2018). Arctic sea ice thickness, volume, and multiyear ice coverage: Losses and coupled variability (1958-2018). Environmental
                     Research Letters, 13(10), 105005. https://doi.org/10.1088/1748-9326/aae3ec
                  Liang, X. S. (2014). Unraveling the cause-effect relation between time series. Physical Review E, 90(5), 052150. https://doi.org/10.1103/
                     PhysRevE.90.052150
                  Liang, X. S. (2021). Normalized multivariate time series causality analysis and causal graph reconstruction. Entropy, 23(6), 679. https://doi.
                     org/10.3390/e23060679
                  Liang, X. S., & Kleeman, R. (2005). Information transfer between dynamical system components. Physical Review Letters, 95(24), 244101.
                     https://doi.org/10.1103/PhysRevLett.95.244101
                  Lindsay, R., & Schweiger, A. (2015). Arctic sea ice thickness loss determined using subsurface, aircraft, and satellite observations. The
                     Cryosphere, 9, 269–283. https://doi.org/10.5194/tc-9-269-2015
                  Massonnet, F., Vancoppenolle, M., Goosse, H., Docquier, D., Fichefet, T., & Blanchard-Wrigglesworth, E. (2018). Arctic sea-ice change tied to its
                     mean state through thermodynamic processes. Nature Climate Change, 8, 599–603. https://doi.org/10.1038/s41558-018-0204-z
                  Mosedale, T. J., Stephenson, D. B., Collins, M., & Mills, T. C. (2006). Granger causality of coupled climate processes: Ocean feedback on the
                     North Atlantic Oscillation. Journal of Climate, 19(7), 1182–1194. https://doi.org/10.1175/JCLI3653.1
                  Notz, D., & Stroeve, J. (2016). Observed Arctic sea-ice loss directly follows anthropogenic CO2 emission. Science, 354(6313), 747–750. https://
                     doi.org/10.1126/science.aag2345
                  Olonscheck, D., Mauritsen, T., & Notz, D. (2019). Arctic sea-ice variability is primarily driven by atmospheric temperature fluctuations. Nature
                     Geoscience, 12, 430–434. https://doi.org/10.1038/s41561-019-0363-1
                  Onarheim, I. H., Eldevik, T., Arthun, M., Ingvaldsen, R. B., & Smedsrud, L. H. (2015). Skillful prediction of Barents Sea ice cover. Geophysical
                     Research Letters, 42(13), 5364–5371. https://doi.org/10.1002/2015GL064359
                  Onarheim, I. H., Eldevik, T., Smedsrud, L. H., & Stroeve, J. C. (2018). Seasonal and regional manifestation of Arctic sea ice loss. Journal of
                     Climate, 31(12), 4917–4932. https://doi.org/10.1175/JCLI-D-17-0427.1
                  O’Neill, B. C., Tebaldi, C., vanVuuren, D. P., Eyring, V., Friedlingstein, P., Hurtt, G., et al. (2016). The Scenario Model Intercomparison Project
                     (ScenarioMIP) for CMIP6. Geoscientific Model Development, 9, 3461–3482. https://doi.org/10.5194/gmd-9-3461-2016
                  Pithan, F., & Mauritsen, T. (2014). Arctic amplification dominated by temperature feedbacks in contemporary climate models. Nature Geosci-
                     ence, 7, 181–184. https://doi.org/10.1038/NGEO2071
                  Polyakov, I. V., Pnyushkov, A. V., Alkire, M. B., Ashik, I. M., Baumann, T. M., Carmack, E. C., et al. (2017). Greater role for Atlantic inflows on
                     sea-ice loss in the Eurasian basin of the Arctic Ocean. Science, 356(6335), 285–291. https://doi.org/10.1126/science.aai8204
                  Runge, J., Bathiany, S., Bollt, E., Camps-Valls, G., Coumou, D., Deyle, E., et al. (2019). Inferring causation from time series in Earth system
                     sciences. Nature Communications, 10, 2553. https://doi.org/10.1038/s41467-019-10105-3
                  Sando, A. B., Gao, Y., & Langehaug, H. R. (2014). Poleward ocean heat transports, sea ice processes, and Arctic sea ice variability in NorESM1-M
                     simulations. Journal of Geophysical Research, 119(3), 2095–2108. https://doi.org/10.1002/2013JC009435
                  Schweiger, A. J., Wood, K. R., & Zhang, J. (2019). Arctic sea ice volume variability over 1901-2010: A model-based reconstruction. Journal of
                     Climate, 32(15), 4731–4752. https://doi.org/10.1175/JCLI-D-19-0008.1
                  Serreze, M. C., Barrett, A. P., Crawford, A. D., & Woodgate, R. A. (2019). Monthly variability in Bering Strait oceanic volume and heat trans-
                     ports, links to atmospheric circulation and ocean temperature, and implications for sea ice conditions. Journal of Geophysical Research,
                     124(12), 9317–9337. https://doi.org/10.1029/2019JC015422
                  SIMIP Community. (2020). Arctic sea ice in CMIP6. Geophysical Research Letters, 47(10), e2019GL086749. https://doi.
                     org/10.1029/2019GL086749
                  Stips, A., Macias, D., Coughlan, C., Garcia-Gorriz, E., & Liang, X. S. (2016). On the causal structure between CO2 and global temperature.
                     Scientific Reports, 6, 21691. https://doi.org/10.1038/srep21691
                  Stroeve, J., & Notz, D. (2018). Changing state of Arctic sea ice across all seasons. Environmental Research Letters, 13(10), 103001. https://doi.
                     org/10.1088/1748-9326/aade56
                  Sugihara, G., May, R., Ye, H., Hsieh, C.-H., Deyle, E., Fogarty, M., & Munch, S. (2012). Detecting causality in complex ecosystems. Science,
                     338(6106), 496–500. https://doi.org/10.1126/science.1227079
                  Swart, N. C., Fyfe, J. C., Hawkins, E., Kay, J. E., & Jahn, A. (2015). Influence of internal variability on Arctic sea-ice trends. Nature Climate
                     Change, 5, 86–89. https://doi.org/10.1038/nclimate2483




DOCQUIER ET AL.                                                                                                                                           10 of 11
                       Geophysical Research Letters                                                                          10.1029/2021GL095892


                  Tsonis, A. A., Deyle, E. R., May, R. M., Sugihara, G., Swanson, K., Verbeten, J. D., & Wang, G. (2015). Dynamical evidence for causality
                    between galactic cosmic rays and interannual variation in global temperature. Proceedings of the National Academy of Sciences of the United
                    States of America, 112(11), 3253–3256. https://doi.org/10.1073/pnas.1420291112
                  Vannitsem, S., Dalaiden, Q., & Goosse, H. (2019). Testing for dynamical dependence: Application to the surface mass balance over Antarctica.
                    Geophysical Research Letters, 46(21), 12125–12135. https://doi.org/10.1029/2019GL084329
                  Vannitsem, S., & Ekelmans, P. (2018). Causal dependences between the coupled ocean–atmosphere dynamics over the tropical Pacific, the North
                    Pacific and the North Atlantic. Earth System Dynamics, 9, 1063–1083. https://doi.org/10.5194/esd-9-1063-2018
                  Wang, Q., Wekerle, C., Wang, X., Danilov, S., Koldunov, N., Sein, D., et al. (2020). Intensification of the Atlantic water supply to the
                    Arctic Ocean through Fram Strait induced by Arctic sea ice decline. Geophysical Research Letters, 47(3), e2019GL086682. https://doi.
                    org/10.1029/2019GL086682
                  Wunderling, N., Willeit, M., Donges, J. F., & Winkelmann, R. (2020). Global warming due to loss of large ice masses and Arctic summer sea ice.
                    Nature Communications, 11(5177). https://doi.org/10.1038/s41467-020-18934-3
                  Wyser, K., Koenigk, T., Fladrich, U., Fuentes-Franco, R., Karami, M. P., & Kruschke, T. (2021). The SMHI Large Ensemble (SMHI-LENS) with
                    EC-Earth3.3.1. Geoscientific Model Development, 14, 4781–4796. https://doi.org/10.5194/gmd-14-4781-2021



                  References From the Supporting Information
                  Lavergne, T., Sorensen, A. M., Kern, S., Tonboe, R., Notz, D., Aaboe, S., et al. (2019). Version 2 of the EUMETSAT OSI SAF and ESA CCI
                    sea-ice concentration climate data records. The Cryosphere, 13, 49–78. https://doi.org/10.5194/tc-13-49-2019
                  van der Linden, E. C., Le Bars, D., Bintanja, R., & Hazeleger, W. (2019). Oceanic heat transport into the Arctic under high and low CO2 forcing.
                    Climate Dynamics, 53, 4763–4780. https://doi.org/10.1007/s00382-019-04824-y
                  Tsubouchi, T., Vage, K., Hansen, B., Larsen, K. M. H., Osterhus, S., Johnson, C., et al. (2021). Increased ocean heat transport into the Nordic Seas
                    and Arctic Ocean over the period 1993–2016. Nature Climate Change, 11, 21–26. https://doi.org/10.1038/s41558-020-00941-3
                  Zhang, J., Sheng, Z., Ma, Y., He, Y., Zuo, X., & He, M. (2021). Analysis of the positive Arctic Oscillation Index event and its influence in the
                    winter and spring of 2019/2020. Frontiers in Earth Science, 8(580601), 1–17. https://doi.org/10.3389/feart.2020.580601




DOCQUIER ET AL.                                                                                                                                            11 of 11
