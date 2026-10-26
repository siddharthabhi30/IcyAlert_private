# Full-text extraction

- Title: Estimating Time-Dependent Structures in a Multivariate Causality for Land-Atmosphere Interactions
- Year: 2024
- DOI: https://doi.org/10.1175/JCLI-D-23-0207.1
- PDF source: https://journals.ametsoc.org/downloadpdf/view/journals/clim/37/6/JCLI-D-23-0207.1.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

VOLUME 37                                              JOURNAL OF CLIMATE                                                         15 MARCH 2024


                     Estimating Time-Dependent Structures in a Multivariate Causality for
                                      Land–Atmosphere Interactions

    FEIHONG ZHOU,a DANIEL FIIFI TAWIA HAGAN,a,b GUOJIE WANG,a X. SAN LIANG,c,d SHIJIE LI,a,e,f YUHAO SHAO,a
                                   EMMANUEL YEBOAH,a AND XIKUN WEIa,g
a
    Collaborative Innovation Center on Forecast and Evaluation of Meteorological Disasters, Nanjing University of Information Science and
                                                    Technology, Nanjing, Jiangsu, China
                                 b
                                   Hydro-Climate Extremes Laboratory, Ghent University, Ghent, Belgium
        c
          Department of Atmospheric and Oceanic Sciences, and Institute of Atmospheric Sciences, Fudan University, Shanghai, China
                         d
                           Division of Frontier Research, Southern Marine Laboratory, Zhuhai, Guangdong, China
                  e
                    Department of Remote Sensing, Helmholtz Centre for Environmental Research-UFZ, Leipzig, Germany
                         f
                           Remote Sensing Centre for Earth System Research, Leipzig University, Leipzig, Germany
            g
              Chair of Engineering Hydrology and Water Management, Technical University of Darmstadt, Darmstadt, Germany

                      (Manuscript received 5 April 2023, in ﬁnal form 26 October 2023, accepted 29 December 2023)

         ABSTRACT: The land surface and atmosphere interaction forms an integral part of the climate system. However, this intri-
         cate relationship involves many complicated interactions and feedback effects between multiple variables. As a result, relying
         solely on traditional linear regression analysis and correlation analysis to distinguish between multivariate complex “driver–
         response” relations can be challenging, since they do not have the needed asymmetry to establish causality. The Liang–Kleeman
         (LK) information ﬂow theory provides a strict nonparametric causality measurement for identifying the causality between any
         given time series, and its recent extension from bivariate to multivariate form provides a powerful tool for causal inference in
         complex multivariate systems. However, the multivariate LK information ﬂow also assumes stationarity in time and requires a
         sufﬁciently long time series to ensure statistical sufﬁciency. To remedy this challenge, we rely on the square-root Kalman ﬁlter
         to estimate the time-varying form of the multivariate LK information ﬂow causality. The results from theoretical and real-world
         applications show that the new algorithm provides a valuable tool for characterizing time-varying causal relationships in land–
         atmosphere interactions, even when the time series are short and highly correlated.

          SIGNIFICANCE STATEMENT: Causality in land–atmosphere interactions is generally characterized by seasonal
          and intraseasonal changes that are usually not captured with commonly used approaches, because most approaches as-
          sume the time series are stationary. In this study, we extend the recently proposed multivariate Liang–Kleeman infor-
          mation ﬂow causality (MtvLK) to handle nonstationary systems such as those in land–atmosphere interactions. By
          considering nonstationarity, we aim to unravel time-varying causal structures that are usually masked out in commonly
          used methods. Validating the MtvLK with synthetic models showed that the MtvLK is able to obtain the expected
          causal structures. Furthermore, real-world applications reveal novel ﬁndings of the time-varying causal structures be-
          tween soil moisture, vapor pressure deﬁcit, and the gross primary product.

         KEYWORDS: Atmosphere-land interaction; Soil moisture; Kalman ﬁlters




1. Introduction                                                             waves and droughts (Berg et al. 2016; Ciabatta et al. 2015).
                                                                            They also affect regional convection and precipitation (Tuttle
   Land–atmosphere interactions play a critical role in the
                                                                            and Salvucci 2016), leading to ﬂooding in anomalously wet
climate system, not only as a key component but also as an es-
                                                                            times (Saini et al. 2016). Therefore, a good understanding of
sential driver of terrestrial surface water and energy balance
                                                                            the complex processes involved in land–atmosphere interac-
(Orth and Seneviratne 2017; Seneviratne et al. 2006, 2010).
                                                                            tions is vital in improving the prediction of related extreme
These interactions are characterized by complex couplings
                                                                            events (Lemordant et al. 2016). Although land–atmosphere
and feedbacks between land and atmospheric states and
                                                                            interactions often involve multiple interacting variables, most
complex systems that include various natural processes
                                                                            of the commonly used analysis methods can assess only two
(Schwingshackl et al. 2017). Furthermore, these complex nat-
                                                                            variables at a time, making it difﬁcult to account for the im-
ural processes and interactions play an important role in the
                                                                            pact of confounding variables. In addition, various complex
exchange of energy and water, which sometimes results in
                                                                            natural processes in land–atmosphere interactions usually
amplifying temperature and humidity anomalies (Humphrey
                                                                            vary not only in space (Lintner and Neelin 2009), but also at
et al. 2021; Zhou et al. 2019), exacerbating soil desiccation
                                                                            different time scales ranging from days to months or even
and atmospheric aridity (Zhou et al. 2019), leading to heat
                                                                            years (Baker et al. 2021; Duerinck et al. 2016). It is, therefore,
                                                                            necessary to look beyond bivariate and time-invariable
                                                                            analyses to better understand these complex spatiotemporal
    Corresponding author: Guojie Wang, gwang@nuist.edu.cn                   characteristics.

DOI: 10.1175/JCLI-D-23-0207.1
Ó 2024 American Meteorological Society. This published article is licensed under the terms of the default AMS reuse license. For information regarding
reuse of this content and general copyright information, consult the AMS Copyright Policy (www.ametsoc.org/PUBSReuseLicenses).
                                                                         1853                                Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1854                                               JOURNAL OF CLIMATE                                                          VOLUME 37

    The approaches for quantifying land–atmosphere interactions        (Liang 2016), which is a strict nonparametric causality measure-
include physical and numerical simulation experiments that inter-      ment form for identifying the causality between any given time
vene in the interactions of interest under well-controlled condi-      series. Compared with the GC, LK causality is easier to compute,
tions and using data science methods for causal inference. In          since it only involves the sample covariance of time series. More-
recent years, several data-driven methods have been applied to         over, since it originates from ﬁrst principles and strict mathemati-
time series datasets to estimate potential causal dependencies.        cal derivation, it avoids the false causalities sometimes found in
Traditionally, commonly used approaches are based on correla-          GC test and other statistical forms (Hagan et al. 2019).
tion and regression analysis. For example, Duerinck et al. (2016)         Since its development, the LK causality has been successfully
conducted a correlation-based study on the relationship between        applied to causality studies in climate systems. For instance, Liang
soil moisture and precipitation in Illinois at different time and      (2014) used the method to extrapolate the causality between El
spatial scales. Their results showed a strong positive correlation     Niño and the Indian Ocean dipole (IOD). Stips et al. (2016) used
between the state average soil moisture in late spring/early sum-      this method to study the causality between greenhouse gas emis-
mer and the subsequent state average summer precipitation,             sions and global warming. Bai et al. (2018) also used it to analyze
while no relationship was found at the daily and weekly scales.        the causes of tropical cyclones in the western North Paciﬁc. More
Pal et al. (2020) presented the relationship between soil moisture     recently, Tao et al. (2021) used the LK causality to quantitatively
and boundary layer depths (BLDs) after ﬂooding at two weather          assess the impacts of climate warming, interdecadal oscillations in
scales based on regression analysis, effectively improving the pre-    the Atlantic and Paciﬁc on global precipitation and their regional
diction of extreme events. Although correlation and regression         differences. However, the original form of the LK assumes statio-
analysis may help provide causal inferences, they lack the neces-      narity, therefore, it does not account for the time-dependent
sary asymmetry to provide causal directions in the interactions        changes in land–atmosphere interactions. To deal with this prob-
between the variables under consideration (Fu et al. 2022;             lem, Hagan et al. (2019) extended the Liang causality to a time-
Novick et al. 2016; Wu et al. 2015; Zhang et al. 2021). As a result,   frequency form by combining the Kalman ﬁlter and wavelet anal-
it is difﬁcult to extrapolate the “drive–response” relationship.
                                                                       ysis and applied it to the interaction between soil moisture and air
    The concept of causal inference originated in the early twenti-
                                                                       temperature over China, providing a new tool for studying tem-
eth century (Wright 1921) and since then several studies have at-
                                                                       poral causal structures in land–atmosphere interactions. However,
tempted to quantify it. Granger (1969) used a statistical prediction
                                                                       the approach presented by Hagan et al. (2019) is restricted to cau-
formalism to quantify causal relations. The Granger causality
                                                                       sality between only two variables and does not consider the ef-
(GC) assumes that for two time series X and Y, X Granger-causes
                                                                       fects of potential confounding variables. Therefore, seeking a
Y if the conditional variance of Y decreases when the knowledge
                                                                       causality analysis method that can address nonstationarity in the
of the past X is provided (Granger 1969). GC has become one of
                                                                       multivariate causality analysis is of paramount importance for the
the most used tools for causal discoveries between time series and
                                                                       study of land–atmospheric interactions.
has consistently been modiﬁed to expand its applications in several
                                                                          Recently, Liang (2021) extended the LK causality to multivari-
ﬁelds, including climate science. For instance, Detto et al. (2012)
                                                                       ate time series causality and causal graph reconstruction, al-
proposed a conditional GC analysis framework, which can elimi-
                                                                       though the time series are also assumed to be stationary. Liang
nate the inﬂuence of external forcing and separate the inherent
                                                                       et al. (2021) successfully used this method to obtain accurate
periodic coupling signals of regional eco-climate systems. Green
                                                                       forecasts of El Niño Modoki 10 years in advance. Docquier et al.
et al. (2017) used this approach to study vegetation–atmosphere
feedback mechanism and found that the local feedback mecha-            (2022) used this method to analyze the effects of several potential
nism could explain about 30% of surface net radiation and precip-      climate drivers on Arctic sea ice area and volume, and the re-
itation variance. Papagiannopoulou et al. (2017a,b) developed and      verse effects of sea ice area and volume on these drivers. Hagan
applied a nonlinear multivariate Granger causality approach to         et al. (2022) successfully applied it to analyze confounding im-
study the relationship between global vegetation and climate fac-      pacts of soil moisture and vegetation on the causal structure of
tors and found that water was the main controlling factor of           CO2 emissions and near-surface mean air temperature couplings
vegetation anomalies, while radiation and temperature had little       for multiple future scenarios of the climate system. Moreover,
inﬂuence.                                                              this theory and methodology, albeit originally born from
    Beyond the GC methods, information theory (IT) has been            atmosphere–ocean–climate science, has been widely applied in
demonstrated to be a rigorous alternative for identifying and          other disciplines such as quantum mechanics (Yi and Bose 2022)
quantifying causality (Goodwell et al. 2020). Since IT measures        and neuroscience (Cong et al. 2023). These studies demonstrate
are based on probability distribution functions (pdfs), they can       the usefulness of the multivariate LK causality in practical appli-
capture linear and nonlinear relationships between variables. In       cations. Therefore, this study combines the multivariate LK cau-
addition, IT-based methods can be reliably extended to quantify        sality with the Kalman ﬁlter to provide a new statistical tool for
causal relationships between more than two variables (Goodwell         estimating the time-varying causalities in multivariate land–
et al. 2020). IT-based methods thus provide a framework within         atmosphere interactions. The rest of the paper is structured as
which causality can be considered in Earth system science, provid-     follows: section 2 describes the formalism, section 3 validates the
ing a more powerful tool for studying complex causal relationships     formalism with synthetic models, and section 4 applies it to a
in land–atmosphere interactions. In recent times, Liang (2014)         real-world case study of vegetation–climate interactions in China.
proposed a new causality analysis method based on information          Section 5 presents a summary and discussion of the proposed
ﬂow theory, namely the Liang–Kleeman (LK) information ﬂow              method and its potential applications.




                                                                                                     Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                                                ZHOU ET AL.                                                                                              1855

2. The multivariate time-varying causal inference                                    are constant, the maximal likelihood estimator (mle) is the
                                                                                     least squares solution of the following N algebraic equations:
a. Estimation of information flow and causality in
   multivariate time series                                                                              d
                                                                                                       ∑ a1j xj (n) 5 ẋ 1 (n), n 5 1, …, N                                            (4)
   Liang (2016) observed that causality is a real physical no-                                        j51
tion, which can be deduced and quantiﬁed by the concept of
Liang–Kleeman information ﬂow (LKIF). Liang (2021) real-                             where Ẋ i,n 5 (Xi,n1k 2 Xi,n )/(kDt) is the Euler forward
ized the causality analysis of multivariate information ﬂow                          differencing approximation of dXi /dt, [where k is an integer
based on a rigorous derivation and explicit formulas for multi-                      and k $ 1; k 5 1 should be set in most of the time to ensure
dimensional information ﬂow has been obtained in a closed                            accuracy, except in some cases of deterministic chaos when
form with both deterministic and stochastic systems. The fol-                        the sampling at the highest resolution needs to be chosen
lowing brieﬂy introduces the derivation process of multivari-                        (k 5 2); Dt is the time step size]. Following the procedure in
ate information ﬂow method.                                                          Liang (2014) the least squares solution of (a11, … , a1d),
   Consider a d-dimensional continuous-time stochastic sys-                          (â 11 , …, â 1d ), satisﬁes the algebraic equation
tem for X 5 (X1, … , Xd)
                                                                                                   ⎡⎢⎢⎢ C1,1             …          C1,y ⎤⎥⎥⎥⎥⎡⎢⎢⎢ â 11 ⎥⎤⎥⎥ ⎡⎢⎢⎢⎢ C1,d1 ⎥⎤⎥⎥⎥
                                                                                                      ⎢⎢⎢                                    ⎥⎥⎥⎢⎢⎢         ⎥⎥⎥ ⎢⎢            ⎥⎥⎥
                                                                                                        ⎢⎢⎢                                    ⎥⎢             ⎥ ⎢⎢              ⎥
                    dX 5 F(X, t)dt 1 B(X, t)dW                                 (1)                        ⎢⎢⎢ .
                                                                                                            ⎢⎢⎢ ..           ..      .. ⎥⎥⎥⎥⎥⎢⎢⎢⎢⎢ .. ⎥⎥⎥⎥⎥ 5 ⎢⎢⎢⎢⎢ .. ⎥⎥⎥⎥⎥,
                                                                                                              ⎢⎢⎢             .       . ⎥⎥⎥⎥⎢⎢⎢⎢ . ⎥⎥⎥⎥ ⎢⎢⎢⎢ . ⎥⎥⎥⎥                    (5)
                                                                                                                ⎢⎢⎢                            ⎥⎥⎥⎢⎢⎢         ⎥⎥⎥ ⎢⎢            ⎥⎥⎥
                                                                                                                                                    ⎢           ⎥ ⎢
where F may be arbitrary nonlinear functions of X and t, W is
                                                                                                              y ,1
                                                                                                                  ⎢⎣ C   …          Cy ,y ⎥⎥⎦⎢⎣ â 1y ⎥⎦ ⎢⎢⎣ Cy ,d1 ⎥⎥⎦
a vector of standard Wiener processes, and B is the matrix of
perturbation amplitudes. The rate of information ﬂowing
                                                                                               cij 5 1/N∑n51 [xi (n) 2 x i ][xj (n) 2 x j ]
                                                                                                                         N
from Xj to Xi (in nats per unit time) proves to be                                   where                                                    and ci,dj 5
                                                                                         ∑
                                                                                          N
                                                                                 1/N n51 [xi (n) 2 x i ][ẋ j (n) 2 ẋ j ] are the sample covariances.
                   ­(Fi r )                     ­2 (gii r )
             1            j             1 1               j
                                                                                                                         ∑
                                                                                                                   d
 Tj"i 5 2E                   dx         1 E                   dx                     Here, â 12 5 (1/detC) j51 D2j Cj,d1 , where Dij are the cofac-
             ri Rd22 ­xi        i j    2 ri Rd22 ­x2i          i j
                                                                                     tors. Based on Eq. (3), the information ﬂow from X2 to X1
                        ­(Fi r )                         ­2 (gii r )
                               j      1                            j               when considering the inﬂuence of X3, X4, X5, … , Xd on
      5 2 rj|i (xj |xi )          dx 1      rj|i (xj |xi )             dx;
           Rd              ­xi         2 Rd                    ­x2i                  the d-dimensional system is
                                                                               (2)                                                             d
                                                                                                                                          1              C
                                                                                                   T2"1|3,4,5,…,d 5                           ∑ D2j Cj,d1 12 ,                         (6)
where dx            signiﬁes dx1, … , dxi21dxi11, … , dxj21dxj11, … ,                                                                    detC j51        C11
              i j
dxd, E is the mathematical expectation, gii 5 ∑k51| bik bik , ri 5
                                                       d

ri(xi) is the marginal probability density function                                  where detC is the determinant of the covariance matrix C, and
                                                           (pdf) of                 Cj,d1 is the sample covariance between xj and the derived series
Xi, rj|i is the pdf of Xj conditioned on Xi, and r 5 r(x)dxj.
                                                      j                             ẋ 1 . In this case, when d 5 2, Eq. (6) can be easily reduced to
   In Eq. (1), in the case of linear systems where F(X, t) 5 AX,
A 5 (aij), Eq. (2) becomes quite simple (Liang 2016):
                                                                                                                                  C11 C12 C2,d1 2 C212 C1,d1
                                                       sij                                              T2"1 5                                                                 ;       (7)
                                                                                                                                     C211 C22 2 C11 C212
                                Tj"i 5 aij                   ;                 (3)
                                                       sii
                                                                                     which is obtained in Liang (2014) and frequently used in
where aij is the (i, j)th entry of A, and sij is the population co-                  applications, such as Stips et al. (2016), Bai et al. (2018) and
variance between Xi and Xj.                                                          Tao et al. (2021).
  Since Eq. (3) is challenging to use in practical applications,
                                                                                     b. Kalman filter
we need to obtain a practically applicable formula by estimat-
ing Eq. (3). Suppose that the d time series are all equally                             The Kalman ﬁlter is a time domain ﬁltering algorithm,
spaced (xi, i 5 1, … , d) and all having N data points [xi(n),                       which takes the minimum mean square error as the best esti-
n 5 1, 2, … , N], with F(X, t) 5 AX, A 5 (aij) being a d 3 d                         mation criterion (Kalman 1960). As a learning algorithm, the
matrix, and                                                                          equations for the Kalman ﬁlter fall into two groups: time up-
                                                                                     date equations and measurement update equations. The time
                                ⎢⎡⎢⎢ b            0          0 ⎥⎤⎥⎥⎥
                                   ⎢⎢⎢ 1                           ⎥⎥⎥               update equations are responsible for obtaining the a priori es-
                                     ⎢⎢⎢                             ⎥⎥⎥
                                       ⎢          ..
                         B 5 ⎢⎢⎢⎢ 0                    .     0 ⎥⎥⎥⎥⎥
                                                                       ⎥             timates for the next step by projecting the current state and
                                       ⎢⎢⎢                             ⎥⎥⎥           error covariance forward. The measurement update equations
                                         ⎢⎢⎢                             ⎥
                                           ⎢⎣ 0   0          bd ⎥⎦                   are responsible for obtaining an improved a posteriori esti-
                                                                                     mate modiﬁed by combining the latest observation informa-
being a d 3 d diagonal matrix. We take an example of esti-                           tion and the prediction information of the current moment
mating information ﬂow from x2 to x1 in a d-dimensional sys-                         (Kalman 1960). So the time update equations can be thought
tem (T2"1|3,4,5 … d). First, we need to estimate aij before                          of as predictor equations and the measurement update equa-
estimating T2"1; Liang (2014) indicated that when aij and bi                         tions can be considered corrector equations (Kalman 1960).




                                                                                                                                         Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1856                                                JOURNAL OF CLIMATE                                                            VOLUME 37

Because the Kalman ﬁlter can identify immediate changes,               5) Deﬁne a posteriori estimate errors as ek 5 xk 2 x̂ k , and the
this would become advantageous when tracking time-varying                 a posteriori estimate error covariance is Pk 5 E[ek ? eTk ], so
causality within a system (Havlicek et al. 2010; Punales 2011).           the equation of update error covariance at time step k is
Therefore, we use the Kalman ﬁlter to estimate the time-varying
information ﬂow based on Eq. (6) to estimate the multivariate                                Pk 5 (1 2 Kk H)P2
                                                                                                             k:                            (15)
time-varying causality formalism based on the Liang–Kleeman
information ﬂow. The standard Kalman ﬁlter is formulated with          Since the calculation of causality by the LKIF is mainly based
a linear stochastic system:                                            on the covariance between samples, it is vital to accurately esti-
                  xk 5 Axk21 1 Buk 1 wk21 ,                     (8)    mate the covariance between the samples. The multivariate
                                                                       time-varying causality formalism based on the LKIF is realized
                   yk 5 Hxk 1 vk ,                              (9)    by computing the sample covariance with the resulting covari-
                                                                       ance of each time step estimated by Kalman ﬁlter. However, it is
where x and y are the system state and measurement vectors,            usually difﬁcult to calculate the process noise covariance Q and
and u is the input vector. The parameter A is the system states        the measurement noise covariance R (Berg et al. 2014); most
transition matrix, B is the input matrix, and H is the measure-        current studies assume them as constants. However, Q and R
ment matrix. Also, w and v are zero mean process and mea-              may change at each time step in practice, thus, we do not assume
surement noise, respectively, assumed to be independent of             they are constants here. Our approach is to ﬁrst use the expo-
each other, with normal probability distributions, and meets           nential weighted moving average (EWMA) and unweighted
the criteria of the following equations:                               moving average (UWMA) to estimate Q and R ofﬂine, and then
                                                                       apply the obtained results to the iteration process of Kalman ﬁl-
                                             Q, i 5 k                  ter, as shown in Eqs. (12) and (13).
              E[wk ] 5 0, E[wk wTi ] 5
                                             0, i Þ k                     In addition, according to Eqs. (11)–(15), it can be seen that
                                                                       the standard Kalman ﬁlter essentially uses the Kalman gain Kk
                                             R, i 5 k
               E[vk ] 5 0,    E[vk vTi ] 5                             to weighted average estimates and measurements of yk to im-
                                             0, i Þ k
                                                                       prove the accuracy of the measurement, which determines the
            E[wk vTi ] 5 0,                                    (10)    weighted component of the measurement when estimating the
                                                                       state estimates. Therefore, an accurate calculation of Kk is fun-
where E represents the expectation, Q is the covariance ma-            damental to improve the accuracy of the calculation. However,
trix of the process noise wk, and R is the covariance matrix of        correction of the accumulated computational round-off errors
the measurement noise vk.                                              from the state variance-covariance computation was done. This
   When the system satisﬁes Eqs. (8) and (9), the estimation           is because no feedback existed in the gain loop, creating numer-
of each time can be obtained by the Kalman ﬁlter recursive             ical imprecision within the Kalman ﬁltering process. To remedy
formula. The speciﬁc procedures are as follows:                        this study, we employed the Bierman–Thornton algorithm
1) According to the state estimates at time step k 2 1, project        (Bierman and Thornton 1977), which uses modiﬁed Cholesky
   the state at time step k by the following equation:                 factors of the state variance–covariance matrix. The detailed de-
                                                                       scription of this algorithm can be found in Hagan et al. (2019).
                       x̂ 2
                          k 5 Ax̂ k21 1 Buk ,                  (11)    This study uses the square root Kalman ﬁlter based on the
                                                                       Bierman–Thornton algorithm to realize the multivariate time-
   where x̂ 2
            k are the state estimates at time step k and x̂ k21        varying LKIF causality formalism.
   are the state estimates at time step k 2 1.
                                                   2
2) Deﬁne a priori estimate errors as e2
                                      k 5 xk 2 x̂ k , and the a pri-   c. The multivariate time-varying causality formalism
   ori estimate error covariance is P2k  5 E[e 2
                                               k ? e 2T
                                                     k ], so we can       based on the Liang–Kleeman information flow
   project the error covariance at time step k by the equation:
                                                                         The algorithm begins with the computation of the process
                     P2
                      k 5 APk21 A 1 Qk ,
                                 T
                                                               (12)    and measurement of noise covariances Q and R respectively.
                                                                       From there, the ﬁlter starts by calculating the Kalman gain K
   where P2
          k are the error covariance estimates at time step k          through the updated covariance matrix P at each time step.
   and Pk21 are the error covariance estimates at time step k 2 1.     This step is used to compute the causality. The Bierman and
3) Update the Kalman gain at time step k:                              Thornton algorithms are used at the measurement and tem-
                                        21                             poral updates to make the calculation more stable. In this
                  K k 5 P2      2 T
                         k H (HPk H 1 R) :
                            T
                                                               (13)
                                                                       way, Eq. (6) can be rewritten as

4) The below equations are used to update the state esti-                                                1
                                                                                                              j51
                                                                                                                       P12
   mates with measurement yk and the Kalman gain Kk at                              Tt2"1|3,4,5,…,d 5       ∑ Ḋ P         ,               (16)
                                                                                                        detP d 2j j,d1 P11
   time step k:
                                                                       where P is the resulting covariance matrix at each time step of
                   x    ^2
                   ^k 5 x k 1 Kk (yk 2 H^
                                          2
                                        x k ):                 (14)    the iteration, Ḋ ij are the cofactors of the matrix P 5 (Pij), and




                                                                                                        Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                          ZHOU ET AL.                                                                   1857




                                                 FIG. 1. The framework of MtvLK.


Pj,d1 are the resulting covariance between Xj and the derived      a. Synthetic model 1
series Ẋ 1 .
                                                                     In land–atmosphere interactions, causal relationships between
   Since the EMWA and UWMA require choice of a look-
                                                                   variables often vary over time instead of remaining constant, as
back window length to compute the moving average before
                                                                   exempliﬁed by the impact of soil moisture on temperature in the
estimating Q and R ofﬂine, an information length of the win-
                                                                   Chinese region (Hagan et al. 2019). The ﬁndings of Hagan et al.
dow length is lost to do the forward update of the ﬁlter. We
                                                                   (2019) indicate that in humid areas of China, the inﬂuence of soil
propose an effective solution to the problem; the details are
                                                                   moisture on temperature is mostly nonsigniﬁcant throughout the
given in appendix B. The formalism is henceforth referred to
                                                                   year, except for a signiﬁcant statistical signal during the spring
as MtvLK (multivariate time-varying Liang–Kleeman infor-           season. Moreover, the information ﬂow between soil mois-
mation ﬂow) and will be used throughout the rest of this pa-       ture and temperature in spring exhibits a trend of initial in-
per; the framework of MtvLK is shown in Fig. 1. In addition,       crease followed by a subsequent decrease. Drawing upon the
it is particularly important to note that when there are only      varying causal relationships observed in this case, we have
two variables in the system, MtvLK will be the same as the         designed the following synthetic model that incorporates
framework proposed by Hagan et al. (2019).                         multiple variables:

3. Simulation studies                                                  ⎪
                                                                       ⎧
                                                                       ⎪
                                                                       ⎪ x1 (t) 5 0:35x1 (t 2 1) 1 c2"1 (t)x2 (t 2 1) 1 «1 (t)
                                                                       ⎪
                                                                       ⎪
                                                                       ⎨
   To verify the reliability of MtvLK, we set up three idealized       ⎪ x2 (t) 5 0:35x2 (t 2 1) 1 c1"2 (t)x1 (t 2 1) 1 «2 (t) :      (17)
                                                                       ⎪
                                                                       ⎪
experiments with known causalities to examine how well the             ⎪
                                                                       ⎪
                                                                       ⎩ x (t) 5 0:35x (t 2 1) 1 c (t)x (t 2 1) 1 « (t)
                                                                          3            3            2"3     2            3
information ﬂow of the MtvLK captures the preset causal
structures. The LKIF in this study is measured in nats per unit    The ﬁrst synthetic model is a ternary autoregressive process
time.                                                              of X 5 [x1, x2, x3], as described in Eq. (17). The time series




                                                                                                   Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1858                                              JOURNAL OF CLIMATE                                                             VOLUME 37

x1, x2, and x3 have the same length of 2000 time points with          ofﬂine estimation of Q and R. The choice of this window length
added white noise of zero means and unit variance «1(t), «2(t),       can be tailored to meet the speciﬁc requirements of the experi-
and «3(t). Note that c2"1 and c1"2 represent the inﬂuence of          ment. In this synthetic test, we opted for a window length of 300
x2 on x1 and that of x1 on x2, while c2"3 represents the inﬂu-        to facilitate our investigation. Consequently, the depicted re-
ence of x2 on x3. For 0 , t # 500 and 1500 , t # 2000, all the        sults in Fig. 2 indicate that when causalities change, a relatively
causalities are set to be 0. For 500 , t # 1500, all the causali-     brief time step is required for the transition to occur, with the
ties are gradually increased from 0 to 0.5, with an increment         maximum value being attained at approximately t 5 1200 in-
of 0.001 per time step when 500 , t # 1000, and all the causal-       stead of t 5 1000. Figures 2e and 2f are the absolute value of
ities are gradually decreased from 0.5 to 0, with a decrement         the time-varying information ﬂows from x2 to x1 (|Tx2"x1|) and
of 0.001 per time step when 1000 , t # 1500. Thus, in this sys-       x2 to x1 inﬂuenced by x3 (|Tx2"x1|x3|), respectively. The results in
tem, when 0 , t # 500 and 1500 , t # 2000, no causality ex-           the two ﬁgures also show that x2 inﬂuences x1 for 500 , t #
ists among x1, x2, and x3. When 500 , t # 1500, causalities           1500, and an insigniﬁcant inﬂuence of x3 in the multivariate case
exist between x1 and x2 and from x2 to x3. The full causal            (Fig. 2f). Figures 2g and 2h show the absolute value of the time-
structure of Eq. (17) is shown in Figs. 2a and 2b. In Figs. 2c–j,     varying information ﬂow from x2 to x3 (|Tx2"x3|) and that of x2
the blue lines show the realization averages of the absolute          to x3 inﬂuenced by x1 (|Tx2"x3|x1|). Again, the results in the two
value of time-varying information ﬂows, while the red lines           ﬁgures are identical and point to the negligible inﬂuence of x1 in
are the signiﬁcant values realizations at a 1% signiﬁcance            the multivariate case (Fig. 2h). Finally, Figs. 2i and 2j are the
level. We infer causality when the absolute information ﬂow           absolute value of the time-varying information ﬂow from x1 to
values are greater than the signiﬁcant values. All the results        x3 (|Tx1"x3|) and that of x1 to x3 inﬂuenced by x2 (|Tx1"x3|x2|).
are the average of the absolute values of 1000 realizations at a      Both results correctly show that there are no causalities for
1% signiﬁcance level.                                                 0 , t # 500 and 1500 , t # 2000. However, |Tx1"x3|x2| also
   Figures 2c–j are the ensemble means of the time-varying in-        shows no causalities for 500 , t # 1500 (Fig. 2j) while |Tx1"x3|
formation ﬂow results (in nats per unit time). We added two           shows signiﬁcant causalities. These results might suggest that
dashed lines in the ﬁgure at the causal relationship turning          |Tx1"x3| interprets the continuous information ﬂow from x1 to
points of t 5 500 and t 5 1500 for a more intuitive display.          x2, and then x2 to x3 as a potential causal link (|Tx1"x3|) when
Additionally, it is worth noting that to more clearly depict the      the confounding variable x2 is not considered (Fig. 2i). All of
causal relationships each subplot focuses on, we have added a         the ﬁndings above exhibit a high degree of consistency with the
small schematic at the top of each one. In these schematics,          predetermined causal structure established in this synthetic
the blue variables indicate a variable whose role is being con-       model. Moreover, the temporal depiction of causation strength
sidered within the system, while the gray variables signify           effectively captures the dynamics of causal relationships over
those whose roles are not currently being considered. Yellow          time.
solid arrows represent predeﬁned causal relationships that               Additionally, we conducted the same test on all links that
have not been tested yet, whereas red solid arrows denote             did not preset causality, with the results as shown in Fig. C1
those predeﬁned causal relationships currently under testing.         (appendix C). Examining the ﬁgure, we can clearly see that
Gray solid arrows pointing toward gray variables indicate             |Tx3"x1|x2| and |Tx3"x2|x1| shows no causalities for 0 , t # 500
causal relationships that are not being considered in the sys-        and 1500 , t # 2000. In addition, although |Tx3"x1|x2| and
tem at present. Meanwhile, red dashed arrows signify causal           |Tx3"x2|x1| exhibit a tendency to initially rise and then decline
relationships that are currently being tested but were not            for 500 , t # 1500, both |Tx3"x1|x2| and |Tx3"x2|x1| still shows
predeﬁned.                                                            no causalities, which means |Tx3"x1|x2| and |Tx3"x2|x1| have no
   The results in Figs. 2c–j are consistent with the predeﬁned        causalities for 0 , t # 2000, which is aligning well with our ini-
causalities in Eq. (17), showing that x1 inﬂuences x2 (Figs. 2c,d)    tial expectations.
and x2 inﬂuences both x1 (Figs. 2e,f) and x3 (Figs. 2g,h) where
500 , t # 1500. Figures 2c and 2d are the absolute value of the       b. Synthetic model 2
time-varying information ﬂows from x1 to x2 (|Tx1"x2|) and x1 to        In complex multivariable systems similar to the land–
x2 inﬂuenced by x3 (|Tx1"x2|x3|), respectively. The results in the    atmosphere interactions, besides the case of homologous inﬂu-
two ﬁgures show that x1 inﬂuences x2 for 500 , t # 1500, the          ences as in synthetic model 1, there are also many cases where
causal intensity exhibits an initial increase followed by a subse-    several variables inﬂuence one variable simultaneously. There-
quent decrease, no causality exists between x1 and x2 when            fore, we generated the following tertiary autoregressive pro-
0 , t # 500 and 1500 , t # 2000, and an insigniﬁcant inﬂuence         cess based on synthetic model 1:
of x3 in the multivariate case (Fig. 2f). It is important to empha-
size that the absolute value of information ﬂow employed in           ⎪
                                                                      ⎧
                                                                      ⎪ x1 (t) 5 0:35x1 (t 2 1) 1 c2"1 (t)x2 (t 2 1) 1 «1 (t)
                                                                      ⎪
                                                                      ⎪
                                                                      ⎪
this study solely serves as a measure of the causal strength be-      ⎨
                                                                      ⎪ x2 (t) 5 0:35x2 (t 2 1) 1 «2 (t)
tween variables. It does not carry any connotations related to        ⎪
                                                                      ⎪
                                                                      ⎪
                                                                      ⎪
                                                                      ⎩ x (t) 5 0:35x (t 2 1) 1 c (t)x (t 2 1) 1 c (t)x (t 2 1) 1 « (t):
positivity or negativity, nor does it imply any other meaning           3           3           1"3     1            2"3     2            3
beyond quantifying the strength of the causal relationship. Fur-                                                                         (18)
thermore, it is crucial to acknowledge that the MtvLK necessi-
tates the selection of a suitable lookback window length for          The process of X 5 [x1, x2, x3], as described in Eq. (18). Here,
computing the moving average, which is subsequently used in           for 0 , t # 500 and 1500 , t # 2000, c2"1, c2"3 and c1"3 are




                                                                                                      Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                             ZHOU ET AL.                                                                       1859




              FIG. 2. (a) Schematic diagram of the conceptual model as described in Eq. (17) when 0 , t # 500 and
           1500 , t # 2000. (b) As in (a), but for interval 500 , t # 1500. Absolute values of the time-varying informa-
           tion ﬂows among x1, x2, and x3 (in nats per unit time): (c) |Tx1"x2| and Sigx1"x2; (d) |Tx1"x2|x3| and Sigx1"x2|x3;
           (e) |Tx2"x1| and Sigx2"x1; (f) |Tx2"x1|x3| and Sigx2"x1|x3; (g) |Tx2"x3| and Sigx2"x3; (h) |Tx2"x3|x1| and Sigx2"x3|x1;
           (i) |Tx1"x3| and Sigx1"x3; (j) |Tx1"x3|x2| and Sigx1"x3|x2. Dashed lines represent the causal relationship turning
           points. All the results are the averages of 1000 realizations, and all the signiﬁcance tests are performed at a
           1% signiﬁcance level.


                                                                                                          Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1860                                                 JOURNAL OF CLIMATE                                                             VOLUME 37

set to be 0; for 500 , t # 1500, all the causalities are gradually        tion ﬂow from x1 to x3 (|Tx1"x3|) and that from x1 to x3 inﬂu-
increased from 0 to 0.5, with an increment of 0.001 per time              enced by x2 (|Tx1"x3|x2|). Both cases reproduce the expected
step when 500 , t # 1000, and all the causalities are gradually           causalities as preset in Eq. (18). These results demonstrate
decreased from 0.5 to 0, with an decrement of 0.001 per                   the reliability of the MtvLK to unravel time-varying causali-
time step when 1000 , t # 1500. Thus, in this system, when                ties even in complex systems.
0 , t # 500 and 1500 , t # 2000, there are no direct causali-                Similar to synthetic model 1, we tested all links that did not
ties among the x1, x2, and x3; and when 500 , t # 1500, x3 is             preset causality in this synthetic model, as shown in Fig. C2
directly inﬂuenced not only by x2 but also by x1. The causality           (appendix C). Figure C2 also shows that |Tx1"x2|x3|, |Tx3"x1|x2|,
among the time series x1, x2, and x3 is shown in Figs. 3a                 and |Tx3"x2|x1| all show no causalities for 0 , t # 500 and
and 3b. Similar to synthetic model 1, the window length of                1500 , t # 2000, and |Tx1"x2|x3|, |Tx3"x1|x2|, and |Tx3"x2|x1| all ex-
300 was also chosen in this synthetic model to facilitate our in-         hibit a tendency to initially rise and then decline for 500 , t #
vestigation. Figures 3c–h are the ensemble means of the abso-             1500, but there are both no causalities for 500 , t # 1500, which
lute value of the time-varying information ﬂows among the x1,             aligns well with our initial expectations too.
x2, and x3 (in nats per unit time). All the results are obtained
at a 1% signiﬁcance level. Figures 3c and 3d shows the abso-
                                                                          c. Synthetic model 3
lute value of the time-varying information ﬂow from x2 to x1
(|Tx2"x1|) and that from x2 to x1 inﬂuenced by x3 (|Tx2"x1|x3|).             Synthetic model 1 and synthetic model 2 primarily focus on
Both approaches show that x3 does not affect the causality                examining the interactions among three variables, and their
from x2 to x1 since there is no preset feedback from x3 to x1             study has successfully demonstrated the reliability of the
or x2. Figures 3e and 3f show the absolute value of the time-             MtvLK method in complex systems. Nevertheless, when in-
varying information ﬂow from x2 to x3 (|Tx2"x3|) and that                 vestigating land–atmosphere interactions, sometimes it be-
from x2 to x3 inﬂuenced by x1 (|Tx2"x3|x1|), for 500 , t # 1500,          comes imperative to account for the inﬂuence resulting from
where we ﬁnd that |Tx2"x3|x1| is lower than |Tx2"x3|, due to the          more than three variables. To address this requirement com-
feedback from x1 (Barrett and Barnett 2013). Finally, Figs. 3g            prehensively, we generated the following ﬁve-level autore-
and 3h show the absolute value of the time-varying informa-               gressive process:



                                 ⎪
                                 ⎧
                                 ⎪
                                 ⎪ x1 (t) 5 0:35x1 (t 2 1) 1 «1 (t)
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪ x2 (t) 5 0:35x2 (t 2 1) 1 c1"2 (t)x1 (t 2 1) 1 «2 (t)
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎨
                                 ⎪ x3 (t) 5 0:35x3 (t 2 1) 1 c2"3 (t)x2 (t 2 1) 1 «3 (t)                      :                              (19)
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪ x4 (t) 5 0:35x4 (t 2 1) 1 c2"4 (t)x2 (t 2 1) 1 c3"4 (t)x3 (t 2 1) 1 «4 (t)
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎪
                                 ⎩ x (t) 5 0:35x (t 2 1) 1 c (t)x (t 2 1) 1 c (t)x (t 2 1) 1 « (t)
                                    5            5            1"5     1            4"5     4            5




The process of X 5 [x1, x2, x3, x4, x5], as described in Eq. (19).        (|Tx1"x5|x2,x3,x4|), from x2 to x3 inﬂuenced by x1, x4, and
For 0 , t # 500, c2"1, c2"3, and c1"3 are set to be 0; for                x5 (|Tx2"x3|x1,x4,x5|), from x2 to x4 inﬂuenced by x1, x3, and x5
500 , t # 1500, all the causalities are gradually increased               (|Tx2"x4|x1,x3,x5|), from x3 to x4 inﬂuenced by x1, x2, and x5
from 0 to 0.5, with an increment of 0.0005 per time step; for             (|Tx3"x4|x1,x2,x5|), and from x4 to x5 inﬂuenced by x1, x2, and x3
1500 , t # 2000, c2"1, c2"3, and c1"3 are set to be 0.5. Thus,            (|Tx4"x5|x1,x2,x3|), respectively. All test results effectively repli-
in this system, when 0 , t # 500, there are no direct causali-            cate the predetermined time-varying causal relationships
ties among the time series x1, x2, x3, x4, and x5 as shown in             within the synthetic model, and the time-varying causal
Fig. 4a; when 500 , t # 2000, causalities exist from x1 to x2, x2         strength among variables consistently aligns with the preset
to x5, x2 to x3, x2 to x4, x3 to x4, and x4 to x5, where x4 is directly   conditions. Consequently, this experiment serves as compel-
inﬂuenced not only by x2 but also by x3, as shown in Fig. 4b, all         ling evidence to afﬁrm the efﬁcacy of MtvLK in complex sys-
the causalities among the variables exhibit an initial gradual            tems involving more than three variables. It demonstrates the
increase, followed by a period of stability where they remain             method’s ability to accurately identify the time-varying causal-
unchanged. Figures 4c–h are the ensemble means of the abso-               ity between variables within multivariate complex systems.
lute value of the time-varying information ﬂows among the x1,                Similar to synthetic model 1 and synthetic model 2, we
x2, x3, x4, and x5 (in nats per unit time). All the results are ob-       tested all links that did not preset causality in this synthetic
tained at a 1% signiﬁcance level. For this synthetic model, we            model; the results are shown in Fig. C3 (appendix C). Figures
have selected a lookback window length of 200 for the experi-             C3c–n demonstrate that no causal relationships were detected
mental. Figures 4c–h show the absolute value of the time-                 for all the links without predeﬁned causality for 0 , t # 2000,
varying information ﬂow from x1 to x2 inﬂuenced by x3, x4, and            These results further prove the accuracy of MtvLK in multi-
x5 (|Tx1"x2|x3,x4,x5|), from x1 to x5 inﬂuenced by x2, x3, and x4         variate complex systems.




                                                                                                          Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                                   ZHOU ET AL.                                                                        1861




            FIG. 3. (a) Schematic diagram of the conceptual model as described in Eq. (18) when 0 , t # 500 and 1500 , t # 2000.
         (b) As in (a), but for the interval 500 , t # 1500. Absolute values of the time-varying information ﬂows among x1, x2, and x3
         (in nats per unit time): (c) |Tx2"x1| and Sigx2"x1; (d) |Tx2"x1|x3| and Sigx2"x1|x3; (e) |Tx2"x3| and Sigx2"x3; (f) |Tx2"x3|x1| and
         Sigx2"x3|x1; (g) |Tx1"x3| and Sigx1"x3; (h) |Tx1"x3|x2| and Sigx1"x3|x2. Dashed lines represent the causal relationship turning points.
         All the results are the averages of 1000 realizations, and all the signiﬁcance tests are performed at a 1% signiﬁcance level.

4. Real applications in land–atmosphere interactions                          climate system (Cui et al. 2020; Feng et al. 2017). Vegetation
                                                                              is part of the terrestrial ecosystem, more speciﬁcally, the ter-
  Vegetation is a life support system for the survival and de-                restrial biosphere (N. Chen et al. 2021; Liu et al. 2022), and in-
velopment of human society. It is a natural link between soil,                ﬂuences the global carbon and water cycle (Liu et al. 2014;
atmosphere, and water, and has complex interactions with the                  Prăvălie 2018) by regulating carbon balance, alleviating the




                                                                                                                 Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1862                                                 JOURNAL OF CLIMATE                                                                   VOLUME 37




         FIG. 4. (a) Schematic diagram of the conceptual model as described in Eq. (19) when 0 , t # 500. (b) As in (a), but
       for the interval 500 , t # 2000. Absolute values of the time-varying information ﬂows among x1, x2, x3, x4, and x5 (in
       nats per unit time): (c) |Tx1"x2|x3,x4,x5| and Sigx1"x2|x3,x4,x5; (d) |Tx1"x5|x2,x3,x4| and Sigx1"x5|x2,x3,x4; (e) |Tx2"x3|x1,x4,x5|
       and Sigx2"x3|x1,x4,x5; (f) |Tx2"x4|x1,x3,x5| and Sigx2"x4|x1,x3,x5; (g) |Tx3"x4|x1,x2,x5| and Sigx3"x4|x1,x2,x5; (h) |Tx4"x5|x1,x2,x3|
       and Sigx4"x5|x1,x2,x3. Dashed lines represent the causal relationship turning points. All the results are the averages of
       1000 realizations, and all the signiﬁcance tests are performed at a 1% signiﬁcance level.




                                                                                                              Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                            ZHOU ET AL.                                                                1863

increase of greenhouse gas concentration, and reducing soil
erosion (Le Quéré et al. 2015; Liu et al. 2017; Melnikova and
Sasai 2020; Wang et al. 2021; You et al. 2020). Gross primary
production (GPP) is a good proxy for reﬂecting vegetation
growth (Liu et al. 2014; Wang et al. 2021). Many studies have
shown that high air temperature and low water availability
can signiﬁcantly inhibit the growth of terrestrial vegetation,
resulting in decreasing GPP (H. Chen et al. 2021; Chen et al.
2020; Liu et al. 2020; Zhang et al. 2019). It has been found
that soil moisture (SM) and vapor pressure deﬁcit (VPD) are
two important driving factors affecting vegetation growth
(Kimm et al. 2020; Novick et al. 2016). Therefore, understand-
ing how SM and VPD impact GPP is essential for understand-
ing global or regional terrestrial carbon cycles and predicting
future climate change.
   In recent years, although the interactions between SM,
VPD, and GPP have been investigated in several studies,
there are uncertainties about which mainly inﬂuences GPP:
SM or VPD. SM affects vegetation growth in many ways. It
not only determines the maximum amount of water that can
be absorbed by plant roots (Sperry et al. 2017) but also affects
stomatal conductance of vegetation canopy (Anderegg et al.
2017; Stocker et al. 2018) and controls carbon allocation dur-
ing vegetation growth (Palacio et al. 2014). Jung et al. (2017)        FIG. 5. The study area. RA represents a wet area and RB a partly
quantiﬁed the impact of temperature, solar radiation, and SM         wet-partly dry climate region.
on GPP based on statistical regression methods and found
that SM was the dominant factor of GPP interannual varia-
                                                                     various direct or indirect causalities. If we analyze the causal
tion. Liu et al. (2020) pointed out that the reduction in SM
                                                                     relationship between only two variables, the inﬂuence of the
caused by global warming accounts for about 70% of the GPP
                                                                     other variables on the system cannot be considered, and the
variability in the world. On the other hand, VPD also signiﬁ-
                                                                     indirect effects cannot be analyzed, leading to incorrect con-
cantly impacts vegetation: high VPD may increase evapo-
                                                                     clusions. For such a complex system, we must consider the in-
transpiration, which induces vegetation to close its stomata
                                                                     ﬂuence of multiple variables on the system simultaneously to
to reduce leaf water loss and inhibit plant photosynthesis
                                                                     analyze the causal relationship accurately. Therefore, in this
(Li et al. 2022; Oren et al. 1999). Along these lines, it has been
proposed that VPD plays a dominant role in inﬂuencing GPP            section, we apply the MtvLK to study the mechanism of SM
(Besnard et al. 2021; Madani et al. 2020; Wang et al. 2014).         and VPD in impacting GPP in China, to understand the direct
Yuan et al. (2019) found that global vegetation had a decreas-       or indirect causal effects of SM and VPD on GPP in China.
ing trend after the 1990s, which was mainly due to the signiﬁ-          The territory of China features a complex topography and
cant increases in VPD, inhibiting vegetation photosynthesis.         a diverse climate. Hagan et al. (2019) selected two typical re-
Madani et al. (2020) pointed out that VPD was replacing tem-         gions, the Huanan region and Huabei region, for their study,
perature as the dominant factor controlling global GPP in re-        as the climate conditions of these two regions are representa-
cent decades because the increase of VPD would lead to               tives of strong land–atmosphere interactions. In this study,
increased vegetation impedance and thus hinder vegetation            these two regions are also selected, as shown as region A
photosynthesis.                                                      (RA) and region B (RB) in Fig. 5. The latitudes and longi-
   Besnard et al. (2021) observed that about 56% of the global       tudes of RA range from 25.58 to 29.58N, and from 113.58 to
vegetation carbon storage is controlled by temperature and           118.58E, respectively. The climate in this region is humid, with
VPD, while the impact of SM accounts for only 29%. Humphrey          signiﬁcant precipitation, representing the humid areas of
et al. (2021) also pointed out that the root cause of the above      China. RB, located between 358–398N and 1118–1168E, on the
controversy is that the inﬂuencing mechanism of climate change       other hand, is a transitional climate zone between dry and wet
on vegetation involves complex land–atmosphere interaction.          climates, representing the semihumid and semiarid regions in
Although SM dominates the interannual variability of GPP, it         China. The GPP we will be using is the ensemble mean of
mainly affects VPD through atmospheric feedback induced by           FLUXCOM GPP, which has been widely used to represent
decreasing soil moisture, and then inhibits vegetation photosyn-     the carbon uptake by land ecosystems (Jung et al. 2017). The
thesis through VPD.                                                  data are gridded at a horizontal resolution of 0.58, spanning
   However, previous studies often ignore the inﬂuence of            from January 1979 to December 2018, which the time resolu-
land–atmosphere interactions caused by changes in SM. The            tion is the monthly time step. They can be downloaded from
above review of the debate indicates that the causal relation-       http://www.ﬂuxcom.org/CF-Download/. Since FLUXCOM GPP
ships among SM, VPD, and GPP are complex, including                  is calculated based on ERA5 meteorological driving data, we




                                                                                                  Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1864                                             JOURNAL OF CLIMATE                                                        VOLUME 37

also use the SM and VPD from ERA5-Land monthly data to              tremendous changes. Also, as we have found in Fig. 6f, this
ensure data consistency (available at https://cds.climate.          causal structure changes with time, where VPD might play a
copernicus.eu). The weighted average of SM between 0 and            mediating role at some time instants (2004, 2010–12), but no
100 cm is used here, with weights determined by the thickness       role is in play in the years when |TSM"GPP|VPD| is insigniﬁcant.
of each layer (0–7, 7–28, 28–100 cm). VPD is estimated with         Nonetheless, it is worth mentioning that, based solely on the
the 2-m air temperature and 2-m dewpoint temperature (Allen         revealed causality, one still can hardly tell the underlying
et al. 1998). Since the time span of the GPP data differs from      mechanism; what one gets are merely the probable outcomes
that for SM and VPD, we select the overlapping period from          resulting from uncertain causes (Liang 2014). Finally, the im-
January 1981 to December 2018. In addition, we calculate            pact of SM on VPD is also found to be insigniﬁcant in Figs. 6g
the monthly anomalies for all variables from January 1981 to        and 6h.
December 2018, by subtracting the climatology from the origi-          Dry anomalies could explain the peaking information ﬂow
nal data.                                                           we have found around 2010 through 2014, when anomalous
   The estimated results may not be accurate enough at the          SM conditions would come into play due to increased atmo-
beginning because the Kalman ﬁlter is a learning algorithm.         spheric demands, which could, in turn, potentially lead to
Hence, we select the 30-yr (360 months) results from January        drought conditions (Figs. 6e,f). Furthermore, during the same
1989 to December 2018, with the initial spinup period re-           period where the SM " GPP causality peaks, we also ﬁnd sig-
moved. In addition, we have selected a lookback window              niﬁcant lows in the VPD " SM causality (Figs. 6a,b). As
length of 90 days for this experiment. Figures 6 and 7 show         noted by Hagan et al. (2019) and Madani et al. (2020), this is
the absolute value of the information ﬂow rates between SM,         characteristic of the region RA.
VPD, and GPP in South China (RA) and North China (RB)                  Next, we analyze the mechanism of how SM and VPD af-
as functions of time from January 1989 to December 2018.            fect GPP in RB. Figures 7a and 7b give the time-varying infor-
The signiﬁcance tests of each pixel in the two regions are com-     mation ﬂow from VPD to SM (|TVPD"SM|) and that from
puted at a 5% signiﬁcance level. The solid blue line shows the      VPD to SM inﬂuenced by GPP (|TVPD"SM|GPP|), respectively.
absolute value of the average information ﬂow of all the indi-
                                                                    Both results show signiﬁcant causalities between 1989 and
vidual pixels in the selected regions, and the solid red line is
                                                                    2018 over the entire period with and without the inﬂuence of
the mean signiﬁcance test values for all the pixels. Causality is
                                                                    VPD, just like that of Figs. 6a and 6b. Similarly, we ﬁnd a de-
implied if the solid blue line is higher than the solid red line.
                                                                    creasing linear trend in these causalities as shown in Figs. 6a
In RA, Figs. 6a and 6b represent the time-varying information
                                                                    and 6b. Shown in Figs. 7c and 7d are the time-varying infor-
ﬂow from VPD to SM (|TVPD"SM|) and that from VPD to SM
                                                                    mation ﬂow from VPD to GPP (|TVPD"GPP|) and that from
inﬂuenced by GPP (|TVPD"SMG|GPP|), respectively. It can be
                                                                    VPD to GPP inﬂuenced by SM (|TVPD"GPP|SM|). Even though
seen that both are almost signiﬁcant during the whole period
                                                                    both are signiﬁcant during the whole period, |TVPD"GPP| is
and the results are almost the same. These results suggest that
                                                                    larger in magnitude than |TVPD"GPP|SM|, with the causal struc-
causality exists from VPD to SM with potentially very little
                                                                    ture similar to that found in synthetic model 2. This hints at
GPP inﬂuence in this region since both results are identical.
                                                                    the existence of potential feedback from SM. Here, we ﬁnd a
These results are identical to the toy model results in Figs. 2c
                                                                    long-term decreasing linear trend in the information ﬂows. In
and 2d where we also found little inﬂuence of the third vari-
                                                                    Figs. 7e and 7f, we see that the information ﬂows from SM to
able. Additionally, we ﬁnd a decreasing trend in the strength
of the causality from VPD to SM, potentially due to global          GPP (|TSM"GPP|) and from SM to GPP inﬂuenced by VPD
warming. Figures 6c and 6d show the time-varying informa-           (|TSM"GPP|VPD|) as functions of time. Clearly both are signiﬁ-
tion ﬂow from VPD to GPP (|TVPD"GPP|) and that from VPD             cant throughout, with |TSM"GPP| larger in magnitude than
to GPP inﬂuenced by SM (|TVPD"GPP|SM|), respectively. Both          |TSM"GPP|VPD|. Just as in Figs. 7c and 7d, the difference in the
are also signiﬁcant most of the time, except between 1998 and       magnitude suggests a feedback from VPD. Previous studies
2004. Figures 6e and 6f represent the time-varying informa-         have shown that both SM and VPD are inﬂuencing factors of
tion ﬂow from SM to GPP (|TSM"GPP|) and that from SM to             GPP in semiarid areas although the sensitivity of GPP to
GPP inﬂuenced by VPD (|TSM"GPP|VPD|), respectively.                 VPD is considered higher than the sensitivity of GPP to SM
Clearly, |TSM"GPP| is barely signiﬁcant before 2004; but after      (Humphrey et al. 2021). Based on Figs. 7c–f, we can conclude
that, the causality increases signiﬁcantly from 2004 to 2015.       that SM and VPD both impact GPP over the entire period. In
However, |TSM"GPP|VPD| is not signiﬁcant for most of the            addition, we also ﬁnd that the information ﬂow from VPD to
time, though it is signiﬁcant in 2004 and around the peak           GPP inﬂuenced by SM is higher than the information ﬂow
causal period of |TSM"GPP| (2010–12). The difference in the         from SM to GPP inﬂuenced by VPD. These results agree well
results might suggest a potential causal structure from SM to       with the relevant research conclusions so far. For instance,
GPP as we have identiﬁed in Fig. 2b. In this region, the cau-       Novick et al. (2016) highlighted the signiﬁcant impact of VPD
sality from SM to GPP might comprise the inﬂuence of VPD            on vegetation ecosystems, surpassing the inﬂuence of tempera-
on SM (as that from x2 to x1 in Fig. 2b) and the inﬂuence of        ture and soil moisture. Similarly, Madani et al. (2020) suggested
VPD on GPP (as that from x2 to x3 in Fig. 2b). As a result,         that VPD has gradually become the dominant factor controlling
when we only consider |TSM"GPP|, we see a similar causality         global GPP in recent decades, with the main mechanism being
as we ﬁnd in Fig. 2i, while if the inﬂuence of VPD is consid-       the increase in vegetation resistance due to elevated VPD,
ered, such as |TSM"GPP|VPD|, the causal structure undergoes         thereby impeding photosynthesis (Fu et al. 2022).




                                                                                                 Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                       ZHOU ET AL.                                                               1865




          FIG. 6. The absolute values of the time-varying information ﬂows among soil moisture (SM), gross primary
        productivity (GPP), and vapor pressure deﬁcit (VPD) (in nats per month) for RA: (a) |TVPD"SM| and SigVPD"SM;
        (b) |TVPD"SM|GPP| and SigVPD"SM|GPP; (c) |TVPD"GPP| and SigVPD"GPP; (d) |TVPD"GPP|SM| and SigVPD"GPP|SM;
        (e) |TSM"GPP| and SigSM"GPP; (f) |TSM"GPP|VPD| and SigSM"GPP|VPD; (g) |TSM"VPD| and SigSM"VPD;
        (h) |TSM"VPD|GPP| and SigSM"VPD|GPP. All the signiﬁcance tests are performed at a 5% signiﬁcance level.




                                                                                            Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1866                                              JOURNAL OF CLIMATE                                                           VOLUME 37




           FIG. 7. The absolute values of the time-varying information ﬂows among soil moisture (SM), gross primary productivity
         (GPP), and vapor pressure deﬁcit (VPD) (in nats per month) for RB: (a) |TVPD"SM| and SigVPD"SM; (b) |TVPD"SM|GPP|
         and SigVPD"SM|GPP; (c) |TVPD"GPP| and SigVPD"GPP; (d) |TVPD"GPP|SM| and SigVPD"GPP|SM; (e) |TSM"GPP| and
         SigSM"GPP; (f) |TSM"GPP|VPD| and SigSM"GPP|VPD. All the signiﬁcance tests are performed at a 5% signiﬁcance level.

  Finally, we have summarized the aforementioned results to           IF, a thicker arrow indicates a larger absolute value of the IF.
facilitate a clearer and more intuitive comparison of the differ-     Figures 8a1–c1 and 8a2–c2 represent the causality between VPD
ences between the two regions. First, the causal relationships        to SM and the causality between VPD to SM inﬂuenced by
among SM, VPD, and GPP in RA are sketched in Fig. 8. We               GPP, respectively. Figures 8d1–f1 and 8d2–f2 represent the cau-
have divided the results from 1989 to 2018 into three segments        sality between VPD to GPP and the causality between VPD to
for presentation, The left, center, and right columns in the ﬁg-      GPP inﬂuenced by SM, respectively. Figures 8g1–i1 and 8g2–i2
ure represent the periods January 1989–December 1998, Janu-           represent the causality between SM to GPP and the causality be-
ary 1999–December 2008, and January 2009–December 2018,               tween SM to GPP inﬂuenced by VPD, respectively.
respectively. The red arrow indicates that the absolute value of         As shown in Figs. 8a1–c1 and 8a2–c2, regardless of whether
the information ﬂow (IF) increases in this time range, and the        the inﬂuence of GPP on the system is considered, the magnitude
blue arrow indicates that the absolute value of the IF decreases.     of causality from VPD to SM generally displays a trend of de-
The thickness of the arrow represents the absolute value of the       creasing from 1989 to 2008 and then increasing from 2009 to




                                                                                                     Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                           ZHOU ET AL.                                                                     1867




                   FIG. 8. A schematic of the time-varying causality among SM, VPD, and GPP for RA. Shown are
                the time periods (left) January 1989–December 1998, (center) January 1999–December 2008, and
                (right) January 2009–December 2018. (a1)–(c1),(a2)–(c2) The causality between VPD to SM and the
                causality between VPD to SM inﬂuenced by GPP, respectively. (d1)–(f1),(d2)–(f2) The causality be-
                tween VPD to GPP and the causality between VPD to GPP inﬂuenced by SM, respectively. (g1)–
                (i1),(g2)–(i2) The causality between SM to GPP and the causality between SM to GPP inﬂuenced by
                VPD, respectively. (j) The causality between SM to GPP in 2004–18 and (k) the change of causality
                when the inﬂuence of VPD is taken into account, and the real causal relationships in 2004–18. The red
                arrow indicates that the absolute value of the IF increases, and the blue arrow indicates that the abso-
                lute value of the IF decreases. The thickness of the arrow represents the absolute value of the informa-
                tion ﬂow.




                                                                                                      Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1868                                              JOURNAL OF CLIMATE                                                          VOLUME 37

2018. Moreover, there is no signiﬁcant difference in the causal       VPD, the magnitude of causality from SM to GPP showed an
strength between the two scenarios. Similarly, Figs. 8d1–f1 and       increasing trend in 1989–98, then showed a decreasing trend in
8d2–f2 show that irrespective of considering the inﬂuence of SM       1999–2008, and ﬁnally showed a trend of increasing ﬁrst and
on the system, the magnitude of causality from VPD to GPP pri-        then decreasing in 2009–18. Figures 9g2–i2 show that when con-
marily shows a trend of ﬁrst decreasing and then increasing dur-      sidering the inﬂuence of VPD, the magnitude of causality from
ing 1989–2008 and remains relatively stable within 2009–18, and       SM to GPP increased ﬁrst and then decreased from 1989 to
there is also no signiﬁcant difference in the causal strength be-     1998, then remained relatively stable from 1999 to 2008, and ﬁ-
tween the two scenarios. Figures 8g1–i1 and 8g2–i2 indicate that      nally increased ﬁrst and then decreased again from 2009 to
only within the range of 1989–98, whether or not the inﬂuence of      2018. Additionally, when comparing Figs. 9g1–i1 with Figs. 9g2–i2,
VPD on the system is considered, the causality of SM to GPP is        it is evident that the direct causality from SM to GPP persists re-
almost negligible, and there is no noticeable difference between      gardless of whether the inﬂuence of VPD is considered. However,
them. However, as shown in Figs. 8h1–i1 and 8h2–i2, there are         without taking into account the inﬂuence of VPD, the magnitude
signiﬁcant differences between the inﬂuence of SM on GPP with-        of causality from SM to GPP is stronger than when the inﬂuence
out considering VPD effects and the inﬂuence of SM on GPP             of VPD is considered. This suggests that VPD has a signiﬁcant im-
when considering VPD effects. When not considering the inﬂu-          pact on the causality from SM to GPP.
ence of VPD on the system, the magnitude of causality from SM             Finally, we summarized the inﬂuence mechanism of SM
to GPP exhibits a trend of ﬁrst increasing and then decreasing, as    and VPD to GPP in RB, as shown in Figs. 9j and 9k. Figure 9j
shown in Figs. 8h1–i1. However, when considering the inﬂuence         shows the causality from SM to GPP in the absence of VPD.
of VPD on the system, there is no direct causality between SM         It is consistent with the result in RA. When VPD is added
to GPP, as shown in Figs. 8h2–i2.                                     into the system, the direct causality from SM to GPP still ex-
   To better demonstrate the inﬂuence mechanism of SM and             ists, in contrast to that in RA; besides that, there is also a di-
VPD to GPP in RA. we have individually highlighted the most           rect causality from VPD to GPP. Besides these two causal
representative ﬁndings, as shown in Figs. 8j and 8k. Figure 8j rep-   relations, we note that there also exists an indirect causality
resents the causality between SM to GPP in 1999–2018, Fig. 8k         from VPD to GPP via SM, as shown in Fig. 9k. This real-
represents the change of causality when the inﬂuence of VPD is        world problem application shows that SM and VPD inﬂuence
taken into account, and the real causal relationships in 1999–2018.   GPP in the semihumid area. Moreover, the information ﬂow
It represents when VPD is added into the system, a change in          from VPD to GPP inﬂuenced by SM is larger in magnitude
causality occurs, so VPD is a common cause of SM and GPP.             than that from SM to GPP inﬂuenced by VPD. From this, the
Thus, although all these three variables are highly correlated, the   MtvLK algorithm can correctly identify the causality in highly
causalities on SM and GPP look like Fig. 8k in 1999–2018. In ad-      correlated complex systems and effectively give the magni-
dition, we also found the information ﬂow from VPD to GPP in-         tude of causality. It hence provides a powerful tool for causal
ﬂuenced by SM is higher than the information ﬂow from SM to           inference for complex Earth system problems.
GPP inﬂuenced by VPD. These results show that MtvLK can de-
tect the inﬂuence of confounder(s), and correctly identify causali-   5. Discussion
ties in complex multivariate systems.
   Similar to Fig. 8, the causal relationships among SM, VPD,            Identifying causal relationships and quantifying their
and GPP in RB are sketched in Fig. 9. As shown in Figs. 9a1–c1        strength from time series can help us gain insight into the
and 9a2–c2, regardless of whether the inﬂuence of GPP on the          physical mechanism underlying the observations: a key prob-
system is considered, the magnitude of causality from VPD to          lem in scientiﬁc research. The Liang–Kleeman information
SM generally shows a trend of increasing ﬁrst, then decreasing,       ﬂow quantiﬁes the rate of information between systems,
and then increasing again in three time periods. Moreover,            showing both the direction and magnitude within a cause-
there is no signiﬁcant difference in the magnitude of causality       and-effect relation (Liang 2014, 2016, 2021). Since it is rigor-
between the two cases. Figures 9d1–f1 and 9d2–f2 show that re-        ously formulated from ﬁrst principles, it avoids the spurious
gardless of whether or not considering the inﬂuence of SM on          causality sometimes identiﬁed in Granger causality tests and
the system, the magnitude of causality from VPD to GPP is rel-        tests with other statistical formalisms. Due to the fact that LK
atively stable from 1989 to 1998, and shows a trend of increasing     is computed based on the covariance between given time se-
ﬁrst and then decreasing from 1999 to 2008. Finally, it also          ries, the LK is relatively easier to compute compared to other
shows a trend of increasing ﬁrst and then decreasing from 2009        approaches. Moreover, Liang (2018) demonstrated with a
to 2018, and the magnitude of causality from 2009 to 2018 is          nonlinear three-dimensional stochastic gradient system that
lower than that from 1999 to 2008. In addition, we also ﬁnd that      that LK can still accurately provide potential causal relation-
when considering the inﬂuence of SM on the system, the magni-         ships. Nonetheless, the potential limitations should also be
tude of causality from VPD to GPP is lower than that without          studied in future studies. In this study we extended a previous
considering the inﬂuence of SM on the system, this hints at the       solution to the problem of bivariate LK causality estimation
existence of potential feedback from SM. Figures 9g1–i1 and           with nonstationary series (Hagan et al. 2019) to the multivari-
9g2–i2 represent the causality between SM to GPP without con-         ate cases, based on the Kalman ﬁlter’s learning algorithm,
sidering the inﬂuence of VPD, and the causality between SM to         which can identify immediate changes when tracking time-
GPP with considering the inﬂuence of VPD, respectively.               varying information ﬂow within a system. This endeavor
Figures 9g1–i1 show that without considering the inﬂuence of          yields a time-varying causal structure as seen in Eq. (16). In




                                                                                                    Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                              ZHOU ET AL.                                                                    1869




                   FIG. 9. A schematic of the time-varying causality among the SM, VPD, and GPP for RB. Shown are
                the time periods (left) January 1989–December 1998, (center) January 1999–December 2008, and (right)
                January 2009–December 2018. (a1)–(c1),(a2)–(c2) The causality between VPD to SM and the causality
                between VPD to SM inﬂuenced by GPP, respectively. (d1)–(f1),(d2)–(f2) The causality between VPD to
                GPP and the causality between VPD to GPP inﬂuenced by SM, respectively. (g1)–(i1),(g2)–(i2) The cau-
                sality between SM to GPP and the causality between SM to GPP inﬂuenced by VPD, respectively. (j)
                The inferred causal relation between SM and GPP in the absence of VPD in 1989–2018. (k) The causal
                relationship among VPD, SM, and GPP in 1989–2018. The red arrow indicates that the absolute value of
                the IF increases, and the blue arrow indicates that the absolute value of the IF decreases. The thickness of
                the arrow represents the absolute value of the information ﬂow.




                                                                                                        Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1870                                             JOURNAL OF CLIMATE                                                          VOLUME 37

performing the Kalman ﬁlter, a lookback window length is            time–frequency causality relationships in land–atmosphere
needed to calculate the moving average when estimating Q            interactions, but it can also be applied to analyze complex
and R. Here, we use the exponential weighted moving aver-           causal relationships in various other ﬁelds, such as ﬁnance,
age (EWMA) and unweighted moving average (UWMA),                    further enhancing our understanding of causality issues
which provide an information length for the window length           across diverse domains.
lost to do the forward update of the ﬁlter. We obtained the
time-varying information ﬂow without missing data by run-              Acknowledgments. This research was funded by the Na-
ning the ﬁlter backward using the last estimate of the forward      tional Natural Science Foundation of China (42275028) and
recursion for initialization. Then, we combined both the for-       the Sino-German Cooperation Group Program (GZ1447).
ward and backward runs together. This algorithm is abbrevi-         We are also grateful to all data providers who made their
ated as MtvLK.                                                      data available for use in this study.
   MtvLK has been validated in three idealized synthetic mod-
els, with causality between variables by design varying over           Data availability statement. All code required to replicate
time as shown in Figs. 2–4. In addition, MtvLK effectively sol-     this study can be obtained from https://github.com/FeihongZhou/
ves the problem of missing window length information in-            MtvLK.git. All data used for this study are publicly available on-
curred in choosing a lookback window length to compute the          line. The FLUXCOM GPP data are provided by Max Planck
moving average when using EMWA and UWMA to estimate
                                                                    Institute for Biogeochemistry at http://www.ﬂuxcom.org/CF-
Q and R ofﬂine. Hence there is no missing value at each time
                                                                    Download/. The ERA5-Land data are provided by the European
step in our results. Additionally, the estimated time-varying
                                                                    Centre for Medium-Range Weather Forecasts at https://cds.
causality accurately reproduces the preset causality in the
                                                                    climate.copernicus.eu.
models. This is because Kalman ﬁltering has the ability to de-
tect changes. Therefore, immediate changes along time will
be preserved when estimating causal relationships using the                                  APPENDIX A
MtvLK, which is challenging to achieve in non-time-varying
                                                                    Solution for Missing Window Length Information Length
LK information ﬂow and methods based on standard sliding
windows. In addition, the principle of nil causality, which ap-         Consider a d-dimensional system. First, we compute the
pears as a theorem in the LK formula (Liang 2014, 2016,             time-varying information ﬂow from x2 to x1 based on Eq. (16),
2021), is also met in the MtvLK estimate, while with some           denoted as T2"1. Aiming at the problem of missing values
commonly used causal inference approaches this may not al-          in the initial lookback window, we reverse the time series
ways be true. Moreover, even with highly correlated series,         of x1 and x2, denoted as x1 and x2 , respectively. Then we
MtvLK is still effective, as veriﬁed with the toy model             compute the time-varying information ﬂow from x1 and x2 ,
(namely, the synthetic model 1): Although the confounding           denoted as T1 "2 . Next we reverse the obtained result
variable x2 exists in the system, MtvLK can still correctly iden-   T1 "2 , and denote it as T1  "2 . This step reverses the miss-
tify the real causality in the multivariable system.                ing value in the initial lookback window to the tail of the
   We have also applied the MtvLK in a real-world problem           sequence. Finally, we replace the missing value of the initial
to investigate how SM and VPD affect GPP in two selected            lookback window in T2"1 with the corresponding region in
typical regions of China. Our results show that over the humid      T1  "2 to obtain the ﬁnal result without missing values. It is im-
Huanan region in southeastern China, causality exists from          portant to highlight that although this method effectively ad-
VPD to GPP. While SM is highly correlated with GPP, no di-          dresses the issue of missing values in the initial backtracking
rect causality exists between SM and GPP. In the semihumid          window, we contend that it does not provide a comprehensive
and semiarid Huabei regions, direct causality exists both from      explanation of the underlying physical mechanisms involved in
VPD to GPP and from SM to GPP.                                      the backtracking window. This limitation arises from the fact
   There is still more room to improve the MtvLK algorithm.         that the method calculates based on reverse-engineered time
Attention needs to be paid particularly on three issues: First,     series, essentially employing backward data computation to
the computation is rather expensive because of the Kalman           move forward. Therefore, while the information ﬂow values ob-
ﬁlter used here, so the computational efﬁciency is signiﬁcantly     tained from this method can serve as a reference for discerning
lower than the original estimation of causality as documented       causal relationships between variables in the backtracking win-
in Liang (2021). The use of EMWA and UWMA to estimate
                                                                    dow, they are inadequate for effectively elucidating the associ-
Q and R would need further improvement to avoid deﬁning a
                                                                    ated physical mechanisms.
time window length. A more objective way to deﬁne a win-
dow length would provide a better estimation for the proba-
                                                                                             APPENDIX B
bility density function of the causal structure. Finally, future
studies on MtvLK should look into incorporating a frequency
                                                                                            Significance Test
domain as was done by Hagan et al. (2019) to show causalities
at different time scales which is important to isolate long- and       For the statistical tool such as that in Eq. (16), signiﬁcance
short-causal impacts. After these optimizations, a fully op-        testing enables us to better understand the robustness of the
timized MtvLK will represent a method with immense po-              derived result. When N is large, the information ﬂow is ap-
tential. Not only can it shed new light on the intricate            proximately normally distributed around their true values with




                                                                                                   Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                                 ZHOU ET AL.                                                                      1871

variances (C12 /C11 )2 s2a , which is derived from maximum like-           outlined in section 3. The time-varying information ﬂow re-
                          12
lihood estimation. Denote u 5 (f1, a11, a12, … , a1d, b1),                 sults (in nats per unit time) are presented in Fig. C1. The
                                                                           results show that |Tx3"x1|x2| and |Tx3"x2|x1| are both no cau-
                          N
                      1     ­2 logr(Xn11 |Xn ; û )                        salities for 0 , t # 2000. These results align with the design
               Iij 5 2 ∑                           ,              (B1)
                      N n51        ­ui­uj                                  in Eq. (17).

where I is a (d 1 2) 3 (d 1 2) matrix, namely, the Fisher                  b. Synthetic model 2
information matrix. The inverse (NI)21 is the covariance                     The time-varying information ﬂow results (in nats per
          _
matrix of u , which has s2a ; r is the marginal probability of             unit time) that did not preset causality in synthetic model 2
                           12
{Xn}, a Markov process. For details, refer to Liang (2021).                are shown in Fig. C2. The results show that |Tx1"x2|x3|,
                                                                           |Tx3"x1|x2|, and |Tx3"x2|x1| are all no causalities for 0 , t #
                         APPENDIX C                                        2000. These results align with the design in Eq. (18).

                                                                           c. Synthetic model 3
         Addition Testing of the Synthetic Model
                                                                             The time-varying information ﬂow results (in nats per
a. Synthetic model 1
                                                                           unit time) that did not preset causality in the synthetic
   To further verify the accuracy of MtvLK in complex mul-                 model 3 are shown in Fig. C3. Figures C3c–n show that all
tivariate system, we tested all the links in synthetic model 1             the test links show no causalities for 0 , t # 2000. These
that did not preset causality by using the same conditions                 results align with the design in Eq. (19).




            FIG. C1. (a) Schematic diagram of the conceptual model as described in Eq. (17) when 0 , t # 500 and 1500 , t # 2000.
         (b) As in (a), but for interval 500 , t # 1500. Absolute values of the time-varying information ﬂows among x1, x2, and x3
         (in nats per unit time): (c) |Tx3"x1|x2| and Sigx3"x1|x2; (d) |Tx3"x2|x1| and Sigx3"x2|x1. Dashed lines represent the causal rela-
         tionship turning points. All the results are the averages of 1000 realizations, and all the signiﬁcance tests are performed at a
         1% signiﬁcance level.




                                                                                                             Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1872                                                 JOURNAL OF CLIMATE                                                                  VOLUME 37




          FIG. C2. (a) Schematic diagram of the conceptual model as described in Eq. (18) when 0 , t # 500 and 1500 , t # 2000.
       (b) As in (a), but for the interval 500 , t # 1500. Absolute values of the time-varying information ﬂows among x1, x2, and
       x3 (in nats per unit time): (c) |Tx1"x2|x3| and Sigx1"x2|x3; (d) |Tx3"x1|x2| and Sigx3"x1|x2; (e) |Tx3"x2|x1| and Sigx3"x2|x1. Dashed
       lines represent the causal relationship turning points. All the results are the averages of 1000 realizations, and all the signiﬁ-
       cance tests are performed at a 1% signiﬁcance level.




                                                                                                              Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                                      ZHOU ET AL.                                                                           1873




  FIG. C3. (a) Schematic diagram of the conceptual model as described in Eq. (19) when 0 , t # 500. (b) As in (a), but for the interval
500 , t # 2000. Absolute values of the time-varying information ﬂows among x1, x2, x3, x4, and x5 (in nats per unit time): (c) |Tx2"x1|x3,x4,x5|
and Sigx2"x1|x3,x4,x5; (d) |Tx2"x5|x1,x3,x4| and Sigx2"x5|x1,x3,x4; (e) |Tx3"x1|x2,x4,x5| and Sigx3"x1|x2,x4,x5; (f) |Tx3"x2|x1,x4,x5| and Sigx3"x2|x1,x4,x5|;
(g) |Tx3"x5|x1,x2,x4| and Sigx3"x5|x1,x2,x4; (h) |Tx4"x1|x2,x3,x5| and Sigx4"x1|x2,x3,x5; (i) |Tx4"x2|x1,x3,x5| and Sigx4"x2|x1,x3,x5; (j) |Tx4"x3|x1,x2,x5| and
Sigx4"x3|x1,x2,x5; (k) |Tx5"x1|x2,x3,x4| and Sigx5"x1|x2,x3,x4; (l) |Tx5"x2|x1,x3,x4| and Sigx5"x2|x1,x3,x4; (m) |Tx5"x3|x1,x2,x4| and Sigx5"x3|x1,x2,x4;
(n) |Tx5"x4|x1,x2,x3| and Sigx5"x4|x1,x2,x3. Dashed lines represent the causal relationship turning points. All the results are the averages of
1000 realizations, and all the signiﬁcance tests are performed at a 1% signiﬁcance level.



                                                                                                                     Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1874                                                  JOURNAL OF CLIMATE                                                           VOLUME 37

                          REFERENCES                                       Detto, M., A. Molini, G. Katul, P. Stoy, S. Palmroth, and D.
                                                                               Baldocchi, 2012: Causality and persistence in ecological sys-
Allen, R. G., L. S. Pereira, D. Raes, and M. Smith, 1998: Crop                 tems: A nonparametric spectral Granger causality approach.
     evapotranspiration}Guidelines for computing crop water re-                Amer. Nat., 179, 524–535, https://doi.org/10.1086/664628.
     quirements. FAO Irrigation and Drainage Paper 56, 326 pp.,            Docquier, D., S. Vannitsem, F. Ragone, K. Wyser, and X. S.
     https://www.scscourt.org/complexcivil/105cv049053/volume3/17              Liang, 2022: Causal links between Arctic sea ice and its po-
     2618e_5xagwax8.pdf.                                                       tential drivers based on the rate of information transfer. Geo-
Anderegg, W. R. L., and Coauthors, 2017: Plant water potential                 phys. Res. Lett., 49, e2021GL095892, https://doi.org/10.1029/
     improves prediction of empirical stomatal models. PLOS                    2021GL095892.
     ONE, 12, e0185481, https://doi.org/10.1371/journal.pone.0185481.      Duerinck, H. M., R. J. van der Ent, N. C. van de Giesen, G.
Bai, C., R. Zhang, S. Bao, X. S. Liang, and W. Guo, 2018: Fore-                Schoups, V. Babovic, and P. J.-F. Yeh, 2016: Observed soil
     casting the tropical cyclone genesis over the northwest Paciﬁc            moisture–precipitation feedback in Illinois: A systematic
     through identifying the causal factors in cyclone–climate in-             analysis over different scales. J. Hydrometeor., 17, 1645–1660,
     teractions. J. Atmos. Oceanic Technol., 35, 247–259, https://             https://doi.org/10.1175/JHM-D-15-0032.1.
     doi.org/10.1175/JTECH-D-17-0109.1.                                    Feng, H., B. Zou, and J. Luo, 2017: Coverage-dependent ampli-
Baker, J. C. A., and Coauthors, 2021: An assessment of land–                   ﬁers of vegetation change on global water cycle dynamics. J.
     atmosphere interactions over South America using satellites,              Hydrol., 550, 220–229, https://doi.org/10.1016/j.jhydrol.2017.
     reanalysis, and two global climate models. J. Hydrometeor.,               04.056.
     22, 905–922, https://doi.org/10.1175/JHM-D-20-0132.1.                 Fu, Z., and Coauthors, 2022: Atmospheric dryness reduces photo-
Barrett, A., and L. Barnett, 2013: Granger causality is designed               synthesis along a large range of soil water deﬁcits. Nat. Com-
     to measure effect, not mechanism. Fronti. Neuroinfo., 7, 6,               mun., 13, 989, https://doi.org/10.1038/s41467-022-28652-7.
     https://doi.org/10.3389/fninf.2013.00006.                             Goodwell, A. E., P. Jiang, B. L. Ruddell, and P. Kumar, 2020:
Berg, A., B. R. Lintner, K. L. Findell, S. Malyshev, P. C. Loikith,            Debates}Does information theory provide a new paradigm
     and P. Gentine, 2014: Impact of soil moisture–atmosphere in-              for Earth science? Causality, interaction, and feedback. Water
     teractions on surface temperature distribution. J. Climate, 27,           Resour. Res., 56, e2019WR024940, https://doi.org/10.1029/
     7976–7993, https://doi.org/10.1175/JCLI-D-13-00591.1.                     2019WR024940.
}}, and Coauthors, 2016: Land–atmosphere feedbacks amplify                 Granger, C. W. J., 1969: Investigating causal relations by econo-
     aridity increase over land under global warming. Nat. Climate             metric models and cross-spectral methods. Econometrica, 37,
     Change, 6, 869–874, https://doi.org/10.1038/nclimate3029.                 424–438, https://doi.org/10.2307/1912791.
Besnard, S., and Coauthors, 2021: Global sensitivities of forest           Green, J. K., A. G. Konings, S. H. Alemohammad, J. Berry, D.
     carbon changes to environmental conditions. Global Change                 Entekhabi, J. Kolassa, J.-E. Lee, and P. Gentine, 2017: Re-
                                                                               gionally strong feedbacks between the atmosphere and ter-
     Biol., 27, 6467–6483, https://doi.org/10.1111/gcb.15877.
Bierman, G. J., and C. L. Thornton, 1977: Numerical comparison                 restrial biosphere. Nat. Geosci., 10, 410–414, https://doi.org/
                                                                               10.1038/ngeo2957.
     of Kalman ﬁlter algorithms: Orbit determination case study.
                                                                           Hagan, D. F. T., G. Wang, X. S. Liang, and H. A. J. Dolman,
     Automatica, 13, 23–35, https://doi.org/10.1016/0005-1098(77)
                                                                               2019: A time-varying causality formalism based on the
     90006-1.
                                                                               Liang–Kleeman information ﬂow for analyzing directed inter-
Chen, H., and Coauthors, 2021: Soil drying weakens the positive
                                                                               actions in nonstationary climate systems. J. Climate, 32, 7521–
     effect of climate factors on global gross primary production.
                                                                               7537, https://doi.org/10.1175/JCLI-D-18-0881.1.
     Ecol. Indic., 129, 107953, https://doi.org/10.1016/j.ecolind.2021.
                                                                           }}, H. A. J. Dolman, G. Wang, K. T. C. L. K. Sian, K. Yang,
     107953.
                                                                               W. Ullah, and R. P. Shen, 2022: Contrasting ecosystem con-
Chen, N., and Coauthors, 2020: The compensation effects of post-
                                                                               straints on seasonal terrestrial CO2 and mean surface air tem-
     drought regrowth on earlier drought loss across the Tibetan
                                                                               perature causality projections by the end of the 21st century.
     Plateau grasslands. Agric. For. Meteor., 281, 107822, https://
                                                                               Environ. Res. Lett., 17, 124019, https://doi.org/10.1088/1748-
     doi.org/10.1016/j.agrformet.2019.107822.                                  9326/aca551.
}}, and Coauthors, 2021: Divergent impacts of atmospheric wa-              Havlicek, M., J. Jan, M. Brazdil, and V. D. Calhoun, 2010:
     ter demand on gross primary productivity in three typical                 Dynamic Granger causality based on Kalman ﬁlter for evalu-
     ecosystems in China. Agric. For. Meteor., 307, 108527, https://           ation of functional network connectivity in fMRI data. Neu-
     doi.org/10.1016/j.agrformet.2021.108527.                                  roimage, 53, 65–77, https://doi.org/10.1016/j.neuroimage.2010.
Ciabatta, L., L. Brocca, C. Massari, T. Moramarco, S. Puca, A.                 05.063.
     Rinollo, S. Gabellani, and W. Wagner, 2015: Integration of            Humphrey, V., A. Berg, P. Ciais, P. Gentine, M. Jung, M.
     satellite soil moisture and rainfall observations over the Italian        Reichstein, S. I. Seneviratne, and C. Frankenberg, 2021: Soil
     territory. J. Hydrometeor., 16, 1341–1355, https://doi.org/10.1175/       moisture–atmosphere feedback dominates land carbon up-
     JHM-D-14-0108.1.                                                          take variability. Nature, 592, 65–69, https://doi.org/10.1038/
Cong, J., and Coauthors, 2023: Altered default mode network                    s41586-021-03325-5.
     causal connectivity patterns in autism spectrum disorder revealed     Jung, M., and Coauthors, 2017: Compensatory water effects link
     by Liang information ﬂow analysis. Hum. Brain Mapp., 44,                  yearly global land CO2 sink changes to temperature. Nature,
     2279–2293, https://doi.org/10.1002/hbm.26209.                             541, 516–520, https://doi.org/10.1038/nature20780.
Cui, J. P., S. Piao, C. Huntingford, X. Wang, X. Lian, A. Chevuturi,       Kalman, R. E., 1960: A new approach to linear ﬁltering and pre-
     A. G. Turner, and G. J. Kooperman, 2020: Vegetation forcing               diction problems. J. Basic Eng., 82, 35–45, https://doi.org/10.
     modulates global land monsoon and water resources in a                    1115/1.3662552.
     CO2-enriched climate. Nat. Commun., 11, 5184, https://doi.org/        Kimm, H., K. Guan, P. Gentine, J. Wu, C. J. Bernacchi, B. N.
     10.1038/s41467-020-18992-7.                                               Sulman, T. J. Grifﬁs, and C. Lin, 2020: Redeﬁning droughts




                                                                                                         Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
15 MARCH 2024                                               ZHOU ET AL.                                                                  1875

     for the U.S. Corn Belt: The dominant role of atmospheric va-       Novick, K. A., and Coauthors, 2016: The increasing importance of
     por pressure deﬁcit over soil moisture in regulating stomatal           atmospheric demand for ecosystem water and carbon ﬂuxes.
     behavior of maize and soybean. Agric. For. Meteor., 287,                Nat. Climate Change, 6, 1023–1027, https://doi.org/10.1038/
     107930, https://doi.org/10.1016/j.agrformet.2020.107930.                nclimate3114.
Lemordant, L., P. Gentine, M. Stefanon, P. Drobinski, and S.            Oren, R., J. S. Sperry, G. G. Katul, D. E. Pataki, B. E. Ewers, N.
     Fatichi, 2016: Modiﬁcation of land-atmosphere interactions by           Phillips, and K. V. R. Schäfer, 1999: Survey and synthesis of
     CO2 effects: Implications for summer dryness and heat wave              intra- and interspeciﬁc variation in stomatal sensitivity to va-
     amplitude. Geophys. Res. Lett., 43, 10 240–10 248, https://doi.         pour pressure deﬁcit. Plant Cell Environ., 22, 1515–1526,
     org/10.1002/2016GL069896.                                               https://doi.org/10.1046/j.1365-3040.1999.00513.x.
Le Quéré, C., and Coauthors, 2015: Global carbon budget 2015.           Orth, R., and S. I. Seneviratne, 2017: Variability of soil moisture
     Earth Syst. Sci. Data, 7, 349–396, https://doi.org/10.5194/essd-        and sea surface temperatures similarly important for warm-
     7-349-2015.                                                             season land climate in the Community Earth System Model.
Li, S., G. Wang, C. Zhu, J. Lu, W. Ullah, D. F. T. Hagan, G.                 J. Climate, 30, 2141–2162, https://doi.org/10.1175/JCLI-D-15-
     Kattel, and J. Peng, 2022: Attribution of global evapotranspi-          0567.1.
     ration trends based on the Budyko framework. Hydrol. Earth         Pal, S., T. R. Lee, and N. E. Clark, 2020: The 2019 Mississippi and
     Syst. Sci., 26, 3691–3707, https://doi.org/10.5194/hess-26-3691-        Missouri River ﬂooding and its impact on atmospheric
     2022.                                                                   boundary layer dynamics. Geophys. Res. Lett., 47,
Liang, X. S., 2014: Unraveling the cause-effect relation between             e2019GL086933, https://doi.org/10.1029/2019GL086933.
     time series. Phys. Rev. E, 90, 052150, https://doi.org/10.1103/    Palacio, S., G. Hoch, A. Sala, C. Körner, and P. Millard, 2014:
     PhysRevE.90.052150.                                                     Does carbon storage limit tree growth? New Phytol., 201,
}}, 2016: Information ﬂow and causality as rigorous notions ab               1096–1100, https://doi.org/10.1111/nph.12602.
     initio. Phys. Rev. E, 94, 052201, https://doi.org/10.1103/         Papagiannopoulou, C., D. G. Miralles, W. A. Dorigo, N. E. C.
     PhysRevE.94.052201.                                                     Verhoest, M. Depoorter, and W. Waegeman, 2017a: Vegeta-
}}, 2018: Causation and information ﬂow with respect to rela-                tion anomalies caused by antecedent precipitation in most of
     tive entropy. Chaos, 28, 075311, https://doi.org/10.1063/1.501          the world. Environ. Res. Lett., 12, 074016, https://doi.org/10.
     0253.                                                                   1088/1748-9326/aa7145.
}}, 2021: Normalized multivariate time series causality analysis        }}, }}, S. Decubber, M. Demuzere, N. E. C. Verhoest, W. A.
     and causal graph reconstruction. Entropy, 23, 679, https://doi.         Dorigo, and W. Waegeman, 2017b: A non-linear Granger-
     org/10.3390/e23060679.                                                  causality framework to investigate climate–vegetation dynam-
}}, F. Xu, Y. Rong, R. Zhang, X. Tang, and F. Zhang, 2021: El                ics. Geosci. Model Dev., 10, 1945–1960, https://doi.org/10.
     Niño Modoki can be mostly predicted more than 10 years                  5194/gmd-10-1945-2017.
     ahead of time. Sci. Rep., 11, 17860, https://doi.org/10.1038/      Prăvălie, R., 2018: Major perturbations in the Earth’s forest eco-
     s41598-021-97111-y.                                                     systems. Possible implications for global warming. Earth Sci.
Lintner, B. R., and J. D. Neelin, 2009: Soil moisture impacts on             Rev., 185, 544–571, https://doi.org/10.1016/j.earscirev.2018.06.
     convective margins. J. Hydrometeor., 10, 1026–1039, https://            010.
     doi.org/10.1175/2009JHM1094.1.                                     Punales, A. G., 2011: Time-varying coefﬁcient models and the
Liu, G., Y. Wang, Y. Chen, X. Tong, Y. Wang, J. Xie, and X.                  Kalman ﬁlter: Applications to hedge funds. Master’s disserta-
     Tang, 2022: Remotely monitoring vegetation productivity in              tion, Applied Mathematics, Ryerson University, 83 pp.,
     two contrasting subtropical forest ecosystems using solar-              https://pdfs.semanticscholar.org/e68f/7bf222ccdf8b235a3a15a55
     induced chlorophyll ﬂuorescence. Remote Sens., 14, 1328,                738f1bd2d2a14.pdf.
     https://doi.org/10.3390/rs14061328.                                Saini, R., G. Wang, and J. S. Pal, 2016: Role of soil moisture feed-
Liu, L., L. Gudmundsson, M. Hauser, D. Qin, S. Li, and S. I.                 back in the development of extreme summer drought and
     Seneviratne, 2020: Soil moisture dominates dryness stress on            ﬂood in the United States. J. Hydrometeor., 17, 2191–2207,
     ecosystem production globally. Nat. Commun., 11, 4892,                  https://doi.org/10.1175/JHM-D-15-0168.1.
     https://doi.org/10.1038/s41467-020-18631-1.                        Schwingshackl, C., M. Hirschi, and S. I. Seneviratne, 2017: Quanti-
Liu, Y., A. J. Parolari, M. Kumar, C.-W. Huang, G. G. Katul, and             fying spatiotemporal variations of soil moisture control on
     A. Porporato, 2017: Increasing atmospheric humidity and                 surface energy balance and near-surface air temperature.
     CO2 concentration alleviate forest mortality risk. Proc. Natl.          J. Climate, 30, 7105–7124, https://doi.org/10.1175/JCLI-D-16-
     Acad. Sci. USA, 114, 9918–9923, https://doi.org/10.1073/pnas.           0727.1.
     1704811114.                                                        Seneviratne, S. I., D. Lüthi, M. Litschi, and C. Schär, 2006: Land–
Liu, Z. J., L. C. Wang, and S. S. Wang, 2014: Comparison of dif-             atmosphere coupling and climate change in Europe. Nature,
     ferent GPP models in China using MODIS image and China-                 443, 205–209, https://doi.org/10.1038/nature05095.
     FLUX data. Remote Sens., 6, 10 215–10 231, https://doi.org/10.     }}, T. Corti, E. L. Davin, M. Hirschi, E. B. Jaeger, I. Lehner,
     3390/rs61010215.                                                        B. Orlowsky, and A. J. Teuling, 2010: Investigating soil
Madani, N., and Coauthors, 2020: Recent ampliﬁed global gross                moisture–climate interactions in a changing climate: A re-
     primary productivity due to temperature increase is offset by           view. Earth Sci. Rev., 99, 125–161, https://doi.org/10.1016/j.
     reduced productivity due to water constraints. AGU Adv., 1,             earscirev.2010.02.004.
     e2020AV000180, https://doi.org/10.1029/2020AV000180.               Sperry, J. S., M. D. Venturas, W. R. L. Anderegg, M. Mencuccini,
Melnikova, I., and T. Sasai, 2020: Effects of anthropogenic activity         D. S. Mackay, Y. Wang, and D. M. Love, 2017: Predicting
     on global terrestrial gross primary production. J. Geophys.             stomatal responses to the environment from the optimization
     Res. Biogeosci., 125, e2019JG005403, https://doi.org/10.1029/           of photosynthetic gain and hydraulic cost. Plant Cell Envi-
     2019JG005403.                                                           ron., 40, 816–830, https://doi.org/10.1111/pce.12852.




                                                                                                       Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
1876                                               JOURNAL OF CLIMATE                                                          VOLUME 37

Stips, A., D. Macias, C. Coughlan, E. Garcia-Gorriz, and X. San            to climate change. Global Change Biol., 21, 3520–3531,
     Liang, 2016: On the causal structure between CO2 and global           https://doi.org/10.1111/gcb.12945.
     temperature. Sci. Rep., 6, 21691, https://doi.org/10.1038/srep    Yi, B., and S. Bose, 2022: Quantum Liang information ﬂow as
     21691.                                                                causation quantiﬁer. Phys. Rev. Lett, 129, 020501, https://doi.
Stocker, B. D., J. Zscheischler, T. F. Keenan, I. C. Prentice, J.          org/10.1103/PhysRevLett.129.020501.
     Penuelas, and S. I. Seneviratne, 2018: Quantifying soil mois-     You, N., J. Meng, L. Zhu, S. Jiang, L. Zhu, F. Li, and L.-J. Kuo,
     ture impacts on light use efﬁciency across biomes. New Phy-           2020: Isolating the impacts of land use/cover change and
     tol., 218, 1430–1449, https://doi.org/10.1111/nph.15123.              climate change on the GPP in the Heihe River Basin of China.
Tao, L., X. S. Liang, L. Cai, J. Zhao, and M. Zhang, 2021: Rela-           J. Geophys. Res. Biogeosci., 125, e2020JG005734, https://doi.
     tive contributions of global warming, AMO and IPO to the              org/10.1029/2020JG005734.
     land precipitation variabilities since 1930s. Climate Dyn., 56,   Yuan, W., and Coauthors, 2019: Increased atmospheric vapor
     2225–2243, https://doi.org/10.1007/s00382-020-05584-w.                pressure deﬁcit reduces global vegetation growth. Sci. Adv.,
Tuttle, S., and G. Salvucci, 2016: Empirical evidence of contrasting       5, eaax1396, https://doi.org/10.1126/sciadv.aax1396.
     soil moisture–precipitation feedbacks across the United           Zhang, F., Q. Quan, F. Ma, D. Tian, Q. Zhou, and S. Niu, 2019:
     States. Science, 352, 825–828, https://doi.org/10.1126/science.       Differential responses of ecosystem carbon ﬂux components
     aaa7185.                                                              to experimental precipitation gradient in an alpine meadow.
Wang, M., S. Wang, J. Zhao, W. Ju, and Z. Hao, 2021: Global                Funct. Ecol., 33, 889–900, https://doi.org/10.1111/1365-2435.
     positive gross primary productivity extremes and climate con-         13300.
     tributions during 1982–2016. Sci. Total Environ., 774, 145703,    Zhang, W., Y. Li, X. Wu, Y. Chen, A. Chen, C. R. Schwalm, and
     https://doi.org/10.1016/j.scitotenv.2021.145703.                      J. S. Kimball, 2021: Divergent response of vegetation growth
Wang, X. H., and Coauthors, 2014: A two-fold increase of carbon            to soil water availability in dry and wet periods over central
     cycle sensitivity to tropical temperature variations. Nature,         Asia. J. Geophys. Res. Biogeosci., 126, e2020JG005912,
     506, 212–215, https://doi.org/10.1038/nature12915.                    https://doi.org/10.1029/2020JG005912.
Wright, S., 1921: Correlation and causation. J. Agric. Res., 20,       Zhou, S., and Coauthors, 2019: Land–atmosphere feedbacks exac-
     557–585.                                                              erbate concurrent soil drought and atmospheric aridity. Proc.
Wu, D., X. Zhao, S. Liang, T. Zhou, K. Huang, B. Tang, and W.              Natl. Acad. Sci. USA, 116, 18 848–18 853, https://doi.org/10.
     Zhao, 2015: Time-lag effects of global vegetation responses           1073/pnas.1904955116.




                                                                                                     Unauthenticated | Downloaded 08/24/26 07:53 AM UTC
