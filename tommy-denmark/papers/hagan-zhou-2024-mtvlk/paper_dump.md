VOLUME 37 J O U R N A L O F C L I M A T E 15 MARCH 2024
Estimating Time-Dependent Structures in a Multivariate Causality for
Land–Atmosphere Interactions
FEIHONG ZHOU,
a DANIEL FIIFI TAWIA HAGAN,
a,b GUOJIE WANG,
a X. SAN LIANG,
c,d SHIJIE LI,
a,e,f YUHAO SHAO,
a
EMMANUEL YEBOAH,
a AND XIKUN WEIa,g
a Collaborative Innovation Center on Forecast and Evaluation of Meteorological Disasters, Nanjing University of Information Science and
Technology, Nanjing, Jiangsu, China
b Hydro-Climate Extremes Laboratory, Ghent University, Ghent, Belgium
c Department of Atmospheric and Oceanic Sciences, and Institute of Atmospheric Sciences, Fudan University, Shanghai, China
d Division of Frontier Research, Southern Marine Laboratory, Zhuhai, Guangdong, China
e Department of Remote Sensing, Helmholtz Centre for Environmental Research-UFZ, Leipzig, Germany
f Remote Sensing Centre for Earth System Research, Leipzig University, Leipzig, Germany
g Chair of Engineering Hydrology and Water Management, Technical University of Darmstadt, Darmstadt, Germany
(Manuscript received 5 April 2023, in nal form 26 October 2023, accepted 29 December 2023)
ABSTRACT: The land surface and atmosphere interaction forms an integral part of the climate system. However, this intri-
cate relationship involves many complicated interactions and feedback effects between multiple variables. As a result, relying
solely on traditional linear regression analysis and correlation analysis to distinguish between multivariate complex“driver–
response” relations can be challenging, since they do not have the needed asymmetry to establish causality. The Liang–Kleeman
(LK) information ow theory provides a strict nonparametric causality measurement for identifying the causality between any
given time series, and its recent extension from bivariate to multivariate form provides a powerful tool for causal inference in
complex multivariate systems. However, the multivariate LK information ow also assumes stationarity in time and requires a
suf ciently long time series to ensure statistical suf ciency. To remedy this challenge, we rely on the square-root Kalman lter
to estimate the time-varying form of the multivariate LK information ow causality. The results from theoretical and real-world
applications show that the new algorithm provides a valuable tool for characterizing time-varying causal relationships in land–
atmosphere interactions, even when the time series are short and highly correlated.
SIGNIFICANCE STATEMENT: Causality in land–atmosphere interactions is generally characterized by seasonal
and intraseasonal changes that are usually not captured with commonly used approaches, because most approaches as-
sume the time series are stationary. In this study, we extend the recently proposed multivariate Liang–Kleeman infor-
mation ow causality (MtvLK) to handle nonstationary systems such as those in land–atmosphere interactions. By
considering nonstationarity, we aim to unravel time-varying causal structures that are usually masked out in commonly
used methods. Validating the MtvLK with synthetic models showed that the MtvLK is able to obtain the expected
causal structures. Furthermore, real-world applications reveal novel ndings of the time-varying causal structures be-
tween soil moisture, vapor pressure de cit, and the gross primary product.
KEYWORDS: Atmosphere-land interaction; Soil moisture; Kalman lters
1. Introduction
Land–atmosphere interactions play a critical role in the
climate system, not only as a key component but also as an es-
sential driver of terrestrial surface water and energy balance
(Orth and Seneviratne 2017; Seneviratne et al. 2006, 2010).
These interactions are characterized by complex couplings
and feedbacks between land and atmospheric states and
complex systems that include various natural processes
(Schwingshackl et al. 2017). Furthermore, these complex nat-
ural processes and interactions play an important role in the
exchange of energy and water, which sometimes results in
amplifying temperature and humidity anomalies (Humphrey
et al. 2021; Zhou et al. 2019), exacerbating soil desiccation
and atmospheric aridity (Zhou et al. 2019), leading to heat
waves and droughts (Berg et al. 2016; Ciabatta et al. 2015).
They also affect regional convection and precipitation (Tuttle
and Salvucci 2016), leading to ooding in anomalously wet
times (Saini et al. 2016). Therefore, a good understanding of
the complex processes involved in land–atmosphere interac-
tions is vital in improving the prediction of related extreme
events (Lemordant et al. 2016). Although land–atmosphere
interactions often involve multiple interacting variables, most
of the commonly used analysis methods can assess only two
variables at a time, making it dif cult to account for the im-
pact of confounding variables. In addition, various complex
natural processes in land–atmosphere interactions usually
vary not only in space (Lintner and Neelin 2009), but also at
different time scales ranging from days to months or even
years (Baker et al. 2021; Duerinck et al. 2016). It is, therefore,
necessary to look beyond bivariate and time-invariable
analyses to better understand these complex spatiotemporal
characteristics.
Corresponding author: Guojie Wang, gwang@nuist.edu.cn
DOI: 10.1175/JCLI-D-23-0207.1
Ó 2024 American Meteorological Society. This published article is licensed under the terms of the default AMS reuse license. For information regarding
reuse of this content and general copyright information, consult the AMS Copyright Policy (www.ametsoc.org/PUBSReuseLicenses).
1853
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1854
J O U R N A L The approaches for quantifying land–atmosphere interactions
include physical and numerical simulation experiments that inter-
vene in the interactions of interest under well-controlled condi-
tions and using data science methods for causal inference. In
recent years, several data-driven methods have been applied to
time series datasets to estimate potential causal dependencies.
Traditionally, commonly used approaches are based on correla-
tion and regression analysis. For example, Duerinck et al. (2016)
conducted a correlation-based study on the relationship between
soil moisture and precipitation in Illinois at different time and
spatial scales. Their results showed a strong positive correlation
between the state average soil moisture in late spring/early sum-
mer and the subsequent state average summer precipitation,
while no relationship was found at the daily and weekly scales.
Pal et al. (2020) presented the relationship between soil moisture
and boundary layer depths (BLDs) after ooding at two weather
scales based on regression analysis, effectively improving the pre-
diction of extreme events. Although correlation and regression
analysis may help provide causal inferences, they lack the neces-
sary asymmetry to provide causal directions in the interactions
between the variables under consideration (Fu et al. 2022;
Novick et al. 2016; Wu et al. 2015; Zhang et al. 2021). As a result,
it is dif cult to extrapolate the“drive–response” relationship.
The concept of causal inference originated in the early twenti-
eth century (Wright 1921) and since then several studies have at-
tempted to quantify it. Granger (1969) used a statistical prediction
formalism to quantify causal relations. The Granger causality
(GC) assumes that for two time series X and Y, X Granger-causes
Y if the conditional variance of Y decreases when the knowledge
of the past X is provided (Granger 1969). GC has become one of
the most used tools for causal discoveries between time series and
has consistently been modi ed to expand its applications in several
elds, including climate science. For instance, Detto et al. (2012)
proposed a conditional GC analysis framework, which can elimi-
nate the in uence of external forcing and separate the inherent
periodic coupling signals of regional eco-climate systems. Green
et al. (2017) used this approach to study vegetation–atmosphere
feedback mechanism and found that the local feedback mecha-
nism could explain about 30% of surface net radiation and precip-
itation variance. Papagiannopoulou et al. (2017a,b) developed and
applied a nonlinear multivariate Granger causality approach to
study the relationship between global vegetation and climate fac-
tors and found that water was the main controlling factor of
vegetation anomalies, while radiation and temperature had little
in uence.
Beyond the GC methods, information theory (IT) has been
demonstrated to be a rigorous alternative for identifying and
quantifying causality (Goodwell et al. 2020). Since IT measures
are based on probability distribution functions (pdfs), they can
capture linear and nonlinear relationships between variables. In
addition, IT-based methods can be reliably extended to quantify
causal relationships between more than two variables (Goodwell
et al. 2020). IT-based methods thus provide a framework within
which causality can be considered in Earth system science, provid-
ing a more powerful tool for studying complex causal relationships
in land–atmosphere interactions. In recent times, Liang (2014)
proposed a new causality analysis method based on information
ow theory, namely the Liang–Kleeman (LK) information ow
O F C L I M A T E VOLUME 37
(Liang 2016), which is a strict nonparametric causality measure-
ment form for identifying the causality between any given time
series. Compared with the GC, LK causality is easier to compute,
since it only involves the sample covariance of time series. More-
over, since it originates from rst principles and strict mathemati-
cal derivation, it avoids the false causalities sometimes found in
GC test and other statistical forms (Hagan et al. 2019).
Since its development, the LK causality has been successfully
applied to causality studies in climate systems. For instance, Liang
(2014) used the method to extrapolate the causality between El
Niño and the Indian Ocean dipole (IOD). Stips et al. (2016) used
this method to study the causality between greenhouse gas emis-
sions and global warming. Bai et al. (2018) also used it to analyze
the causes of tropical cyclones in the western North Paci c. More
recently, Tao et al. (2021) used the LK causality to quantitatively
assess the impacts of climate warming, interdecadal oscillations in
the Atlantic and Paci c on global precipitation and their regional
differences. However, the original form of the LK assumes statio-
narity, therefore, it does not account for the time-dependent
changes in land–atmosphere interactions. To deal with this prob-
lem, Hagan et al. (2019) extended the Liang causality to a time-
frequency form by combining the Kalman lter and wavelet anal-
ysis and applied it to the interaction between soil moisture and air
temperature over China, providing a new tool for studying tem-
poral causal structures in land–atmosphere interactions. However,
the approach presented by Hagan et al. (2019) is restricted to cau-
sality between only two variables and does not consider the ef-
fects of potential confounding variables. Therefore, seeking a
causality analysis method that can address nonstationarity in the
multivariate causality analysis is of paramount importance for the
study of land–atmospheric interactions.
Recently, Liang (2021) extended the LK causality to multivari-
ate time series causality and causal graph reconstruction, al-
though the time series are also assumed to be stationary. Liang
et al. (2021) successfully used this method to obtain accurate
forecasts of El Niño Modoki 10 years in advance. Docquier et al.
(2022) used this method to analyze the effects of several potential
climate drivers on Arctic sea ice area and volume, and the re-
verse effects of sea ice area and volume on these drivers. Hagan
et al. (2022) successfully applied it to analyze confounding im-
pacts of soil moisture and vegetation on the causal structure of
CO2 emissions and near-surface mean air temperature couplings
for multiple future scenarios of the climate system. Moreover,
this theory and methodology, albeit originally born from
atmosphere–ocean–climate science, has been widely applied in
other disciplines such as quantum mechanics (Yi and Bose 2022)
and neuroscience (Cong et al. 2023). These studies demonstrate
the usefulness of the multivariate LK causality in practical appli-
cations. Therefore, this study combines the multivariate LK cau-
sality with the Kalman lter to provide a new statistical tool for
estimating the time-varying causalities in multivariate land–
atmosphere interactions. The rest of the paper is structured as
follows: section 2 describes the formalism, section 3 validates the
formalism with synthetic models, and section 4 applies it to a
real-world case study of vegetation–climate interactions in China.
Section 5 presents a summary and discussion of the proposed
method and its potential applications.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
2. The multivariate time-varying causal inference
a. Estimation of information flow and causality in
multivariate time series
Liang (2016) observed that causality is a real physical no-
tion, which can be deduced and quanti ed by the concept of
Liang–Kleeman information ow (LKIF). Liang (2021) real-
ized the causality analysis of multivariate information ow
based on a rigorous derivation and explicit formulas for multi-
dimensional information ow has been obtained in a closed
form with both deterministic and stochastic systems. The fol-
lowing brie y introduces the derivation process of multivari-
ate information ow method.
Consider a d-dimensional continuous-time stochastic sys-
tem for X5 (X1, … , Xd)
dX5 F(X, t)dt 1 B(X, t)dW (1)
where F may be arbitrary nonlinear functions of X and t, W is
a vector of standard Wiener processes, and B is the matrix of
perturbation amplitudes. The rate of information owing
from Xj to Xi (in nats per unit time) proves to be
Tj"i
5 2E 1
j
ri Rd22
­(Fir
̸
j)
dx
­xi
̸
i
̸
1
1
2 E 1
­2(giir
j
ri Rd22
̸
j)
dx
­x2
̸
i
̸
i
5 2
rj|i(xj|xi)
Rd
­(Fir
̸
j)
dx 1
­xi
1
2 Rd
rj|i(xj|xi)
­2(giir
̸
j)
­x2
i
dx;
(2)
where dx
̸
i
̸
j signi es dx1, … , dxi21dxi11, … , dxj21dxj11, … ,
dxd, E is the mathematical expectation, gii
5 ∑d
k51|bikbik, ri 5
ri(xi) is the marginal probability density function (pdf) of
Xi, rj|i is the pdf of Xj conditioned on Xi, and r
̸
j
5 r(x)dxj.
In Eq. (1), in the case of linear systems where F(X, t)5 AX,
A5 (aij), Eq. (2) becomes quite simple (Liang 2016):
Tj"i
5 aij
sij
sii
; (3)
where aij is the (i, j)th entry of A, and sij is the population co-
variance between Xi and Xj.
Since Eq. (3) is challenging to use in practical applications,
we need to obtain a practically applicable formula by estimat-
ing Eq. (3). Suppose that the d time series are all equally
spaced (xi, i5 1,… , d) and all having N data points [xi(n),
n 5 1, 2,… , N], with F(X, t)5 AX, A5 (aij) being a d 3 d
matrix, and
Z H O U E T A L . 1855
are constant, the maximal likelihood estimator (mle) is the
least squares solution of the following N algebraic equations:
d
∑
j51
a1jxj(n)5
˙
x1(n), n 5 1,…, N (4)
where˙
X i,n
5 (Xi,n1k2 Xi,n)/(kDt) is the Euler forward
differencing approximation of dXi/dt, [where k is an integer
and k $ 1; k5 1 should be set in most of the time to ensure
accuracy, except in some cases of deterministic chaos when
the sampling at the highest resolution needs to be chosen
(k5 2); Dt is the time step size]. Following the procedure in
Liang (2014) the least squares solution of (a11, … , a1d),
(ˆ
a11, …,
ˆ
a1d), satis es the algebraic equation
⎡ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎣
C1,1… C1,y
.
.
.
.
.
.
.
.
.
C
y,1… C
y,y
⎤ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎦
⎡ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎣
ˆ
a11
.
.
.
ˆ
a1y
⎤ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎦5
⎡ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎣
C1,d1
.
.
.
C
y,d1
⎤ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎦
, (5)
where cij5 1/N∑N
n51[xi(n)2 xi][xj(n)2 xj] and ci,dj5
1/N∑N
n51[xi(n)2 xi][˙
xj(n)2
˙
xj] are the sample covariances.
Here,ˆ
a12
5 (1/detC)∑d
j51D2jCj,d1, where Dij are the cofac-
tors. Based on Eq. (3), the information ow from X2 to X1
when considering the in uence of X3, X4, X5, … , Xd on
the d-dimensional system is
d
T2"1|3,4,5,…,d
5
1
detC ∑
j51
C12
D2jCj,d1
, (6)
C11
where detC is the determinant of the covariance matrix C, and
Cj,d1 is the sample covariance between xj and the derived series
˙
x1. In this case, when d5 2, Eq. (6) can be easily reduced to
C11C12C2,d12 C2
12C1,d1
T2"1
5
; (7)
C2
11C222 C11C2
12
which is obtained in Liang (2014) and frequently used in
applications, such as Stips et al. (2016), Bai et al. (2018) and
Tao et al. (2021).
b. Kalman filter
The Kalman lter is a time domain ltering algorithm,
which takes the minimum mean square error as the best esti-
mation criterion (Kalman 1960). As a learning algorithm, the
equations for the Kalman lter fall into two groups: time up-
date equations and measurement update equations. The time
B5
⎡ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎢ ⎣
b1 0 0
.
0.
.
0
0 0 bd
⎤ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎥ ⎦
being a d 3 d diagonal matrix. We take an example of esti-
mating information ow from x2 to x1 in a d-dimensional sys-
tem (T2"1|3,4,5… d). First, we need to estimate aij before
estimating T2"1; Liang (2014) indicated that when aij and bi
update equations are responsible for obtaining the a priori es-
timates for the next step by projecting the current state and
error covariance forward. The measurement update equations
are responsible for obtaining an improved a posteriori esti-
mate modi ed by combining the latest observation informa-
tion and the prediction information of the current moment
(Kalman 1960). So the time update equations can be thought
of as predictor equations and the measurement update equa-
tions can be considered corrector equations (Kalman 1960).
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1856
J O U R N A L O F C L I M A T E Because the Kalman lter can identify immediate changes,
this would become advantageous when tracking time-varying
causality within a system (Havlicek et al. 2010; Punales 2011).
Therefore, we use the Kalman lter to estimate the time-varying
information ow based on Eq. (6) to estimate the multivariate
time-varying causality formalism based on the Liang–Kleeman
information ow. The standard Kalman lter is formulated with
a linear stochastic system:
xk
5 Axk21 1 Buk 1 wk21, (8)
yk
5 Hxk 1 vk, (9)
where x and y are the system state and measurement vectors,
and u is the input vector. The parameter A is the system states
transition matrix, B is the input matrix, and H is the measure-
ment matrix. Also, w and v are zero mean process and mea-
surement noise, respectively, assumed to be independent of
each other, with normal probability distributions, and meets
the criteria of the following equations:
E[wk]5 0, E[wkwT
i ]5
0, i Þ k
Q, i5 k
E[vk]5 0, E[vkvT
i ]5
0, i Þ k
R, i5 k
E[wkvT
i ]5 0, (10)
where E represents the expectation, Q is the covariance ma-
trix of the process noise wk, and R is the covariance matrix of
the measurement noise vk.
When the system satis es Eqs. (8) and (9), the estimation
of each time can be obtained by the Kalman lter recursive
formula. The speci c procedures are as follows:
1) According to the state estimates at time step k2 1, project
the state at time step k by the following equation:
ˆ
x2
k 5 Aˆ
xk21 1 Buk, (11)
whereˆ
x2
k are the state estimates at time step k andˆ
xk21
are the state estimates at time step k2 1.
2) De ne a priori estimate errors as e2
ˆ
k
5 xk2
x2
k , and the a pri-
ori estimate error covariance is P2
k 5 E[e2
k? e2
k
T], so we can
project the error covariance at time step k by the equation:
P2
k 5 APk21AT 1 Qk, (12)
3) where P2
k are the error covariance estimates at time step k
and Pk21 are the error covariance estimates at time step k2 1.
Update the Kalman gain at time step k:
Kk
5 P2
k HT(HP2
k HT 1 R)21
: (13)
4) The below equations are used to update the state esti-
mates with measurement yk and the Kalman gain Kk at
time step k:
^
xk
5
^
x2
k 1 Kk(yk2 H^
x2
k ): (14)
VOLUME 37
5) De ne a posteriori estimate errors as ek
ˆ
5 xk2
xk, and the
a posteriori estimate error covariance is Pk
5 E[ek? eT
k ], so
the equation of update error covariance at time step k is
Pk
5 (12 KkH)P2
k: (15)
Since the calculation of causality by the LKIF is mainly based
on the covariance between samples, it is vital to accurately esti-
mate the covariance between the samples. The multivariate
time-varying causality formalism based on the LKIF is realized
by computing the sample covariance with the resulting covari-
ance of each time step estimated by Kalman lter. However, it is
usually dif cult to calculate the process noise covariance Q and
the measurement noise covariance R (Berg et al. 2014); most
current studies assume them as constants. However, Q and R
may change at each time step in practice, thus, we do not assume
they are constants here. Our approach is to rst use the expo-
nential weighted moving average (EWMA) and unweighted
moving average (UWMA) to estimate Q and R of ine, and then
apply the obtained results to the iteration process of Kalman l-
ter, as shown in Eqs. (12) and (13).
In addition, according to Eqs. (11)–(15), it can be seen that
the standard Kalman lter essentially uses the Kalman gain Kk
to weighted average estimates and measurements of yk to im-
prove the accuracy of the measurement, which determines the
weighted component of the measurement when estimating the
state estimates. Therefore, an accurate calculation of Kk is fun-
damental to improve the accuracy of the calculation. However,
correction of the accumulated computational round-off errors
from the state variance-covariance computation was done. This
is because no feedback existed in the gain loop, creating numer-
ical imprecision within the Kalman ltering process. To remedy
this study, we employed the Bierman–Thornton algorithm
(Bierman and Thornton 1977), which uses modi ed Cholesky
factors of the state variance–covariance matrix. The detailed de-
scription of this algorithm can be found in Hagan et al. (2019).
This study uses the square root Kalman lter based on the
Bierman–Thornton algorithm to realize the multivariate time-
varying LKIF causality formalism.
c. The multivariate time-varying causality formalism
based on the Liang–Kleeman information flow
The algorithm begins with the computation of the process
and measurement of noise covariances Q and R respectively.
From there, the lter starts by calculating the Kalman gain K
through the updated covariance matrix P at each time step.
This step is used to compute the causality. The Bierman and
Thornton algorithms are used at the measurement and tem-
poral updates to make the calculation more stable. In this
way, Eq. (6) can be rewritten as
5
j51
1
detP ∑
d
˙
D2jPj,d1
P12
P11
, (16)
where P is the resulting covariance matrix at each time step of
the iteration,˙
Dij are the cofactors of the matrix P5 (Pij), and
Tt2"1|3,4,5,…,d
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1857
FIG. 1. The framework of MtvLK.
Pj,d1 are the resulting covariance between Xj and the derived
series˙
X 1.
Since the EMWA and UWMA require choice of a look-
back window length to compute the moving average before
estimating Q and R of ine, an information length of the win-
dow length is lost to do the forward update of the lter. We
propose an effective solution to the problem; the details are
given in appendix B. The formalism is henceforth referred to
as MtvLK (multivariate time-varying Liang–Kleeman infor-
mation ow) and will be used throughout the rest of this pa-
per; the framework of MtvLK is shown in Fig. 1. In addition,
it is particularly important to note that when there are only
two variables in the system, MtvLK will be the same as the
framework proposed by Hagan et al. (2019).
3. Simulation studies
To verify the reliability of MtvLK, we set up three idealized
experiments with known causalities to examine how well the
information ow of the MtvLK captures the preset causal
structures. The LKIF in this study is measured in nats per unit
time.
a. Synthetic model 1
In land–atmosphere interactions, causal relationships between
variables often vary over time instead of remaining constant, as
exempli ed by the impact of soil moisture on temperature in the
Chinese region (Hagan et al. 2019). The ndings of Hagan et al.
(2019) indicate that in humid areas of China, the in uence of soil
moisture on temperature is mostly nonsigni cant throughout the
year, except for a signi cant statistical signal during the spring
season. Moreover, the information ow between soil mois-
ture and temperature in spring exhibits a trend of initial in-
crease followed by a subsequent decrease. Drawing upon the
varying causal relationships observed in this case, we have
designed the following synthetic model that incorporates
multiple variables:
⎧ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎨ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎩
x1(t)5 0:35x1(t2 1) 1 c2"1(t)x2(t2 1) 1 «1(t)
x2(t)5 0:35x2(t2 1) 1 c1"2(t)x1(t2 1) 1 «2(t)
x3(t)5 0:35x3(t2 1) 1 c2"3(t)x2(t2 1) 1 «3(t)
:
(17)
The rst synthetic model is a ternary autoregressive process
of X5 [x1, x2, x3], as described in Eq. (17). The time series
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1858
J O U R N A L x1, x2, and x3 have the same length of 2000 time points with
added white noise of zero means and unit variance «1(t), «2(t),
and «3(t). Note that c2"1 and c1"2 represent the in uence of
x2 on x1 and that of x1 on x2, while c2"3 represents the in u-
ence of x2 on x3. For 0 , t # 500 and 1500 , t # 2000, all the
causalities are set to be 0. For 500 , t # 1500, all the causali-
ties are gradually increased from 0 to 0.5, with an increment
of 0.001 per time step when 500 , t # 1000, and all the causal-
ities are gradually decreased from 0.5 to 0, with a decrement
of 0.001 per time step when 1000 , t # 1500. Thus, in this sys-
tem, when 0 , t # 500 and 1500 , t # 2000, no causality ex-
ists among x1, x2, and x3. When 500 , t # 1500, causalities
exist between x1 and x2 and from x2 to x3. The full causal
structure of Eq. (17) is shown in Figs. 2a and 2b. In Figs. 2c–j,
the blue lines show the realization averages of the absolute
value of time-varying information ows, while the red lines
are the signi cant values realizations at a 1% signi cance
level. We infer causality when the absolute information ow
values are greater than the signi cant values. All the results
are the average of the absolute values of 1000 realizations at a
1% signi cance level.
Figures 2c–j are the ensemble means of the time-varying in-
formation ow results (in nats per unit time). We added two
dashed lines in the gure at the causal relationship turning
points of t5 500 and t5 1500 for a more intuitive display.
Additionally, it is worth noting that to more clearly depict the
causal relationships each subplot focuses on, we have added a
small schematic at the top of each one. In these schematics,
the blue variables indicate a variable whose role is being con-
sidered within the system, while the gray variables signify
those whose roles are not currently being considered. Yellow
solid arrows represent prede ned causal relationships that
have not been tested yet, whereas red solid arrows denote
those prede ned causal relationships currently under testing.
Gray solid arrows pointing toward gray variables indicate
causal relationships that are not being considered in the sys-
tem at present. Meanwhile, red dashed arrows signify causal
relationships that are currently being tested but were not
prede ned.
The results in Figs. 2c–j are consistent with the prede ned
causalities in Eq. (17), showing that x1 in uences x2 (Figs. 2c,d)
and x2 in uences both x1 (Figs. 2e,f) and x3 (Figs. 2g,h) where
500 , t # 1500. Figures 2c and 2d are the absolute value of the
time-varying information ows from x1 to x2 (|Tx1"x2|) and x1 to
x2 in uenced by x3 (|Tx1"x2|x3|), respectively. The results in the
two gures show that x1 in uences x2 for 500 , t # 1500, the
causal intensity exhibits an initial increase followed by a subse-
quent decrease, no causality exists between x1 and x2 when
0 , t # 500 and 1500 , t # 2000, and an insigni cant in uence
of x3 in the multivariate case (Fig. 2f). It is important to empha-
size that the absolute value of information ow employed in
this study solely serves as a measure of the causal strength be-
tween variables. It does not carry any connotations related to
positivity or negativity, nor does it imply any other meaning
beyond quantifying the strength of the causal relationship. Fur-
thermore, it is crucial to acknowledge that the MtvLK necessi-
tates the selection of a suitable lookback window length for
computing the moving average, which is subsequently used in
O F C L I M A T E VOLUME 37
of ine estimation of Q and R. The choice of this window length
can be tailored to meet the speci c requirements of the experi-
ment. In this synthetic test, we opted for a window length of 300
to facilitate our investigation. Consequently, the depicted re-
sults in Fig. 2 indicate that when causalities change, a relatively
brief time step is required for the transition to occur, with the
maximum value being attained at approximately t5 1200 in-
stead of t5 1000. Figures 2e and 2f are the absolute value of
the time-varying information ows from x2 to x1 (|Tx2"x1|) and
x2 to x1 in uenced by x3 (|Tx2"x1|x3|), respectively. The results in
the two gures also show that x2 in uences x1 for 500 , t #
1500, and an insigni cant in uence of x3 in the multivariate case
(Fig. 2f). Figures 2g and 2h show the absolute value of the time-
varying information ow from x2 to x3 (|Tx2"x3|) and that of x2
to x3 in uenced by x1 (|Tx2"x3|x1|). Again, the results in the two
gures are identical and point to the negligible in uence of x1 in
the multivariate case (Fig. 2h). Finally, Figs. 2i and 2j are the
absolute value of the time-varying information ow from x1 to
x3 (|Tx1"x3|) and that of x1 to x3 in uenced by x2 (|Tx1"x3|x2|).
Both results correctly show that there are no causalities for
0 , t # 500 and 1500 , t # 2000. However, |Tx1"x3|x2| also
shows no causalities for 500 , t # 1500 (Fig. 2j) while |Tx1"x3|
shows signi cant causalities. These results might suggest that
|Tx1"x3| interprets the continuous information ow from x1 to
x2, and then x2 to x3 as a potential causal link (|Tx1"x3|) when
the confounding variable x2 is not considered (Fig. 2i). All of
the ndings above exhibit a high degree of consistency with the
predetermined causal structure established in this synthetic
model. Moreover, the temporal depiction of causation strength
effectively captures the dynamics of causal relationships over
time.
Additionally, we conducted the same test on all links that
did not preset causality, with the results as shown in Fig. C1
(appendix C). Examining the gure, we can clearly see that
|Tx3"x1|x2| and |Tx3"x2|x1| shows no causalities for 0 , t # 500
and 1500 , t # 2000. In addition, although |Tx3"x1|x2| and
|Tx3"x2|x1| exhibit a tendency to initially rise and then decline
for 500 , t # 1500, both |Tx3"x1|x2| and |Tx3"x2|x1| still shows
no causalities, which means |Tx3"x1|x2| and |Tx3"x2|x1| have no
causalities for 0 , t # 2000, which is aligning well with our ini-
tial expectations.
b. Synthetic model 2
In complex multivariable systems similar to the land–
atmosphere interactions, besides the case of homologous in u-
ences as in synthetic model 1, there are also many cases where
several variables in uence one variable simultaneously. There-
fore, we generated the following tertiary autoregressive pro-
cess based on synthetic model 1:
⎧ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎨ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎩
x1(t)5 0:35x1(t2 1) 1 c2"1(t)x2(t2 1) 1 «1(t)
x2(t)5 0:35x2(t2 1) 1 «2(t)
x3(t)5 0:35x3(t2 1) 1 c1"3(t)x1(t2 1) 1 c2"3(t)x2(t2 1) 1 «3(t):
(18)
The process of X5 [x1, x2, x3], as described in Eq. (18). Here,
for 0 , t # 500 and 1500 , t # 2000, c2"1, c2"3 and c1"3 are
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1859
FIG. 2. (a) Schematic diagram of the conceptual model as described in Eq. (17) when 0 , t # 500 and
1500 , t # 2000. (b) As in (a), but for interval 500 , t # 1500. Absolute values of the time-varying informa-
tion ows among x1, x2, and x3 (in nats per unit time): (c) |Tx1"x2| and Sigx1"x2; (d) |Tx1"x2|x3| and Sigx1"x2|x3;
(e) |Tx2"x1| and Sigx2"x1; (f) |Tx2"x1|x3| and Sigx2"x1|x3; (g) |Tx2"x3| and Sigx2"x3; (h) |Tx2"x3|x1| and Sigx2"x3|x1;
(i) |Tx1"x3| and Sigx1"x3; (j) |Tx1"x3|x2| and Sigx1"x3|x2. Dashed lines represent the causal relationship turning
points. All the results are the averages of 1000 realizations, and all the signi cance tests are performed at a
1% signi cance level.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1860
J O U R N A L set to be 0; for 500 , t # 1500, all the causalities are gradually
increased from 0 to 0.5, with an increment of 0.001 per time
step when 500 , t # 1000, and all the causalities are gradually
decreased from 0.5 to 0, with an decrement of 0.001 per
time step when 1000 , t # 1500. Thus, in this system, when
0 , t # 500 and 1500 , t # 2000, there are no direct causali-
ties among the x1, x2, and x3; and when 500 , t # 1500, x3 is
directly in uenced not only by x2 but also by x1. The causality
among the time series x1, x2, and x3 is shown in Figs. 3a
and 3b. Similar to synthetic model 1, the window length of
300 was also chosen in this synthetic model to facilitate our in-
vestigation. Figures 3c–h are the ensemble means of the abso-
lute value of the time-varying information ows among the x1,
x2, and x3 (in nats per unit time). All the results are obtained
at a 1% signi cance level. Figures 3c and 3d shows the abso-
lute value of the time-varying information ow from x2 to x1
(|Tx2"x1|) and that from x2 to x1 in uenced by x3 (|Tx2"x1|x3|).
Both approaches show that x3 does not affect the causality
from x2 to x1 since there is no preset feedback from x3 to x1
or x2. Figures 3e and 3f show the absolute value of the time-
varying information ow from x2 to x3 (|Tx2"x3|) and that
from x2 to x3 in uenced by x1 (|Tx2"x3|x1|), for 500 , t # 1500,
where we nd that |Tx2"x3|x1| is lower than |Tx2"x3|, due to the
feedback from x1 (Barrett and Barnett 2013). Finally, Figs. 3g
and 3h show the absolute value of the time-varying informa-
O F C L I M A T E VOLUME 37
tion ow from x1 to x3 (|Tx1"x3|) and that from x1 to x3 in u-
enced by x2 (|Tx1"x3|x2|). Both cases reproduce the expected
causalities as preset in Eq. (18). These results demonstrate
the reliability of the MtvLK to unravel time-varying causali-
ties even in complex systems.
Similar to synthetic model 1, we tested all links that did not
preset causality in this synthetic model, as shown in Fig. C2
(appendix C). Figure C2 also shows that |Tx1"x2|x3|, |Tx3"x1|x2|,
and |Tx3"x2|x1| all show no causalities for 0 , t # 500 and
1500 , t # 2000, and |Tx1"x2|x3|, |Tx3"x1|x2|, and |Tx3"x2|x1| all ex-
hibit a tendency to initially rise and then decline for 500 , t #
1500, but there are both no causalities for 500 , t # 1500, which
aligns well with our initial expectations too.
c. Synthetic model 3
Synthetic model 1 and synthetic model 2 primarily focus on
examining the interactions among three variables, and their
study has successfully demonstrated the reliability of the
MtvLK method in complex systems. Nevertheless, when in-
vestigating land–atmosphere interactions, sometimes it be-
comes imperative to account for the in uence resulting from
more than three variables. To address this requirement com-
prehensively, we generated the following ve-level autore-
gressive process:
⎧ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎨ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎪ ⎩
x1(t)5 0:35x1(t2 1) 1 «1(t)
x2(t)5 0:35x2(t2 1) 1 c1"2(t)x1(t2 1) 1 «2(t)
x3(t)5 0:35x3(t2 1) 1 c2"3(t)x2(t2 1) 1 «3(t)
x4(t)5 0:35x4(t2 1) 1 c2"4(t)x2(t2 1) 1 c3"4(t)x3(t2 1) 1 «4(t)
x5(t)5 0:35x5(t2 1) 1 c1"5(t)x1(t2 1) 1 c4"5(t)x4(t2 1) 1 «5(t)
:
(19)
The process of X5 [x1, x2, x3, x4, x5], as described in Eq. (19).
For 0 , t # 500, c2"1, c2"3, and c1"3 are set to be 0; for
500 , t # 1500, all the causalities are gradually increased
from 0 to 0.5, with an increment of 0.0005 per time step; for
1500 , t # 2000, c2"1, c2"3, and c1"3 are set to be 0.5. Thus,
in this system, when 0 , t # 500, there are no direct causali-
ties among the time series x1, x2, x3, x4, and x5 as shown in
Fig. 4a; when 500 , t # 2000, causalities exist from x1 to x2, x2
to x5, x2 to x3, x2 to x4, x3 to x4, and x4 to x5, where x4 is directly
in uenced not only by x2 but also by x3, as shown in Fig. 4b, all
the causalities among the variables exhibit an initial gradual
increase, followed by a period of stability where they remain
unchanged. Figures 4c–h are the ensemble means of the abso-
lute value of the time-varying information ows among the x1,
x2, x3, x4, and x5 (in nats per unit time). All the results are ob-
tained at a 1% signi cance level. For this synthetic model, we
have selected a lookback window length of 200 for the experi-
mental. Figures 4c–h show the absolute value of the time-
varying information ow from x1 to x2 in uenced by x3, x4, and
x5 (|Tx1"x2|x3,x4,x5|), from x1 to x5 in uenced by x2, x3, and x4
(|Tx1"x5|x2,x3,x4|), from x2 to x3 in uenced by x1, x4, and
x5 (|Tx2"x3|x1,x4,x5|), from x2 to x4 in uenced by x1, x3, and x5
(|Tx2"x4|x1,x3,x5|), from x3 to x4 in uenced by x1, x2, and x5
(|Tx3"x4|x1,x2,x5|), and from x4 to x5 in uenced by x1, x2, and x3
(|Tx4"x5|x1,x2,x3|), respectively. All test results effectively repli-
cate the predetermined time-varying causal relationships
within the synthetic model, and the time-varying causal
strength among variables consistently aligns with the preset
conditions. Consequently, this experiment serves as compel-
ling evidence to af rm the ef cacy of MtvLK in complex sys-
tems involving more than three variables. It demonstrates the
method’s ability to accurately identify the time-varying causal-
ity between variables within multivariate complex systems.
Similar to synthetic model 1 and synthetic model 2, we
tested all links that did not preset causality in this synthetic
model; the results are shown in Fig. C3 (appendix C). Figures
C3c–n demonstrate that no causal relationships were detected
for all the links without prede ned causality for 0 , t # 2000,
These results further prove the accuracy of MtvLK in multi-
variate complex systems.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1861
FIG. 3. (a) Schematic diagram of the conceptual model as described in Eq. (18) when 0 , t # 500 and 1500 , t # 2000.
(b) As in (a), but for the interval 500 , t # 1500. Absolute values of the time-varying information ows among x1, x2, and x3
(in nats per unit time): (c) |Tx2"x1| and Sigx2"x1; (d) |Tx2"x1|x3| and Sigx2"x1|x3; (e) |Tx2"x3| and Sigx2"x3; (f) |Tx2"x3|x1| and
Sigx2"x3|x1; (g) |Tx1"x3| and Sigx1"x3; (h) |Tx1"x3|x2| and Sigx1"x3|x2. Dashed lines represent the causal relationship turning points.
All the results are the averages of 1000 realizations, and all the signi cance tests are performed at a 1% signi cance level.
4. Real applications in land–atmosphere interactions
Vegetation is a life support system for the survival and de-
velopment of human society. It is a natural link between soil,
atmosphere, and water, and has complex interactions with the
climate system (Cui et al. 2020; Feng et al. 2017). Vegetation
is part of the terrestrial ecosystem, more speci cally, the ter-
restrial biosphere (N. Chen et al. 2021; Liu et al. 2022), and in-
uences the global carbon and water cycle (Liu et al. 2014;
Pr˘
av˘ alie 2018) by regulating carbon balance, alleviating the
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1862
J O U R N A L O F C L I M A T E VOLUME 37
FIG. 4. (a) Schematic diagram of the conceptual model as described in Eq. (19) when 0 , t # 500. (b) As in (a), but
for the interval 500 , t # 2000. Absolute values of the time-varying information ows among x1, x2, x3, x4, and x5 (in
nats per unit time): (c) |Tx1"x2|x3,x4,x5| and Sigx1"x2|x3,x4,x5; (d) |Tx1"x5|x2,x3,x4| and Sigx1"x5|x2,x3,x4; (e) |Tx2"x3|x1,x4,x5|
and Sigx2"x3|x1,x4,x5; (f) |Tx2"x4|x1,x3,x5| and Sigx2"x4|x1,x3,x5; (g) |Tx3"x4|x1,x2,x5| and Sigx3"x4|x1,x2,x5; (h) |Tx4"x5|x1,x2,x3|
and Sigx4"x5|x1,x2,x3. Dashed lines represent the causal relationship turning points. All the results are the averages of
1000 realizations, and all the signi cance tests are performed at a 1% signi cance level.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1863
increase of greenhouse gas concentration, and reducing soil
erosion (Le Quéré et al. 2015; Liu et al. 2017; Melnikova and
Sasai 2020; Wang et al. 2021; You et al. 2020). Gross primary
production (GPP) is a good proxy for re ecting vegetation
growth (Liu et al. 2014; Wang et al. 2021). Many studies have
shown that high air temperature and low water availability
can signi cantly inhibit the growth of terrestrial vegetation,
resulting in decreasing GPP (H. Chen et al. 2021; Chen et al.
2020; Liu et al. 2020; Zhang et al. 2019). It has been found
that soil moisture (SM) and vapor pressure de cit (VPD) are
two important driving factors affecting vegetation growth
(Kimm et al. 2020; Novick et al. 2016). Therefore, understand-
ing how SM and VPD impact GPP is essential for understand-
ing global or regional terrestrial carbon cycles and predicting
future climate change.
In recent years, although the interactions between SM,
VPD, and GPP have been investigated in several studies,
there are uncertainties about which mainly in uences GPP:
SM or VPD. SM affects vegetation growth in many ways. It
not only determines the maximum amount of water that can
be absorbed by plant roots (Sperry et al. 2017) but also affects
stomatal conductance of vegetation canopy (Anderegg et al.
2017; Stocker et al. 2018) and controls carbon allocation dur-
ing vegetation growth (Palacio et al. 2014). Jung et al. (2017)
quanti ed the impact of temperature, solar radiation, and SM
on GPP based on statistical regression methods and found
that SM was the dominant factor of GPP interannual varia-
tion. Liu et al. (2020) pointed out that the reduction in SM
caused by global warming accounts for about 70% of the GPP
variability in the world. On the other hand, VPD also signi -
cantly impacts vegetation: high VPD may increase evapo-
transpiration, which induces vegetation to close its stomata
to reduce leaf water loss and inhibit plant photosynthesis
(Li et al. 2022; Oren et al. 1999). Along these lines, it has been
proposed that VPD plays a dominant role in in uencing GPP
(Besnard et al. 2021; Madani et al. 2020; Wang et al. 2014).
Yuan et al. (2019) found that global vegetation had a decreas-
ing trend after the 1990s, which was mainly due to the signi -
cant increases in VPD, inhibiting vegetation photosynthesis.
Madani et al. (2020) pointed out that VPD was replacing tem-
perature as the dominant factor controlling global GPP in re-
cent decades because the increase of VPD would lead to
increased vegetation impedance and thus hinder vegetation
photosynthesis.
Besnard et al. (2021) observed that about 56% of the global
vegetation carbon storage is controlled by temperature and
VPD, while the impact of SM accounts for only 29%. Humphrey
et al. (2021) also pointed out that the root cause of the above
controversy is that the in uencing mechanism of climate change
on vegetation involves complex land–atmosphere interaction.
Although SM dominates the interannual variability of GPP, it
mainly affects VPD through atmospheric feedback induced by
decreasing soil moisture, and then inhibits vegetation photosyn-
thesis through VPD.
However, previous studies often ignore the in uence of
land–atmosphere interactions caused by changes in SM. The
above review of the debate indicates that the causal relation-
ships among SM, VPD, and GPP are complex, including
FIG. 5. The study area. RA represents a wet area and RB a partly
wet-partly dry climate region.
various direct or indirect causalities. If we analyze the causal
relationship between only two variables, the in uence of the
other variables on the system cannot be considered, and the
indirect effects cannot be analyzed, leading to incorrect con-
clusions. For such a complex system, we must consider the in-
uence of multiple variables on the system simultaneously to
analyze the causal relationship accurately. Therefore, in this
section, we apply the MtvLK to study the mechanism of SM
and VPD in impacting GPP in China, to understand the direct
or indirect causal effects of SM and VPD on GPP in China.
The territory of China features a complex topography and
a diverse climate. Hagan et al. (2019) selected two typical re-
gions, the Huanan region and Huabei region, for their study,
as the climate conditions of these two regions are representa-
tives of strong land–atmosphere interactions. In this study,
these two regions are also selected, as shown as region A
(RA) and region B (RB) in Fig. 5. The latitudes and longi-
tudes of RA range from 25.58 to 29.58N, and from 113.58 to
118.58E, respectively. The climate in this region is humid, with
signi cant precipitation, representing the humid areas of
China. RB, located between 358
–398N and 1118
–1168E, on the
other hand, is a transitional climate zone between dry and wet
climates, representing the semihumid and semiarid regions in
China. The GPP we will be using is the ensemble mean of
FLUXCOM GPP, which has been widely used to represent
the carbon uptake by land ecosystems (Jung et al. 2017). The
data are gridded at a horizontal resolution of 0.58, spanning
from January 1979 to December 2018, which the time resolu-
tion is the monthly time step. They can be downloaded from
http://www. uxcom.org/CF-Download/. Since FLUXCOM GPP
is calculated based on ERA5 meteorological driving data, we
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1864
J O U R N A L also use the SM and VPD from ERA5-Land monthly data to
ensure data consistency (available at https://cds.climate.
copernicus.eu). The weighted average of SM between 0 and
100 cm is used here, with weights determined by the thickness
of each layer (0–7, 7–28, 28–100 cm). VPD is estimated with
the 2-m air temperature and 2-m dewpoint temperature (Allen
et al. 1998). Since the time span of the GPP data differs from
that for SM and VPD, we select the overlapping period from
January 1981 to December 2018. In addition, we calculate
the monthly anomalies for all variables from January 1981 to
December 2018, by subtracting the climatology from the origi-
nal data.
The estimated results may not be accurate enough at the
beginning because the Kalman lter is a learning algorithm.
Hence, we select the 30-yr (360 months) results from January
1989 to December 2018, with the initial spinup period re-
moved. In addition, we have selected a lookback window
length of 90 days for this experiment. Figures 6 and 7 show
the absolute value of the information ow rates between SM,
VPD, and GPP in South China (RA) and North China (RB)
as functions of time from January 1989 to December 2018.
The signi cance tests of each pixel in the two regions are com-
puted at a 5% signi cance level. The solid blue line shows the
absolute value of the average information ow of all the indi-
vidual pixels in the selected regions, and the solid red line is
the mean signi cance test values for all the pixels. Causality is
implied if the solid blue line is higher than the solid red line.
In RA, Figs. 6a and 6b represent the time-varying information
ow from VPD to SM (|TVPD"SM|) and that from VPD to SM
in uenced by GPP (|TVPD"SMG|GPP|), respectively. It can be
seen that both are almost signi cant during the whole period
and the results are almost the same. These results suggest that
causality exists from VPD to SM with potentially very little
GPP in uence in this region since both results are identical.
These results are identical to the toy model results in Figs. 2c
and 2d where we also found little in uence of the third vari-
able. Additionally, we nd a decreasing trend in the strength
of the causality from VPD to SM, potentially due to global
warming. Figures 6c and 6d show the time-varying informa-
tion ow from VPD to GPP (|TVPD"GPP|) and that from VPD
to GPP in uenced by SM (|TVPD"GPP|SM|), respectively. Both
are also signi cant most of the time, except between 1998 and
2004. Figures 6e and 6f represent the time-varying informa-
tion ow from SM to GPP (|TSM"GPP|) and that from SM to
GPP in uenced by VPD (|TSM"GPP|VPD|), respectively.
Clearly, |TSM"GPP| is barely signi cant before 2004; but after
that, the causality increases signi cantly from 2004 to 2015.
However, |TSM"GPP|VPD| is not signi cant for most of the
time, though it is signi cant in 2004 and around the peak
causal period of |TSM"GPP| (2010–12). The difference in the
results might suggest a potential causal structure from SM to
GPP as we have identi ed in Fig. 2b. In this region, the cau-
sality from SM to GPP might comprise the in uence of VPD
on SM (as that from x2 to x1 in Fig. 2b) and the in uence of
VPD on GPP (as that from x2 to x3 in Fig. 2b). As a result,
when we only consider |TSM"GPP|, we see a similar causality
as we nd in Fig. 2i, while if the in uence of VPD is consid-
ered, such as |TSM"GPP|VPD|, the causal structure undergoes
O F C L I M A T E VOLUME 37
tremendous changes. Also, as we have found in Fig. 6f, this
causal structure changes with time, where VPD might play a
mediating role at some time instants (2004, 2010–12), but no
role is in play in the years when |TSM"GPP|VPD| is insigni cant.
Nonetheless, it is worth mentioning that, based solely on the
revealed causality, one still can hardly tell the underlying
mechanism; what one gets are merely the probable outcomes
resulting from uncertain causes (Liang 2014). Finally, the im-
pact of SM on VPD is also found to be insigni cant in Figs. 6g
and 6h.
Dry anomalies could explain the peaking information ow
we have found around 2010 through 2014, when anomalous
SM conditions would come into play due to increased atmo-
spheric demands, which could, in turn, potentially lead to
drought conditions (Figs. 6e,f). Furthermore, during the same
period where the SM" GPP causality peaks, we also nd sig-
ni cant lows in the VPD " SM causality (Figs. 6a,b). As
noted by Hagan et al. (2019) and Madani et al. (2020), this is
characteristic of the region RA.
Next, we analyze the mechanism of how SM and VPD af-
fect GPP in RB. Figures 7a and 7b give the time-varying infor-
mation ow from VPD to SM (|TVPD"SM|) and that from
VPD to SM in uenced by GPP (|TVPD"SM|GPP|), respectively.
Both results show signi cant causalities between 1989 and
2018 over the entire period with and without the in uence of
VPD, just like that of Figs. 6a and 6b. Similarly, we nd a de-
creasing linear trend in these causalities as shown in Figs. 6a
and 6b. Shown in Figs. 7c and 7d are the time-varying infor-
mation ow from VPD to GPP (|TVPD"GPP|) and that from
VPD to GPP in uenced by SM (|TVPD"GPP|SM|). Even though
both are signi cant during the whole period, |TVPD"GPP| is
larger in magnitude than |TVPD"GPP|SM|, with the causal struc-
ture similar to that found in synthetic model 2. This hints at
the existence of potential feedback from SM. Here, we nd a
long-term decreasing linear trend in the information ows. In
Figs. 7e and 7f, we see that the information ows from SM to
GPP (|TSM"GPP|) and from SM to GPP in uenced by VPD
(|TSM"GPP|VPD|) as functions of time. Clearly both are signi -
cant throughout, with |TSM"GPP| larger in magnitude than
|TSM"GPP|VPD|. Just as in Figs. 7c and 7d, the difference in the
magnitude suggests a feedback from VPD. Previous studies
have shown that both SM and VPD are in uencing factors of
GPP in semiarid areas although the sensitivity of GPP to
VPD is considered higher than the sensitivity of GPP to SM
(Humphrey et al. 2021). Based on Figs. 7c–f, we can conclude
that SM and VPD both impact GPP over the entire period. In
addition, we also nd that the information ow from VPD to
GPP in uenced by SM is higher than the information ow
from SM to GPP in uenced by VPD. These results agree well
with the relevant research conclusions so far. For instance,
Novick et al. (2016) highlighted the signi cant impact of VPD
on vegetation ecosystems, surpassing the in uence of tempera-
ture and soil moisture. Similarly, Madani et al. (2020) suggested
that VPD has gradually become the dominant factor controlling
global GPP in recent decades, with the main mechanism being
the increase in vegetation resistance due to elevated VPD,
thereby impeding photosynthesis (Fu et al. 2022).
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1865
FIG. 6. The absolute values of the time-varying information ows among soil moisture (SM), gross primary
productivity (GPP), and vapor pressure de cit (VPD) (in nats per month) for RA: (a) |TVPD"SM| and SigVPD"SM;
(b) |TVPD"SM|GPP| and SigVPD"SM|GPP; (c) |TVPD"GPP| and SigVPD"GPP; (d) |TVPD"GPP|SM| and SigVPD"GPP|SM;
(e) |TSM"GPP| and SigSM"GPP; (f) |TSM"GPP|VPD| and SigSM"GPP|VPD; (g) |TSM"VPD| and SigSM"VPD;
(h) |TSM"VPD|GPP| and SigSM"VPD|GPP. All the signi cance tests are performed at a 5% signi cance level.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1866
J O U R N A L O F C L I M A T E VOLUME 37
FIG. 7. The absolute values of the time-varying information ows among soil moisture (SM), gross primary productivity
(GPP), and vapor pressure de cit (VPD) (in nats per month) for RB: (a) |TVPD"SM| and SigVPD"SM; (b) |TVPD"SM|GPP|
and SigVPD"SM|GPP; (c) |TVPD"GPP| and SigVPD"GPP; (d) |TVPD"GPP|SM| and SigVPD"GPP|SM; (e) |TSM"GPP| and
SigSM"GPP; (f) |TSM"GPP|VPD| and SigSM"GPP|VPD. All the signi cance tests are performed at a 5% signi cance level.
Finally, we have summarized the aforementioned results to
facilitate a clearer and more intuitive comparison of the differ-
ences between the two regions. First, the causal relationships
among SM, VPD, and GPP in RA are sketched in Fig. 8. We
have divided the results from 1989 to 2018 into three segments
for presentation, The left, center, and right columns in the g-
ure represent the periods January 1989–December 1998, Janu-
ary 1999–December 2008, and January 2009–December 2018,
respectively. The red arrow indicates that the absolute value of
the information ow (IF) increases in this time range, and the
blue arrow indicates that the absolute value of the IF decreases.
The thickness of the arrow represents the absolute value of the
IF, a thicker arrow indicates a larger absolute value of the IF.
Figures 8a1–c1 and 8a2–c2 represent the causality between VPD
to SM and the causality between VPD to SM in uenced by
GPP, respectively. Figures 8d1–f1 and 8d2–f2 represent the cau-
sality between VPD to GPP and the causality between VPD to
GPP in uenced by SM, respectively. Figures 8g1–i1 and 8g2–i2
represent the causality between SM to GPP and the causality be-
tween SM to GPP in uenced by VPD, respectively.
As shown in Figs. 8a1–c1 and 8a2–c2, regardless of whether
the in uence of GPP on the system is considered, the magnitude
of causality from VPD to SM generally displays a trend of de-
creasing from 1989 to 2008 and then increasing from 2009 to
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1867
FIG. 8. A schematic of the time-varying causality among SM, VPD, and GPP for RA. Shown are
the time periods (left) January 1989–December 1998, (center) January 1999–December 2008, and
(right) January 2009–December 2018. (a1)–(c1),(a2)–(c2) The causality between VPD to SM and the
causality between VPD to SM in uenced by GPP, respectively. (d1)–(f1),(d2)–(f2) The causality be-
tween VPD to GPP and the causality between VPD to GPP in uenced by SM, respectively. (g1)–
(i1),(g2)–(i2) The causality between SM to GPP and the causality between SM to GPP in uenced by
VPD, respectively. (j) The causality between SM to GPP in 2004–18 and (k) the change of causality
when the in uence of VPD is taken into account, and the real causal relationships in 2004–18. The red
arrow indicates that the absolute value of the IF increases, and the blue arrow indicates that the abso-
lute value of the IF decreases. The thickness of the arrow represents the absolute value of the informa-
tion ow.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1868
J O U R N A L 2018. Moreover, there is no signi cant difference in the causal
strength between the two scenarios. Similarly, Figs. 8d1–f1 and
8d2–f2 show that irrespective of considering the in uence of SM
on the system, the magnitude of causality from VPD to GPP pri-
marily shows a trend of rst decreasing and then increasing dur-
ing 1989–2008 and remains relatively stable within 2009–18, and
there is also no signi cant difference in the causal strength be-
tween the two scenarios. Figures 8g1–i1 and 8g2–i2 indicate that
only within the range of 1989–98, whether or not the in uence of
VPD on the system is considered, the causality of SM to GPP is
almost negligible, and there is no noticeable difference between
them. However, as shown in Figs. 8h1–i1 and 8h2–i2, there are
signi cant differences between the in uence of SM on GPP with-
out considering VPD effects and the in uence of SM on GPP
when considering VPD effects. When not considering the in u-
ence of VPD on the system, the magnitude of causality from SM
to GPP exhibits a trend of rst increasing and then decreasing, as
shown in Figs. 8h1–i1. However, when considering the in uence
of VPD on the system, there is no direct causality between SM
to GPP, as shown in Figs. 8h2–i2.
To better demonstrate the in uence mechanism of SM and
VPD to GPP in RA. we have individually highlighted the most
representative ndings, as shown in Figs. 8j and 8k. Figure 8j rep-
resents the causality between SM to GPP in 1999–2018, Fig. 8k
represents the change of causality when the in uence of VPD is
taken into account, and the real causal relationships in 1999–2018.
It represents when VPD is added into the system, a change in
causality occurs, so VPD is a common cause of SM and GPP.
Thus, although all these three variables are highly correlated, the
causalities on SM and GPP look like Fig. 8k in 1999–2018. In ad-
dition, we also found the information ow from VPD to GPP in-
uenced by SM is higher than the information ow from SM to
GPP in uenced by VPD. These results show that MtvLK can de-
tect the in uence of confounder(s), and correctly identify causali-
ties in complex multivariate systems.
Similar to Fig. 8, the causal relationships among SM, VPD,
and GPP in RB are sketched in Fig. 9. As shown in Figs. 9a1–c1
and 9a2–c2, regardless of whether the in uence of GPP on the
system is considered, the magnitude of causality from VPD to
SM generally shows a trend of increasing rst, then decreasing,
and then increasing again in three time periods. Moreover,
there is no signi cant difference in the magnitude of causality
between the two cases. Figures 9d1–f1 and 9d2–f2 show that re-
gardless of whether or not considering the in uence of SM on
the system, the magnitude of causality from VPD to GPP is rel-
atively stable from 1989 to 1998, and shows a trend of increasing
rst and then decreasing from 1999 to 2008. Finally, it also
shows a trend of increasing rst and then decreasing from 2009
to 2018, and the magnitude of causality from 2009 to 2018 is
lower than that from 1999 to 2008. In addition, we also nd that
when considering the in uence of SM on the system, the magni-
tude of causality from VPD to GPP is lower than that without
considering the in uence of SM on the system, this hints at the
existence of potential feedback from SM. Figures 9g1–i1 and
9g2–i2 represent the causality between SM to GPP without con-
sidering the in uence of VPD, and the causality between SM to
GPP with considering the in uence of VPD, respectively.
Figures 9g1–i1 show that without considering the in uence of
O F C L I M A T E VOLUME 37
VPD, the magnitude of causality from SM to GPP showed an
increasing trend in 1989–98, then showed a decreasing trend in
1999–2008, and nally showed a trend of increasing rst and
then decreasing in 2009–18. Figures 9g2–i2 show that when con-
sidering the in uence of VPD, the magnitude of causality from
SM to GPP increased rst and then decreased from 1989 to
1998, then remained relatively stable from 1999 to 2008, and -
nally increased rst and then decreased again from 2009 to
2018. Additionally, when comparing Figs. 9g1–i1 with Figs. 9g2–i2,
it is evident that the direct causality from SM to GPP persists re-
gardless of whether the in uence of VPD is considered. However,
without taking into account the in uence of VPD, the magnitude
of causality from SM to GPP is stronger than when the in uence
of VPD is considered. This suggests that VPD has a signi cant im-
pact on the causality from SM to GPP.
Finally, we summarized the in uence mechanism of SM
and VPD to GPP in RB, as shown in Figs. 9j and 9k. Figure 9j
shows the causality from SM to GPP in the absence of VPD.
It is consistent with the result in RA. When VPD is added
into the system, the direct causality from SM to GPP still ex-
ists, in contrast to that in RA; besides that, there is also a di-
rect causality from VPD to GPP. Besides these two causal
relations, we note that there also exists an indirect causality
from VPD to GPP via SM, as shown in Fig. 9k. This real-
world problem application shows that SM and VPD in uence
GPP in the semihumid area. Moreover, the information ow
from VPD to GPP in uenced by SM is larger in magnitude
than that from SM to GPP in uenced by VPD. From this, the
MtvLK algorithm can correctly identify the causality in highly
correlated complex systems and effectively give the magni-
tude of causality. It hence provides a powerful tool for causal
inference for complex Earth system problems.
5. Discussion
Identifying causal relationships and quantifying their
strength from time series can help us gain insight into the
physical mechanism underlying the observations: a key prob-
lem in scienti c research. The Liang–Kleeman information
ow quanti es the rate of information between systems,
showing both the direction and magnitude within a cause-
and-effect relation (Liang 2014, 2016, 2021). Since it is rigor-
ously formulated from rst principles, it avoids the spurious
causality sometimes identi ed in Granger causality tests and
tests with other statistical formalisms. Due to the fact that LK
is computed based on the covariance between given time se-
ries, the LK is relatively easier to compute compared to other
approaches. Moreover, Liang (2018) demonstrated with a
nonlinear three-dimensional stochastic gradient system that
that LK can still accurately provide potential causal relation-
ships. Nonetheless, the potential limitations should also be
studied in future studies. In this study we extended a previous
solution to the problem of bivariate LK causality estimation
with nonstationary series (Hagan et al. 2019) to the multivari-
ate cases, based on the Kalman lter’s learning algorithm,
which can identify immediate changes when tracking time-
varying information ow within a system. This endeavor
yields a time-varying causal structure as seen in Eq. (16). In
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1869
FIG. 9. A schematic of the time-varying causality among the SM, VPD, and GPP for RB. Shown are
the time periods (left) January 1989–December 1998, (center) January 1999–December 2008, and (right)
January 2009–December 2018. (a1)–(c1),(a2)–(c2) The causality between VPD to SM and the causality
between VPD to SM in uenced by GPP, respectively. (d1)–(f1),(d2)–(f2) The causality between VPD to
GPP and the causality between VPD to GPP in uenced by SM, respectively. (g1)–(i1),(g2)–(i2) The cau-
sality between SM to GPP and the causality between SM to GPP in uenced by VPD, respectively. (j)
The inferred causal relation between SM and GPP in the absence of VPD in 1989–2018. (k) The causal
relationship among VPD, SM, and GPP in 1989–2018. The red arrow indicates that the absolute value of
the IF increases, and the blue arrow indicates that the absolute value of the IF decreases. The thickness of
the arrow represents the absolute value of the information ow.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1870
J O U R N A L performing the Kalman lter, a lookback window length is
needed to calculate the moving average when estimating Q
and R. Here, we use the exponential weighted moving aver-
age (EWMA) and unweighted moving average (UWMA),
which provide an information length for the window length
lost to do the forward update of the lter. We obtained the
time-varying information ow without missing data by run-
ning the lter backward using the last estimate of the forward
recursion for initialization. Then, we combined both the for-
ward and backward runs together. This algorithm is abbrevi-
ated as MtvLK.
MtvLK has been validated in three idealized synthetic mod-
els, with causality between variables by design varying over
time as shown in Figs. 2–4. In addition, MtvLK effectively sol-
ves the problem of missing window length information in-
curred in choosing a lookback window length to compute the
moving average when using EMWA and UWMA to estimate
Q and R of ine. Hence there is no missing value at each time
step in our results. Additionally, the estimated time-varying
causality accurately reproduces the preset causality in the
models. This is because Kalman ltering has the ability to de-
tect changes. Therefore, immediate changes along time will
be preserved when estimating causal relationships using the
MtvLK, which is challenging to achieve in non-time-varying
LK information ow and methods based on standard sliding
windows. In addition, the principle of nil causality, which ap-
pears as a theorem in the LK formula (Liang 2014, 2016,
2021), is also met in the MtvLK estimate, while with some
commonly used causal inference approaches this may not al-
ways be true. Moreover, even with highly correlated series,
MtvLK is still effective, as veri ed with the toy model
(namely, the synthetic model 1): Although the confounding
variable x2 exists in the system, MtvLK can still correctly iden-
tify the real causality in the multivariable system.
We have also applied the MtvLK in a real-world problem
to investigate how SM and VPD affect GPP in two selected
typical regions of China. Our results show that over the humid
Huanan region in southeastern China, causality exists from
VPD to GPP. While SM is highly correlated with GPP, no di-
rect causality exists between SM and GPP. In the semihumid
and semiarid Huabei regions, direct causality exists both from
VPD to GPP and from SM to GPP.
There is still more room to improve the MtvLK algorithm.
Attention needs to be paid particularly on three issues: First,
the computation is rather expensive because of the Kalman
lter used here, so the computational ef ciency is signi cantly
lower than the original estimation of causality as documented
in Liang (2021). The use of EMWA and UWMA to estimate
Q and R would need further improvement to avoid de ning a
time window length. A more objective way to de ne a win-
dow length would provide a better estimation for the proba-
bility density function of the causal structure. Finally, future
studies on MtvLK should look into incorporating a frequency
domain as was done by Hagan et al. (2019) to show causalities
at different time scales which is important to isolate long- and
short-causal impacts. After these optimizations, a fully op-
timized MtvLK will represent a method with immense po-
tential. Not only can it shed new light on the intricate
O F C L I M A T E VOLUME 37
time–frequency causality relationships in land–atmosphere
interactions, but it can also be applied to analyze complex
causal relationships in various other elds, such as nance,
further enhancing our understanding of causality issues
across diverse domains.
Acknowledgments. This research was funded by the Na-
tional Natural Science Foundation of China (42275028) and
the Sino-German Cooperation Group Program (GZ1447).
We are also grateful to all data providers who made their
data available for use in this study.
Data availability statement. All code required to replicate
this study can be obtained from https://github.com/FeihongZhou/
MtvLK.git. All data used for this study are publicly available on-
line. The FLUXCOM GPP data are provided by Max Planck
Institute for Biogeochemistry at http://www. uxcom.org/CF-
Download/. The ERA5-Land data are provided by the European
Centre for Medium-Range Weather Forecasts at https://cds.
climate.copernicus.eu.
APPENDIX A
Solution for Missing Window Length Information Length
Consider a d-dimensional system. First, we compute the
time-varying information ow from x2 to x1 based on Eq. (16),
denoted as T2"1. Aiming at the problem of missing values
in the initial lookback window, we reverse the time series
of x1 and x2, denoted as x′
1 and x′
2, respectively. Then we
compute the time-varying information ow from x′
1 and x′
2,
denoted as T1′
"2′ . Next we reverse the obtained result
T1′ "2′ , and denote it as T′
1′
"2′ . This step reverses the miss-
ing value in the initial lookback window to the tail of the
sequence. Finally, we replace the missing value of the initial
lookback window in T2"1 with the corresponding region in
T′
1′
"2′ to obtain the nal result without missing values. It is im-
portant to highlight that although this method effectively ad-
dresses the issue of missing values in the initial backtracking
window, we contend that it does not provide a comprehensive
explanation of the underlying physical mechanisms involved in
the backtracking window. This limitation arises from the fact
that the method calculates based on reverse-engineered time
series, essentially employing backward data computation to
move forward. Therefore, while the information ow values ob-
tained from this method can serve as a reference for discerning
causal relationships between variables in the backtracking win-
dow, they are inadequate for effectively elucidating the associ-
ated physical mechanisms.
APPENDIX B
Significance Test
For the statistical tool such as that in Eq. (16), signi cance
testing enables us to better understand the robustness of the
derived result. When N is large, the information ow is ap-
proximately normally distributed around their true values with
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
variances (C12/C11)2
s2
a12 , which is derived from maximum like-
lihood estimation. Denote u5 (f1, a11, a12, … , a1d, b1),
N
1
Iij5 2
N ∑
n51
­2 logr(X
n11|X
n;ˆ
u)
, (B1)
­u i­u j
where I is a (d 1 2) 3 (d 1 2) matrix, namely, the Fisher
information matrix. The inverse (NI)21 is the covariance
matrix of u_
, which has s2
a12 ; r is the marginal probability of
{Xn}, a Markov process. For details, refer to Liang (2021).
APPENDIX C
Addition Testing of the Synthetic Model
a. Synthetic model 1
To further verify the accuracy of MtvLK in complex mul-
tivariate system, we tested all the links in synthetic model 1
that did not preset causality by using the same conditions
Z H O U E T A L . 1871
outlined in section 3. The time-varying information ow re-
sults (in nats per unit time) are presented in Fig. C1. The
results show that |Tx3"x1|x2| and |Tx3"x2|x1| are both no cau-
salities for 0 , t # 2000. These results align with the design
in Eq. (17).
b. Synthetic model 2
The time-varying information ow results (in nats per
unit time) that did not preset causality in synthetic model 2
are shown in Fig. C2. The results show that |Tx1"x2|x3|,
|Tx3"x1|x2|, and |Tx3"x2|x1| are all no causalities for 0 , t #
2000. These results align with the design in Eq. (18).
c. Synthetic model 3
The time-varying information ow results (in nats per
unit time) that did not preset causality in the synthetic
model 3 are shown in Fig. C3. Figures C3c–n show that all
the test links show no causalities for 0 , t # 2000. These
results align with the design in Eq. (19).
FIG. C1. (a) Schematic diagram of the conceptual model as described in Eq. (17) when 0 , t # 500 and 1500 , t # 2000
.
(b) As in (a), but for interval 500 , t # 1500. Absolute values of the time-varying information ows among x1, x2, and x3
(in nats per unit time): (c) |Tx3"x1|x2| and Sigx3"x1|x2; (d) |Tx3"x2|x1| and Sigx3"x2|x1. Dashed lines represent the causal rela-
tionship turning points. All the results are the averages of 1000 realizations, and all the signi cance tests are performed at a
1% signi cance level.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1872
J O U R N A L O F C L I M A T E VOLUME 37
FIG. C2. (a) Schematic diagram of the conceptual model as described in Eq. (18) when 0 , t # 500 and 1500 , t # 2000.
(b) As in (a), but for the interval 500 , t # 1500. Absolute values of the time-varying information ows among x1, x2, and
x3 (in nats per unit time): (c) |Tx1"x2|x3| and Sigx1"x2|x3; (d) |Tx3"x1|x2| and Sigx3"x1|x2; (e) |Tx3"x2|x1| and Sigx3"x2|x1. Dashed
lines represent the causal relationship turning points. All the results are the averages of 1000 realizations, and all the signi -
cance tests are performed at a 1% signi cance level.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . 1873
FIG. C3. (a) Schematic diagram of the conceptual model as described in Eq. (19) when 0 , t # 500. (b) As in (a), but for the interval
500 , t # 2000. Absolute values of the time-varying information ows among x1, x2, x3, x4, and x5 (in nats per unit time): (c) |Tx2"x1|x3,x4,x5|
and Sigx2"x1|x3,x4,x5; (d) |Tx2"x5|x1,x3,x4| and Sigx2"x5|x1,x3,x4; (e) |Tx3"x1|x2,x4,x5| and Sigx3"x1|x2,x4,x5; (f) |Tx3"x2|x1,x4,x5| and Sigx3"x2|x1,x4,x5|;
(g) |Tx3"x5|x1,x2,x4| and Sigx3"x5|x1,x2,x4; (h) |Tx4"x1|x2,x3,x5| and Sigx4"x1|x2,x3,x5; (i) |Tx4"x2|x1,x3,x5| and Sigx4"x2|x1,x3,x5; (j) |Tx4"x3|x1,x2,x5| and
Sigx4"x3|x1,x2,x5; (k) |Tx5"x1|x2,x3,x4| and Sigx5"x1|x2,x3,x4; (l) |Tx5"x2|x1,x3,x4| and Sigx5"x2|x1,x3,x4; (m) |Tx5"x3|x1,x2,x4| and Sigx5"x3|x1,x2,x4;
(n) |Tx5"x4|x1,x2,x3| and Sigx5"x4|x1,x2,x3. Dashed lines represent the causal relationship turning points. All the results are the averages of
1000 realizations, and all the signi cance tests are performed at a 1% signi cance level.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1874
J O U R N A L O F REFERENCES
Allen, R. G., L. S. Pereira, D. Raes, and M. Smith, 1998: Crop
evapotranspiration}Guidelines for computing crop water re-
quirements. FAO Irrigation and Drainage Paper 56, 326 pp.,
https://www.scscourt.org/complexcivil/105cv049053/volume3/17
2618e_5xagwax8.pdf.
Anderegg, W. R. L., and Coauthors, 2017: Plant water potential
improves prediction of empirical stomatal models. PLOS
ONE, 12, e0185481, https://doi.org/10.1371/journal.pone.0185481.
Bai, C., R. Zhang, S. Bao, X. S. Liang, and W. Guo, 2018: Fore-
casting the tropical cyclone genesis over the northwest Paci c
through identifying the causal factors in cyclone–climate in-
teractions. J. Atmos. Oceanic Technol., 35, 247–259, https://
doi.org/10.1175/JTECH-D-17-0109.1.
Baker, J. C. A., and Coauthors, 2021: An assessment of land–
atmosphere interactions over South America using satellites,
reanalysis, and two global climate models. J. Hydrometeor.,
22, 905–922, https://doi.org/10.1175/JHM-D-20-0132.1.
Barrett, A., and L. Barnett, 2013: Granger causality is designed
to measure effect, not mechanism. Fronti. Neuroinfo., 7, 6,
https://doi.org/10.3389/fninf.2013.00006.
Berg, A., B. R. Lintner, K. L. Findell, S. Malyshev, P. C. Loikith,
and P. Gentine, 2014: Impact of soil moisture–atmosphere in-
teractions on surface temperature distribution. J. Climate, 27,
7976–7993, https://doi.org/10.1175/JCLI-D-13-00591.1.
}}, and Coauthors, 2016: Land–atmosphere feedbacks amplify
aridity increase over land under global warming. Nat. Climate
Change, 6, 869–874, https://doi.org/10.1038/nclimate3029.
Besnard, S., and Coauthors, 2021: Global sensitivities of forest
carbon changes to environmental conditions. Global Change
Biol., 27, 6467–6483, https://doi.org/10.1111/gcb.15877.
Bierman, G. J., and C. L. Thornton, 1977: Numerical comparison
of Kalman lter algorithms: Orbit determination case study.
Automatica, 13, 23–35, https://doi.org/10.1016/0005-1098(77)
90006-1.
Chen, H., and Coauthors, 2021: Soil drying weakens the positive
effect of climate factors on global gross primary production.
Ecol. Indic., 129, 107953, https://doi.org/10.1016/j.ecolind.2021.
107953.
Chen, N., and Coauthors, 2020: The compensation effects of post-
drought regrowth on earlier drought loss across the Tibetan
Plateau grasslands. Agric. For. Meteor., 281, 107822, https://
doi.org/10.1016/j.agrformet.2019.107822.
}}, and Coauthors, 2021: Divergent impacts of atmospheric wa-
ter demand on gross primary productivity in three typical
ecosystems in China. Agric. For. Meteor., 307, 108527, https://
doi.org/10.1016/j.agrformet.2021.108527.
Ciabatta, L., L. Brocca, C. Massari, T. Moramarco, S. Puca, A.
Rinollo, S. Gabellani, and W. Wagner, 2015: Integration of
satellite soil moisture and rainfall observations over the Italian
territory. J. Hydrometeor., 16, 1341–1355, https://doi.org/10.1175/
JHM-D-14-0108.1.
Cong, J., and Coauthors, 2023: Altered default mode network
causal connectivity patterns in autism spectrum disorder revealed
by Liang information ow analysis. Hum. Brain Mapp., 44,
2279–2293, https://doi.org/10.1002/hbm.26209.
Cui, J. P., S. Piao, C. Huntingford, X. Wang, X. Lian, A. Chevuturi,
A. G. Turner, and G. J. Kooperman, 2020: Vegetation forcing
modulates global land monsoon and water resources in a
CO2-enriched climate. Nat. Commun., 11, 5184, https://doi.org/
10.1038/s41467-020-18992-7.
C L I M A T E VOLUME 37
Detto, M., A. Molini, G. Katul, P. Stoy, S. Palmroth, and D.
Baldocchi, 2012: Causality and persistence in ecological sys-
tems: A nonparametric spectral Granger causality approach.
Amer. Nat., 179, 524–535, https://doi.org/10.1086/664628.
Docquier, D., S. Vannitsem, F. Ragone, K. Wyser, and X. S.
Liang, 2022: Causal links between Arctic sea ice and its po-
tential drivers based on the rate of information transfer. Geo-
phys. Res. Lett., 49, e2021GL095892, https://doi.org/10.1029/
2021GL095892.
Duerinck, H. M., R. J. van der Ent, N. C. van de Giesen, G.
Schoups, V. Babovic, and P. J.-F. Yeh, 2016: Observed soil
moisture–precipitation feedback in Illinois: A systematic
analysis over different scales. J. Hydrometeor., 17, 1645–1660,
https://doi.org/10.1175/JHM-D-15-0032.1.
Feng, H., B. Zou, and J. Luo, 2017: Coverage-dependent ampli-
ers of vegetation change on global water cycle dynamics. J.
Hydrol., 550, 220–229, https://doi.org/10.1016/j.jhydrol.2017.
04.056.
Fu, Z., and Coauthors, 2022: Atmospheric dryness reduces photo-
synthesis along a large range of soil water de cits. Nat. Com-
mun., 13, 989, https://doi.org/10.1038/s41467-022-28652-7.
Goodwell, A. E., P. Jiang, B. L. Ruddell, and P. Kumar, 2020:
Debates}Does information theory provide a new paradigm
for Earth science? Causality, interaction, and feedback. Water
Resour. Res., 56, e2019WR024940, https://doi.org/10.1029/
2019WR024940.
Granger, C. W. J., 1969: Investigating causal relations by econo-
metric models and cross-spectral methods. Econometrica, 37,
424–438, https://doi.org/10.2307/1912791.
Green, J. K., A. G. Konings, S. H. Alemohammad, J. Berry, D.
Entekhabi, J. Kolassa, J.-E. Lee, and P. Gentine, 2017: Re-
gionally strong feedbacks between the atmosphere and ter-
restrial biosphere. Nat. Geosci., 10, 410–414, https://doi.org/
10.1038/ngeo2957.
Hagan, D. F. T., G. Wang, X. S. Liang, and H. A. J. Dolman,
2019: A time-varying causality formalism based on the
Liang–Kleeman information ow for analyzing directed inter-
actions in nonstationary climate systems. J. Climate, 32, 7521–
7537, https://doi.org/10.1175/JCLI-D-18-0881.1.
}}, H. A. J. Dolman, G. Wang, K. T. C. L. K. Sian, K. Yang,
W. Ullah, and R. P. Shen, 2022: Contrasting ecosystem con-
straints on seasonal terrestrial CO2 and mean surface air tem-
perature causality projections by the end of the 21st century.
Environ. Res. Lett., 17, 124019, https://doi.org/10.1088/1748-
9326/aca551.
Havlicek, M., J. Jan, M. Brazdil, and V. D. Calhoun, 2010:
Dynamic Granger causality based on Kalman lter for evalu-
ation of functional network connectivity in fMRI data. Neu-
roimage, 53, 65–77, https://doi.org/10.1016/j.neuroimage.2010.
05.063.
Humphrey, V., A. Berg, P. Ciais, P. Gentine, M. Jung, M.
Reichstein, S. I. Seneviratne, and C. Frankenberg, 2021: Soil
moisture–atmosphere feedback dominates land carbon up-
take variability. Nature, 592, 65–69, https://doi.org/10.1038/
s41586-021-03325-5.
Jung, M., and Coauthors, 2017: Compensatory water effects link
yearly global land CO2 sink changes to temperature. Nature,
541, 516–520, https://doi.org/10.1038/nature20780.
Kalman, R. E., 1960: A new approach to linear ltering and pre-
diction problems. J. Basic Eng., 82, 35–45, https://doi.org/10.
1115/1.3662552.
Kimm, H., K. Guan, P. Gentine, J. Wu, C. J. Bernacchi, B. N.
Sulman, T. J. Grif s, and C. Lin, 2020: Rede ning droughts
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
15 MARCH 2024
Z H O U E T A L . for the U.S. Corn Belt: The dominant role of atmospheric va-
por pressure de cit over soil moisture in regulating stomatal
behavior of maize and soybean. Agric. For. Meteor., 287,
107930, https://doi.org/10.1016/j.agrformet.2020.107930.
Lemordant, L., P. Gentine, M. Stefanon, P. Drobinski, and S.
Fatichi, 2016: Modi cation of land-atmosphere interactions by
CO2 effects: Implications for summer dryness and heat wave
amplitude. Geophys. Res. Lett., 43, 10 240–10 248, https://doi.
org/10.1002/2016GL069896.
Le Quéré, C., and Coauthors, 2015: Global carbon budget 2015.
Earth Syst. Sci. Data, 7, 349–396, https://doi.org/10.5194/essd-
7-349-2015.
Li, S., G. Wang, C. Zhu, J. Lu, W. Ullah, D. F. T. Hagan, G.
Kattel, and J. Peng, 2022: Attribution of global evapotranspi-
ration trends based on the Budyko framework. Hydrol. Earth
Syst. Sci., 26, 3691–3707, https://doi.org/10.5194/hess-26-3691-
2022.
Liang, X. S., 2014: Unraveling the cause-effect relation between
time series. Phys. Rev. E, 90, 052150, https://doi.org/10.1103/
PhysRevE.90.052150.
}}, 2016: Information ow and causality as rigorous notions ab
initio. Phys. Rev. E, 94, 052201, https://doi.org/10.1103/
PhysRevE.94.052201.
}}, 2018: Causation and information ow with respect to rela-
tive entropy. Chaos, 28, 075311, https://doi.org/10.1063/1.501
0253.
}}, 2021: Normalized multivariate time series causality analysis
and causal graph reconstruction. Entropy, 23, 679, https://doi.
org/10.3390/e23060679.
}}, F. Xu, Y. Rong, R. Zhang, X. Tang, and F. Zhang, 2021: El
Niño Modoki can be mostly predicted more than 10 years
ahead of time. Sci. Rep., 11, 17860, https://doi.org/10.1038/
s41598-021-97111-y.
Lintner, B. R., and J. D. Neelin, 2009: Soil moisture impacts on
convective margins. J. Hydrometeor., 10, 1026–1039, https://
doi.org/10.1175/2009JHM1094.1.
Liu, G., Y. Wang, Y. Chen, X. Tong, Y. Wang, J. Xie, and X.
Tang, 2022: Remotely monitoring vegetation productivity in
two contrasting subtropical forest ecosystems using solar-
induced chlorophyll uorescence. Remote Sens., 14, 1328,
https://doi.org/10.3390/rs14061328.
Liu, L., L. Gudmundsson, M. Hauser, D. Qin, S. Li, and S. I.
Seneviratne, 2020: Soil moisture dominates dryness stress on
ecosystem production globally. Nat. Commun., 11, 4892,
https://doi.org/10.1038/s41467-020-18631-1.
Liu, Y., A. J. Parolari, M. Kumar, C.-W. Huang, G. G. Katul, and
A. Porporato, 2017: Increasing atmospheric humidity and
CO2 concentration alleviate forest mortality risk. Proc. Natl.
Acad. Sci. USA, 114, 9918–9923, https://doi.org/10.1073/pnas.
1704811114.
Liu, Z. J., L. C. Wang, and S. S. Wang, 2014: Comparison of dif-
ferent GPP models in China using MODIS image and China-
FLUX data. Remote Sens., 6, 10 215–10 231, https://doi.org/10.
3390/rs61010215.
Madani, N., and Coauthors, 2020: Recent ampli ed global gross
primary productivity due to temperature increase is offset by
reduced productivity due to water constraints. AGU Adv., 1,
e2020AV000180, https://doi.org/10.1029/2020AV000180.
Melnikova, I., and T. Sasai, 2020: Effects of anthropogenic activity
on global terrestrial gross primary production. J. Geophys.
Res. Biogeosci., 125, e2019JG005403, https://doi.org/10.1029/
2019JG005403.
1875
Novick, K. A., and Coauthors, 2016: The increasing importance of
atmospheric demand for ecosystem water and carbon uxes.
Nat. Climate Change, 6, 1023–1027, https://doi.org/10.1038/
nclimate3114.
Oren, R., J. S. Sperry, G. G. Katul, D. E. Pataki, B. E. Ewers, N.
Phillips, and K. V. R. Sch¨ afer, 1999: Survey and synthesis of
intra- and interspeci c variation in stomatal sensitivity to va-
pour pressure de cit. Plant Cell Environ., 22, 1515–1526,
https://doi.org/10.1046/j.1365-3040.1999.00513.x.
Orth, R., and S. I. Seneviratne, 2017: Variability of soil moisture
and sea surface temperatures similarly important for warm-
season land climate in the Community Earth System Model.
J. Climate, 30, 2141–2162, https://doi.org/10.1175/JCLI-D-15-
0567.1.
Pal, S., T. R. Lee, and N. E. Clark, 2020: The 2019 Mississippi and
Missouri River ooding and its impact on atmospheric
boundary layer dynamics. Geophys. Res. Lett., 47,
e2019GL086933, https://doi.org/10.1029/2019GL086933.
Palacio, S., G. Hoch, A. Sala, C. K¨ orner, and P. Millard, 2014:
Does carbon storage limit tree growth? New Phytol., 201,
1096–1100, https://doi.org/10.1111/nph.12602.
Papagiannopoulou, C., D. G. Miralles, W. A. Dorigo, N. E. C.
Verhoest, M. Depoorter, and W. Waegeman, 2017a: Vegeta-
tion anomalies caused by antecedent precipitation in most of
the world. Environ. Res. Lett., 12, 074016, https://doi.org/10.
1088/1748-9326/aa7145.
}}
,}}, S. Decubber, M. Demuzere, N. E. C. Verhoest, W. A.
Dorigo, and W. Waegeman, 2017b: A non-linear Granger-
causality framework to investigate climate–vegetation dynam-
ics. Geosci. Model Dev., 10, 1945–1960, https://doi.org/10.
5194/gmd-10-1945-2017.
Pr˘
av˘ alie, R., 2018: Major perturbations in the Earth’s forest eco-
systems. Possible implications for global warming. Earth Sci.
Rev., 185, 544–571, https://doi.org/10.1016/j.earscirev.2018.06.
010.
Punales, A. G., 2011: Time-varying coef cient models and the
Kalman lter: Applications to hedge funds. Master’s disserta-
tion, Applied Mathematics, Ryerson University, 83 pp.,
https://pdfs.semanticscholar.org/e68f/7bf222ccdf8b235a3a15a55
738f1bd2d2a14.pdf.
Saini, R., G. Wang, and J. S. Pal, 2016: Role of soil moisture feed-
back in the development of extreme summer drought and
ood in the United States. J. Hydrometeor., 17, 2191–2207,
https://doi.org/10.1175/JHM-D-15-0168.1.
Schwingshackl, C., M. Hirschi, and S. I. Seneviratne, 2017: Quanti-
fying spatiotemporal variations of soil moisture control on
surface energy balance and near-surface air temperature.
J. Climate, 30, 7105–7124, https://doi.org/10.1175/JCLI-D-16-
0727.1.
Seneviratne, S. I., D. L¨ uthi, M. Litschi, and C. Sch¨ ar, 2006: Land–
atmosphere coupling and climate change in Europe. Nature,
443, 205–209, https://doi.org/10.1038/nature05095.
}}, T. Corti, E. L. Davin, M. Hirschi, E. B. Jaeger, I. Lehner,
B. Orlowsky, and A. J. Teuling, 2010: Investigating soil
moisture–climate interactions in a changing climate: A re-
view. Earth Sci. Rev., 99, 125–161, https://doi.org/10.1016/j.
earscirev.2010.02.004.
Sperry, J. S., M. D. Venturas, W. R. L. Anderegg, M. Mencuccini,
D. S. Mackay, Y. Wang, and D. M. Love, 2017: Predicting
stomatal responses to the environment from the optimization
of photosynthetic gain and hydraulic cost. Plant Cell Envi-
ron., 40, 816–830, https://doi.org/10.1111/pce.12852.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC
1876
J O U R N A L Stips, A., D. Macias, C. Coughlan, E. Garcia-Gorriz, and X. San
Liang, 2016: On the causal structure between CO2 and global
temperature. Sci. Rep., 6, 21691, https://doi.org/10.1038/srep
21691.
Stocker, B. D., J. Zscheischler, T. F. Keenan, I. C. Prentice, J.
Penuelas, and S. I. Seneviratne, 2018: Quantifying soil mois-
ture impacts on light use ef ciency across biomes. New Phy-
tol., 218, 1430–1449, https://doi.org/10.1111/nph.15123.
Tao, L., X. S. Liang, L. Cai, J. Zhao, and M. Zhang, 2021: Rela-
tive contributions of global warming, AMO and IPO to the
land precipitation variabilities since 1930s. Climate Dyn., 56,
2225–2243, https://doi.org/10.1007/s00382-020-05584-w.
Tuttle, S., and G. Salvucci, 2016: Empirical evidence of contrasting
soil moisture–precipitation feedbacks across the United
States. Science, 352, 825–828, https://doi.org/10.1126/science.
aaa7185.
Wang, M., S. Wang, J. Zhao, W. Ju, and Z. Hao, 2021: Global
positive gross primary productivity extremes and climate con-
tributions during 1982–2016. Sci. Total Environ., 774, 145703,
https://doi.org/10.1016/j.scitotenv.2021.145703.
Wang, X. H., and Coauthors, 2014: A two-fold increase of carbon
cycle sensitivity to tropical temperature variations. Nature,
506, 212–215, https://doi.org/10.1038/nature12915.
Wright, S., 1921: Correlation and causation. J. Agric. Res., 20,
557–585.
Wu, D., X. Zhao, S. Liang, T. Zhou, K. Huang, B. Tang, and W.
Zhao, 2015: Time-lag effects of global vegetation responses
O F C L I M A T E VOLUME 37
to climate change. Global Change Biol., 21, 3520–3531,
https://doi.org/10.1111/gcb.12945.
Yi, B., and S. Bose, 2022: Quantum Liang information ow as
causation quanti er. Phys. Rev. Lett, 129, 020501, https://doi.
org/10.1103/PhysRevLett.129.020501.
You, N., J. Meng, L. Zhu, S. Jiang, L. Zhu, F. Li, and L.-J. Kuo,
2020: Isolating the impacts of land use/cover change and
climate change on the GPP in the Heihe River Basin of China.
J. Geophys. Res. Biogeosci., 125, e2020JG005734, https://doi.
org/10.1029/2020JG005734.
Yuan, W., and Coauthors, 2019: Increased atmospheric vapor
pressure de cit reduces global vegetation growth. Sci. Adv.,
5, eaax1396, https://doi.org/10.1126/sciadv.aax1396.
Zhang, F., Q. Quan, F. Ma, D. Tian, Q. Zhou, and S. Niu, 2019:
Differential responses of ecosystem carbon ux components
to experimental precipitation gradient in an alpine meadow.
Funct. Ecol., 33, 889–900, https://doi.org/10.1111/1365-2435.
13300.
Zhang, W., Y. Li, X. Wu, Y. Chen, A. Chen, C. R. Schwalm, and
J. S. Kimball, 2021: Divergent response of vegetation growth
to soil water availability in dry and wet periods over central
Asia. J. Geophys. Res. Biogeosci., 126, e2020JG005912,
https://doi.org/10.1029/2020JG005912.
Zhou, S., and Coauthors, 2019: Land–atmosphere feedbacks exac-
erbate concurrent soil drought and atmospheric aridity. Proc.
Natl. Acad. Sci. USA, 116, 18 848–18 853, https://doi.org/10.
1073/pnas.1904955116.
Unauthenticated | Downloaded 07/30/26 08:01 PM UTC