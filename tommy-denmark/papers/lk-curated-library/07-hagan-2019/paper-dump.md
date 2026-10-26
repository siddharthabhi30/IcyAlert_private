# Full-text extraction

- Title: A Time-Varying Causality Formalism Based on the Liang-Kleeman Information Flow for Analyzing Directed Interactions in Nonstationary Climate Systems
- Year: 2019
- DOI: https://doi.org/10.1175/JCLI-D-18-0881.1
- PDF source: https://journals.ametsoc.org/downloadpdf/view/journals/clim/32/21/jcli-d-18-0881.1.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

1 NOVEMBER 2019                                               HAGAN ET AL.                                                                     7521




       A Time-Varying Causality Formalism Based on the Liang–Kleeman Information
         Flow for Analyzing Directed Interactions in Nonstationary Climate Systems

                                       DANIEL FIIFI TAWIA HAGAN AND GUOJIE WANG
       Collaborative Innovation Center on Forecast and Evaluation of Meteorological Disasters, School of Geographical Sciences,
                         Nanjing University of Information Science and Technology, Nanjing, Jiangsu, China

                                                                X. SAN LIANG
       School of Marine Sciences, and School of Atmospheric Sciences, Nanjing Institute of Meteorology, Nanjing, Jiangsu, China

                                                            HAN A. J. DOLMAN
                 Department of Earth Sciences, Faculty of Science, Free University Amsterdam, Amsterdam, Netherlands


                                      (Manuscript received 4 January 2019, in final form 29 June 2019)

                                                                   ABSTRACT

                 The interaction between the land surface and the atmosphere is of significant importance in the climate
               system because it is a key driver of the exchanges of energy and water. Several important relations to heat
               waves, floods, and droughts exist that are based on the interaction of soil moisture and, for instance, air
               temperature and humidity. Our ability to separate the elements of this coupling, identify the exact locations
               where they are strongest, and quantify their strengths is, therefore, of paramount importance to their pre-
               dictability. A recent rigorous causality formalism based on the Liang–Kleeman (LK) information flow theory
               has been shown, both theoretically and in real-world applications, to have the necessary asymmetry to infer
               the directionality and magnitude within geophysical interactions. However, the formalism assumes statio-
               narity in time, whereas the interactions within the land surface and atmosphere are generally nonstationary;
               furthermore, it requires a sufficiently long time series to ensure statistical sufficiency. In this study, we remedy
               this difficulty by using the square root Kalman filter to estimate the causality based on the LK formalism to
               derive a time-varying form. Results show that the new formalism has similar properties compared to its time-
               invariant form. It is shown that it is also able to capture the time-varying causality structure within soil
               moisture–air temperature coupling. An advantage is that it does not require very long time series to make an
               accurate estimation. Applying a wavelet transform to the results also reveals the full range of temporal scales
               of the interactions.




1. Introduction                                                              between the land and the atmosphere (Berg et al. 2014;
                                                                             Zheng et al. 2015). In recent years, identifying the hot
  The land surface plays an essential role in the climate
                                                                             spots of land–atmosphere interactions and quantifying
system (e.g., Fischer et al. 2007; Miralles et al. 2014). A
                                                                             the magnitude of such effects on climate variations and
number of studies have demonstrated that the land–
                                                                             extremes have attracted a lot of attention (Casagrande
atmosphere interactions, especially soil moisture in-
                                                                             et al. 2015; Papagiannopoulou et al. 2017; Tuttle and
teractions with the atmosphere, have the potential to
                                                                             Salvucci 2015).
affect the occurrence of heat waves (Stéfanon et al.
                                                                               The approaches for quantifying land–atmosphere in-
2014), drought (Ciabatta et al. 2015; Roundy and Wood
                                                                             teractions include mainly, among others, numerical ex-
2015), rainfall (Taylor et al. 2012; Tuttle and Salvucci
                                                                             perimentation and statistical diagnosis. In recent years,
2015), and floods (Massari et al. 2014; Saini et al. 2016).
                                                                             many numerical studies have been conducted with the
Therefore, predictability of climate extremes is ex-
                                                                             aim of improving the understanding of land–atmosphere
pected to exist in the interactions of key processes
                                                                             interactions with a focus on soil moisture feedbacks on
                                                                             the overlying atmosphere. Koster et al. (2004) and Guo
  Corresponding author: Guojie Wang, gwang_nuist@163.com                     et al. (2006) identified the hot spots of soil moisture

DOI: 10.1175/JCLI-D-18-0881.1
Ó 2019 American Meteorological Society. For information regarding reuse of this content and general copyright information, consult the AMS Copyright
Policy (www.ametsoc.org/PUBSReuseLicenses).
                                                                                                            Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7522                                        JOURNAL OF CLIMATE                                                     VOLUME 32

feedbacks on subsequent precipitation and air temper-         Another method that has gained much popularity is the
ature over the globe based on numerical experiments of        equilibrium feedback analysis (EFA), which was origi-
12 general circulation models (GCMs). Such feedbacks          nally proposed by Frankingnoul and Hasselmann (1977)
were found to be strongest in the transitional regions        for studying coupled systems within the climate. It has
between dry and wet climates with, however, rather            since been applied to the study of soil moisture feed-
significant discrepancies among the outputs from dif-         backs on precipitation to investigate the hot spots of soil
ferent GCMs. Fischer et al. (2007) simulated the Euro-        moisture–precipitation feedbacks over the globe using
pean heat wave in the summer of 2003 and found the            various datasets (Notaro 2008). A spatiotemporal anal-
heat anomalies in the Mediterranean region reduced by         ysis tool called the coupled manifold is also used for this
about 40% if the interactions between the land and at-        purpose (Navarra and Tribbia 2005), although it is not
mosphere were not adequately taken into account.              strictly defined in the concept of causality. It seeks a
There also exist a number of other numerical studies          solution for a system as a linear function of another
showing the importance of land–atmosphere interac-            system, and has also been successfully applied to several
tions for atmospheric prediction (Koster et al. 2004;         problems of land surface atmosphere interactions
Miralles et al. 2014; Tuttle and Salvucci 2015).              (Catalano et al. 2016).
   Although numerical climate models offer a good al-            Recently, Liang (2014) proposed a rigorous non-
ternative for studying the land–atmosphere interactions       parametric formalism of causality measurement for
experimentally, significant discrepancies exist between       identifying the cause–effect relations between any given
the results from different models due to the use of dif-      time series, based on the theory of Liang–Kleeman (LK)
ferent parameterization schemes (Flato et al. 2013; Zhao      information flow (LK causality; Liang 2016). Compared
and Li 2015). Therefore, considerable efforts have also       to other tools, the LK causality is rather easy to com-
been put into statistical approaches for identifying the      pute, involving only the sample covariance of the given
land–atmosphere interactions from observations: iden-         time series. Additionally, since it is derived from first
tifying where they exist as well as estimating their          principles and mathematically rigorous, it avoids spuri-
magnitude (Miralles et al. 2012; Notaro 2008; Zhang           ous causalities that are sometimes found in the Granger
et al. 2008). A common practice is the use of time-lagged     causal test and other statistical formalisms. Using a large
correlation (Ford et al. 2015; Wu and Zhang 2015), even       number of simulations, Liang (2014) showed that this
though it is generally known that correlation does not        causality formalism is able to unambiguously obtain
bear the required asymmetry and directedness to in-           predetermined causalities between the simulated time
dicate causality (Liang 2014). The latter implies that        series. Stips et al. (2016) used the LK causality to in-
correlation analysis does not show the direction of the       vestigate the causal relations between global surface
interactions. Thus, disentangling the direction of the        temperature and the radiative forcing, finding that
interactions among time series has been of interest for a     greenhouse gases were the main causal drivers of the
long time in many disciplines. Another potential prob-        recent warming, but this cause–effect direction was re-
lem with time-lagged correlation is that when the fore-       versed on paleoclimate time scales. Among other ap-
knowledge of the processes is not sufficient, it is very      plications of the Liang–Kleeman information flow in
difficult to differentiate a lag from an advance, espe-       recent years, Liang (2014) used it to investigate the
cially, when the processes are periodic. Therefore, sev-      cause–effect relation between two climate modes, El
eral studies have been devoted to the development of          Niño and the Indian Ocean dipole (IOD), both of which
reliable statistical tools for this purpose (Dajcman 2013;   have been linked to some climate extreme and socio-
Casagrande et al. 2015; Notaro 2008; Palus 2014; Papana      economic impacts. The LK causality is hence identified
et al. 2016). The Granger causality, first suggested by       to provide an easy but efficient tool for studying the
Clive Granger (Granger 1969), is one of the most widely       land–atmosphere interactions. However, it requires
accepted tools for studying directed interactions, in         stationarity for the time series in question. It is well
particular, the linear relations of cause and effect,         known that the land–atmosphere interactions vary with
among time series. It has been applied successfully to        seasons due to the changing boundary layer properties.
study the cause–effect relations between climate vari-        Therefore, there is a need to further develop the LK
ables such as the soil moisture–precipitation interaction     causality in order to cope with time-varying properties
(Tuttle and Salvucci 2015). More recently, a nonlinear        of land surface atmosphere interactions.
form of Granger causality based on a random forest               The Kalman filter is an established approach to ob-
machine learning algorithm was proposed and used to           tain the changing model parameters with time. It infers
analyze the causal relations between several climate          parameters of interest from inaccurate and uncer-
factors and vegetation (Papagiannopoulou et al. 2017).        tain observations by minimizing the mean-square error




                                                                                        Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                    HAGAN ET AL.                                                              7523

between the estimated parameters and the observations          series can be easily obtained in a quantitative sense
(Grewal and Andrews 2001). It has been further de-             Liang (2014). Recently, Liang (2016) found that cau-
veloped into different forms and applied in both linear        sality is a real physical notion and can be rigorously
and nonlinear problems (Ghorbanidehno et al. 2015;             derived and quantified with the notion of the Liang–
Houtekamer and Zhang 2016; Kiani and Pourtakdoust              Kleeman information flow (Liang 2008); particularly,
2014). We use the Kalman filter here to estimate the           the causality between two time series can be easily ob-
time-varying parameters for the LK information flow-           tained in a quantitative sense (Liang 2014). The fol-
based causal inference.                                        lowing is a brief introduction.
  Many time series in geophysics contain dominant                Consider a d-dimensional stochastic system
periodic components, which can vary in both amplitude
and frequency over long periods. Such periodic com-                            dX 5 F(X, t) dt 1 B(X, t) dW ,                   (1)
ponents sometimes act in the land–atmosphere in-
                                                               where F is defined as the vector of drift coefficients, B 5
teractions, leading to signals in the frequency domain.
                                                               (bij) is a matrix of stochastic perturbation coefficients,
Identifying the signals of directed interactions in the
                                                               and W is a vector of a Wiener process. If two compo-
frequency domain may help to understand the un-
                                                               nents, for instance, X1 and X2 are considered, the rate of
derlying mechanisms of land–atmosphere interactions.
                                                               information flow from X2 to X1, is the amount of entropy
Therefore, there is also a need to identify directed in-
                                                               contributed by X2 to the evolution of H1, the marginal
teractions in the frequency domain. Wavelet analysis,
                                                               entropy of X1. This can be obtained by finding the total
widely used in analyzing time series of geophysics
                                                               rate of change of H1, minus the same change rate but
(Casagrande et al. 2015; Wang et al. 2017), is such a tool
                                                               with the effect from X2 instantaneously excluded. Liang
to solve this problem by decomposing a time series into
                                                               (2008, 2016) proved that for a 2D system,
time-frequency distribution.
  In this study, the Liang causality formalism is in-                                   "                    #
                                                                         1 ›(F1 r1 )   1 1 ›2 (b211 1 b212 )r1
tegrated with the Kalman filter and wavelet analysis to        T2/1 5 2E              1 E                        ,              (2)
provide a statistical tool for investigating the land–                   r1 ›x1        2 r1        ›x21
atmosphere interactions in the time-frequency domain.
Section 2 gives a description of the formalism, section 3      where r1 is the marginal probability density of X1, and
validates the formalism with synthetic models, section 4       E is the mathematical expectation. For arbitrary di-
applies it to a specific case study of land–atmosphere         mensional system, the result is referred to Liang (2016).
interaction over China, and section 5 presents a sum-          A unique property of this measure of information flow
mary and discussion of the formalism and its potential         rate as obtained in Eq. (2) is its asymmetry (between
applications.                                                  T2/1 and T1/2), and particularly, the ‘‘principle of nil
                                                               causality,’’ which states that, if the evolution of an event
2. The time-varying causal inference                           is independent of another, then the causality from the
                                                               latter to the former is zero. Thus, ideally, a nonzero
a. Formalism of the information flow-based causality           T2/1 implies that X2 is causal to X1, where the magni-
   Information flow, sometimes referred to as informa-         tude of T2/1 is the strength of the causality. A zero
tion transfer in the literature, is essentially the transfer   value strictly implies that X2 is not causal to X1. (In
of information through some processes between two or           practice, the statistical significance should be tested to
more entities within a dynamical system (Liang 2013).          infer causality). Refer to Liang (2016) for a more for-
The transfer of information from a source to a receiver,       mally and quantitatively stated principle of nil causality,
which may reflect a cause–effect relationship (i.e., who       which the Granger causality test and transfer entropy
drives whom) is a problem that can be found in many            analysis fail to meet in many situations (Granger 1980).
disciplines such as neuroscience, financial economics,            In the case of a linear system: F 5 f 1 AX, where f 5
climate interactions, and network dynamics, just to            (f1, f2)T, A 5 (aij), B 5 (bij), then if originally (X1, X2)
mention a few. After more than 30 years of research, a         has a bivariate normal distribution, it will always be so.
consensus has been reached that information flow is            Given the mean m 5 (m1, m2)T and covariance matrix
logically associated with causation and bears implica-         S 5 (sij), their evolutions are as follows:
tions of predictability and uncertainty propagation (see                        dm
Liang 2013 and references therein). Liang (2008, 2016)                             5 f 1 Am,     and                            (3)
                                                                                dt
hence argued that, in this way, causality can be rigor-
ously formulated, rather than axiomatically proposed as                         dS
                                                                                   5 AS 1 SAT 1 BBT .                           (4)
an ansatz; particularly, the causality between two time                         dt




                                                                                          Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7524                                              JOURNAL OF CLIMATE                                                  VOLUME 32

When B 5 (bij) is constant, the last term of Eq. (2) dis-       where x is the system state vector, y is the measurement
appears. Substitution of                                        vector, and u is the input vector. The parameters A, B,
                                                                and H are transition matrices of appropriate dimensions,
          F1 5 f1 1 a11 X1 1 a12 X2 ,      and           (5)    with v and w being mutually independent and zero mean
                                   "             #              measurement and process noise, respectively in this
                     1               (x1 2 m1 )2                case, and
           r1 5 pﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ exp 2              ,     (6)
                 (2ps1 )                 2s21
                                                                                     E[wk wTk ] 5 Q,

into Eq. (2) for F1 and r1 produces, after a series of al-                            E[vk vTk ] 5 R ,                        (10)
gebraic multiplications (Liang 2014, 2008),
                                                                where Q is the process noise covariance and R is the
                             s                                  measurement noise covariance. Just as in previous
                       T2/1 5 12 a12 ,                   (7)    studies, it was found that the estimation of Q and R was
                             s11
                                                                quite difficult, especially for Q (Berg et al. 2014; Odelson
where sij is derived by solving Eq. (4). The parameters f,      et al. 2006; Saha et al. 2011; Mohan et al. 2015), due to
A, and B can be estimated through maximum likelihood            our inability to observe the process being estimated.
estimation; with them, the information flow from X2 to          Since the computation of the causality is based on
X1 can be obtained in terms of covariances (Liang 2014):        sample covariances, it is very important to ensure that the
                                                                estimated covariances are very accurate. Therefore, we
                      C12 2C12 C1,d1 1 C11 C1,d1                do not assume them to be constant in time, but we com-
            T2/1 5                               ,       (8)
                      C11   C11 C22 2 C122
                                                                pute them for each time step since in reality, they will not
                                                                remain constant but change. A common practice, which is
where Cij is the sample covariance between Xi and Xj,           adopted here, is they are first obtained offline (outside of
Ci,dj the covariance between Xi and Xdj and a derived           the Kalman filter iteration) for each time step; the ob-
series from Xj using the formula Xdj 5 [Xj(t 1 kDt) 2           tained results are then used for further computations in
Xj(t)]/(kDt), where Dt is the time step size, and k some        the iteration process as seen in Eqs. (12) and (14).
integer; see Liang (2014) for further details. Likewise,          An updating equation is used to compute an a pos-
the information flow from X1 to X2 can be obtained by           teriori state xk, an estimate that is a linear combination
switching the indices:                                          of the weighted difference between the measurement
                                                                prediction Hxk and an actual measurement yk, and an a
                      C21 2C21 C2,d2 1 C22 C1,d2
            T1/2 5                               ,              priori x2k . Combining the a priori estimate and the
                      C22   C22 C11 2 C212
                                                                measurement data, we write xk as

                                                                                xk 5 x2              2
                                                                                      k 1 Kk (yk 2 Hxk ) .                    (11)
b. Kalman filter
  From the above Eq. (8), estimating the causality in-            The statistically optimal Kalman gain Kk is calculated
vokes an assumption of time stationarity for the com-           to use in the correction stage. It minimizes the risk (loss)
putation of the covariances. To tackle the challenge of         of the estimate error covariance, defined as P 5 E[eeT],
computing a time-varying causality based on Eq. (2)             which is the value of expectation of the squared mag-
and, particularly, its linear version [Eq. (7)] as rigorously   nitude of the posterior state estimation error. The Kal-
established by Liang (2008), a Kalman filter is em-             man gain is computed as in the following:
ployed. The main goal of using this Kalman filter ap-                                                       21
proach is to estimate the required covariances at each                        Kk 5 P2      2 T
                                                                                    k H (HPk H 1 R)
                                                                                       T
                                                                                                                 .            (12)
time step. Many studies have used the Kalman filter to
obtain covariance estimates (e.g., Asl and Pourtakdoust         Hence, the updated P becomes the solution to the
2007; Gonzalez et al. 2014). A Kalman filter includes two       equation below, using the characteristics of the mea-
parts: the estimation part, which calculates the state          surement noise in Eq. (9):
estimate x, and the gain part, which computes the co-                              Pk 5 (1 2 Kk H)P2
                                                                                                   k .                        (13)
variance of the state P.
  The standard Kalman filter is formulated with a linear        The following projection equations of the state estimate
stochastic system, shown here as                                x and covariance P are used in the prediction stage,
                xk 5 Axk21 1 Buk 1 wk21 ,                                         x2
                                                                                   k 5 Axk21 1 Buk ,
                                                                                                                              (14)
                yk 5 Hxk 1 vk ,                          (9)                      P2
                                                                                   k 5 APk21 A 1 Qk .
                                                                                              T




                                                                                           Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                      HAGAN ET AL.                                                             7525

   Within the gain loop of the standard Kalman filter, the       process, the covariance is estimated as shown in the
Kalman gain, which is an error correction feedback of            previous equations. The formalism is referred to as
the estimation loop, is estimated. An accurate gain,             TvLK throughout the rest of this paper.
therefore, provides accurate estimations of the state
parameter from round-off errors, a priori and noise es-          c. The TvLK framework
timation errors. Since no feedback exists in the gain               The algorithm begins with an offline computation of
loop, it results in unchecked accumulated computer               the process and measurement noise covariances, Q and
round-off errors from the state variance–covariance              R, respectively. This is because it is expected that in
computation, which happens to be a parameter of im-              practice, Q and R would change with each time step. The
portance to this study. This creates numerical in-               filter then starts off with the computation of the Kalman
stabilities and imprecision within the Kalman (optimal)          gain K through to the updated covariance matrix P, at
filtering process. Several studies have been committed           each time step, which is where the causality is computed.
to solving these problems, and decomposition of the              At the measurement and temporal updates, the Bierman
covariance matrix (the process of breaking down a ma-            and Thornton algorithms are applied to make the
trix or its expression into an equivalent product of fac-        computation more stable. This process is iterated
tors) has been proposed as direction to solving the above        through all the time steps. Because of the ability of the
mentioned problem (Roncero 2014; Sastry 1971).                   Kalman filter to detect change, it is expected that in
   Several methods of decomposition are available                using it to estimate the Liang–Kleeman causality, im-
from numerous studies (Bellantoni and Dodge 1967;                mediate changes along time will be preserved. As a
Gonzalez et al. 2014; Roncero 2014; Thornton 1976). In           learning algorithm the Kalman filter estimations are
this study, we employ the Bierman–Thornton algorithm             expected to improve along time when applied to the
(see appendix A), which uses modified Cholesky factors           formalism. It should be noted that several experiments
of the state variance–covariance matrix, since the               with this formalism have shown that obtaining an ac-
modified Cholesky decomposition has been found to be             curate result is highly dependent on the offline compu-
more robust than the classical one (Maoudj et al. 2013).         tation of Q and R. A detailed diagrammatic scheme of
It is acts as a square root filter, though it does not use any   the framework of the TvLK is given in appendix B.
square root operations in its implementation. However,
its ability to compute positive definite matrices, which         d. Wavelet transforms
have a triangular matrix square root property, makes it             The wavelet transform is mainly used to decompose a
an optimal choice.                                               signal into parts with different frequencies. Here, the
   The LK causality formalism, as seen in Eq. (8), in-           continuous wavelet form is used as a postprocessing tool
volves sample covariances, which are usually directly            to decompose the output of the TvLK estimates to
computed from given time series. We here are about to            obtain a multi-time-scale causal structure as a distribu-
estimate the covariances with our newly preferred esti-          tion of time and frequency. This is especially important
mation methodology, that is, the square root Kalman              in instances where separated signals of a coupled system
filter based on the Bierman–Thornton algorithm (Bierman          are found to occur within the same period in a time-
and Thornton 1976). In this way, Eq. (8) and its converse        varying distribution. The continuous wavelet is defined
direction become                                                 as the convolution of xn with a translated and scaled
                                                                 version of
                      P12 2P12 P1,d1 1 P11 P2,d1
            T2/1t 5                              ,                                     N51
                                                                                                  [(n0 2 n) dt]
                      P11   P11 P22 2 P212                                    Wn (s) 5 å xn0 c*                 ,              (16)
                                                                                       n0 50            s
                      P21 2P21 P2,d2 1 P22 P1,d2
            T1/2t 5                              .       (15)
                      P22   P22 P11 2 P221                       where xn is a discrete sequence, c0(h) is a wavelet
                                                                 function, h is a nondimensional ‘‘time’’ parameter, the
where P is the resulting covariance matrix at each time          (*) symbolizes the complex conjugate, wavelet scale s
step of the iteration [Pk 5 (1 2 Kk Hk )(U2  2 2T
                                          k Dk Uk )]. We         and localized time index s. The obtained wavelet trans-
provide two formalisms of this time-varying causality,           form [Wn(s)] is also complex, which can be divided into
both based on the Bierman–Thornton algorithm, but in             the real and imaginary parts.
the second case, the transition matrix functions in                It is expected that by applying this to the time-varying
Eq. (9) are first determined by fitting an autoregressive        causality, it will become possible to visualize the sepa-
model to the data and performing a Kalman filter on it.          rated causality signals over a multiscale time-frequency
Once they are determined through an iteration of this            distribution. Following Torrence and Compo (1998), the




                                                                                           Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7526                                             JOURNAL OF CLIMATE                                                     VOLUME 32

significance level of 5% is computed for each case using       generated at the frequency of about 0.2 Hz. This is in-
Monte Carlo simulations. There are several types of            tended to verify if the TFvLK formulism can correctly
wavelet functions in use, including the most common            determine the directed influences at the predefined
ones, Morlet, Paul, and difference of Gaussian (DoG)           frequencies. The conceptual mode of this synthetic
functions. While the Morlet and Paul are complex               model is shown in Fig. 1a.
functions, the DoGs are real. The choice of a wavelet             In Figs. 1b and 2b, the blue (T2/1) and the green
function is left to the user’s discretion. Readers are re-     (T1/2) lines represent the time-varying information
ferred to Torrence and Compo (1998) for a guide to             flow signals of the two-way interaction generated, while
using the transform and its different available functions.     the red (sig2/1) and pink (sig1/2) lines represent the
We use the bump wavelet as part of the wavelet package         significant test values to determine the standard error
of MATLAB, in this study. A detailed description can           for each time step.1 Causality is inferred here if the ab-
be found in Vialatte et al. (2009). The proposed for-          solute value of the green line exceeds that of the pink,
malism with the wavelet decomposition is termed                and or the absolute value of the blue line exceeds that of
TFvLK hereafter. It is important to state that this is         the red line. In the first half of the entire time period in
simply the TvLK formalism with a spectral analysis ex-         Fig. 1b, the derived T1/2 is seen to exceed sig1/2, while
tension. A summary and flow diagram of the calculation         the absolute value of T2/1 remains significantly less
procedure is given in appendix B.                              than sig2/1. Consequently, a one-way causality, in-
                                                               dicating that x1 is causal to x2 but x2 is noncausal to x1,
                                                               can be inferred as seen in the first half of the entire time
3. Simulation studies
                                                               period in Fig. 1a. In the second half, the reverse is ob-
   Numerical experiments are here conducted in order to        served. While T2/1 is consistently larger than sig2/1,
assess if the proposed TvLK and TFvLK formalisms can           T1/2 remains significantly less than sig1/2. Here, the
properly determine the directed interactions. For this         obtained results imply that x2 is causal to x1 but x1 is
purpose, two synthetic models are generated from nu-           noncausal to x2. These results are consistent with the
merical simulations. The specific aims of these synthetic      predefined causal structure of the conceptual model
model tests are to verify 1) if the proposed TvLK for-         described by Eq. (17) and shown in Fig. 1a, and suggest
malism based on Kalman filter can correctly reproduce          that the TvLK formalism has the capability to determine
the predefined time-varying causal structure, and 2) if        the time-varying causality within the given time series in
this causal structure can be determined within the pre-        this simple time-varying model. The missing data at the
defined frequencies when decomposed into the time-             beginning of T1/2 and T2/1 are as a result of the offline
frequency domain by means of wavelet transform.                estimation of the process and measurement noise co-
Based on the theory of Liang–Kleeman information               variance (details can be found in appendix B). Since the
flow, the unit of derived causality is in nats per time.       Kalman filter is in essence a learning algorithm, a suffi-
                                                               cient amount of data is initially needed for robust esti-
a. Synthetic model 1
                                                               mations of these parameters. The T1/2 and T2/1 in the
                                                               time domain are then subjected to the Morlet wavelet
           x1 (t) 5 0:36x1 (t 2 1) 2 0:41x1 (t 2 2)            transform so that they can be decomposed into the fre-
                                                               quency domains. The derived time-frequency repre-
                   1 c2/1 (t)x2 (t 2 1) 1 e1 (t) ,
                                                               sentations of the directed influences between x1 and x2
           x2 (t) 5 0:36x2 (t 2 1) 2 0:41x2 (t 2 2)            are shown in Fig. 1c. Significance tests are conducted at
                   1 c1/2 (t)x1 (t 2 1) 1 e2 (t) ,     (17)    5% level using Monte Carlo simulations as suggested by
                                                               Torrence and Compo (1998). There appears to be a
We first consider a bivariate autoregressive process of        significant T1/2 signal for the first half period, and sig-
X 5 [x1 , x2 ], as described in Eq. (17). The time series x1   nificant T2/1 signal for the second half period. These
and x2 have the same length of 1000 time points with           signals are both obtained at the frequency band of
added white noise of zero means and unit variance e1(t)        0.2 Hz, as predefined in the synthetic model. It is,
and e2(t), respectively. c2/1 is a strength factor that in-
dicates the influences of x2 on x1; and c1/2 is a strength
                                                                 1
factor that indicates the influences of x1 on x2. Both c1/2        Since the information flow signals do not represent relative
and c2/1 are nonstationary along time. For 0 , t , 500,        values, both negative and positive information flow results can be
                                                               obtained. As such, we multiply the significant test results (which
c2/1, is set to be 0 and c1/2 is set to be 2; for 500 ,        are always positive) by 21 as well to determine whether or not the
t ,1000, c2/1, is set to 2 and c1/2 is set to 0. By nu-        information flow computed exceeds the significant test results. This
merical control, the time series x1 and x2 are both            explains why the red and pink lines are symmetric about the x axis.




                                                                                             Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                          HAGAN ET AL.                                                                    7527




            FIG. 1. (a) The conceptual synthetic model of the bivariate process as described in Eq. (17); (b) results of the time-
          varying coupling strengths (nats per unit time) (T1/2 and T2/1) at a 1% significance level (sig1/2, sig2/1), and
          (c) the time-frequency domain representations at a 5% significance level.


therefore, concluded that the TFvLK formulism is ca-                   same time are rather frequent. However, these may, in
pable of correctly determining the timing and the fre-                 most cases, occur at different frequencies. Figure 2a
quency of the directed influences in the given simple                  shows a conceptual form of this synthetic model as
conceptual model. Furthermore, significant signals in                  should be obtained from the generated time series:
both Figs. 1b and 1c show quite similar magnitudes,
implying the same strengths of influences as predefined.                           x1 (t) 5 0:39x1 (t 2 1) 2 0:461x1 (t 2 2)
These results are encouraging and provide a sense of
                                                                                            1 c2/1 (t)x2 (t 2 1) 1 e1 (t) ,
confidence for future applications.
                                                                                   x2 (t) 5 0:75x2 (t 2 1) 2 0:3017x2 (t 2 2)
b. Synthetic model 2
                                                                                            1 c1/2 (t)x1 (t 2 1) 1 e2 (t) ,               (18)
   In the climate system, the interactions among differ-
ent components may occur at different frequencies. It is                  Applying the TvLK to the generated time series
thus of interest to determine if the proposed TFvLK                    shows that it is able to yield the expected time-varying
formalism can disentangle the interactions at different                results of nil causalities in the first part of the time period
frequencies. Following the first synthetic model, again                since the information flow signals T1/2 and T2/1 are
we generate a bivariate autoregressive process of                      less than the significant values. On the other hand, mu-
X 5 [x1 , x2 ] as described in Eq. (18). In this case, for 0 ,         tual causalities are observed in the second part of the
t , 550, both c1/2 and c2/1 are set to 0, so that neither              time period as both information flow signals are statis-
x1 nor x2 is causal to the other. For 550 , t , 1000, c2/1,            tically significant. Additionally, the expected different
is set to 0.95 and c1/2 is set to 0.45. By numerical con-              coupling strengths (Fig. 2b), at 1% significance level in
trol, the causality of T1/2 is set to occur at 0.1 Hz and              the second time period, are observed between the two
that of T2/1 is set to occur at 0.2 Hz. Within the climate             coupling signals. While T1/2 shows a smaller magnitude
system, the chances of finding mutual causality at the                 of causality, T2/1 shows a much higher magnitude as




                                                                                                      Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7528                                              JOURNAL OF CLIMATE                                                             VOLUME 32




           FIG. 2. (a) The conceptual synthetic model of the bivariate process as described in Eq. (18); (b) results of the time-
         varying coupling strengths (nats per unit time) (T1/2 and T2/1) at a 1% significance level (sig1/2, sig2/1), and
         (c) the time-frequency domain representations at a 5% significance level.


predefined in the bivariate model and depicted in                     Soil moisture is essential in the land–atmosphere in-
Fig. 2b. This implies that the obtained TFvLK estimates               teractions. It partitions the available energy into latent
have been able to satisfy the requirements of causal di-              heat for evaporation and sensible heat for air tempera-
rection and magnitudes in this simulation. Decomposing                ture increase (Seneviratne et al. 2010). While soil
T1/2 and T2/1 into the time-frequency distributions                   moisture may also affect the subsequent precipitation
using the Bump wavelet transform shows that T1/2                      (Taylor et al. 2012; Tuttle and Salvucci 2015), it is also
occur around 0.1 Hz and T2/1 occur around a frequency                 found to have considerable impacts on air temperature,
of 0.2 Hz. It can also be observed from Fig. 2c that the              especially on the short- to medium-term occurrence of
different magnitudes of coupling strengths are also very              heat waves (Miralles et al. 2012, 2014).
well captured in the time-frequency domain.                              The territory of China features a complex topography
                                                                      and a diverse climate. In East China, the climate is
                                                                      dominated by the East Asian monsoon system, leading
4. Applications in land–atmosphere interactions
                                                                      to cold and dry winters as well as warm and wet sum-
  The previous section has shown the potential of the                 mers. Generally, the rainy season starts in May and lasts
TvLK and TFvLK algorithms to capture the causality                    until October in Southeast China, and it starts in July
when the causal directions and magnitudes are known.                  and lasts until August in the northwest of China. Con-
The data in the real world may present scenarios that are             sequently, the soil moisture patterns exhibits large spa-
rather more complex and chaotic and more difficult to                 tial and temporal variations (Parinussa et al. 2017).
analyze. We apply here the proposed algorithms to soil                Studies have indicated the theoretical relations between
moisture and near surface air temperature coupling in                 soil moisture and air temperature; with limited soil
China. We aim to understand their performances in                     moisture, evaporative cooling decreases, which leads
disentangling the direct interactions between the top                 to a rise in air temperature, and rising air temperature
layer soil moisture and the overlaying air temperature.               results in increased atmospheric demand of water vapor




                                                                                                      Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                        HAGAN ET AL.                                                                 7529

                                                                    in East China, which is a transitional climate zone be-
                                                                    tween dry and wet climates; however, RB is located in
                                                                    South China, where it features a rather wet climate with
                                                                    significant precipitation. In recent years, there is more
                                                                    and more evidence from numerical simulations (Fischer
                                                                    et al. 2007) and diagnosis analysis (Casagrande et al.
                                                                    2015; Miralles et al. 2012) that a significant impact of soil
                                                                    moisture on air temperature is most likely to occur in the
                                                                    transitional climate regimes. Therefore, we expect to
                                                                    find more significant signals of soil moisture impact in
                                                                    RA rather than RB. Daily data of volumetric soil mois-
                                                                    ture and 2-m air temperature from the European Centre
                                                                    for Medium-Range Weather Forecasts (ECMWF) ERA-
                                                                    Interim are used. The data are gridded at a horizontal
  FIG. 3. An overview of the study area, mainland China. RA         resolution of 0.258 and span from January 2012 to De-
represents a partly wet–partly dry climate region while RB repre-   cember 2015. All interpretations are limited to the two
sents a wet climate region.
                                                                    parameters of the coupling.
                                                                       Figures 4 and 5 show the soil moisture–temperature
and thereby further reduced soil moisture (e.g., Seneviratne        information flow in the time-varying and time-frequency
et al. 2010). However, such relations may vary through              domain over RA and RB. The significance tests of each
space and time.                                                     pixel in the selected regions are computed at a 5% sig-
  We selected two regions in China for further study                nificance level. Here, the black solid lines present the
that are denoted as RA and RB in Fig. 3. RA is located              mean of the information flow of all the individual pixels




             FIG. 4. Information flow between soil moisture and air temperature for RA. (a) The time-varying information
          flow from soil moisture to air temperature and (b) the time-varying information flow from air temperature to soil
          moisture. Causality is implied where the absolute value of the information flow signals (shown in blue shades and
          the black solid line) exceed the absolute values of the significance results computed based on Eq. (C1) (shown
          in red shades and red solid lines). The frequency distribution of (c) causality from soil moisture to air temper-
          ature and (d) the causality from air temperature to soil moisture. All the significance tests were done at a 5%
          significance level.




                                                                                                 Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7530                                             JOURNAL OF CLIMATE                                                          VOLUME 32




             FIG. 5. Information flow between soil moisture and air temperature for RB. (a) Time-varying information flow
          from soil moisture to air temperature and (b) the time-varying information flow from air temperature to soil
          moisture. Causality is implied where the absolute value of the information flow signals (shown in blue shades and
          the black solid line) exceed the absolute values of the significance results computed based on Eq. (C1) (shown
          in red shades and red solid lines). The frequency distribution of (c) causality from soil moisture to air tem-
          perature and (d) the causality from air temperature to soil moisture. All the significance tests were done at a 5%
          significance level.


in the selected regions (RA in Fig. 4 and RB in Fig. 5),            soils are generally thawed out, especially within the top
and the blue shades represent the standard deviation of             soil layer. Sensible heat, therefore, becomes a very im-
all the computed information flow of the individual                 portant factor within the interaction of the land and
pixels in the selected region from the mean (black solid            atmosphere, so that evaporation over time gradually
line). Similarly, the solid red line is the mean significance       increases. Soil moisture, thus, regulates the near surface
test values for all the pixels, and the shaded parts are the        temperature, keeping it generally cool. With a high de-
standard deviation from this mean. Causality is implied             mand of soil moisture for evapotranspiration its availabil-
when the absolute values of the blue shades and black               ity makes it a significant controlling factor. This makes
solid lines exceed the red shades and the red solid                 Tsoilmoisture/airtemperature more significant than the in-
lines. The multiyear mean of the 4 years, 2012–15, is here          formation flow from air temperature to soil moisture (here
used to derive the seasonal variability. No preprocessing           after referred to as Tairtemperature/soilmoisture) (Fig. 4b).
of the datasets was done before computing the in-                      The Tairtemperature/soilmoisture (Fig. 4b) of this interaction
formation flow results. Figure 4a shows the time-varying            over the region is observed to be relatively insignificant
information flow results from soil moisture to air temper-          throughout the year. These separated signals of the in-
ature (hereafter referred to as Tsoilmoisture/airtemperature).      teraction are in agreement with the current understanding
It can be seen that while Tsoilmoisture/airtemperature is not       of land surface atmosphere interactions. To verify that the
significant for most parts of the year in this region,              causalities of the separated signals occurring in the same
a statistically significant signal occurs in spring. This           period of time are not the result of statistical pitfalls, their
implies that soil moisture has a significant feedback on            frequency distributions are also plotted in Figs. 4c and 4d.
air temperature in spring. Hence, soil moisture may                 Applying the wavelet transform to obtain the time-
provide some information to predict or forecast the                 frequency distributions of both signals clearly reveals
variability of air temperature over the region. During              that they occur at different time scales, with the latter
spring, temperatures are rising relatively fast and frozen          occurring on a shorter periodicity than the former. The




                                                                                                  Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                        HAGAN ET AL.                                                             7531

significant parts of Tsoilmoisture/airtemperature are ob-           the year. With reduced temperatures in autumn, yet
served to occur at larger time scales in Fig. 4c, beginning         sufficient moisture in the soil, air temperature becomes
from the start of spring and persisting into the early              the main controlling factor in the region and constrains
periods of summer. It is important to keep in mind that             the magnitude and rate of evapotranspiration. It is
the coarse spatial and temporal resolution makes it more            worth emphasizing that the results of the time-varying
difficult to obtain finer signals of significance. According        information flow used here are not qualitatively based,
to Fig. 4d, if any level of Tairtemperature/soilmoisture is to be   but importantly, quantitatively, in nats day21. As such,
significant, it would be found to occur at shorter time             the magnitude of the signals can provide very good in-
scales between 3 and 30 days’ periodicity in midspring.             sights for future predictive capability.
These results are, however, in very good agreement with
previous studies (e.g., Seneviratne et al. 2010). The soil
                                                                    5. Discussion
moisture to air temperature causality is here found to be
stronger than the air temperature to soil moisture cau-                Information flow has long been recognized to be
sality signal. An advantage of the TvLK formalism is                logically associated with causality and is hence ideal for
that it is able to capture abrupt changes in the in-                understanding the cause–effect relationship within in-
teractions over time since it does not smooth the time              teractions (Liang 2008, 2016); it quantifies the exchange
series estimation. Of course, since the Kalman filter is a          of information between two systems or events, showing
learning algorithm, the results improve along time, as              both the direction and magnitude within a cause–effect
also seen in the synthetic model figures in the previous            relation (Hlavácková-Schindler et al. 2007). Recently it
section.                                                            has been reported that it actually can be rigorously de-
   Figure 5 presents the information flow results over the          rived from first principles within the context of sto-
southeastern part of China (RB). This region is consid-             chastic dynamical systems (Liang 2008, 2016). Our
ered to be mostly wet; however, due to its position, it             ability to assess these qualities (magnitude, direction,
also receives sufficient enough solar radiation, thus also          and time variation) of causality in the interactions be-
has a significant air temperature variability. A critical           tween events gives us a better insight into the behavior
overview of both Figs. 5a and 5b also suggests that there           of the system and hence its predictive capability. Fur-
is a distinct time lag between the two signals. Figure 5a           thermore, our ability to rank interactions based on
demonstrates that Tsoilmoisture/airtemperature leads the            magnitudes is crucial in extreme event research as well
coupling from late winter to early spring as expected.              as for a better understanding of a natural systems. This is
This period finds the region drier, but with significantly          exceedingly useful in different fields like meteorology,
high air and soil temperatures, yet much less rainfall. As          climatology, finance, and game theory.
such, the beginning of the year presents the region as a               In Eq. (15), the square root Kalman filter is used to
soil-moisture-limited regime, causing soil moisture to              estimate the information flow rate in a coupling to de-
constrain evaporation. The wavelet decomposition in                 termine their direct causal structures. The Kalman filter
Fig. 5c also sheds more light onto the interaction and              as a learning algorithm is able to identify immedi-
shows that the signal significantly occurs between 4- and           ate changes when tracking the time-varying causality
30-day cycles of late winter and early spring.                      within a system. Previous studies have successfully in-
   Figure 5b shows the other side of the coupling in this           tegrated the Kalman filter into time-invariant formal-
region. From the wavelet analysis in Fig. 5d, we may say            isms to obtain time-varying structures (Omidvarnia
that the direct causal structures within the coupling are           et al. 2011; Punales 2011). Havlicek et al. (2010) also
well separated. The periods of late spring and early to             integrated the Kalman filter into the generalized par-
midsummer indicate strong signals in both the time-                 tial directed coherence (GPDC) to obtain a dynamic
varying and time-frequency distributions. While the                 Granger causality formalism to analyze causality both
Tsoilmoisture/airtemperature is strongest over shorter time         along frequency and time. Both the theoretical tests and
scales, Tairtemperature/soilmoisture is strongest over longer       application of their Kalman filter-based formalism
time scales. Of course, these are findings as interpreted           showed significant improvements of the time-invariant
from the ERA datasets, and as such the uncertainties                GPDC. Fundamentally, interactions between any two
within the assimilation data will surely impact the in-             events may vary with time; and as such, a time-invariant
teractions. However, the results are in very good                   formalism does not offer a faithful representation of the
agreement with current understanding of soil moisture               evolution of the interactions. Here, we use the Kalman
climate interactions (Seneviratne et al. 2010). As it is            filter to estimate the covariances at each time step in
considered to be an energy-limited region, air temper-              Eq. (8) to obtain a time-varying structure as seen in
ature is seen to be the controlling factor in most parts of         Eq. (15) (TvLK).




                                                                                             Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7532                                       JOURNAL OF CLIMATE                                                      VOLUME 32

   We have established that the TvLK [Eq. (15)] is able      established through the numerical experiments that in a
to obtain a rigorous quantitative measure of their causal    coupled system, the TvLK is able to detect an un-
structure just as its time-invariant formalism [Eq. (8)].    ambiguous one-way feedback relationship, which is es-
The formalism that results in Eq. (8) has already been       sential for establishing a causal relation. In addition,
tested in both deterministic and stochastic systems          where a two-way causality does not occur within the
(Liang 2016) and has been successfully applied to a va-      same period of time, we assume the absence of a sta-
riety of applications for interaction studies. These rig-    tistical pitfall. Second, since a knowledge of the tem-
orous properties are clear in the TvLK, and thus offer       poral scale (frequency) of causality between any two
much potential. Other methodologies like the Granger         variables is essential to verifying the presence of the
causality, directed coherence, and the directed transfer     influence of a third variable, we extend the work flow of
functions, which use vector autoregressive models for        the TvLK to include a frequency decomposition. Using
their parameter estimations require stationary residuals     the continuous wavelet, we showed in the same synthetic
that could lead to different kinds of erroneous out-         model experiments that the significant causalities really
comes. However, the TvLK is able to handle both sta-         do occur at their preset frequencies. This becomes even
tionary and nonstationary conditions, and thus, offers       more important when the separated feedback signals
advantages for wider application. Dhamala et al. (2008)      tend to have a similar time-varying structure, so that we
identified that the parametric Granger causality tech-       can verify the absence of a statistical pitfall by identi-
niques were better suited for low-order autoregression       fying if the causal relations occur at different tempo-
(AR) processes than for data that required high-order        ral scales. This is difficult to identify just by observing
AR models. The wavelet-based Granger causality               the information flow time series. However, a time-
(Dhamala et al. 2008) that was proposed in the same          frequency distribution is able to shed more light on the
study, though nonparametric, is computationally ex-          different temporal scales of causality. This is clearly
pensive because it has to be applied to multiple re-         demonstrated in the application section of this study.
alizations. While the accuracy of this formalism relies      The results of the synthetic model experiments thus
heavily on a number of analyzed realizations, the TvLK       show that the TvLK does meet all the requirements
has been shown in the above synthetic models that one        expected of it for a reliable application. It is important to
realization is able to offer the needed information for a    note that the TvLK formalism is developed to in-
proper causality analysis. This is of great importance       vestigate the direct relationship within an n-dimensional
because real-world observations are usually taken once       system, and as such may not be readily applicable to
from a single source, and thus, may offer only one time      investigate partial (or conditional) causal relationships.
series to capture the evolution of an event. Another         This is, however, set for future studies in line with this
important advantage of the original causality formalism      current one.
in Liang (2014, 2016), and thus, the TvLK is that they are      To understand how all these properties of the TvLK
very easy to compute since they do not require AR            would perform in a real-world application, section 4 has
modeling, but are composed of covariances for compu-         demonstrated an application in the soil moisture–air tem-
tation of causality.                                         perature interaction over selected regions in China based
   Section 3 has shown that the principle of nil causality   on the first volumetric soil water layer (representing soil
(Liang 2014, 2016) is detectable by the TvLK, which is       moisture) and the 2-m air temperature. ERA-Interim
not easily identified in some commonly used classical        dataset is based on an assimilation scheme that considers
causal inference approaches. In their work, Orlowsky         the relationship between soil moisture and temperature
and Seneviratne (2010) showed with a statistical feed-       based on the classical hydrological framework for defining
back parameter, the empirical feedback analysis, that        evapotranspiration regimes as a function of soil moisture.
covariability, although necessary, may not be sufficient     This means we can expect the embedded causalities
to imply a causal relation between two variables. This, of   within the time series. Tsoilmoisture/airtemperature was
course, holds for other different measures such as lagged    found to be the more significant one over the partly wet–
or partial correlation, Granger causality and regression     partly dry Huabei region. Conversely, over the Huanan
analysis. They showed that a third variable might be the     region in Southeast China, Tairtemperature/soilmoisture was
reason for identifying covariability between two vari-       found to be more significant. These results are in
ables. This was illustrated in the same study by demon-      agreement with the current understanding of soil mois-
strating how the influence of sea surface temperatures       ture temperature feedbacks. Applying a spectral analy-
(SST) on precipitation persistence is easily mistaken for    sis to these results showed that the different signals
the impact of soil moisture on precipitation. This sta-      occurred at different temporal scales. Over the Huabei
tistical pitfall is here tackled in two ways. First, we      region, T soilmoisture/airtemperature was stronger and




                                                                                        Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                     HAGAN ET AL.                                                            7533

occurred at longer time scales. The converse was found          been developed to allow the user to choose to use either
over the Huanan region.                                         of the forms of the filter.
   A very significant point worth mentioning here is that         The Bierman–Thornton (UD filtering) methodology
the very rigorous and nice properties found in the Liang        includes two main parts: the Bierman algorithm to
formalism [Eq. (8)] [as stated in Liang (2014, 2016)] are       update the observations (or measurements) of the U
found to hold in the TvLK as well. This certainly would         and D modified Cholesky factors of the covariance
make this a preferable choice to transfer entropy and the       matrix P, where U is a unit upper triangular matrix and
Granger tests in many instances, as proven (Liang 2016).        the D is a diagonal matrix. This gives P in the form P 5
Another important property, which is noteworthy of              UDUT. The second part is the Thornton algorithm,
mention, is that Eq. (8) was purposely derived for              which is mainly used for the temporal update of U and
physical systems from nature, which is clearly demon-           D. Following Bierman and Thornton (1976) and its
strated in section 4. Although the only application pre-        references thereof and as stated above, the factored for
sented here is in land–atmosphere interactions, the             of P is given as
TvLK, like the LK, can be applied in other problems in
the natural sciences. It is expected to be especially useful                           P 5 UDUT .                           (A1)
in weather and intraseasonal analyses where causal re-
                                                                Factoring Eq. (13) using Eq. (A1) yields
lations have been suggested to change more quickly and
are difficult to observe more clearly. Beyond the natural          UDUT 5 U2 [D2 2 1/a(D2 U2T a)(D2 U2T a)T ]U2T ,
sciences, it is expected to be equally useful in the areas of
                                                                     1/a 5 Hk P2
                                                                               k Hk ,
                                                                                  T
finance and the social sciences.
                                                                                                                            (A2)
  Acknowledgments. This research was funded by
                                                                where a here is defined as the innovations variance of
National Key Research and Development Program
                                                                the measurement vector and a is defined as an obser-
of China (2017YFA0603701), the National Natural Sci-
                                                                vation coefficient. Let the n vectors of f and v be defined
ence Foundation of China (41875094), the Sino-German
                                                                by
Cooperation Group Project (GZ1447), and the Post-
graduate Research and Practice Innovation Program of
                                                                                        f 5 U2T a,
Jiangsu Province (KYCX17_0889).
                                                                                        v 5 D2 fa,                          (A3)

                                                                and let U and D be the UD factors of D2 2 1/avvT, thus
                     APPENDIX A
                                                                                 UDUT 5 D2 2 1/avvT .                       (A4)
         The Bierman–Thornton Formalism
                                                                Substituting Eq. (A3) into Eq. (A4) gives
   During the development of the Kalman filter in
the last few decades, it was found that the standard                           UDUT 5 (U2 U)D(U2 U)T ,                      (A5)
Kalman filter has the propensity to accumulate nu-
merical errors due to round offs during computa-                and since U and U are unit upper triangular, we obtain
tions. As a result, the filter becomes unstable and             the solutions as
accuracy of its estimation would thus, be compro-
                                                                                    U 5 U2 U ,
mised (Roncero 2014). In this regard, the square root
family of the Kalman filter was developed to handle                                 D 5 D, and                              (A6)
such instabilities, to make the filter more robust; this
                                                                                 P2
                                                                                  k11 5 Ak Pk Ak 1 Qk .
                                                                                               T
                                                                                                                            (A7)
class of the filter has been applied in many studies and
have shown significant advantages (Zhou et al. 2015).
                                                                Substituting the Bierman observation update into
In this study, we make use of the Bierman–Thornton
                                                                Eq. (A7) gives
algorithm with modified Cholesky decomposition
in the measurement and time updates of the filter                             P2 5 Ak (U1 D1 U1 )ATk 1 Qk .                 (A8)
(Fig. A1). This is expected to make the TvLK com-
putation more stable and robust. The comparison of                 A more detailed and complete description of the
the standard Kalman filter and the square root forms are        Bierman–Thornton algorithm is beyond this paper.
beyond the scope of this study, as such, no such experi-        Readers are referred to Grewal and Andrews (2001) and
ments were included. Nonetheless, the algorithm has             its references therein. Table A1 below summarizes the




                                                                                         Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7534                                            JOURNAL OF CLIMATE                                                           VOLUME 32




                             FIG. A1. A framework of the time-frequency varying causality formalism.


difference between the standard Kalman filter and its                that even though the filter is able to produce very reli-
square root framework based on the Bierman–Thornton                  able results, the estimation of the process and mea-
algorithm.                                                           surement noise covariances, Q and R, is rather difficult
                                                                     (Bavdekar et al. 2011; Saha et al. 2011; Mohan et al.
                                                                     2015). It is therefore important to carefully parameter-
                        APPENDIX B                                   ize these variables to obtain a more robust output. A
                                                                     common practice is to set Q and R to be constants,
                                                                     precisely, to be unit matrices. However, in reality, Q and
             The Framework of the TvLK
                                                                     R are expected to change at each time step. The for-
   Many studies have focused on producing accurate                   malism in this study uses a smoothed version of the time
results for the noise covariances, and have been able to             series as a surrogate for the true process state, which is
show that since we are unable to observe the process                 done with EWMA or UWMA to derive Q and R offline
under estimation, Q, the process noise covariance be-                at each time step (shown in Fig. A1). Several experi-
comes even more difficult to determine (Åkesson et al.               ments conducted during this study have also confirmed
2008; Bavdekar et al. 2011; Odelson et al. 2006; Saha                that the Kalman gain is more accurately computed when
et al. 2011). In this study, we employ the use of the ex-            Q and R are properly derived. Given this associative
ponentially weighted moving average (EWMA) and                       property, the formalism presented in this study is some-
unweighted moving average (UWMA) to estimate Q                       what more difficult to derive because of the Kalman
and R offline.                                                       filter. Thus, several tests were required to obtain an
   Although the Kalman filter has received a wide rec-               optimal solution. Because of the square root form of the
ognition and has been shown to provide optimal solu-                 Kalman filter used here, computation is rather expen-
tions where needed, its adaptive parameterization holds              sive. It takes about 3 times the time length to compute,
the greatest challenges. Previous work has identified                as against the traditional causality in Liang (2014). The

                        TABLE A1. A comparison of the standard and square root Kalman filter formalisms.

       Process                       The standard Kalman filter                             The square root Kalman filter
                                                                21                                                          21
Compute Kalman gain                  Kk 5 P2          2 T
                                            k Hk (Hk Pk Hk 1 R)
                                               T
                                                                                 Kk 5 (U2     2 2T            2 2 2T
                                                                                          k Dk Uk )Hk [Hk (Uk Dk Uk )Hk 1 R]
                                                                                                      T                 T

                                           2                2                          2                  2
Updating                             xk 5 xk 1 Kk (yk 2 Hk xk )                  xk 5 xk 1 Kk (yk 2 Hk xk )
Compute updated                      Pk 5 (1 2 Kk Hk )P2k                        (Uk Dk UTk ) 5 (1 2 Kk Hk )(U2  2 2T
                                                                                                              k Dk Uk )
  covariance matrix
Covariance prediction                P2
                                      k11 5 Ak Pk Ak 1 Qk
                                                   T
                                                                                 (U2    2    2T
                                                                                   k11 Dk11 Uk11 ) 5 (Ak Uk )Dk (Uk Ak ) 1 Qk
                                                                                                                  T T




                                                                                                  Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                      HAGAN ET AL.                                                                   7535

EWMA and UWMA chosen in this study were to fa-                                              REFERENCES
cilitate easier computations. Of course, in the use of the        Åkesson, B. M., J. B. Jørgensen, N. K. Poulsen, and S. B.
EWMA and UWMA methods, there is the require-                           Jørgensen, 2008: A generalized autocovariance least-squares
ment of the choice of a lookback window length to                      method for Kalman filter tuning. J. Process Control, 18, 769–
compute the moving average. In an attempt to do this,                  779, https://doi.org/10.1016/j.jprocont.2007.11.003.
an information length of the window length is lost to do          Asl, H. G., and S. H. Pourtakdoust, 2007: UD covariance factor-
                                                                       ization for unscented Kalman filter using sequential mea-
the forward update of the filter. This is seen from the                surements update. Int. J. Aerosp. Mech. Eng., 1, 629–637.
missing data in the time-varying results of the synthetic         Bavdekar, V. A., A. P. Deshpande, and S. C. Patwardhan, 2011:
models in Figs. 1 and 2. An optimal linear smoother is                 Identification of process and measurement noise covariance
suggested by Fraser and Potter (1969) by running the                   for state and parameter estimation using extended Kalman
filter backward using the last estimate of the forward                 filter. J. Process Control, 21, 585–601, https://doi.org/10.1016/
                                                                       j.jprocont.2011.01.001.
recursion of the filter to initialize it, and then combin-
                                                                  Bellantoni, J., and K. Dodge, 1967: A square root formulation of
ing both the forward and backward runs. Using this                     the Kalman-Schmidt filter. AIAA J., 5, 1309–1314, https://
approach of forward and backward runs, which has                       doi.org/10.2514/3.4189.
already been tested in the course of this study, does             Berg, A., B. R. Lintner, K. L. Findell, S. Malyshev, P. C. Loikith,
help to curb the problem of the missing data of the                    and P. Gentine, 2014: Impact of soil moisture–atmosphere
initial time steps of the TvLK result, though it was                   interactions on surface temperature distribution. J. Climate,
                                                                       27, 7976–7993, https://doi.org/10.1175/JCLI-D-13-00591.1.
eventually not adopted. Further studies will look into            Bierman, G. J., and C. L. Thornton, 1976: Numerical comparison of
employing the optimal smoother in the Kalman filter                    discrete Kalman filter algorithms: Orbit determination case
run of this formalism. It can therefore be seen in the                 study. Conf. on Decision and Control/15th Symp. on Adaptive
frequency decomposition of the synthetic model re-                     Processes, Clearwater, FL, IEEE, 859–872.
sults, the missing data of the preceding parts of the             Casagrande, E., B. Mueller, D. G. Miralles, D. Entekhabi, and
                                                                       A. Molini, 2015: Wavelet correlations to reveal multiscale
information flow time series were not used in the
                                                                       coupling in geophysical systems. J. Geophys. Res., 120, 7555–
wavelet decomposition.                                                 7572, http://doi.org/10.1002/2015JD023265.
                                                                  Catalano, F., A. Alessandri, M. D. Felice, Z. Zhu, and R. B.
                                                                       Myneni, 2016: Observationally based analysis of land–
                                                                       atmosphere coupling. Earth Syst. Dyn., 7, 251–266, https://
                                                                       doi.org/10.5194/esd-7-251-2016.
                      APPENDIX C                                  Ciabatta, L., L. Brocca, C. Massari, T. Moramarco, S. Puca,
                                                                       A. Rinollo, S. Gabellani, and W. Wagner, 2015: Integration of
                   Significance Testing                                satellite soil moisture and rainfall observations over the Italian
                                                                       territory. J. Hydrometeor., 16, 1341–1355, https://doi.org/
   For a statistical tool such as in Eq. (8), it is rather             10.1175/JHM-D-14-0108.1.
necessary to do a significance test so as to better un-           Dajcman, S., 2013: Interdependence between some major Euro-
                                                                       pean stock markets—A wavelet lead/lag analysis. Prague
derstand the robustness of the derived result. For this
                                                                       Econ. Pap., 22 (1), 28–49, https://doi.org/10.18267/j.pep.439.
purpose, we use the Fisher information matrix equation            Dhamala, M., G. Rangarajan, and M. Ding, 2008: Analyzing in-
[Eq. (C1)], following Liang (2014), since its inverse gives            formation flow in brain networks with nonparametric granger
obtains a covariance matrix with a given significance                  causality. Neuroimage, 41, 354–362, https://doi.org/10.1016/
level. Liang (2014) suggested that the normally used                   j.neuroimage.2008.02.020.
                                                                  Fischer, E. M., S. I. Seneviratne, P. L. Vidale, D. Lüthi, and
bootstrap method may not hold much simplicity to
                                                                       C. Schär, 2007: Soil moisture–atmosphere interactions during
obtain a good significance level. With a large sample size             the 2003 European summer heat wave. J. Climate, 20, 5081–
N, the information flow approaches a normal distribu-                  5099, https://doi.org/10.1175/JCLI4288.1.
tion around its true value with a variance (c12 /c11 )2 s2a12 ,   Flato, G., J. Marotzke, B. Abiodun, P. Braconnot, S. C. Chou,
which is derived from the maximum likelihood estima-                   W. Collins, and M. Rummukainen, 2013: Evaluation of cli-
tion. Thus, if we denote u^ 5 (f1 , a11 , a12 , b1 ), we obtain        mate models. Climate Change 2013: The Physical Science
                                                                       Basis, T. F. Stocker et al., Eds., Cambridge University Press,
                                                                       741–866.
                       N
                          ›2 logr (Xn11 jXn ; u)
             NIij 5 2 å                          ,       (C1)     Ford, T. W., A. D. Rapp, S. M. Quiring, and J. Blake, 2015: Soil
                      n51        ›ui ›uj                               moisture–precipitation coupling: Observations from the
                                                                       Oklahoma Mesonet and underlying physical mechanisms.
where I in the matrix NI represents the Fisher in-                     Hydrol. Earth Syst. Sci., 19, 3617–3631, https://doi.org/10.5194/
                                                                       hess-19-3617-2015.
formation matrix. The inverse of NI is the covariance
                                                                  Frankingnoul, C., and K. Hasselmann, 1977: Stochastic climate
          ^ which has s2 within. Here, r is the marginal
matrix of u,           a12                                             models, Part II Application to sea-surface temperature
probability of {Xn}, a Markov process. Readers are re-                 anomalies and thermocline variability. Tellus, 29, 289–305,
ferred to Liang (2014) for details of Eq. (C1).                        http://doi.org/10.1111/j.2153-3490.1977.tb00740.x.




                                                                                                 Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
7536                                                   JOURNAL OF CLIMATE                                                              VOLUME 32

Fraser, D., and J. Potter, 1969: The optimum linear smoother                     rainfall. Adv. Water Resour., 74, 44–53, https://doi.org/10.1016/
    as a combination of two optimum linear filters. IEEE                         j.advwatres.2014.08.004
    Trans. Autom. Control, 14, 387–390, https://doi.org/10.1109/            Miralles, D. G., M. J. V. D. Berg, A. J. Teuling, and R. A. M. D.
    TAC.1969.1099196.                                                            Jeu, 2012: Soil moisture-temperature coupling: A multiscale
Ghorbanidehno, H., A. Kokkinaki, J. Yue, E. Darve, and P. K.                     observational analysis. Geophys. Res. Lett., 39, L21707, https://
    Kitanidis, 2015: Real-time data assimilation for large-scale                 doi.org/10.1029/2012GL053703.
    systems: The spectral Kalman filter. Advances in Water Re-              ——, A. J. Teuling, C. C. Heerwaarden, and J. Arellano, 2014:
    sources, Vol. 86, H.-J. Hendricks Franssen and I. Neuweiler,                 Mega-heatwave temperatures due to combined soil desicca-
    Eds., Elsevier, 260–272.                                                     tion and atmospheric heat accumulation. Nat. Geosci., 7, 345–
Gonzalez, R., G. Sutter, C. Sisterna, and H. Patino, 2014: FPGA-                 349, https://doi.org/10.1038/ngeo2141.
    based floating-point UD filter coprocessor for integrated               Mohan, M. S., N. Naik, R. M. O. Gemson, and M. R.
    navigation systems. 2015 Sixth Argentine Conf. on Embedded                   Ananthasayanam, 2015: Introduction to the Kalman filter and
    Systems (CASE), Buenos Aires, Argentina, IEEE, https://                      tuning its statistics for near optimal estimates and Cramer Rao
    doi.org/10.1109/SASE-CASE.2015.7295840.                                      bound. Indian Institute of Technology Kanpur Department of
Granger, C. W. J., 1969: Investigating causal relations by econo-                Electrical Engineering Tech. Rep. TR/EE2015/401, 402 pp.,
    metric models and cross-spectral methods. Econometrica, 37,                  https://arxiv.org/pdf/1503.04313.pdf.
    424–438, https://doi.org/10.2307/1912791.                               Navarra, A., and J. Tribbia, 2005: The coupled manifold. J. Atmos.
——, 1980: Testing for causality: A personal viewpoint. J.                        Sci., 62, 310–330, https://doi.org/10.1175/JAS-3345.1.
    Econ. Dyn. Control, 2, 329–352, https://doi.org/10.1016/0165-           Notaro, M., 2008: Statistical identification of global hot spots in soil
    1889(80)90069-X.                                                             moisture feedbacks among IPCC AR4 models. J. Geophys.
Grewal, M. S., and A. P. Andrews, 2001: Kalman Filtering: Theory                 Res., 113, D09101, https://doi.org/10.1029/2007JD009199.
    and Practice Using MATLAB. Wiley, 401 pp.                               Odelson, B. J., M. R. Rajamani, and J. B. Rawlings, 2006: A new
Guo, Z., and Coauthors, 2006: GLACE: The Global Land–                            autocovariance least-squares method for estimating noise
    Atmosphere Coupling Experiment. Part I: Overview. J. Hydro-                  covariances. Automatica, 42, 303–308, https://doi.org/10.1016/
    meteor., 7, 611–625, https://doi.org/10.1175/JHM511.1.                       j.automatica.2005.09.006.
Havlicek, M., J. Jan, M. Brazdil, and V. D. Calhoun, 2010: Dynamic          Omidvarnia, A. H., M. Mesbah, M. S. Khlif, J. M. O’Toole, P. B.
    Granger causality based on Kalman filter for evaluation of                   Colditz, and B. Boashash, 2011: Kalman filter-based time-
    functional network connectivity in fMRI data. Neuroimage,                    varying cortical connectivity analysis of newborn EEG. 2011
    53, 65–77, https://doi.org/10.1016/j.neuroimage.2010.05.063.                 Annual Int. Conf. of the IEEE Engineering in Medicine and
Hlavácková-Schindler, K., M. Palus, M. Vejmelka, and J. Bhattacharya,          Biology Society, Boston, MA, IEEE, 1423–1426, http://
    2007: Causality detection based on information-theoretic ap-                 doi.org/10.1109/IEMBS.2011.6090335.
    proaches in time series analysis. Phys. Rep., 441 (1), 1–46, https://   Orlowsky, B., and S. I. Seneviratne, 2010: Statistical analyses of
    doi.org/10.1016/j.physrep.2006.12.004.                                       land–atmosphere feedbacks and their possible pitfalls. J. Cli-
Houtekamer, P. L., and F. Zhang, 2016: Review of the ensemble                    mate, 23, 3918–3932, https://doi.org/10.1175/2010JCLI3366.1.
    Kalman filter for atmospheric data assimilation. Mon. Wea. Rev.,        Palus, M., 2014: Cross-scale interactions and information transfer.
    144, 4489–4532, https://doi.org/10.1175/MWR-D-15-0440.1.                     Entropy, 16, 5263–5289, https://doi.org/10.3390/e16105263.
Kiani, M., and S. H. Pourtakdoust, 2014: Adaptive square-root               Papagiannopoulou, C., D. G. Miralles, S. Decubber, M. Demuzere,
    cubature-quadrature Kalman particle filter for satellite attitude            N. E. C. Verhoest, W. A. Dorigo, and W. Waegeman, 2017: A
    determination using vector observations. Acta Astronaut., 105,               non-linear Granger-causality framework to investigate climate–
    109–116, https://doi.org/10.1016/j.actaastro.2014.08.021.                    vegetation dynamics. Geosci. Model Dev., 10, 1945–1960, https://
Koster, R. D., P. A. Dirmeyer, Z. Guo, G. Bonan, E. Chan, P. Cox,                doi.org/10.5194/gmd-10-1945-2017.
    and T. Yamada, 2004: Regions of strong coupling between soil            Papana, A., C. Kyrtsou, D. Kugiumtzis, and C. Diks, 2016: De-
    moisture and precipitation. Science, 305, 1138–1140, https://                tecting causality in non-stationary time series using partial
    doi.org/10.1126/science.1100217.                                             symbolic transfer entropy: Evidence in financial data. Comput.
Liang, X. S., 2008: Information flow within stochastic dynamical                 Econ., 47, 341–365, https://doi.org/10.1007/s10614-015-9491-x.
    systems. Phys. Rev., 78E, 031113, http://doi.org/10.1103/               Parinussa, R. M., G. Wang, Y. Y. Liu, D. F. T. Hagan, F. Lin, R. der
    PhysRevE.78.031113.                                                          Schalie, and R. A. M. Jeu, 2017: The evaluation of single-
——, 2013: The Liang–Kleeman information flow: Theory and                         sensor surface soil moisture anomalies over the mainland of
    applications. Entropy, 15, 327–360, https://doi.org/10.3390/                 the People’s Republic of China. Remote Sens., 9, 149, http://
    e15010327.                                                                   doi.org/10.3390/rs9020149.
——, 2014: Unraveling the cause–effect relation between time                 Punales, A. G. S., 2011: Time-varying coefficient models and the
    series. Phys. Rev., 90E, 052150, https://doi.org/10.1103/PhysRevE.           Kalman filter. M.S. thesis, Applied Mathematics, Ryerson
    90.052150.                                                                   University, 65 pp., https://digital.library.ryerson.ca/islandora/
——, 2016: Information flow and causality as rigorous notions                     object/RULA%3A2193/datastream/OBJ/download/Time-
    ab initio. Phys. Rev., 94E, 052201, http://doi.org/10.1103/                  Varying_Coefficient_Models_And_The_Kalman_Filter___
    PhysRevE.94.052201.                                                          Applications_To_Hedge_Funds.pdf.
Maoudj, R., L. Fety, and C. Alexandre, 2013: Performance analysis           Roncero, D. F., 2014: A study of QR decomposition and Kalman
    of modified Gram-Schmidt Cholesky implementation. Int.                       filter implementations. M.S. thesis, Signal Processing,
    J. Comput. Digital Syst., 27 (1), 21–27, https://doi.org/10.12785/           School of Electrical Engineering, Kungliga Tekniska
    IJCDS/020103.                                                                Hgskolan, 57 pp., http://kth.diva-portal.org/smash/get/
Massari, C., L. Brocca, T. Moramarco, Y. Tramblay, and J. F. D.                  diva2:808731/FULLTEXT01.pdf.
    Lescot, 2014: Potential of soil moisture observations in                Roundy, J. K., and E. F. Wood, 2015: The attribution of land–
    flood modelling: Estimating initial conditions and correcting                atmosphere interactions on the seasonal predictability of




                                                                                                            Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1 NOVEMBER 2019                                             HAGAN ET AL.                                                                     7537

     drought. J. Hydrometeor., 16, 793–810, https://doi.org/10.1175/      Torrence, C., and G. P. Compo, 1998: A practical guide to wavelet
     JHM-D-14-0121.1.                                                         analysis. Bull. Amer. Meteor. Soc., 79, 61–78, https://doi.org/
Saha, M., B. Goswami, and R. Ghosh, 2011: Two novel costs                     10.1175/1520-0477(1998)079,0061:APGTWA.2.0.CO;2.
     for determining the tuning parameters of the Kalman                  Tuttle, S., and G. Salvucci, 2015: Empirical evidence of contrasting soil
     filter. Department of Instrumentation and Electronics Engineering,       moisture–precipitation feedbacks across the United States. Sci-
     Jadavpur University, 8 pp., https://arxiv.org/pdf/1110.3895.pdf.         ence, 352, 825–828, http://doi.org/10.1126/science.aaa7185.
Saini, R., G. Wang, and J. S. Pal, 2016: Role of soil moisture            Vialatte, F. B., J. Solé-Casals, J. Dauwels, M. Maurice, and
     feedback in the development of extreme summer drought and                A. Cichocki, 2009: Bump time-frequency toolbox: A toolbox
                                                                              for time-frequency oscillatory bursts extraction in electro-
     flood. J. Hydrometeor., 17, 2191–2207, https://doi.org/10.1175/
                                                                              physiological signals. BMC Neurosci., 10, 46, https://doi.org/
     JHM-D-15-0168.1.                                                         10.1186/1471-2202-10-46.
Sastry, V., 1971: Decomposition of the extended Kalman filter.            Wang, Y., T. Zhang, X. Chen, J. Li, and P. Feng, 2017: Spatial and
     IEEE Trans. Autom. Control, 16, 260–261, https://doi.org/                temporal characteristics of droughts in Luanhe River basin.
     10.1109/TAC.1971.1099709.                                                Theor. Appl. Climatol., 131, 1369–1385, http://doi.org/10.1007/
Seneviratne, S. I., T. Corti, E. L. Davin, M. Hirschi, E. B. Jaeger,          s00704-017-2059-z.
     I. Lehner, and A. J. Teuling, 2010: Investigating soil moisture–     Wu, L., and J. Zhang, 2015: The relationship between spring soil
     climate interactions in a changing climate: A review.                    moisture and summer hot extremes over North China. Adv.
     Earth Sci. Rev., 99, 125–161, https://doi.org/10.1016/                   Atmos. Sci., 32, 1660–1668, https://doi.org/10.1007/s00376-015-
     j.earscirev.2010.02.004.                                                 5003-0.
Stéfanon, M., P. Drobinski, F. D’Andrea, C. Lebeaupin-Brossier,           Zhang, J., W. C. Wang, and J. Wei, 2008: Assessing land–
     and S. Bastin, 2014: Soil moisture-temperature feedbacks at              atmosphere coupling using soil moisture from the Global
     meso-scale during summer heat waves over Western Europe.                 Land Data Assimilation System and observational pre-
     Climate Dyn., 42, 1309–1324, https://doi.org/10.1007/s00382-             cipitation. J. Geophys. Res., 113, D17119, https://doi.org/
                                                                              10.1029/2008JD009807.
     013-1794-9.
                                                                          Zhao, W., and A. Li, 2015: A review on land surface processes
Stips, A., D. Macias, C. Coughlan, E. Garcia-Gorriz, and X. S.
                                                                              modelling over complex terrain. Adv. Meteor., 2015, 607181,
     Liang, 2016: On the causal structure between CO2 and global
                                                                              http://doi.org/10.1155/2015/607181.
     temperature. Sci. Rep., 6, 21691, https://doi.org/10.1038/           Zheng, Y., A. Kumar, and D. Niyogi, 2015: Impacts of land–
     srep21691.                                                               atmosphere coupling on regional rainfall and convection.
Taylor, C. M., R. A. M. D. Jeu, F. Guichard, P. P. Harris, and W. A.          Climate Dyn., 44, 2383–2409, https://doi.org/10.1007/s00382-
     Dorigo, 2012: Afternoon rain more likely over drier soils.               014-2442-8.
     Nature, 489, 423–426, https://doi.org/10.1038/nature11377.           Zhou, Y., C. Zhang, Y. Zhang, and J. Zhang, 2015: A new adaptive
Thornton, C. L., 1976: Triangular covariance factorizations for               square-root unscented Kalman filter for nonlinear systems
     Kalman filtering. NASA Tech. Memo. 33-798, 197 pp., https://             with additive noise. Int. J. Aerosp. Eng., 2015, 381478, http://
     ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19770005172.pdf.           doi.org/10.1155/2015/381478.




                                                                                                          Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
