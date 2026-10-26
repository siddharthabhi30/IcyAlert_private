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
1. Introduction
The land surface plays an essential role in the climate
system (e.g., Fischer et al. 2007; Miralles et al. 2014). A
number of studies have demonstrated that the land–
atmosphere interactions, especially soil moisture in-
teractions with the atmosphere, have the potential to
affect the occurrence of heat waves (Stéfanon et al.
2014), drought (Ciabatta et al. 2015; Roundy and Wood
2015), rainfall (Taylor et al. 2012; Tuttle and Salvucci
2015), and floods (Massari et al. 2014; Saini et al. 2016).
Therefore, predictability of climate extremes is ex-
pected to exist in the interactions of key processes
between the land and the atmosphere (Berg et al. 2014;
Zheng et al. 2015). In recent years, identifying the hot
spots of land–atmosphere interactions and quantifying
the magnitude of such effects on climate variations and
extremes have attracted a lot of attention (Casagrande
et al. 2015; Papagiannopoulou et al. 2017; Tuttle and
Salvucci 2015).
The approaches for quantifying land–atmosphere in-
teractions include mainly, among others, numerical ex-
perimentation and statistical diagnosis. In recent years,
many numerical studies have been conducted with the
aim of improving the understanding of land–atmosphere
interactions with a focus on soil moisture feedbacks on
the overlying atmosphere. Koster et al. (2004) and Guo
et al. (2006) identified the hot spots of soil moistureCorresponding author: Guojie Wang, gwang_nuist@163.com
1 NOVEMBER 2019 H A G A N E T A L . 7521
DOI: 10.1175/JCLI-D-18-0881.1
Ó 2019 American Meteorological Society. For information regarding reuse of this content and general copyright information, consult the AMS Copyright
Policy (www.ametsoc.org/PUBSReuseLicenses).
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
feedbacks on subsequent precipitation and air temper-
ature over the globe based on numerical experiments of
12 general circulation models (GCMs). Such feedbacks
were found to be strongest in the transitional regions
between dry and wet climates with, however, rather
significant discrepancies among the outputs from dif-
ferent GCMs. Fischer et al. (2007) simulated the Euro-
pean heat wave in the summer of 2003 and found the
heat anomalies in the Mediterranean region reduced by
about 40% if the interactions between the land and at-
mosphere were not adequately taken into account.
There also exist a number of other numerical studies
showing the importance of land–atmosphere interac-
tions for atmospheric prediction (Koster et al. 2004;
Miralles et al. 2014; Tuttle and Salvucci 2015).
Although numerical climate models offer a good al-
ternative for studying the land–atmosphere interactions
experimentally, significant discrepancies exist between
the results from different models due to the use of dif-
ferent parameterization schemes (Flato et al. 2013; Zhao
and Li 2015). Therefore, considerable efforts have also
been put into statistical approaches for identifying the
land–atmosphere interactions from observations: iden-
tifying where they exist as well as estimating their
magnitude (Miralles et al. 2012; Notaro 2008; Zhang
et al. 2008). A common practice is the use of time-lagged
correlation (Ford et al. 2015; Wu and Zhang 2015), even
though it is generally known that correlation does not
bear the required asymmetry and directedness to in-
dicate causality (Liang 2014). The latter implies that
correlation analysis does not show the direction of the
interactions. Thus, disentangling the direction of the
interactions among time series has been of interest for a
long time in many disciplines. Another potential prob-
lem with time-lagged correlation is that when the fore-
knowledge of the processes is not sufficient, it is very
difficult to differentiate a lag from an advance, espe-
cially, when the processes are periodic. Therefore, sev-
eral studies have been devoted to the development of
reliable statistical tools for this purpose (Dajcman 2013;
Casagrande et al. 2015; Notaro 2008; Palus 2014; Papana
et al. 2016). The Granger causality, first suggested by
Clive Granger (Granger 1969), is one of the most widely
accepted tools for studying directed interactions, in
particular, the linear relations of cause and effect,
among time series. It has been applied successfully to
study the cause–effect relations between climate vari-
ables such as the soil moisture–precipitation interaction
(Tuttle and Salvucci 2015). More recently, a nonlinear
form of Granger causality based on a random forest
machine learning algorithm was proposed and used to
analyze the causal relations between several climate
factors and vegetation (Papagiannopoulou et al. 2017).
Another method that has gained much popularity is the
equilibrium feedback analysis (EFA), which was origi-
nally proposed by Frankingnoul and Hasselmann (1977)
for studying coupled systems within the climate. It has
since been applied to the study of soil moisture feed-
backs on precipitation to investigate the hot spots of soil
moisture–precipitation feedbacks over the globe using
various datasets (Notaro 2008). A spatiotemporal anal-
ysis tool called the coupled manifold is also used for this
purpose (Navarra and Tribbia 2005), although it is not
strictly defined in the concept of causality. It seeks a
solution for a system as a linear function of another
system, and has also been successfully applied to several
problems of land surface atmosphere interactions
(Catalano et al. 2016).
Recently, Liang (2014) proposed a rigorous non-
parametric formalism of causality measurement for
identifying the cause–effect relations between any given
time series, based on the theory of Liang–Kleeman (LK)
information flow (LK causality; Liang 2016). Compared
to other tools, the LK causality is rather easy to com-
pute, involving only the sample covariance of the given
time series. Additionally, since it is derived from first
principles and mathematically rigorous, it avoids spuri-
ous causalities that are sometimes found in the Granger
causal test and other statistical formalisms. Using a large
number of simulations, Liang (2014) showed that this
causality formalism is able to unambiguously obtain
predetermined causalities between the simulated time
series. Stips et al. (2016) used the LK causality to in-
vestigate the causal relations between global surface
temperature and the radiative forcing, finding that
greenhouse gases were the main causal drivers of the
recent warming, but this cause–effect direction was re-
versed on paleoclimate time scales. Among other ap-
plications of the Liang–Kleeman information flow in
recent years, Liang (2014) used it to investigate the
cause–effect relation between two climate modes, El
Niño and the Indian Ocean dipole (IOD), both of which
have been linked to some climate extreme and socio-
economic impacts. The LK causality is hence identified
to provide an easy but efficient tool for studying the
land–atmosphere interactions. However, it requires
stationarity for the time series in question. It is well
known that the land–atmosphere interactions vary with
seasons due to the changing boundary layer properties.
Therefore, there is a need to further develop the LK
causality in order to cope with time-varying properties
of land surface atmosphere interactions.
The Kalman filter is an established approach to ob-
tain the changing model parameters with time. It infers
parameters of interest from inaccurate and uncer-
tain observations by minimizing the mean-square error
7522 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
between the estimated parameters and the observations
(Grewal and Andrews 2001). It has been further de-
veloped into different forms and applied in both linear
and nonlinear problems (Ghorbanidehno et al. 2015;
Houtekamer and Zhang 2016; Kiani and Pourtakdoust
2014). We use the Kalman filter here to estimate the
time-varying parameters for the LK information flow-
based causal inference.
Many time series in geophysics contain dominant
periodic components, which can vary in both amplitude
and frequency over long periods. Such periodic com-
ponents sometimes act in the land–atmosphere in-
teractions, leading to signals in the frequency domain.
Identifying the signals of directed interactions in the
frequency domain may help to understand the un-
derlying mechanisms of land–atmosphere interactions.
Therefore, there is also a need to identify directed in-
teractions in the frequency domain. Wavelet analysis,
widely used in analyzing time series of geophysics
(Casagrande et al. 2015; Wang et al. 2017), is such a tool
to solve this problem by decomposing a time series into
time-frequency distribution.
In this study, the Liang causality formalism is in-
tegrated with the Kalman filter and wavelet analysis to
provide a statistical tool for investigating the land–
atmosphere interactions in the time-frequency domain.
Section 2 gives a description of the formalism, section 3
validates the formalism with synthetic models, section 4
applies it to a specific case study of land–atmosphere
interaction over China, and section 5 presents a sum-
mary and discussion of the formalism and its potential
applications.
2. The time-varying causal inference
a. Formalism of the information flow-based causality
Information flow, sometimes referred to as informa-
tion transfer in the literature, is essentially the transfer
of information through some processes between two or
more entities within a dynamical system (Liang 2013).
The transfer of information from a source to a receiver,
which may reflect a cause–effect relationship (i.e., who
drives whom) is a problem that can be found in many
disciplines such as neuroscience, financial economics,
climate interactions, and network dynamics, just to
mention a few. After more than 30 years of research, a
consensus has been reached that information flow is
logically associated with causation and bears implica-
tions of predictability and uncertainty propagation (see
Liang 2013 and references therein). Liang (2008, 2016)
hence argued that, in this way, causality can be rigor-
ously formulated, rather than axiomatically proposed as
an ansatz; particularly, the causality between two time
series can be easily obtained in a quantitative sense
Liang (2014). Recently, Liang (2016) found that cau-
sality is a real physical notion and can be rigorously
derived and quantified with the notion of the Liang–
Kleeman information flow (Liang 2008); particularly,
the causality between two time series can be easily ob-
tained in a quantitative sense (Liang 2014). The fol-
lowing is a brief introduction.
Consider a d-dimensional stochastic system
dX 5 F(X, t) dt 1 B(X, t) dW , (1)
where F is defined as the vector of drift coefficients, B 5
(bij) is a matrix of stochastic perturbation coefficients,
and W is a vector of a Wiener process. If two compo-
nents, for instance, X1 and X2 are considered, the rate of
information flow from X2 to X1, is the amount of entropy
contributed by X2 to the evolution of H1, the marginal
entropy of X1. This can be obtained by finding the total
rate of change of H1, minus the same change rate but
with the effect from X2 instantaneously excluded. Liang
(2008, 2016) proved that for a 2D system,
T2/1 5 2E
 1
r1
›(F1r1)
›x1

1 1
2E
"
1
r1
›2(b2
11 1 b2
12)r1
›x2
1
#
, (2)
where r1 is the marginal probability density of X1, and
E is the mathematical expectation. For arbitrary di-
mensional system, the result is referred to Liang (2016).
A unique property of this measure of information flow
rate as obtained in Eq. (2) is its asymmetry (between
T2/1 and T1/2), and particularly, the ‘‘principle of nil
causality,’’ which states that, if the evolution of an event
is independent of another, then the causality from the
latter to the former is zero. Thus, ideally, a nonzero
T2/1 implies that X2 is causal to X1, where the magni-
tude of T2/1 is the strength of the causality. A zero
value strictly implies that X2 is not causal to X1. (In
practice, the statistical significance should be tested to
infer causality). Refer to Liang (2016) for a more for-
mally and quantitatively stated principle of nil causality,
which the Granger causality test and transfer entropy
analysis fail to meet in many situations (Granger 1980).
In the case of a linear system: F 5 f 1 AX, where f 5
(f1, f2)T, A 5 (aij), B 5 (bij), then if originally (X1, X2)
has a bivariate normal distribution, it will always be so.
Given the mean m 5 (m1, m2)T and covariance matrix
S 5 (sij), their evolutions are as follows:
dm
dt 5 f 1 Am, and (3)
dS
dt 5 AS 1 SAT 1 BBT . (4)
1 NOVEMBER 2019 H A G A N E T A L . 7523
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
When B 5 (bij) is constant, the last term of Eq. (2) dis-
appears. Substitution of
F1 5 f1 1 a11X1 1 a12X2, and (5)
r1 5 1
ffiffiffiffiffiffiffiffiffiffiffiffiffiffiffi
(2ps1)
p exp
"
2(x1 2 m1)2
2s2
1
#
, (6)
into Eq. (2) for F1 and r1 produces, after a series of al-
gebraic multiplications (Liang 2014, 2008),
T2/1 5 s12
s11
a12 , (7)
where sij is derived by solving Eq. (4). The parameters f,
A, and B can be estimated through maximum likelihood
estimation; with them, the information flow from X2 to
X1 can be obtained in terms of covariances (Liang 2014):
T2/1 5 C12
C11
2C12C1,d1 1 C11C1,d1
C11C22 2 C2
12
, (8)
where Cij is the sample covariance between Xi and Xj,
Ci,dj the covariance between Xi and Xdj and a derived
series from Xj using the formula Xdj 5 [Xj(t 1 kDt) 2
Xj(t)]/(kDt), where Dt is the time step size, and k some
integer; see Liang (2014) for further details. Likewise,
the information flow from X1 to X2 can be obtained by
switching the indices:
T1/2 5 C21
C22
2C21C2,d2 1 C22C1,d2
C22C11 2 C2
21
,
b. Kalman filter
From the above Eq. (8), estimating the causality in-
vokes an assumption of time stationarity for the com-
putation of the covariances. To tackle the challenge of
computing a time-varying causality based on Eq. (2)
and, particularly, its linear version [Eq. (7)] as rigorously
established by Liang (2008), a Kalman filter is em-
ployed. The main goal of using this Kalman filter ap-
proach is to estimate the required covariances at each
time step. Many studies have used the Kalman filter to
obtain covariance estimates (e.g., Asl and Pourtakdoust
2007; Gonzalez et al. 2014). A Kalman filter includes two
parts: the estimation part, which calculates the state
estimate x, and the gain part, which computes the co-
variance of the state P.
The standard Kalman filter is formulated with a linear
stochastic system, shown here as
xk 5 Axk21 1 Buk 1 wk21 ,
yk 5 Hxk 1 vk , (9)
where x is the system state vector, y is the measurement
vector, and u is the input vector. The parameters A, B,
and H are transition matrices of appropriate dimensions,
with v and w being mutually independent and zero mean
measurement and process noise, respectively in this
case, and
E[wkwT
k ] 5 Q,
E[vkvT
k ] 5 R , (10)
where Q is the process noise covariance and R is the
measurement noise covariance. Just as in previous
studies, it was found that the estimation of Q and R was
quite difficult, especially for Q (Berg et al. 2014; Odelson
et al. 2006; Saha et al. 2011; Mohan et al. 2015), due to
our inability to observe the process being estimated.
Since the computation of the causality is based on
sample covariances, it is very important to ensure that the
estimated covariances are very accurate. Therefore, we
do not assume them to be constant in time, but we com-
pute them for each time step since in reality, they will not
remain constant but change. A common practice, which is
adopted here, is they are first obtained offline (outside of
the Kalman filter iteration) for each time step; the ob-
tained results are then used for further computations in
the iteration process as seen in Eqs. (12) and (14).
An updating equation is used to compute an a pos-
teriori state xk, an estimate that is a linear combination
of the weighted difference between the measurement
prediction Hxk and an actual measurement yk, and an a
priori x2
k . Combining the a priori estimate and the
measurement data, we write xk as
xk 5 x2
k 1 Kk(yk 2 Hx2
k ). (11)
The statistically optimal Kalman gain Kk is calculated
to use in the correction stage. It minimizes the risk (loss)
of the estimate error covariance, defined as P 5 E[eeT],
which is the value of expectation of the squared mag-
nitude of the posterior state estimation error. The Kal-
man gain is computed as in the following:
Kk 5 P2
k HT(HP2
k HT 1 R)21 . (12)
Hence, the updated P becomes the solution to the
equation below, using the characteristics of the mea-
surement noise in Eq. (9):
Pk 5 (1 2 KkH)P2
k . (13)
The following projection equations of the state estimate
x and covariance P are used in the prediction stage,
x2
k 5 Axk21 1 Buk ,
P2
k 5 APk21AT 1 Qk . (14)
7524 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
Within the gain loop of the standard Kalman filter, the
Kalman gain, which is an error correction feedback of
the estimation loop, is estimated. An accurate gain,
therefore, provides accurate estimations of the state
parameter from round-off errors, a priori and noise es-
timation errors. Since no feedback exists in the gain
loop, it results in unchecked accumulated computer
round-off errors from the state variance–covariance
computation, which happens to be a parameter of im-
portance to this study. This creates numerical in-
stabilities and imprecision within the Kalman (optimal)
filtering process. Several studies have been committed
to solving these problems, and decomposition of the
covariance matrix (the process of breaking down a ma-
trix or its expression into an equivalent product of fac-
tors) has been proposed as direction to solving the above
mentioned problem (Roncero 2014; Sastry 1971).
Several methods of decomposition are available
from numerous studies (Bellantoni and Dodge 1967;
Gonzalez et al. 2014; Roncero 2014; Thornton 1976). In
this study, we employ the Bierman–Thornton algorithm
(see appendix A), which uses modified Cholesky factors
of the state variance–covariance matrix, since the
modified Cholesky decomposition has been found to be
more robust than the classical one (Maoudj et al. 2013).
It is acts as a square root filter, though it does not use any
square root operations in its implementation. However,
its ability to compute positive definite matrices, which
have a triangular matrix square root property, makes it
an optimal choice.
The LK causality formalism, as seen in Eq. (8), in-
volves sample covariances, which are usually directly
computed from given time series. We here are about to
estimate the covariances with our newly preferred esti-
mation methodology, that is, the square root Kalman
filter based on the Bierman–Thornton algorithm (Bierman
and Thornton 1976). In this way, Eq. (8) and its converse
direction become
T2/1t 5 P12
P11
2P12P1,d1 1 P11P2,d1
P11P22 2 P2
12
,
T1/2t 5 P21
P22
2P21P2,d2 1 P22P1,d2
P22P11 2 P2
21
. (15)
where P is the resulting covariance matrix at each time
step of the iteration [Pk 5 (1 2 KkHk)(U2
k D2
k U2T
k )]. We
provide two formalisms of this time-varying causality,
both based on the Bierman–Thornton algorithm, but in
the second case, the transition matrix functions in
Eq. (9) are first determined by fitting an autoregressive
model to the data and performing a Kalman filter on it.
Once they are determined through an iteration of this
process, the covariance is estimated as shown in the
previous equations. The formalism is referred to as
TvLK throughout the rest of this paper.
c. The TvLK framework
The algorithm begins with an offline computation of
the process and measurement noise covariances, Q and
R, respectively. This is because it is expected that in
practice, Q and R would change with each time step. The
filter then starts off with the computation of the Kalman
gain K through to the updated covariance matrix P, at
each time step, which is where the causality is computed.
At the measurement and temporal updates, the Bierman
and Thornton algorithms are applied to make the
computation more stable. This process is iterated
through all the time steps. Because of the ability of the
Kalman filter to detect change, it is expected that in
using it to estimate the Liang–Kleeman causality, im-
mediate changes along time will be preserved. As a
learning algorithm the Kalman filter estimations are
expected to improve along time when applied to the
formalism. It should be noted that several experiments
with this formalism have shown that obtaining an ac-
curate result is highly dependent on the offline compu-
tation of Q and R. A detailed diagrammatic scheme of
the framework of the TvLK is given in appendix B.
d. Wavelet transforms
The wavelet transform is mainly used to decompose a
signal into parts with different frequencies. Here, the
continuous wavelet form is used as a postprocessing tool
to decompose the output of the TvLK estimates to
obtain a multi-time-scale causal structure as a distribu-
tion of time and frequency. This is especially important
in instances where separated signals of a coupled system
are found to occur within the same period in a time-
varying distribution. The continuous wavelet is defined
as the convolution of xn with a translated and scaled
version of
Wn(s) 5 å
N51
n050
xn0 c*[(n0 2 n) dt]
s , (16)
where xn is a discrete sequence, c0(h) is a wavelet
function, h is a nondimensional ‘‘time’’ parameter, the
(*) symbolizes the complex conjugate, wavelet scale s
and localized time index s. The obtained wavelet trans-
form [Wn(s)] is also complex, which can be divided into
the real and imaginary parts.
It is expected that by applying this to the time-varying
causality, it will become possible to visualize the sepa-
rated causality signals over a multiscale time-frequency
distribution. Following Torrence and Compo (1998), the
1 NOVEMBER 2019 H A G A N E T A L . 7525
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
significance level of 5% is computed for each case using
Monte Carlo simulations. There are several types of
wavelet functions in use, including the most common
ones, Morlet, Paul, and difference of Gaussian (DoG)
functions. While the Morlet and Paul are complex
functions, the DoGs are real. The choice of a wavelet
function is left to the user’s discretion. Readers are re-
ferred to Torrence and Compo (1998) for a guide to
using the transform and its different available functions.
We use the bump wavelet as part of the wavelet package
of MATLAB, in this study. A detailed description can
be found in Vialatte et al. (2009). The proposed for-
malism with the wavelet decomposition is termed
TFvLK hereafter. It is important to state that this is
simply the TvLK formalism with a spectral analysis ex-
tension. A summary and flow diagram of the calculation
procedure is given in appendix B.
3. Simulation studies
Numerical experiments are here conducted in order to
assess if the proposed TvLK and TFvLK formalisms can
properly determine the directed interactions. For this
purpose, two synthetic models are generated from nu-
merical simulations. The specific aims of these synthetic
model tests are to verify 1) if the proposed TvLK for-
malism based on Kalman filter can correctly reproduce
the predefined time-varying causal structure, and 2) if
this causal structure can be determined within the pre-
defined frequencies when decomposed into the time-
frequency domain by means of wavelet transform.
Based on the theory of Liang–Kleeman information
flow, the unit of derived causality is in nats per time.
a. Synthetic model 1
x1(t) 5 0:36x1(t 2 1) 2 0:41x1(t 2 2)
1 c2/1(t)x2(t 2 1) 1 e1(t),
x2(t) 5 0:36x2(t 2 1) 2 0:41x2(t 2 2)
1 c1/2(t)x1(t 2 1) 1 e2(t), (17)
We first consider a bivariate autoregressive process of
X 5 [x1, x2], as described in Eq. (17). The time series x1
and x2 have the same length of 1000 time points with
added white noise of zero means and unit variance e1(t)
and e2(t), respectively. c2/1 is a strength factor that in-
dicates the influences of x2 on x1; and c1/2 is a strength
factor that indicates the influences of x1 on x2. Both c1/2
and c2/1 are nonstationary along time. For 0 , t , 500,
c2/1, is set to be 0 and c1/2 is set to be 2; for 500 ,
t ,1000, c2/1, is set to 2 and c1/2 is set to 0. By nu-
merical control, the time series x1 and x2 are both
generated at the frequency of about 0.2 Hz. This is in-
tended to verify if the TFvLK formulism can correctly
determine the directed influences at the predefined
frequencies. The conceptual mode of this synthetic
model is shown in Fig. 1a.
In Figs. 1b and 2b, the blue (T2/1) and the green
(T1/2) lines represent the time-varying information
flow signals of the two-way interaction generated, while
the red (sig2/1) and pink (sig1/2) lines represent the
significant test values to determine the standard error
for each time step.1 Causality is inferred here if the ab-
solute value of the green line exceeds that of the pink,
and or the absolute value of the blue line exceeds that of
the red line. In the first half of the entire time period in
Fig. 1b, the derived T1/2 is seen to exceed sig1/2, while
the absolute value of T2/1 remains significantly less
than sig2/1. Consequently, a one-way causality, in-
dicating that x1 is causal to x2 but x2 is noncausal to x1,
can be inferred as seen in the first half of the entire time
period in Fig. 1a. In the second half, the reverse is ob-
served. While T2/1 is consistently larger than sig2/1,
T1/2 remains significantly less than sig1/2. Here, the
obtained results imply that x2 is causal to x1 but x1 is
noncausal to x2. These results are consistent with the
predefined causal structure of the conceptual model
described by Eq. (17) and shown in Fig. 1a, and suggest
that the TvLK formalism has the capability to determine
the time-varying causality within the given time series in
this simple time-varying model. The missing data at the
beginning of T1/2 and T2/1 are as a result of the offline
estimation of the process and measurement noise co-
variance (details can be found in appendix B). Since the
Kalman filter is in essence a learning algorithm, a suffi-
cient amount of data is initially needed for robust esti-
mations of these parameters. The T1/2 and T2/1 in the
time domain are then subjected to the Morlet wavelet
transform so that they can be decomposed into the fre-
quency domains. The derived time-frequency repre-
sentations of the directed influences between x1 and x2
are shown in Fig. 1c. Significance tests are conducted at
5% level using Monte Carlo simulations as suggested by
Torrence and Compo (1998). There appears to be a
significant T1/2 signal for the first half period, and sig-
nificant T2/1 signal for the second half period. These
signals are both obtained at the frequency band of
0.2 Hz, as predefined in the synthetic model. It is,
1 Since the information flow signals do not represent relative
values, both negative and positive information flow results can be
obtained. As such, we multiply the significant test results (which
are always positive) by 21 as well to determine whether or not the
information flow computed exceeds the significant test results. This
explains why the red and pink lines are symmetric about the x axis.
7526 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
therefore, concluded that the TFvLK formulism is ca-
pable of correctly determining the timing and the fre-
quency of the directed influences in the given simple
conceptual model. Furthermore, significant signals in
both Figs. 1b and 1c show quite similar magnitudes,
implying the same strengths of influences as predefined.
These results are encouraging and provide a sense of
confidence for future applications.
b. Synthetic model 2
In the climate system, the interactions among differ-
ent components may occur at different frequencies. It is
thus of interest to determine if the proposed TFvLK
formalism can disentangle the interactions at different
frequencies. Following the first synthetic model, again
we generate a bivariate autoregressive process of
X 5 [x1, x2] as described in Eq. (18). In this case, for 0 ,
t , 550, both c1/2 and c2/1 are set to 0, so that neither
x1 nor x2 is causal to the other. For 550 , t , 1000, c2/1,
is set to 0.95 and c1/2 is set to 0.45. By numerical con-
trol, the causality of T1/2 is set to occur at 0.1 Hz and
that of T2/1 is set to occur at 0.2 Hz. Within the climate
system, the chances of finding mutual causality at the
same time are rather frequent. However, these may, in
most cases, occur at different frequencies. Figure 2a
shows a conceptual form of this synthetic model as
should be obtained from the generated time series:
x1(t) 5 0:39x1(t 2 1) 2 0:461x1(t 2 2)
1 c2/1(t)x2(t 2 1) 1 e1(t),
x2(t) 5 0:75x2(t 2 1) 2 0:3017x2(t 2 2)
1 c1/2(t)x1(t 2 1) 1 e2(t), (18)
Applying the TvLK to the generated time series
shows that it is able to yield the expected time-varying
results of nil causalities in the first part of the time period
since the information flow signals T1/2 and T2/1 are
less than the significant values. On the other hand, mu-
tual causalities are observed in the second part of the
time period as both information flow signals are statis-
tically significant. Additionally, the expected different
coupling strengths (Fig. 2b), at 1% significance level in
the second time period, are observed between the two
coupling signals. While T1/2 shows a smaller magnitude
of causality, T2/1 shows a much higher magnitude as
FIG. 1. (a) The conceptual synthetic model of the bivariate process as described in Eq. (17); (b) results of the time-
varying coupling strengths (nats per unit time) (T1/2 and T2/1) at a 1% significance level (sig1/2, sig2/1), and
(c) the time-frequency domain representations at a 5% significance level.
1 NOVEMBER 2019 H A G A N E T A L . 7527
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
predefined in the bivariate model and depicted in
Fig. 2b. This implies that the obtained TFvLK estimates
have been able to satisfy the requirements of causal di-
rection and magnitudes in this simulation. Decomposing
T1/2 and T2/1 into the time-frequency distributions
using the Bump wavelet transform shows that T1/2
occur around 0.1 Hz and T2/1 occur around a frequency
of 0.2 Hz. It can also be observed from Fig. 2c that the
different magnitudes of coupling strengths are also very
well captured in the time-frequency domain.
4. Applications in land–atmosphere interactions
The previous section has shown the potential of the
TvLK and TFvLK algorithms to capture the causality
when the causal directions and magnitudes are known.
The data in the real world may present scenarios that are
rather more complex and chaotic and more difficult to
analyze. We apply here the proposed algorithms to soil
moisture and near surface air temperature coupling in
China. We aim to understand their performances in
disentangling the direct interactions between the top
layer soil moisture and the overlaying air temperature.
Soil moisture is essential in the land–atmosphere in-
teractions. It partitions the available energy into latent
heat for evaporation and sensible heat for air tempera-
ture increase (Seneviratne et al. 2010). While soil
moisture may also affect the subsequent precipitation
(Taylor et al. 2012; Tuttle and Salvucci 2015), it is also
found to have considerable impacts on air temperature,
especially on the short- to medium-term occurrence of
heat waves (Miralles et al. 2012, 2014).
The territory of China features a complex topography
and a diverse climate. In East China, the climate is
dominated by the East Asian monsoon system, leading
to cold and dry winters as well as warm and wet sum-
mers. Generally, the rainy season starts in May and lasts
until October in Southeast China, and it starts in July
and lasts until August in the northwest of China. Con-
sequently, the soil moisture patterns exhibits large spa-
tial and temporal variations (Parinussa et al. 2017).
Studies have indicated the theoretical relations between
soil moisture and air temperature; with limited soil
moisture, evaporative cooling decreases, which leads
to a rise in air temperature, and rising air temperature
results in increased atmospheric demand of water vapor
FIG. 2. (a) The conceptual synthetic model of the bivariate process as described in Eq. (18); (b) results of the time-
varying coupling strengths (nats per unit time) (T1/2 and T2/1) at a 1% significance level (sig1/2, sig2/1), and
(c) the time-frequency domain representations at a 5% significance level.
7528 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
and thereby further reduced soil moisture (e.g., Seneviratne
et al. 2010). However, such relations may vary through
space and time.
We selected two regions in China for further study
that are denoted as RA and RB in Fig. 3. RA is located
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
resolution of 0.258 and span from January 2012 to De-
cember 2015. All interpretations are limited to the two
parameters of the coupling.
Figures 4 and 5 show the soil moisture–temperature
information flow in the time-varying and time-frequency
domain over RA and RB. The significance tests of each
pixel in the selected regions are computed at a 5% sig-
nificance level. Here, the black solid lines present the
mean of the information flow of all the individual pixels
FIG. 3. An overview of the study area, mainland China. RA
represents a partly wet–partly dry climate region while RB repre-
sents a wet climate region.
FIG. 4. Information flow between soil moisture and air temperature for RA. (a) The time-varying information
flow from soil moisture to air temperature and (b) the time-varying information flow from air temperature to soil
moisture. Causality is implied where the absolute value of the information flow signals (shown in blue shades and
the black solid line) exceed the absolute values of the significance results computed based on Eq. (C1) (shown
in red shades and red solid lines). The frequency distribution of (c) causality from soil moisture to air temper-
ature and (d) the causality from air temperature to soil moisture. All the significance tests were done at a 5%
significance level.
1 NOVEMBER 2019 H A G A N E T A L . 7529
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
in the selected regions (RA in Fig. 4 and RB in Fig. 5),
and the blue shades represent the standard deviation of
all the computed information flow of the individual
pixels in the selected region from the mean (black solid
line). Similarly, the solid red line is the mean significance
test values for all the pixels, and the shaded parts are the
standard deviation from this mean. Causality is implied
when the absolute values of the blue shades and black
solid lines exceed the red shades and the red solid
lines. The multiyear mean of the 4 years, 2012–15, is here
used to derive the seasonal variability. No preprocessing
of the datasets was done before computing the in-
formation flow results. Figure 4a shows the time-varying
information flow results from soil moisture to air temper-
ature (hereafter referred to as Tsoilmoisture/airtemperature).
It can be seen that while Tsoilmoisture/airtemperature is not
significant for most parts of the year in this region,
a statistically significant signal occurs in spring. This
implies that soil moisture has a significant feedback on
air temperature in spring. Hence, soil moisture may
provide some information to predict or forecast the
variability of air temperature over the region. During
spring, temperatures are rising relatively fast and frozen
soils are generally thawed out, especially within the top
soil layer. Sensible heat, therefore, becomes a very im-
portant factor within the interaction of the land and
atmosphere, so that evaporation over time gradually
increases. Soil moisture, thus, regulates the near surface
temperature, keeping it generally cool. With a high de-
mand of soil moisture for evapotranspiration its availabil-
ity makes it a significant controlling factor. This makes
Tsoilmoisture/airtemperature more significant than the in-
formation flow from air temperature to soil moisture (here
after referred to as Tairtemperature/soilmoisture) (Fig. 4b).
The Tairtemperature/soilmoisture (Fig. 4b) of this interaction
over the region is observed to be relatively insignificant
throughout the year. These separated signals of the in-
teraction are in agreement with the current understanding
of land surface atmosphere interactions. To verify that the
causalities of the separated signals occurring in the same
period of time are not the result of statistical pitfalls, their
frequency distributions are also plotted in Figs. 4c and 4d.
Applying the wavelet transform to obtain the time-
frequency distributions of both signals clearly reveals
that they occur at different time scales, with the latter
occurring on a shorter periodicity than the former. The
FIG. 5. Information flow between soil moisture and air temperature for RB. (a) Time-varying information flow
from soil moisture to air temperature and (b) the time-varying information flow from air temperature to soil
moisture. Causality is implied where the absolute value of the information flow signals (shown in blue shades and
the black solid line) exceed the absolute values of the significance results computed based on Eq. (C1) (shown
in red shades and red solid lines). The frequency distribution of (c) causality from soil moisture to air tem-
perature and (d) the causality from air temperature to soil moisture. All the significance tests were done at a 5%
significance level.
7530 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
significant parts of Tsoilmoisture/airtemperature are ob-
served to occur at larger time scales in Fig. 4c, beginning
from the start of spring and persisting into the early
periods of summer. It is important to keep in mind that
the coarse spatial and temporal resolution makes it more
difficult to obtain finer signals of significance. According
to Fig. 4d, if any level of Tairtemperature/soilmoisture is to be
significant, it would be found to occur at shorter time
scales between 3 and 30 days’ periodicity in midspring.
These results are, however, in very good agreement with
previous studies (e.g., Seneviratne et al. 2010). The soil
moisture to air temperature causality is here found to be
stronger than the air temperature to soil moisture cau-
sality signal. An advantage of the TvLK formalism is
that it is able to capture abrupt changes in the in-
teractions over time since it does not smooth the time
series estimation. Of course, since the Kalman filter is a
learning algorithm, the results improve along time, as
also seen in the synthetic model figures in the previous
section.
Figure 5 presents the information flow results over the
southeastern part of China (RB). This region is consid-
ered to be mostly wet; however, due to its position, it
also receives sufficient enough solar radiation, thus also
has a significant air temperature variability. A critical
overview of both Figs. 5a and 5b also suggests that there
is a distinct time lag between the two signals. Figure 5a
demonstrates that Tsoilmoisture/airtemperature leads the
coupling from late winter to early spring as expected.
This period finds the region drier, but with significantly
high air and soil temperatures, yet much less rainfall. As
such, the beginning of the year presents the region as a
soil-moisture-limited regime, causing soil moisture to
constrain evaporation. The wavelet decomposition in
Fig. 5c also sheds more light onto the interaction and
shows that the signal significantly occurs between 4- and
30-day cycles of late winter and early spring.
Figure 5b shows the other side of the coupling in this
region. From the wavelet analysis in Fig. 5d, we may say
that the direct causal structures within the coupling are
well separated. The periods of late spring and early to
midsummer indicate strong signals in both the time-
varying and time-frequency distributions. While the
Tsoilmoisture/airtemperature is strongest over shorter time
scales, Tairtemperature/soilmoisture is strongest over longer
time scales. Of course, these are findings as interpreted
from the ERA datasets, and as such the uncertainties
within the assimilation data will surely impact the in-
teractions. However, the results are in very good
agreement with current understanding of soil moisture
climate interactions (Seneviratne et al. 2010). As it is
considered to be an energy-limited region, air temper-
ature is seen to be the controlling factor in most parts of
the year. With reduced temperatures in autumn, yet
sufficient moisture in the soil, air temperature becomes
the main controlling factor in the region and constrains
the magnitude and rate of evapotranspiration. It is
worth emphasizing that the results of the time-varying
information flow used here are not qualitatively based,
but importantly, quantitatively, in nats day21. As such,
the magnitude of the signals can provide very good in-
sights for future predictive capability.
5. Discussion
Information flow has long been recognized to be
logically associated with causality and is hence ideal for
understanding the cause–effect relationship within in-
teractions (Liang 2008, 2016); it quantifies the exchange
of information between two systems or events, showing
both the direction and magnitude within a cause–effect
relation (Hlavácková-Schindler et al. 2007). Recently it
has been reported that it actually can be rigorously de-
rived from first principles within the context of sto-
chastic dynamical systems (Liang 2008, 2016). Our
ability to assess these qualities (magnitude, direction,
and time variation) of causality in the interactions be-
tween events gives us a better insight into the behavior
of the system and hence its predictive capability. Fur-
thermore, our ability to rank interactions based on
magnitudes is crucial in extreme event research as well
as for a better understanding of a natural systems. This is
exceedingly useful in different fields like meteorology,
climatology, finance, and game theory.
In Eq. (15), the square root Kalman filter is used to
estimate the information flow rate in a coupling to de-
termine their direct causal structures. The Kalman filter
as a learning algorithm is able to identify immedi-
ate changes when tracking the time-varying causality
within a system. Previous studies have successfully in-
tegrated the Kalman filter into time-invariant formal-
isms to obtain time-varying structures (Omidvarnia
et al. 2011; Punales 2011). Havlicek et al. (2010) also
integrated the Kalman filter into the generalized par-
tial directed coherence (GPDC) to obtain a dynamic
Granger causality formalism to analyze causality both
along frequency and time. Both the theoretical tests and
application of their Kalman filter-based formalism
showed significant improvements of the time-invariant
GPDC. Fundamentally, interactions between any two
events may vary with time; and as such, a time-invariant
formalism does not offer a faithful representation of the
evolution of the interactions. Here, we use the Kalman
filter to estimate the covariances at each time step in
Eq. (8) to obtain a time-varying structure as seen in
Eq. (15) (TvLK).
1 NOVEMBER 2019 H A G A N E T A L . 7531
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
We have established that the TvLK [Eq. (15)] is able
to obtain a rigorous quantitative measure of their causal
structure just as its time-invariant formalism [Eq. (8)].
The formalism that results in Eq. (8) has already been
tested in both deterministic and stochastic systems
(Liang 2016) and has been successfully applied to a va-
riety of applications for interaction studies. These rig-
orous properties are clear in the TvLK, and thus offer
much potential. Other methodologies like the Granger
causality, directed coherence, and the directed transfer
functions, which use vector autoregressive models for
their parameter estimations require stationary residuals
that could lead to different kinds of erroneous out-
comes. However, the TvLK is able to handle both sta-
tionary and nonstationary conditions, and thus, offers
advantages for wider application. Dhamala et al. (2008)
identified that the parametric Granger causality tech-
niques were better suited for low-order autoregression
(AR) processes than for data that required high-order
AR models. The wavelet-based Granger causality
(Dhamala et al. 2008) that was proposed in the same
study, though nonparametric, is computationally ex-
pensive because it has to be applied to multiple re-
alizations. While the accuracy of this formalism relies
heavily on a number of analyzed realizations, the TvLK
has been shown in the above synthetic models that one
realization is able to offer the needed information for a
proper causality analysis. This is of great importance
because real-world observations are usually taken once
from a single source, and thus, may offer only one time
series to capture the evolution of an event. Another
important advantage of the original causality formalism
in Liang (2014, 2016), and thus, the TvLK is that they are
very easy to compute since they do not require AR
modeling, but are composed of covariances for compu-
tation of causality.
Section 3 has shown that the principle of nil causality
(Liang 2014, 2016) is detectable by the TvLK, which is
not easily identified in some commonly used classical
causal inference approaches. In their work, Orlowsky
and Seneviratne (2010) showed with a statistical feed-
back parameter, the empirical feedback analysis, that
covariability, although necessary, may not be sufficient
to imply a causal relation between two variables. This, of
course, holds for other different measures such as lagged
or partial correlation, Granger causality and regression
analysis. They showed that a third variable might be the
reason for identifying covariability between two vari-
ables. This was illustrated in the same study by demon-
strating how the influence of sea surface temperatures
(SST) on precipitation persistence is easily mistaken for
the impact of soil moisture on precipitation. This sta-
tistical pitfall is here tackled in two ways. First, we
established through the numerical experiments that in a
coupled system, the TvLK is able to detect an un-
ambiguous one-way feedback relationship, which is es-
sential for establishing a causal relation. In addition,
where a two-way causality does not occur within the
same period of time, we assume the absence of a sta-
tistical pitfall. Second, since a knowledge of the tem-
poral scale (frequency) of causality between any two
variables is essential to verifying the presence of the
influence of a third variable, we extend the work flow of
the TvLK to include a frequency decomposition. Using
the continuous wavelet, we showed in the same synthetic
model experiments that the significant causalities really
do occur at their preset frequencies. This becomes even
more important when the separated feedback signals
tend to have a similar time-varying structure, so that we
can verify the absence of a statistical pitfall by identi-
fying if the causal relations occur at different tempo-
ral scales. This is difficult to identify just by observing
the information flow time series. However, a time-
frequency distribution is able to shed more light on the
different temporal scales of causality. This is clearly
demonstrated in the application section of this study.
The results of the synthetic model experiments thus
show that the TvLK does meet all the requirements
expected of it for a reliable application. It is important to
note that the TvLK formalism is developed to in-
vestigate the direct relationship within an n-dimensional
system, and as such may not be readily applicable to
investigate partial (or conditional) causal relationships.
This is, however, set for future studies in line with this
current one.
To understand how all these properties of the TvLK
would perform in a real-world application, section 4 has
demonstrated an application in the soil moisture–air tem-
perature interaction over selected regions in China based
on the first volumetric soil water layer (representing soil
moisture) and the 2-m air temperature. ERA-Interim
dataset is based on an assimilation scheme that considers
the relationship between soil moisture and temperature
based on the classical hydrological framework for defining
evapotranspiration regimes as a function of soil moisture.
This means we can expect the embedded causalities
within the time series. Tsoilmoisture/airtemperature was
found to be the more significant one over the partly wet–
partly dry Huabei region. Conversely, over the Huanan
region in Southeast China, Tairtemperature/soilmoisture was
found to be more significant. These results are in
agreement with the current understanding of soil mois-
ture temperature feedbacks. Applying a spectral analy-
sis to these results showed that the different signals
occurred at different temporal scales. Over the Huabei
region, Tsoilmoisture/airtemperature was stronger and
7532 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
occurred at longer time scales. The converse was found
over the Huanan region.
A very significant point worth mentioning here is that
the very rigorous and nice properties found in the Liang
formalism [Eq. (8)] [as stated in Liang (2014, 2016)] are
found to hold in the TvLK as well. This certainly would
make this a preferable choice to transfer entropy and the
Granger tests in many instances, as proven (Liang 2016).
Another important property, which is noteworthy of
mention, is that Eq. (8) was purposely derived for
physical systems from nature, which is clearly demon-
strated in section 4. Although the only application pre-
sented here is in land–atmosphere interactions, the
TvLK, like the LK, can be applied in other problems in
the natural sciences. It is expected to be especially useful
in weather and intraseasonal analyses where causal re-
lations have been suggested to change more quickly and
are difficult to observe more clearly. Beyond the natural
sciences, it is expected to be equally useful in the areas of
finance and the social sciences.
Acknowledgments. This research was funded by
National Key Research and Development Program
of China (2017YFA0603701), the National Natural Sci-
ence Foundation of China (41875094), the Sino-German
Cooperation Group Project (GZ1447), and the Post-
graduate Research and Practice Innovation Program of
Jiangsu Province (KYCX17_0889).
APPENDIX A
The Bierman–Thornton Formalism
During the development of the Kalman filter in
the last few decades, it was found that the standard
Kalman filter has the propensity to accumulate nu-
merical errors due to round offs during computa-
tions. As a result, the filter becomes unstable and
accuracy of its estimation would thus, be compro-
mised (Roncero 2014). In this regard, the square root
family of the Kalman filter was developed to handle
such instabilities, to make the filter more robust; this
class of the filter has been applied in many studies and
have shown significant advantages (Zhou et al. 2015).
In this study, we make use of the Bierman–Thornton
algorithm with modified Cholesky decomposition
in the measurement and time updates of the filter
(Fig. A1). This is expected to make the TvLK com-
putation more stable and robust. The comparison of
the standard Kalman filter and the square root forms are
beyond the scope of this study, as such, no such experi-
ments were included. Nonetheless, the algorithm has
been developed to allow the user to choose to use either
of the forms of the filter.
The Bierman–Thornton (UD filtering) methodology
includes two main parts: the Bierman algorithm to
update the observations (or measurements) of the U
and D modified Cholesky factors of the covariance
matrix P, where U is a unit upper triangular matrix and
the D is a diagonal matrix. This gives P in the form P 5
UDUT. The second part is the Thornton algorithm,
which is mainly used for the temporal update of U and
D. Following Bierman and Thornton (1976) and its
references thereof and as stated above, the factored for
of P is given as
P 5 UDUT . (A1)
Factoring Eq. (13) using Eq. (A1) yields
UDUT 5 U2[D2 2 1/a(D2U2Ta)(D2U2Ta)T]U2T ,
1/a 5 HkP2
k HT
k ,
(A2)
where a here is defined as the innovations variance of
the measurement vector and a is defined as an obser-
vation coefficient. Let the n vectors of f and v be defined
by
f 5 U2Ta,
v 5 D2fa, (A3)
and let U and D be the UD factors of D2 2 1/avvT, thus
UDUT 5 D2 2 1/avvT . (A4)
Substituting Eq. (A3) into Eq. (A4) gives
UDUT 5 (U2U)D(U2U)T , (A5)
and since U and U are unit upper triangular, we obtain
the solutions as
U 5 U2U ,
D 5 D, and (A6)
P2
k11 5 AkPkAT
k 1 Qk . (A7)
Substituting the Bierman observation update into
Eq. (A7) gives
P2 5 Ak(U1D1U1)AT
k 1 Qk . (A8)
A more detailed and complete description of the
Bierman–Thornton algorithm is beyond this paper.
Readers are referred to Grewal and Andrews (2001) and
its references therein. Table A1 below summarizes the
1 NOVEMBER 2019 H A G A N E T A L . 7533
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
difference between the standard Kalman filter and its
square root framework based on the Bierman–Thornton
algorithm.
APPENDIX B
The Framework of the TvLK
Many studies have focused on producing accurate
results for the noise covariances, and have been able to
show that since we are unable to observe the process
under estimation, Q, the process noise covariance be-
comes even more difficult to determine (Åkesson et al.
2008; Bavdekar et al. 2011; Odelson et al. 2006; Saha
et al. 2011). In this study, we employ the use of the ex-
ponentially weighted moving average (EWMA) and
unweighted moving average (UWMA) to estimate Q
and R offline.
Although the Kalman filter has received a wide rec-
ognition and has been shown to provide optimal solu-
tions where needed, its adaptive parameterization holds
the greatest challenges. Previous work has identified
that even though the filter is able to produce very reli-
able results, the estimation of the process and mea-
surement noise covariances, Q and R, is rather difficult
(Bavdekar et al. 2011; Saha et al. 2011; Mohan et al.
2015). It is therefore important to carefully parameter-
ize these variables to obtain a more robust output. A
common practice is to set Q and R to be constants,
precisely, to be unit matrices. However, in reality, Q and
R are expected to change at each time step. The for-
malism in this study uses a smoothed version of the time
series as a surrogate for the true process state, which is
done with EWMA or UWMA to derive Q and R offline
at each time step (shown in Fig. A1). Several experi-
ments conducted during this study have also confirmed
that the Kalman gain is more accurately computed when
Q and R are properly derived. Given this associative
property, the formalism presented in this study is some-
what more difficult to derive because of the Kalman
filter. Thus, several tests were required to obtain an
optimal solution. Because of the square root form of the
Kalman filter used here, computation is rather expen-
sive. It takes about 3 times the time length to compute,
as against the traditional causality in Liang (2014). The
FIG. A1. A framework of the time-frequency varying causality formalism.
TABLE A1. A comparison of the standard and square root Kalman filter formalisms.
Process The standard Kalman filter The square root Kalman filter
Compute Kalman gain Kk 5 P2
k HT
k (HkP2
k HT
k 1 R)21 Kk 5 (U2
k D2
k U2T
k )HT
k [Hk(U2
k D2
k U2T
k )HT
k 1 R]21
Updating xk 5 x2
k 1 Kk(yk 2 Hkx2
k ) xk 5 x2
k 1 Kk(yk 2 Hkx2
k )
Compute updated
covariance matrix
Pk 5 (1 2 KkHk)P2
k (UkDkUT
k ) 5 (1 2 KkHk)(U2
k D2
k U2T
k )
Covariance prediction P2
k11 5 AkPkAT
k 1 Qk (U2
k11D2
k11U2T
k11) 5 (AkUk)Dk(UT
k AT
k ) 1 Qk
7534 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
EWMA and UWMA chosen in this study were to fa-
cilitate easier computations. Of course, in the use of the
EWMA and UWMA methods, there is the require-
ment of the choice of a lookback window length to
compute the moving average. In an attempt to do this,
an information length of the window length is lost to do
the forward update of the filter. This is seen from the
missing data in the time-varying results of the synthetic
models in Figs. 1 and 2. An optimal linear smoother is
suggested by Fraser and Potter (1969) by running the
filter backward using the last estimate of the forward
recursion of the filter to initialize it, and then combin-
ing both the forward and backward runs. Using this
approach of forward and backward runs, which has
already been tested in the course of this study, does
help to curb the problem of the missing data of the
initial time steps of the TvLK result, though it was
eventually not adopted. Further studies will look into
employing the optimal smoother in the Kalman filter
run of this formalism. It can therefore be seen in the
frequency decomposition of the synthetic model re-
sults, the missing data of the preceding parts of the
information flow time series were not used in the
wavelet decomposition.
APPENDIX C
Significance Testing
For a statistical tool such as in Eq. (8), it is rather
necessary to do a significance test so as to better un-
derstand the robustness of the derived result. For this
purpose, we use the Fisher information matrix equation
[Eq. (C1)], following Liang (2014), since its inverse gives
obtains a covariance matrix with a given significance
level. Liang (2014) suggested that the normally used
bootstrap method may not hold much simplicity to
obtain a good significance level. With a large sample size
N, the information flow approaches a normal distribu-
tion around its true value with a variance (c12/c11)2s2
a12 ,
which is derived from the maximum likelihood estima-
tion. Thus, if we denote ^u 5 (f1, a11, a12, b1), we obtain
NIij 5 2 å
N
n51
›2 logr (Xn11jXn; u)
›ui ›uj
, (C1)
where I in the matrix NI represents the Fisher in-
formation matrix. The inverse of NI is the covariance
matrix of ^u, which has s2
a12 within. Here, r is the marginal
probability of {Xn}, a Markov process. Readers are re-
ferred to Liang (2014) for details of Eq. (C1).
REFERENCES
Åkesson, B. M., J. B. Jørgensen, N. K. Poulsen, and S. B.
Jørgensen, 2008: A generalized autocovariance least-squares
method for Kalman filter tuning. J. Process Control, 18, 769–
779, https://doi.org/10.1016/j.jprocont.2007.11.003.
Asl, H. G., and S. H. Pourtakdoust, 2007: UD covariance factor-
ization for unscented Kalman filter using sequential mea-
surements update. Int. J. Aerosp. Mech. Eng., 1, 629–637.
Bavdekar, V. A., A. P. Deshpande, and S. C. Patwardhan, 2011:
Identification of process and measurement noise covariance
for state and parameter estimation using extended Kalman
filter. J. Process Control, 21, 585–601, https://doi.org/10.1016/
j.jprocont.2011.01.001.
Bellantoni, J., and K. Dodge, 1967: A square root formulation of
the Kalman-Schmidt filter. AIAA J., 5, 1309–1314, https://
doi.org/10.2514/3.4189.
Berg, A., B. R. Lintner, K. L. Findell, S. Malyshev, P. C. Loikith,
and P. Gentine, 2014: Impact of soil moisture–atmosphere
interactions on surface temperature distribution. J. Climate,
27, 7976–7993, https://doi.org/10.1175/JCLI-D-13-00591.1.
Bierman, G. J., and C. L. Thornton, 1976: Numerical comparison of
discrete Kalman filter algorithms: Orbit determination case
study. Conf. on Decision and Control/15th Symp. on Adaptive
Processes, Clearwater, FL, IEEE, 859–872.
Casagrande, E., B. Mueller, D. G. Miralles, D. Entekhabi, and
A. Molini, 2015: Wavelet correlations to reveal multiscale
coupling in geophysical systems. J. Geophys. Res., 120, 7555–
7572, http://doi.org/10.1002/2015JD023265.
Catalano, F., A. Alessandri, M. D. Felice, Z. Zhu, and R. B.
Myneni, 2016: Observationally based analysis of land–
atmosphere coupling. Earth Syst. Dyn., 7, 251–266, https://
doi.org/10.5194/esd-7-251-2016.
Ciabatta, L., L. Brocca, C. Massari, T. Moramarco, S. Puca,
A. Rinollo, S. Gabellani, and W. Wagner, 2015: Integration of
satellite soil moisture and rainfall observations over the Italian
territory. J. Hydrometeor., 16, 1341–1355, https://doi.org/
10.1175/JHM-D-14-0108.1.
Dajcman, S., 2013: Interdependence between some major Euro-
pean stock markets—A wavelet lead/lag analysis. Prague
Econ. Pap., 22 (1), 28–49, https://doi.org/10.18267/j.pep.439.
Dhamala, M., G. Rangarajan, and M. Ding, 2008: Analyzing in-
formation flow in brain networks with nonparametric granger
causality. Neuroimage, 41, 354–362, https://doi.org/10.1016/
j.neuroimage.2008.02.020.
Fischer, E. M., S. I. Seneviratne, P. L. Vidale, D. Lüthi, and
C. Schär, 2007: Soil moisture–atmosphere interactions during
the 2003 European summer heat wave. J. Climate, 20, 5081–
5099, https://doi.org/10.1175/JCLI4288.1.
Flato, G., J. Marotzke, B. Abiodun, P. Braconnot, S. C. Chou,
W. Collins, and M. Rummukainen, 2013: Evaluation of cli-
mate models. Climate Change 2013: The Physical Science
Basis, T. F. Stocker et al., Eds., Cambridge University Press,
741–866.
Ford, T. W., A. D. Rapp, S. M. Quiring, and J. Blake, 2015: Soil
moisture–precipitation coupling: Observations from the
Oklahoma Mesonet and underlying physical mechanisms.
Hydrol. Earth Syst. Sci., 19, 3617–3631, https://doi.org/10.5194/
hess-19-3617-2015.
Frankingnoul, C., and K. Hasselmann, 1977: Stochastic climate
models, Part II Application to sea-surface temperature
anomalies and thermocline variability. Tellus, 29, 289–305,
http://doi.org/10.1111/j.2153-3490.1977.tb00740.x.
1 NOVEMBER 2019 H A G A N E T A L . 7535
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
Fraser, D., and J. Potter, 1969: The optimum linear smoother
as a combination of two optimum linear filters. IEEE
Trans. Autom. Control, 14, 387–390, https://doi.org/10.1109/
TAC.1969.1099196.
Ghorbanidehno, H., A. Kokkinaki, J. Yue, E. Darve, and P. K.
Kitanidis, 2015: Real-time data assimilation for large-scale
systems: The spectral Kalman filter. Advances in Water Re-
sources, Vol. 86, H.-J. Hendricks Franssen and I. Neuweiler,
Eds., Elsevier, 260–272.
Gonzalez, R., G. Sutter, C. Sisterna, and H. Patino, 2014: FPGA-
based floating-point UD filter coprocessor for integrated
navigation systems. 2015 Sixth Argentine Conf. on Embedded
Systems (CASE), Buenos Aires, Argentina, IEEE, https://
doi.org/10.1109/SASE-CASE.2015.7295840.
Granger, C. W. J., 1969: Investigating causal relations by econo-
metric models and cross-spectral methods. Econometrica, 37,
424–438, https://doi.org/10.2307/1912791.
——, 1980: Testing for causality: A personal viewpoint. J.
Econ. Dyn. Control, 2, 329–352, https://doi.org/10.1016/0165-
1889(80)90069-X.
Grewal, M. S., and A. P. Andrews, 2001: Kalman Filtering: Theory
and Practice Using MATLAB. Wiley, 401 pp.
Guo, Z., and Coauthors, 2006: GLACE: The Global Land–
Atmosphere Coupling Experiment. Part I: Overview. J. Hydro-
meteor., 7, 611–625, https://doi.org/10.1175/JHM511.1.
Havlicek, M., J. Jan, M. Brazdil, and V. D. Calhoun, 2010: Dynamic
Granger causality based on Kalman filter for evaluation of
functional network connectivity in fMRI data. Neuroimage,
53, 65–77, https://doi.org/10.1016/j.neuroimage.2010.05.063.
Hlavácková-Schindler, K., M. Palus, M. Vejmelka, and J. Bhattacharya,
2007: Causality detection based on information-theoretic ap-
proaches in time series analysis. Phys. Rep., 441 (1), 1–46, https://
doi.org/10.1016/j.physrep.2006.12.004.
Houtekamer, P. L., and F. Zhang, 2016: Review of the ensemble
Kalman filter for atmospheric data assimilation. Mon. Wea. Rev.,
144, 4489–4532, https://doi.org/10.1175/MWR-D-15-0440.1.
Kiani, M., and S. H. Pourtakdoust, 2014: Adaptive square-root
cubature-quadrature Kalman particle filter for satellite attitude
determination using vector observations. Acta Astronaut., 105,
109–116, https://doi.org/10.1016/j.actaastro.2014.08.021.
Koster, R. D., P. A. Dirmeyer, Z. Guo, G. Bonan, E. Chan, P. Cox,
and T. Yamada, 2004: Regions of strong coupling between soil
moisture and precipitation. Science, 305, 1138–1140, https://
doi.org/10.1126/science.1100217.
Liang, X. S., 2008: Information flow within stochastic dynamical
systems. Phys. Rev., 78E, 031113, http://doi.org/10.1103/
PhysRevE.78.031113.
——, 2013: The Liang–Kleeman information flow: Theory and
applications. Entropy, 15, 327–360, https://doi.org/10.3390/
e15010327.
——, 2014: Unraveling the cause–effect relation between time
series. Phys. Rev., 90E, 052150, https://doi.org/10.1103/PhysRevE.
90.052150.
——, 2016: Information flow and causality as rigorous notions
ab initio. Phys. Rev., 94E, 052201, http://doi.org/10.1103/
PhysRevE.94.052201.
Maoudj, R., L. Fety, and C. Alexandre, 2013: Performance analysis
of modified Gram-Schmidt Cholesky implementation. Int.
J. Comput. Digital Syst., 27 (1), 21–27, https://doi.org/10.12785/
IJCDS/020103.
Massari, C., L. Brocca, T. Moramarco, Y. Tramblay, and J. F. D.
Lescot, 2014: Potential of soil moisture observations in
flood modelling: Estimating initial conditions and correcting
rainfall. Adv. Water Resour., 74, 44–53, https://doi.org/10.1016/
j.advwatres.2014.08.004
Miralles, D. G., M. J. V. D. Berg, A. J. Teuling, and R. A. M. D.
Jeu, 2012: Soil moisture-temperature coupling: A multiscale
observational analysis. Geophys. Res. Lett., 39, L21707, https://
doi.org/10.1029/2012GL053703.
——, A. J. Teuling, C. C. Heerwaarden, and J. Arellano, 2014:
Mega-heatwave temperatures due to combined soil desicca-
tion and atmospheric heat accumulation. Nat. Geosci., 7, 345–
349, https://doi.org/10.1038/ngeo2141.
Mohan, M. S., N. Naik, R. M. O. Gemson, and M. R.
Ananthasayanam, 2015: Introduction to the Kalman filter and
tuning its statistics for near optimal estimates and Cramer Rao
bound. Indian Institute of Technology Kanpur Department of
Electrical Engineering Tech. Rep. TR/EE2015/401, 402 pp.,
https://arxiv.org/pdf/1503.04313.pdf.
Navarra, A., and J. Tribbia, 2005: The coupled manifold. J. Atmos.
Sci., 62, 310–330, https://doi.org/10.1175/JAS-3345.1.
Notaro, M., 2008: Statistical identification of global hot spots in soil
moisture feedbacks among IPCC AR4 models. J. Geophys.
Res., 113, D09101, https://doi.org/10.1029/2007JD009199.
Odelson, B. J., M. R. Rajamani, and J. B. Rawlings, 2006: A new
autocovariance least-squares method for estimating noise
covariances. Automatica, 42, 303–308, https://doi.org/10.1016/
j.automatica.2005.09.006.
Omidvarnia, A. H., M. Mesbah, M. S. Khlif, J. M. O’Toole, P. B.
Colditz, and B. Boashash, 2011: Kalman filter-based time-
varying cortical connectivity analysis of newborn EEG. 2011
Annual Int. Conf. of the IEEE Engineering in Medicine and
Biology Society, Boston, MA, IEEE, 1423–1426, http://
doi.org/10.1109/IEMBS.2011.6090335.
Orlowsky, B., and S. I. Seneviratne, 2010: Statistical analyses of
land–atmosphere feedbacks and their possible pitfalls. J. Cli-
mate, 23, 3918–3932, https://doi.org/10.1175/2010JCLI3366.1.
Palus, M., 2014: Cross-scale interactions and information transfer.
Entropy, 16, 5263–5289, https://doi.org/10.3390/e16105263.
Papagiannopoulou, C., D. G. Miralles, S. Decubber, M. Demuzere,
N. E. C. Verhoest, W. A. Dorigo, and W. Waegeman, 2017: A
non-linear Granger-causality framework to investigate climate–
vegetation dynamics. Geosci. Model Dev., 10, 1945–1960, https://
doi.org/10.5194/gmd-10-1945-2017.
Papana, A., C. Kyrtsou, D. Kugiumtzis, and C. Diks, 2016: De-
tecting causality in non-stationary time series using partial
symbolic transfer entropy: Evidence in financial data. Comput.
Econ., 47, 341–365, https://doi.org/10.1007/s10614-015-9491-x.
Parinussa, R. M., G. Wang, Y. Y. Liu, D. F. T. Hagan, F. Lin, R. der
Schalie, and R. A. M. Jeu, 2017: The evaluation of single-
sensor surface soil moisture anomalies over the mainland of
the People’s Republic of China. Remote Sens., 9, 149, http://
doi.org/10.3390/rs9020149.
Punales, A. G. S., 2011: Time-varying coefficient models and the
Kalman filter. M.S. thesis, Applied Mathematics, Ryerson
University, 65 pp., https://digital.library.ryerson.ca/islandora/
object/RULA%3A2193/datastream/OBJ/download/Time-
Varying_Coefficient_Models_And_The_Kalman_Filter___
Applications_To_Hedge_Funds.pdf.
Roncero, D. F., 2014: A study of QR decomposition and Kalman
filter implementations. M.S. thesis, Signal Processing,
School of Electrical Engineering, Kungliga Tekniska
Hgskolan, 57 pp., http://kth.diva-portal.org/smash/get/
diva2:808731/FULLTEXT01.pdf.
Roundy, J. K., and E. F. Wood, 2015: The attribution of land–
atmosphere interactions on the seasonal predictability of
7536 J O U R N A L O F C L I M A T E VOLUME 32
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC
drought. J. Hydrometeor., 16, 793–810, https://doi.org/10.1175/
JHM-D-14-0121.1.
Saha, M., B. Goswami, and R. Ghosh, 2011: Two novel costs
for determining the tuning parameters of the Kalman
filter. Department of Instrumentation and Electronics Engineering,
Jadavpur University, 8 pp., https://arxiv.org/pdf/1110.3895.pdf.
Saini, R., G. Wang, and J. S. Pal, 2016: Role of soil moisture
feedback in the development of extreme summer drought and
flood. J. Hydrometeor., 17, 2191–2207, https://doi.org/10.1175/
JHM-D-15-0168.1.
Sastry, V., 1971: Decomposition of the extended Kalman filter.
IEEE Trans. Autom. Control, 16, 260–261, https://doi.org/
10.1109/TAC.1971.1099709.
Seneviratne, S. I., T. Corti, E. L. Davin, M. Hirschi, E. B. Jaeger,
I. Lehner, and A. J. Teuling, 2010: Investigating soil moisture–
climate interactions in a changing climate: A review.
Earth Sci. Rev., 99, 125–161, https://doi.org/10.1016/
j.earscirev.2010.02.004.
Stéfanon, M., P. Drobinski, F. D’Andrea, C. Lebeaupin-Brossier,
and S. Bastin, 2014: Soil moisture-temperature feedbacks at
meso-scale during summer heat waves over Western Europe.
Climate Dyn., 42, 1309–1324, https://doi.org/10.1007/s00382-
013-1794-9.
Stips, A., D. Macias, C. Coughlan, E. Garcia-Gorriz, and X. S.
Liang, 2016: On the causal structure between CO2 and global
temperature. Sci. Rep., 6, 21691, https://doi.org/10.1038/
srep21691.
Taylor, C. M., R. A. M. D. Jeu, F. Guichard, P. P. Harris, and W. A.
Dorigo, 2012: Afternoon rain more likely over drier soils.
Nature, 489, 423–426, https://doi.org/10.1038/nature11377.
Thornton, C. L., 1976: Triangular covariance factorizations for
Kalman filtering. NASA Tech. Memo. 33-798, 197 pp., https://
ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19770005172.pdf.
Torrence, C., and G. P. Compo, 1998: A practical guide to wavelet
analysis. Bull. Amer. Meteor. Soc., 79, 61–78, https://doi.org/
10.1175/1520-0477(1998)079,0061:APGTWA.2.0.CO;2.
Tuttle, S., and G. Salvucci, 2015: Empirical evidence of contrasting soil
moisture–precipitation feedbacks across the United States. Sci-
ence, 352, 825–828, http://doi.org/10.1126/science.aaa7185.
Vialatte, F. B., J. Solé-Casals, J. Dauwels, M. Maurice, and
A. Cichocki, 2009: Bump time-frequency toolbox: A toolbox
for time-frequency oscillatory bursts extraction in electro-
physiological signals. BMC Neurosci., 10, 46, https://doi.org/
10.1186/1471-2202-10-46.
Wang, Y., T. Zhang, X. Chen, J. Li, and P. Feng, 2017: Spatial and
temporal characteristics of droughts in Luanhe River basin.
Theor. Appl. Climatol., 131, 1369–1385, http://doi.org/10.1007/
s00704-017-2059-z.
Wu, L., and J. Zhang, 2015: The relationship between spring soil
moisture and summer hot extremes over North China. Adv.
Atmos. Sci., 32, 1660–1668, https://doi.org/10.1007/s00376-015-
5003-0.
Zhang, J., W. C. Wang, and J. Wei, 2008: Assessing land–
atmosphere coupling using soil moisture from the Global
Land Data Assimilation System and observational pre-
cipitation. J. Geophys. Res., 113, D17119, https://doi.org/
10.1029/2008JD009807.
Zhao, W., and A. Li, 2015: A review on land surface processes
modelling over complex terrain. Adv. Meteor., 2015, 607181,
http://doi.org/10.1155/2015/607181.
Zheng, Y., A. Kumar, and D. Niyogi, 2015: Impacts of land–
atmosphere coupling on regional rainfall and convection.
Climate Dyn., 44, 2383–2409, https://doi.org/10.1007/s00382-
014-2442-8.
Zhou, Y., C. Zhang, Y. Zhang, and J. Zhang, 2015: A new adaptive
square-root unscented Kalman filter for nonlinear systems
with additive noise. Int. J. Aerosp. Eng., 2015, 381478, http://
doi.org/10.1155/2015/381478.
1 NOVEMBER 2019 H A G A N E T A L . 7537
Unauthenticated | Downloaded 07/30/26 12:13 PM UTC