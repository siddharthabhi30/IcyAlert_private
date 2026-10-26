# Full-text extraction

- Title: A Comparison of Two Causal Methods in the Context of Climate Analyses
- Year: 2024
- DOI: https://doi.org/10.5194/npg-31-115-2024
- PDF source: https://npg.copernicus.org/articles/31/115/2024/npg-31-115-2024.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                                                                                                                  Research article
Nonlin. Processes Geophys., 31, 115–136, 2024
https://doi.org/10.5194/npg-31-115-2024
© Author(s) 2024. This work is distributed under
the Creative Commons Attribution 4.0 License.




            A comparison of two causal methods in the context
                          of climate analyses
         David Docquier1 , Giorgia Di Capua2,3 , Reik V. Donner2,3 , Carlos A. L. Pires4 , Amélie Simon4,5 , and
                                                 Stéphane Vannitsem1
            1 Meteorological and Climatological Information Service, Royal Meteorological Institute of Belgium,

                                                      Brussels, Belgium
          2 Department of Water, Environment, Construction and Safety, Magdeburg-Stendal University of Applied

                                               Sciences, Magdeburg, Germany
       3 Research Department I – Earth System Analysis, Potsdam Institute for Climate Impact Research – Member of

                                         the Leibniz Association, Potsdam, Germany
                   4 Instituto Dom Luiz, Faculdade de Ciências, Universidade de Lisboa, Lisbon, Portugal
                   5 Department of Mathematical and Electrical Engineering, IMT Atlantique, Lab-STICC,

                                               UMR CNRS 6285, Brest, France
                              Correspondence: David Docquier (david.docquier@meteo.be)

                                Received: 27 September 2023 – Discussion started: 5 October 2023
                       Revised: 12 January 2024 – Accepted: 17 January 2024 – Published: 27 February 2024

       Abstract. Correlation does not necessarily imply causation, and this is why causal methods have been devel-
       oped to try to disentangle true causal links from spurious relationships. In our study, we use two causal methods,
       namely, the Liang–Kleeman information flow (LKIF) and the Peter and Clark momentary conditional indepen-
       dence (PCMCI) algorithm, and we apply them to four different artificial models of increasing complexity and one
       real-world case study based on climate indices in the Atlantic and Pacific regions. We show that both methods
       are superior to the classical correlation analysis, especially in removing spurious links. LKIF and PCMCI dis-
       play some strengths and weaknesses for the three simplest models, with LKIF performing better with a smaller
       number of variables and with PCMCI being best with a larger number of variables. Detecting causal links from
       the fourth model is more challenging as the system is nonlinear and chaotic. For the real-world case study with
       climate indices, both methods present some similarities and differences at monthly timescale. One of the key
       differences is that LKIF identifies the Arctic Oscillation (AO) as the largest driver, while the El Niño–Southern
       Oscillation (ENSO) is the main influencing variable for PCMCI. More research is needed to confirm these links,
       in particular including nonlinear causal methods.



1   Introduction                                                  systematic large anticorrelation between Arctic sea-ice area
                                                                  and northward ocean heat transport in climate models at dif-
One of the most commonly used methodologies to identify           ferent resolutions, which confirmed previous observational
potential relationships between variables in climate research     findings showing that the latter is a driver of the former
is correlation, with or without a lag (or time delay). For        (Årthun et al., 2012). Another example is the modeling anal-
example, Bishop et al. (2017) used an approach based on           ysis from Small et al. (2020), who used a regression analy-
lead–lag correlations between sea-surface temperature (SST)       sis to quantify the dynamical and thermodynamical contribu-
and turbulent heat flux to discriminate between atmospheric-      tions to the ocean heat content tendency at the global scale.
driven and ocean-led variability using both a stochastic en-         However, such correlation (or linear regression) ap-
ergy balance model and satellite observations at monthly          proaches, despite being useful for identifying potential re-
timescale. In another study, Docquier et al. (2019) found a


Published by Copernicus Publications on behalf of the European Geosciences Union & the American Geophysical Union.
116                                                                             D. Docquier et al.: Causal method comparison

lationships between variables, do not imply causation. A sig-       ature over British Columbia (Runge et al., 2019b), tropical
nificant correlation simply means that there is a relationship,     and midlatitude drivers of the Indian summer monsoon (Di
or synchronous behavior, between two variables without ex-          Capua et al., 2020a), predictors for seasonal Atlantic hur-
plicitly confirming a causal link between the two. Correla-         ricane activity (Pfleiderer et al., 2020), and interactions be-
tion suffers from five key limitations. First, a significant cor-   tween tropical convection and midlatitude circulation (Di Ca-
relation between variables could appear by chance (that is          pua et al., 2020b).
called “random coincidence”). Second, the correlation does             The Liang–Kleeman information flow (LKIF; Liang and
not allow us to identify the direction of the potential causal      Kleeman, 2005) is based on the rate of information trans-
link, so this approach supposes an a priori knowledge of pro-       fer in dynamical systems and has been rigorously derived
cesses at play. The problem of directional dependence is of-        from the propagation of information entropy between vari-
ten coped with by using lagged correlation or regression,           ables (Liang, 2016). This method has been applied to sev-
but this method is susceptible to overstate causal relation-        eral climate studies, including the El Niño–Indian Ocean
ships when one variable has significant memory (McGraw              Dipole (IOD) link (Liang, 2014), the relationship between
and Barnes, 2018). Third, there could be an external (hid-          carbon dioxide and air temperature (Jiang et al., 2019; Ha-
den) variable (sometimes referred to as a “confounding vari-        gan et al., 2022), dynamical dependencies between a set of
able”) that influences two correlated variables, as demon-          observables and the Antarctic surface mass balance (Vannit-
strated in Sugihara et al. (2012), and a simple correlation         sem et al., 2019), identification of potential drivers of Arctic
analysis would not allow for disentangling these causal links.      sea-ice changes (Docquier et al., 2022), causal links between
Fourth, linear correlation cannot identify possible nonlinear       climate indices in the North Pacific and Atlantic regions and
relationships. Lastly, the correlation is computed for pairs of     local Belgian time series (Vannitsem and Liang, 2022), and
variables and does not consider multivariate frameworks.            ocean–atmosphere interactions (Docquier et al., 2023).
   Hence, causal methods prove to be very useful. Runge                Commonly, each study focuses on only one causal method.
et al. (2019a) provide a detailed review of selected causal         However, contradictory results might appear when using
inference frameworks applied to Earth system sciences.              different causal methods, and it is thus important to com-
Some of these methods are briefly described hereafter.              pare them. Several studies have investigated differences be-
Granger causality has been the first formalization of causal-       tween causal methods. One of the most comprehensive stud-
ity to time series and is based on autoregressive model-            ies in this respect in the recent past is the intercomparison
ing (Granger, 1969). It has been used in a series of cli-           of Krakovská et al. (2018), in which the authors compared
mate studies, including several analyses focusing on air–sea        six causal methods, namely, Granger causality, two extended
interactions (Mosedale et al., 2006; Tirabassi et al., 2015;        versions of Granger causality, CMI, CCM, and predictabil-
Bach et al., 2019). Convergent cross mapping (CCM) at-              ity improvement (Krakovská and Hanzely, 2016). They used
tempts to uncover causal relationships based on Takens’             seven artificial datasets based on coupled systems. A key out-
theorem and nonlinear state-space reconstruction (Sugihara          come of their analysis is that there is no single best causal
et al., 2012). For example, CCM has been used for analyzing         method as results depend on the intrinsic characteristics of
the temperature–CO2 relationship over glacial–interglacial          the used dataset. Krakovská et al. (2018) found that for sim-
timescales (van Nes et al., 2015), the causal dependencies          ple autoregressive models, Granger causality and its exten-
between different ocean basins (Vannitsem and Ekelmans,             sions were the best tools to identify the right causal links,
2018), and the stratosphere–troposphere coupling (Huang             while CCM and predictability improvement failed. On the
et al., 2020). Transfer entropy (Schreiber, 2000) and con-          contrary, for more complex systems, Granger causality and
ditional mutual information (CMI; Paluš et al., 2001; Paluš         its extensions failed, while the remaining methods were more
and Vejmelka, 2007) are also two widely used causal meth-           successful, although they differed considerably in their abil-
ods. Silini et al. (2022) have used a computationally fast al-      ity to detect the presence and direction of coupling. Paluš
ternative of transfer entropy, called pseudo-transfer entropy,      et al. (2018) showed that the Granger causality principle, that
to quantify causal dependencies between 13 climate indices          the cause precedes the effect, was violated in coupled chaotic
representing large-scale climate patterns.                          dynamical systems using CMI, CCM, and predictability im-
   The Peter and Clark momentary conditional independence           provement. Coufal et al. (2017) used CMI and CCM and
(PCMCI) method is a causal discovery method based on the            showed that the detection of coupling delays in coupled non-
Peter and Clark (PC) algorithm (Spirtes et al., 2001), com-         linear dynamical systems was challenging. Manshour et al.
bined with the momentary conditional independence (MCI)             (2021) compared CMI with LKIF and interventional causal-
approach (Runge et al., 2019b). It is based on the system-          ity (Baldovin et al., 2020), and they confirmed a robust influ-
atic exploitation of partial correlations, conditional mutual       ence of solar wind on geomagnetic indices using all causal
information, or any other conditional dependency measure.           methods. An advantage of interventional causality compared
PCMCI has been used, for example, to analyze Arctic drivers         to other causal methods is the detection of indirect causal
of midlatitude winter circulation (Kretschmer et al., 2016),        links (i.e., if x influences y and y drives z, then the indirect
relationships between Niño3.4 and extratropical air temper-         influence from x to z will be recovered).


Nonlin. Processes Geophys., 31, 115–136, 2024                                         https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                      117

   The main goal of this study is to provide a detailed com-       in Liang, 2021):
parison between two independent causal methods, namely,
                                                                   x1,t+1 = 0.1 − 0.6 x3,t + u1,t+1 ,
LKIF and PCMCI, which have been widely used in the
context of the JPI-Climate/JPI-Oceans ROADMAP project              x2,t+1 = 0.7 − 0.5 x1,t + 0.8 x6,t + u2,t+1 ,
(Role of ocean dynamics and Ocean-Atmosphere inter-                x3,t+1 = 0.5 + 0.7 x2,t + u3,t+1 ,
actions in Driving cliMAte variations and future Projec-           x4,t+1 = 0.2 + 0.7 x4,t + 0.4 x5,t + u4,t+1 ,
tions of impact-relevant extreme events; https://jpi-climate.
eu/project/roadmap/, last access: 21 February 2024) and have       x5,t+1 = 0.8 + 0.2 x4,t + 0.7 x6,t + u5,t+1 ,
never been methodically compared together before. In this          x6,t+1 = 0.3 − 0.5 x6,t + u6,t+1 ,                              (2)
analysis, we use these two methods in the same framework
                                                                   where xk (k = 1, . . ., 6) represents the six variables, and uk
to allow for a fair comparison. We also compute the corre-
                                                                   represents normal random noises in these six variables (uk ∼
lation coefficient to show the superiority of causal methods
                                                                   N(0,1)). By construction, we have two directed cycles, i.e.,
compared to a classical correlation analysis. In particular, we
                                                                   x1 → x2 → x3 → x1 and x4 → x5 → x4 , and these cycles
use four different artificial models with an increasing level of
                                                                   are driven by a common cause, i.e., x6 , which drives both
complexity and one real-world case study based on climate
                                                                   x2 and x5 (Fig. 2d).
indices. These different datasets are described in Sect. 2, and
                                                                      We solve this system using 106 time steps (1t = 1). For
our two causal methods are presented in Sect. 3. Results of
                                                                   our analysis, we discard the first 104 time steps.
our comparison are presented in Sect. 4, and a discussion is
provided in Sect. 5, before concluding in Sect. 6.
                                                                   2.3    Nine-dimensional (9D) model

2     Data                                                         The next model is a nine-dimensional (9D) stochastic non-
                                                                   linear VAR system with a maximum of four lags (Eq. 17 in
In order to apply the two causal methods described below           Subramaniyam et al., 2021):
(Sect. 3), we use three different stochastic models (includ-                                            2
ing two linear models and one nonlinear model), one deter-
                                                                                           2
                                                                   x1,t = 3.4 x1,t−1 (1 − x1,t−1 ) e−x1,t−1 + 2.5 x2,t−4
ministic nonlinear model (Lorenz, 1963), and one real-world              + 1.8 x3,t−2 + 1.5 x4,t−2 + 0.4 u1,t ,
case study using climate indices in the Atlantic and Pacific                                            2
regions. This allows us to test LKIF and PCMCI with an in-
                                                                                           2
                                                                   x2,t = 3.4 x2,t−1 (1 − x2,t−1 ) e−x2,t−1 + 0.4 u2,t ,
                                                                                                        2
creasing level of complexity (from a simple two-dimensional                                2
                                                                   x3,t = 3.4 x3,t−1 (1 − x3,t−1 ) e−x3,t−1 + 0.25 x1,t−1
model to a real-world case study).
                                                                         + 0.4 u3,t ,
                                                                                                        2
2.1    Two-dimensional (2D) model
                                                                                           2
                                                                   x4,t = 3.4 x4,t−1 (1 − x4,t−1 ) e−x4,t−1 + 1.5 x5,t−3
                                                                         + 1.2 x6,t−1 + 0.4 u4,t ,
We first consider a two-dimensional (2D) stochastic linear
                                                                                                        2
model (Eq. 12 in Liang, 2014):                                                             2
                                                                   x5,t = 3.4 x5,t−1 (1 − x5,t−1 ) e−x5,t−1 + 0.4 u5,t ,
                                                                                                        2
dx1 = (−x1 + 0.5 x2 ) dt + 0.1 dw1 ,
                                                                                           2
                                                                   x6,t = 3.4 x6,t−1 (1 − x6,t−1 ) e−x6,t−1 + 1.5 x7,t−3
dx2 = −x2 dt + 0.1 dw2 ,                                    (1)          + 0.4 u6,t ,
                                                                                                        2
                                                                                           2
                                                                   x7,t = 3.4 x7,t−1 (1 − x7,t−1 ) e−x7,t−1 + 0.4 u7,t ,
where x1 and x2 are the two variables, t is time, and w1 and
                                                                                                        2
w2 represent standard Wiener
                          √ processes in x1 and x2 , respec-
                                                                                           2
                                                                   x8,t = 3.4 x8,t−1 (1 − x8,t−1 ) e−x8,t−1 + 0.8 x7,t−1
tively (wk,t+1t − wk,t ∼ 1t N(0,1), with N(0,1) being a
                                                                         + 0.4 u8,t ,
normal distribution with zero mean and unit variance). In this                                          2
simple system, x2 drives x1 but not vice versa (Fig. 1f).                                  2
                                                                   x9,t = 3.4 x9,t−1 (1 − x9,t−1 ) e−x9,t−1 + 1.8 x7,t−1
   We solve this system with the Euler–Maruyama method                   + 0.4 u9,t ,                                              (3)
using a time step 1t = 0.001 and 1000 unit times, which
brings 106 time steps. We initialize the system with x1 (0) = 1    where xk (k = 1, . . ., 9) represents the nine variables, e is
and x2 (0) = 2. For our analysis, we discard the first 10 unit     the exponential function, and uk represents normal random
times (first 104 time steps), which is considered to be our        noises in these nine variables (uk ∼ N (0,1)). This system
spin-up period.                                                    contains a directed chain x7 → x6 → x4 → x1 → x3 and a
                                                                   fork, i.e., x7 driving x6 , x8 , and x9 . There are also two collid-
                                                                   ers, with x5 and x6 both affecting x4 on the one hand, and x2 ,
2.2    Six-dimensional (6D) model
                                                                   x3 , and x4 driving x1 on the other hand (Fig. 4d). A particu-
Then, we investigate a six-dimensional (6D) stochastic linear      larity of this system compared to the 6D model (Eq. 2) is the
vector autoregressive (VAR) model with only one lag (Eq. 21        presence of lags larger than one.


https://doi.org/10.5194/npg-31-115-2024                                        Nonlin. Processes Geophys., 31, 115–136, 2024
118                                                                          D. Docquier et al.: Causal method comparison

  We solve this system using 106 time steps (1t = 1). For             the southeastern United States. A negative PNA reflects
our analysis, we discard the first 104 time steps.                    an opposite pattern of height anomalies over these re-
                                                                      gions.
2.4   Lorenz (1963) model                                           – The North Atlantic Oscillation (NAO) index is based
We also use the three-dimensional (3D) Lorenz (1963)                  on the difference in sea-level pressure between the sub-
model, which is deterministic, nonlinear, and non-periodic;           tropical high (Azores) and the subpolar low (Iceland).
it is a simplified model representing atmospheric convection:         A positive NAO reflects above-normal pressure over the
                                                                      central North Atlantic, the eastern United States, and
dx                                                                    western Europe and below-normal pressure across high
   = 10 (y − x),
dt                                                                    latitudes of the North Atlantic. A negative NAO features
dy                                                                    an opposite pattern of pressure anomalies over these re-
   = 28 x − y − x z,                                                  gions.
dt
dz         8
   = x y − z,                                                (4)    – The Arctic Oscillation (AO), or Northern Annular Mode
dt         3                                                          (NAM), index is constructed by projecting the 1000 hPa
where x, y, and z are the three variables and are proportional        geopotential height anomalies poleward of 20° N onto
to the convection intensity, the horizontal temperature varia-        the leading EOF (using monthly mean 1000 hPa height
tion and the vertical temperature variation, respectively. We         anomalies from 1979 to 2000). When the AO is in its
use the standard parameters of the model.                             positive phase, strong westerlies act to confine colder
   We solve the Lorenz (1963) model using the fourth-order            air across polar regions. When the AO is negative, the
Runge–Kutta scheme, a time step 1t = 0.01, and 1000 unit              westerly jet weakens and can become more meandering.
times, which brings 105 time steps. We initialize the system
                                                                    – The Quasi-Biennial Oscillation (QBO) index is calcu-
with x(0) = 0, y(0) = 1, and z(0) = 0. For our analysis, we
                                                                      lated from the zonal average of the 30 hPa zonal wind
discard the first 100 unit times (first 104 time steps; the spin-
                                                                      at the Equator. It is the most predictable mode of at-
up period).
                                                                      mospheric variability that is not linked to changing sea-
                                                                      sons, with easterly and westerly winds alternating each
2.5   Climate indices                                                 13 months.
Finally, we use eight different regional climate indices affect-    Below are the four indices based on ocean conditions:
ing the Atlantic and Pacific regions of especially the Northern
Hemisphere, following a similar approach as Vannitsem and           – The Atlantic Multidecadal Oscillation (AMO) index is
Liang (2022) and Silini et al. (2022). Four of these indices are      computed based on version 2 of the Kaplan et al. (1998)
based on atmospheric variables and four of them are based             extended SST gridded dataset (which uses UK Met Of-
on oceanic ones. Time series of these indices were retrieved          fice SST data) averaged over the North Atlantic (0–
from the Physical Sciences Laboratory (PSL) of the National           70° N; unsmoothed time series) and following the pro-
Oceanic and Atmospheric Administration (NOAA; https:                  cedure described in Enfield et al. (2001). Cool and warm
//psl.noaa.gov/data/climateindices/list/, last access: 20 Jan-        phases of the AMO may alternate every 20–40 years.
uary 2023). We use monthly values from January 1950 to De-
                                                                    – The Pacific Decadal Oscillation (PDO) index is ob-
cember 2021 (864 months), and we remove the linear trend
                                                                      tained by projecting the Pacific SST anomalies from
in order to get approximately stationary time series, which is
                                                                      version 5 of the NOAA Extended Reconstructed SST
a requirement for applying our causal methods.
                                                                      (ERSST) dataset onto the dominant EOF from 20 to
   The four atmospheric indices are computed from the Na-
                                                                      60° N. The PDO is positive when SST is anomalously
tional Centers for Environmental Prediction/National Center
                                                                      cold in the interior North Pacific and warm along the
for Atmospheric Research (NCEP/NCAR) reanalysis:
                                                                      eastern Pacific Ocean. The PDO is negative when the
  – The Pacific–North American (PNA) index is obtained                climate anomaly patterns are reversed.
    by projecting the daily 500 hPa geopotential height             – The Tropical North Atlantic (TNA) index is computed
    anomalies over the Northern Hemisphere (0–90° N)                  based on SST anomalies from the Hadley Centre Global
    onto the PNA loading pattern (second leading mode                 Sea Ice and Sea Surface Temperature (HadISST) and
    of rotated empirical orthogonal function (EOF) anal-              NOAA Optimal Interpolation (OI) datasets averaged in
    ysis of monthly mean 500 hPa height anomalies dur-                the Tropical North Atlantic (5.5–23.5° N; 57.5–15° W),
    ing the 1950–2000 period). A positive PNA features                based on Enfield et al. (1999).
    above-average heights in the vicinity of Hawaii and over
    the intermountain region of North America and below-            – The Niño3.4 index is based on standardized SST
    average heights south of the Aleutian Islands and over            anomalies (using ERSST v5) averaged over the eastern


Nonlin. Processes Geophys., 31, 115–136, 2024                                      https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                    119

      tropical Pacific (5° S–5° N; 170–120° W). The Niño3.4         where Zi is the normalizer, computed as follows:
      index is in its warm phase when SST anomaly exceeds                  d
                                                                           X                 dHinoise
      0.5 °C, and it is in its cold phase when SST anomaly is       Zi =         |Tk→i | +            ,                          (7)
      below −0.5 °C. For the remainder of the paper, we will               k=1
                                                                                               dt
      refer to this index as “ENSO” (El Niño–Southern Oscil-        where the first term on the right-hand side represents the in-
      lation), as it is closely associated with this oscillation.   formation flowing from all the xk to xi (including the influ-
                                                                    ence of xi on itself), and the last term is the effect of noise
3     Methods                                                       (taking stochastic effects into account), computed following
                                                                    Liang (2015, 2021).
In this section, we describe the two causal methods used               In the following, we will only use the relative rate of in-
in this study, namely, the Liang–Kleeman information flow           formation transfer τ (expressed in %). When τj →i is sig-
(LKIF; Sect. 3.1) and the Peter and Clark momentary condi-          nificantly different from 0, xj has an influence on xi ; when
tional independence (PCMCI; Sect. 3.2) methods. We com-             τj →i = 0, there is no influence. The absolute value of τ in-
pare our results to the more traditional Pearson correlation        dicates the strength of the causal influence. A positive (nega-
coefficient, which is the covariance between two variables          tive) value is indicative of an increase (decrease) in variabil-
divided by the product of their standard deviations. We also        ity of the target variable xi due to the causal influence of the
explain below the main differences between the two methods          source xj . However, we will mainly use the absolute value
(Sect. 3.3) and provide details about the comparison diagnos-       of τ in this study and will only briefly discuss the sign in
tics used in our study (Sect. 3.4).                                 the case of the Lorenz (1963) model (Fig. 7). Statistical sig-
                                                                    nificance of τj →i is computed via bootstrap resampling with
3.1    Liang–Kleeman information flow (LKIF)                        replacement of all terms included in Eqs. (5)–(7) and using
                                                                    a significance level α = 5 %. The number of bootstrap real-
The LKIF method has been developed by Liang and Klee-               izations varies depending on the case study: 100 for the 2D
man (2005). It has been first applied in bivariate cases (Liang     and Lorenz (1963) models, 300 for the 6D and 9D models,
and Kleeman, 2005; Liang, 2014) and has subsequently been           and 1000 for the real-world case study. This number is cho-
extended to multivariate cases (Liang, 2016, 2021). In our          sen sufficiently large to achieve convergence of results. The
study, we use the multivariate formulation of LKIF. In this         relative rate of information transfer τ is computed for each
framework, causal inference is based on information flow,           bootstrap realization, and the error in τ , which we refer to as
which has been recognized as a real physical notion, i.e., for-     τ , is calculated as the standard deviation across all τ boot-
mulated from first principles of information theory (Liang,         strapped values. If the confidence interval τ ± 1.96 τ does
2016).                                                              not contain the zero value, then τ is significant at the 5 %
   Under the assumption of a linear model with additive             level; otherwise, it is not significant.
noise, the maximum likelihood estimate of the information
flow reads as follows (Liang, 2021):                                3.2    Peter and Clark momentary conditional
                                                                           independence (PCMCI)
                d
            1 X                 Cij
Tj →i =       ·    1j k Ck,di ·     ,                        (5)    The PCMCI method is a causal discovery method based on
          detC k=1              Cii
                                                                    the Peter and Clark (PC) algorithm (Spirtes et al., 2001),
where Tj →i is the absolute rate of information transfer from       combined with the momentary conditional independence
variable xj to variable xi , C is the covariance matrix, d          (MCI) approach (Runge et al., 2019b). Given a set of
is the number of variables, 1j k represents the cofactors of        univariate time series (called “actors”), PCMCI estimates
C (1j k = (−1)j +k Mj k , where Mj k represents the minors),        their causal graph representing the conditional dependen-
Ck,di is the sample covariance between all xk and the Euler         cies among the time-lagged actors. In its linear application,
forward difference approximation of dxi /dt, Cij is the sam-        PCMCI uses partial correlations to iteratively test conditional
ple covariance between xi and xj , and Cii is the sample vari-      dependencies in a set of actors, distinguishing between true
ance of xi . Note that a nonlinear version of LKIF has recently     causal links and spurious links arising from autocorrelation
been developed but will not be used in this study (Pires et al.,    effects, indirect links, or common drivers.
2024).                                                                 Note that the term “causal” rests upon a set of assump-
   To assess the importance of the different cause–effect rela-     tions, which are described in Runge (2018). In general, the
tionships, we compute the relative rate of information trans-       causal graph should represent a stationary (stable in time) set
fer τj →i from variable xj to variable xi following the nor-        of causal links, in which causality is determined with a lag l
malization procedure of Liang (2015, 2021):                         of at least one time step, and it is only true among the specific
                                                                    set of analyzed actors. The PCMCI algorithm is composed of
          Tj →i                                                     two steps: the PC step and the MCI step. Each step is briefly
τj →i =         ,                                            (6)    described in this section.
           Zi

https://doi.org/10.5194/npg-31-115-2024                                          Nonlin. Processes Geophys., 31, 115–136, 2024
120                                                                               D. Docquier et al.: Causal method comparison

    In the first step, or PC step, for each actor in the (example)   for conditioning on the effects of any third variable (like
set of actors P , the algorithm identifies the initial set of par-   CMI), the study of which is however beyond the scope of
ents P 0 based only on the simple correlation between each           the present work. The β coefficients are only calculated for
actor and all other actors up to a maximum lag lmax . Let us         causal links that are significant at the 5 % level, where each
assume that with lmax = 3, P = {A, B, C, D, E} and PA0 =             p value obtained from the MCI step is corrected using the
{Al=−1 , Bl=−1 , Dl=−2 , Cl=−2 , El=−1 }, where actors A to E        Benjamini–Hochberg false discovery rate correction method
in the set of parents of A, PA0 , are ordered based on the ab-       (Benjamini and Hochberg, 1995).
solute value of their correlation coefficient with Al=0 . Then,
in the first iteration of the algorithm, the partial correlation     3.3   Differences between the two methods
ρ between Al=0 and each actor in PA0 is calculated by con-
ditioning on an additional actor taken from PA0 . For exam-          Before investigating results from the two causal methods, it
ple, ρ (Al=0 , Al=−1 |Bl=−1 ) = ρ (Res(Al=0 ), Res(Al=−1 )),         is important to highlight the main differences between the
where Res(Al=0 ) and Res(Al=−1 ) are the residuals of Al=0           two methods, which are summarized in Table 1. LKIF is di-
and Al=−1 after removing the linear influence of Bl=−1 . The         rectly derived from the propagation of information entropy
partial correlation is computed for each actor in PA0 by condi-      (Liang, 2016) and quantifies the rate of information transfer
tioning (only once) on the strongest available actor. This pro-      from one variable to the other (Liang, 2014, 2021). PCMCI,
cess is called “iterative conditioning”. At the end of this first    on the other hand, is a causal network algorithm starting with
iteration, the set of parents of A is updated. Let us assume         a fully connected graph from which non-causal links are iter-
that in our example PA1 = {Al=−1 , Bl=−1 , Cl=−2 , El=−1 },          atively removed based on conditioning sets of growing car-
then in the second iteration the set of parents PA2 will be iden-    dinality (Spirtes et al., 2001; Runge et al., 2019b). The actual
tified by conditioning on the first two strongest actors, e.g.,      underlying PCMCI measure for directional statistical depen-
ρ (Al=0 , Al=−1 |Bl=−1 , Cl=−2 ). The PC step ends when the          dence is partial correlations, including the effect of possible
number of actors on which to condition equals the numbers            causal parents. LKIF does not systematically test the latter
of actors contained in PAn . Then, the same computation is re-       but uses a different approach, in which the statistical depen-
peated for each actor contained in P , until each actor has its      dence is measured via the information flowing from one vari-
own set of parents Pn .                                              able to the other.
    In the second step, or MCI step, the partial correlation            The metric used by LKIF is the rate of information transfer
between each possible pair of actors is calculated a second          from variable xj to variable xi and can be expressed either in
time by regressing once on the combined set of parents.              natural unit of information (nat) per unit time (for T ; Eq. 5)
If we assume that PA4 = {Al=−1 , Cl=−2 , El=−1 } and PB3 =           or in percent (for τ ; Eq. 6). For PCMCI, the path coefficient
{Bl=−1 , Al=−2 , Dl=−1 }, then a causal link between Al=0 and        β (Eq. 8) measures the expected change in xi at time t (in
Bl=−1 is detected if their partial correlation conditioned on        units of standard deviation) if xj is perturbed at time t − l by
their joint set of parents is significant for a certain threshold    1 standard deviation. While time lags must be incorporated
α. In this example, ρ (Al=0 , Bl=−1 |Al=−1 , Cl=−2 , El=−1 ,         with PCMCI, LKIF has not been designed to work with such
Bl=−2 , Al=−3 , Dl=−2 ) is given (note that the lag of PB3 is in-    lags by default, although they can be used in principle (Liang
creased accordingly). At the end of the MCI step, each actor         et al., 2021). To this end, we can shift in time the time series
will have its own set of causal parents, and the causal effect       of the leading variable and recompute LKIF based on the
of each link can be computed.                                        lagged time series.
    The strength of a causal link from variable xj at time t − l        While for both methods the strength of the metric, in abso-
to variable xi at time t, noted xj,t−l → xi,t , is expressed in      lute value, indicates how strongly two variables are causally
terms of the path coefficient β, which measures the change           linked (i.e., the larger |τ | and |β|, the larger the causal link),
in the expectation of xi,t following an increase of xj,t−l by        the sign has a different meaning. For LKIF, a positive (neg-
1 standard deviation, keeping all other parents of xi,t con-         ative) value of τj →i means that the variability of the source
stant. The linear coefficients β are calculated as follows:          xj increases (decreases) the variability of the target xi . For
                                                                     PCMCI, the sign of βj →i is closely linked to the correlation
         N
         X                                                           between xj and xi (i.e., a positive (negative) value means that
xi,t =         βk xj,k + ηxi ,                                (8)
                                                                     an increase in xj leads to an increase (a decrease) in xi in the
         k=1
                                                                     subsequent time step).
where xj,k ∈ P {xi } (k =1,...,N) is the set of parents of xi,t
(N is the number of parents), and ηxi is the residual of xi,t .      3.4   Comparison diagnostics
Note that in order to allow for a meaningful comparison with
correlation and LKIF based on a linear model, we use here            Since correct causal links are known for the three first artifi-
the PCMCI algorithm along with a linear similarity measure           cial models (2D, 6D, and 9D models), we can check the per-
(partial correlation). In principle, PCMCI could also be com-        formance of the two causal methods, as well as the correla-
bined with other statistical association measures that allow         tion coefficient, in identifying the ground truth. The diagnos-


Nonlin. Processes Geophys., 31, 115–136, 2024                                           https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                         121

Table 1. Main differences between the two causal methods used in this study.

                                      LKIF                                      PCMCI
      Full name                       Liang–Kleeman information flow            Peter and Clark momentary conditional independence
      Type of method                  Information flow                          Causal discovery algorithm
      Use of time lags                Not by default                            Always
      Use of iterative conditioning   No                                        Yes
      Metric                          Rate of information transfer              Path coefficient β
                                      T (absolute) or τ (relative)
      Unit                            T : nat per unit time; τ : %              No unit
      Sign meaning                    > 0 : xj variability → xi variability ↑   > 0 : xj ↑→ xi ↑
                                      < 0 : xj variability → xi variability ↓   < 0 : xj ↑→ xi ↓
      Key references                  Liang (2014, 2021)                        Spirtes et al. (2001); Runge et al. (2019b)



tics presented here are not computed for the Lorenz (1963)               4.1    2D model
model and the real-world case study, as no exact solution
exists for these two cases. We compute true-positive, true-              For the 2D model, the numerical value of the correlation be-
negative, false-positive, and false-negative rates. The true-            tween x1 and x2 is significantly positive (R = 0.23; Fig. 1a)
positive rate is the percentage of causal links correctly de-            and is similar to the analytical value (Fig. 1d), but it does not
tected by the method among the total number of ground truth              provide any indication on the direction of influence.
causal links. The true-negative rate is the percentage of non-              LKIF can accurately retrieve the correct causal link, i.e.,
causal links correctly detected by the method among the total            from x2 to x1 , as well as the absence of influence in the
number of ground truth non-causal links. The false-positive              reverse direction (Fig. 1b), as was already demonstrated in
rate represents the percentage of cases where the method in-             Liang (2014). In addition, the numerical estimate of the rate
correctly detects a causal link among the total number of                of information transfer (|τ2→1 | = 5.72 %; Fig. 1b) is very
ground truth non-causal links. The false-negative rate rep-              close to the analytical solution (|τ2→1 | = 5.56 %; Fig. 1e),
resents the percentage of cases where the method fails to find           which provides confidence in the LKIF results found for this
an existing causal link among the total number of ground                 simple system.
truth causal links.                                                         PCMCI only captures the self-influences of x1 and x2 but
   To summarize the results from the confusion matrix, we                is not able to capture any significant causal influence be-
also compute the φ coefficient based on true positives (de-              tween x1 and x2 with the original time step (i.e., 1t = 0.001)
noted TP), true negatives (denoted TN), false positives (de-             (Fig. 1c). This missed detection is partly due to the fact that
noted FP), and false negatives (denoted FN):                             PCMCI responds better for discrete maps with finite time
                                                                         steps. Indeed, the time step for discretization is too small,
            TP × TN − FP × FN                                            and if we recompute causal links with PCMCI taking every
φ=√                                     .                        (9)     100 time steps (1t = 0.1), we can recover the influence from
   (TP + FP)(TP + FN)(TN + FP)(TN + FN)
                                                                         x2 to x1 , although the value of β is relatively small (Fig. 1c).
The denominator is set to 1 if any of the four sums in the                  This example shows that LKIF performs well for such
denominator is equal to 0, in which case φ = 0. A value of               a very simple 2D system, while PCMCI struggles with the
1 represents a perfect prediction of ground truth causal and             original time step. In particular, the serial dependency in this
non-causal links by the method, while a value of 0 means that            particular model might overcast the mutual dependency for
the result is not better than a random prediction. These diag-           a “typical” maximum lag considered by PCMCI, which has
nostics are presented in Table 2 and discussed in Sect. 5.1.             not been designed for such conditions.

                                                                         4.2    6D model
4   Results
                                                                         For the 6D model, the correlations are significant for all 30
We provide results from the four artificial models and the               pairs of variables (excluding autocorrelations), despite rela-
real-world case study hereafter. Table 2 provides a summary              tively small values for many of them (Fig. 2a). This shows
of results for the three first models and will be discussed in           that a simple correlation analysis fails to only identify the
Sect. 5.1.                                                               seven causal links that should be identified in this system


https://doi.org/10.5194/npg-31-115-2024                                            Nonlin. Processes Geophys., 31, 115–136, 2024
122                                                                                   D. Docquier et al.: Causal method comparison




Figure 1. Numerical results from the 2D model: (a) correlation coefficient, (b) rate of information transfer (LKIF, absolute value), and
(c) maximum path coefficient (PCMCI) when using three lags (zero to two time steps). Analytical values of (d) correlation coefficient and
(e) rate of information transfer (LKIF). (f) Correct causal links from Eq. (1). For numerical results, only significant values at the α = 5 %
level are shown, and correct causal links are highlighted by black or blue contours. The dashed contour in panel (c) indicates a significant
value with a larger time step (1t = 0.1), while it is not significant with the original time step (1t = 0.001).


(Fig. 2d). The largest correlation of all pairs is between x2            tion is not able to provide such information and cannot iden-
and x5 (R = 0.37), but no causal link should exist between               tify confounding variables and the direction of causality.
the two variables (i.e., this is a false positive). This large cor-
relation probably appears because x6 influences both x2 and
x5 by construction (Fig. 2d) and is thus a confounding vari-             4.3   9D model
able. Correlations larger than 0.3 in absolute value appear for
the two pairs x6 –x2 and x6 –x5 (Fig. 2a), which confirms the            For the 9D model, the correlation does a poor job at iden-
role of x6 as a confounding variable, but these correlations             tifying correct causal influences (Fig. 3a). In particular, the
do not indicate the direction of influences.                             largest correlation is between x8 and x9 , which is not a cor-
   Both LKIF (Fig. 2b; no lag is used) and PCMCI (Fig. 2c;               rect causal link by construction (Eq. 3). As for the 6D model,
use of four time lags) can capture the seven correct causal              this is due to the fact that x7 should influence both variables
links (Fig. 2d), i.e., the directed cycle x1 → x2 → x3 → x1 ,            (Fig. 4d). x7 is indeed significantly correlated to both x8 and
the two-way causal link between x4 and x5 , and the influence            x9 , but the causal direction is not identified by the correlation
of x6 on both x2 and x5 . Results from PCMCI in terms of self-           analysis.
influences are more accurate based on Eq. (2), as it provides               Using LKIF without any lag shows that the method can
two significant self-influences, i.e., x4 and x6 , while LKIF            detect all correct links, except x5 → x4 , although only four
identifies all six self-influences as significant. The latter re-        causal influences have a rate of information transfer |τ | larger
sult indicates that the LKIF method may fail at representing             than 1 % (Fig. 3b). These four influences are the ones that
the correct self-influences, while PCMCI does not.                       should appear at lag −1 (Fig. 4d, i.e., x1 → x3 , x6 → x4 ,
   This example shows the strength of causal methods, which              x7 → x8 , and x7 → x9 . The method also wrongly identifies
can capture the correct causal influences, while the correla-            13 causal influences, even if values of information transfer
                                                                         remain small.


Nonlin. Processes Geophys., 31, 115–136, 2024                                                https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                              123




Figure 2. Results from the 6D model: (a) correlation coefficient, (b) rate of information transfer (LKIF, absolute value), and (c) maximum
path coefficient (PCMCI) when using four lags (zero to three time steps). (d) Correct causal links from Eq. (2). Only significant values at the
α = 5 % level are shown, and correct causal links are highlighted by black or blue contours.


   The use of time lags up to l = 3 time steps with LKIF (we              very small values (Fig. 4c). All self-influences are also cor-
use 9 variables × 4 lags = 36 variables in total) allows us               rectly identified by the two methods.
to improve results (Fig. 4b, where the maximum value of                       This example also demonstrates the power of causal meth-
all lags is plotted). In particular, all nine correct causal links        ods compared to a correlation analysis when using an appro-
can now be identified with |τ | > 3 %, except the influence of            priate number of lags: all expected links are correctly iden-
x3 on x1 , which is significant but has a much smaller value              tified. Although some wrong causal links are identified by
(|τ | = 0.68 %). Five additional causal influences are wrongly            both methods, the strength of the relationship remains small
identified by the method with lags up to 3 time steps, but with           for these wrong influences.
relatively small values (|τ | < 0.4 %).
   Using PCMCI with lags up to l = 4 time steps also al-
                                                                          4.4   Lorenz (1963) model
lows us to correctly reproduce all causal links, except that it
wrongly identifies four additional causal influences but with             The only large correlation (excluding autocorrelation) in this
                                                                          system is between x and y, with R = 0.88 (Fig. 5a). The


https://doi.org/10.5194/npg-31-115-2024                                              Nonlin. Processes Geophys., 31, 115–136, 2024
124                                                                                    D. Docquier et al.: Causal method comparison




Figure 3. Results from the 9D model without lags: (a) correlation coefficient and (b) rate of information transfer (LKIF, absolute value).
Only significant values at the α = 5 % level are shown, and correct causal links are highlighted by black or blue contours.


other correlations are very small (R = −0.01) but significant,           (Fig. 6d–e). This plateau lasts from l = 0 to l = 0.2 unit time
probably due to the length of the time series.                           for τxt−l →yt (Fig. 6d) and from l = 0 to l = 0.4 unit time for
   According to LKIF, a two-way causal link appears be-                  τyt−l →xt (Fig. 6e). No information transfer exists between z
tween x and y (Fig. 5b). This causal link is also identified             and the two other variables at any lag (Fig. 6d–f), in agree-
by PCMCI with lags up to l = 3 time steps (Fig. 5c). PCMCI               ment with the absence of correlation (Fig. 6a–c).
also identifies a significant two-way causal link between y                 The PCMCI path coefficients between x and y also gen-
and z, but the value is very close to 0.                                 erally decrease (in the two directions) with increasing lag,
   Then, we investigate whether there is a lag dependence                although the decrease presents more variability than the cor-
on the results. For the correlation and LKIF, we repeat the              relation and LKIF, with β = 0 at lag 0, the largest β value
computation by shifting the three variables one by one with              when l = 0.1 unit time, and then an oscillatory behavior until
a lag from 0 to 1 unit time (100 time steps) with 0.1 unit time          l = 1 unit time (Fig. 6g–h). As for the correlation and LKIF,
increment (i.e., every 10 time steps). For example, we take              no causal influence is found between z and the two other vari-
xt−l at lag l = 0.1 unit time and keep yt and zt at lag 0, and           ables at any lag (Fig. 6g–i).
we recompute the correlation and relative rate of information               If we replace x by x 2 to take nonlinearities into account
transfer. Then, we take xt−l at lag l = 0.2 unit time, keeping           and look at the triplet (x 2 , y, z), a strong positive correla-
yt and zt at lag 0 and so on until lag l = 1 unit time. We               tion now appears between x 2 and z (R = 0.65; Fig. 5d). In
do the same when y leads x and z and when z drives x and                 addition, a strong two-way causal link now appears between
y. For PCMCI, all lags from 0 to 1 unit time with 0.01 unit              x 2 and z with both LKIF (|τ | ∼ 50 % in the two directions;
time increment (i.e., every time step) are included in the same          Fig. 5e) and PCMCI (|β| = 1.7 in the two directions; Fig. 5f).
computation as the method is designed to work with multiple              This shows that the linear versions of LKIF and PCMCI can
lags by default. Results are presented in Fig. 6.                        detect causal links between nonlinear transformed variables
   The correlation coefficient between x and y decreases ex-             in nonlinear models. In this case, the correlation between x
ponentially with increasing lag when x leads y (Fig. 6a), and            and y, combined with the nonlinear forcing product xy in
it first increases from l = 0 to l = 0.1 unit time before de-            the third equation of the Lorenz (1963) model (z equation;
creasing exponentially when y leads x (Fig. 6b). No correla-             Eq. 4), results in a linear correlation between z and the non-
tion appears between z and any of the two other variables at             linear non-invertible variable change x 2 .
any lag (Fig. 6a–c).                                                        The correlation between xt+l  2   and zt oscillates between
   The LKIF rates of information transfer from x to y and                R ∼ −0.7 (l = 0.2 unit time) and R ∼ 0.9 (l = −0.1 unit
from y to x also decrease with increasing lag between 0                  time) with a period of ∼ 0.7 unit time (Fig. 7a). The rates
and 1 unit time, but starting with a plateau of |τ | ∼ 50 %              of information transfer from xt+l  2 to z and from z to x 2
                                                                                                                   t            t     t+l



Nonlin. Processes Geophys., 31, 115–136, 2024                                                https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                           125




Figure 4. Results from the 9D model with lags: (a) maximum correlation coefficient when using four lags (zero to three time steps),
(b) maximum rate of information transfer (LKIF, absolute value) when using four lags (zero to three time steps), and (c) maximum path
coefficient (PCMCI) using five lags (zero to four time steps). (d) Correct causal links from Eq. (3). Only significant values at the α = 5 %
level are shown, and correct causal links are highlighted by black or blue contours.


also show an oscillatory behavior with a period of ∼ 0.35               are related by significant correlations when considering no
unit time (Fig. 7b), i.e., half of the correlation oscillation.         lag (Fig. 8a). However, it is obvious that a large number of
PCMCI does not exhibit such an oscillatory behavior but                 these pairs are correlated but not causally linked. The use
rather a quickly decreasing β value for small lags (Fig. 7c).           of causal methods allows us to remove such spurious links,
                                                                        as demonstrated by the application of LKIF without any lag
                                                                        (Fig. 8b) and PCMCI with lags up to l = 2 months (Fig. 8c).
4.5   Climate indices                                                      Results from the two causal methods present several sim-
                                                                        ilarities, including the AO influence on both PDO and TNA
The real-world case study with climate indices shows that
                                                                        (Fig. 8b–c). Another similarity is the two-way causal link
54 % of the pairs of variables (excluding autocorrelations)


https://doi.org/10.5194/npg-31-115-2024                                            Nonlin. Processes Geophys., 31, 115–136, 2024
126                                                                                 D. Docquier et al.: Causal method comparison




Figure 5. Results from the Lorenz (1963) model when using (x, y, z): (a) correlation coefficient, (b) rate of information transfer (LKIF,
absolute value), and (c) maximum path coefficient (PCMCI) when using four lags (zero to three time steps). Results from the Lorenz (1963)
model when using (x 2 , y, z): (d) correlation coefficient, (e) rate of information transfer (LKIF, absolute value), and (c) maximum path
coefficient (PCMCI) when using four lags (zero to three time steps). Only significant values at the α = 5 % level are shown.


between AMO and TNA, in agreement with Vannitsem and                      In terms of differences between the two causal methods,
Liang (2022) and Silini et al. (2022). The AMO–TNA influ-              LKIF identifies additional causal influences of AO on PNA,
ence is not surprising as both indices are computed from SST           NAO, and AMO, while PCMCI does not identify these causal
anomalies in the North Atlantic, with AMO spanning the ma-             links (Fig. 8b–c). It is well known that there is a clear rela-
jority of the North Atlantic and TNA focusing on the tropical          tionship between AO and NAO (Deser, 2000) and that NAO
region. Values of the AMO–TNA influence in the two direc-              is often referred to as the local manifestation of the AO
tions are relatively strong for LKIF (|τAMO→TNA | = 22 %               (Hamouda et al., 2021). Also, according to LKIF, there are
and |τTNA→AMO | = 38 %) compared to other pairs of influ-              two-way causal influences between ENSO and PNA and be-
ence (Fig. 8b). In addition, ENSO influences PDO according             tween ENSO and TNA, which do not appear with PCMCI
to both methods (Fig. 8b–c), and the positive sign of the cor-         with lags up to l = 2 months (Fig. 8b–c). It is well known
relation means that a warm Niño3.4 phase results in a pos-             that ENSO has a major influence on the extratropical North-
itive PDO (Fig. 8a). The ENSO influence on PDO was re-                 ern Hemisphere climate variability, in particular on PNA
cently reported by Vannitsem and Liang (2022), also using              (Horel and Wallace, 1981). However, the influence of ENSO
LKIF, and Silini et al. (2022), based on the pseudo-transfer           on PNA is complicated by the fact that other mechanisms
entropy. Spatial patterns of ENSO and PDO are very simi-               can affect this relationship, such as the position of the Pa-
lar, and PDO is often being viewed as an ENSO-like inter-              cific jet stream (Soulard et al., 2019). Our results with LKIF
decadal climate variability, with PDO occurring at decadal             suggest that PNA has a stronger influence on ENSO than the
timescales, while ENSO is predominantly an interannual                 reverse, which would go in favor of more complex mecha-
phenomenon (Mantua et al., 1997; Zhang et al., 1997).                  nisms in action. Finally, the influence of ENSO on TNA has
                                                                       also been reported in the literature, and different mechanisms



Nonlin. Processes Geophys., 31, 115–136, 2024                                             https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                               127




Figure 6. Results from the Lorenz (1963) model when using (x, y, z): (a–c) correlation coefficient, (d–f) rate of information transfer (LKIF,
absolute value), and (g–i) path coefficient (PCMCI) as a function of the lag l when (a, d, g) x leads; (b, e, h) y leads; and (c, f, i) z leads.


have been proposed (García-Serrano et al., 2017). It is inter-            other indices, except QBO and ENSO (Fig. 9c). The largest
esting to find that the influence of TNA on ENSO is stronger              value of rate of information transfer is from AO to NAO with
than the reverse influence with LKIF (Fig. 8b).                           |τ | = 4 %, in agreement with the value considering no lag
   The use of 12 time lags (0 to 11 months) with both meth-               (Fig. 8b). AO also influences TNA and AMO at larger lags
ods (bringing 8 variables ×12 lags = 96 variables in total for            with LKIF (l = 1, 2, and 4 months for TNA and l = 2, 5,
LKIF) provides additional insights (Figs. 9–10). PNA influ-               and 11 months for AMO). With PCMCI, AO only influences
ences ENSO with a 1-month lag with LKIF (Fig. 9a) and with                TNA at lags l = 1 to 4 months, PDO at lag l = 1 month,
a 4-month lag with PCMCI (Fig. 10a). Additionally, PNA in-                and QBO at lag l = 4 months (Fig. 10c). It is intriguing to
fluences PDO with a 4-month lag and AMO with a 11-month                   notice that no AO influence on NAO appears with PCMCI.
lag using LKIF (Fig. 9a). However, all PNA influences ap-                     QBO does not have any influence on any other climate
pear relatively weak in intensity (|τ | < 1 % with LKIF and               indices with any of the methods (Figs. 9d and 10d).
|β| < 0.1).                                                                   The AMO–TNA two-way causal influence already iden-
   NAO influences PDO with both methods but with very dif-                tified in Fig. 8 also appears in the lagged plots but with
ferent lags depending on the method, i.e., 11 months with                 contrasting behaviors depending on the causal method. With
LKIF (Fig. 9b) and 1 month with PCMCI (Fig. 10b). It also                 LKIF, AMO only influences TNA at lag 0 (Fig. 9e) and TNA
influences TNA with LKIF with a 1-month lag. As for PNA,                  influences AMO at lags l = 0 and 11 months (Fig. 9g).
all significant NAO influences remain limited in intensity                With PCMCI, the AMO influence on TNA increases with
(|τ | < 1 % with LKIF and |β| < 0.1).                                     increasing lag from l = 0 to 6 months, then decreases and
   AO is by far the climate index that influences most vari-              stays relatively constant until l = 11 months (Fig. 10e),
ables with LKIF (Fig. 9c), in agreement with Vannitsem and                and TNA influences AMO at lags l = 2, 4–6, 8, and 10–
Liang (2022). When considering no lag, AO influences all                  11 months (Fig. 10g). TNA has additional influences with


https://doi.org/10.5194/npg-31-115-2024                                              Nonlin. Processes Geophys., 31, 115–136, 2024
128                                                                                   D. Docquier et al.: Causal method comparison




Figure 7. Results from the Lorenz (1963) model when using (x 2 , y, z): (a) correlation coefficient, (b) rate of information transfer (LKIF),
and (c) path coefficient (PCMCI) as a function of the lag l in x.


PCMCI at lags l ≥ 2 months (on NAO, QBO, PDO, and                        lations, and we applied them to four artificial models and one
ENSO; Fig. 10g) and with LKIF at lags l ≥ 9 months (on                   real-world case study based on climate indices. Below we
PDO and ENSO). The TNA influences on PDO and ENSO,                       discuss our results compared to previous literature (Sect. 5.1
appearing for both causal methods, remain limited to large               for the artificial models and Sect. 5.2 for the real-world case
lags (Figs. 9g–10g).                                                     study).
   PDO has an influence on PNA with LKIF at lag l =
6 months (Fig. 9f), which is consistent with Simon et al.                5.1   Artificial models
(2022) using sensitivity experiments with a coupled model.
According to PCMCI, PDO influences ENSO at lags l ≥                      For the simplest (2D) model used here, we show that LKIF
3 months (Fig. 10f).                                                     can accurately reproduce the correct causal link, with rel-
   Finally, ENSO influences PDO at lags l = 0, 2 and                     atively high accuracy compared to the analytical solution,
6 months, and influences TNA at lags l = 2 and 6 months                  while PCMCI fails to reproduce this link when using the
with LKIF (Fig. 9h). With PCMCI, ENSO is the climate in-                 original time step (Sect. 4.1 and Fig. 1). PCMCI provides
dex that influences most variables (all but NAO), especially             the correct influence for the 2D model when taking every
PDO from l = 2 to 10 months, TNA from l = 3 to 11 months,                100 time steps (although the β value is small), which shows
and AMO from l = 4 to 11 months (Fig. 10h). The large role               that PCMCI responds better for discrete maps with finite time
of ENSO was also reported using pseudo-transfer entropy us-              steps. For the 6D model, both LKIF and PCMCI can de-
ing lags l = 1 to 9 months (Silini et al., 2022).                        tect the correct causal links (Sect. 4.2 and Fig. 2). For the
                                                                         9D nonlinear model, PCMCI allows us to retrieve the cor-
                                                                         rect causal relationships, while some care with the number
5   Discussion                                                           of lags is needed with LKIF to achieve appropriate results
                                                                         (Sect. 4.3 and Figs. 3–4). This shows that LKIF performs bet-
Correlation is often used by the climate community to iden-              ter for simpler systems and presents a few more difficulties
tify potential relationships between variables, but a statisti-          with more complex models with several lags. On the other
cally significant correlation does not necessarily imply cau-            hand, PCMCI does not work well in the presence of very
sation. In our study, we used two causal methods, LKIF and               strong autocorrelations but may be preferential over LKIF as
PCMCI, to disentangle true causal links from spurious corre-             the number of variables increases. Results from the Lorenz


Nonlin. Processes Geophys., 31, 115–136, 2024                                                https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                          129




Figure 8. Results from the real-world case study: (a) correlation coefficient, (b) rate of information transfer (LKIF, absolute value), and
(c) maximum path coefficient (PCMCI) when using three lags (0 to 2 months). Only significant values at the α = 5 % level are shown.


(1963) model are more complicated to interpret as the sys-              and predictability improvement) are better suited for more
tem is highly nonlinear and chaotic. Both methods detect the            complex systems (Krakovská et al., 2018). This goes in hand
same causal links (Sect. 4.4 and Fig. 5), although some dif-            with LKIF being better with the specific time-continuous 2D
ferences appear in the dependence of the causal influence on            model studied here, while PCMCI is well suited for the time-
the time lag (Figs. 6–7). Moreover, the combination of model            discrete 9D model of our analysis. Thus, the key finding from
nonlinearities and nonlinear variable changes can result in             Krakovská et al. (2018), that “it is important to choose the
linear causal links detectable by LKIF and PCMCI (Fig. 5).              right method for a particular type of data”, is also valid for
   The above results are not entirely comparable to findings            our study.
from Krakovská et al. (2018) from a methodological perspec-                The main novelties compared to Krakovská et al. (2018)
tive, as the latter used other causal methods and different             are that (1) we use two causal methods that have not been
coupled systems. However, a similarity is the fact that some            compared yet, (2) we compare our causal methods to the
methods (Granger causality and its extensions) better per-              classical correlation coefficient, (3) we assess causality be-
form with the simplest models, while other methods (CCM                 tween nonlinear variable changes, and (4) we apply the two



https://doi.org/10.5194/npg-31-115-2024                                           Nonlin. Processes Geophys., 31, 115–136, 2024
130                                                                                  D. Docquier et al.: Causal method comparison




Figure 9. Results from the real-world case study with LKIF (rate of information transfer; absolute value) as a function of the lag: (a) PNA
influence on the other variables; (b) NAO influence; (c) AO influence; (d) QBO influence; (e) AMO influence; (f) PDO influence; (g) TNA
influence; (h) ENSO influence. Only significant influences at the α = 5 % level are shown as filled dots.


methods to a real-world case study. Regarding (1), no definite          more variables and several lags, like the 9D model, PCMCI
conclusion can be provided as to which method is the best:              may be better suited. In any case, we recommend to use as
it depends on the system used. For certain very simple mod-             many methods as possible for a specific problem to increase
els, LKIF appears to be preferential over PCMCI, although               the robustness of results. Regarding (2), we show that both
PCMCI has not been designed for the particular 2D model                 LKIF and PCMCI are superior to correlation, as they allow
used here (Sect. 4.1). For a more complex model involving               us to remove spurious links. Regarding (3), we show that the


Nonlin. Processes Geophys., 31, 115–136, 2024                                               https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                          131




Figure 10. Results from the real-world case study with PCMCI (path coefficient; absolute value) as a function of the lag: (a) PNA influence
on the other variables; (b) NAO influence; (c) AO influence; (d) QBO influence; (e) AMO influence; (f) PDO influence; (g) TNA influence;
(h) ENSO influence. Only significant influences at the α = 5 % level are shown as filled dots.


combination of model nonlinearities with nonlinear variable             in this study and for the three first artificial models (2D, 6D,
changes can result in linear causal links, detectable by both           and 9D models). For the 9D model, a distinction is made
LKIF or PCMCI. Point (4) is discussed in Sect. 5.2.                     between the case where lags are not considered (PCMCI is
   Table 2 provides true-positive, true-negative, false-                not used in this case) and the case where lags are consid-
positive, and false-negative rates, as well as the φ coeffi-            ered. Results show that the correlation has a large chance of
cient, for the correlation and the two causal methods used              detecting false positives (i.e., incorrect detection of causal


https://doi.org/10.5194/npg-31-115-2024                                           Nonlin. Processes Geophys., 31, 115–136, 2024
132                                                                                      D. Docquier et al.: Causal method comparison

Table 2. True-positive, true-negative, false-positive, and false-negative rates (in %), as well as φ coefficient, for the correlation and the two
causal methods (LKIF and PCMCI) for the first three artificial models (2D, 6D, and 9D models, the latter without and with lags), excluding
self-influences. The number of ground truth correct (incorrect) links (without considering if the exact time lags are reproduced or not) is
indicated in parentheses after “True positives” (“True negatives”) for each model. For the 2D model and PCMCI, numbers are also provided
in parentheses for the case with larger sampling time step (1t = 0.1).

                                                                                  Correlation    LKIF       PCMCI
                            2D model                  True positives (1) [%]              100      100      0 (100)
                                                      True negatives (1) [%]                0      100    100 (100)
                                                      False positives [%]                 100        0         0 (0)
                                                      False negatives [%]                   0        0      100 (0)
                                                      φ coefficient                         0        1         0 (1)
                            6D model                  True positives (7) [%]              100      100           100
                                                      True negatives (23) [%]               0      100           100
                                                      False positives [%]                 100        0             0
                                                      False negatives [%]                   0        0             0
                                                      φ coefficient                         0        1             1
                            9D model without lag      True positives (9) [%]             100        89             –
                                                      True negatives (63) [%]              60       79             –
                                                      False positives [%]                  40       21             –
                                                      False negatives [%]                   0       11             –
                                                      φ coefficient                      0.40     0.50             –
                            9D model with lags        True positives (9) [%]             100      100           100
                                                      True negatives (63) [%]              27       92            94
                                                      False positives [%]                  73        8             6
                                                      False negatives [%]                   0        0             0
                                                      φ coefficient                      0.21     0.77          0.81



influences) for all models; thus, the correlation largely over-            5.2   Climate indices
estimates causal links. LKIF and PCMCI allow us to sub-
stantially reduce false positives, with 0 % for the 2D and 6D              In our study, we extend previous analyses from Vannitsem
models with both methods, 21 % for the 9D model without                    and Liang (2022) and Silini et al. (2022) by using monthly
lag with LKIF, and < 10 % for the 9D model with lags with                  time series of climate indices in the Atlantic and Pacific re-
both methods. For the 2D model, LKIF perfectly reproduces                  gions. We use the same seven climate indices as Vannitsem
the right causal links (φ = 1), while the correlation coeffi-              and Liang (2022); add QBO to the list to have four indices
cient and PCMCI (with the original time step) do not make                  characterizing both the atmosphere and ocean; and do not use
better than a random prediction (φ = 0). Only when using                   local air temperature, precipitation, or insolation. Vannitsem
a larger sampling time step can PCMCI reproduce the cor-                   and Liang (2022) also computed LKIF based on these indices
rect causal links. For the 6D model, both LKIF and PCMCI                   but focused on the dependence of the rate of information
accurately reproduce the ground truth (φ = 1), while the cor-              transfer on the timescale (using a time-moving window) and
relation coefficient again does not make better than a random              did not compare LKIF to another method. Silini et al. (2022)
prediction and identifies all relationships as causal (φ = 0               also used NAO, QBO, AMO, PDO, and ENSO (Niño3.4);
and false-positive rate = 100 %). For the 9D model without                 they used a slightly different index for TNA, and they in-
lag (PCMCI not included), the correlation does a better job                corporated seven additional indices. The causal method used
at identifying a certain amount of true negatives (60 %) com-              by Silini et al. (2022) is the pseudo-transfer entropy method
pared to the 2D and 6D models, but LKIF provides overall                   (Silini and Masoller, 2021).
better results (φ = 0.5 for LKIF vs. φ = 0.4 for correlation),                Due to the small methodological differences in our anal-
despite the identification of one false negative with LKIF                 ysis compared to Vannitsem and Liang (2022) (see above),
(Fig. 3b). For the 9D model with lags, the performance of                  some small differences appear, but key results with LKIF
the two causal methods is clearly better than the correlation              remain similar. In particular, we find that AO is the largest
(φ = 0.21), with PCMCI (φ = 0.81) performing slightly bet-                 driver of all variables as it influences all other indices, except
ter than LKIF (φ = 0.77).                                                  QBO and ENSO (Sect. 4.5 and Fig. 8b). We show that the
                                                                           AO influence mainly occurs at lag l = 0 (Fig. 9c). This is in
                                                                           agreement with Vannitsem and Liang (2022), who find that


Nonlin. Processes Geophys., 31, 115–136, 2024                                                   https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                  133

AO plays a key role at short timescale. PCMCI only identi-          be computed with a larger sampling time step to provide cor-
fies two AO influences with lags shorter than 2 months, i.e.,       rect causal links, although the influence remains small. For
to PDO and TNA (Fig. 10c). It is particularly intriguing to         the 6D model, both methods can capture the seven correct
see that PCMCI does not detect the AO influence on NAO              causal links. For the 9D model, PCMCI correctly reproduces
(Fig. 8c), while LKIF does (Fig. 8b), as NAO is often re-           all causal links, and LKIF without any time lag is not totally
ferred to as the local manifestation of AO (Hamouda et al.,         accurate. When used with time lags, LKIF can identify the
2021). This discrepancy might hide seasonal differences, as         correct causal links.
for example winter and summer NAO have different spatial               For the Lorenz (1963) model, results are more complicated
patterns (Folland et al., 2009).                                    to interpret as the system is time-continuous, nonlinear, and
   ENSO has a relatively large influence on other climate           chaotic. Both causal methods show a strong two-way causal
indices, especially on PDO for both LKIF and PCMCI                  link between x and y, while no causal link appears between z
(Fig. 8b–c). The pivotal role of ENSO was already identi-           and the two other variables. However, when we replace x by
fied by Silini et al. (2022) and is not surprising due to its im-   x 2 to take nonlinearities into account, x 2 and z are causally
portance on the global climate (Timmermann et al., 2018).           linked (in the two directions) with both methods. We also
ENSO has a clear influence on PDO at lags 2 to 10 months            show that both LKIF and PCMCI display a decrease in the
for PCMCI (Fig. 10h), while it only appears at lags 0, 2 and        two-way causal influence between x and y with increasing
6 months for LKIF (Fig. 9h). This ENSO–PDO influence                time lag, although the shape of this decrease is different be-
was detected from lags 1 to 7 with pseudo-transfer entropy          tween methods. Additionally, the oscillatory behavior in cor-
(Silini et al., 2022), thus somewhere in between PCMCI and          relation coefficient and LKIF for the x 2 –z pair as a function
LKIF. The other clear ENSO influence according to PCMCI,            of lag is not displayed by PCMCI.
LKIF and pseudo-transfer entropy is on TNA, at lags 2 and              Finally, the real-world case study with climate indices pro-
6 months with LKIF (Fig. 9h), at lags 3–11 months with              vides some similarities but also important differences be-
PCMCI (Fig. 10h), and at lags 1–9 months with pseudo-               tween the two methods. In terms of similarities, AO influ-
transfer entropy (Silini et al., 2022). According to PCMCI          ences both PDO and TNA, there is a two-way causal link
and pseudo-transfer entropy, ENSO also largely influences           between AMO and TNA, and ENSO influences PDO. In
other climate indices than PDO and TNA at different lags,           terms of differences, LKIF identifies additional influences of
which is not the case for LKIF. More research would be              AO on PNA, NAO, and AMO, as well as two-way causal
needed to further investigate this difference between causal        links between ENSO and PNA and between ENSO and TNA.
methods.                                                            When using 12 time lags, the number of influences detected
                                                                    by PCMCI becomes larger compared to LKIF, e.g., ENSO
                                                                    has a large influence on all other variables except NAO,
6   Conclusions                                                     while AO remains the largest influencer (at smaller lags) with
                                                                    LKIF. More detailed analysis of the physical processes would
In this study, we compare two independent causal methods,           be needed to identify correct causal links between these cli-
namely, the Liang–Kleeman information flow (LKIF) and               mate indices.
the Peter and Clark momentary conditional independence                 In summary, this analysis shows that both causal methods
(PCMCI), and the Pearson correlation coefficient. We use            should be preferred to correlation when it comes to identify
five different datasets with an increasing level of complexity,     causal links. Additionally, as both LKIF and PCMCI display
including three stochastic models, one nonlinear determinis-        strengths and weaknesses when used with relatively simple
tic model, and one real-world case study.                           models in which correct causal links can be detected by con-
    We show that both causal methods are superior to the cor-       struction, we do not recommend one or the other method but
relation, which suffers from five key limitations: random co-       rather encourage the climate community to use several meth-
incidence, no identification of the direction of causality, ex-     ods whenever possible. We highlight that both methods, as
ternal drivers not distinguished from direct drivers, no iden-      used here, assume linearity, so results need to be taken with
tification of potential nonlinear influences, and application to    caution for nonlinear problems, such as the Lorenz (1963)
bivariate cases only. For most models and the real-world case       system and the real-world case study. The use of extensions
study, the number of significant correlations is much larger        of the methods for which fully nonlinear terms are taken
than the number of significant causal links, which is incor-        into account are necessary to complement the current results
rect from a causal perspective for the three first models. By       (e.g., Pires et al., 2024). Also, both LKIF and PCMCI deal
extension, we assume that the correlation also suffers from         with direct causal links, while other methods, such as inter-
this overestimation in the real-world case study, and causal        ventional causality (Baldovin et al., 2020), can detect indi-
methods allow us to improve results.                                rect influences. Further analysis would be needed to explore
    When comparing both causal methods together, LKIF can           this aspect. Lastly, we could test the robustness of the meth-
accurately reproduce the correct causal link in the 2D model,       ods to noise and their performance in the context of high-
while PCMCI cannot with the original time step and needs to         dimensional systems.


https://doi.org/10.5194/npg-31-115-2024                                      Nonlin. Processes Geophys., 31, 115–136, 2024
134                                                                                    D. Docquier et al.: Causal method comparison

Code and data availability. The climate indices were retrieved            Review statement. This paper was edited by Stefano Pierini and
from the Physical Sciences Laboratory (PSL) of the Na-                    reviewed by two anonymous referees.
tional Oceanic and Atmospheric Administration (NOAA; https:
//psl.noaa.gov/data/climateindices/list/, PSL, 2023). The Python
scripts to produce the outputs and figures of this article, in-
cluding the computation of LKIF, are available on Zenodo:                 References
https://doi.org/10.5281/zenodo.8383534 (Docquier, 2023).
                                                                          Årthun, M., Eldevik, T., Smedsrud, L. H., Skagseth, Ø., and Ing-
                                                                            valdsen, R. B.: Quantifying the influence of Atlantic heat on Bar-
Author contributions. DD, GDC, RVD, CALP, AS and SV de-                     ents Sea ice variability and retreat, J. Climate, 25, 4736–4743,
signed the study. DD generated the model datasets and retrieved the         https://doi.org/10.1175/JCLI-D-11-00466.1, 2012.
climate indices. DD computed the LKIF method and Pearson cor-             Bach, E., Motesharrei, S., Kalnay, E., and Ruiz-Barradas,
relation onto the datasets, and GDC ran the PCMCI algorithm. DD             A.: Local atmosphere-ocean predictability: Dynamical ori-
led the writing of the manuscript, with contributions from all co-          gins, lead times, and seasonality, J. Climate, 32, 7507–7519,
authors. DD created all figures, with the help of GDC. All authors          https://doi.org/10.1175/JCLI-D-18-0817.1, 2019.
participated to the data analysis and interpretation.                     Baldovin, M., Cecconi, F., and Vulpiani, A.: Understanding causa-
                                                                            tion via correlations and linear response theory, Phys. Rev. Res.,
                                                                            2, 043436, https://doi.org/10.1103/PhysRevResearch.2.043436,
                                                                            2020.
Competing interests. At least one of the (co-)authors is a mem-
                                                                          Benjamini, Y. and Hochberg, Y.: Controlling the False Discovery
ber of the editorial board of Nonlinear Processes in Geophysics.
                                                                            Rate: A practical and powerful approach to multiple testing, J.
The peer-review process was guided by an independent editor, and
                                                                            Roy. Stat. Soc. B, 57, 289–300, https://doi.org/10.1111/j.2517-
the authors also have no other competing interests to declare.
                                                                            6161.1995.tb02031.x, 1995.
                                                                          Bishop, S. P., Small, R. J., Bryan, F. O., and Tomas, R. A.: Scale de-
                                                                            pendence of midlatitude air-sea interaction, J. Climate, 30, 8207–
Disclaimer. Publisher’s note: Copernicus Publications remains               8221, https://doi.org/10.1175/JCLI-D-17-0159.1, 2017.
neutral with regard to jurisdictional claims made in the text, pub-       Coufal, D., Jakubík, J., Jacjay, N., Hlinka, J., Krakovská, A., and
lished maps, institutional affiliations, or any other geographical rep-     Paluš, M.: Detection of coupling delay: A problem not yet
resentation in this paper. While Copernicus Publications makes ev-          solved, Chaos, 27, 083109, https://doi.org/10.1063/1.4997757,
ery effort to include appropriate place names, the final responsibility     2017.
lies with the authors.                                                    Deser, C.: On the teleconnectivity of the “Arctic
                                                                            Oscillation”,     Geophys.       Res.      Lett.,  27,     779–782,
                                                                            https://doi.org/10.1029/1999GL010945, 2000.
Acknowledgements. We thank X. San Liang for his feedback re-              Di Capua, G., Kretschmer, M., Donner, R. V., van den Hurk, B.,
lated to our analysis. We also thank the editor Stefano Pierini and         Vellore, R., Krishnan, R., and Coumou, D.: Tropical and mid-
two anonymous reviewers for their comments, which helped to im-             latitude teleconnections interacting with the Indian summer mon-
prove our article.                                                          soon rainfall: a theory-guided causal effect network approach,
                                                                            Earth Syst. Dynam., 11, 17–34, https://doi.org/10.5194/esd-11-
                                                                            17-2020, 2020a.
Financial support. David         Docquier, Giorgia Di Capua,              Di Capua, G., Runge, J., Donner, R. V., van den Hurk, B.,
Reik Donner, Carlos Pires, Amélie Simon, and Stéphane Van-                  Turner, A. G., Vellore, R., Krishnan, R., and Coumou, D.:
nitsem were supported by ROADMAP (Role of ocean dynamics                    Dominant patterns of interaction between the tropics and
and Ocean-Atmosphere interactions in Driving cliMAte varia-                 mid-latitudes in boreal summer: causal relationships and
tions and future Projections of impact-relevant extreme events;             the role of timescales, Weather Clim. Dynam., 1, 519–539,
https://jpi-climate.eu/project/roadmap/, last access: 21 Febru-             https://doi.org/10.5194/wcd-1-519-2020, 2020b.
ary 2024), a coordinated JPI-Climate/JPI-Oceans project.                  Docquier, D.: Codes to compute Liang index and
David Docquier and Stéphane Vannitsem received funding                      correlation for comparison study, Zenodo [code],
from the Belgian Federal Science Policy Office under contract               https://doi.org/10.5281/zenodo.8383534, 2023.
B2/20E/P1/ROADMAP. Giorgia Di Capua and Reik Donner                       Docquier, D., Grist, J. P., Roberts, M. J., Roberts, C. D., Semm-
were supported by the German Federal Ministry for Education                 ler, T., Ponsoni, L., Massonnet, F., Sidorenko, D., Sein, D. V.,
and Research (BMBF) via the ROADMAP project (grant no.                      Iovino, D., Bellucci, A., and Fichefet, T.: Impact of model reso-
01LP2002B). Amélie Simon and Carlos Pires were supported                    lution on Arctic sea ice and North Atlantic Ocean heat transport,
by Portuguese funds: Fundação para a Ciência e a Tecnolo-                   Clim. Dynam., 53, 4989–5017, https://doi.org/10.1007/s00382-
gia (FCT) I.P./MCTES through national funds (PIDDAC) –                      019-04840-y, 2019.
UIDB/50019/2020 (https://doi.org/10.54499/UIDB/50019/2020),               Docquier, D., Vannitsem, S., Ragone, F., Wyser, K., and Liang,
UIDP/50019/2020 (https://doi.org/10.54499/UIDP/50019/2020)                  X. S.: Causal links between Arctic sea ice and its potential drivers
and LA/P/0068/2020 (https://doi.org/10.54499/LA/P/0068/2020),               based on the rate of information transfer, Geophys. Res. Lett., 49,
and the project JPIOCEANS/0001/2019 (ROADMAP).                              e2021GL095892, https://doi.org/10.1029/2021GL095892, 2022.
                                                                          Docquier, D., Vannitsem, S., and Bellucci, A.: The rate of infor-
                                                                            mation transfer as a measure of ocean–atmosphere interactions,


Nonlin. Processes Geophys., 31, 115–136, 2024                                                 https://doi.org/10.5194/npg-31-115-2024
D. Docquier et al.: Causal method comparison                                                                                             135

   Earth Syst. Dynam., 14, 577–591, https://doi.org/10.5194/esd-           of midlatitude winter circulation, J. Climate, 29, 4069–4081,
   14-577-2023, 2023.                                                      https://doi.org/10.1175/JCLI-D-15-0654.1, 2016.
Enfield, D. B., Mestas-Nuñez, A. M., Mayer, D. A., and Cid-             Liang, X. S.: Unraveling the cause-effect relation be-
   Serrano, L.: How ubiquitous is the dipole relationship in tropical      tween time series, Phys. Rev. E, 90, 052150,
   Atlantic sea surface temperatures?, J. Geophys. Res., 104, 7841–        https://doi.org/10.1103/PhysRevE.90.052150, 2014.
   7848, https://doi.org/10.1029/1998JC900109, 1999.                    Liang,      X.      S.:    Normalizing        the    causality    be-
Enfield, D. B., Mestas-Nuñez, A. M., and Trimble, P. J.: The At-           tween time series, Phys. Rev. E, 92, 022126,
   lantic Multidecadal Oscillation and its relation to rainfall and        https://doi.org/10.1103/PhysRevE.92.022126, 2015.
   river flows in the continental U.S., Geophys. Res. Lett., 28,        Liang, X. S.: Information flow and causality as rig-
   2077–2080, https://doi.org/10.1029/2000GL012745, 2001.                  orous notions ab initio, Phys. Rev. E, 94, 052201,
Folland, C. K., Knight, J., Linderholm, H. W., Fereday, D., In-            https://doi.org/10.1103/PhysRevE.94.052201, 2016.
   eson, S., and Hurrell, J. W.: The summer North Atlantic Os-          Liang, X. S.: Normalized multivariate time series causality
   cillation: Past, present, and future, J. Climate, 22, 1082–1103,        analysis and causal graph reconstruction, Entropy, 23, 679,
   https://doi.org/10.1175/2008JCLI2459.1, 2009.                           https://doi.org/10.3390/e23060679, 2021.
García-Serrano, J., Cassou, C., Douville, H., Giannini, A., and         Liang, X. S. and Kleeman, R.: Information transfer between dy-
   Doblas-Reyes, F. J.: Revisiting the ENSO teleconnection                 namical system components, Phys. Rev. Lett., 95, 244101,
   to the Tropical North Atlantic, J. Climate, 30, 6945–6957,              https://doi.org/10.1103/PhysRevLett.95.244101, 2005.
   https://doi.org/10.1175/JCLI-D-16-0641.1, 2017.                      Liang, X. S., Xu, F., Rong, Y., Zhang, R., Tang, X., and Zhang, F.: El
Granger, C. W. J.: Investigating causal relations by econometric           Niño Modoki can be mostly predicted more than 10 years ahead
   models and cross-spectral methods, Econometrica, 37, 424–438,           of time, Sci. Rep., 11, 17860, https://doi.org/10.1038/s41598-
   https://doi.org/10.2307/1912791, 1969.                                  021-97111-y, 2021.
Hagan, D. F. T., Dolman, H. A. J., Wang, G., Lim Kam Sian, K.           Lorenz, E. N.: Deterministic nonperiodic flow, J. At-
   T. C., Yang, K., Ullah, W., and Shen, R.: Contrasting ecosys-           mos. Sci., 20, 130–141, https://doi.org/10.1175/1520-
   tem constraints on seasonal terrestrial CO2 and mean surface air        0469(1963)020<0130:DNF>2.0.CO;2, 1963.
   temperature causality projections by the end of the 21st century,    Manshour, P., Balasis, G., Consolini, G., Papadimitriou, C., and
   Environ. Res. Lett., 17, 124019, https://doi.org/10.1088/1748-          Paluš, M.: Causality and information transfer between the so-
   9326/aca551, 2022.                                                      lar wind and the magnetosphere-ionosphere system, Entropy, 23,
Hamouda, M. E., Pasquero, C., and Tziperman, E.: Decou-                    390, https://doi.org/10.3390/e23040390, 2021.
   pling of the Arctic Oscillation and North Atlantic Oscilla-          Mantua, N. J., Hare, S. R., Zhang, Y., Wallace, J. M., and
   tion in a warmer climate, Nat. Clim. Change, 11, 137–142,               Francis, R. C.: A Pacific interdecadal climate oscilla-
   https://doi.org/10.1038/s41558-020-00966-8, 2021.                       tion with impacts on salmon production, B. Am. Me-
Horel, J. D. and Wallace, J. M.: Planetary-scale atmospheric               teor. Soc., 78, 1069–1080, https://doi.org/10.1175/1520-
   phenomena associated with the Southern Oscillation, Mon.                0477(1997)078<1069:APICOW>2.0.CO;2, 1997.
   Weather Rev., 109, 813–829, https://doi.org/10.1175/1520-            McGraw, M. C. and Barnes, E. A.: Memory matters: A case for
   0493(1981)109<0813:PSAPAW>2.0.CO;2, 1981.                               Granger causality in climate variability studies, J. Climate, 31,
Huang, Y., Franzke, C. L. E., Yuan, N., and Fu, Z.: Systematic             3289–3300, https://doi.org/10.1175/JCLI-D-17-0334.1, 2018.
   identification of causal relations in high-dimensional chaotic       Mosedale, T. J., Stephenson, D. B., Collins, M., and Mills, T. C.:
   systems: application to stratosphere-troposhere coupling, Clim.         Granger causality of coupled climate processes: Ocean feedback
   Dynam., 55, 2469–2481, https://doi.org/10.1007/s00382-020-              on the North Atlantic Oscillation, J. Climate, 19, 1182–1194,
   05394-0, 2020.                                                          https://doi.org/10.1175/JCLI3653.1, 2006.
Jiang, S., Hu, H., Zhang, N., Lei, L., and Bai, H.: Multi-source        Paluš, M. and Vejmelka, M.: Directionality of coupling
   forcing effects analysis using Liang–Kleeman information flow           from bivariate time series: How to avoid false causali-
   method and the community atmosphere model (CAM4.0), Clim.               ties and missed connections, Phys. Rev. E, 75, 056211,
   Dynam., 53, 6035–6053, https://doi.org/10.1007/s00382-019-              https://doi.org/10.1103/PhysRevE.75.056211, 2007.
   04914-x, 2019.                                                       Paluš, M., Komárek, V., Hrnčír, Z., and Štěrbová, K.: Syn-
Kaplan, A., Cane, M. A., Kushnir, Y., Clement, A. C., Blumen-              chronization as adjustment of information rates: Detection
   thal, M. B., and Rajagopalan, B.: Analyses of global sea surface        from bivariate time series, Phys. Rev. E, 63, 046211,
   temperature 1856–1991, J. Geophys. Res., 103, 18567–18589,              https://doi.org/10.1103/PhysRevE.63.046211, 2001.
   https://doi.org/10.1029/97JC01736, 1998.                             Paluš, M., Krakovská, A., Jakubík, J., and Chvosteková, M.:
Krakovská, A. and Hanzely, F.: Testing for causal-                         Causality, dynamical systems and the arrow of time, Chaos, 28,
   ity in reconstructed state spaces by an optimized                       075307, https://doi.org/10.1063/1.5019944, 2018.
   mixed prediction method, Phys. Rev. E, 94, 052203,                   Pfleiderer, P., Schleussner, C.-F., Geiger, T., and Kretschmer, M.:
   https://doi.org/10.1103/PhysRevE.94.052203, 2016.                       Robust predictors for seasonal Atlantic hurricane activity identi-
Krakovská, A., Jakubík, J., Chvosteková, M., Coufal, D., Jajcay,           fied with causal effect networks, Weather Clim. Dynam., 1, 313–
   N., and Paluš, M.: Comparison of six methods for the detection          324, https://doi.org/10.5194/wcd-1-313-2020, 2020.
   of causality in a bivariate time series, Phys. Rev. E, 97, 042207,   Physical Sciences Laboratory (PSL): Climate indices: Monthly at-
   https://doi.org/10.1103/PhysRevE.97.042207, 2018.                       mospheric and ocean time series, National Oceanic and Atmo-
Kretschmer, M., Coumou, D., Donges, J. F., and Runge, J.: Us-              spheric Administration (NOAA) [data set], https://psl.noaa.gov/
   ing causal effect networks to analyze different Arctic drivers          data/climateindices/list/, last access: 20 January 2023.



https://doi.org/10.5194/npg-31-115-2024                                           Nonlin. Processes Geophys., 31, 115–136, 2024
136                                                                                  D. Docquier et al.: Causal method comparison

Pires, C., Docquier, D., and Vannitsem, S.: A general theory to es-     Sugihara, G., May, R., Ye, H., Hsieh, C.-H., Deyle, E., Fogarty, M.,
   timate information transfer in nonlinear systems, Phys. D, 458,         and Munch, S.: Detecting causality in complex ecosystems, Sci-
   133988, https://doi.org/10.1016/j.physd.2023.133988, 2024.              ence, 338, 496–500, https://doi.org/10.1126/science.1227079,
Runge, J.: Causal network reconstruction from time series: From            2012.
   theoretical assumptions to practical estimation, Chaos, 28,          Timmermann, A., An, S.-I., Kug, J.-S., Jin, F.-F., Cai, W., Capo-
   075310, https://doi.org/10.1063/1.5025050, 2018.                        tondi, A., Cobb, K. M., Lengaigne, M., McPhaden, M. J.,
Runge, J., Bathiany, S., Bollt, E., Camps-Valls, G., Coumou, D.,           Stuecker, M. F., Stein, K., Wittenberg, A. T., Yun, K.-S., Bayr,
   Deyle, E., Glymour, C., Kretschmer, M., Mahecha, M. D.,                 T., Chen, H.-C., Chikamoto, Y., Dewitte, B., Dommenget, D.,
   Munoz-Mari, J., van Nes, E. H., Peters, J., Quax, R., Reich-            Grothe, P., Guilyardi, E., Ham, Y.-G., Hayashi, M., Ineson, S.,
   stein, M., Scheffer, M., Scholkopf, B., Spirtes, P., Sugihara, G.,      Kang, D., Kim, S., Kim, W., Lee, J.-Y., Li, T., Luo, J.-J., Mc-
   Sun, J., Zhang, K., and Zscheischler, J.: Inferring causation from      Gregor, S., Planton, Y., Power, S., Rashid, H., Ren, H.-L., San-
   time series in Earth system sciences, Nat. Commun., 10, 2553,           toso, A., Takahashi, K., Todd, A., Wang, G., Wang, G., Xie, R.,
   https://doi.org/10.1038/s41467-019-10105-3, 2019a.                      Yang, W.-H., Yeh, S.-W., Yoon, J., Zeller, E., and Zhang, X.:
Runge, J., Nowack, P., Kretschmer, M., Flaxman, S., and Se-                El Niño–Southern Oscillation complexity, Nature, 559, 535–545,
   jdinovic, D.: Detecting and quantifying causal associations in          https://doi.org/10.1038/s41586-018-0252-6, 2018.
   large nonlinear time series datasets, Sci. Adv., 5, eaau4996,        Tirabassi, G., Masoller, C., and Barreiro, M.: A study of the
   https://doi.org/10.1126/sciadv.aau4996, 2019b.                          air–sea interaction in the South Atlantic Convergence Zone
Schreiber, T.: Measuring information transfer, Phys. Rev. Lett., 85,       through Granger causality, Int. J. Climatol., 35, 3440–3453,
   461–464, https://doi.org/10.1103/PhysRevLett.85.461, 2000.              https://doi.org/10.1002/joc.4218, 2015.
Silini, R. and Masoller, C.: Fast and effective pseudo transfer en-     van Nes, E. H., Scheffer, M., Brovkin, V., Lenton, T. M.,
   tropy for bivariate data-driven causal influences, Sci. Rep., 11,       Ye, H., Deyle, E., and Sugihara, G.: Causal feedbacks
   8423, https://doi.org/10.1038/s41598-021-87818-3, 2021.                 in climate change, Nat. Clim. Change, 5, 445–448,
Silini, R., Tirabassi, G., Barreiro, M., Ferranti, L., and Masoller,       https://doi.org/10.1038/NCLIMATE2568, 2015.
   C.: Assessing causal dependencies in climatic indices, Clim.         Vannitsem, S. and Ekelmans, P.: Causal dependences between the
   Dynam., 61, 79–89, https://doi.org/10.1007/s00382-022-06562-            coupled ocean–atmosphere dynamics over the tropical Pacific,
   0, 2022.                                                                the North Pacific and the North Atlantic, Earth Syst. Dynam., 9,
Simon, A., Gastineau, G., Frankignoul, C., Lapin, V., and                  1063–1083, https://doi.org/10.5194/esd-9-1063-2018, 2018.
   Ortega, P.: Pacific Decadal Oscillation modulates the Arc-           Vannitsem, S. and Liang, X. S.: Dynamical dependencies at
   tic sea-ice loss influence on the midlatitude atmospheric               monthly and interannual time scales in the climate system: Study
   circulation in winter, Weather Clim. Dynam., 3, 845–861,                of the North Pacific and Atlantic regions, Tellus A, 74, 141–158,
   https://doi.org/10.5194/wcd-3-845-2022, 2022.                           https://doi.org/10.16993/tellusa.44, 2022.
Small, R. J., Bryan, F. O., Bishop, S. P., Larson, S., and Tomas,       Vannitsem, S., Dalaiden, Q., and Goosse, H.: Testing for dy-
   R. A.: What drives upper-ocean temperature variability in cou-          namical dependence: Application to the surface mass bal-
   pled climate models and observations, J. Climate, 33, 577–596,          ance over Antarctica, Geophys. Res. Lett., 46, 12125–12135,
   https://doi.org/10.1175/JCLI-D-19-0295.1, 2020.                         https://doi.org/10.1029/2019GL084329, 2019.
Soulard, N., Lin, H., and Yu, B.: The changing relationship between     Zhang, Y., Wallace, J. M., and Battisti, D. S.:
   ENSO and its extratropical response patterns, Sci. Rep., 9, 6507,       ENSO-like interdecadal variability: 1900-93, J. Cli-
   https://doi.org/10.1038/s41598-019-42922-3, 2019.                       mate,      10,     1004–1020,       https://doi.org/10.1175/1520-
Spirtes, P., Glymour, C., and Scheines, R.: Causation, Predic-             0442(1997)010<1004:ELIV>2.0.CO;2, 1997.
   tion, and Search (Second Edition), The MIT press, Boston,
   https://doi.org/10.7551/mitpress/1754.001.0001, 2001.
Subramaniyam, N. P., Donner, R. V., Caron, D., Panuccio, G., and
   Hyttinen, J.: Causal coupling inference from multivariate time
   series based on ordinal partition transition networks, Nonlin-
   ear Dynam., 105, 555–578, https://doi.org/10.1007/s11071-021-
   06610-0, 2021.




Nonlin. Processes Geophys., 31, 115–136, 2024                                               https://doi.org/10.5194/npg-31-115-2024
