# Full-text extraction

- Title: A Liang-Kleeman Causality Analysis Based on Linear Inverse Modeling
- Year: 2025
- DOI: https://doi.org/10.1103/5cd4-5cb4
- PDF source: https://arxiv.org/pdf/2409.06797
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                            A Liang-Kleeman Causality Analysis based on Linear Inverse
                                                                   Modeling
                                                                                                   Justin Liena)
                                                                                      Mathematical Institute, Tohoku University.
                                                                         6-3 Aramaki Aza, Aoba, Aoba Ward, Sendai, Miyagi, 980-0845, Japan.
                                                                                a) Corresponding author: lien.justin.t8@dc.tohoku.ac.jp
arXiv:2409.06797v1 [math.NA] 10 Sep 2024




                                           Abstract. Causality analysis is a powerful tool for determining cause-and-effect relationships between variables in a system
                                           by quantifying the influence of one variable on another. Despite significant advancements in the field, many existing studies
                                           are constrained by their focus on unidirectional causality or Gaussian external forcing, limiting their applicability to complex real-
                                           world problems. This study proposes a novel data-driven approach to causality analysis for complex stochastic differential systems,
                                           integrating the concepts of Liang-Kleeman information flow and linear inverse modeling. Our method models environmental noise
                                           as either memoryless Gaussian white noise or memory-retaining Ornstein-Uhlenbeck colored noise, and allows for self and mutual
                                           causality, providing a more realistic representation and interpretation of the underlying system. Moreover, this LIM-based approach
                                           can identify the individual contribution of dynamics and correlation to causality. We apply this approach to re-examine the causal
                                           relationships between the El Niño-Southern Oscillation (ENSO) and the Indian Ocean Dipole (IOD), two major climate phenomena
                                           that significantly influence global climate patterns. In general, regardless of the type of noise used, the causality between ENSO
                                           and IOD is mutual but asymmetric, with the causality map reflecting an ENSO-like pattern consistent with previous studies.
                                           Notably, in the case of colored noise, the noise memory map reveals a hotspot in the Niño 3 region, which is further related to the
                                           information flow. This suggests that our approach offers a more comprehensive framework and provides deeper insights into the
                                           causal inference of global climate systems.



                                                                                                INTRODUCTION

                                           Understanding causal relationships is fundamental to controlling the behavior of complex dynamical systems and
                                           developing effective solutions to intricate real-world problems [1]. Rigorous causality analysis allows us to move
                                           beyond mere descriptions of phenomena towards a deeper, explanatory understanding of the underlying processes
                                           driving observed outcomes. Applications of causality analysis span diverse fields, from climate science to machine
                                           learning, enabling the optimization of business strategies and technological systems [2, 3]. Identifying and quantifying
                                           causal effects is indispensable for advancing scientific knowledge and driving impactful innovation.
                                              While substantial progress has been made in causal discovery, many existing techniques struggle to handle com-
                                           plex systems. A prominent example is the Direct LiNGAM, which effectively identifies causal structures in static
                                           systems subjected to identically and independently distributed non-Gaussian noise with unidirectional causality [4,
                                           5]. However, real-world phenomena are often characterized by complex dynamics where feedback loops and bidirec-
                                           tional or mutual causal interactions among variables are ubiquitous. Such temporal characteristics and intricate causal
                                           dependencies cannot be fully captured by the Direct LiNGAM framework.
                                              To address these limitations, several studies have explored Liang-Kleeman information flow theory, which provides
                                           a quantitative measure of directed information transfer and offers a more dynamic perspective on causality [6, 7, 8].
                                           Building upon this foundation, Liang proposed an empirical method that identifies causal relations among variables
                                           sampled from a stochastic dynamical system [9, 10]. Contrary to the "static one-way causality" assumed by Direct
                                           LiNGAM, Liang’s approach includes the presence of self and mutual causality, and captures the dynamical interac-
                                           tions between variables, where some variables may stabilize or excite others. However, it models the random forcing
                                           with Gaussian white noise, which lacks memory and temporal dependency. While this assumption simplifies the
                                           mathematical modeling, it may not accurately represent many real-world systems where the random forcing exhibits
                                           temporal correlations.
                                              Colored noise, a type of temporally correlated noise with an inherent memory, has gained attention in mathematical
                                           modeling as it can provide a more realistic representation of environmental noise [11, 12]. Linear Inverse Models
                                           (LIMs), a class of data-driven approaches that extract dynamical and random forcing information from observations,
                                           have been extended to allow for Gaussian white and Ornstein-Uhlenbeck (OU) colored noise [13, 14]. It has been
                                           shown that modeling environmental random forcing with colored noise can alter both deterministic dynamics and
                                           stochastic forcing, suggesting that the memory effect of the noise can also have significant implications for causal
                                           inference [11].
  In this paper, we propose a new method for causality analysis that accommodates both white and colored noise
by combining the concepts of information flow and LIMs. Our proposed method can determine causality in dynamic
systems, accounting for self and mutual interactions and the memory effect of the environmental noise. In addition, the
individual contribution from dynamics and correlation to causality can be identified and quantified. This generalization
provides a more comprehensive and realistic tool for causality analysis in a wide range of dynamical systems.


                                                  METHODOLOGY

We start with the general idea. Let’s suppose that the n-dimensional observation data is collected from

                                                    d
                                                       x = F(x,t, noise)                                                   (1)
                                                    dt
where F describes the complex system of interest. Generally speaking, while the external stochastic noise contin-
uously excites the state variables xi ’s, the deterministic dynamics act as a damping operator, dissipating energy and
drawing the variables back to equilibrium [14]. We aim to identify the causal inference between xi ’s, but the system
F is mathematically intractable in practice. Therefore, to extract the information of the underlying unknown system,
an equation-free perspective is taken by constructing a linear system to approximate Eq. (1):

                                                  d          p
                                                     x = Ax + 2Q · noise                                                   (2)
                                                  dt
where A is the dynamical matrix whose eigenvalues have negative real parts, and Q is the positively definite diffusion
matrix. Then the problem of identifying the causality is formulated as an inverse problem: given an observation time
series, find a suitable linear representation (2) whose causality estimates the causality of the underlying unknown
system (1).
   Previous studies in the inverse problem mostly model the environmental forcing as the memoryless normalized
white noise ξ while, in this study, the noise term is allowed to be OU colored noise η [13, 14]. This is the steady state
solution of the OU process dtd η = −1        1                                                                     T
                                      τ η + τ ξ whose temporal correlation is of an exponential shape: ⟨η(t)η(s) ⟩ =
 1 −|t−s|
     τ I, where I denotes the identity matrix and the bracket denotes the expectation. The parameter τ , called the
2τ e
noise correlation time, can be physically interpreted as the e-folding time of the noise temporal dependency. To avoid
confusion whenever necessary, we use the script ·w and ·c to distinguish the choice of the noise term. In the rest of this
section, we focus on the definition of causality and the construction of the linear representation (2) of the unknown
system (1).


                                        Liang-Kleeman information flows

The rate of information flowing from a component x j to another xi , denoted by T j→i (unit: nats/time), is defined to be
the change rate of the marginal (Shannon) entropy of xi , minus the same change rate but without the effect from x j to
the system [8]. With the information flow, the Liang-Kleeman causality is quantitatively defined: (1) x j is causal to
xi if and only if T j→i ̸= 0, and (2) the magnitude of the causality from x j to xi is measured by T j→i [10]. In general,
the information flow admits a closed form for any stochastical differential equation (SDE) with appropriate regularity
but it is considerably complicated and out of the scope of this study [9].
   For the linear system with white noise random forcing, Liang shows that the information flows T j→i from x j to xi
is given by

                                                                      Ci j
                                                       T j→i = Ai j        ,                                               (3)
                                                                      Cii

where C = ⟨x(·)x(·)T ⟩ is the covariance of the state variables [10]. Now the physical interpretation of information
flow and hence causality becomes clear. Without loss of generality, we may assume that xi > 0 at some moment. If
Ci j > 0 and Ai j > 0, then the x j is more likely to have the same sign as xi and the contribution from x j to xi turns out to
be positive, driving the xi away from the steady state and making it unstable. By considering all possible combinations
of signs, we can easily see that T j→i > 0 (< 0) means that x j excites (stabilizes) xi . We note that Eq. (3) is available
for self-causality Ti→i , which solely depends on the dynamics Aii .
   On the other hand, for the linear system with colored noise random forcing, the governing equation can be written
as the white-noise-driven augmented system
                                                      √               
                                          d x         A    2Qc x         1 0
                                                 = c                  +         ,                                       (4)
                                          dt η        0 − τ1 I η         τ ξ
                                                    |    {z     }
                                                            L

where L plays the role of augmented dynamics. We notice that the deterministic interaction among state variables xi ’s
remains unchanged. Therefore, Eq. (3) is still valid for the colored-noise case, and so is the physical interpretation of
the information flow.
   When the noise term is white, Liang used the maximum likelihood estimation to show that Eq. (3) can be expressed
as a function of the covariance function of the state variables and their derivative as follows,
                                                         1 n                Ci j
                                             T j→i =         ∑ ∆ jk Ck,di · Cii
                                                       det C k=1
                                                                                                                       (5)

where ∆ jk is the cofactor of C and Ck,di is the covariance between xk and ẋi [10]. Therefore, given observation data,
the information flows T j→i can be estimated by Eq. (5) in which ẋi can be computed by forward finite difference
scheme in practice. However, using Eq. (5) causes two major limitations. Firstly, the correlation-relevant information
among state variables is mixed, and it becomes difficult to identify their individual roles in the causality. Moreover,
in the case of colored noise, the covariance matrices of x (and its derivative) in Eq. (5) should be replaced by those
of [x; η], the concatenation of the state variables and colored noise. Therefore, Eq. (5) is infeasible for the inverse
problem since the colored noise is not observed in practice. To overcome these limitations, we employ the Colored-
LIM to estimate the linear dynamics Ac without requiring direct observation of η so that a direct application of Eq.
(3) is feasible.


                                             Linear inverse modeling

The linear inverse model is a class of data-driven methods that extracts the dynamic and stochastic relevant information
from observation data. More precisely, in the LIM framework, the unknown complex system (1) is approximated by
the linear system (2). The dynamical matrix A of such a linear system is encoded in the correlation function of the
state variables, and the diffusion matrix Q, though not necessary for this study, follows from the fluctuation-dissipation
relations [13, 14]. In this study, we focus on White-LIM and Colored-LIM, in which the random forcing is modeled
by Gaussian white noise and OU colored noise, respectively.


                                                       White-LIM

It is well-known that the white-noise-driven linear system is an OU process whose correlation function Kw = ⟨x(· +
s)x(·)T ⟩ is an exponential function,

                                                       Kw (s) = esAw C                                                 (6)

for s ≥ 0 [14]. The exponent of Kw is the linear dynamics that can be obtained by using the matrix logarithm

                                                           log(Kw (ρ)C−1 )
                                               Aw (ρ) =                                                                (7)
                                                                 ρ
for any arbitrary time-lag ρ. In practice, due to the sampling size and model uncertainty (e.g., non-linearity, non-
Gaussianity), the estimated dynamics Aw may be unstable (i.e., Aw strongly depend on ρ), and the choice of ρ may
differ from studies [15]. Indeed, we observe that Eq. (7) is equivalent to finding an exponential function that passes
through the correlation function at 0-lag and ρ-lag. Hence, the instability may be due to the insufficient data used to
determine Aw .
                                                        Colored-LIM

For a colored-noise-driven linear system, the correlation function Kc reads, for s ≥ 0,
                                                                     Z s
                                                                              ′      1
                                     Kc (s) = e   sAc
                                                        C+e    sAc
                                                                           e−s (Ac + τ ) ds′ Qc BT                    (8)
                                                                      0

where B = (1 − τ Ac )−1 accounting for the noise memory. The first term is the exponential decay due to the deter-
ministic dynamics while the second term involves the contribution from the state-dependent colored noise. As Eq.
(8) is no longer an exponential function, Eq. (7) is infeasible. Nevertheless, Lien et al. show that with τ treated as a
hyperparameter, the higher derivatives of Kc encode the linear dynamics Ac which can be obtained by solving linear
equations [13]. This simplifies the problem and speeds up the computation time but a robust algorithm for numerical
differentiation is required. Though in the real-world application, colored noise may be a better representation of the
environmental noise, the derivative-based approach sacrifices the degree of freedom for τ .


                                 LIM-based algorithm for causal analysis

In this study, we propose a LIM-based approach for Liang-Kleeman causality analysis by utilizing the ideas of White-
LIM and Colored-LIM to obtain the linear dynamics A and then applying Eq. (3) to estimate the information flow.
Here, we merely focus on the estimation of A.
   Given observation data, let Cobs and Kobs denote the observed covariance and correlation function, respectively. To
avoid the numerical instability in the White-LIM and the treatment of τ as a hyperparameter in the Colored-LIM, we
resort to a minimization method to compute linear dynamics:

                                            Aw = arg min (Kobs − Kw )|[0,l] w,F                                       (9)
                                                         A

for the white-noise case and

                                        (Ac , τ ) = arg min (Kobs − Kc )|[0,l] w,F                                   (10)
                                                         A,τ

for the colored-noise case, under the constraint that Kw (0) = Kc (0) = Cobs , where l is the window length that specifies
the minimization window, ∥·∥w,F denotes the weighted Frobenius norm, and Kw and Kc are the correlation functions
determined by the running variables A (and τ), Eqs. (6) and (8). In the White-LIM framework, the minimization
process takes several Kobs (s) with s > 0 into account instead of simply choosing one of them, while in the Colored-
LIM framework, the noise correlation time is also a variable in the search space, opening the possibilities to study the
noise memory.
   The minimization process requires a proper initial guess for a robust result. Though Eq. (7) may not be stable,
it returns the linear dynamics A0 (ρ) which determines a correlation function that at least passes two points of Kobs .
As a result, A0 (ρ) for different ρ’s are educated initial guesses. As for the initial guess for τ in the Colored-LIM
framework, since in the limit τ → 0, the colored noise formally approaches the white noise, we can start from a small
τ and then adjust it to optimize the minimization process.
   We remark that the White-LIM and Colored-LIM-based approaches explicitly quantify the contribution of dynam-
ics, which cannot be directly inferred by using Eq. (5). Moreover, though the LIM-based approaches use the same
formula (3) to estimate the information flow and hence the causal implication, the linear dynamics indeed depends
on the choice of noise, especially when the environmental noise is non-trivially temporally correlated. As a result,
they can lead to different information flows and causality in both sign and magnitude, even if applied to the same
observation data.


                                     A REAL-WORLD APPLICATION

We apply the LIM-based algorithm for causal analysis to study the causal relation between two major climate phenom-
ena the El Niño-Southern Oscillation (ENSO) and the Indian Ocean Dipole (IOD). ENSO is an interannual climate
phenomenon involved in the ocean-atmosphere interaction over the tropical Pacific Ocean [16]. It has been shown that
ENSO can influence local weather patterns, increasing disaster risks like droughts and floods in an extreme ENSO
event [16, 17]. Detecting extreme ENSO events requires observations from both the atmosphere and oceans, but the
average sea surface temperature (SST) over several regions of the tropical Pacific Ocean has been identified as being
important for monitoring such events. Examples include the Niño 3 region (150W-90W and from 5S-5N). The IOD,
on the other hand, is an irregular large-scale oscillation of SST and atmospheric circulation in the Idena Ocean [18].
Similar to ENSO, an extreme IOD event is linked to extreme weather events in Indian Ocean rim countries [19]. IOD
is commonly measured by the Dipole Mode Index (DMI), the SST difference between the western (50E-70E and
10S-10N) and the south-eastern equatorial Indian Ocean (90E-110E and 10S-0N). These two systems can interact
with each other, but the teleconnection is still unclear [20]. Understanding their interrelationship helps predict and
prepare for significant weather changes affecting agriculture, water resources, and economies globally [21].
   In the LIM framework, the state variables are representative of the studied climate phenomenon, where the deter-
ministic dynamics is often regarded as the oceanic systems or large-scale atmosphere-ocean systems, but the stochastic
noise may have a different physical meaning [22]. White noise, which is widely applied in most LIM applications, is
considered as atmospheric random events such as weather disturbances and precipitation [15]. Colored noise, on the
other hand, can be thought of as modeling the related climate or weather events such as Madden-Julian Oscillation
and westerly wind bursts, or the integrated effect of climate variables other than the state variables [12]. In this study,
we collect the DMI and Pacific SSTs data from NOAA Physical Sciences Laboratory [23, 24] to be the state variables.
To compare our results with those of Liang’s study, we use data from the same period (from 1958 to 2010) for the
following discussion. Following the convention in the climate science community, we remove the seasonal variation
of observation data and then apply a 3-month running average. The minimization window length l is set to be 4
months.
   Figure 1 shows the information flows between DMI and each grid point in the mid-Pacific ocean. Though slightly
different, the distribution of information flows for each method shows an El Niño-like pattern. It is clear that the
causality is mutual but asymmetric: Pacific SST tends to stabilize IOD while IDO excites Pacific SST. The similarity
between Liang’s method and our White-LIM-based approach is not surprising, as both approximate the underlying
system as a white-noise-driven linear process. However, we notice that the Colored-LIM-based results tend to reveal
a stronger information flow, especially over the Niño 3 region. In general, for fixed observation data, when the noise
memory τ is non-trivial, the external random forcing η is more likely to stay in the same sign over a period of time,
consistently driving the state variables x j ’s to the extreme. However, as the climate system mitigates the occurrence
of extreme events (corresponding to the fixed Cobs in the LIM framework), the damping force Ac must be stronger
to fight against the effect of memory noise. Consequently, the entry of Ac turns out to be more likely to be larger in
magnitude, and so is the information flow.
   Contrary to Liang’s method and the White-LIM-based algorithm, the Colored-LIM-based algorithm further reveals
the spatial distribution of noise memory τ . Figure 2 shows that the noise memory over the Niño 3 region reaches
more than 2 months, approximately 50% longer than the rest of the mid-Pacific ocean. To understand the implication,
we focus on the observed correlation functions Kobs and the theoretical correlation function Kw and Kc determined by
Eqs. (6), (8), (9), and (10) at two locations: Loc. 1 (146E and 16N) away from the Niño 3 region and Loc. 2 (124W
and 0N) at which the maximum τ is achieved.
   First, the observed auto-correlations for DMI and SSTs (i.e., the diagonal entries of Kobs ) at both locations are
concave downward at the origin. This is a characteristic of temporally correlated random forcing in the linearized
framework, since the noise memory makes the trajectory of the state variables more sticky, making K′′ (0) negatively
definite [13]. In contrast, the memoryless white noise causes a more oscillating trajectory and hence, a concave
upward feature at the origin. Moreover, at Loc. 1, the observed auto-correlation of SST is relatively small, and cross-
correlation (i.e., the off-diagonal entries of Kobs ) is nearly constant and negligible, meaning that the state variables can
be considered as decoupled, implying that the 1-month noise memory is internal for each ocean. At Loc. 2, the auto-
correlation for SST is significantly larger, reflecting the strong climate variability of ENSO, and the time-dependent
cross-correlation is more prominent than that at Loc. 1, suggesting a stronger correlation between these two climate
phenomena. Within the Colored-LIM framework, whenever the noise memory is long, the damping force must be
stronger, due to the continuous excitation of the colored noise as mentioned before. Besides, when a stronger time-
dependent cross-correlation between variables exists in the system, their interaction or coupling (i.e., the off-diagonal
elements of Ac ) is more likely to be stronger in response to fit the observation. As a result, the information flows over
the Niño 3 region is comparably significant to other parts of the Mid-Pacific Ocean, suggesting a direct connection
among noise memory, dynamics, cross-correlation, and causality.
   Finally, we reconstruct the white-noise-driven linear system described in Eq. (2) implicitly used in Liang’s method,
and show its correlation functions KL in Figure 2. While it is evident that KL aligns well with observations for small
FIGURE 1. The distribution of information flows (unit: nats/months) between DMI and Pacific SSTs computed by LIM-based
methods, and Liang’s method. The information flows larger than 0.02 (smaller than −0.02) are masked out to 0.02 (-0.02). The
block box specifies the Niño 3 region.


lags s ≤ 2 months, the deviation rapidly increases for larger lags. This occurs because Eq. (5) only considers the
covariance of neighboring observations (i.e., 0-lag and ∆t-lag, where ∆t denotes the sampling interval). In contrast,
the theoretical correlations Kw and Kc derived from the LIM-based methods show strong alignment with the observed
data, owing to the minimization technique employed. Although it remains challenging to identify the optimal linear
system (2) that best represents the complex earth system, it is understandable that the three methods yield slightly
different patterns for Pacific-SST-to-IOD causality. Nevertheless, these different models can offer valuable and distinct
insights into the same problem.


                                          CONCLUDING REMARKS

In this study, we have proposed a LIM-based approach to causal analysis for complex dynamical systems. This
method provides an additional option for modeling the external forcing by OU colored noise, and also allows the
separation of the influence of dynamics and correlation on causality. Indeed, from observation, we can merely discuss
the correlation between variables, but with the help of LIM, we can further discuss the dynamics. Finally, utilizing
the information flow, we arrive at the causal inference.
   Applying the LIM-based approach to the DMI and Pacific SSTs, we verified that they are mutually causal but
asymmetric, and the distribution of information flow reveals an El Niño-like pattern, consistent with Liang’s result.
Besides, we further show that the environmental noise of the climate system at the Niño 3 region has a memory of
τ ≳ 2 months, longer than other parts of the Pacific Ocean. Such a noise memory further enhances the deterministic
damping force and the coupling, leading to stronger information exchanged between the Niño 3 region and Indian
Oceans.
   Liang’s method (5) is closely related to our White-LIM-based method. The right derivative of Eq. (6) at the origin
is ⟨ẋ(·)x(·)T ⟩ = Aw C, and the first half on the right-hand side of Eq. (5) is equivalent to the entry-wise expression
of Aw = ⟨ẋ(·)x(·)T ⟩C−1 . In practice, the computation of ẋ can be done by the forward difference scheme. This is
equivalent to extracting the linear dynamics by finding a straight line passing through Kobs at the origin and ∆t-lag.
In contrast, the White-LIM achieves the same task by finding an exponential function that passes through the origin
and an arbitrary lag through Eq. (7). These correspond to the linear and exponential fitting in [25]. Therefore, if the
underlying system is a white-noise-driven linear system, the White-LIM-based approach is expected to reach a better
performance by avoiding the numerical error in the finite difference scheme.
FIGURE 2. The distribution of τ (upper panel, unit in months), and (i, j)-entry of the observed and theoretical correlation
functions (lower panels). The white circles in the upper panel specify the locations from which data is used to compute the
correlation functions in the lower panels. The DMI and Pacific SSTs are symbolized by scripts 1, and 2, respectively. The dashed
line represents the window over which the minimization is applied. The theoretical correlation function of Liang’s method is
computed by using Eqs. (3), (5), and (6). The scale of the y-axis for SST auto-correlation (K22 ) in Loc. 2 is significantly larger
than others.


   As in Liang’s method where one is free to choose a finite difference scheme, the LIM-based approaches have
a degree of freedom: the window width l for minimization. Based on our experience, the numerical results are
more dependent on l when it is small due to the same reason as the numerical instability of the White-LIM. On
the other hand, a larger l does not necessarily improve the performance, since the correlation at large l may be
strongly influenced by, for example, the non-linearity of the underlying system, rendering the linear approximation
(2) ineffective. Therefore, a mid-range l should be appropriate. We have also checked that l = 5 does not significantly
change the discussion in this study.
   With the same idea, our LIM-based framework can also be applied to periodic systems. In fact, the cyclo-stationary
LIM (CS-LIM) is a variant of LIMs that estimates the periodic dynamics by interval-wise approximating the underly-
ing system with Eq. (2) from a cyclo-stationary time series [25, 26]. In the climate sciences, it is shown that such a
method better represents the seasonal variation and enhances the prediction skills [26]. Utilizing the CS-LIM poten-
tially enables us to study the seasonal dependency of information flows, leading to a more detailed temporal pattern
of causality between oceans.
   Finally, we remark that the study of the climate system has not yet been completed. For instance, the physical
meaning of the colored noise and its memory is still to be clarified. The pathway of colored noise to the oceans
requires further investigation. Also, the positive Pacific-SST-to-IOD causality near South America in the Colored-
LIM-based approach seems intriguing. These will be left for future study.



                                               ACKNOWLEDGMENTS

The author would like to express gratitude to NOAA PSL for making NOAA Extended Reconstructed SST V5 data
publicly available https://psl.noaa.gov, and Professor Hiroyasu Ando for his constructive feedback and insight-
ful discussions.


                                                     REFERENCES

 1.   R. Guo, L. Cheng, J. Li, P. R. Hahn, and H. Liu, “A survey of learning causality with data: Problems and methods,” ACM
      Comput. Surv. 53 (2020), 10.1145/3397269.
 2.   A. Alper and O. Oguz, “The role of renewable energy consumption in economic growth: Evidence from asymmetric causal-
      ity,” Renewable and Sustainable Energy Reviews 60, 953–959 (2016).
 3.   Z. Ye and T. Tozuka, “Causal relationship between sea surface temperature and precipitation revealed by information flow,”
      Frontiers in Climate 4 (2022), 10.3389/fclim.2022.1024384.
 4.   H. Majdi, M. Azarnoosh, M. Ghoshuni, et al., “Direct LiNGAM and visibility graphs for analyzing brain connectivity in
      BCI,” Medical & Biological Engineering & Computing 62, 2117–2132 (2024).
 5.   S. Shimizu, T. Inazumi, Y. Sogawa, A. Hyvärinen, Y. Kawahara, T. Washio, P. O. Hoyer, and K. A. Bollen, “DirectLiNGAM:
      A direct method for learning a linear non-gaussian structural equation model,” J. Mach. Learn. Res. 12, 1225–1248 (2011).
 6.   X. S. Liang and R. Kleeman, “Information transfer between dynamical system components,” Phys. Rev. Lett. 95, 244101
      (2005).
 7.   X. S. Liang and R. Kleeman, “A rigorous formalism of information transfer between dynamical system components. i.
      discrete mapping,” Physica D: Nonlinear Phenomena 231, 1–9 (2007).
 8.   X. S. Liang, “Information flow within stochastic dynamical systems,” Phys. Rev. E 78, 031113 (2008).
 9.   X. S. Liang, “Unraveling the cause-effect relation between time series,” Phys. Rev. E 90, 052150 (2014).
10.   X. S. Liang, “Normalized multivariate time series causality analysis and causal graph reconstruction,” Entropy 23 (2021),
      10.3390/e23060679.
11.   F.-F. Jin, L. Lin, A. Timmermann, and J. Zhao, “Ensemble-mean dynamics of the ENSO recharge oscillator under state-
      dependent stochastic forcing,” Geophysical Research Letters 34 (2007), 10.1029/2006GL027372.
12.   S. Zhao, F.-F. Jin, M. F. Stuecker, P. R. Thompson, J.-S. Kug, M. J. McPhaden, M. A. Cane, A. T. Wittenberg, and W. Cai,
      “Explainable El Niño predictability from climate mode interactions,” Nature 630, 891–898 (2024).
13.   J. Lien, Y.-N. Kuo, and H. Ando, “A linear inverse model for colored-gaussian noise,” (2024), arXiv:2402.15184.
14.   C. Penland, “Random forcing and forecasting using principal oscillation pattern analysis,” Monthly Weather Review 117,
      2165–2185 (1989).
15.   C. Penland and P. D. Sardeshmukh, “The optimal growth of tropical sea surface temperature anomalies,” Journal of Climate
      8, 1999 – 2024 (1995).
16.   W. Cai, A. Santoso, G. Wang, S.-W. Yeh, S.-I. An, K. M. Cobb, M. Collins, E. Guilyardi, F.-F. Jin, J.-S. Kug, M. Lengaigne,
      M. J. McPhaden, K. Takahashi, A. Timmermann, G. Vecchi, M. Watanabe, and L. Wu, “ENSO and greenhouse warming,”
      Nature Climate Change 5, 849–859 (2015).
17.   P. J. Ward, B. Jongman, M. Kummu, M. D. Dettinger, F. C. S. Weiland, and H. C. Winsemius, “Strong influence of el niño
      southern oscillation on flood risk around the world,” Proceedings of the National Academy of Sciences 111, 15659–15664
      (2014), https://www.pnas.org/doi/pdf/10.1073/pnas.1409822111.
18.   N. H. Saji, B. N. Goswami, P. N. Vinayachandran, and T. Yamagata, “A dipole mode in the tropical indian ocean,” Nature
      401, 360–363 (1999).
19.   D. MacLeod, E. W. Kolstad, K. Michaelides, and M. B. Singer, “Sensitivity of rainfall extremes to unprecedented in-
      dian ocean dipole events,” Geophysical Research Letters 51, e2023GL105258 (2024), e2023GL105258 2023GL105258,
      https://agupubs.onlinelibrary.wiley.com/doi/pdf/10.1029/2023GL105258.
20.   P. H. Hrudya, H. Varikoden, and R. Vishnu, “A review on the Indian summer monsoon rainfall, variability and its association
      with ENSO and IOD,” Meteorology and Atmospheric Physics 133, 1–14 (2021).
21.   P. J. Reddy, S. E. Perkins-Kirkpatrick, N. N. Ridder, and J. J. Sharples, “Combined role of ENSO and IOD on compound
      drought and heatwaves in Australia using two CMIP6 large ensembles,” Weather and Climate Extremes 37, 100469 (2022).
22.   M. Newman, S.-I. Shin, and M. A. Alexander, “Natural variation in ENSO flavors,” Geophysical Research Letters 38 (2011),
      https://doi.org/10.1029/2011GL047658, https://agupubs.onlinelibrary.wiley.com/doi/pdf/10.1029/2011GL047658.
23.   NOAA Physical Sciences Laboratory, “Dipole Mode Index (DMI),” (2024), https://psl.noaa.gov/gcos_wgsp/
      Timeseries/DMI/, Last accessed on 2024-08-10.
24.   B. Huang, P. W. Thorne, V. F. Banzon, T. Boyer, G. Chepurin, J. H. Lawrimore, M. J. Menne, T. M. Smith, R. S. Vose, and
      H.-M. Zhang, “NOAA Extended Reconstructed Sea Surface Temperature (ERSST), Version 5,” NOAA National Centers for
      Environmental Information (2017), sst.mnmean.nc.
25.   J. Lien, Y.-N. Kuo, and H. Ando, “On the cyclostationary linear inverse models: A mathematical insight and implication,”
      (2024), arXiv:2407.10931 [math.NA].
26.   S.-I. Shin, P. D. Sardeshmukh, M. Newman, C. Penland, and M. A. Alexander, “Impact of annual cycle on ENSO variability
      and predictability,” Journal of Climate 34, 171–193 (2021).
