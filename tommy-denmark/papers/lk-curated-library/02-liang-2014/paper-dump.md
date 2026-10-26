# Full-text extraction

- Title: Unraveling the Cause-Effect Relation between Time Series
- Year: 2014
- DOI: https://doi.org/10.1103/PhysRevE.90.052150
- PDF source: https://arxiv.org/pdf/1403.6496
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                                                     Causality between time series∗
                                                                                X. San Liang†‡
                                                            Nanjing Institute of Meteorology, Nanjing 210044, and
                                                                     China Institute for Advanced Study,
                                                     Central University of Finance and Economics, Beijing 100081, China
                                                                                        Abstract
                                             Given two time series, can one tell, in a rigorous and quantitative way, the cause and effect
arXiv:1403.6496v1 [stat.ME] 17 Mar 2014




                                          between them? Based on a recently rigorized physical notion namely information flow, we arrive at
                                          a concise formula and give this challenging question, which is of wide concern in different disciplines,
                                          a positive answer. Here causality is measured by the time rate of change of information flowing
                                          from one series, say, X2 , to another, X1 . The measure is asymmetric between the two parties and,
                                          particularly, if the process underlying X1 does not depend on X2 , then the resulting causality from
                                          X2 to X1 vanishes. The formula is tight in form, involving only the commonly used statistics,
                                          sample covariances. It has been validated with touchstone series purportedly generated with one-
                                          way causality. It has also been applied to the investigation of real world problems; an example
                                          presented here is the cause-effect relation between two climate modes, El Niño and Indian Ocean
                                          Dipole, which have been linked to the hazards in far flung regions of the globe, with important
                                          results that would otherwise be difficult, if not impossible, to obtain.

                                          PACS numbers:
                                          Keywords: Causality; Time series analysis; Liang-Kleeman information flow; Maximum likelihood estima-
                                          tion; El Niño; Indian Ocean Dipole




                                          ∗
                                             This material was presented at the 18th Conference on Atmospheric and Oceanic Fluid Dynamics, 13-
                                             17 June 2011, Spokane, WA, under the title Information Flow and Causality within Atmosphere-Ocean
                                             Systems. PPT slides are available from the online conference archives.
                                           †
                                             URL: http://people.deas.harvard.edu/∼san/
                                          ‡
                                            Electronic address: sanliang@courant.nyu.edu

                                                                                            1
I.   INTRODUCTION

   Causality identification between dynamical events is a subject of great interest in different
disciplines. Examples are seen everywhere in neuroscience[1][2][3][4], biology[5][6][7], social
and computer network dynamics[8][9], financial economics[10][11], statistical physics[12], to
name a few. Toward the end of this study, we will see a climate science problem that has
been linked to the severe weather and natural disasters on a global scale.
   Given that, more often than not, what is known about the two events in question are in
the form of time series, causality analysis between time series is therefore of particular im-
portance. Presently a common practice in applied sciences, e.g., climate science, is through
computing time-lagged correlation. However, it is well known that correlation does not
carry the needed directedness or asymmetry and hence does not necessarily imply causality.
Besides, it is easy to argue that, for recurrent processes, there is actually no way to distin-
guish a lag from an advance, unless one has enough a priori knowledge of the processes of
concern. This is particularly a problem when the processes are nonsequential (e.g., those in
the nonsequential stochastic control systems). Another common practice is through Granger
causality test, which is a statistical test of the usefulness of one time series in forecasting
another. This kind of test, as the name implies, provides only a yes/no judgment, lacking
the quantitative information that may be required in many circumstances.
   On the other hand, information flow, or information transfer as it may be referred to in
the literature, provides such a quantitative measure; the amount of information exchange
between two events offers not only the direction but also the magnitude of the cause-effect
relation. Due to its importance, the past decades have seen a surge of interest in formulating
this notion. Formalisms have been established empirically or half-empirically, and have been
used for different researches, among which is transfer entropy[13]. Realizing that information
flow is a real physical notion, and that a real physical notion should be rigorously, rather
than empirically, built on a solid foundation so as to be universally applicable for problems
in different disciplines, Liang and Kleeman[14] take the initiative to establish, followed by
a series of researches afterwards, a rigorous formalism for the information flow within given
dynamical systems, both deterministic and stochastic systems (see [15] for a review). The
problem now is whether and how the same notion can be translated to cases with no dynamics
but time series previously given; that way, the quantitative causal relation between the
series will be obtained. In some sense this is an inverse problem, and could be challenging
since no a priori knowledge of the dynamics is available. In the following we first briefly
introduce the Liang-Kleeman information flow within a two-dimensional system (section II).
The major derivation is presented in section III, where a concise formula for causality analysis
is obtained. This formula is validated with touchstone time series purportedly generated
with only one-way causality (section IV); it is then applied to the study of the causal relation
between El Niño and Indian Ocean Dipole (IOD), the two major modes of climate variation,
with important results which have been evidenced for years but missed in previous analyses
with existing tools (section V).




                                              2
II.    LIANG-KLEEMAN INFORMATION FLOW

   Let us begin with a brief introduction of the Liang-Kleeman information flow. Consider
a d-dimensional stochastic system

                               dX = F(X; θ)dt + B(X; θ)dW                                     (1)

where F is the vector of drift coefficients, B = (bij ) a matrix of diffusion coefficients (or
volatility in finance), and W a vector of standard Wiener process (Ẇ is the so-called white
noise). The rate of information flowing from a component, say, X2 to another, say, X1 ,
is the change rate of the marginal entropy of X1 , minus the same change rate but with
the effect from X2 instantaneously excluded from the system. These rates of information
flow/transfer have been obtained analytically in a closed form for any given dynamical
systems[16]; particularly, for a system of dimensionality 2, which we will be considering in
this study, the flow rate from X2 to X1 is

                                                     1 ∂ 2 (b211 + b212 )ρ1
                                                                         
                                 1 ∂(F1 ρ1 )    1
                   T2→1 = −E                   + E                            ,            (2)
                                 ρ1 ∂x1         2    ρ1         ∂x21

where ρ1 is the marginal probability density of X1 , and E the mathematical expectation.
T2→1 may be either zero or nonzero. A nonzero T2→1 means that X2 is causal to X1 : a
positive value means that X2 makes X1 more uncertain, and vice versa. This measure
of information flow possesses an important property, namely the property of flow/transfer
asymmetry: One-way information flow implies nothing about the transfer in the opposition
direction. A very particular case is: when the evolution of X1 does not depend on X2 ,
T2→1 = 0 (see [15] for proofs in different situations). Considering its criticality, this property
makes a touchstone for the testing of causality analysis tools.


III.   CAUSALITY ANALYSIS

    Shown above are some of the theoretical results of the Liang-Kleeman information flow for
2D systems. These results are rigorous, but the formalism is not about causality analysis,
as the causal relation is prescribed in the given system. We need to develop an analysis
without a priori knowledge of the dynamics; the only given conditions are the two time
series. To some extent this is like an inverse problem. Generally it could be very challenging,
considering the touchstone property, among others, to be verified.
    Since the dynamics is unknown, we need to choose a model first. As always, a linear model
is the natural choice. In Eq. (1), assume F = f + AX, with f = (f1 , f2 )T , A = (aij ), and
B = (bij ) being constant vector/matrices. In the equation, suppose that initially (X1 , X2 )
has a bivariate normal distribution. As the system is linear, then the density is always
normal[19]. Denote the mean by µ = (µ1 , µ2)T , and the covariance matrix by Σ = (σij ).
They evolve following the differential equations
                                   dµ
                                      = f + Aµ,                                               (3)
                                   dt
                                   dΣ
                                      = AΣ + ΣAT + BBT .                                      (4)
                                   dt


                                               3
The information flows between X1 and X2 are now easy to evaluate. Consider T2→1 first.
When (bij ) are constant, the last term of (2) vanishes, thanks to a nice property proved in
[16]. Substitution of

                                     F1 = f1 + a11 X1 + a12 X2                               (5)
                                                       (x −µ )2
                                                1     − 1 21
                                     ρ1 = √         e     2σ
                                                             1                               (6)
                                               2πσ1
into (2) for F1 and ρ1 yields, after some algebraic manipulations,
                                                     σ12
                                          T2→1 =         a12 ,                               (7)
                                                     σ11
where σij is obtained by solving (4). (Note that extra terms will be involved if B depends
on X.) Likewise,
                                             σ12
                                          T1→2 = a21 .                             (8)
                                             σ22
                                                                    
                                                   −1 0.5        0.1 0
   For an example, consider the case f = 0, A =            ,B=           , which gives
                                                   0 −1          0 0.1
a 2D stochastic differential equation (SDE):

                               dX1 = (−X1 + 0.5X2 )dt + 0.1dW1 ,                             (9)
                               dX2 = −X2 dt + 0.1dW2 .                                      (10)

Clearly, X2 drives X1 , but not vice versa. The computed rates of information flow are shown
in Fig. 1. As expected, T1→2 ≡ 0, since the evolution of X2 does not depend on X1 . That is
to say, to X2 , X1 is not causal. On the other hand, X2 drives X1 and hence is causal to X1 ;
correspondingly T2→1 6= 0. In this example, T2→1 approaches a constant 0.1111 no matter
how the system is initialized, though the result may be different during the spin-up period.
This kind of example is very typical in causality analysis: One component causes another,
but the latter has no feedback to the former. Later we will use it to test our causality
analysis.
   Our strategy to approach the problem is first to estimate the linear model, i.e., to estimate
the parameters (f, A, B), which we will be symbolically writing as θ, with the time    series,
                                                                                              
                                                                                         b1 0
and then compute the information flow. To further simplify the problem, let B =                 ,
                                                                                         0 b2
and assume that the time series are equal-distanced.
   We use maximum likelihood estimation (mle) to fulfill the purpose. Consider an interval
[n∆t, (n + 1)∆t], ∆t being the time stepsize. If the transition probability density function
ρ(Xn+1 |Xn ; θ) can be obtained, since {Xn } is a Markov process, the likelihood

                      LN (θ) = ρ(X1 ) · ρ(X2 |X1 ; θ)...ρ(XN |XN −1 ; θ)                    (11)

is then given (N the sample size), or, alternatively, the log likelihood
                                   N
                                   X
                        ℓN (θ) =         log ρ(Xn+1 |Xn ; θ) + log ρ(X1 )                   (12)
                                   n=1


                                                 4
                                     Information flow between X1 and X2
                         0.2


                        0.15
                                                  T2→1 = 0.11

                         0.1


                        0.05
                                                         T         ≡0
                                                             1→2
                           0
                               0         2       4            6         8   10
                                                         t

FIG. 1: Accurate result of the information flow between X1 and X2 within the linear system
(9)-(10). The variance is initialized with σ11 = σ22 = 0.1, σ12 = 0.



is obtained. When N is large, ρ(X1 ) can be dropped without causing much error. In
this linear case, analytical solution of ρ can be found; the result, however, is complicated.
In the interest of applicability, we turn to the discretized version of the SDE. Using the
Euler-Bernstein scheme (cf. [19]),

                        Xn+1 = Xn + F(Xn ; θ)∆t + B(Xn ; θ)∆W,                               (13)

where F = f + Ax. Suppose ∆t is small, we know

                           ∆W ∼ N (0, BBT ∆t),
                           Xn+1 |Xn = xn ∼ N (xn + F∆t, BBT ∆t).

So

              ρ(Xn+1 = xn+1 |Xn = xn )
                           1            − 12 (xn+1 −xn −F∆t)T (BBT ∆t)−1 (xn+1 −xn −F∆t)
              =                        e                                                 ,
                [(2π)2 det(BBT ∆t)]1/2

and
                           N
                           X
                ℓN (θ) =           log ρ(Xn+1 |Xn ; θ)
                           n=1
                             N
                          1X
                                log det(BBT )
                                             
                = const −
                          2 n=1
                           N
                      1 X
                   −         (xn+1 − xn − F∆t)T (BBT )−1 (xn+1 − xn − F∆t).                  (14)
                     2∆t n=1

                                                     5
Note here we have assumed that N is large enough such that ρ(X1 ) can be dropped without
causing much error. The mle of θ is, therefore,

                                           θ̂ = arg max ℓN (θ).                                           (15)
                                                         θ

   For convenience, denote, for i = 1, 2,
                                      Xi,n+1 − Xi,n
                               Ẋi,n :=             ,                                      (16)
                                           ∆t
                           Ri,n := Ẋi,n − (fi + ai1 X1,n + ai2 X2,n ).                    (17)
                            2     
                       T     b1 0
Also notice that BB =                . Substituting into Eq. (14), the log likelihood ℓN (θ) =
                             0 b22
ℓN (f, A, B) is,
                                                      "    N              N
                                                                               #
                                    N             ∆t    1 X             1 X
            ℓN (f, A, B) = const − log b21 b22 −              R2 +          R2             (18)
                                     2              2 b21 n=1 1,n b22 n=1 2,n

The estimators of f, A, and B can be found by maximizing ℓN . It is interesting to note that
the equations governing the estimators (fˆ1 , â11 , â12 ), (fˆ2 , â21 , â22 ), and (b̂1 , b̂2 ) are actually
decoupled. This makes the estimation much         P easier.      Besides, notice that maximizing ℓN over
                                                          2
(fi , ai1 , ai2 ) is equivalent to minimizing n Ri,n := QN,i over the same group of parameters,
for i = 1, 2. So (fˆ1 , â11 , â12 ) are precisely the least square estimators, which satisfies

                                                                  ˆ1
                             P              P                       P                 
                      N
                      P       P 2 X  1,n     P   X 2,n           f              Ẋ 1,n
                    X1,n         X              X     X
                                                                           P
                                     1,n           1,n   2,n   â11  =  X1,n Ẋ1,n  .
                      P       P              P 2
                        X2,n      X2,n X1,n      X2,n            â12
                                                                           P
                                                                                X2,n Ẋ1,n

   The above equation set can be written in a more familiar and succinct form:
                                                            
                        1 X1      X2          fˆ1      Ẋ1
                                        
                       X1 X12    X1 X2   â11  =  X1 Ẋ1  ,
                                                             
                                                                                                          (19)
                        X2 X1 X2 X22          â12     X2 Ẋ1

where, as usual, the overline signifies sample mean. After some algebraic manipulations, it
becomes:
                                                                               
             1 X1               X2                   ˆ         Ẋ
                                               
                                                    f1            1
            0 X12 − X̄12                                                    ¯ 
                                X1 X2 − X̄1 X̄2   â11  =  X1 Ẋ1 − X̄1 Ẋ 1 .
                                                             
                                  2
             0 X1 X2 − X̄1 X̄2 X2 − X̄2  2          â12       X Ẋ − X̄ Ẋ  ¯
                                                                            2   1     2   1

Let

                                       Cij := (Xi − X̄i )(Xj − X̄j ),                                     (20)
                                       C := (X − X̄ )(Ẋ − Ẋ    ¯ ),                                     (21)
                                          i,dj       i       i   j     j




                                                         6
C = (Cij ) being the sample covariance matrix. The equation set is actually

                                            fˆ1
                                                        
                              1 X1 X2                  Ẋ1
                             0 C11 C12   â11  =  C1,d1  ,
                              0 C12 C22     â12       C2,d1

which yields
                                           C22 C1,d1 − C12 C2,d1
                                    â11 =                       ,                               (22)
                                                   det C
                                           −C12 C1,d1 + C11 C2,d1
                                    â12 =                         ,                             (23)
                                                    det C
                                           ¯ − â X̄ − â X̄ .
                                    fˆ1 = Ẋ                                                     (24)
                                             1   11 1      12 2


The other group of estimators can be obtained by switching the indices:
                                           C11 C2,d2 − C12 C1,d2
                                    â22 =                       ,                               (25)
                                                   det C
                                           −C12 C2,d2 + C22 C1,d2
                                    â21 =                         ,                             (26)
                                                    det C
                                           ¯ − â X̄ − â X̄ .
                                    fˆ2 = Ẋ                                                     (27)
                                             2   21 1      22 2


With these results, let ∂ℓ
                        ∂bi
                           N
                             = 0 to get
                                                  r
                                                      QN,i · ∆t
                                          b̂i =                 ,                                (28)
                                                        N
where
                          N              N h                                      i2
                                            Ẋi,n − (fˆi + âi1 X1,n + âi2 X2,n ) .
                          X              X
                                 2
                 QN,i =         Ri,n =
                          n=1            n=1

   On the other hand, as the population covariance matrix can be estimated by the sample
covariance matrix, the estimator of σ12 /σ11 is C12 /C11 . Substituting these results back to
(7), we finally obtain the rate of information flowing from X2 to X1 :

                                         C12 −C12 C1,d1 + C11 C2,d1
                            T2→1 =           ·              2
                                                                    ,                            (29)
                                         C11    C11 C22 − C12

where Cij is the sample covariance between Xi and Xj , and Ci,dj the covariance between Xi
and Ẋj . Strictly speaking, here T2→1 should bear a caret since it is an estimator of the true
information flow. But we will abuse the notation a little bit for the sake of terseness. The
flow in the opposite direction, T1→2 , can be directly written out by switching the indices 1
and 2. The units are in nats per unit time.
   Given a significance level, we may estimate the confidence interval for (29). This can
always be achieved with bootstrap. But here things can be simplified. When N is large,
                                                                                             2
                                                                                       C12
T2→1 is approximately normally distributed around its true value with a variance       C11
                                                                                                 σ̂a212 ,


                                                      7
thanks to the mle property. Here σ̂a212 is determined as follows. Denote θ = (f1 , a11 , a12 , b1 ).
Compute
                                             N
                                             X ∂ 2 log ρ(Xn+1 |Xn ; θ̂)
                             NIij = −                                                          (30)
                                             n=1
                                                               ∂θi ∂θj

to form a matrix NI, I being the Fisher information matrix. The inverse (NI)−1 is the
covariance matrix of θ̂, within which is σ̂a212 . Given a significance level, the confidence
interval can be found accordingly.


IV.   VALIDATION

   The above formula is remarkably tight in form, involving only the common statistics
namely sample covariance matrix. We now check whether they verify the example shown in
Fig. 1. The data we have is just one realization, i.e., one sample path of X1 and X2 each
generated from the given system. Using a time step ∆t = 0.001, we generate 100000 steps,
corresponding to a time span t = 0 − 100. For later use, we purportedly initialize the series
far from the equilibrium to allow for a period of spin-down, as shown in Fig. 2. The series
reach a stationary state after approximately t = 4; shown in the inserted box is a close-up
plot. Our objective is, of course, not to estimate the whole evolution course as shown in
Fig. 1; what we expect is to see whether the stationary values (T2→1 = 0.1111, T1→2 = 0)
can be estimated with acceptable confidence. For this purpose, we form different series from
the sample path with different resolutions and different time intervals and lengths, and then
test the performance of estimation. The testing results are listed in Table I.

                          2.5

                            2

                          1.5       X2

                            1
                                X
                          0.5       1


                            0

                         −0.5
                                0        2         4             6       8   10
                                                           t

FIG. 2: A sample path of the linear SDE (9)-(10) generated using the Euler-Bernstein scheme with
∆t = 0.001 and initialized with (1, 2). Inserted is a close-up over the interval t = 4.5-8.5.


   Clearly, so long as the time span of the series is long enough, the estimation can be made
rather accurate. With stationary data (t = 5 − 100), even when one samples the path every
100 time steps (corresponding to a time resolution of 0.1) which yields a time series of only

                                                       8
TABLE I: The information flow computed with different series formed by sampling from the path
shown in Fig. 2. ∆n is the sampling interval. The accurate result is: T2→1 = 0.1111, T1→2 = 0 (in
                                                                                 ∗.
nats per unit time). In the last two cases, data on [5, 10] are used to compute Cij
                           Time span ∆n T2→1     T1→2     Remark
                            t=5-100 1 0.11 −2.0 × 10   −3

                                      20 0.10 −4.0 × 10−3
                                     100 0.09    -0.01
                            t=10-20 1 0.60        0.17
                                      10 0.57    0.20
                             t=0-10   1 0.74      0.10
                                      1 0.29     0.02     use (31)
                                      10 0.28    0.02     use (31)



1000 data points, the result is still acceptable to some extent. In some cases, the span may
not be that long. To see how the formula may perform, we make two series spanning only
10 time units. In the first case we test with a stationary segment t = 10 − 20. The result:
T2→1 = 0.60, T1→2 = 0.17, unfortunately, is not as good as one would like to expect, even
though the data points amount to 10000. Nonetheless, if we estimate the standard error at
a 95% significance level, which gives a value of 0.54 and 0.47, respectively, the result still
sounds informative. It tells that T2→1 is significantly (at a 95% level) greater than zero,
while T1→2 is not significantly different from zero, consistent with the accurate result.
   On the other hand, if the time span, though small, contains the nonstationary period,
things may actually turn better. Choose an interval t = 0 − 10. The result looks remarkably
promising, provided that we treat the covariances in the first fraction of (29) and that in the
second fraction differently. In the first fraction, the sample covariances are indeed used to
estimate the populate covariances, and hence cannot be computed with the nonstationary
data. In the second fraction, the mle is for the deterministic coefficient and so nonstationary
data could serve the purpose better (indeed this is true). To distinguish these two different
estimations, we denote the former with an asterisk; in doing so the formula (29) now looks
                                      ∗
                                     C12   −C12 C1,d1 + C11 C2,d1
                            T2→1 =    ∗
                                         ·                2
                                                                  .                         (31)
                                     C11      C11 C22 − C12

Now go back to the chosen time series spanning [0, 10]. If Cij∗ are computed with data on
[5, 10], then the one-way causality between the two series actually can be fairly reproduced,
though the resulting T2→1 is 1.6 times larger. Moreover, this result is very robust even the
resolution is reduced by ten times. If one only considers a qualitative causal relation, this
example shows that our approach is promising even when the length of the time series is
limited.
    We have tested the formula against systems with different drift and diffusion coefficients,
particularly systems where noises dominate. Again, so long as the series have a span long
enough, the causal relation can be faithfully reproduced. As an example, for the system

                                 dX1 = −0.5X1 + X2 + 20dW1,
                                 dX2 = −0.7X2 + 10dW2 ,

                                              9
if the series span 1000 time units or longer, the estimation of T2→1 and T1→2 can be made
fairly accurate.


V.   AN APPLICATION EXAMPLE

   Finally let us look at an application to a real world problem: the causal relation between
the two famous climate modes, El Niño and Indian Ocean Dipole (IOD). El Niño is the
strongest interannual climate variation in the tropical Pacific air-sea coupled system, occur-
ring at irregular intervals of 2 to 7 years and lasting 9 months to 2 years[21]; it is well known
through its linkage to natural disasters in far flung regions of the globe, such as the floods
in Ecuador, the droughts in Southeast Asia and Southern Africa, the increased number of
storms over the Pacific Ocean. There are several indices measuring the strength of El Niño ,
the popular ones being Niño3 and Niño4[22]. IOD is another air-sea coupled climate mode,
characterized by an aperiodic oscillation of sea surface temperature (SST) in the Indian
Ocean[23]. It has been related to, among others, the floods in East Africa and drought in
Indonesia and parts of Australia. IOD is measured by an index called Dipole Mode Index
(DMI).
   As the dominant modes in respectively Pacific and Indian Oceans, the relationship be-
tween El Niño and IOD is of substantial interest; see [24] for an excellent review. It has long
been recognized that the tropical Indian and Pacific Oceans are interrelated[25] on their SST
anomalies. But the relation between the two modes is still to be clarified. In general, it is
believed that El Niño may induce IOD, which usually peaks in fall; a recent study is referred
to [26]. The causality of El Niño is easily understandable, considering the alteration of the
Walker circulation during the El Niño years which causes the subsidence over the Indian
Ocean (e.g., [27]). On the other hand, the impact from the IOD has jut been recognized
recently; in fact, in early efforts, Indian Ocean used to be treated as a slab of mixed layer
responding passively to El Niño [28]. The recognition is mainly through climate predictions,
such as the El Niño predictions (e.g., [29], [30]) and the CGCM experiments (e.g., [31]).
Due to the correlation between the two modes, it has been suggested that an Indo-Pacific
perspective should be adopted in researching on the El Niño and IOD problems (e.g., [32])
   The linkage between IOD and El Niño , though evidenced from different aspects, is
somewhat still an issue in debate. This is partly due to the failure to recover the IOD
pattern in the Indian Ocean in many correlation or time-lagged correlation analyses with
the indices and the SST observations, albeit the correlation could be significant. Such an
example is shown in the Fig.4 of Wang et al. (2004). This has led people to conclude with
caution that IOD might be partially independent of El Niño , though El Niño tends to
induce IOD. This problem, which is obviously a problem on cause and effect, could be due
to the inadequacy of using correlation analysis for causality purposes. Now that we have
arrived at the formula (29), let us see how things will come out when it is applied to the
IOD-El Niño causality analysis.
   First look at the causal relation between the indices of the two modes. The DMI used is
the monthly series by Japan Agency for Marine-Earth Science and Technology (JAMSTEC),
which can be downloaded from their website. The El Niño indices are from NOAA ESRL
Physical Sciences Division (http://www.esrl.noaa.gov/psd/); they are also monthly data.
Since this DMI series spans from January 1958 to September 2010, the El Niño indices,
which have a much longer time span (1870-present), are also tailored to the same period.
These series then have a total of 633 time points. Application of (29) to the DMI and

                                              10
Niño4 yields a flow of information from El Niño to IOD: TE→I = −6, and a flow from IOD
to El Niño : TI→E = 13 (units: 10−3 nats/month). Using Niño3 one arrives at a similar
result: TE→I = −6 and TI→E = 16. That is to say, El Niño and IOD are mutually causal,
and the causality is asymmetric, with the one from the latter to the former larger than
its counterpart. Moreover, the different signs indicate that El Niño tends to stabilize IOD,
while IOD tends to make El Niño more uncertain.
    By our previous experience, series length is crucial. To see whether the length here is
adequate, we have tried shortened series: 1963-2010, 1968-2010. The former yields essential
the same result as the one in its full length (1958-2010); the result of the latter is also similar.
In fact, even series with a span as short as 1970-2010 can give qualitatively similar result. So
the series may be long enough to form an ensemble with sufficient statistics. The resulting
information flow rates hence may be acceptable.
    With this assertion we proceed to extract the causality patterns out of the SST in the
Pacific and Indian Oceans. The SST data are from the above NOAA site. As before, we use
only the data for the period 1958-2010. First, compute the causality between DMI and the
tropical Pacific SST. The results are shown in Fig. 3. Clearly DMI and the Pacific SST are
mutually causal, and the information flow in either direction has a El Niño -like pattern.
The signs of the flows are the same as computed above with two index series.

                          (a) T1→2: DMI → Pacific                                       (b) T2→1: Pacific → DMI
Latitude (oN)




                                                                Latitude (oN)


                 20                                                              20

                  0                                                               0

                −20                                                             −20
                          150        −160         −110                                  150        −160        −110
                                Longitude (oE)                                                Longitude (oE)




                −0.02   −0.01         0          0.01    0.02                   −0.02   −0.01          0          0.01

                FIG. 3: Information flow between DMI and the tropical Pacific SST (in nats/month).


   If the above El Niño -like pattern in the Pacific is common, the following pattern in the
Indian Ocean is unique to our causality analysis. Compute the information flow between
Niño4 and the Indian Ocean SST, and plot the result in Fig. 4. Fig. 4a shows the flow from
El Niño to the SST. In the tropical region, there are indeed two poles, though the eastern
one covers a rather limited region over Indonesia. On the map of the feedback from the
Indian Ocean SST (Fig. 4b), this structure is much clear, with a dipole pattern reminiscent
of IOD, though there seems to be a shift eastward. This is remarkable, as in previous
correlation analyses or time-lagged correlation analyses, the IOD pattern is not seen. Note
in Fig. 4b, both centers are positive, indicating that the Indian Ocean influences the El Niño
through IOD, which functions to amplify the El Niño oscillations. In contrast, the impact
of El Niño on the Indian Ocean SST divides over the two centers, which have opposite signs
of information flow. The causality analysis with Niño3 shows similar patterns, though the
features may not be as pronounced as that with Niño4.
   The relation between El Niño and IOD is an extensively investigated subject; further
discussion, however, is beyond the scope of this study. Our purpose here is to use it as

                                                           11
                      (a) T   : El Nino → Indian Ocean                                        (b) T   : Indian Ocean → El Nino
                          1→2                                                                     2→1
                 40                                                                      40                                        0.2

                                                               0.3                                                                 0.1
                 20                                                                      20
                                                               0.2                                                                 0
Latitute (oN)




                                                                        Latitute (oN)
                                                               0.1                                                                 −0.1
                  0                                                                       0
                                                                                                                                   −0.2
                                                               0
                −20                                                                     −20                                        −0.3
                                                               −0.1
                                                                                                                                   −0.4
                                                               −0.2
                −40                                                                     −40
                         50             100           150                                        50             100          150
                                          o                                                                       o
                                Longitude ( E)                                                          Longitude ( E)


                  FIG. 4: Information flow between Niño4 and the Indian SST (units: nats/month).



one real world example to demonstrate the utility of the newly derived formula (29). The
result is encouraging: the IOD-like pattern, which is anticipated as evidence builds up, but
missed in previous correlation studies, is recovered faithfully in the index-SST causality
patterns. Moreover, it is found that, on the whole, the El Niño influences the IOD by
making the latter more certain, while the causality from IOD to El Niño is generally the
opposite. This is perhaps the reason why it has long been observed in a definite way that
El Niño may induce IOD, while the influence from IOD to El Niño , albeit stronger, has been
just recognized recently through predictability studies. The latter, which carries a positive
information of flow, means that, to El Niño , the Indian Ocean is a source of uncertainty,
and the causality from IOD to El Niño is manifested as a transference of uncertainty from
the former to the latter. Clearly an efficient way to observe and forecast an event is to
put extensive observation at its uncertainty source–a way how target observing systems are
designed. This is why knowledge of the Indian Ocean facilitates the El Niño forecast (e.g.,
[29], [30]), i.e., increases the predictability of El Niño .


VI.              DISCUSSION

   We have obtained, based on a rigorous formalism of information flow, a concise formula
for causality analysis between time series. For series X1 and X2 , the rate of information
flowing (units: nats per unit time) from the latter to the former is

                                                          C12 C11 C2,d1 − C12 C1,d1
                                                 T2→1 =       ·               2
                                                                                    ,                                              (32)
                                                          C11    C11 C22 − C12

where Cij is the sample covariance between Xi and Xj , Ci,dj the covariance between Xi
                                                  dX
and Ẋj , and Ẋj the difference approximation of dtj using the Euler forward scheme [see
Eq. (16)]. If T2→1 = 0, X2 does not cause X1 ; if not, it is causal. In the presence of
causality, two cases can be distinguished according to the sign of the flow: a positive T2→1
means that X2 functions to make X1 more uncertain, while a negative value indicates that

                                                                   12
X2 tends to stabilize X1 . The formula is very tight, involving only the common statistics
namely the sample covariances. It has been validated with touchstone series, where the
stationary preset one-way causality can be rather accurately recovered, provided that the
series is long enough (time span, not number of data points) to contain sufficient statistics.
When the series length is guaranteed, the formula works even with series with rather coarse
resolution. Moreover, the series need not be stationary for the formula to apply; in fact,
when a nonstationary segment is included, it works with much shorter series. In this case,
the equation should be replaced by
                                       ∗
                                      C12   C11 C2,d1 − C12 C1,d1
                             T2→1 =    ∗
                                          ·                 2
                                                                  ,                         (33)
                                      C11      C11 C22 − C12

where Cij∗ are the sample covariances computed using the slab of data with nonstationarity
removed. In practice, we suggest that one select out the stationary part of the data, or
detrend the series, before estimating Cij∗ . But when computing Cij , the original data should
be used; no detrending or other manipulation should be made.
   It should be pointed out that this formula is based on a formalism with respect to Shan-
non entropy, or absolute entropy, while it has been argued[33], in predictability research,
relative entropy is a more advantageous choice due to its nice properties such as invariance
under nonlinear transformation. Fortunately, as we have proved in [34], for 2D systems, the
information flow thus obtained is the same with both absolute and relative entropies. But,
of course, the sign has to be changed, as the former is for uncertainty, and the latter for
predictability.
   Some issues remain. Firstly, what we have arrived is for linear systems, while in reality,
nonlinearity is ubiquitous. For sure there is still a long way to go along this line of research,
and this study just marks the starting point. Secondly, the time span of the series should
be long enough for the estimation to be accurate. But how long? It would be useful if we
can have some criterion to judge whether a given length is adequate or not. Thirdly, the
rates of information flow differ from case to case; one would like to normalize them in real
applications. A natural normalizer that comes to mind, at the hint of correlation coefficient,
might be the information of a series transferred from itself. The snag is, this quantity may
turn out to be zero, just as that in the Hénon map, a benchmark problem we have examined
before (cf. [15]). These issues, among others, will be considered in the forthcoming studies.


   Acknowlegments

   This study was partially supported by Jiangsu Provincial Government through the
Jiangsu Chair Professorship to XSL, and by the National Science Foundation of China
(NSFC) under Grant No. 41276032.



 [1] Pereda, E., Quiroga, R.Q., Bhattacharya, J. Nonlinear multivariate analysis of neurophysio-
     logical signals. Prog. Neurobiol. 77(1-2), 1-37 (2005)
 [2] Korzeniewska, A., Manczak, M., Kaminski, M., Blinowska, K.J., Kasicki, S. Determination
     of information flow direction among brain structures by a modifed directed transfer function
     (dDTF) method. J. Neurosci. Meth. 125, 195-207 (2003)

                                              13
 [3] Wu, J., Liu, X., Feng, J. Detecting causality between different frequencies. J. Neurosci. Meth.
     167, 367-375 (2008)
 [4] Baptista, M.D.S., Kakmeni, F.M., Grebogi, C. Combined effect of chemical and electrical
     synapses in Hindmarsh-Rose neural networks on synchronization and the rate of information.
     Phys. Rev. E 82, 036203 (2010)
 [5] Sachs, K., Perez, O., Pe’er, D., Lauffenburger, D.A., Nolan, G.P. Causal protein-signaling
     networks derived from multiparameter single-cell data. Science 308, 523-529 (2005).
 [6] Okasha, S. Emergence, hierarchy and top-down causation in evolutionary biology. J. R. Soc.
     Interface 2, 49-54 (2012)
 [7] Jost, C., Arditi, R. Identifying predator-prey processes from time-series. Theoretical Popula-
     tion Biology 57, 325-337 (2000)
 [8] Ay, N., Polani, D. Information flows in causal networks. Advs. Complex Syst. 11,
     doi:10.1142/S0219525908001465 (2008)
 [9] Sommerlade, L., Eichler, M., Jachan, M., Henschel, K.. Timmer. J., Schelter, B. Estimating
     causal dependencies in networks of nonlinear stochastic dynamical systems. Phys. Rev. E 80,
     051128 (2009)
[10] Chen, C.R., Lung, P.P., Tay, N.S.P. Information flow between the stock and option markets:
     Where do informed traders trade? Rev. Financ. Econ. 14, 1-23 (2005)
[11] Lee, S.S. Jumps and information flow in financial markets. Rev. Financ. Stud. 25, 439-479
     (2012)
[12] Crutchfield, J.P., Shalizi, C.R. Thermodynamic depth of causal states: Objective complexity
     via minimal representation. Phys. Rev. E 59, 275-283 (1999)
[13] Schreiber, T. Measuring information transfer. Phys. Rev. Lett. 85, 461 (2000)
[14] Liang, X.S., Kleeman, R. Information transfer between dynamical system components. Phys.
     Rev. Lett. 95, 244101 (2005)
[15] Liang, X.S. The Liang-Kleeman information flow: Theory and applications. Entropy 15, 327-
     360 (2013)
[16] Liang, X.S. Information flow within stochastic dynamical systems. Phys. Rev. E 78, 031113
     (2008)
[17] Nicolau, J. New technique for simulating the likelihood of stochastic differential equations.
     The Econometrics Journal 5(1) (2002).
[18] Pedersen, A. A new approach to maximum likelihood estimation for stochastic differential
     equations based on discrete observations. Scandinavian Journal of Statistics 22, 55-71 (1995)
[19] Lasota, A., Mackey, M.C. Chaos, Fractals, and Noise: Stochastic Aspects of Dynamics.
     Springer, New York (1994)
[20] Snedecor, G.W., Cochran, W. Statistical Methods, 8th ed., Iowa State University Press, Ames,
     Iowa (1989)
[21] Cane, M.A. Oceanographic events during El Niño . Science 222, 1189-1194 (1983)
[22] Trenberth, K.E. The definition of El Niño . Bull. Amer. Meteor. Soc. 78, 2771-2777 (1997)
[23] Saji, H.H., Goswami, B.N., Vinayachandran, P.N., Yamagata, T. A dipole mode in the tropical
     Indian Ocean, Nature 401, 360-363 (1999)
[24] Wang, C.Z., Xie, S.-P., Carton, J.A. A global survey of ocean-atmosphere interaction and
     climate variability. In: Earth’s Climate: The Ocean-Atmosphere Interaction. C. Wang, S.-P.
     Xie, and J.A. Carton, Eds., AGU, Washington, D.C., 1-19 (2004)
[25] Kiladis, G.N., Diaz, H.F. Global climatic anomalies associated with extremes in the Southern
     Oscillation. J. Clim. 2, 1069-1090 (1989)


                                               14
[26] Wang, X., Wang, C. Different impacts of various El Niño events on the Indian Ocean Dipole.
     Clm. Dyn. DOI: 10.1007/s00382-013-1711-2 (2013)
[27] Klein, S.A., Soden, B.J., Lau, N.C. Remote sea surface temperature variations during ENSO:
     Evidence for a tropical atmospheric bridge. J. Clim. 12, 917-932 (1999)
[28] Lau, N.-C., Nath, M.J. Impact of ENSO on the variability of the Asian-Australian monsoons
     as simulated in GCM experiments. J. Clim. 13, 4287-4309 (2000)
[29] Chen, D., Cane, M.A. El Niño prediction and predictability. J. Comput. Phys. 227, 3625-3640
     (2008)
[30] Izumo, T., Lengaigne, M., Vialard, J., Luo, J.-J., Yamagata, T., Madec, G. Influence of Indian
     Ocean Dipole and Pacific recharge on following year’s El Nino: interdecadal robustness, Clim.
     Dyn. 42, 291-310 (2014)
[31] Annamalai, H., Kida, S., Hafner, J. Potential impact of the tropical Indian Ocean - Indonesian
     Seas on El Niño characteristics. J. Clim. 23, 3933-3952 (2010)
[32] Webster, P.J., Hoyos, C.D. Beyond the spring barrier? Nature Geoscience 3, 152-153 (2010)
[33] Kleeman, R. Measuring dynamical prediction utility using relative entropy. J. Atmos. Sci. 59,
     2057-2072 (2002)
[34] Liang, X.S. Local predictability and information flow in complex dynamical systems. Physica
     D 248, 1-15 (2013)




                                               15
