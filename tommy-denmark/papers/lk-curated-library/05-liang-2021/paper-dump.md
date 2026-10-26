# Full-text extraction

- Title: Normalized Multivariate Time Series Causality Analysis and Causal Graph Reconstruction
- Year: 2021
- DOI: https://doi.org/10.3390/e23060679
- PDF source: https://arxiv.org/pdf/2104.11360
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                         Normalized multivariate time series causality analysis and causal
                                                              graph reconstruction
                                                                                 X. San Liang∗
                                                                Nanjing Institute of Meteorology, Nanjing, China
                                                          Shanghai Qizhi (Andrew C. Yao) Institute, Shanghai, China
                                                                      China Institute for Advanced Study,
                                                          Central University of Finance and Economics, Beijing, China
                                                                                      Abstract
arXiv:2104.11360v1 [cs.AI] 23 Apr 2021




                                            Causality analysis is an important problem lying at the heart of science, and is of particular
                                         importance in data science and machine learning. An endeavor during the past 16 years viewing
                                         causality as real physical notion so as to formulate it from first principles, however, seems to go
                                         unnoticed. This study introduces to the community this line of work, with a long-due generalization
                                         of the information flow-based bivariate time series causal inference to multivariate series, based on
                                         the recent advance in theoretical development. The resulting formula is transparent, and can be
                                         implemented as a computationally very efficient algorithm for application. It can be normalized,
                                         and tested for statistical significance. Different from the previous work along this line where only
                                         information flows are estimated, here an algorithm is also implemented to quantify the influence of
                                         a unit to itself. While this forms a challenge in some causal inferences, here it comes naturally, and
                                         hence the identification of self-loops in a causal graph is fulfilled automatically as the causalities
                                         along edges are inferred.
                                            To demonstrate the power of the approach, presented here are two applications in extreme situ-
                                         ations. The first is a network of multivariate processes buried in heavy noises (with the noise-to-
                                         signal ratio exceeding 100), and the second a network with nearly synchronized chaotic oscillators.
                                         In both graphs, confounding processes exist. While it seems to be a huge challenge to reconstruct
                                         from given series these causal graphs, an easy application of the algorithm immediately reveals the
                                         desideratum. Particularly, the confounding processes have been accurately differentiated. Consid-
                                         ering the surge of interest in the community, this study is very timely.

                                         PACS numbers:
                                         Keywords: Causal graph reconstruction; Information flow; Time series; Synchronization




                                         ∗
                                             Electronic address: X.S.Liang,sanliang@courant.nyu.edu;http://www.ncoads.org/

                                                                                          1
I.   INTRODUCTION

    Recent years have seen a surge of interest in causality analysis. The main thrust is the
recognition of its increasing importance in machine learning and artificial intelligence, a
milestone being the connection of the principle of independent causal mechanisms to semi-
supervised learning by Schölkopf et al. (2012). Different methods have been proposed for
inferring the causality from data, in addition to the classical ones such as Granger causality
testing. While traditionally causal inference has been categorized as a subject in statistics,
and now also a subject in computer science, it merits mentioning that, during the past
decades, contributions from different disciplines have augmented the subject and significant
advances have been made ever since. Early efforts since Clive Granger and Judea Pearl
(c.f. Pearl, 2009) include, for example, Spirtes and Glymour (1991), Schreiber (2000), Paluš
et al. (2001), Liang and Kleeman (2005). Recently, due to the rush in artificial intelligence,
publications have been piling up, among which are Zhang and Spirtes (2008), Maathuis et al.
(2009), Pompe and Runge (2011), Janzing et al. (2012), Sugihara et al. (2012), Schölkopf
et al. (2012), Sun and Bollt (2014), Peters et al. (2017), to name but a few; see Peters et
al. (2017) and Spirtes and Zhang (2016) for more references.
    Although causality has long been investigated ever since Granger (1969), thanks to the
systematic works by Pearl (2009) and others, its “mathematization is a relatively recent
development,” said Peters, Janzing and Schökopf (2017). On the other hand, Liang (2016)
argued that it is actually ”a real physical notion that can be derived ab initio.” Despite the
current rush, this latter line of work starting some 16 years ago, however, seems to go almost
unnoticed. It can be traced back to a discovery on two-dimensional (2D) information flow by
Liang and Kleeman (2005). With the efforts later on, e.g., Liang (2008) and Liang (2014), a
very easy method for bivariate time series causality analysis has been established, validated,
and applied successfully to real world problems in different disciplines. More details can be
found below in section 2. Recently, the whole formalism has been put on a rigorous footing
(Liang, 2016); explicit formulas for multidimensional information flow have been obtained
in a closed form with both deterministic and stochastic systems.
    The multivariate time series causality analysis, however, has not been established since
Liang (2016)’s work. Considering the enormous interest in this field, we are henceforth
intented to fill the gap. The purpose of this study is hence two-fold: (1) Implement Liang
(2016)’s theory into the long-due multivariate time series causality analysis; (2) along with
the implementation present a brief introduction of this line of work.
    The remaining of the paper is organized as follows. In section 2 we first establish the
framework, and then take a stroll through the theory of information flow and the information
flow-based bivariate time series causality analysis. Section 3 presents an estimate of the
information flow rates among multivariate time series, and their significance tests. These
information flows can be normalized to reveal the impact of the role in question (section 4).
In order to test the power of the method, in section 5 it is applied to infer the causal
graphs with two extreme processes, one being a network with heavy noise (noise-to-signal
ratio exceeding 100), another being a network of almost synchronized chaotic oscillators.
Section 6 closes the paper with a brief summary of the study.




                                             2
II. AN OVERVIEW OF THE THEORY OF INFORMATION FLOW-BASED
CAUSALITY ANALYSIS

   A.   Directed graph, uncertainty propagation, and causality

   In this framework, causal inference is based on information flow (rather than the other
way around), which has been recognized as a real physical notion that can be put on a
rigorous footing (see Liang, 2016). Consider a graph (V, E), where V and E are the sets
of vertexes and edges, and the structural causal model on the graph, (C, PN ), where C
is a collection of d structural assignments Xi = Fi (PA(Xi ), ǫi ), i = 1, ..., d, PA(Xi ) ⊆
{X\i } = X1 , ..., Xd }\{Xi } indicating the parents or direct causes of Xi , and PN being a joint
distribution over the noise variables (Pearl, 2009). The basic idea is that this can be recast
within the framework of dynamical systems, and that the causal inference problem can be
carried forth to that between the coordinates in a dynamical system. This is how Liang and
Kleeman (2005) originally conceptualized the problem. Recently it has also been realized
by, say, R/oysland (2012), Mooij et al. (2013) and Mogensen et al. (2018).
   In physics there is a notion called information flow which can be readily cast within
the dynamical system framework. As entropy is by interpretation “self information”, it is
natural to measure it with the propagation of entropy or uncertainty, from one component
to another. (Of course, other entropies may provide alternative choices; e.g., Amigó et al.,
2020) In this light we have the following definition:
Definition II.1 In a dynamical system (Ω, Φt ) on the d-dimensional phase space Ω, where
Φt may be a continuous-time flow (t ∈ R+ ) or discrete-time mapping t ∈ Z+ ), the infor-
mation flow from a component/coordinate Xj to another component/coordinate Xi , written
Tj→i , is defined as the contribution of entropy (uncertainty) from Xj per unit time (t ∈ R+ )
or per step (t ∈ Z+ ) in increasing the marginal entropy of Xi .
With information flow, causality can be defined, and, moreover, quantitatively defined:
Definition II.2 Xj is causal to Xi iff Tj→i 6= 0. The magnitude of the causality from Xj
to Xi is measured by |Tj→i |.
By evaluating the information flow within a dynamical system, the underlying causal graph
is henceforth determined. For this study, we consider only the continuous flow case. The
vector field that form the structural assignments is hence differentiable. Further assume a
Wiener process for the noise (white noise). Note that some of these assumptions can be
easily relaxed, and the generalization is straightforward. But that is outside the scope of
this study.


   B.   A brief stroll through the theory and recent advances

   This line of work begins with Liang and Kleeman (2005) within the framework of 2D
deterministic systems. Originally it is based on a heuristic argument, but later on it is
rigorized. Its generalization to multidimensional and stochastic systems, however, has not
been fulfilled until the recent theoretical work by Liang (2016). The following is just a brief
review.
   We begin by stating an observational fact about causality:

                                               3
      If the evolution of an event, say, X1 , is independent of another one, X2 , then the
      information flow from X2 to X1 is zero.
Since it is the only quantitatively stated fact about causality, all previous empirical/half-
empirical causality formalisms have attempted to verify it in applications. For this reason,
it has been referred to as the principle of nil causality (e.g., Liang, 2016).We will soon see
below that, within the information flow framework, this principle turns out to be a proven
theorem.
   Consider a d-dimensional continuous-time stochastic system for X = (X1 , ..., Xd )

                                dX = F(X, t)dt + B(X, t)dW,                                      (1)

where F = (F1 , ..., Fd ) may be arbitrary nonlinear functions of X and t, W is a vector of
standard Wiener processes, and B = (bij ) is the matrix of perturbation amplitudes which
may also be any functions of X and t. Assume that F and B are both differentiable with
respect to X and t. We then have the following theorem (Liang, 2016):
Theorem II.1 For the system (1), the rate of information flowing from Xj to Xi (in nats
per unit time) is

                                               ∂(Fi ρ\j )
                                   Z                             
                                    1
                     Tj→i = −E                            dx\i\j +
                                    ρi Rd−2Z ∂xi
                                                     ∂ 2 (gii ρ\j )
                                                                          
                                   1      1
                                     E                        2
                                                                    dx\i\j ,
                                   2      ρi   R d−2     ∂x   i
                                                   ∂(Fi ρ\j )
                               Z
                          = −       ρj|i (xj |xi )            dx+
                                 Rd Z                ∂xi
                                   1                     ∂ 2 (gii ρ\j )
                                          ρj|i (xj |xi )                dx,         (2)
                                   2 Rd                      ∂x2i
where dx\i\j P
             signifies dx1 ...dxi−1 dxi+1 ...dxj−1 dxj+1 ...dxn , E stands for mathematical expecta-
tion, gii = nk=1 bik bik , ρi = ρi (xi ) is the marginalR probability density function (pdf ) of Xi ,
ρj|i is the pdf of Xj conditioned on Xi , and ρ\j = R ρ(x)dxj .
For discrete-time mappings, the information flow is in a more complicated form; see Liang
(2016).

Corollary II.1 When d = 2,

                                                      1 ∂ 2 g11 ρ1
                                                                
                                  1 ∂(F1 ρ1 )    1
                        T2→1 = −E               + E                  .                           (3)
                                  ρ1 ∂x1         2    ρ1 ∂x21

This is the early result of Liang (2008) on which the bivariate causality analysis is based;
see Theorem II.5 below.
   There is a nice property for the above information flow:
Theorem II.2 If in (1) neither F1 nor g11 depends on X2 , then T2→1 = 0.
Note this is precisely the principle of nil causality. Remarkably, here it appears as a proven
theorem, while the classical ansatz-like formalisms attempt to verify in applications.
   Moreover, Liang (2018) established that

                                                4
Theorem II.3 T2→1        is   invariant     under      arbitrary   nonlinear   transformation    of
(X3 , X4 , ..., Xd ).
This is a very important result, as we will see soon in causal graph reconstruction. On
the other hand, this from an aspect tells that the obtained information flow should be an
intrinsic property in physical world.
   For linear systems, the information flow can be greatly simplified.
Theorem II.4 In (1), if F(X) = f + AX, and B is a constant matrix, then
                                                       σij
                                          Tj→i = aij       ,                                    (4)
                                                       σii
where aij is the (i, j)th entry of A, and σij the population covariance between Xi and Xj .
Observe that, if σij = 0, then Tj→i = 0; but if Tj→i = 0, σij does not necessarily vanish.
Contrapositively, this means that correlation does not mean causation. We hence have the
following corollary:

      Corollary II.2 In the linear sense causation implies correlation, but correlation does
      not imply causation.
This explicit mathematical expression hence provides a solution to the long-standing debate
ever since George Berkeley (1710) over correlation versus causation.
   In the case with only two time series (no dynamical system is given), we have the following
result (Liang, 2014):
Theorem II.5 Given two time series X1 and X2 , under the assumption of a linear model
with additive noise, the maximum likelihood estimator (mle) of (3) is
                                                         2
                                        C11 C12 C2,d1 − C12 C1,d1
                              T̂2→1 =        2              2
                                                                  ,                             (5)
                                           C11 C22 − C11 C12
where Cij is the sample covariance between Xi and Xj , and Ci,dj the sample covariance
between Xi and a series derived from Xj using the Euler forward differencing scheme: Ẋj,n =
(Xj,n+k − Xj,n )/(k∆t), with k ≥ 1 some integer.
Eq. (5) is rather concise in form; it only involves the common statistics, i.e., sample covari-
ances. In other words, a combination of some sample covariances will give a quantitative
measure of the causality between the time series. This makes causality analysis, which oth-
erwise would be complicated with the classical empirical/half-empirical methods, very easy.
Nonetheless, note that Eq. (5) cannot replace (3); it is just the mle of the latter. Statistical
significance test must be performed before a causal inference is made based on the computed
T2→1 . For details, refer to Liang (2014).
   The above formalism has been validated with many benchmark systems such as baker
transformation, Hénon map, Kaplan-Yorke map, Rössler system (e.g., Liang (2016)), to
name a few. Particularly, the concise Eq. (5) has been validated with problems where
traditional approaches fail. An example is the mysterious anticipatory system problem
discovered by Hahs and Petehl (2011), which with (5) is successfully fixed in an easy way.
   The formalism has been successfully applied to the studies of many real world problems,
among them are the causal relation between El Niño-Indian Ocean Dipole (Liang, 2014)

                                                5
global climate change (Stips et al., 2016), soil moisture-precipitation interaction (Hagan et
al., 2018), glaciology (Vannitsem et al., 2019), neuroscience problems (Hristopulos et al.,
2019), to name a few. Here we particularly want to mention the study by Stips et al.[28]
who, through examining with (5) the causality between the CO2 index and the surface air
temperature, identified a reversing causal relation with time scale. They found, during the
past century, indeed CO2 emission drives the recent global warming; the causal relation is
one-way, i.e., from CO2 to global mean atmosphere temperature. Moreover, they were able
to find how the causality is distributed over the globe, thanks to the quantitative nature of
(5). However, on a time scale of 1000 years or over, the causality is completely reversed;
that is to say, on a paleoclimate scale, it is global warming that drives CO2 concentration
to rise!


III. INFORMATION FLOW AMONG TIME SERIES AND ALGORITHM FOR
MULTIVARIATE CAUSAL INFERENCE

   We now estimate (2), given observations of the d components, in order to arrive at a
handy formula for causal inference. As mentioned in section 1, this has not been done
yet; the available estimator (5) is for (3). Here we only consider time series, but it can be
easily extended to other forms of data. We further assume the series are stationary and
equi-distanced. Without loss of generality, it suffices to examine T2→1 .
   As in the bivariate case of Liang (2014),we estimate the linear version (4). We hence
examine a linear stochastic differential equation

                                   dX = f + AXdt + BdW,                                        (6)

where f is a constant vector, and A = (aij ) and B = (bij ) are constant matrices. Initially
if X obeys a Gaussian distribution, then it is a Gaussian for ever, i.e., X ∼ N (µ, Σ), with
µ = (µ1 , ..., µd )T and Σ = (σij ) being the mean vector and covariance matrix, respectively.
Hence X1 ∼ N (µ1 , σ11 ).
   The above results need to be estimated if what we are given are just d time series.
That is to say, what we know is a single realization of some unknown system, which, if
known, can produce infinitely many realizations. We use maximum likelihood estimation
(e.g., Garthwaite et al., 1995) to achieve the goal. The procedure follows that of Liang
(2014), which for easy reference we briefly summarize here. As established before, a further
assumption that B is diagonal, i.e., bij = 0, for i 6= j, and hence g11 = b211 , will much simplify
the problem, while in practice this is quite reasonable.
   Suppose that the series are equal-distanced with a time stepsize ∆t, and let N be the sam-
ple size. Consider an interval [n∆t, (n + 1)∆t], and let the transition pdf be ρ(Xn+1 |Xn ; θ),
where θ stands for the vector of parameters to be estimated. So the log likelihood is
                                   N
                                   X
                        ℓN (θ) =         log ρ(Xn+1 |Xn ; θ) + log ρ(X1 ).
                                   n=1

As N is usually large, the term ρ(X1 ) can be dropped without causing much error. The
transition pdf is, with the Euler-Bernstein approximation (see Liang, 2014),

                      ρ(Xn+1 = xn+1 |Xn = xn ) = [(2π)d det(BBT ∆t)]−1/2

                                                  6
                              1                       T       T
                         ×e− 2 (xn+1 −xn −F∆t) (BB ∆t)
                                                                    −1 (x
                                                                            n+1 −xn −F∆t)
                                                                                            ,

where F = f + AX. This results in a log likelihood functional
                                                                                            N
                                                                                                       !
                                    N    Y       ∆t                                 1       X
                                                                                                 2
              ℓN (f, A, B) = const − log   gii −                               Pd               Ri,n       ,
                                    2    i
                                                 2                                i=1 gii n=1

where
                                                  d
                                                  X
                      Ri,n = Ẋi,n − (fi +                aij Xj,n ),          i = 1, 2, ..., d
                                                   j=1


and Ẋi = {Ẋi,n } is the Euler forward differencing approximation of dX
                                                                       dt
                                                                          i
                                                                            :
                                                      Xi,n+k − Xi,n
                                            Ẋi,n =                 ,                                           (7)
                                                          k∆t
with k ≥ 1. Usually k = 1 should be used to ensure accuracy, but in some cases of
deterministic chaos and the sampling is at the highest resolution, one needs to choose k = 2.
Maximizing ℓN , it is easy to find that the maximizer (fˆ1 , â11 , ...â1d ) satisfies the following
algebraic equation:
                                                                    
                        1 X1 ... Xd                ˆ
                                                  f1            Ẋ   1
                      X X 2 ... X X   â                 X    Ẋ
                                                                         
                      1         1      1 d   11             1     1 
                      ..     ..   . ..  .         .
                                         ..   ..    = 
                                                                   .
                                                                                                 (8)
                                                                   .
                                                    
                      .       .                                  .
                                                                         
                                                                         
                       Xd X1 Xd ... Xd2          â1d         Xd Ẋ1
where the overline signifies sample mean. After some algebraic manipulations as that in
Liang (2014), this yields the maximum likelihood estimators (mle):
                                                             d
                                                        1 X
                                             â1i =             ∆ij Cj,d1                                       (9)
                                                      det C j=1
                                                   QN,1 ∆t
                                             ĝ11 =        ,                                                   (10)
                                                      N
                                                         d
                                             ˆ
                                                        X
                                             f1 = Ẋ1 −      â1i X̄i ,                                        (11)
                                                              i=1

where

                                        Cij = (Xi − X̄i )(Xj − X̄j ),                                          (12)
                                        Ci,dj = (Xi − X̄i )(Ẋj − Ẋj ),                                       (13)

are the sample covariances, ∆ij the cofactors of the matrix C = (Cij ), and
                               N
                                        "                     d
                                                                                  #2
                                        Ẋ1,n − (fˆ1 +
                               X                              X
                     QN,1 =                                         â1j Xj,n )
                                  n=1                         j=1


                                                          7
                              N
                                    "                  d
                                                                                  #2
                              X                        X
                          =         (Ẋ1,n − Ẋ1 ) −         â1i (Xi,n − X̄i )
                              n=1                      i=1
                                             d
                                             X                    d X
                                                                  X d
                          = N(Cd1,d1 − 2           â1i Cd1,i +             â1i â1j Cij .
                                             i=1                  i=1 j=1


   By (4), this yields an estimator of the information flow from X2 to X1 :
                                             d
                                        1    X              C12
                              T̂2→1 =      ·    ∆2j Cj,d1 ·     ,                             (14)
                                      det C j=1             C11

where Cj,d1 is the sample covariance between Xj and the derived series Ẋ1 as computed by
(7). When d = 2, it is easy to show that this is reduced to (5), the 2D estimator as obtained
in Liang (2014).
   Besides the estimator of information flow, in this study we actually have also estimated
the influence of a component on itself.
Theorem III.1 Under a linear assumption, the maximum likelihood estimator of dH1∗ /dt
is
                         \                 d
                          dH1∗
                               
                                     1     X
                                 =       ·    ∆1j Cj,d1 .                       (15)
                           dt      det C j=1

Proof. Since dH1∗ /dt = E( ∂F∂x1
                                1
                                  ), which is a11 in this case. The mle hence follows.
   This supplies information not seen in previous causality analysis along this line. As will
be clear soon, this helps identify self loops in a causal graph.
   Statistical significance test can be performed for (14) and (15). When N is large, they
                                                                                      2
                                                                                       C12
are approximately normally distributed around their true values with variances C        11
                                                                                           σ̂a212
and σ̂a211 , respectively, thanks to the mle property. Here σ̂a212 and σ̂a211 are determined as
follows (e.g., Garthwaite et al., 1995). Denote θ = (f1 , a11 , a12 , ..., a1d , b1 ). Compute
                                         N
                                    1 X ∂ 2 log ρ(Xn+1 |Xn ; θ̂)
                            Iij = −
                                    N n=1        ∂θi ∂θj

to form a (d + 2) × (d + 2) matrix I, namely, the Fisher information matrix. The inverse
(NI)−1 is the covariance matrix of θ̂, within which are σ̂a212 and σ̂a211 . Given a significance
level, the confidence interval can be found accordingly.
   From the above an algorithm for causal inference hence can be implemented:




                                               8
                       Algorithm: Quantitative causal inference
                       input: d time series
                       output: a DG G = (V, E), and IFs along edges
                       initialize G such that all vertexes are isolated;
                       set a significance level α;
                       foreach (i, j) ∈ V × V do
                            compute T̂i→j by (14);
                            if T̂i→j is significant at level α then
                                  add i → j to G;
                                  record T̂i→j ;
                            end
                       end
                       return G, together the IFs T̂i→j

IV. NORMALIZATION OF THE CAUSALITY AMONG MULTIVARIATE TIME
SERIES

   In many problems, just an assertion whether a causality exists is not enough; we need
to know how important it is. This raises an issue of normalization. The normalization of
information flow is by no means as trivial as it seemingly looks. Quite different from the
case as covariance vs. correlation coefficient, no such relation as Cauchy-Schwartz inequality
exists. Liang (2015) listed some difficulties in the problem, and so far this is still an arena
of research. Hereafter we follow Liang (2015) to propose the normalizer for (14).
   The basic idea is that the normalizer for T2→1 should be related to dH1 /dt, as the former
is by derivation a part of the contribution to the latter. However, dH1 /dt itself cannot be
the normalizer, since many terms tend to cancel; sometimes dH1 /dt may even completely
vanish, just as in the Hénon map case. We now write out the estimator of dH1 /dt and see
how the problem can be fixed.
   By Liang (2016), the time rate of change of the marginal entropy of X1 is

                                                             ∂ 2 log ρ1
                                                                     
                      dH1             ∂ log ρ1      1
                           = −E F1               − E g11                  .                (16)
                       dt                ∂x1        2           ∂x21

In this linear case,
                                   d
                                                     !
                                                               ∂ 2 log ρ1
                                                                         
                   dH1             X        ∂ log ρ1     1
                       = −E          a1j Xj            − E g11
                    dt           j=1
                                              ∂x1        2        ∂x21
                                                    !
                                X1 − µ 1 X              1 g11
                         = E                 a1j Xj +
                                  σ11     j
                                                        2 σ11
                                   d
                                   X              1 g11
                         = a11 +         Tj→1 +         .                                 (17)
                                   j=2
                                                  2 σ11

The first term is dH1∗ /dt, i.e., the contribution from itself, and the last term is the effect
of noise, written dH1noise /dt. The remaining parts are the information flows to X1 , just as


                                                  9
expected. We may hence propose a normalizer as follows:
                                             d
                                     dH1∗   X             dH1noise
                                  Z≡      +     |Tj→1 | +          .                                  (18)
                                      dt    j=2
                                                            dt

And hence the normalized information flow from X2 to X1 is:
                                                             T2→1
                                                   τ2→1 =         .                                   (19)
                                                              Z
Clearly, τ2→1 lies on [−1, 1]. So, when |τ2→1 | is 100%, X2 has the maximal impact on X1 .
                  noise
   Note that dH         = g11 /(2σ11 ), where g11 = dj=1 b21j is always positive. That is to say,
                                                    P
               dt 1
noise always contributes to increase the marginal entropy of X1 , agreeing with our common
sense. Obviously, this term is related to the noise-to-signal ratio.
   By the results in section III, Z can be estimated as
                                  \         d           \
                                   dH1∗                  dH1noise
                                           X                     
                             Ẑ =         +     T̂j→1 +             .                                 (20)
                                    dt      j=2
                                                           dt

          \
           noise
                                              \    
           dH1                                  dH1∗
where        dt
                     = 12 Cĝ11
                             11
                                , and ĝ11 ,     dt
                                                         and T̂2→1 are evaluated using (10), (15) and (14),
respectively.


V.     APPLICATION TO CAUSAL GRAPH RECONSTRUCTION

     A.    A noisy causal network from autoregressive processes

     Consider the series generated from an d-dimensional vector autoregressive (VAR) process:

                                  X(n + 1) = α + AX(n) + Be(n + 1)                                    (21)

where X = (X1 , ..., Xd )T , A = (aij )d×d , e = (e1 , ..., ed )T , B is a diagonal matrix with
diagonal entries bii , i = 1, ..., d. Here the errors ei ∼ N(0, 1) are independent, and bi are the
amplitudes of stochastic perturbation. Let

                                       0   0 −0.6 0 0   0
                                                          
                                     −0.5 0  0   0 0 0.8 
                                     0 0.7 0     0 0   0 
                                                          
                                  A=                      ,
                                     0    0  0 0.7 0.4 0 
                                     0    0  0 0.2 0 0.7 
                                       0   0  0   0 0 −0.5
                                  α = (0.1, 0.7, 0.5, 0.2, 0.8, 0.3)T ,

The formed network is as shown in Fig. 1a. So by design we have two directed cycles
(X1 ,X2 ,X3 ) and (X4 ,X5 ). The former is of length 3, while the latter are parallel edges. These
cycles are driven by a common cause or confounder X6 . Since no diagonal entries of A is 1,
all nodes are self loops (trivial cycles of length 1). The resulting autocorrelation is believed

                                                           10
                           (a)
                                                             X6




                              X000000000
                               111111111X 2                               5 X
                                  11111111
                                  00000000                               1
                                                                         0
                                                                         1
                                                                         0
                               1
                                         1
                                         0
                                  11111111
                                  00000000                               0
                                                                         1
                                                                         1
                                                                         0
                                         1
                                         0
                                  00000000
                                  11111111                               0
                                                                         1
                                                                         1
                                                                         0
                                         1
                                         0
                                  00000000
                                  11111111                               0
                                                                         1
                                                                         0
                                                                         1
                                         1
                                         0
                                  11111111
                                  00000000                               0
                                                                         1
                                                                         0
                                                                         1
                                         0
                                         1
                                  00000000
                                  11111111                               0
                                                                         1
                                                                         0
                                                                         1
                                         1
                                         0
                                  11111111
                                  00000000                               1
                                                                         0
                                                                         1
                                                                         0
                                         1
                                         0
                                  00000000
                                  11111111                               1
                                                                         0
                                                                         0
                                                                         1
                                         0
                                         1
                                  11111111
                                  00000000                               1
                                                                         0
                                                                         0
                                                                         1
                                         1
                                         0
                                  00000000
                                  11111111                               1
                                                                         0
                                                                         1
                                                                         0
                                         1
                                         0
                                  11111111
                                  00000000                               1
                                                                         0
                                                                         0
                                                                         1
                                         1
                                         0
                                  11111111
                                  00000000                               1
                                                                         0
                                                                         1
                                                                         0
                                         1
                                         0
                                  00000000
                                  11111111                               1
                                                                         0
                                                                         1
                                                                         0
                                         1
                                         0
                                  11111111
                                  00000000                               1
                                                                         0
                                                                         1
                                                                         0
                                         1
                                         0
                                  11111111
                                  00000000                               0
                                                                         1
                                                                         1
                                                                         0
                                              X3                            X4



                            (b)                              X6


                                                      0.19        0.19




                             X 1 00000000
                                 11111111
                                     0.01
                                         X2                                 X5
                                 00000000
                                 11111111                                    1
                                                                             0
                                                                             0
                                                                             1
                                 00000000
                                 11111111 0
                                          1                                 1
                                                                            0
                                 00000000
                                 11111111 0
                                          1                                 10
                                                                            0
                                                                            1
                                                                            0
                                                                             1
                                                                             1
                                                                             0
                                 11111111
                                 00000000 0
                                          1
                                          0
                                          1                                 1
                                                                            01
                                                                             0
                                 00000000
                                 11111111                                   0
                                                                            10
                                                                             1
                                 11111111 0
                                 00000000 1                                 1
                                                                            01
                                                                             0




                                                                     0.04
                                 11111111
                                 00000000 0
                                          1                                  0
                                                                             1
                                               0.09




                                          1
                                          0                                 0
                                                                            1




                                                                                0.05
                                 00000000
                                 11111111
                                 00000000
                                 11111111 0
                                          1                                 00
                                                                             1
                                                                            10
                                   0.04
                                 00000000
                                 11111111 0
                                          1                                 1
                                                                            01
                                                                             0
                                 00000000
                                 11111111 0
                                          1                                 0
                                                                            11
                                                                             0
                                                                             1
                                 11111111
                                 00000000 1
                                          0                                 1
                                                                            0
                                                                            10
                                                                            01
                                 11111111 0
                                 00000000 1
                                          1
                                          0                                 1
                                                                            01
                                                                             0
                                 11111111
                                 00000000
                                 11111111 0
                                 00000000 1                                 10
                                                                            01
                                             X3                             X4




Figure 1: (a) A schematic of the directed network generated with the vector autoregressive processes
(21). (b) The directed graph reconstructed from the six time series. Overlaid numbers are the
respective significant information flows (in nats per time step); also overlaid are the inferred self
loops or trivial cycles of length 1 (in light blue).



to be a challenge in causal inferences for some techniques. This and the confoundingness of
X6 , have been two major issues for many causal inference methods.
   First consider the case bii = 1. Accordingly six series of 10000 steps are generated
(randomly initialized). By computation the information flow rates are (only absolute values
are shown), if arranged in a matrix form such that the (i, j)th entry indicates |Ti→j |, then
the absolute information flow rates are
                             \
                                                               
                                  0.01 0.00 0.00 0.00 0.00
                         0.00
                                  \     0.09 0.00 0.00 0.00   
                         0.05 0.00
                                          \   0.00 0.00 0.00  ,
                         0.00 0.00 0.00
                                               \    0.04  0.00 
                                                                
                         0.00 0.00 0.00 0.05          \ 0.00 
                           0.00 0.19 0.00 0.00 0.18 \
So the only significant information flows are T1→2 , T2→3 , T3→1 , T4→5 , T5→4 , T6→2 , T6→5 , as
indicated in Fig. 1b. (At a 90% confidence level the maximal error is 0.005, so all these values
are significant.) This is precisely the same as designed. So the causal graph is accurately
reconstructed. Also by (15) |dH1∗ /dt| , ..., |dH6∗ /dt| can be computed. They are: 1.00 ± 0.01,
1.01 ± 0.01, 1.01 ± 0.01, 0.30 ± 0.01, 1.00 ± 0.01, 1.49 ± 0.02, where the errors at a 90%

                                                  11
confidence level are shown. So here all the nodes are self loops (trivial cycles of length 1).
    It should be particularly pointed out that the confoundingness of X6 does not make an
issue here. As shown in Fig. 1, there is no significant information flow between X2 and X5 ;
in other words, they are not directly causal to each other. Nor are X3 and X4 . This is
actually not a surprise; it is a corollary of the principle of nil causality, as proved before (see
Theorem II.2). Considering the difficulty of this problem, the performance of this concise
formula (14) is remarkable.
    The above information flows can be normalized to understand the impact of one unit
on another. For example, |τ6→2 | = 13.2%, |τ6→5 = 12.5%. For another example, in the
cycle (X4 , X5 ), the relative information flows are τ4→5 = 2.4%, τ5→4 = 8.8%, in contrast
to the almost identical absolute information flows. This is understandable: though T5→4 is
comparable to T4→5 , the parts contributing to dH5 /dt are different from that to dH4 /dt, and
thus they may have different weights.
    Now consider an extreme case when the signals are buried within heavy noise. Let
bii = 100, and repeat the above steps. The results are, remarkably, almost the same. So the
formula (14) is very robust in the presence of noise.
    If the time series is short, the performance is still satisfactory. For example, if it has only
500 data points, the above case with heavy noise (bii = 100) results in the following matrix
of information flow rates:
                                \
                                                                    
                                     0.02 0.00 0.00 0.00 0.00
                            0.00
                                     \    0.13 0.00 0.01 0.01      
                            0.04 0.01
                                            \    0.00 0.00 0.00    ,
                            0.00 0.00 0.00
                                                  \      0.07  0.00 
                                                                     
                            0.01 0.00 0.00 0.06           \ 0.00 
                              0.00 0.17 0.00 0.00 0.19 \

with the corresponding errors at the 90% confidence level being:

                              \ 0.00 0.00 0.00 0.00 0.01
                                                        
                           0.00  \ 0.01 0.00 0.02 0.02 
                           0.00 0.01 \ 0.00 0.01 0.01 
                                                        
                                                         .
                           0.00 0.00 0.01 \ 0.01 0.00 
                          
                           0.01 0.00 0.00 0.06 \ 0.02 
                            0.01 0.01 0.01 0.00 0.02 \

So the significant (at the 90% level) information flows are still those as highlighted.


   B.   A network of nearly synchronized chaotic series

   Now consider the following causal graph made of Rössler oscillators X, Y and Z, where
X is a confounder. A Rössler oscillator has three components, so the system actually has a
dimension 9.




                                               12
                                                    X⑦
                                                       ❅
                                                        ❅
                                          ✠              ❅❘
                                                          ❅
                                        Y⑦                     Z⑦


  We use for this purpose the coupled system investigated by Paluš et al. (2018) and Paluš
and Vejmelka (2007). The 9 series are generated through the following Rössler systems
                      
                       dx1 /dt = −ω1 x2 (t) − x3 (t),
                        dx2 /dt = ω1 x1 (t) + 0.15x2 (t),
                       dx /dt = 0.2 + x (t)[x (t) − 10],
                           3                3     1
                      
                       dy1/dt = −ω2 y2 (t) − y3 (t) + ǫ[x1 (t) − y1 (t)],
                        dy2/dt = ω2 y1 (t) + 0.15y2(t),
                       dy /dt = 0.2 + y (t)[y (t) − 10],
                           3               3     1
                      
                       dz1 /dt = −ω3 z2 (t) − z3 (t) + ǫ[x1 (t) − z1 (t)],
                        dz2 /dt = ω3 z1 (t) + 0.15z2 (t),
                        dz3 /dt = 0.2 + z3 (t)[z1 (t) − 10].
                      


Clearly, the first is the driving or “master” system, while the latter two are slaves which are
not directly connected. We hence use them to define X, Y and Z. This system is exactly the
same as the one studied in Paluš et al. (2018), except for the addition of another subsystem,
Z. The parameters are also chosen the same as theirs: ω1 = 1.015 and ω2 = 0.985, but with
an additional one: ω3 = 0.95. As can be seen, X is coupled with Y and Z through the first
component, and the coupling is one-way, i.e., from X to Y and from X to Z. The coupling
parameter ǫ is left open for tuning.
   The above equations are differenced and the system is solved using the second order
Runge-Kutta scheme with a time stepsize ∆t = 0.001. Initialized with random numbers,
the state is integrated forward for N = 50000 steps (t = 50). Discard the initial 10000 steps
and form the 9 time series with 40000 data points.
   The oscillators are highly chaotic. As ǫ increases, the three oscillators gradually become
in pace. They become almost synchronized after ǫ > 0.15. Shown in Fig. 2d is an episode
of the synchronization for ǫ = 0.25.
   We now apply (14) to compute the information flows among X, Y , and Z. Since this is
deterministic chaos problem, choose k = 2 in (7) and (14). Following Paluš et al. (2018),
the series {x1 (n)}, {y1 (n)}, and {z1 (n)} are used to represent the three oscillators. Shown
in Figs. 2a, b, and c are dependencies of the computed information flows on the coupling
strength ǫ. Clearly, among the six information flows, only TX→Y and TX→Z are significant,
indicating (1) that the causal relation between X and Y is unidirectionally from X to Y ,
(2) that the causality between X and Z is also one-way, i.e., from X to Z, and, mostly
importantly (3) that no direct causality exists between Y and Z, although they are highly
correlated (c.f. Fig. 2d). So here the confoundingness is not at all an issue.
   After ǫ exceeds 0.15, the systems begin to synchronize (see Paluš et al., 2018), and it is
impossible to infer the causal relation using traditional methods. This is understandable,

                                             13
as the series gradually approach to one series. Here, however, even with ǫ > 0.15, i.e.,
even after the series are almost synchronized, in this framework the inference still performs
remarkably well, as clearly seen in Figs. 2a, b, and c. This attests to the power of the
information flow-based causal inference technique, which is however concise and very easy
to implement.

                                                             (a)                                                                          (b)
                                0.25                                                                        0.25
                                           |T      |: blue solid                                                       |T      |: blue solid
                                             x→y                                                                            x→z
             IF between X & Y




                                                                                         IF between X & Z
                                 0.2                                                                         0.2
                                           |T      |: red dashed                                                       |T      |: red dashed
                                             y→x                                                                            z→x
                                0.15                                                                        0.15

                                 0.1                                                                         0.1

                                0.05                                                                        0.05

                                  0                                                                           0
                                       0        0.05   0.1         0.15   0.2   0.25                               0         0.05   0.1         0.15   0.2   0.25
                                                              ε                                                                            ε
                                                             (c)                                                                          (d)
                                0.25
                                           |Ty→z|: blue solid                                                20 x : red
                                                                                                                        1
                                                                                                             15 y1: blue
             IF between Y & Z




                                 0.2
                                           |T      |: red dashed                                                       z1: black
                                             z→y                                                             10
                                                                                               1
                                                                                       x ,y ,z



                                0.15
                                                                                                              5
                                                                                               1




                                 0.1                                                                          0
                                                                                               1




                                                                                                             −5
                                0.05
                                                                                                            −10

                                  0                                                                         −15
                                       0        0.05   0.1         0.15   0.2   0.25                           25            30     35          40     45    50
                                                             ε                                                                             t

Figure 2: The information flows among the oscillators X, Y , and Z (in nats/unit time) versus the
coupling strength ǫ: (a) |TX→Y | (blue) and |TY →X | (red); (b) |TX→Z | (blue) and |TZ→X | (red);
(c) |TY →Z | (blue) and |TY →Z | (red). (d) The series of X1 , Y1 , and Z1 on a time interval when the
coupling parameter ǫ = 0.25.




VI.   CONCLUSIONS

   Recent years have seen a surge of interest in causality analysis. This study introduced a
line of work starting some 16 years ago which however goes almost unnoticed, and imple-
mented the state-of-the-art theory (Liang, 2016) into a handy algorithm. Particularly, this
study extended the bivariate time series analysis of Liang (2014) to the long-due multivariate
time series causal inference.
   In a multivariate stochastic system, the information flow from one component to another
proves to be (2). When only time series are available, it can be estimated using (14) under
a linear assumption. Ideally if it is not zero, then there exists causality between the com-
ponents, but practically statistical significance need to be tested. These have been easily
implemented as an algorithm for use.


                                                                                  14
   More than just finding the information flows, hence the causalities, among the units, as
did in Liang (2014), we have also estimated the influence of a unit to itself. This results in
the autocorrelation which becomes an issue in some causal inferences. The consequence is
that, in a causal graph, those nodes which are self loops (cycles of length 1) can be easily
identified. Also different from previous studies, in a unified treatment, the role of noise
has been quantified along with the causality analysis. This quantity has an easy physical
interpretation, namely, the ratio of noise to signal. Besides, the obtained causalities can be
normalized to measure the importance of the respective parental nodes. It is shown that
the normalizer should be the sum of the absolute values of the Lyapunov exponent, the
information flows, and the noise contribution.
   The above very concise and transparent formulas have been applied to examine two
problems in extreme situations: (1) a network of multivariate processes with heavy noise
(stochastic perturbation amplitude 100 times the signal amplitude); (2) a network with
nearly synchronized oscillators. And, besides, confounding processes exist in both causal
graphs. Case (1) is made of vector autoregressive processes. By applying the algorithm,
the causal graph is accurately recovered in a very easy and efficient way. Particularly, the
confounding processes have be accurately clarified.
   In case (2), the network is formed with three chaotic Rössler oscillators. When the
coupling coefficient exceeds a threshold, synchronization occurs. However, even with the
almost completely synchronized time series, the information flow approach still performs
remarkably well, with the causalities accurately inferred, and the causal graph accurately
reconstructed. Particularly, the one-way causalities between the master-slave systems have
been recovered. Moreover, it is accurately shown that the two highly correlated, almost
identical series due to the confounder are not causally linked.
   It should be mentioned that, in arriving at the concise formula for causal inference, an
assumption of linearity has been invoked. For some nonlinear problems the inference may not
be precisely as expected. For example, in Figs. 2a and b, the red dashed lines are supposed
to be zero, but here they are not. But qualitatively the inference is still good, as the one-way
causality is clearly seen. Such success has already been evidenced in the bivariate case of
Liang (2014), where a highly nonlinear problem defying classical approaches is examined.
But, nonetheless, the power of the information flow-based causality analysis won’t be fully
realized until the linear assumption is relaxed. To generalize to the fully nonlinear case is
hence the goal of the next step.


   Acknowledgments

  This research is partially supported by National Science Foundation of China under grant
number 41975064.



 [1] Amigó, J.M., R. Dale, P. Tempesta (2020). A generalized permutation entropy for random
     processes. arXiv:2003.13728v1
 [2] Berkeley, G. (1710). A Treatise Concerning the Principles of Human Knowledge. Aaron
     Rhames, Dublin.
 [3] Dempster, A.P. (1990). Causality and statistics. J. Stat. Plan. Infer., 25, 261-278.


                                             15
 [4] Garthwaite, P.H., I.T. Jolliffe, and B. Jones (1995). Statistical Inference. Prentice-Hall, Hert-
     fordshire, UK.
 [5] Granger, C.W.J. (1969). Investigating causal relations by econometric models and cross-
     spectral methods. Econometrica, 37(3), 424-438.
 [6] Hahs, D.W., and S.D. Pethel (2011). Distinguishing anticipation from causality: Anticipatory
     bias in the estimation of information flow. Phys. Rev. Lett., 107, 12870.
 [7] Hristopulos, D.T., A. Babul, S. Babul, L.R. Brucar, and N. Virji-Babul (2019). Dirupted
     information flow in resting-state in adolescents with sports related concussion. Frontiers in
     Human Neuroscience, 13, 419. DOI: 10.3389/fnhum.2019.00419.
 [8] Janzing, D., J. Mooij, K. Zhang, J. Lemeire, J. Zscheischler, P. Daniusis, B. Steudel, and
     B. Schölkopf (2012). Information-geometric approach to inferring causal dierctions. Artifical
     Intelligence 182, pp. 1-31.
 [9] Lasota, A., M.C. Mackey (1994). Chaos, Fractals, and Noise: Stochastic Aspects of Dynamics.
     Springer, New York.
[10] Liang, X.S., R. Kleeman (2005). Information transfer between dynamical system components.
     Phys. Rev. Lett., 95(24), 244101.
[11] Liang, X.S. (2008). Information flow within stochastic dynamical systems. Phys. Rev. E, 78,
     031113.
[12] Liang, X.S. (2014). Unraveling the cause-effect relation between time series. Phys. Rev. E, 90,
     052150.
[13] Liang, X.S. (2015) Normalizing the causality between time series. Phys. Rev. E, 92, 022126.
[14] Liang, X.S. (2016). Information flow and causality as rigorous notions ab initio. Phys. Rev.
     E, 94, 052201.
[15] Liang, X.S. (2018). Information flow with respect to relative entropy. Chaos, 28, 075311.
[16] Maathuis, M.H., D. Colombo, M. Kalisch, and P. Bühlmann (2009). Estimating high-
     dimensional intervention effects from observation data. The Annals of Statistics. 37(6A):3133-
     3164.
[17] Maathuis, M.H., D. Colombo, M. Kalisch and P. B uhlmann (2010). Predicing causal effects
     in large-scale systems from observational data. Nature Methods, 7, 247-248.
[18] Mogensen, S.W., D. Malinksky, and N.R. Hansen (2018). Causal learning for partially ob-
     served stochastic dynamical systems. In: Proceedings of the 34th Conference on Uncertainty
     in Artificial Intelligence (UAI).
[19] Mooij, J.M., D. Janzing, T. Heskes, and B. Schölkopf (2013). From ordinary differential equa-
     tions to structural causal models.: The deterministic case. In Proceedings of the 29th Annual
     Conference on Uncertainty in Artificial Intelligence, pp. 440-448.
[20] Paluš, M., and M. Vejmlka (2007). Directionality of coupling from bivariate time series: How
     to avoid false causalities and missed connections. Phys. Rev. E, 75, 056211.
[21] Paluš, M., A. Krakovská, J. Jakubfk, and M. Chvosteková (2018). Causality, dynamical sys-
     tems and the arrow of time. Chaos, 28, 075307.
[22] Peters, J., D. Janzing, and B. Schölkopf (2017). Elements of Causal Inference: Foundations
     and Learning Algorithms. The MIT Press, Cambridge, Massachusetts.
[23] R/oysland, K. (2012). Counterfactual analyses with graphical models based on local indepen-
     dence. The Annals of Statistics, 40(4):2162-2194.
[24] Pompe, B., and J. Runge (2011). Momentary information transfer as a coupling measure of
     time series. Phys. Rev. E, 83, 051122.
[25] Vannitsem, S., Q. Dalalden, H. Goosse (2019). Testing for dynamical dependence


                                                16
     — Application to the surface mass balance over Antarctica. Geophys. Res. Lett.,
     DOI:10.1029/2019GL084329.
[26] P. Spirtes and C. Glymour, 1991: An algorithm for fast recovery of sparse causal graphs. Soc.
     Sci. Comput. Rev. 9(1), 62-72.
[27] T. Schreiber, 2000: Measuring information transfer. Phys. Rev. Lett. 85, 461.
[28] Stips, A., D. Macias, C. Coughlan, E. Garcia-Gorriz, and X.S. Liang (2016). On the causal
     structure between CO2 and global temperature. Sci. Rep. 6:21691.
[29] Sugihara, G., et al. (2012). Detecting causality in complex ecosystems. Science, 338, 496-500.
[30] Sun, J., and E. Bollt (2014). Causation entropy identifies indirect influences, dominance of
     neighbors, and anticipatory couplings. Physica D, 267, 49-57.
[31] Zhang, J., and P. Spirtes (2008). Detection of unfaithfulness and robustcausal inference. Minds
     & Machines, 18, 239-271.




                                               17
