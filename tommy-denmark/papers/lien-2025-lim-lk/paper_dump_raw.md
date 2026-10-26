PHYSICAL REVIEW E 112, 054101 (2025)
Linear-inverse-modeling approach to estimating Liang-Kleeman information
flow in a cyclostationary process under memoryless and persistent noise
Justin Lien *
Mathematical Institute, Tohoku University, Sendai, Japan
Hiroyasu Ando
Advanced Institute for Materials Research, Tohoku University, Sendai, Japan
and Mathematical Institute, Tohoku University, Sendai, Japan
Yong-Yub Kim
Center for Climate Physics, Institute for Basic Science, Busan, Republic of Korea
and Pusan National University, Busan, Republic of Korea
Tomoki Tozuka
Department of Earth and Planetary Science, The University of Tokyo, Tokyo, Japan
(Received 27 June 2025; accepted 22 September 2025; published 3 November 2025)
The Liang-Kleeman (LK) information flow provides a powerful framework for quantifying causality among
variables, while linear inverse modeling (LIM) offers an effective empirical approach to studying the dynamical
evolution of system states from input data. In this study, we unify these two concepts by proposing the
LIM-LK framework—a data-driven method for estimating LK information flow from input data using LIM.
Beyond capturing causality among state variables, the proposed framework establishes a direct connection
between causality and system dynamics, and also enables the quantification of entropy transfer from the ambient
environment to the system through both memoryless and persistent stochastic forcing. The effectiveness of this
unified approach is demonstrated through an application to the interaction between the Pacific and Indian Oceans,
offering both causal and dynamical insight into ocean variability and its seasonal modulation.
DOI: 10.1103/5cd4-5cb4
I. INTRODUCTION
Understanding causality is essential for unraveling how
variables within a complex system behave and for developing
robust strategies to investigate their outcomes [1]. In contrast
to mere correlations, causal relationships reveal the under-
lying mechanisms that drive change, enabling us not just to
predict, but to intervene effectively [2]. This makes causality
a cornerstone of scientific inquiry, engineering design, and
decision making [3–5].
Various approaches have been developed to analyze causal-
ity and several studies have recently formalized concepts
related to causality using probability theory within a graph-
theoretic framework. For instance, LiNGAM is a data-driven
method for identifying direct causal relationships among vari-
ables in a static system subjected to non-Gaussian noise [6].
Extensions such as DirectLiNGAM, VarLiNGAM, and Lay-
eredLiNGAM have further expanded their utility, especially in
*Contact author: lien.justin.t8@dc.tohoku.ac.jp
Published by the American Physical Society under the terms of the
Creative Commons Attribution 4.0 International license. Further
distribution of this work must maintain attribution to the author(s)
and the published article’s title, journal citation, and DOI.
uncovering directional causality and hierarchical structure in
multivariate data [7–10]. However, many of these approaches
have not yet been extended to dynamical systems where
temporal structure and persistent stochasticity are key com-
ponents.
A notable alternative is an information-theoretic formal-
ism, which quantifies information using Shannon entropy in
stochastic systems [11–13]. This formalism has been success-
fully applied beyond statistical mechanics, including climate
science, such as model predictability and ensemble forecast
skill [11,14–19]. Building on this foundation, the Liang-
Kleeman (LK) information flow, defined via entropy transfer,
provides a quantitative measure of causality among variables
[12,20,21]. To estimate this empirically, an empirical ap-
proach was developed in [2], making use of an approximate
autonomous linearized stochastic system to enable data-driven
analysis of causality. This approach has since been extended
to incorporate factors such as periodicity and Kalman filter-
ing, and has been widely applied in geophysical studies—for
example, to analyze causal relationships between geophysi-
cal variables (e.g., precipitation and sea surface temperature,
snow and surface air temperature, soil moisture and air tem-
perature) [22–24]. However, it remains limited in its capacity
to incorporate persistent stochastic influences, which are both
prevalent in real-world systems and important in climate mod-
eling [25,26].
2470-0045/2025/112(5)/054101(12) 054101-1 Published by the American Physical Society
LIEN, ANDO, KIM, AND TOZUKA To address this limitation, we adopt linear inverse mod-
eling (LIM), a class of empirical methods that approxi-
mates the evolution of input data using linear stochastic
differential equations. The most fundamental LIM and its
extensions (collectively called LIMs in this article) have
seen broad application in climate science, including El
Niño-Southern Oscillation (ENSO) predictions, ENSO-type
classification, and interbasin teleconnection analysis [27–31].
Although LIM was originally developed without an explicit
focus on causality, recent work by [32] demonstrated that the
stationary LIMs can be effectively integrated with the LK
formulation to estimate causality among state variables. This
hybrid method captures the time-independent entropy flow
in the presence of persistent noise and offers a physically
grounded interpretation of causal influence through both sta-
tistical dependencies and dynamical relationships. However,
the previous study primarily addressed causality among state
variables under the stationary condition [32]. The broader
interplay between causality and dynamics, especially under
nonstationary regimes, remains underexplored, highlighting
key theoretical gaps for further investigation.
This study extends the theoretical foundation and the
methodology proposed in [32]. From a theoretical perspective,
we show that in a linear stochastic process driven by both
white and colored noise, the LK causality can be explic-
itly formulated in terms of system parameters and statistical
quantities. Moreover, through the principle of entropy conser-
vation, a connection between system dynamics and causality
is established, yielding a dynamical interpretation of infor-
mation flow. In practice, LIM is first applied to construct
an approximate linear representation of the system based on
input data, from which the LK information flow is estimated.
This integrated approach, referred to as the unified LIM-LK
framework, enables not only the quantification of causal re-
lationships among state variables but also the estimation of
entropy transfer from both memoryless and persistent external
noise. Furthermore, it offers a more comprehensive analysis
by incorporating a dynamical perspective from LIM and a
causal perspective from the LK formalism, thereby extending
the interpretation beyond causal influence alone.
Instead of presenting the LIM-LK framework for all LIM
variants, we particularly use a generalized version, called
CS-CW-LIM, which accounts for both the wide-sense cyclo-
stationarity (CS) of the input data and the influence of both
colored (C) and white (W) noise in the stochastic forcing.
Other LIM variants appeared in [25,30,33–36] and can be
viewed as a simplified version of this formulation and hence
follow the same workflow. Finally, as an illustrative applica-
tion, we apply this unified LIM-LK framework to examine
causal and dynamical interactions between the Pacific and
Indian Oceans. Specifically, we discuss the seasonal variation
of LK information flow and the potential pathways through
which variability in the Indian Ocean or atmospheric pro-
cesses influences ENSO. The results enhance the existing
understanding by offering insights through an interpretation
based on entropy exchange and causal dynamics.
II. METHODOLOGY
In this section, we first introduce the forward formula-
tion of LIM and LK information flow before addressing the
associated inverse problems. For clarity, the forward formu-
PHYSICAL REVIEW E 112, 054101 (2025)
lation is presented in bold font, with derivations outlined in
Appendix A, while inverse problems are written in regu-
lar font, with numerical details provided in Appendix B.
Throughout, we assume cyclostationarity, although this as-
sumption is not explicitly restated.
A. Forward formulation
1. Linear inverse modeling
The governing equation of the state vector x in CS-CW-
LIM is given by
d
x = A(t )x + 2Qη + 2D(t )ξ. (1)
dt
In this formulation, A is the periodic first-order dynamical
matrix and D is the periodic positive definite stochastic matrix
characterizing the spatial-temporal patterns of the normal-
ized Gaussian white-noise vector ξ ∈ Rn [i.e., ⟨ξ(t )⟩ = 0 and
⟨ξ(t + τ)ξ(t )T ⟩ = δ(τ)I, where the bracket and δ denote the
expectation and the Dirac delta function, respectively]. Both
A and D are assumed to have the same period, normalized
to 1 without loss of generality. Meanwhile, Q is the time-
independent positive definite stochastic matrix associated with
the normalized colored noise vector η ∈ Rn characterized by
the noise correlation time γ. More precisely, η is realized
by the steady state of d
dt η=−1
γ η + 1
γ ξ; hence, it has temporal
−|τ|
dependence described by ⟨η(t + τ)η(t )T ⟩ = 1
e
γ I, and for-
2γ
mally converges to ξ in the white-noise limit γ → 0 [27,34].
The periodic system parameters A and D, as well as the
statistical quantities of Eq. (1), can be naturally identified as
functions on the phase domain, the circle S of perimeter 1, via
the canonical projection map ω : R → S. For convenience,
the phase variable θ and the time variable t are identified via
ω(t )= θ without explicitly stating if there is no confusion
[35].
Unlike the white noise, the colored noise and the state
vector are correlated: Cηx (θ) = ⟨η(t )x(t )T ⟩ ̸= 0 [34,37]. We
refer to it as the noise-state coupling matrix, as it represents
the extent to which η modulates the direction and magnitude
of the evolution of x [25]. Though the colored noise is not
part of the system state, the coupling matrix can be written as
Cηx = Q
2 BT , where B is a function of A and γ given by the
periodic solution of the following equation:
B′
= −Bγ−1 + AB + γ−1I. (2)
The correlation function K(τ,θ) = ⟨x(t + τ)x(t )T ⟩ of x
and its partial right-derivatives with respect to the lag variable
τ satisfy
Kτ (0,θ)= AC + 2QCηx = AC + QBT (3)
and
γKττ (0,θ)= γA′C + γAKτ− (Kτ− AC), (4)
where C(θ) = ⟨x(t )x(t )T ⟩ = K(0,θ) denotes the covariance
of x. The balance equation for the deterministic dynamics and
stochastic forcing, called the fluctuation-dissipation relation
(FDR), reads
C′
= Sym(AC + QBT + D), (5)
054101-2
LINEAR-INVERSE-MODELING APPROACH TO … FIG. 1. Schematic illustration of the influence of variables on
the probability distribution P of a target variable xi through LK
information flow. This example is particularly relevant for linear
systems of the form given in Eq. (1). A similar conceptual figure is
presented in [40].
where Sym(X)= X + XT denotes the symmetrization oper-
ator (defined without the usual factor of 1
2 ). Hence, K and γ
characterize the governing system (1).
2. LK information flow
To better understand the interactions both within the sys-
tem and from external sources, we introduce the concept of
Liang-Kleeman information flow, which quantifies the direc-
tional causal influence, also referred to as information transfer,
between variables [12,21,38,39]. Specifically, consider two
components, a and b, of an n-dimensional process described
by a stochastic differential equation. The rate of information
flowing from b to a, denoted by Tb→a (unit: nats/time), is
defined to be the change rate of the marginal (Shannon) en-
tropy of a, minus the same change rate but without the effect
from b to the system [2]. In this context, information flow
may also be interpreted as entropy flow. A positive value of
Tb→a > 0 indicates that b excites a by transferring entropy
into a; similarly, a negative value of Tb→a < 0 implies a
stabilizing influence from b to a through a removal in entropy.
In either case, b is said to be causal to a [2]. A schematic
illustration is provided in Fig. 1.
For a linear system governed by Eq. (1), the time-
dependent information flow Tx j →xi from a state variable x j
to another xi can be written as
Tx j →xi
= Ai j
Ci j
Cii
. (6)
In addition to the influence determined by the deterministic
dynamics, the contribution from persistent colored noise to
the state variable can also be captured. The information flow
from a colored noise component η j to the state variable xi is
given by
Tη j →xi
= ( 2Q)i j
CT
ηx i j
Cii
, (7)
collectively written as Tη→xi := j Tη j →xi , and from the
white-noise vector ξ is given by
Dii
Tξ→xi
=
> 0. (8)
Cii
PHYSICAL REVIEW E 112, 054101 (2025)
Equations (7) and (8) illustrate the distinct mechanisms
of information transfer arising from two types of stochastic
forcing. Here, we view the variance Cii > 0 of xi as a normal-
ization constant as it appears in Eqs. (6)–(8). In the case of
white noise, which is statistically independent of the state vec-
tor, the resulting positive information transfer depends solely
on the stochastic matrix. In contrast, colored noise interacts
statistically with the state vector through the coupling matrix.
Consequently, it contributes to information transfer via a com-
bined effect of both the stochastic and coupling matrices. In
addition, it is possible for an individual colored-noise compo-
nent to remove the entropy of certain state variables (i.e., act
as a stabilizer), while still contributing a net positive entropy
flow to the state vector as a whole.
With the information flow, the balance equation for the
variance Cii (i.e., a diagonal entry of the FDR) can be ex-
pressed as
C′
ii
=
d
dθ [ln (Cii )]= 2⎛ ⎝j
Cii
Tx j →xi + Tη→xi + Tξ→xi
⎞ ⎠.
(9)
This formulation provides a dynamical interpretation of infor-
mation flow: for a linear stochastic equation of the form (1),
the stochastic forcing serves as the source of entropy and the
dissipative dynamics removes the entropy from the system.
As a result, the information flow quantifies the contribution
of each variable to the normalized FDR budget: a positive in-
formation flow indicates that a variable increases the variance
(or uncertainty) of xi, whereas a negative value suggests that
it has a stabilizing effect on xi, reducing the variance. This
interpretation aligns with the original conceptualization of in-
formation flow as the directional transfer of entropy within the
system (see, also, Fig. 1) [2,12]. Moreover, summing Eq. (9)
over i shows that the total information flow i,j Tx j →xi is
associated with the total variance tendency discussed in [36].
The magnitude of an information flow may differ from case
to case. It needs to be normalized, just as covariance does, to
have its importance assessed. With a slight modification from
[39], the normalized information flow is defined as
Nx j →xi
=
Tx j →xi
. (10)
j Tx j →xi + Tη→xi + Tξ→xi
Therefore, it can be interpreted from a dynamical perspective
as the relative contribution of a variable to the FDR budget.
Finally, the information flow is associated with pre-
dictability [2,15,41]. Let ri (τ,θ) be the correlation coefficient
between the target variable xi (t ) and its τ-lead xi (t + τ). A
straightforward computation yields
∂
∂τ
ri (0,θ)= −Tξ→xi
=
Tx j →xi + Tη→xi−
. (11)
2
Cii
j
This expression reveals a key difference in how white and
colored noise influence predictability. White noise, being
temporally uncorrelated and unpredictable, causes a sharper
decline in correlation skill. In contrast, colored noise, due to
its temporal structure, tends to sustain correlation and enhance
short-term predictability. As for internal entropy transfer, a
variable with positive information flow excites the target
1
C′
ii
054101-3
LIEN, ANDO, KIM, AND TOZUKA variable, reducing stability but transferring dynamics-related
information, thus improving short-term prediction. On the
contrary, negative information flow has a stabilizing effect on
the target variable, but simultaneously damps the dynamically
meaningful signal.
These suggest that white noise introduces unstructured ran-
domness and information flow that undermines persistence,
while the other components are associated with meaningful
variability, either enhancing or suppressing it, depending on
the sign of the information flow. This interpretation aligns
with the fact that colored noise contributes nontrivially to
deterministic forecasting [25].
B. Inverse method
The unified LIM-LK framework follows a two-step proce-
dure: It first applies LIM to construct an approximate system
and then computes the LK information flow based on this
system.
Given an n-dimensional cyclostationary input dataset
{x(t )} ⊂ Rn with zero mean and uniform sampling interval
t , the input cyclostationry correlation function K is com-
puted by
K (τ,θ)=
ω(t )=θ x(t + τ)x(t )T
Ns
,
where Ns denotes the number of valid summation terms that
appear in the numerator. As the sampling is divided during
the estimation of K, the resulting correlation function may be
noisy in the phase direction [35,36]. Therefore, phase averag-
ing must be applied whenever necessary. With a slight abuse
of notation, we continue to denote the phase-averaged one as
K.
CS-CW-LIM constructs an approximate system of the form
(1) using K as follows. For a given noise correlation time γ, it
numerically computes the partial right-derivatives Kτ and Kττ ,
and uses them to solve the dynamics A via Eq. (4). The auxil-
iary function B is obtained as the periodic solution of Eq. (2)
determined by γ and A. Then the positive definite stochastic
matrix Q associated with the colored noise is obtained as the
least square solution of
Sym[Kτ (0,θ)]= Sym(AC + QBT ), (12)
determined by all possible θ’s, where C(θ)= K (0,θ) is the
observed covariance. The stochastic matrix D associated with
the white noise is subsequently solved by
C′
= Sym(AC + QBT + D). (13)
To determine the noise correlation time, we extend the γ-
selection algorithm in [34] in a natural way,
γCS-CW
= arg minγ ∥K (γ )− K∥[0,l], (14)
where K (γ ) is the cyclostationary correlation function deter-
mined by γ, and [0,l] represents the minimization interval.
Then, with the approximate system, the estimated infor-
mation flow is simply obtained by using Eqs. (6)–(8). This
implies that though the stochastic forcings are latent, their en-
tropy transfer to the state variables can be effectively inferred
from the input data.
PHYSICAL REVIEW E 112, 054101 (2025)
To determine the confidence interval of the information
flow at a given significance level, we apply a bootstrapping
procedure based on the correlation function. More precisely,
suppose that the input data contains M + 1 complete cycles.
We divide the data into M (overlapping) segments, where the
ith segment spans from ti = i to t f = ti + 1 + t , For each
segment, we compute its correlation function as
Ki (τ,θ)= x(t + τ)x(t )T
,
for t = i,i + t , . . . ,i + 1− t , and τ = 0, t , and 2 t.
We then randomly sample M + 1 such correlation functions
Ki, compute their mean, and use the resulting averaged esti-
mate to infer the information flow. Repeating this procedure
allows us to construct the empirical distribution of the infor-
mation flow and thereby estimate its confidence interval.
C. Relationship with previous methods
CS-CW-LIM is closely related to other existing forms of
LIMs. When the input data are assumed to be stationary—so
that the correlation function is phase independent and the
approximate system is autonomous—the resulting models re-
duce to the classical LIM or the colored LIM, depending on
how the random forcing is represented [34,40].
A key distinction from the classical LIM proposed in [40]
lies in the estimation of system dynamics: while classical
LIM uses the matrix logarithm of the stationary correlation
function (assuming exponential decay), Eq. (4) estimates the
dynamics directly via the derivative, which more effectively
reflects the Jacobian of the underlying system [34].
When the input data are instead assumed to be cyclosta-
tionary, but the stochastic forcing involves only one noise
type (either white or colored), the resulting models correspond
to cyclostationary LIMs, such as l-CS-LIM, e-CS-LIM, or
CS-Colored-LIM [25,35]. Moreover, when the noise corre-
lation time is prescribed [i.e., not determined by Eq. (14)],
CS-CW-LIM becomes directly comparable to CS-Colored-
LIM. Indeed, Eq. (4) depends only on K and γ instead of the
presence of white noise, indicating that the estimated system
dynamics remain invariant to whether or not white noise is
included. The distinction between the two models lies in the
allocation of the residual in the FDR budget: CS-CW-LIM dis-
tributes the residual between white and colored noise, whereas
CS-Colored-LIM attributes it entirely to colored noise.
The unified LIM-LK framework can also be viewed as
an extension of Liang’s method [2]. Specifically, it has been
shown that for an n-dimensional Markov process (i.e., time-
independent and white-noise driven), the information flow
Tx j →xi from one component x j of the state vector to another
xi is given by
1
Ci j
Tx j →xi
=
det C
n
k=1
jk Ck,di·
, (15)
Cii
where jk denotes the cofactor of C, and Ck,di is the covari-
ance between xk and d
dt xi. Then, given an input dataset, the
information flow among state variables can be estimated using
a numerical approximation of Eq. (15) [2]. However, as noted
in [32], the first term on the right-hand side represents the
system dynamics, which can be seen by explicitly expressing
054101-4
LINEAR-INVERSE-MODELING APPROACH TO … PHYSICAL REVIEW E 112, 054101 (2025)
K′(0)C−1. Consequently, Liang’s method is mathematically
equivalent to a special case of the proposed framework under
the assumptions of stationarity and white-noise forcing [i.e.,
the combination of derivative-based stationary White-LIM in
[27] and Eq. (6)].
Meanwhile, the methodology presented in [32] can be
viewed as applying Colored-LIM in [34] and then Eq. (6),
except that the dynamical operator is estimated via a min-
imization technique instead of numerical derivatives. More-
over, a cyclostationary extension of Liang’s method, applied
in [23], can also be incorporated within this unified LIM-LK
approach. It effectively corresponds to applying the e-CS-LIM
formulation first, followed by Eq. (15) to estimate periodic
information flow between state variables [35].
Consequently, by extending existing LIMs, CS-CW-
LIM—when integrated with LK information flow—leads to
a two-step approach for analyzing the periodic characteris-
tics of causal influence within a finite time-series dataset.
This approach is not limited to interactions among observable
state variables, but also captures simultaneous entropy transfer
from both white and colored noise. As such, it offers a com-
prehensive and flexible framework capable of accommodating
the complexity of physical systems, while preserving phys-
ical interpretability and statistical rigor. This is particularly
appropriate for studying processes exhibiting strong periodic
dependence while being influenced by stochastic variability,
such as large-scale ocean-atmosphere coupled modes.
III. A REAL-WORLD APPLICATION
To illustrate the applicability of our proposed method, we
investigate the causal influence between ENSO and the In-
dian Ocean Dipole (IOD)—two major modes of interannual
climate variability. ENSO is a well-known ocean-atmosphere
coupled phenomenon centered in the tropical Pacific, affecting
global weather patterns and driving extreme events such as
droughts and floods [42,43]. It is characterized by anomalous
warming and cooling of sea surface temperatures (SSTs) in
the tropical Pacific, referred to as El Niño and La Niña events,
respectively (collectively termed ENSO events in this study).
Monitoring ENSO typically involves analyzing SST anoma-
lies in regions such as Niño 3 (150◦W-90◦W, 5◦N-5◦S), Niño
3.4 (170◦W-120◦W, 5◦N-5◦S), and Niño 4 (160◦E-150◦W,
5◦N-5◦S).
The IOD, by contrast, is characterized by irregular oscil-
lations in SST and atmospheric circulation over the tropical
Indian Ocean. Its intensity is often measured using the Dipole
Mode Index (DMI), defined as the difference in SST anomaly
between the western (50◦E-70◦E, 10◦S-10◦N) and southeast-
ern (90◦E-110◦E, 10◦S-0◦N) equatorial Indian Ocean [44,45].
The evolution of both ENSO and the IOD is strongly
locked to the annual cycle, driven by the seasonally mod-
ulated strength of ocean-atmosphere coupling and tropical-
subtropical interactions [46–48]. In particular, ENSO typi-
cally peaks at the end of the year, whereas the IOD reaches
its maximum during boreal autumn. These seasonal variations
exert a profound influence on regional and global weather and
climate [49–51].
Despite their prominent roles, the nature of ENSO-
IOD teleconnections remains debated [52–57]. Some studies
suggest that ENSO predominantly drives the Pacific-Indian
interactions, whereas others argue that ENSO may develop
in response to preceding IOD events [58–61]. Additional
research posits that ENSO and the IOD often synchro-
nize due to shared atmospheric and oceanic teleconnections,
while contrasting perspectives emphasize their asymmetric
and potentially independent behavior [2,62–64]. Clarifying
this relationship is essential for improving seasonal forecasts
and mitigating the weather-related impacts on agriculture, wa-
ter resources, and economies [65]. This scientific uncertainty
highlights the need for a rigorous and quantitative causal
framework to assess the direction and strength of their in-
teraction, motivating the application of the unified LIM-LK
framework.
In the context of physical oceanography, oceanic variabil-
ity is often conceptualized as the superposition of multiscale
oceanic and atmospheric processes [28,30]. To implement
CS-CW-LIM and LIM-LK, we construct state vectors us-
ing SST over the Pacific and Indian Oceans. Within this
framework, the deterministic component captures the intrinsic
oceanic dynamics and large-scale remote interactions be-
tween the basins, while the colored noise represents persistent
monthly atmospheric variability, such as the Madden-Julian
Oscillation (MJO) and the westerly wind bursts (WWB), and
remote influences from other climate modes external to the
tropical Indo-Pacific system [26,66–68]. The remaining high-
frequency variability, modeled as memoryless white noise,
corresponds to extremely short-term atmospheric perturba-
tions, possibly on the daily or hourly scales [61,69,70].
More precisely, the state vectors, parametrized by latitude
and longitude, are constructed using DMI and Pacific monthly
SST data over 150◦E-70◦W and 20◦N-20◦S at a 2◦ × 2◦ res-
olution, obtained from NOAA Physical Sciences Laboratory
[71,72]. The data cover the period 1958 to 2010, consistent
with [2]. For preprocessing, the climatological mean over the
entire period is first removed, followed by the application
of a three-month running average to smooth the data before
computing the observed cyclostationary correlation function.
To reduce phase uncertainty associated with limited sampling,
phase averaging is performed using matlab’s built-in lowpass
filter. This similar preprocessing approach follows established
procedures in the literature and is consistent with previous
studies focused on isolating meaningful low-frequency vari-
ability [29,33,35,36]. In addition, the minimization window
length l, used to determine the noise correlation time, is fixed
at six months. The proposed methodology is applied indepen-
dently to each grid point within the Pacific region.
A. Causal influences on Pacific SSTs
Figure 2 presents the seasonal evolution of information
flow across the equatorial Pacific region, based on DMI
and SST data at each grid point. Overall, the Pacific SSTs
exhibit strong self-causality, predominantly acting to stabi-
lize themselves. A notable exception occurs during boreal
autumn (September to November), when the Pacific SSTs
shift from stabilizing to exciting themselves over the Niño
3.4 region, one of the most critical areas for monitoring
ENSO variability due to the strong coupling between oceanic
and atmospheric processes. As the self-stabilizing effect is
054101-5
LIEN, ANDO, KIM, AND TOZUKA PHYSICAL REVIEW E 112, 054101 (2025)
FIG. 2. Spatial-temporal distribution of the estimated LK information flow (nats/month) over the Pacific Ocean across different seasons.
Each row corresponds to a season (MAM, JJA, SON, DJF), while the columns show contributions from (left to right): Pacific SSTs, DMI,
colored noise, and white noise to the Pacific SSTs. The values are averaged over each respective season. The boxes represent the Niño 1+2,
Niño 3, Niño 3.4, and Niño 4 areas.
generally more pronounced than the influence of the Indian-
to-Pacific teleconnection, this observation suggests that the
role of temporal-spatial self-causality may have been less
emphasized in previous applications of the LK information
flow framework [2].
Meanwhile, the information flow from the IOD to the
Pacific, though relatively weaker in magnitude, demonstrates
a clear spatial and temporal structure. Specifically, the IOD
tends to excite the eastern Pacific while stabilizing the cen-
tral tropical Pacific, especially during boreal summer and
autumn. This interaction partially counteracts the inherent
self-causality over the Pacific Ocean. However, the remote
causal influence from the IOD diminishes considerably during
boreal spring and winter, in agreement with the seasonality
of the IOD, which develops in boreal summer and peaks in
autumn [45].
The spatiotemporal pattern of inner- and interbasin causal
interactions may be associated with the development of the
ENSO Modoki and canonical ENSO, which are distinguished
by the location of the extremum SST anomalies in the central
and eastern Pacific, respectively [73–75]. ENSO Modoki gen-
erally originates within the Pacific basin, initiated at the ocean
surface through atmospheric processes such as MJO and the
Asian or Australian monsoons [74]. It then evolves through
intrinsic Pacific dynamics, such as zonal advection feedback,
and is typically less influenced by the IOD [75]. This aligns
with the self-exciting causality of the central Pacific during
the boreal autumn, the period when ENSO typically begins to
intensify. In this context, the stabilizing influence of the IOD
appears to play a minimal role in the development of ENSO
Modoki.
In contrast, canonical ENSO exhibits a stronger depen-
dence on IOD variability, particularly in the context of
extreme or super El Niño events [74]. It has been shown that
the eastern Pacific tends to exhibit an inherent self-limiting
behavior, which suppresses SST anomalies and inhibits ENSO
amplification, especially when background seasonal cooling
prevails. Under such conditions, the IOD can serve as a key
modulator, moderately yet persistently enhancing ENSO de-
velopment when the two phenomena co-occur [76]. This is
consistent with our findings: during the development phase
of an ENSO event, the IOD causally contributes to the am-
plification of Pacific SST anomalies by introducing entropy
into the system during boreal autumn. As the IOD gradually
decays in the boreal winter, the interbasin entropy transfer
correspondingly weakens.
Overall, our findings suggest that the IOD and Pacific SSTs
exhibit a dipole-like causal interaction, wherein the IOD plays
a regulatory role by mitigating excessive excitation or stabi-
lization within the Pacific. This mechanism may contribute to
maintaining climate variability within a stable and balanced
range.
We now examine the role of stochastic forcing—both
memoryless white and persistent colored—in the causal rela-
tionship with Pacific SSTs. Overall, both types of stochastic
forcing show a strong causal relation, acting to excite the
Pacific SSTs across most seasons as expected. Among them,
persistent noise demonstrates a stronger and more consis-
tent effect, largely independent of seasonal variations, and is
primarily concentrated in the equatorial Pacific and adjacent
coastal regions. In contrast, memoryless noise displays a pro-
nounced seasonal dependence: it first emerges in the coastal
Niño region (defined as the Niño 1+2 region, 0◦N-10◦S,
90◦W-80◦W) during boreal spring, intensifies and expands
into the Niño 3 region by summer, and eventually disperses
across the entire equatorial Pacific [77].
Stochastic forcing plays a critical role in shaping climate
variability. In particular, the strong causality from the white
noise to Pacific SSTs over the coastal Niño region indi-
cates that the atmospheric forcing may represent a precursor
054101-6
LINEAR-INVERSE-MODELING APPROACH TO … PHYSICAL REVIEW E 112, 054101 (2025)
FIG. 3. Monthly variation of the estimated information flow (nats/month) to (a)–(c) Pacific SSTs and (d),(e) DMI averaged over the Niño 3,
Niño 3.4, and Niño 4 regions. The curves represent contributions from the target variable itself (blue), the other state variable (i.e., interbasin)
(orange), colored noise (yellow), and white noise (purple).
mechanism that triggers the development of coastal Niño
events by exciting SSTs in the eastern Pacific during boreal
spring [78]. As the season progresses, this causal influence
spreads westward into the broader Niño 3 region, supporting
the transition from coastal ENSO to basin-scale ENSO under
favorable background conditions [79]. This progression may
offer insight into the mechanism by which localized SST
anomalies evolve into large-scale ENSO events.
Figures 3(a)–3(c) illustrate the seasonal evolution of
area-averaged information flow, supporting the observation
described above. Over the Niño 3.4 region, the results show
the following: (i) strong self-causality, which is generally
stabilizing but reverses to an exciting influence during boreal
autumn; (ii) strong, seasonally consistent excitation by persis-
tent forcing; (iii) moderate, seasonally modulated excitation
by memoryless forcing; and (iv) a comparatively weak but
statistically significant causal influence from the IOD to the
Pacific, as confirmed by bootstrapping. This implies a real,
though minor, interbasin causal effect through excitation from
May to August. Over the Niño 3 region, a similar pattern is
observed, although self-causality tends to remain negative and
the IOD influence consistently positive. The seasonally aver-
aged information flow from the IOD is +0.0121 nats/month,
consistent with earlier findings such as those reported by [2].
In contrast, the interbasin information flow over the Niño 4
region is limited, with a seasonally averaged value of +0.0013
nats/month, supporting the previous discussion that the IOD
has minimal influence on ENSO Modoki.
The remainder of this subsection discusses the LK in-
formation flow with a focus on the Niño 3.4 region for
clarity and conciseness. From a dynamical perspective, our
results reveal that the intrinsic dynamics of the Pacific is
the primary driver of the seasonal behavior of the Niño 3.4
index. In late boreal winter and early spring, these internal
dynamics play a stabilizing role by efficiently dissipating en-
tropy introduced by stochastic forcing, thus reducing system
uncertainty. However, during boreal autumn, this stabilizing
effect weakens, where internal dynamics begin to contribute
positively to entropy accumulation, leading to increased un-
certainty. This seasonal modulation of internal dynamics, as
represented within the LIM-LK framework, offers an expla-
nation of why the variance of the Niño 3.4 index, a measure
of uncertainty, tends to be locked in boreal winter, consistent
with the well-known phenomenon of ENSO phase locking
[80].
In contrast, entropy input, arising from both stochastic
forcing and interbasin transfer from the IOD, peaks from May
to July (MJJ). This indicates that during the developing stage
of a potential ENSO event, a substantial amount of entropy is
injected into the Pacific SSTs. In particular, while the influ-
ence of persistent noise can be predicted to some degree, the
inherently unpredictable white noise contributes significantly
to entropy accumulation during MJJ. Such an increase hinders
the short-range forecast skill of ENSO forecasts initialized
over this period, aligning with the well-known challenge re-
ferred to as the spring prediction barrier (SPB) [81–83]. On
the other hand, the presence of colored noise mitigates the
initial drop in correlation skills due to its persistence, thereby
improving short-range prediction skills. It is worth noting
that this short-range influence is different from the long-range
effect of colored noise on prediction skills reported in [25].
Importantly, Figs. 3(a)–3(c) also suggest that SPB can be
partially alleviated by interactions with other climate modes.
In particular, teleconnections from the Indian Ocean statisti-
cally significantly contribute a normalized information flow
ranging from +2.6% to +14.9% from May to August, com-
puted using Eq. (10). Although moderate in magnitude, the
IOD exerts a positive influence on the prediction skill of
ENSO, consistent with findings from [26]. This underscores
the complex nature of ENSO predictability and highlights the
importance of accounting for cross-basin causal interactions
in understanding and improving seasonal climate forecasts.
054101-7
LIEN, ANDO, KIM, AND TOZUKA PHYSICAL REVIEW E 112, 054101 (2025)
FIG. 4. Spatial distribution of the estimated noise correlation
time (months). The boxes represent the Niño 1+2, Niño 3, Niño 3.4,
and Niño 4 areas.
Finally, we emphasize that although entropy transfer or re-
moval can be unfavorable for prediction, it plays a crucial role
as a driver of climate variability.
B. Niño SSTs to DMI
Figures 3(d)–3(f) present the area-averaged information
flow from Pacific SSTs to DMI, based on the Niño regions. In
contrast to the seasonally modulated self-causality observed
in the ENSO system, DMI exhibits consistent self-stabilizing
dynamics throughout the year. Furthermore, the interbasin
causal relationship reveals a statistically significant seasonal
pattern: Pacific SST anomalies tend to excite DMI during
July to September, while exerting a stabilizing influence from
November through the subsequent January. The seasonally
averaged information flow from ENSO to DMI is estimated as
+0.0080,+0.0087, and +0.0074 nats/month from the Niño
3, Niño 3.4, and Niño 4 regions, respectively. These findings
indicate that the Pacific and Indian Oceans exhibit mutual
causality, with temporal asymmetries at the monthly scale, yet
maintain an overall symmetric interaction across the annual
cycle.
C. Spatial distribution of noise correlation time
Finally, Fig. 4 presents the spatial distribution of noise
correlation time. Overall, the noise memory ranges from ap-
proximately 1 to 2 months, suggesting that the persistent
noise influences the Pacific SSTs on monthly to subseasonal
timescales. Regions exhibiting higher noise memory are pri-
marily concentrated over the Niño areas, aligning with where
persistent noise contributes most significantly to the informa-
tion flow into the Pacific. As a result, the primary pathways
through which persistent atmospheric processes such as MJO
affect Pacific variability may be largely through the Niño
regions. This consolidates the importance of accounting for
monthly-scale processes over the Niño regions in inverse cli-
mate modeling.
IV. CONCLUDING REMARKS
This study proposes a unified LIM-LK framework, which
provides a simple yet effective way to estimate the LK
information flow while maintaining the balance between
model complexity and physical interpretability via linear in-
verse modeling. By decomposing complex variability into
deterministic dynamics and stochastic forcing, LIM provides
a compact and analytically tractable representation for a cy-
clostationary process potentially driven by both memoryless
and persistent random forcing. Embedding LK information
flow within this structure enables the identification and inter-
pretation of causal pathways, even from the external noise to
the target state variable, in a physically meaningful manner.
In addition, this unified framework connects causality and
system dynamics, bridging two distinct fields by interpreting
information flow as the individual contribution to the target
variable within the FDR budget. The FDR, in turn, leads to
the equilibrium of entropy transfer into and out of a dynamical
system, offering complementary interpretations of the same
underlying phenomenon.
We applied the LIM-LK framework to study the causal
relationship between ENSO and the IOD. The results show
that the Pacific exhibits strong intrinsic self-causality, primar-
ily acting as a stabilizing mechanism. This stabilizing effect is
significantly stronger than the interbasin causal influence from
the Indian Ocean, which, although weaker, remains statisti-
cally significant and modulates the internal dynamics of the
Pacific Ocean seasonally. Notably, this interbasin interaction
helps regulate Pacific variability by balancing excitation and
stabilization, especially in the Niño 3 and 3.4 regions. In
addition, the region of high causal influence from the persis-
tent noise forcing aligns with these regions, suggesting the
pathway through which monthly-scale atmospheric processes
or other climate modes affect ENSO. In contrast, the transient
noise reveals a hot spot at the coastal Niño region, correspond-
ing to atmospheric perturbation as precursor activity [78].
From a dynamical perspective, the temporal evolution
of area-averaged entropy flow reflects key characteristics of
ENSO phase locking and SPB. Our results indicate that in
the LIM-LK framework, phase locking is primarily governed
by the seasonal cycle of internal Pacific dynamics, acting to
dissipate entropy throughout most of the year. In contrast,
SPB is mainly associated with the influence of unpredictable
white noise, which peaks during the SPB period. Moreover,
interbasin interactions and persistent atmospheric processes
contribute to the accumulation of entropy in the Niño ar-
eas during the developing stage of ENSO. These external
sources of entropy not only facilitate the buildup of Pacific
SST anomalies, but also alleviate the impact of the SPB on
short-range prediction skill.
Importantly, while this study focuses on CS-CW-LIM, the
methodological idea can be naturally extended to other LIM
variants. For instance, applying the derivative-based White-
LIM in [27] and then Eq. (6) is mathematically equivalent
to the original LK formulation proposed by [2]; the formu-
lation used in [23] corresponds to e-CS-LIM in [35], and
the framework proposed by [32] aligns with Colored-LIM in
[34]. These correspondences illustrate the generality of our
approach and offer a unified view of LIM-based causality
diagnostics.
We further clarify our choice of the colored noise η with
diagonal variance used in Eq. (1). Under an orthogonal change
of variables, η= Uη, the component-wise information flows
Tη j →xi similarly defined by Eq. (7) become basis-dependent,
but their summation Tη→xi := j Tη j →xi is basis-invariant.
However, in the inverse formulation, the transformation U
054101-8
LINEAR-INVERSE-MODELING APPROACH TO … cannot be identified from data, causing the identification issue
discussed in the Concluding Remark of [34]. To avoid this am-
biguity, we adopt the normalized colored noise in our inverse
formulation.
We also note that the seasonally averaged information
flow from Niño 3 to DMI differs from that reported by
[2]. This discrepancy arises because the stationary LIM does
not accurately capture the mean state of information flow,
in contrast to previous studies showing that it can approx-
imate the mean state of the dynamical operator within an
acceptable error range [35]. As a heuristic example, con-
sider a two-dimensional linear system of the form (1) where
C12 (θ)= A12 (θ)= sin θ and γ= Q= 0 (i.e., a white-noise
driven system). In this case, with sufficiently long input data,
applying either l-CS-LIM or e-CS-LIM in [35] yields positive
information flow almost everywhere, whereas its stationary
counterpart results in statistically vanishing information flow.
This highlights the importance of correctly accounting for
periodicity when analyzing cyclostationary systems, as also
emphasized in [36].
Despite its strengths, the proposed framework inherits
several limitations from the previous LIMs. Specifically, its
performance depends on the characteristics of the dataset, in-
cluding the sampling length, frequency, and uncertainty [34].
In addition, its linear formulation implicitly approximates the
probability distribution of the input dataset with a Gaussian
distribution, and hence does not capture non-Gaussian char-
acteristics of the system, such as skewness or higher-order
moments of the underlying data [27,84]. Moreover, time series
of considerable length often exhibit variability across multiple
timescales, requiring not only periodic linear dynamics but
also explicit consideration of long-term forcing, particularly
in the context of paleoclimate studies [85–87]. Consequently,
the effectiveness of the method depends on how well the target
system can be approximated by a linear model with additive
noise, and future extensions to account for more complex
features remain an important direction.
Overall, the unified LIM-LK framework offers a powerful
tool for diagnosing entropy transfer in the ocean-atmosphere
coupled system and provides insight into interbasin and in-
trabasin causal structures. In future work, we plan to extend
this approach to further investigate the relationship between
coastal Niño activity and basin-scale Pacific variability.
ACKNOWLEDGMENTS
J.L. and H.A. are supported by the Council for Sci-
ence, Technology and Innovation (CSTI), Cross-ministerial
Strategic Innovation Promotion Program (SIP), the 3rd pe-
riod of SIP “Smart Energy Management System” (Grant No.
JPJ012207, funding agency: JST). Y.-Y.K. is supported by
the Institute for Basic Science (IBS) of the Republic of Ko-
rea under Grant No. IBS-R028-D1. T.T. is supported by a
Grant-in-Aid for Challenging Research (Exploratory) (JSPS
KAKENHI Grant No. JP22K18727).
DATA AVAILABILITY
The data that support the findings of this article are openly
available [71,72,88]; embargo periods may apply.
PHYSICAL REVIEW E 112, 054101 (2025)
APPENDIX A: PROOF OF KEY EQUATIONS
This appendix outlines the derivations of the key equa-
tions presented in the manuscript.
A linear stochastic equation of the form (1) can be written
in a white-noise-driven augmented form as
d
dt
x
η
=
A √2Q
0−
1
γ
I
x
η
+
√2D 0
0 1
γ
I
ξx
ξη
, (A1)
where ξx and ξη denote independent normalized white-noise
forcing acting on x and η, respectively. By following the
derivation presented in [25], we have Eqs. (2)–(5). Also, ap-
plying the formula of LK information flow for the white-noise
case immediately to Eq. (A1) yields Eqs. (6)–(8) and (10)
[2,32,38,39].
To see Eq. (11), we start by expressing the correlation
coefficient ri (τ,θ) for xi as
[K(τ,θ) G(τ,θ)T ]ii
ri (τ,θ)=
√C(τ + θ)ii [G(τ,θ) C(θ) G(τ,θ)T ]ii
,
where G satisfies Gτ (0,θ)= A(θ) and G(0,θ)= I [25]. A
straightforward computation leads to Eq. (11).
APPENDIX B: NUMERICAL DETAILS OF CS-CW-LIM
In this appendix, the details of the numerical implemen-
tation for CS-CW-LIM are presented. The procedure follows
the algorithm described in the supplementary text of [25], with
several modifications.
Given a noise correlation time γ and the input cyclostation-
ary correlation function Kobs, CS-CW-LIM computes Kτ (0,θ)
and Kττ (0,θ), the first- and second-order partial right-
derivatives, using the first-order forward finite-difference
schemes. The periodic dynamical matrix A is obtained by
solving the discretized form of Eq. (4), where the derivative
of A is approximated by the second-order centered difference.
To ensure stability of the approximate system, the Floquet
exponents associated with A are required to have negative
real parts; otherwise, the estimate is regarded as invalid and
returned as NaN. With the valid estimated A, the periodic
auxiliary function B is computed by numerically integrating
Eq. (2) over a sufficiently long time.
The stochastic matrix Q associated with the colored noise
is determined by minimizing the residual of Eq. (12) over the
space of symmetric matrices,
∥Sym[Kτ (0,θ)− A(θ)C(θ)− Q(θ)B(θ)T ]∥2
,
θ
where C(θ)= Kobs (0,θ) denotes the observed covariance. If
the resulting Q has negative eigenvalues, an eigenvalue adjust-
ment procedure is applied, in which negative eigenvalues are
set to zero and the positive ones are rescaled [40].
The stochastic matrix D associated with the white noise
is then obtained from the discretization of Eq. (13), where the
derivative of C is approximated using the second-order central
finite-difference scheme. If D(θ) exhibits negative eigenval-
ues at some phase θ, the same adjustment is applied.
054101-9
LIEN, ANDO, KIM, AND TOZUKA The approximate system determined by A, Q, D, and γ may
not accurately reproduce C due to eigenvalue adjustments. To
address this, the stochastic matrix associated with the colored
noise is rescaled by a factor α that minimizes
∥C− C(A,αQ,D,γ )∥,
where C(A,αQ,D,γ ) denotes the periodic covariance matrix
generated by the corresponding approximate system. The up-
dated stochastic matrix, still denoted by Q with an abuse of
notation, is set as Q ← αQ.
Rather than using standard numerical optimization tech-
niques such as gradient descent, the search space of α is
restricted to {0.8,0.9,1.0,1.1,1.2}. A brute-force search with
[1] R. Guo, L. Cheng, J. Li, P. R. Hahn, and H. Liu, A survey
of learning causality with data: Problems and methods, ACM
Comput. Surv. 53, 1 (2020).
[2] X. S. Liang, Unraveling the cause-effect relation between time
series, Phys. Rev. E 90, 052150 (2014).
[3] A. Alper and O. Oguz, The role of renewable energy consump-
tion in economic growth: Evidence from asymmetric causality,
Renew. Sustain. Energy Rev. 60, 953 (2016).
[4] A. Shojaie and E. B. Fox, Granger causality: A review and
recent advances, Annu. Rev. Stat. Applic. 9, 289 (2022).
[5] K. Yu, X. Guo, L. Liu, J. Li, H. Wang, Z. Ling, and X. Wu,
Causality-based feature selection: Methods and evaluations,
ACM Comput. Surv. 53, 1 (2020).
[6] S. Shimizu, P. O. Hoyer, A. Hyvärinen, and A. Kerminen,
A linear non-Gaussian acyclic model for causal discovery, J.
Mach. Learn. Res. 7, 2003 (2006).
[7] A. Hyvärinen, K. Zhang, S. Shimizu, and P. O. Hoyer, Es-
timation of a structural vector autoregression model using
non-Gaussianity, J. Mach. Learn. Res. 11, 1709 (2010).
[8] H. Majdi, M. Azarnoosh, M. Ghoshuni, and V. R. Sabzevari,
Direct lingam and visibility graphs for analyzing brain connec-
tivity in BCI, Med. Biolog. Eng. Comput. 62, 2117 (2024).
[9] S. Shimizu, T. Inazumi, Y. Sogawa, A. Hyvärinen, Y. Kawahara,
T. Washio, P. O. Hoyer, and K. A. Bollen, DirectLiNGAM:
A direct method for learning a linear non-Gaussian structural
equation model, J. Mach. Learn. Res. 12, 1225 (2011).
[10] H. Suzuki, LayeredLiNGAM: A practical and fast method for
learning a linear non-Gaussian structural equation model, in
Machine Learning and Knowledge Discovery in Databases.
Research Track: European Conference, ECML PKDD 2024,
Proceedings, Part VI (Springer-Verlag, Berlin, 2024), pp. 217–
233.
[11] L.-Y. Leung and G. R. North, Information theory and climate
prediction, J. Clim. 3, 5 (1990).
[12] X. S. Liang and R. Kleeman, Information transfer between
dynamical system components, Phys. Rev. Lett. 95, 244101
(2005).
[13] A. J. Majda and J. Harlim, Information flow between subspaces
of complex dynamical systems, Proc. Natl. Acad. Sci. USA 104,
9558 (2007).
[14] G. Bianconi, Statistical mechanics of multiplex networks: En-
tropy and overlap, Phys. Rev. E 87, 062806 (2013).
PHYSICAL REVIEW E 112, 054101 (2025)
parallel computation is performed to obtain a computationally
efficient suboptimal estimate.
Finally, the well posedness of the γ-selection algorithm
(14) is addressed. In the case of white noise (i.e., γ=
Q= 0), the periodic matrix A estimated by Eq. (4) yields
stable dynamics by Schur complement provided the sam-
pling interval t is sufficiently small. When the approximate
system is assumed autonomous, the estimated parameters
depend continuously for γ 0 near 0 [27], and this conti-
nuity extends to the periodic setting. Consequently, although
the stability of A may fail for some large γ, it is guaran-
teed for sufficiently small γ. This ensures a well-defined
γCS-CW
.
[15] T. DelSole, Predictability and information theory. Part I: Mea-
sures of predictability, J. Atmos. Sci. 61, 2425 (2004).
[16] T. DelSole, Predictability and information theory. Part II: Im-
perfect forecasts, J. Atmos. Sci. 62, 3368 (2005).
[17] R. Kleeman and A. Majda, Predictability in a model of geo-
physical turbulence, J. Atmos. Sci. 62, 2864 (2005).
[18] R. Kleeman, Information flow in ensemble weather predictions,
J. Atmos. Sci. 64, 1005 (2007).
[19] P. Talkner and P. Hänggi, Colloquium: Statistical mechanics
and thermodynamics at strong coupling: Quantum and classical,
Rev. Mod. Phys. 92, 041002 (2020).
[20] T. Schreiber, Measuring information transfer, Phys. Rev. Lett.
85, 461 (2000).
[21] X. S. Liang, Normalized multivariate time series causality anal-
ysis and causal graph reconstruction, Entropy 23, 679 (2021).
[22] D. F. T. Hagan, G. Wang, X. S. Liang, and H. A. J. Dolman, A
time-varying causality formalism based on the Liang-Kleeman
information flow for analyzing directed interactions in nonsta-
tionary climate systems, J. Clim. 32, 7521 (2019).
[23] Y. Takaya, K. K. Komatsu, N. G. Ganeshi, T. Toyoda, and
H. Hasumi, A sub-monthly timescale causality between snow
cover and surface air temperature in the northern hemisphere
inferred by Liang-Kleeman information flow analysis, Climate
Dynam. 62, 2735 (2024).
[24] Z. Ye and T. Tozuka, Causal relationship between sea surface
temperature and precipitation revealed by information flow,
Front. Climate 4, 1024384 (2022).
[25] J. Lien, H. Ando, I. Richter, and S. Kido, Noise persistence in a
cyclostationary linear inverse model framework and its impact
on ENSO evolution and prediction skills (unpublished).
[26] S. Zhao, F.-F. Jin, M. F. Stuecker, P. R. Thompson, J.-S. Kug,
M. J. McPhaden, M. A. Cane, A. T. Wittenberg, and W. Cai,
Explainable El Niño predictability from climate mode interac-
tions, Nature (London) 630, 891 (2024).
[27] J. Lien and H. Ando, Nonlinear extensions of linear inverse
models under memoryless or persistent random forcing, Phys.
Rev. Res. 7, L032038 (2025).
[28] J. Lou, T. J. O’Kane, and N. J. Holbrook, A linear inverse model
of tropical and South Pacific seasonal predictability, J. Clim. 33,
4537 (2020).
[29] M. Newman, S.-I. Shin, and M. A. Alexander, Natural variation
in ENSO flavors, Geophys. Res. Lett. 38, L14705 (2011).
054101-10
LINEAR-INVERSE-MODELING APPROACH TO … [30] C. Penland and T. Magorian, Prediction of Niño 3 Sea surface
temperatures using linear inverse modeling, J. Clim. 6, 1067
(1993).
[31] W. A. Perkins and G. Hakim, Linear inverse modeling for
coupled atmosphere-ocean ensemble climate prediction, J. Adv.
Model. Earth Syst. 12, e2019MS001778 (2020).
[32] J. Lien, A Liang-Kleeman causality analysis based on linear
inverse modeling, arXiv:2409.06797.
[33] S. Kido, I. Richter, T. Tozuka, and P. Chang, Understanding
the interplay between ENSO and related tropical SST vari-
ability using linear inverse models, Climate Dynam. 61, 1029
(2023).
[34] J. Lien, Y.-N. Kuo, H. Ando, and S. Kido, Colored linear inverse
model: A data-driven method for studying dynamical systems
with temporally correlated stochasticity, Phys. Rev. Res. 7,
023042 (2025).
[35] J. Lien, Y.-N. Kuo, H. Ando, and S. Kido, On cyclostationary
linear inverse models: A mathematical insight and implication,
Front. Complex Syst. 3, 1563687 (2025).
[36] S.-I. Shin, P. D. Sardeshmukh, M. Newman, C. Penland, and
M. A. Alexander, Impact of annual cycle on ENSO variability
and predictability, J. Clim. 34, 171 (2021).
[37] G. Gradziuk, G. Torregrosa, and C. P. Broedersz, Irreversibility
in linear systems with colored noise, Phys. Rev. E 105, 024118
(2022).
[38] X. S. Liang, Information flow within stochastic dynamical sys-
tems, Phys. Rev. E 78, 031113 (2008).
[39] X. S. Liang, Normalizing the causality between time series,
Phys. Rev. E 92, 022126 (2015).
[40] C. Penland and L. Matrosova, A balance condition for stochas-
tic numerical models with application to the El Niño-southern
oscillation, J. Clim. 7, 1352 (1994).
[41] T. DelSole and M. K. Tippett, Predictability: Recent insights
from information theory, Rev. Geophys. 45, 2006RG000202
(2007).
[42] W. Cai, A. Santoso, G. Wang, S.-W. Yeh, S.-I. An, K. M. Cobb,
M. Collins, E. Guilyardi, F.-F. Jin, J.-S. Kug, M. Lengaigne,
M. J. McPhaden, K. Takahashi, A. Timmermann, G. Vecchi, M.
Watanabe, and L. Wu, ENSO and greenhouse warming, Nat.
Climate Change 5, 849 (2015).
[43] P. J. Ward, B. Jongman, M. Kummu, M. D. Dettinger, F. C.
Sperna Weiland, and H. C. Winsemius, Strong influence of El
Niño southern oscillation on flood risk around the world, Proc.
Natl. Acad. Sci. USA 111, 15659 (2014).
[44] D. MacLeod, E. W. Kolstad, K. Michaelides, and M. B.
Singer, Sensitivity of rainfall extremes to unprecedented Indian
Ocean dipole events, Geophys. Res. Lett. 51, e2023GL105258
(2024).
[45] N. H. Saji, B. N. Goswami, P. N. Vinayachandran, and T.
Yamagata, A dipole mode in the tropical Indian Ocean, Nature
(London) 401, 360 (1999).
[46] E. Galanti and E. Tziperman, ENSO’s phase locking to the
seasonal cycle in the fast-SST, fast-wave, and mixed-mode
regimes, J. Atmos. Sci. 57, 2936 (2000).
[47] K.-Y. Kim and C. Chung, On the evolution of the annual cycle
in the tropical pacific, J. Clim. 14, 991 (2001).
[48] E. Tziperman, M. A. Cane, S. E. Zebiak, Y. Xue, and B.
Blumenthal, Locking of El Niño’s peak time to the end of the
calendar year in the delayed oscillator picture of ENSO, J. Clim.
11, 2191 (1998).
PHYSICAL REVIEW E 112, 054101 (2025)
[49] K. Ashok, Z. Guan, and T. Yamagata, Influence of the Indian
Ocean dipole on the Australian winter rainfall, Geophys. Res.
Lett. 30, 2003GL017926 (2003).
[50] C.-H. Park and S.-W. Son, Subseasonal variability of ENSO–
East Asia teleconnections driven by tropical convection over the
Indian Ocean and maritime continent, Geophys. Res. Lett. 51,
e2023GL108062 (2024).
[51] J. Yan, W. Zhang, S. Hu, and F. Jiang, Different ENSO impacts
on eastern china precipitation patterns in early and late win-
ter associated with seasonally-varying Kuroshio anticyclonic
anomalies, Adv. Atmos. Sci. 41, 1691 (2024).
[52] W. Cai, P. Van Rensch, T. Cowan, and H. H. Hendon, Telecon-
nection pathways of ENSO and the IOD and the mechanisms
for impacts on Australian rainfall, J. Clim. 24, 3910 (2011).
[53] T. Doi, S. K. Behera, and T. Yamagata, Wintertime impacts
of the 2019 super IOD on East Asia, Geophys. Res. Lett. 47,
e2020GL089456 (2020).
[54] P. H. Hrudya, H. Varikoden, and R. Vishnu, A review on the
Indian Summer monsoon rainfall, variability and its association
with ENSO and IOD, Meteorol. Atmosph. Phys. 133, 1 (2021).
[55] T.-H. Huang, C.-T. A. Chen, W.-Z. Zhang, and X.-F. Zhuang,
Varying intensity of Kuroshio intrusion into Southeast Tai-
wan Strait during ENSO events, Continent. Shelf Res. 103, 79
(2015).
[56] A. Kurniadi, E. Weller, S.-K. Min, and M.-G. Seong, Inde-
pendent ENSO and IOD impacts on rainfall extremes over
Indonesia, Intl. J. Climatol. 41, 3640 (2021).
[57] D. Nguyen-Le, T. Ngo-Duc, and J. Matsumoto, The telecon-
nection of the two types of ENSO and Indian Ocean dipole
on Southeast Asian autumn rainfall anomalies, Climate Dynam.
62, 1 (2024).
[58] H. Annamalai, S. P. Xie, J. P. McCreary, and R. Murtugudde,
Impact of Indian Ocean sea surface temperature on developing
El Niño, J. Clim. 18, 302 (2005).
[59] F. Jiang, W. Zhang, F.-F. Jin, M. F. Stuecker, and R. Allan, El
Niño pacing orchestrates inter-basin Pacific-Indian Ocean inter-
annual connections, Geophys. Res. Lett. 48, e2021GL095242
(2021).
[60] T. Izumo, J. Vialard, M. Lengaigne, C. de Boyer Montegut,
S. K. Behera, J.-J. Luo, S. Cravatte, S. Masson, and T.
Yamagata, Influence of the state of the Indian Ocean dipole on
the following year’s El Niño, Nat. Geosci. 3, 168 (2010).
[61] M. F. Stuecker, A. Timmermann, F.-F. Jin, Y. Chikamoto, W.
Zhang, A. T. Wittenberg, E. Widiasih, and S. Zhao, Revisiting
ENSO/Indian Ocean dipole phase relationships, Geophys. Res.
Lett. 44, 2481 (2017).
[62] S. K. Behera, J. J. Luo, S. Masson, S. A. Rao, H. Sakuma, and
T. Yamagata, A CGCM study on the interaction between IOD
and ENSO, J. Clim. 19, 1688 (2006).
[63] W. Cai, P. van Rensch, T. Cowan, and H. H. Hendon, An
asymmetry in the IOD and ENSO teleconnection pathway and
its impact on Australian climate, J. Clim. 25, 6318 (2012).
[64] T. Yamagata, S. K. Behera, J.-J. Luo, S. Masson, M. R. Jury, and
S. A. Rao, Coupled ocean-atmosphere variability in the tropical
Indian Ocean, Earth’s Climate (American Geophysical Union,
2004), pp. 189–211.
[65] P. J. Reddy, S. E. Perkins-Kirkpatrick, N. N. Ridder, and J. J.
Sharples, Combined role of ENSO and IOD on compound
drought and heatwaves in Australia using two CMIP6 large
ensembles, Weath. Climate Extrem. 37, 100469 (2022).
054101-11
LIEN, ANDO, KIM, AND TOZUKA [66] A. M. Jenney, D. A. Randall, and E. A. Barnes, Drivers
of uncertainty in future projections of Madden–Julian os-
cillation teleconnections, Weath. Climate Dynam. 2, 653
(2021).
[67] R. A. Madden and P. R. Julian, Observations of the 40–50-day
tropical oscillation—A review, Mon. Weather Rev. 122, 814
(1994).
[68] L. Yu, R. A. Weller, and W. T. Liu, Case analysis of a role of
ENSO in regulating the generation of westerly wind bursts in
the Western Equatorial Pacific, J. Geophys. Res.: Oceans 108,
3128 (2003).
[69] J. R. Albers and M. Newman, A priori identification of skill-
ful extratropical subseasonal forecasts, Geophys. Res. Lett. 46,
12527 (2019).
[70] M. Newman, M. A. Alexander, and J. D. Scott, An empirical
model of tropical ocean dynamics, Climate Dynam. 37, 1823
(2011).
[71] B. Huang, P. W. Thorne, V. F. Banzon, T. Boyer, G. Chepurin,
J. H. Lawrimore, M. J. Menne, T. M. Smith, R. S. Vose,
and H.-M. Zhang, NOAA Extended Reconstructed Sea Surface
Temperature (ERSST), ver. 5 (NOAA National Centers for En-
vironmental Information, 2017), sst.mnmean.nc.
[72] NOAA Physical Sciences Laboratory, Dipole Mode Index
(DMI) Monthly Time-series, NOAA PSL, 325 Broadway,
Boulder, CO, USA (2024), https://psl.noaa.gov/data/timeseries/
month/DS/DMI/.
[73] K. Ashok and T. Yamagata, The El Niño with a difference,
Nature (London) 461, 481 (2009).
[74] H.-Y. Kao and J.-Y. Yu, Contrasting Eastern-Pacific and
Central-Pacific types of ENSO, J. Clim. 22, 615 (2009).
[75] S.-W. Yeh, J.-S. Kug, and S.-I. An, Recent progress on two
types of El Niño: Observations, dynamics, and future changes,
Asia-Pacific J. Atmosph. Sci. 50, 69 (2014).
[76] S. N. Hameed, D. Jin, and V. Thilakan, A model for super El
Niños, Nat. Commun. 9, 2528 (2018).
[77] J. Song, P. J. Klotzbach, and Y. Duan, Statistical linkage be-
tween coastal El Niño–southern oscillation and tropical cyclone
PHYSICAL REVIEW E 112, 054101 (2025)
formation over the Western North Pacific, Atmosph. Sci. Lett.
23, e1071 (2022).
[78] Q. Peng, S.-P. Xie, G. A. Passalacqua, A. Miyamoto, and C.
Deser, The 2023 extreme coastal El Niño: Atmospheric and air-
sea coupling mechanisms, Sci. Adv. 10, eadk8646 (2024).
[79] D. Rudloff and J. F. Lübbecke, What controls the evolution
of pacific coastal Niño events in the CESM large ensemble?
Geophys. Res. Lett. 52, e2024GL113706 (2025).
[80] F.-F. Jin, J. Neelin, and M. Ghil, El Niño/southern oscillation
and the annual cycle: Subharmonic frequency-locking and ape-
riodicity, Physica D 98, 442 (1996), nonlinear Phenomena in
Ocean Dynamics.
[81] J.-J. Luo, S. Masson, S. Behera, S. Shingu, and T. Yamagata,
Seasonal climate predictability in a coupled OAGCM using a
different approach for ensemble forecasts, J. Clim. 18, 4474
(2005).
[82] M. Newman and P. D. Sardeshmukh, Are we near the
predictability limit of tropical Indo-Pacific sea surface temper-
atures?, Geophys. Res. Lett. 44, 8520 (2017).
[83] C. Torrence and P. J. Webster, The annual cycle of persistence
in the El Niño/southern oscillation, Quarter. J. R. Meteorolog.
Soc. 124, 1985 (1998).
[84] C. Martinez-Villalobos, B. Dewitte, R. D. Garreaud, and L.
Loyola, Extreme coastal El Niño events are tightly linked to
the development of the Pacific meridional modes, npj Climate
Atmosph. Sci. 7, 123 (2024).
[85] M. Baldovin, F. Cecconi, A. Provenzale, and A. Vulpiani, Ex-
tracting causation from millennial-scale climate fluctuations in
the last 800 kyr, Sci. Rep. 12, 15320 (2022).
[86] N. D. B. Keyes, L. T. Giorgini, and J. S. Wettlaufer, Stochas-
tic paleoclimatology: Modeling the EPICA ice core climate
records, Chaos: Interdisc. J. Nonlin. Sci. 33, 093132 (2023).
[87] W. Moon and J. S. Wettlaufer, Coupling functions in climate,
Philos. Trans. R. Soc. A 377, 20190006 (2019).
[88] N. H. Saji and T. J. C. R. Yamagata, Possible impacts of Indian
Ocean dipole mode events on global climate, Climate Res. 25,
151 (2003).
054101-12