# Full-text extraction

- Title: The Rate of Information Transfer as a Measure of Ocean-Atmosphere Interactions
- Year: 2023
- DOI: https://doi.org/10.5194/esd-14-577-2023
- PDF source: https://esd.copernicus.org/articles/14/577/2023/esd-14-577-2023.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                                                                                                                       Research article
Earth Syst. Dynam., 14, 577–591, 2023
https://doi.org/10.5194/esd-14-577-2023
© Author(s) 2023. This work is distributed under
the Creative Commons Attribution 4.0 License.




                 The rate of information transfer as a measure of
                         ocean–atmosphere interactions
                                David Docquier1 , Stéphane Vannitsem1 , and Alessio Bellucci2
                                 1 Royal Meteorological Institute of Belgium, Brussels, Belgium
       2 Italian National Research Council, Institute of Atmospheric Sciences and Climate (CNR-ISAC), Bologna, Italy

                                Correspondence: David Docquier (david.docquier@meteo.be)

                                Received: 16 September 2022 – Discussion started: 29 September 2022
                             Revised: 20 March 2023 – Accepted: 16 April 2023 – Published: 12 May 2023

       Abstract. Exchanges of mass, momentum and energy between the ocean and atmosphere are of large impor-
       tance in regulating the climate system. Here, we apply for the first time a relatively novel approach, the rate
       of information transfer, to quantify interactions between the ocean surface and the lower atmosphere over the
       period 1988–2017 at a monthly timescale. More specifically, we investigate dynamical dependencies between
       sea surface temperature (SST), SST tendency and turbulent heat flux in satellite observations. We find a strong
       two-way influence between SST and/or SST tendency and turbulent heat flux in many regions of the world, with
       the largest values in the eastern tropical Pacific and Atlantic oceans, as well as in western boundary currents.
       The total number of regions with a significant influence by turbulent heat flux on SST and on SST tendency is
       reduced when considering the three variables (this case should be privileged, as it provides additional sources of
       information), while it remains large for the information transfer from SST and SST tendency to turbulent heat
       flux, suggesting an overall stronger ocean influence compared to the atmosphere. We also find a relatively strong
       influence by turbulent heat flux taken 1 month before on SST. Additionally, an increase in the magnitude of the
       rate of information transfer and in the number of regions with significant influence is observed when looking at
       interannual and decadal timescales compared to monthly timescales.



1   Introduction                                                    2012; Bishop et al., 2017; Roberts et al., 2017; Small et al.,
                                                                    2020; Bellucci et al., 2021).
                                                                       Chelton et al. (2004) used 25 km resolution satellite radar
The climate on Earth is strongly affected by exchanges of           scatterometer measurements over 1999–2003 and revealed
mass, momentum and energy between the ocean and atmo-               the existence of persistent small-scale features in wind stress.
sphere. The ocean absorbs a large amount of solar energy            According to Chelton et al. (2004), much of that mesoscale
and releases part of this energy to the atmosphere. In turn,        variability is attributable to SST modification. In particular,
the atmosphere modifies the ocean state through changes             they found that surface wind speed is locally higher over
in wind, humidity and temperature. The classical view is            warm water and lower over cool water, i.e., a positive cor-
that the slowly changing upper ocean is modulated by the            relation that is opposite to the one found at a large scale.
high-frequency atmospheric variability (Hasselmann, 1976;           Bishop et al. (2017) found that monthly scale lead–lag cor-
Frankignoul and Hasselmann, 1977). While this paradigm              relations between SST, SST tendency and turbulent heat flux
has been successful in explaining the variability in sea sur-       (THF, positive upwards) allow one to discriminate between
face temperature (SST) and surface heat flux over large parts       atmospheric-driven variability and ocean-led variability us-
of the ocean, it has been challenged over ocean regions             ing results from a stochastic energy balance model (Wu et al.,
characterized by intense mesoscale activity, such as west-          2006) designed to represent ocean–atmosphere interactions,
ern boundary currents and the Antarctic Circumpolar Cur-            as well as satellite observations over 1985–2013. In their
rent (Chelton et al., 2004; Brachet et al., 2012; Kirtman et al.,


Published by Copernicus Publications on behalf of the European Geosciences Union.
578                     D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions

analysis, when the SST variability is dominated by atmo-                In our study, we analyze upper-ocean–lower-atmosphere
spheric weather, SST tendency is negatively correlated with          interactions using the rate of information transfer developed
THF anomalies; on the other hand, when the SST fluctua-              by Liang (2021). More specifically, we check the two-way
tions are driven by intrinsic ocean processes (ocean weather),       influences between SST and/or SST tendency and THF at the
the correlation between SST and THF is positive. Follow-             air–sea interface in satellite observations. Thus, our study al-
ing this approach, they showed that eddy-rich regions associ-        lows one to go one step further than previous studies (Bishop
ated with pronounced SST gradients, such as western bound-           et al., 2017; Bellucci et al., 2021), which have mainly fo-
ary currents, are characterized by ocean-driven SST variabil-        cused on lead–lag correlation analyses, by identifying causal
ity, while less dynamically active open-ocean regions, char-         links between these variables. Section 2 presents the data and
acterized by weaker SST gradients, exhibit an atmosphere-            methods used in this analysis. Section 3 provides the main re-
driven SST variability. These two regimes are reproduced by          sults of our study and places them in the overall context. Our
both eddy-parameterized (∼1◦ spatial resolution) and eddy-           conclusions are presented in Sect. 4.
permitting (∼0.25◦ ) coupled global climate models (Bellucci
et al., 2021), with an increased ocean resolution leading to a
                                                                     2     Data and methods
substantially improved representation of SST and THF cross-
covariance patterns.                                                 2.1    Data
   According to a commonly accepted interpretation, the pos-
itive SST–THF zero-lag correlation (identifying an ocean-            We use version 3 of the Japanese Ocean Flux Data Sets
driven regime) indicates a damping role of THF on the SST            with the Use of Remote-Sensing Observations (J-OFURO3;
anomalies generated by ocean dynamics, while the negative            Tomita et al., 2019; Tomita, 2020). This dataset uses the
SST-tendency–THF correlation (identifying an atmosphere-             data of multiple satellites to estimate surface fluxes between
driven regime) is attributed to the ocean surface cooling de-        the ocean and atmosphere over sea-ice-free regions with a
termined by the release of heat from the ocean to the at-            resolution of 0.25◦ . It makes use of passive microwave ra-
mosphere. However, the presence of such correlations does            diometers and scatterometers available from 1988 to 2017
not firmly demonstrate causal influences between these vari-         (see Tomita et al., 2019 for further details). From this dataset,
ables, as correlation does not mean causation. Thus, the use         we extract monthly mean latent and sensible heat fluxes, as
of a dedicated causal method is of crucial importance to cor-        well as SST. The latter is computed as an ensemble median
roborate these findings. Several causal inference frameworks         obtained from various global SST products.
have been developed in the past years to identify such causal           We also use the SeaFlux Data Products to estimate the
links (Granger, 1969; Liang and Kleeman, 2005; Sugihara              observational uncertainty. It consists of estimates of ocean
et al., 2012; Krakovská et al., 2018; Paluš et al., 2018; Runge      surface latent and sensible heat fluxes, among other vari-
et al., 2019).                                                       ables (Roberts et al., 2020). It relies on the use of the
   The Liang–Kleeman information flow method allows one              Special Sensor Microwave Imager (SSM/I) and the Special
to identify the direction and magnitude of the cause–effect          Sensor Microwave Imager Sounder (SSMIS) over the pe-
relationships between variables (Liang and Kleeman, 2005).           riod 1988–2018 (we use 1988–2017 to be consistent with
It is based on the rate of information transfer in dynam-            J-OFURO3). The SST is also available for this dataset and
ical systems and is rigorously derived from the propaga-             is computed using the Reynolds Optimally Interpolated ver-
tion of information entropy between variables (Liang, 2016).         sion 2.0 (Reynolds et al., 2007). As for J-OFURO3, SeaFlux
It was initially developed for two-variable systems (Liang,          data are available on a 0.25◦ grid, and we extract monthly
2014) and has recently been extended to multivariate systems         mean latent and sensible heat fluxes and SST.
(Liang, 2021). Compared to other causal inference frame-                In the main text, we only show results from J-OFURO3,
works, the rate of information transfer is a relatively sim-         as results obtained with SeaFlux are largely consistent. The
ple index to compute one-way and/or two-way dependencies             latter are presented in Appendix B.
between variables. This novel method has been successfully
applied to several climate studies, e.g., causal influences be-      2.2    Methods
tween greenhouse gases and global mean surface tempera-
ture (Stips et al., 2016; Jiang et al., 2019; Hagan et al., 2022),   Our analysis involves three variables, namely SST, SST ten-
dynamical dependencies between a set of observables and              dency and THF, following the approach of Bishop et al.
the Antarctic surface mass balance (Vannitsem et al., 2019),         (2017) and Bellucci et al. (2021). The choice of these three
soil moisture and air temperature interactions in China (Ha-         specific variables is based on the stochastic energy balance
gan et al., 2019), prediction of El Niño Modoki (Liang et al.,       model of Wu et al. (2006). As explained in Sect. 1, lead–lag
2021), causal links between climate indices in the North Pa-         covariances between these three variables are used as a way
cific and Atlantic regions (Vannitsem and Liang, 2022), and          to diagnose ocean-driven and atmosphere-driven regimes.
identification of potential drivers of Arctic sea-ice changes        The goal of our analysis is to go beyond the correlation–
(Docquier et al., 2022).                                             covariance relationships identified by Bishop et al. (2017)


Earth Syst. Dynam., 14, 577–591, 2023                                                   https://doi.org/10.5194/esd-14-577-2023
D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions                                 579

and Bellucci et al. (2021) and to check the causal links be-
tween SST, SST tendency and THF. THF is defined as the
sum of latent heat flux and sensible heat flux and is expressed
in W m−2 (positive upwards), as in Bishop et al. (2017) and
Bellucci et al. (2021). SST tendency is computed via a cen-
tral difference approximation of SST (expressed in ◦ C) using
a time step of 1 month (following Bishop et al., 2017) and is
expressed in ◦ C month−1 .
   We compute the rate of information transfer between SST,
SST tendency and THF at each grid point of the globe using
monthly data from 1988 to 2017. As we would like to ex-
tract statistical information from time series independent of
any specific trend or cycle, we remove the trend and season-
ality of all three variables using a linear regression and addi-
tive decomposition. The absolute rate of information transfer
from variable Xj to variable Xi is computed assuming lin-
earity following Liang (2021) as follows:
                d
            1 X                 Cij
Tj →i =       ·    1j k Ck,di ·     ,                       (1)
          detC k=1              Cii

where C is the covariance matrix, d is the number of vari-         Figure 1. Pearson correlation coefficient (a) between sea surface
ables, 1j k are the cofactors of C, Ck,di is the sample covari-    temperature (SST) and turbulent heat flux (THF) and (b) between
ance between Xk and the Euler forward difference approxi-          SST tendency (SSTt) and THF, based on J-OFURO3 satellite obser-
mation of dXi /dt (dt is the time step and equals 1 month in       vations. Black contours are drawn around regions with a statistically
                                                                   significant correlation coefficient (FDR 5 %; Student’s t test).
our study), Cij is the sample covariance between Xi and Xj ,
and Cii is the sample variance of Xi .
   To assess the relative importance of the different cause–
                                                                   rate (FDR) from Wilks (2016) with a significance level of
effect relationships, we compute the relative rate of informa-
                                                                   5 % to account for the multiplicity of tests.
tion transfer from variable Xj to variable Xi following Liang
(2021) as follows:
          Tj →i                                                    3   Results and discussion
τj →i =         ,                                           (2)
           Zi                                                      Bishop et al. (2017) identified a strong positive zero-lag co-
where Zi is the normalizer, computed as follows:                   variance between SST and THF at a monthly timescale (over
                                                                   1985–2013) in western boundary currents, the Agulhas Re-
       d
       X                 dHinoise                                  turn Current and eastern tropical Pacific using the OAFlux
Zi =         |Tk→i | +            ,                         (3)
                           dt                                      dataset (1◦ resolution) for THF and the NOAA OISST
       k=1
                                                                   dataset (0.25◦ resolution) for SST (see their Fig. 3b). They
where the first term on the right-hand side represents the in-     also found a strong negative zero-lag covariance between
formation flowing from all the Xk to Xi (including the in-         SST tendency and THF over many regions of the globe, with
fluence of Xi on itself), and the last term is the effect of       the largest values at mid-latitudes (see their Fig. 3e). Using
noise and unobserved processes, computed following Liang           the J-OFURO3 dataset (0.25◦ resolution), we find similar re-
(2021).                                                            sults in terms of zero-lag covariance (Fig. B1). Additionally,
   When τj →i is statistically different from 0 (either positive   when mapping the Pearson correlation coefficient instead of
or negative), Xj has an influence on Xi , while if τj →i = 0,      the covariance, we find a strong positive correlation between
there is no influence. A value of |τ | = 100 % indicates that      SST and THF in many regions of the world, with the largest
Xj has the maximum influence on Xi . A positive (negative)         values in the eastern tropical Pacific and Atlantic regions and
value of τj →i means that the variability in Xj makes the          in western boundary currents (Fig. 1a). A strong negative cor-
variability in Xi more uncertain (certain; Liang, 2014); i.e.,     relation between SST tendency and THF is also identified in
it increases (decreases) the variability in Xi (Appendix A;        most parts of the world, with the exception of a relatively
Fig. A1). The statistical significance of τj →i is computed via    narrow band along the Equator and in western boundary cur-
bootstrap resampling with the replacement of all the terms in-     rents (Fig. 1b).
cluded in Eqs. (1)–(3) using 500 realizations. These bootstrap        Bishop et al. (2017) and Bellucci et al. (2021) showed
realizations are combined together using the false discovery       that regions of high SST gradient and THF (such as the


https://doi.org/10.5194/esd-14-577-2023                                                 Earth Syst. Dynam., 14, 577–591, 2023
580                    D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions

Gulf Stream) are characterized by an ocean-driven regime. In
these regions, the SST–THF zero-lag covariance is positive,
suggesting that ocean processes drive SST anomalies, and the
SST-tendency–THF lead–lag covariance is anti-symmetric
(positive covariance at lag −1 and negative covariance at lag
+1). On the contrary, an anti-symmetric SST–THF lead–lag
covariance and a negative SST-tendency–THF zero-lag co-
variance are typical of an atmosphere-driven regime (such as
in the North Atlantic subtropical gyre). In the latter case, the
release of heat flux from the ocean to the atmosphere acts to
cool the upper ocean. While this approach is interesting in
terms of identifying whether the SST variability is driven by
ocean or atmosphere processes, it does not precisely indicate
whether the SST causally influences THF or the other way
round. In our study, we quantify the causal relationships be-
tween SST and/or SST tendency and THF using the rate of
information transfer from Liang (2021).

3.1   The two-dimensional (2D) case

If we only take into account SST and THF (i.e., two-
dimensional system, hereafter referred to as 2D) in the com-       Figure 2. Relative rate of information transfer τ (a) from sea sur-
putation of the rate of information transfer, we find that many    face temperature (SST) to turbulent heat flux (THF) and (b) from
regions are characterized by relatively strong two-way in-         THF to SST, based on J-OFURO3 satellite observations, when two
fluences between SST and THF (Fig. 2). The spatial distri-         variables are considered. Black contours are drawn around regions
                                                                   with a statistically significant transfer of information (FDR 5 %; 500
bution of the rate of information transfer is relatively sim-
                                                                   bootstrap samples).
ilar to the one of the correlation coefficient between SST
and THF (Fig. 1a), with the largest values (either positive
or negative) in the eastern tropical Pacific and Atlantic re-
gions, western boundary currents and many parts of the             where the variability in SST tendency increases (decreases)
Southern Hemisphere. Interestingly, the rate of information        the variability in THF, the variability in THF decreases (in-
transfer is mainly positive for the influence of SST on THF        creases) the variability in SST tendency.
(Fig. 2a), while negative values dominate for the reverse in-         In summary, the 2D analysis shows additional information
fluence (Fig. 2b). This suggests that SST variability generally    compared to previous lead–lag correlation studies (Bishop
increases THF variability, while THF variability mainly con-       et al., 2017; Bellucci et al., 2021). In particular, we find that
strains SST variability. Also, the regions where the influence     the ocean surface influences the lower atmosphere not only
of SST on THF is strongest are also characterized by a strong      in strong boundary currents but also in many other regions of
influence of THF on SST (in absolute values).                      the world (Figs. 2a and 3a). In turn, the lower atmosphere
   Regarding the SST-tendency–THF relationship, using only         (via surface heat fluxes) influences the ocean surface not
these two variables in the computation of the rate of infor-       only at mid-latitudes but also in tropical regions and western
mation transfer also provides relatively strong two-way in-        boundary currents (Figs. 2b and 3b). Our results are in line
fluences (either positive or negative) in many regions of the      with Bach et al. (2019), who also find significant two-way
world (Fig. 3). The spatial distribution is more contrasted        influences between the upper ocean and lower atmosphere in
than with the SST–THF relationship, as both positive and           many regions of the world using the Granger causality but
negative values are now present in both directions, especially     with some methodological differences (daily timescale and
for the influence of SST tendency on THF (Fig. 3a). The in-        other atmospheric fields). This shows that the lead–lag co-
formation transfer from SST tendency to THF is character-          variance analysis, while interesting in terms of identifying a
ized by positive southwest–northeast bands in the North At-        particular ocean-driven or atmospheric-led regime, is not suf-
lantic and North Pacific, positive northwest–southeast bands       ficient to accurately quantify causal links between the upper
in the South Atlantic and South Pacific, and negative val-         ocean and lower atmosphere. Importantly, our analysis (like
ues between these regions (Fig. 3a). The information trans-        the ones from Bishop et al., 2017 and Bellucci et al., 2021)
fer from THF to SST tendency shows relatively symmetrical          applies to the monthly timescale, and we will show results
behavior to that from SST tendency to THF, with positive           beyond this specific timescale in Sect. 3.4.
(negative) values where the reverse information transfer is           However, this 2D analysis excludes one of the three key
negative (positive; Fig. 3b). This indicates that, in regions      variables considered in the stochastic energy balance model


Earth Syst. Dynam., 14, 577–591, 2023                                                  https://doi.org/10.5194/esd-14-577-2023
D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions                                         581




Figure 3. Relative rate of information transfer τ (a) from sea            Figure 4. Relative rate of information transfer τ (a) from sea sur-
surface temperature tendency (SSTt) to turbulent heat flux (THF)          face temperature (SST) to turbulent heat flux (THF) and (b) from
and (b) from THF to SSTt, based on J-OFURO3 satellite observa-            THF to SST, based on J-OFURO3 satellite observations, when three
tions, when two variables are considered. Black contours are drawn        variables are considered (SST, SST tendency and THF). Black con-
around regions with a statistically significant transfer of information   tours are drawn around regions with a statistically significant trans-
(FDR 5 %; 500 bootstrap samples).                                         fer of information (FDR 5 %; 500 bootstrap samples).



of Wu et al. (2006), either SST tendency in Fig. 2 or SST                 to that in the 2D case (Fig. 2b). This reduction is due to the
in Fig. 3. Thus, it may provide a false impression of a two-              fact that we now take SST tendency into account in the com-
way influence emerging due to the absence of a hidden vari-               putation of the rate of information transfer; part of the infor-
able. Also, the symmetry between the two directions for both              mation transfer from THF also goes into SST tendency, as
the SST–THF (Fig. 2) and SST-tendency–THF (Fig. 3) rela-                  we will see below. Despite this reduction in the number of
tionships is questionable due to inaccurate results that were             regions with a significant transfer of information, the eastern
found using a theoretical example (see Sect. 3.5 for further              tropical Pacific and Atlantic regions still show a strong neg-
discussion of this aspect). That is why we repeated the com-              ative rate of information transfer, suggesting that THF vari-
putation of the rate of information transfer including all three          ability constrains SST variability in these regions (Fig. 4b).
variables in the next section (Sect. 3.2).                                Interestingly, some regions (such as the Agulhas Return Cur-
                                                                          rent) show a positive rate of information transfer from THF
                                                                          to SST in the 3D case (Fig. 4b), while it is negative or close
3.2   The three-dimensional (3D) case                                     to 0 in the 2D case (Fig. 2b).
                                                                             In the 3D case, the rate of information transfer from SST
We computed the rate of information transfer based on the                 tendency to THF (Fig. 5a) is very similar to that in the 2D
three variables analyzed in Bishop et al. (2017) and Bellucci             case (Fig. 3a) for the same reason as for the SST–THF in-
et al. (2021), namely SST, SST tendency and THF (hereafter                fluence. However, a much-reduced number of regions shows
referred to as 3D). The 3D case provides additional sources               a significant transfer of information from THF to SST ten-
of information compared to the 2D case and should thus be                 dency (Fig. 5b) compared to that in the 2D case (Fig. 3b).
preferred in terms of result interpretation.                              Similarly as for the influence of THF on SST, this is due to
   In the 3D case, the influence of SST on THF (Fig. 4a) is               the inclusion of a third variable; specifically, part of the in-
very similar to that in the 2D case (Fig. 2a). This is logi-              formation transfer from THF also goes into SST. Neverthe-
cal, since SST has no significant influence on SST tendency               less, we still find regions of significant influence, e.g., nega-
(Fig. B2), so all the information from SST goes to THF,                   tive values in the North Atlantic and northeastern Pacific and
demonstrating the robustness of the approach. However, a                  positive values in tropical regions.
much-reduced number of regions shows a significant rate of
information transfer from THF to SST (Fig. 4b) compared


https://doi.org/10.5194/esd-14-577-2023                                                        Earth Syst. Dynam., 14, 577–591, 2023
582                      D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions

                                                                       The use of the SeaFlux observational dataset provides results
                                                                       that are in broad agreement with J-OFURO3 (Figs. B3–B4),
                                                                       which confirms the robustness of our findings.
                                                                          The extension to additional variables can of course be per-
                                                                       formed to refine the analysis further, making sure that the
                                                                       additional variables are not nearly parallel (otherwise, the
                                                                       singularity of the covariance matrix could numerically dete-
                                                                       riorate the results). We can do this by including other fields,
                                                                       higher-order tendencies or lagged fields. A first step toward
                                                                       an analysis of such a type is provided below. In our study,
                                                                       we prefer to keep the three fields used in the stochastic en-
                                                                       ergy balance model from Wu et al. (2006) and analyzed by
                                                                       Bishop et al. (2017) and Bellucci et al. (2021), i.e., SST, SST
                                                                       tendency and THF. We will therefore focus on the use of a
                                                                       lagged field (Sect. 3.3), as well as on the analysis of interan-
                                                                       nual to decadal variability (Sect. 3.4).

                                                                       3.3   Lagged transfer of information

                                                                       Due to the inertia of the ocean mixed layer, the SST does not
                                                                       necessarily respond directly to changes in THF (Deser et al.,
Figure 5. Relative rate of information transfer τ (a) from sea sur-    2003; Shi et al., 2022). To take this effect into account, we
face temperature tendency (SSTt) to turbulent heat flux (THF) and      added a fourth variable to our analysis, namely THF lead-
(b) from THF to SSTt, based on J-OFURO3 satellite observations,        ing SST by 1 month, hereafter referred to as THF(-1). Thus,
when three variables are considered (SST, SST tendency and THF).       the following four variables are considered here: SST, SST
Black contours are drawn around regions with a statistically signif-
                                                                       tendency, THF and THF(-1). The rate of information transfer
icant transfer of information (FDR 5 %; 500 bootstrap samples).
                                                                       has been applied to lagged variables in a previous study to
                                                                       predict El Niño Modoki based on solar activity (Liang et al.,
                                                                       2021). Note that the rate of information is not entirely free
   Thus, computing the rate of information transfer based on           of time lag, as it involves a tendency term (dXi /dt in Eq. 1),
the three variables of interest (SST, SST tendency and THF)            which is estimated in a discrete way.
somehow partitions the total influence of the lower atmo-                 We find that there is a significant positive rate of infor-
sphere (THF) into a contribution to SST (Fig. 4b) and an-              mation transfer from THF(-1) to SST in eastern tropical Pa-
other contribution to SST tendency (Fig. 5b). Additionally,            cific and Atlantic regions, western boundary currents (Gulf
the total number of regions with a significant influence by            Stream and Kuroshio Extension) and the Agulhas Return
THF on SST and by THF on SST tendency (both combined)                  Current, as well as negative values in other parts of the world
clearly decreases compared to the 2D case. As the influences           (Fig. 6a). Thus, the lagged analysis shows that THF taken
of SST on THF and of SST tendency on THF remain strong                 1 month before strongly controls SST variability, especially
in the 3D case (almost unchanged compared to the 2D case),             in northern extra-tropical regions where this influence is al-
this is in favor of a stronger ocean influence compared to             most absent in the original 3D case (Fig. 4b). There is also
the atmosphere influence at monthly timescale, especially in           additional information provided by this fourth variable in
extra-tropical regions.                                                the transfer of information from THF(-1) to SST tendency
   In western boundary currents, we find large values of the           (Fig. 6b), but this is mostly restricted to the eastern tropical
rate of information transfer from SST to THF (Fig. 4a), sug-           Pacific and Atlantic (negative values). The influence of SST
gesting a strong ocean influence, in agreement with Bishop             and/or SST tendency on THF(-1) is found to be very close
et al. (2017). However, in extra-tropical regions far away             to 0 and to be not significant almost everywhere (Fig. B5),
from western boundary currents, such as in the central North           which confirms the robustness of the method, as causality
Atlantic, we also find a strong transfer of information from           cannot go back in time.
SST (Fig. 4a) and from SST tendency (Fig. 5a) to THF,                     Interestingly, most regions showing a positive rate of in-
which is generally stronger than the reverse influence (from           formation transfer from THF(-1) to SST (Fig. 6a) also have
THF to SST and to SST tendency). This somewhat brings                  a positive lead–lag covariance between THF(-1) and SST
into question previous findings that suggest an atmospheric-           (Fig. 3c of Bishop et al., 2017). Bishop et al. (2017) show
driven SST variability in these regions (Bishop et al., 2017;          that these regions have a symmetric lead–lag structure be-
Bellucci et al., 2021), and this shows that lead–lag covari-           tween SST and THF, which is characteristic of an ocean-
ance analyses should be supplemented by causality studies.             driven regime. However, these similarities between the rate


Earth Syst. Dynam., 14, 577–591, 2023                                                     https://doi.org/10.5194/esd-14-577-2023
D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions                                     583




Figure 6. Relative rate of information transfer τ (a) from turbulent   Figure 7. Relative rate of information transfer τ (a) from sea sur-
heat flux at lag −1 (THF(-1) – THF leading SST by 1 month) to sea      face temperature (SST) to turbulent heat flux (THF) and (b) from
surface temperature (SST) and (b) from THF(-1) to SST tendency         THF to SST, based on J-OFURO3 satellite observations, when three
(SSTt), based on J-OFURO3 satellite observations, when four vari-      variables are considered (SST, SST tendency and THF) and using
ables are considered (SST, SST tendency, THF and THF(-1)). Black       a 12-month running mean (interannual variability). Black contours
contours are drawn around regions with a statistically significant     are drawn around regions with a statistically significant transfer of
transfer of information (FDR 5 %; 500 bootstrap samples).              information (FDR 5 %; 500 bootstrap samples).


of information transfer and the lead–lag covariance disappear          (Fig. 7a). We also find regions that have a negative rate of
when we look at the relationships between THF(-1) and SST              information transfer, such as in the western North Atlantic
tendency. According to Bishop et al. (2017), the strongest             Ocean, whereas such regions are not present with monthly
values of lead–lag covariance between THF(-1) and SST ten-             means. The reverse influence of THF on SST provides a more
dency appear in western boundary currents (negative values;            contrasted pattern compared to that in the original 3D case,
Fig. 3f of Bishop et al., 2017), while the rate of information         with a reduced number of regions with negative values along
transfer is significant only in the eastern tropical Pacific and       the Equator but also the additional presence of regions with
Atlantic (negative values; Fig. 6b).                                   positive values (Fig. 7b).
                                                                          At a decadal timescale (120-month running mean), al-
3.4   Interannual to decadal variability                               most the whole globe is covered by significant informa-
                                                                       tion transfer between SST and THF in the two directions
All previous results are based on monthly mean outputs.                (Fig. 8). Also, the magnitude of the rate of information trans-
Thus, our results are valid at a monthly timescale. In or-             fer clearly increases at this timescale compared to at inter-
der to figure out what happens at interannual and decadal              annual and decadal timescales. These results suggest that
timescales, we take the 12- and 120-month (respectively)               ocean-atmosphere interactions become more pronounced at
running-mean SST and THF (moving average with the same                 larger timescales.
number of samples), and we re-compute the rate of informa-
tion transfer in the 3D case (SST, SST tendency and THF).
                                                                       3.5   Limitations of the method
This approach is similar to the one used in Vannitsem and
Liang (2022), who found differences in the rate of infor-              The rate of information transfer used in our study has ma-
mation transfer between climate indices depending on the               jor advantages compared to other causal methods, including
timescale used.                                                        its derivation from the first principles of information entropy
   At the interannual timescale (12-month running mean), the           (Liang, 2016) and its relative simplicity (Eq. 1). However,
influence of SST on THF encompasses approximately the                  several limitations exist, which need to be kept in mind.
same regions as at a monthly timescale but with a general                 The first limitation arises from the linearity assumption
increase in the magnitude of the rate of information transfer          (Liang, 2014). While the method has been tested and vali-


https://doi.org/10.5194/esd-14-577-2023                                                     Earth Syst. Dynam., 14, 577–591, 2023
584                      D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions

                                                                        of regions do not show such a symmetry. This somehow goes
                                                                        in hand with the inaccurate symmetry obtained in computing
                                                                        the rate of information transfer in the unidirectionally cou-
                                                                        pled Rössler systems (Paluš et al., 2018) when using only
                                                                        two variables (Paluš, 2022; Fig. C1f). Thus, the results ob-
                                                                        tained in the 2D case in our study must be taken with great
                                                                        care, and 3D results should be privileged. Further research
                                                                        should be carried out to better understand the impact of hid-
                                                                        den variables in computing the rate of information transfer.
                                                                           Finally, the information flow method depends on the sam-
                                                                        pling frequency when applied to unidirectionally coupled
                                                                        Rössler systems and possibly to other systems and real-case
                                                                        studies. In the case of the Rössler systems, the method be-
                                                                        comes inaccurate when the sampling frequency is too coarse
                                                                        (Appendix C; Fig. C1a–e). In our real-case study, it is diffi-
                                                                        cult to accurately quantify this effect due to the shortness of
                                                                        the time period (360 months). Further research is needed to
                                                                        better understand the effect of the sampling frequency on the
                                                                        computation of the rate of information transfer.


Figure 8. Relative rate of information transfer τ (a) from sea sur-     4   Conclusions
face temperature (SST) to turbulent heat flux (THF) and (b) from
THF to SST, based on J-OFURO3 satellite observations, when three        In summary, we find that the rate of information transfer pro-
variables are considered (SST, SST tendency and THF) and using a        vides a more detailed quantification of dependencies between
120-month running mean (decadal variability). Black contours are
                                                                        SST, SST tendency and turbulent heat flux (THF) than pre-
drawn around regions with a statistically significant transfer of in-
formation (FDR 5 %; 500 bootstrap samples).
                                                                        vious classical correlation–covariance studies. We do not ar-
                                                                        gue that causal methods should replace covariance analyses,
                                                                        but they should rather be used as a complement in order to
                                                                        get a better understanding of physical interactions between
dated with highly nonlinear synthetic examples (e.g., Liang,            variables. We show that the ocean surface (SST and SST
2014, 2018, 2021), it provides an approximated solution, and            tendency) strongly drives changes in the lower atmosphere
a generalization to the fully nonlinear case is still to be devel-      (THF) and that the lower atmosphere also has an important
oped to get a more accurate solution (Liang, 2021). However,            influence on the ocean surface in many regions of the world.
recent studies applying the rate of information transfer to cli-        This result is somewhat different from what has been found
mate data show that the method is successful at representing            in covariance analyses, in which ocean-driven regimes ex-
some key causal influences, such as the interactions between            ist in western boundary currents and where atmospheric-led
El Niño and the Indian Ocean Dipole (Liang, 2014), CO2 and              regimes dominate in the open ocean (Bishop et al., 2017; Bel-
global mean temperature (Stips et al., 2016), and Arctic sea            lucci et al., 2021). It is, however, supported by another recent
ice and its drivers (Docquier et al., 2022).                            analysis using the Granger causality, which shows that many
   The second limitation is linked to the problem of hidden             regions of the world present a significant two-way influence
variables. If we omit an important variable in our system, the          between the lower atmosphere and the upper ocean, with a
rates of information transfer might be biased. In our specific          stronger ocean influence in tropical regions and a stronger at-
study, some differences appear between the 2D case and the              mospheric impact in the extra-tropics (Bach et al., 2019). As
3D case (Sect. 3.2). As we do not include one of the key vari-          the latter study presents methodological differences – i.e., it
ables of the stochastic energy balance model designed by Wu             focuses on the daily timescale and uses different atmospheric
et al. (2006) in the 2D case, we end up with a biased result. In        variables – we need to be cautious in comparing it to our
particular, the rate of information transfer from THF to SST            analysis. In any case, our interpretation of these results is
is overestimated in northern and southern extratropical re-             that ocean–atmosphere interactions are more complex than
gions (compare Fig. 2b to Fig. 4b). This overestimation also            presented by classical covariance analyses.
appears in the rate of information transfer from THF to SST                Furthermore, we find that the influence of THF is parti-
tendency (compare Fig. 3b to Fig. 5b). Also, a relatively sym-          tioned between SST and SST tendency if we consider the
metric behavior appears in the 2D case between both causal              three variables together (3D case, which should be privileged
directions for the SST–THF relationship (Fig. 2) and for the            due to the inclusion of additional sources of information) so
SST-tendency–THF relationship (Fig. 3), although a number               that the single impact of either THF on SST or of THF on


Earth Syst. Dynam., 14, 577–591, 2023                                                      https://doi.org/10.5194/esd-14-577-2023
D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions                                   585

SST tendency is decreased in the 3D case compared to that
in the 2D case. Also, the number of regions with a significant
rate of information transfer from THF to SST and from THF
to SST tendency (combined) is smaller than the one with a
significant rate of information transfer from SST to THF and
from SST tendency to THF (combined) in the 3D case. This
suggests an overall stronger upper-ocean influence compared
to the lower atmosphere. However, when adding THF taken
1 month before to take the lagged effect into account, we find
that this variable has a relatively strong influence on SST in
a large portion of the globe. Finally, a larger timescale (go-
ing from monthly to interannual and decadal) provides larger
values in terms of the rates of information transfer between
the three variables.
   In our study, we only considered the ocean surface, but
several studies have shown that variations in the ocean heat       Figure A1. Variance σ 2 of a variable as a function of the relative
content are controlled by both air–sea fluxes and ocean heat       rate of information transfer τ from any other variable to this variable
transport convergence, with a more important role for the lat-     using the linear system of Eq. (A1). The error bars show the 95 %
                                                                   confidence intervals of the rates of information transfer.
ter with a deeper integration of ocean heat and with higher-
resolution climate models (Roberts et al., 2017; Small et al.,
2020). Also, only observations were considered here. Thus,         and 1 (−1, −0.5, 0, 0.5 and 1). When varying one of the six
extending our analysis to the ocean heat budget terms in cli-      coefficients, we set the other five coefficients to a fixed value
mate models would provide further insights into the causal         (a12 = a13 = 0.5 and a21 = a23 = a31 = a32 = 0).
influences between the ocean and atmosphere. This is of               We solve the linear system (A1) using the Euler–
large importance, as ocean–atmosphere interactions consti-         Maruyama method, and 40 different values of the random
tute an important regulator of our climate. Finally, from a        noise are taken in order to take into account the uncertainty
theoretical perspective, additional investigations of the role     related to the rate of information transfer. The variance in
of hidden and lagged variables should be performed, as well        each variable is compared to the rate of information transfer
as a comparison of the rate of information transfer to other       from any other variable to this variable to test our hypothesis.
causal methods.                                                    Results show that when the rate of information transfer from
                                                                   Xj to Xi increases, the variance in Xi increases (Fig. A1).
Appendix A: Impact of the rate of information
transfer on the variability

As explained in the main text (Sect. 2.2), a positive value
of the relative rate of information transfer τj →i means that
the variability in Xj increases the variability in Xi , while
a negative value means that the variability in Xj decreases
the variability in Xi . More broadly, an increase in the rate of
information transfer from Xj to Xi leads to an increase in the
variability of Xi . We demonstrate this by computing the rate
of information transfer τj →i from variable Xj to variable Xi
(based on Eq. 3 in the main text) using a three-dimensional
stochastic linear system of equations as follows:
dX1    =(a11 X1 + a12 X2 + a13 X3 ) dt + 0.1 dW1 ,
dX2    =(a21 X1 + a22 X2 + a23 X3 ) dt + 0.1 dW2 ,
dX3    =(a31 X1 + a32 X2 + a33 X3 ) dt + 0.1 dW3 ,         (A1)
where X1 , X2 and X3 are the three variables; akl are the dif-
ferent coefficients; t is time and varies between 0 and 100
with 100 000 time steps (1t = 0.001); and W1 , W2 and W3
represent normal random noises (standard Wiener process).
We set a11 = a22 = a33 = −1, and we vary the six other co-
efficients one by one with five different values between −1


https://doi.org/10.5194/esd-14-577-2023                                                  Earth Syst. Dynam., 14, 577–591, 2023
586                     D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions

Appendix B: Additional figures




Figure B1. Covariance (a) between sea surface temperature (SST) and turbulent heat flux (THF) and (b) between SST tendency (SSTt) and
THF, based on J-OFURO3 satellite observations.




Figure B2. Relative rate of information transfer τ (a) from sea surface temperature (SST) to SST tendency and (b) from SST tendency to
SST, based on J-OFURO3 satellite observations, when three variables are considered (SST, SST tendency and THF). None of the grid points
shows a statistically significant transfer of information (FDR 5 %; 500 bootstrap samples).




Earth Syst. Dynam., 14, 577–591, 2023                                                    https://doi.org/10.5194/esd-14-577-2023
D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions                                      587




Figure B3. Relative rate of information transfer τ (a) from sea surface temperature (SST) to turbulent heat flux (THF) and (b) from THF to
SST, based on SeaFlux satellite observations, when three variables are considered (SST, SST tendency and THF). Black contours are drawn
around regions with a statistically significant transfer of information (FDR 5 %; 500 bootstrap samples).




Figure B4. Relative rate of information transfer τ (a) from sea surface temperature tendency (SSTt) to turbulent heat flux (THF) and (b) from
THF to SSTt, based on SeaFlux satellite observations, when three variables are considered (SST, SST tendency and THF). Black contours
are drawn around regions with a statistically significant transfer of information (FDR 5 %; 500 bootstrap samples).




https://doi.org/10.5194/esd-14-577-2023                                                       Earth Syst. Dynam., 14, 577–591, 2023
588                     D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions




Figure B5. Relative rate of information transfer τ (a) from sea surface temperature (SST) to turbulent heat flux 1 month before (THF(-1))
and (b) from SST tendency to THF(-1), based on J-OFURO3 satellite observations, when four variables are considered (SST, SST tendency,
THF and THF(-1)). Black contours are drawn around regions with a statistically significant transfer of information (FDR 5 %; 500 bootstrap
samples).


Appendix C: Dependence on the sampling frequency                          As illustrated in Fig. C1, results depend on the num-
                                                                       ber of samples per pseudo-period. When using 20 sam-
In order to test the dependence of the information flow                ples per pseudo-period, Ty1→x1 > Tx1→y1 when the coupling
method on the sampling frequency, we compute the absolute              strength  ≥ 0.2, which is physically not correct (Fig. C1a).
rate of information transfer (Eq. 1) on the two unidirection-          For 60 samples per pseudo-period, both influences are com-
ally coupled Rössler systems using the same parameters as              parable for larger coupling strengths (Fig. C1b). From 80
Paluš and Vejmelka (2007) and Paluš et al. (2018) as follows:          samples per pseudo-period, Tx1→y1 > Ty1→x1 (Fig. C1c–e),
                                                                       which is physically correct, and one needs to reach ∼ 6000
                                                                       samples per pseudo-period to have Ty1→x1 = 0 (Fig. C1e).
dx1 /dt = −ω1 x2 − x3 ,                                                Importantly, all six variables need to be considered in the
dx2 /dt = ω1 x1 + a1 x2 ,                                              computation of the rate of information transfer (multivariate
                                                                       formula; Liang, 2021) to reach this result. If we only consider
dx3 /dt = b1 + x3 (x1 − c1 ),                                          X1 and Y1 and compute the rate of information transfer using
dy1 /dt = −ω2 y2 − y3 +  (x1 − y1 ),                                  the bivariate formula (Liang, 2014), we obtain an inaccurate
dy2 /dt = ω2 y1 + a2 y2 ,                                              result with a symmetry between the two directions whatever
dy3 /dt = b2 + y3 (y1 − c2 ),                                (C1)      the number of samples per pseudo-period (Fig. C1f).


where ω1 = 1.015, ω2 = 0.985, a1 = a2 = 0.15, b1 = b2 =
0.2 and c1 = c2 = 10. We use the same time step for inte-
gration as Paluš et al. (2018); i.e., dt = 0.0785. We use the
same initialization method as Paluš et al. (2018), solve the
equations using the fourth-order Runge–Kutta scheme, and
run the model for 7.5 × 106 time steps. We discard the first
1.5 × 106 time steps from the analysis. We use a coupling
strength  that varies between 0 and 0.25 with an increment
of 0.025. We test different numbers of samples per pseudo-
period and retain here the five of them (20, 60, 80, 200 and
6000) that best illustrate our results.


Earth Syst. Dynam., 14, 577–591, 2023                                                      https://doi.org/10.5194/esd-14-577-2023
D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions                                       589




Figure C1. Absolute rate of information transfer T (multivariate formula) as a function of the coupling strength  applied to unidirectionally
coupled Rössler systems with (a) 20, (b) 60, (c) 80, (d) 200 and (e) 6000 samples per pseudo-period; (f) is similar to (e), except that the
bivariate formula is used instead. The sign of T is kept in all panels.


Code and data availability. J-OFURO3                     observa-        Acknowledgements. We would like to thank Milan Paluš and
tional data (Tomita et al., 2019) are available on                       an anonymous reviewer for providing insightful comments, which
https://doi.org/10.20783/DIAS.612 (Tomita, 2020). SeaFlux                helped to improve our paper. We also thank the Editor Rui A. P.
observational data (Roberts et al., 2020) are accessible from            Perdigão for his encouragements in preparing an improved version
NASA        (https://doi.org/10.5067/SEAFLUX/DATA101).       The         of the paper. We thank X. San Liang for the useful discussions re-
Python scripts to compute the rate of information transfer and           lated to the rate of information transfer. We thank Claude Frankig-
to produce the figures of this article are available on Zenodo:          noul for the very helpful feedback provided following one of our
https://doi.org/10.5281/zenodo.7547073 (Docquier, 2023).                 presentations. David Docquier, Stéphane Vannitsem and Alessio
                                                                         Bellucci are supported by ROADMAP (Role of ocean dynam-
                                                                         ics and Ocean–Atmosphere interactions in Driving cliMAte vari-
Author contributions. DD wrote the paper with contributions              ations and future Projections of impact-relevant extreme events;
from all the co-authors. DD, SV and AB designed the science plan.        https://jpi-climate.eu/project/roadmap/, last access: 5 May 2023), a
DD analyzed the satellite data, ran the Rössler systems and pro-         coordinated JPI-Climate/JPI-Oceans project.
duced the figures. All the authors participated in the interpretation
of the results and provided useful comments to help improve the
analysis.                                                                Financial support. David Docquier and Stéphane Vannitsem
                                                                         have received funding from the Belgian Federal Science Policy
                                                                         Office (contract B2/20E/P1/ROADMAP) and Alessio Bellucci has
Competing interests. The contact author has declared that none           been supported by MUR – Italian Ministry of University and Re-
of the authors has any competing interests.                              search (D.M. 593/2016).



Disclaimer. Publisher’s note: Copernicus Publications remains            Review statement. This paper was edited by Rui A. P. Perdigão
neutral with regard to jurisdictional claims in published maps and       and reviewed by Milan Palus and one anonymous referee.
institutional affiliations.



https://doi.org/10.5194/esd-14-577-2023                                                       Earth Syst. Dynam., 14, 577–591, 2023
590                       D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions

References                                                                Kirtman, B. P., Bitz, C., Bryan, F., Collins, W., Dennis, J., Hearn,
                                                                            N., Kinter, J. L., Loft, R., Rousset, C., Siqueira, L., Stan, C.,
                                                                            Tomas, R., and Vertenstein, M.: Impact of ocean model resolu-
Bach, E., Motesharrei, S., Kalnay, E., and Ruiz-Barradas,                   tion on CCSM climate simulations, Clim. Dynam., 39, 1303–
   A.: Local atmosphere-ocean predictability: Dynamical ori-                1328, https://doi.org/10.1007/s00382-012-1500-3, 2012.
   gins, lead times, and seasonality, J. Clim., 32, 7507–7519,            Krakovská, A., Jakubík, J., Chvosteková, M., Coufal, D., Jajcay,
   https://doi.org/10.1175/JCLI-D-18-0817.1, 2019.                          N., and Paluš, M.: Comparison of six methods for the detection
Bellucci, A., Athanasiadis, P. J., Scoccimarro, E., Ruggieri, P.,           of causality in a bivariate time series, Phys. Rev. E, 97, 042207,
   Gualdi, S., Fedele, G., Haarsma, R. J., Garcia-Serrano, J.,              https://doi.org/10.1103/PhysRevE.97.042207, 2018.
   Castrillo, M., Putrahasan, D., Sanchez-Gomez, E., Moine, M.,           Liang, X. S.: Unraveling the cause-effect relation be-
   Roberts, C. D., Roberts, M. J., Seddon, J., and Vidale, P. L.:           tween time series, Physical Review E, 90, 052150,
   Air-Sea interaction over the Gulf Stream in an ensemble of High-         https://doi.org/10.1103/PhysRevE.90.052150, 2014.
   ResMIP present climate simulations, Clim. Dynam., 56, 2093–            Liang, X. S.: Information flow and causality as rigor-
   2111, https://doi.org/10.1007/s00382-020-05573-z, 2021.                  ous notions ab initio, Physical Review E, 94, 052201,
Bishop, S. P., Small, R. J., Bryan, F. O., and Tomas, R. A.: Scale          https://doi.org/10.1103/PhysRevE.94.052201, 2016.
   dependence of midlatitude air-sea interaction, J. Clim., 30, 8207–     Liang, X. S.: Causation and information flow with respect to rela-
   8221, https://doi.org/10.1175/JCLI-D-17-0159.1, 2017.                    tive entropy, Chaos, 28, 1–8, https://doi.org/10.1063/1.5010253,
Brachet, S., Codron, F., Feliks, Y., Ghil, M., Le Treut, H., and            2018.
   Simonnet, E.: Atmospheric circulations induced by a midlat-            Liang, X. S.: Normalized multivariate time series causality
   itude SST front: A GCM study, J. Clim., 25, 1847–1853,                   analysis and causal graph reconstruction, Entropy, 23, 679,
   https://doi.org/10.1175/JCLI-D-11-00329.1, 2012.                         https://doi.org/10.3390/e23060679, 2021.
Chelton, D. B., Schlax, M. G., Freilich, M. H., and Mil-                  Liang, X. S. and Kleeman, R.: Information transfer between dy-
   liff, R. F.: Satellite measurements reveal persistent small-             namical system components, Phys. Rev. Lett., 95, 244101,
   scale features in ocean winds, Science, 303, 978–983,                    https://doi.org/10.1103/PhysRevLett.95.244101, 2005.
   https://doi.org/10.1126/science.1091901, 2004.                         Liang, X. S., Xu, F., Rong, Y., Zhang, R., Tang, X., and
Deser, C., Alexander, M. A., and Timlin, M. S.: Understand-                 Zhang, F.: El Niño Modoki can be mostly predicted more
   ing the persistence of sea surface temperature anomalies in              than 10 years ahead of time, Scientific Reports, 11, 17860,
   midlatitudes, J. Clim., 16, 57–72, https://doi.org/10.1175/1520-         https://doi.org/10.1038/s41598-021-97111-y, 2021.
   0442(2003)016<0057:UTPOSS>2.0.CO;2, 2003.                              Paluš, M.: RC2: ’Comment on egusphere-2022-942’, EGUsphere,
Docquier,      D.:     Liang      Index     to    quantify      ocean-      https://doi.org/10.5194/egusphere-2022-942-RC2, 2022.
   atmosphere        interactions      (v2),     Zenodo         [code],   Paluš, M. and Vejmelka, M.: Directionality of coupling
   https://doi.org/10.5281/zenodo.7547073, 2023.                            from bivariate time series: How to avoid false causali-
Docquier, D., Vannitsem, S., Ragone, F., Wyser, K., and Liang,              ties and missed connections, Phys. Rev. E, 75, 075307,
   X. S.: Causal links between Arctic sea ice and its potential drivers     https://doi.org/10.1063/1.5019944, 2007.
   based on the rate of information transfer, Geophys. Res. Lett., 49,    Paluš, M., Krakovská, A., Jakubík, J., and Chvosteková, M.:
   e2021GL095892, https://doi.org/10.1029/2021GL095892, 2022.               Causality, dynamical systems and the arrow of time, Chaos, 28,
Frankignoul, C. and Hasselmann, K.: Stochastic climate                      056211, https://doi.org/10.1103/PhysRevE.75.056211, 2018.
   models, Part II. Application to sea-surface temperature                Reynolds, R. W., Smith, T. M., Liu, C., Chelton, D. B., Casey,
   anomalies and thermocline variability, Tellus, 29, 289–305,              K. S., and Schlax, M. G.: Daily High-Resolution-Blended Anal-
   https://doi.org/10.3402/tellusa.v29i4.11362, 1977.                       yses for Sea Surface Temperature, J. Clim., 20, 5473–5496,
Granger, C. W.: Investigating causal relations by econometric mod-          https://doi.org/10.1175/2007JCLI1824.1, 2007.
   els and cross-spectral methods, Econometrica, 37, 424–438,             Roberts, C. D., Palmer, M. D., Allan, R. P., Desbruyeres, D. G.,
   https://doi.org/10.2307/1912791, 1969.                                   Hyder, P., Liu, C., and Smith, D.: Surface flux and ocean heat
Hagan, D. F. T., Wang, G., Liang, X. S., and Dolman, H.                     transport convergence contributions to seasonal and interannual
   A. J.: A time-varying causality formalism based on the Liang–            variations of ocean heat content, J. Geophys. Res.-Oceans, 122,
   Kleeman information flow for analyzing directed interactions             726–744, https://doi.org/10.1002/2016JC012278, 2017.
   in nonstationary climate systems, J. Clim., 32, 7521–7537,             Roberts, J. B., Clayson, C. A., and Robertson, F. R.: SeaFlux
   https://doi.org/10.1175/JCLI-D-18-0881.1, 2019.                          Data Products V1, NASA Global Hydrometeorology Re-
Hagan, D. F. T., Dolman, H. A. J., Wang, G., Sian, K. T. C. L. K.,          source Center DAAC, Huntsville, Alabama, USA [data set]
   and Yang, K.: Contrasting ecosystem constraints on seasonal ter-         https://doi.org/10.5067/SEAFLUX/DATA101, 2020.
   restrial CO2 and mean surface air temperature causality projec-        Runge, J., Bathiany, S., Bollt, E., Camps-Valls, G., Coumou, D.,
   tions by the end of the 21st century, Environ. Res. Lett., 17,           Deyle, E., Glymour, C., Kretschmer, M., Mahecha, M. D.,
   124019, https://doi.org/10.1088/1748-9326/aca551, 2022.                  Munoz-Mari, J., van Nes, E. H., Peters, J., Quax, R., Reich-
Hasselmann, K.: Stochastic climate models Part I. The-                      stein, M., Scheffer, M., Scholkopf, B., Spirtes, P., Sugihara, G.,
   ory, Tellus, 28, 473–485, https://doi.org/10.1111/j.2153-                Sun, J., Zhang, K., and Zscheischler, J.: Inferring causation from
   3490.1976.tb00696.x, 1976.                                               time series in Earth system sciences, Nat. Commun., 10, 2553,
Jiang, S., Hu, H., Lei, L., and Bai, H.: Multi-source forcing effects       https://doi.org/10.1038/s41467-019-10105-3, 2019.
   analysis using Liang–Kleeman information flow method and the           Shi, H., Jin, F.-F., Jacox, M. G., Amaya, D. J., Black, B. A.,
   community atmosphere model (CAM4.0), Clim. Dynam., 53,                   Rykaczewski, R. R., Bograd, S. J., Garcia-Reyes, M., and Syde-
   6035–6053, https://doi.org/10.1007/s00382-019-04914-x, 2019.


Earth Syst. Dynam., 14, 577–591, 2023                                                         https://doi.org/10.5194/esd-14-577-2023
D. Docquier et al.: The rate of information transfer as a measure of ocean–atmosphere interactions                                   591

   man, W. J.: Global decline in ocean memory over the 21st cen-       Vannitsem, S. and Liang, X. S.: Dynamical dependencies at
   tury, Sci. Adv., 8, https://doi.org/10.1126/sciadv.abm3468, 2022.     monthly and interannual time scales in the climate system: Study
Small, R. J., Bryan, F. O., Bishop, S. P., Larson, S., and Tomas,        of the North Pacific and Atlantic regions, Tellus A, 74, 141–158,
   R. A.: What drives upper-ocean temperature variability in cou-        https://doi.org/10.16993/tellusa.44, 2022.
   pled climate models and observations, J. Clim., 33, 577–596,        Vannitsem, S., Dalaiden, Q., and Goosse, H.: Testing for dy-
   https://doi.org/10.1175/JCLI-D-19-0295.1, 2020.                       namical dependence: Application to the surface mass bal-
Stips, A., Macias, D., Coughlan, C., Garcia-Gorriz, E.,                  ance over Antarctica, Geophys. Res. Lett., 46, 12125–12135,
   and Liang, X. S.: On the causal structure between CO2                 https://doi.org/10.1029/2019GL084329, 2019.
   and global temperature, Scientific Reports, 6, 21691,               Wilks, D. S.: ‘The stippling shows statistically significant grid
   https://doi.org/10.1038/srep21691, 2016.                              points’: How research results are routinely overstated and over-
Sugihara, G., May, R., Ye, H., Hsieh, C.-H., Deyle, E., Fogarty, M.,     interpreted, and what to do about it, B. Am. Meteorol. Soc.,
   and Munch, S.: Detecting causality in complex ecosystems, Sci-        97, 2263–2273, https://doi.org/10.1175/BAMS-D-15-00267.1,
   ence, 338, 496–500, https://doi.org/10.1126/science.1227079,          2016.
   2012.                                                               Wu, R., Kirtman, B. P., and Pegion, K.: Local air-sea relationship
Tomita, H.: J-OFURO3, Data Integration and Analysis System               in observations and model simulations, J. Clim., 19, 4914–4932,
   (DIAS) [data set], https://doi.org/10.20783/DIAS.612, 2020.           https://doi.org/10.1175/JCLI3904.1, 2006.
Tomita, H., Hihara, T., Kako, S., Kubota, M., and Kutsuwada,
   K.: An introduction to J-OFURO3, a third-generation Japanese
   ocean flux data set using remote-sensing observations, J.
   Oceanogr., 75, 171–194, https://doi.org/10.1007/s10872-018-
   0493-x, 2019.




https://doi.org/10.5194/esd-14-577-2023                                                    Earth Syst. Dynam., 14, 577–591, 2023
