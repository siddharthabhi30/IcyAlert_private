# Full-text extraction

- Title: Causal Dependencies and Shannon Entropy Budget: Analysis of a Reduced-Order Atmospheric Model
- Year: 2024
- DOI: https://doi.org/10.1002/qj.4805
- PDF source: https://arxiv.org/pdf/2404.00749
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                                     C AUSAL DEPENDENCIES AND S HANNON ENTROPY BUDGET -
                                                       A NALYSIS OF A REDUCED ORDER ATMOSPHERIC MODEL

                                                                                                       A P REPRINT
arXiv:2404.00749v1 [physics.ao-ph] 31 Mar 2024




                                                                                                 Stéphane Vannitsem
                                                                    Royal Meteorological Institute of Belgium, Avenue Circulaire, 3, 1180 Brussels
                                                                                         Stephane.Vannitsem@meteo.be

                                                                                                  Carlos A. Pires
                                                                 Instituto Dom Luiz, Faculdade de Ciências, Universidade de Lisboa, Lisbon, Portugal
                                                                                         clpires@ciencias.ulisboa.pt

                                                                                                   David Docquier
                                                                    Royal Meteorological Institute of Belgium, Avenue Circulaire, 3, 1180 Brussels
                                                                                           David.Docquier@meteo.be


                                                                                                       April 2, 2024

                                                                                                      A BSTRACT
                                                          The information entropy budget and the rate of information transfer between variables is studied in
                                                          the context of a nonlinear reduced-order atmospheric model. The key ingredients of the dynamics
                                                          are present in this model, namely the baroclinic and barotropic instabilities, the instability related
                                                          to the presence of an orography, the dissipation related to the surface friction, and the large-scale
                                                          meridional imbalance of energy. For the parameter chosen, the solutions of this system display a
                                                          chaotic dynamics reminiscent of the large-scale atmospheric dynamics in the extra-tropics. The
                                                          detailed information entropy budget analysis of this system reveals that the linear rotation terms
                                                          plays a minor role in the generation of uncertainties as compared to the orography and the surface
                                                          friction. Additionally, the dominant contribution comes from the nonlinear advection terms, and
                                                          their decomposition in synergetic (co-variability) and single (impact of each single variable on the
                                                          target one) components reveals that for some variables the co-variability dominates the information
                                                          transfer. The estimation of the rate of information transfer based on time series is also discussed, and
                                                          an extension of the Liang’s approach to nonlinear observables, is proposed.

                                                 Keywords: Causality analysis; chaotic dynamics; quasi-geostrophic atmosphere


                                                 1   Introduction

                                                 Causal analysis of the occurrence of certain events, in particular extreme events, is the central concern of many research
                                                 activities in meteorological and climate sciences. For example, one prominent question in the last decades is the
                                                 causal impact of CO2 on the evolution of the global temperature (Stips et al., 2016), or the attribution of climate
                                                 change on the occurrence of more intense extreme events (Bellprat et al., 2019). To answer such type of questions,
                                                 different approaches can be used such as running climate models with and without CO2 forcing, and/or investigating
                                                 the fingerprint of the evolution of CO2 on actual observations through linear regression (e.g. Allen and Stott, 2003;
                                                 Chen et al., 2024). Other important questions related for instance to the role of the ocean on the atmospheric evolution
                                                 and the emergence of low-frequency variability in the atmosphere (e.g. Bellucci et al., 2008; Vannitsem and Ghil, 2017;
                                                 Paolini et al., 2024) and concerning the role of tropical regions in shaping the extra-tropical variability (e.g. Alexander
                                                 et al., 2002; Schemm et al., 2018; Yeh et al., 2018) are also attracting considerable interest.
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



In all these questions, one central statistical quantity commonly used to infer causality is the correlation and all its
variants (e.g. regression, lagged correlation). This quantity, although a very useful indicator, does not provide a definitive
answer on the causal influence from one variable to another. In the last decades, there has been a growing literature on
new tools for evaluating the directional dependencies between a wide range of observables. On a theoretical side, the
developments include techniques using the improvement of forecasting skill (e.g. Granger, 1969; Papagiannopoulou
et al., 017b; Papana et al., 2021), analogs (Sugihara et al., 2012), networks (Runge, 2018), or information entropy
dynamics (Schreiber, 2000; Paluš et al., 2001; Liang and Kleeman, 2005; Hlaváčková-Schindler et al., 2007; Liang,
2021; Silini and Masoller, 2021). Some of these approaches have been compared in recent works (Krakovská et al.,
2018; Runge et al., 2019a,b; Docquier et al., 2024), which provide useful information on which method to use and
for what purpose. All these approaches have also been used in recent years to clarify the directional connections
between different climate or meteorological processes: the interaction between the ocean and the atmosphere (Mosedale
et al., 2006; Tirabassi et al., 2015; Vannitsem and Ghil, 2017; Docquier et al., 2023), the interaction between the
land/vegetation and the atmosphere (Papagiannopoulou et al., 017b; Hagan et al., 2019, 2022; Zhou et al., 2024), the
interaction between large scale components of the climate system (Liang, 2014; Runge et al., 2019a; Vannitsem and
Liang, 2022; Di Capua et al., 2020a,b; Silini et al., 2022; Docquier et al., 2024), the drivers of Arctic sea ice and
Antarctic surface mass balance (Vannitsem et al., 2019; Docquier et al., 2023), to quote a few.
One particularly important approach has been developed in a series of papers by Liang (Liang and Kleeman, 2005;
Liang, 2014, 2015, 2016, 2021) based on the development of a theory of the information entropy evolution and the
transfer of information between selected variables in the rather general context of deterministic and stochastic dynamical
systems. These studies culminated with the derivation of simple relations that could be directly applied to real-world
data (Liang, 2014, 2021), under the assumption that the system under investigation can be described by a linear
stochastic system. However, this type of approximation, which is sometimes justified, as illustrated for instance in
Sardeshmukh and Penland (2015), can often lead to misinterpretation of interactions. This is particularly true in chaotic
dynamical systems for which nonlinearities play a key role in generating the dynamics, such as the Lorenz (1963)
model. In such a context, one must therefore turn back to the original equations of the Shannon entropy evolution
(Liang, 2021), and find ways to evaluate properly the rate of information transfer between observables. An important
step in that direction has been recently made in Pires et al. (2024), in which the rate of information transfer between
variables or group of variables can be computed by means of conditional expectations of the system’s forcing terms in a
fully nonlinear framework. The approach has been validated in the context of several low-order models with or without
stochastic forcing.
Based on these recent advances, the information entropy budget and the transfer of information are explored in this
study in a simple reduced-order atmospheric model containing key ingredients of the atmospheric dynamics, namely
the baroclinic instability, vorticity transport, rotation, orographic forcing and orographic friction (Charney and Straus,
1980). This model is a deterministic system for which chaotic solutions are found, provided appropriate parameter
values are chosen. A detailed analysis of the information entropy is first performed, clarifying the role of physical
processes (e.g. orography, friction, nonlinear advection) on the changes of information entropy. In a second step, the
possibility to extract the rate of information transfer and the terms of the information entropy balance from time series
is then explored, using the approach designed in Liang (2021).
In Section 2, the basic equations that will be used in the current analysis are introduced. The atmospheric model is
then described in Section 3. The different terms of the information entropy balance are discussed in Section 4, and the
extraction of these terms from time series is discussed in Section 5. Finally, key conclusions are drawn in Section 6.

2     Theory: key equations
2.1   The entropy balance

A central quantity of information theory is the information entropy, or Shannon entropy, denoted H, which is a unique
measure of information with the following properties: it takes a maximum value when the probability distribution of
the variable is uniform; adding an event with probability 0 does not change its value; and the property of additivity
by which H(AB) = H(A) + H(B|A) where AB is the composition of two subsystems A and B and H(B|A) is the
conditional entropy (Gray, 2011; Nicolis and Nicolis, 2012). It can be applied to discrete-value systems such as for
instance the uncertainty produced by the transition dynamics between weather regimes (e.g. Nicolis and Nicolis, 2012;
Vannitsem, 2023, and references therein) or for continuous-value systems (e.g. Kleeman, 2011; Liang, 2021).
A detailed description on how to construct an evolution equation for the information entropy is provided in Liang
(2016, 2021) and Pires et al. (2024), and we redirect the reader to these papers for the detailed calculations. Here, we
will briefly introduce the key quantities that will be used to characterize how information is changing and transferred
throughout a dynamical system.


                                                              2
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



Let us consider a dynamical system of the form
                                                    dX
                                                        = F(X, λ)                                                   (1)
                                                     dt
where X = (X1 , ..., XN ) with N the number of variables. The system is supposed to be autonomous, and its solutions
converge to an ergodic attractor with a stationary probability density. Here, the system is considered as deterministic,
although the theory is valid when stochastic components are present (Liang, 2021; Pires et al., 2024).
In this context, the rate of change of the Shannon entropy associated to variable Xi is given by
                                          dHXi       dHXi ,self
                                                  =              + T (X̸=i → Xi )                                       (2)
                                            dt           dt
where X̸=i denotes the variables that are complementary to Xi . Asymptotically, the tendency of entropy should tend
toward 0 on such an ergodic system and a balance is reached between the self-entropy generation (SEG; first term on
the right-hand side of Eq. (2)) and the rate of entropy transfer (RET; second term on the right-hand side of Eq. (2)) from
the set of complementary variables X̸=i to Xi . The expressions for these two quantities are

                                                                      
                                               dHXi ,self        ∂Fi
                                                        = E                                                             (3)
                                                 dt              ∂Xi
                                                                                
                                                                   ∂log(ρ̸=i|i )
                                       T (X̸=i → Xi ) = E Fi
                                                                        ∂Xi
                                                                                   
                                                                      ∂log(ρ̸=i|i )
                                                        = E Fi,̸=i                                                      (4)
                                                                           ∂Xi
where Fi,̸=i is the part of the deterministic term Fi which contains all the terms influencing Xi that are not exclusively
dependent on Xi and ρ̸=i|i is the conditional probability density function of all the variables Xk , k ̸= i given Xi . E[.]
denotes the expectation over all variables.
The RET can be further expressed in terms of the conditional expectations of the variables assuming that Fi,̸=i is a sum
of separable functions (such as multivariate polynomial functions) (Pires et al., 2024):
                                                                                                   
                                                     X                   ∂Ek̸=i (f2,l (Xk̸=i )|Xi )
                                T (X̸=i → Xi ) =           Ei f1,l (Xi )                                                    (5)
                                                                                   ∂Xi
                          P                            l
where Fi,̸=i is written as l f1,l (Xi )f2,l (Xk̸=i ). For purely linear functions in Xk̸=i , we have f1,l (Xi ) = 1. Ei [.] and
Ek̸=i [.] denote the expectation over variables Xi and Xk̸=i , respectively.
The RET from the complementary variables is an important quantity, which may be decomposed in different contribu-
tions related to the different physical processes acting on the target variable as we will see in our application. Relating
the different physical processes to the transfer of information allows for better understanding the role of these processes
on the propagation of information uncertainties.
In the case of the RET from one variable to another, referred as ‘single RET’ hereafter, a similar procedure can be
followed, but now the decomposition is done on Fi,j which is the part of F (i) that depends on Xj , as follows:
                                                                                                      
                                               X                                  ∂Ej (f2,l (Xj )|Xi )
                          T (Xj → Xi ) =            Ei EXk̸=j (f1,l (Xk̸=j )|Xi )                                           (6)
                                                                                         ∂Xi
               P                                l
where Fi,j =      l f1,l (Xk̸=j )f2,l (Xj ).
The synergetic contribution is the difference between the total RET from all variables T (X̸=i → Xi ) and the sum of all
single RETs:                                                           X
                               TSyn (X̸=i → Xi ) = T (X̸=i → Xi ) −        T (Xj → Xi )                              (7)
                                                                                j̸=i
This quantity contains all contributions that are related to the coherent dynamics, i.e. co-variability, between the
variables through nonlinear terms. It is equal to 0 for linear equations.
Note that the total RET is generally positive as it balances the negative SEG coming from dissipation in a chaotic
regime. However, when decomposing the total RET in different contributions, some terms could contribute negatively
and others positively to the evolution of the uncertainty. In other words, some terms are expected to control (or reduce)
the uncertainty when negative, while others would increase the uncertainty when positive. The sign has therefore a clear
meaning in the evolution of the entropy.


                                                                   3
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



2.2   The simplified linear stochastic approximation

A simplification of the approach was proposed by Liang (2014) to allow for the direct application on time series. It
consists in assuming that the underlying model at the origin of the dynamics is a linear stochastic system that can be
fitted to the data. This approach was first proposed to compute dependencies for bivariate series (Liang, 2014), and
has subsequently been extended to multivariate cases (Liang, 2016, 2021). Both have been extensively used in various
applications (Docquier et al., 2022; Hagan et al., 2022; Vannitsem and Liang, 2022).
Under the assumption of a linear model with additive noise, the maximum likelihood estimate of the RET is given by
(Liang, 2021):
                                                               N
                                                          1    X             Cij
                                         TXj →Xi =           ·   ∆jk Ck,di ·     ,                                      (8)
                                                        detC                 Cii
                                                              k=1

where C is the covariance matrix, ∆jk are the cofactors of C (∆jk = (−1)j+k Mjk , where Mjk are the minors), Ck,di
is the sample covariance between all Xk and the Euler forward difference approximation of dXi /dt, Cij is the sample
covariance between Xi and Xj , and Cii is the sample variance of Xi .
To assess the importance of the relative importance of cause-effect relationships, a normalization of the RET can be
performed. This new quantity is referred as τXj →Xi from variable Xj to variable Xi and reads as Liang (2015, 2021)

                                                                  TXj →Xi
                                                  τXj →Xi =               ,                                             (9)
                                                                    Zi

where Zi is the normalization:
                                                  N
                                                  X                    dHinoise
                                           Zi =         |TXk →Xi | +            ,                                      (10)
                                                                         dt
                                                  k=1

where the first term on the right-hand side represents the information flowing from all the Xk to Xi (including the
influence of Xi on itself), and the last term is the effect of noise (taking stochastic effects into account).


3     The Charney-Straus (CS) model

The original equations to describe the dynamics of a 2-layer atmosphere proposed by Charney and Straus (1980) on a
rectangular domain in the extra-tropics are

              ∂∇2 ψ1          ⃗     2          ∂ψ1       ω2    K
                     + (⃗v1 · ∇)(∇    ψ1 ) + β      = f0    −     (∇2 ψ1 − ∇2 ψ3 )
                ∂t                              ∂x       δp   ∆p2
              ∂∇2 ψ3          ⃗     2       f0 ρgH       ∂ψ3        ω2     K
                     + (⃗v3 · ∇)(∇    ψ3 +         )+β        = −f0    +      (∇2 ψ1 − ∇2 ψ3 ) − CD ∇2 ψ3
                ∂t                            ∆p          ∂x        ∆p ∆p2
              ∂ ψ1 − ψ3           ⃗ ψ1 − ψ3 − ω2 σ = Q
                          + ⃗v2 · ∇                                                                                    (11)
              ∂t ∆p                    ∆p        f0

where ψ1,3 are the streamfunction at levels 250 hPa and 750 hPa, respectively, ⃗v1,2,3 , the horizontal velocities at levels
250 hPa, 500 hPa and 750 hPa, respectively; ω2 is the generalized vertical velocity in pressure coordinates at 500 hPa;
ψ1 −ψ3
  ∆p    is the vertical discretization of the hydrostatic balance in pressure coordinates; ∂ψ     1     RT
                                                                                           ∂p = ρf0 = pf0 where ρ is the
density, T the temperature and R the perfect gaz constant; σ is the static stability; H is the height of the orography;
f0 is the Coriolis parameter at ϕ0 = 45◦ ; ∆p is the pressure difference between the two layers; CD is the surface
friction coefficient; K is the friction between the two atmospheric layers related to the vertical Reynolds Stress; and
Q = γ((ψ1 − ψ3 )∗ − (ψ1 − ψ3 )) is the Newtonian cooling where (ψ1 − ψ3 )∗ is a reference climatology around which
the solution of the system oscillates.
These equations are made non-dimensional by rescaling time, space and the fields as follows: t′ = tf0 , x′ = Lx
                                                                                                                , y ′ = Ly ,
 ′     ψ     ′                                                                       ′    Hρg    ∗      βL   ′
ψ = L2 f0 , ω = f0 ∆p . The key parameters are also made non-dimensional as: H = ∆p , β = f0 , k = f0K
                    ω
                                                                                                                      ∆2 p ,
         2
σ ′ = σ∆   p
      L2 f 2
             , h” = γ∆p        ′  C
                     f0 , and C = f0 . The equations can then be written as
         0




                                                              4
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT




                 ∂∇2 ψ1′                  ⃗               ∂ψ1′
                             +   (v⃗′ 1 · ∇)(∇ 2 ′
                                                ψ1 ) + β ∗      = ω2′ − k ′ (∇2 ψ1′ − ∇2 ψ3′ )
                  ∂t′                                      ∂x′
                 ∂∇2 ψ3′                  ⃗                     ∂ψ ′
                             +   (v⃗′ 3 · ∇)(∇ 2 ′
                                                ψ3 + H ′ ) + β ∗ 3′ = −ω2′ + k ′ (∇2 ψ1′ − ∇2 ψ3′ ) − C ′ ∇2 ψ3′
                  ∂t′                                            ∂x
            ∂                          ⃗ 1′ − ψ3′ ) − ω2′ σ ′ = h”((ψ1′ − ψ3′ )∗ − (ψ1′ − ψ3′ ))
              (ψ ′ − ψ3′ )   + v⃗′ 2 · ∇(ψ                                                                           (12)
           ∂t′ 1

These equations can be further simplified by summing and differentiating the two first equations, and replacing ω2′ by
                                                                                  ψ ′ +ψ ′                     ψ ′ −ψ ′
the third one. This leads to two equations for the evolution of the barotropic ψ = 1 2 3 and the baroclinic θ = 1 2 3
streamfunctions.
                                                                                                   2L
The domain over which the equations are integrated is rectangular with an aspect ratio n = Lxy where Lx and Ly are
the zonal and meridional lengths of the domain. Ly is further related to the characteristic space scale L used for scaling
as Ly = πL.
The non-dimensional fields can then be developed in Fourier series, and severely truncated to the first dominant modes.
Charney and Straus (1980) choose as basis functions for building their low-order model:
                                                   √
                                             FA = 2 cos(y ′ )
                                                FK = 2 cos(nx′ ) sin(y ′ )
                                                FL = 2 sin(nx′ ) sin(y ′ )
                                                     √
                                                FC = 2 cos(2y ′ )
                                                FM = 2 cos(nx′ ) sin(2y ′ )
                                                FN = 2 sin(nx′ ) sin(2y ′ )
and each field is then written as: ψ = ψA FA + ψK FK + ψL FL + ψC FC + ψM FM + ψN FN and θ = θA FA + θK FK +
θL FL + θC FC + θM FM + θN FN . The coefficients are normalized, leading to orthonormal modes in a L2 norm. They
                                                          ∗
further assume that the thermodynamic climatology θ∗ = θA   FA , and that the orography is defined as H ′ = hk FK .
These fields are then injected into Eq. (12) and the equations are projected using the L2 norm on the different modes.
This leads to the set of 12 ordinary differential equations given in Appendix A. The parameter values used in the
following for this set of equations are provided in Appendix A.

3.1   Basic characteristics of the solutions

The solutions of this model have been extensively explored in different contexts. First, Charney and Straus (1980)
analyzed the emergence of zonal and blocking flows and the role of the orography in the emergence of instabilities,
competing with the classical baroclinic instablity. Note that subsequent works, by extending the number of modes, have
criticized the emergence of zonal and blocking flows as well as the mechanisms associated with this emergence, but
this question is beyond the scope of the current analysis. For more information on this topic, the reader is directed
toward Cehelsky and Tung (1987) and the recent paper of Xavier et al. (2023). The model is however a good candidate
for different types of analyses as it shows similarities with the type of dynamics that can be found in the atmosphere
and is easy to implement, run and analyze. An example is provided in Demaeyer and Vannitsem (2020), in which a
methodology is proposed to modify statistical post-processing schemes when model parameters change.
With the parameter values given in Appendix A, a solution is generated for the model using a second-order Heun
integration scheme with a time step of ∆t = 0.01 time unit. Figure 1 displays the temporal evolution of ψA generated
by this deterministic dynamical system. It clearly displays an erratic behavior reminiscent of the type of behavior one
experiences in the real atmosphere. This erratic behavior is also reminiscent of the chaotic nature of the dynamics,
which means that the solution displays the property of sensitivity to initial conditions.
This property of sensitivity to initial conditions may be checked by computing the Lyapunov exponents, as for instance
discussed in Eckmann and Ruelle (1985), Parker and Chua (1989), Nicolis et al. (1995), and Vannitsem (2017). The
Lyapunov exponents characterize the exponential sensitivity to initial condition errors and their number is equal to
the dimension of the system. If positive Lyapunov exponents are present, the system displays sensitivity to initial
conditions, and hence a chaotic dynamics. Figure 2 displays the Lyapunov spectrum, i.e. the ensemble of exponents
ranked from the largest to the smallest, of the solution generated by the Charney-Straus (CS) model. There are two
positive exponents, indicating that the solution of the CS model for the chosen parameters is chaotic. The dominant


                                                             5
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



                      0.2


                     0.15


                      0.1


                     0.05
               ψA




                       0


                    -0.05


                     -0.1


                    -0.15
                        1200            1400            1600                1800        2000            2200
                                                               Time (day)

                                    Figure 1: Temporal evolution of the variable ψA .


exponent has a value of 0.23 day−1 , leading to a doubling time of errors of the order of 3 days, a typical value for more
sophisticated systems (Vannitsem, 2017).
This chaotic behavior is reminiscent of the sensitivity to initial conditions found in the real atmosphere, as illustrated
in Lorenz (1969) or in more realistic atmospheric models like the one studied in Lorenz (1982), Dalcher and Kalnay
(1987), and Savijarvi (1995). This makes the current solution a good candidate for an analysis of the uncertainty
propagation through the dynamics of the Shannon entropy. Note that for the computation of the different terms of the
entropy budget in the following section, 5,000,000 time units are used (approximatively 550,000 days).

4     The entropy budget
In this section, the computation of the different terms discussed in Section 2.1 on the dynamics of the CS model
presented in Section 3, is discussed. We start with the single RETs as these are the usual terms that are computed for
characterizing the dependencies from one variable to another. We then present the entropy balance terms, i.e. the SEG
and the total RETs, together with the different (additive) contributions associated with the physical terms. The section is
then closed with a synthesis of the different contributions to the total RET, focusing on the nonlinear terms. Conditional
expectations are obtained from a coarse-grained binning of 50 equal-amplitude bins, and derivatives are estimated by
central differences.

4.1   Single RETs

Let us start by investigating what can be learned from the single RETs. Here, there is no decomposition in terms of
the different physical processes as, usually, the goal is to investigate the overall influence of a variable on another. In
Table 1, each column (from 2 to 12) represents the influence of a variable on the target variable listed in the first column
of the table.
One may split the variables into two blocks, the first group, composed of variables ψA , θA , ψK , θK , ψL , θL , which are
the first meridional modes, and the second group, including variables ψC , θC , ψM , θM , ψN , θN , which are the second
meridional modes. The influence of variables in the first group on variables in this same group dominates as compared
with the influence of variables in the second group on variables in the first group. This reflects the weaker influence of
the second group on the first one. However, as we will see in Section 4.2, synergetic terms of the second group are
relatively high, even if less dominant compared to the synergetic terms of the first group of variables (Table 5). So, the
single RETs do not provide the most accurate picture of the influence of the second group on the first one.


                                                               6
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



                           0.3


                           0.2


                           0.1


                             0
              λi (day-1)




                           -0.1


                           -0.2


                           -0.3


                           -0.4
                                  0   2         4            6           8           10          12
                                                                 i

         Figure 2: Lyapunov spectrum of the solution generated by the CS model described in Appendix A.


If we focus on the second group as a target, the dominant influence still occurs within the group, but some key RETs
from the first group are important. For instance the influence of ψL on θM if of the same order as the influence among
the variables within the second group, suggesting the relatively important influence of the first group on the second one.
This however should again be tempered by the fact that synergetic terms that are essential components of the change of
information entropy, are not accounted for here either.

4.2   Global entropy budget

The global entropy budget, which should be equal to 0, is displayed in Table 2 for each target variable in the first
column. The second column displays the part of the budget associated with the SEG (self-entropy generation; see
Eq. (3)). These quantities are easily computed as the terms proportional to the variables themselves are linear with
a friction coefficient proportional to −k, associated with the friction term in Eqs. (A.1-A.12). The SEG terms are
all negative and reflect the dissipative character of the dynamics. The third column displays the total RET from all
variables to the target variable (Eq. (4)). The fourth column represents the contributions of the sum of the single RETs,
and the fifth column displays the contribution of the synergetic terms, TSyn in Eq. (7), reflecting the co-variability
of the variables appearing in the right-hand side of all the equations given in Appendix A (A.1-A.12). Note that the
balance between the SEG (second column) and the total RET (third column) is close to be met, with a slight imbalance
that could possibly be due to different reasons: the numerical round-off errors, the sample used, and/or the nature of the
dynamics of the system which is deterministic and chaotic without stochastic components. The latter implies that the
probability density function of this system could be non-differentiable in certain directions, an important condition for
computing the information entropy budget. This interesting question is out of scope of the present work and will be
addressed in the future.
Table 2 shows the absence of synergetic terms influencing variable ψA as there are only linear terms influencing this
variable, see Eq. (A.1). On the contrary, synergetic terms dominate θA , indicating that the nonlinear co-variability is
key in the change of information entropy for this variable (see Eq. (A.4)). Synergetic terms also dominate for variable
ψC , but to a lesser extent. For the other variables, both synergetic and single RETs are important in the change of
information entropy.
Let us now go more deeply in the specific contributions of the different terms. Table 3 displays the specific contributions
of the linear terms to the total RET in the equations related to Earth rotation, orography and friction (excluding the
self-influencing term). All the corresponding terms are displayed together with the values obtained along the trajectory
of the model solution. Concerning the rotation terms (second and third columns), the dominant contributions are the


                                                            7
    Table 1: Single RETs between the different variables of the CS model. The first column indicates the target variable, while the subsequent columns contain the single
    RETs associated with the influence of variables listed in the first row.
      Target           ψA          θA          ψK            θK            ψL          θL         ψC            θC          ψM           θM          ψN           θN
      ψA                 - 3.8 10−4              0             0 1.12 10−2 −5.93 10−3               0             0            0           0           0             0
      θA        1.57 10−3            - 4.84 10−4 −3.02 10−4 3.15 10−4 −1.61 10−3                    0             0    2.9 10−7 −3.49 10−7 −3.9 10−7 2.03 10−7
      ψK         8.9 10−4 −1.98 10−3             - 1.58 10−3 −4.62 10−5 1.04 10−2 2.95 10−7 −4.92 10−8                         0           0 −2.63 10−7 −1.51 10−7
      θK        4.23 10−3 −4.84 10−3 5.463 10−3                 - 2.69 10−2 −3.08 10−3 −1.41 10−6 6.94 10−8                    0           0 −1.16 10−7 1.71 10−7




8
      ψL      −5.51 10−4 −2.25 10−3 4.87 10−4 9.65 10−3                      - 1.48 10−3 6.53 10−7 3.61 10−8 6.94 10−7 5.05 10−8                       0             0
      θL        4.49 10−4 −5.04 10−3 2.044 10−2 2.25 10−3 6.26 10−3                     - 4.70 10−7 −9.54 10−9 2.06 10−7 −7.93 10−7                    0             0
      ψC                0           0 4.06 10−4 −1.80 10−4 −4.61 10−4 −9.04 10−5                    - 1.45 10−3 1.15 10−3 2.09 10−4 −1.87 10−3 −2.45 10−4
      θC                0           0 1.82 10−3 8.26 10−5 4.46 10−4 6.45 10−5 7.46 10−3                           - −1.13 10−4 −1.21 10−4 3.88 10−3 −2.03 10−3
                       −4          −5                                       −5        −6          −5            −6
      ψM −1.89 10          5.99 10               0             0 2.71 10       4.68 10     1.08 10      1.16 10                 - 1.85 10−3 5.12 10−4       6.3 10−5
                       −5          −5                                       −3        −4          −3            −3           −3                       −5
      θM        7.70 10    1.94 10               0             0 −1.47 10      5.43 10      4.3 10 −1.01 10           5.07 10               - −3.41 10 −9.90 10−5
      ψN        2.42 10−4 −4.26 10−6 −9.48 10−5 −9.26 10−6                   0          0 1.25 10−2 −4.08 10−3 −6.57 10−4 −1.29 10−5                    - 1.84 10−3
      θN        8.18 10−5 1.35 10−5 −1.70 10−4 6.47 10−4                     0          0 3.39 10−3 −4.03 10−3 −4.53 10−4 1.75 10−4 4.69 10−3                        -
                                                                                                                                                                            Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                                                                                                                                                                                       A P REPRINT
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



Table 2: Global entropy budget: The first column contains the name of the target variable, the second column the
self-entropy generation term (SEG), the third column the total rate of entropy transfer (RET) from all variables except
the target, the fourth column the sum of all single RETs, and the last column the synergy term, i.e. the difference
between the total RET minus the sum of single RETs.
                  Target            SEG        Total RET Sum
                                                           P of single RETs                 Synergy
                  variable E(∂Fi /∂Xi ) T (X̸=i → Xi )        j̸=i T (Xj → Xi ) TSyn (X̸=i → Xi )
                  ψA         −5.70 10−3        5.68 10−3              5.68 10−3                   0.
                                      −2              −2
                  θA         −1.43 10          1.42 10                4.55 10−4           1.38 10−2
                  ψK         −5.70 10−3        5.69 10−3              1.09 10−2          −5.23 10−3
                  θK         −1.91 10−2        1.91 10−2              2.87 10−2          −9.57 10−3
                                      −3              −3                      −3
                  ψL         −5.70 10          5.69 10                8.82 10            −3.12 10−3
                                      −2              −2                      −2
                  θL         −1.91 10          1.91 10                2.44 10            −5.27 10−3
                                      −3              −3                      −4
                  ψC         −5.70 10          5.68 10                3.69 10             5.31 10−3
                                      −2              −2                      −2
                  θC         −1.90 10          1.90 10                1.15 10             7.48 10−3
                                      −3              −3                      −3
                  ψM         −5.70 10          5.68 10                2.34 10             3.34 10−3
                  θM         −2.15 10−2        2.14 10−2              7.40 10−3           1.40 10−2
                  ψN         −5.70 10−3        5.68 10−3              9.76 10−3          −4.08 10−3
                  θN         −2.15 10−2        2.14 10−2              4.35 10−3           1.71 10−2


Table 3: Contributions of the linear terms to the entropy budget. The first column represents the target variable. The
following columns contain the linear terms of the evolution equations and their respective value (see Appendix A): the
Coriolis term on a beta-plane referred as rotation, the orographic term, and the friction term.
 Target               Rotation        Value                          Orography          Value           Friction      Value
 ψA                           -            -                  0.5h01 (ψL − θL ) 5.27 10−3                   kθA 3.80 10−4
 θA                           -            -     −0.5h01 (ψL − θL )/(1 + σ10 ) −1.51 10−3         kψA /(1 + σ10 ) 1.57 10−3
                                         −4
 ψK                     β1 ψL −2.0410                                          -             -              kθK 1.58 10−3
                         1−β             −3                                                                1−β
 θK          β1 θL /(1 + σ0 ) 1.18 10                                          -             - kψK /(1 + σ0 ) 5.46 10−3
 ψL                    −β1 ψK     7.92 10−4                −0.5hn1 (ψA − θA ) −8.1910−4                     kθL 1.48 10−3
                         1−β             −3                               1−β              −3              1−β
 θL        −β1 θK /(1 + σ0 ) −1.47 10            0.5hn1 (ψA − θA )/(1 + σ0 ) 3.70 10             kψL (1 + σ0 ) 6.26 10−3
                                                                                           −3
 ψC                           -            -                 0.5h02 (ψN − θN ) −1.39 10                     kθC 1.45 10−3
                                                                                           −3
 θC                           -            - −0.5h02 (ψN − θN )/(1 + σ0 ) 1−ϵ
                                                                                    4.8110      kψC /(1 + σ0 ) 7.46 10−3
                                                                                                           1−ϵ
                                         −4
 ψM                     β2 ψN −1.92 10                                         -             -             kθM 1.85 10−3
                            ′                                                                                 ′
 θM         β2 θN /(1 + 1−β
                         σ0 )     6.62 10−7                                    -             - kψM /(1 + 1−β
                                                                                                           σ0 ) 5.07 10
                                                                                                                         −3
                                         −4                                                −3
 ψN                   −β2 ψM      2.33 10                  −0.5hn2 (ψC − θC ) 8.75 10                       kθN 1.84 10−3
                        1−β ′                                            1−β ′
                                                                                                          1−β ′
 θN       −β2 θM /(1 + σ0 ) −1.23 10−4 0.5hn2 (ψC − θC )/(1 + σ0 ) 5.07 10−3 kψN /(1 + σ0 ) 4.69 10−3



ones related to the baroclinic modes, θK and θL . Note that the sign changes from one variable to another, reflecting a
tendency to control or to amplify the variability of the target variable (displayed in the first column).
In the fourth and fifth columns, the contributions from the orography are displayed, with an amplitude of the contributions
similar to the ones associated with rotation. These quantities are obviously dependent on the imposed height of the
mountains. In the absence of mountains, the contributions to the total RETs are equal to 0. Note that the orography
can also have a controling effect (negative signs) on the variability of certain variables, either baroclinic or barotropic.
Finally, in the sixth and seventh columns, the quantities related to friction that are not associated with the self-influence
are displayed. They are all positive, being about 10 − 50% of the self-influence in absolute value, indicating that their
effect is to increase the information entropy, and hence the uncertainty on the variables.
Let us now turn to the contribution of the nonlinear terms to the total RET. These are displayed in Tables 4 and 5.
The former displays the total contribution of the nonlinear terms to the entropy budget, while the latter displays the
decomposition of the single RET and synergetic contributions.
In Table 4, the nonlinear terms NL1 and NL2 refer to the two sets of nonlinearities, separated by the specific variables
interacting with each other. Those corresponding to the baroclinic modes are further decomposed in a term coming from
the vorticity equations and one from the thermodynamic equations through the vertical velocity ω2 . For the first group of
variables (ψA , θA , ψK , θK , ψL , θL ), NL1 are nonlinear terms combining variables belonging to the same set of modes,


                                                             9
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



Table 4: Contributions of the nonlinear terms to the total RET. NL1 and NL2 refer to the two sets of nonlinearities, split
in terms of variables interacting with each other. For the baroclinic modes, these are also decomposed in a term coming
from the vorticity equations and one from the thermodynamic equations, displayed in the first and second rows in the
boxes, respectively.
 Target                                         NL1           Value                                         NL2          Value
 ψA                                                   -            -                                            -            -
                                                                                    ′
 θA                 − σα0 (θK ψL − θL ψK )/(1 + σ10 ) 1.26 10−2                − σα0 (θM ψN − ψM θN )/(1 + σ10 ) 1.57 10−3
 ψK                            −βα(ψL ψA + θL θA )        6.0110−3                        −δα”(ψN ψC + θN θC ) −1.7010−3
                                                1−β
 θK               −βα(θL ψA + ψL θA )/(1 + σ0 ) −3.73 10−2                   −δα”(θN ψC + ψN θC )/(1 + 1−β  σ0 ) −4.02 10
                                                                                                                            −3
                (1−β)                           1−β              −2       (1−β)                            1−β
             − σ0 α(θL ψA − ψL θA )/(1 + σ0 ) 5.93 10                  − σ0 α”(θN ψC − ψN θC )/(1 + σ0 ) −5.48 10−3
 ψL                             βα(ψK ψA + θK θA )        9.0910−3                         δα”(ψM ψC + θM θC ) −4.86 10−3
                                                1−β
 θL                 βα(θK ψA + ψK θA )/(1 + σ0 ) −2.97 10        −2
                                                                              δα”(θM ψC + ψM θC )/(1 + 1−β  σ0 ) −5.41 10
                                                                                                                            −3
               (1−β)                            1−β              −2      (1−β)                             1−β
             + σ0 α(θK ψA − ψK θA )/(1 + σ0 ) 4.98 10                  + σ0 α”(θM ψC − ψM θC )/(1 + σ0 ) −4.0910−3
 ψC                            ϵα”(ψN ψK + θN θK ) 1.39 10−4                              −ϵα”(ψM ψL + θM θL ) 5.48 10−3
                                                                 −3
 θC                                             1−ϵ
                  ϵα”(ψN θK + θN ψK )/(1 + σ0 ) 2.75 10                      −ϵα”(ψM θL + ψM θL )/(1 + 1−ϵ  σ0 )   3.98 10−3
              (1−ϵ)                                              −3        (1−ϵ)
                                                1−ϵ
           − σ0 α”(θK ψN − ψK θN )/(1 + σ0 ) −1.51 10                   − σ0 α”(θM ψL − ψM θL )/(1 + σ0 ) 1.47 10−3
                                                                                                           1−ϵ
                                ′ ′                              −3
 ψM                          −β α (ψN ψA + θN θA ) 2.93 10                                −δ ′ α”(ψL ψC + θL θC ) 1.09 10−3
                                                    ′                                                         ′
 θM            −β ′ α′ (θN ψA + ψN θA )/(1 + 1−βσ0 )     1.43 10−3           −δ ′ α”(θL ψC + ψL θC )/(1 + 1−β
                                                                                                            σ0 )   9.33 10−4
                     ′                               ′                              ′                                ′
          − (1−β ) ′                     1−β
              σ0 α (θN ψA − ψN θA )/(1 + σ0 ) −3.24 10
                                                       −3
                                                                          − (1−β  )                       1−β
                                                                              σ0 α”(θL ψC − ψL θC )/(1 + σ0 )    1.72 10−2
ψN                        β α (ψM ψA + θM θA ) −4.71 10−3
                           ′ ′
                                                                                           δ α”(ψK ψC + θK θC ) −4.26 10−4
                                                                                            ′
                                             ′                                                                ′
θN             β α (θM ψA + ψM θA )/(1 + 1−β
                 ′ ′
                                          σ0 )  6.27 10−4                       δ α”(θK ψC + ψK θC )/(1 + 1−β
                                                                                 ′
                                                                                                           σ0 )  4.1410−4
                 ′                                   ′                          ′                                    ′
          + (1−β ) ′                    1−β
              σ0 α (θM ψA − ψM θA )/(1 + σ0 )              1.63 10−3 + (1−β )                      1−β
                                                                         σ0 α”(θK ψC − ψK θC )/(1 + σ0 )                   9.10 10−3


while NL2 corresponding to the target variables of the first group are combinations of the modes of the second group
ψC , θC , ψM , θM , ψN , θN . Interestingly, the NL1 terms play a prominent role in the change of information entropy
content for the first group of variables. The overall contribution of NL1 is to increase the information entropy content
for this set of variables. On the other hand, the NL2 contributions are smaller in absolute value compared to the NL1
contributions and mostly negative, with the exception of the contribution to the variable θA . So NL2 terms tend to
reduce the information entropy content, and hence to control the variability of the corresponding variables.
For the second set of target variables, ψC , θC , ψM , θM , ψN , θN , the nonlinear terms NL1 and NL2 are made of
interactions between this group of variables and the first set of variables, ψA , θA , ψK , θK , ψL , θL . A first remark is that
the amplitudes of the NL1 contributions are generally smaller than for the previous group, and that the NL2 terms tend
to dominate. In addition, one cannot underline a specific trend in the sign of the contributions within NL1 and NL2 for
these targeted variables.
Table 5 shows the decomposition into single RETs and synergetic contribution (related to the combined effect of
variables). For the first group of variables (ψA , θA , ψK , θK , ψL , θL ), the dominant terms are the single RETs of NL1,
except for θA . For the latter, the dominant term is the synergetic one, indicating the importance of the co-variability
of ψL and θK in the change of information entropy. For this group of variables, it is also interesting to note that for
the thermodynamic nonlinearities NL2, the main contributions are the synergetic ones. For the second group of target
variables (ψC , θC , ψM , θM , ψN , θN ), the trends are less clear but synergetic terms usually dominate.
These results underline the importance of the co-variability between different variables in driving the dynamics, and in
particular, the role of synergies on the change of information entropy. The single RETs only provide a partial diagnostics
on the information entropy dynamics, which could provide a biased estimation of causal influences between variables if
synergies are not taken into account. This question will be taken up further in the next sections.

4.3   Summary of the contributions to the total RETs

The values and formulas of the entropy budget terms that are evaluated in Tables 2-5 allow for isolating the main drivers
of the rates of entropy change. The amplitudes of these different influences and their origin are synthesized in Fig. 3,
in boxes superimposed to the arrows, given in units of 10−4 nats/time unit. Those amplitudes reflect the importance
of specific variables in driving other variables and the leading physical processes at the origin of those influences.
The most prominent processes are displayed in red. In Fig. 3, these processes are referred to as ‘Ro’ (rotation), ‘Or’


                                                               10
     Table 5: Contributions of the nonlinear terms to the entropy budget, decomposed into synergetic and sum of single RET contributions. The contributions to the
     synergetic terms from each nonlinearity, NL1 and NL2, can be computed thanks to the additive character of Eq. (5) and of the single RETs associated with each
     nonlinear term.
       Target                                        NL1      Synergy Single RET sum                                        NL2        Synergy Single RET sum
       ψA                                                 -         -                -                                           -           -                 -
                                                                                                     ′
       θA                 − σα0 (θK ψL − θL ψK )/(1 + σ10 ) 1.22 10−2        3.90 10−4           − σα0 (θM ψN − ψM θN )/(1 + σ10 ) 1.57 10−3       −6.52 10−7
       ψK                            −βα(ψL ψA + θL θA ) −3.54 10−3          9.55 10−3                      −δα”(ψN ψC + θN θC ) −1.70 10−3        −1.68 10−7
                                                     1−β                                                                    1−β
       θK              −βα(θL ψA + ψL θA )/(1 + σ0 ) −9.48 10−5              2.21 10−2         −δα”(θN ψC + ψN θC )/(1 + σ0 ) −9.50 10−3              1.29 10−6
                     (1−β)                           1−β                                    (1−β)                           1−β
                   − σ0 α(θL ψA − ψL θA )/(1 + σ0 )                                      − σ0 α”(θN ψC − ψN θC )/(1 + σ0 )
       ψL                             βα(ψK ψA + θK θA ) 1.72 10−3           7.37 10−3                       δα”(ψM ψC + θM θC ) −4.86 10−3           1.43 10−6
                                                     1−β                                                                    1−β
       θL                βα(θK ψA + ψK θA )/(1 + σ0 ) 4.24 10−3              1.59 10−2          δα”(θM ψC + ψM θC )/(1 + σ0 ) −9.50 10−3              4.45 10−7




11
                    (1−β)                            1−β                                   (1−β)                            1−β
                  + σ0 α(θK ψA − ψK θA )/(1 + σ0 )                                       + σ0 α”(θM ψC − ψM θC )/(1 + σ0 )
       ψC                            ϵα”(ψN ψK + θN θK ) 6.47 10−4          −5.08 10−4                      −ϵα”(ψM ψL + θM θL ) 4.68 10−3            8.04 10−4
                                                     1−ϵ           −3               −3                                      1−ϵ             −3
       θC              ϵα”(ψN θK + θN ψK )/(1 + σ0 ) 2.33 10                −1.09 10           −ϵα”(ψM θL + ψM θL )/(1 + σ0 ) 5.16 10                 2.83 10−4
                                                     1−ϵ                                                                    1−ϵ
                 − (1−ϵ)
                     σ0 α”(θK ψN − ψK θN )/(1 + σ0 )                                      − (1−ϵ)
                                                                                              σ0 α”(θM ψL − ψM θL )/(1 + σ0 )
                                      ′ ′                          −3               −4                        ′
       ψM                          −β α (ψN ψA + θN θA ) 2.30 10             6.37 10                        −δ α”(ψL ψC + θL θC ) 1.05 10−3           4.20 10−5
                                                        ′                                                                      ′
                                                                   −3
       θM            −β ′ α′ (θN ψA + ψN θA )/(1 + 1−β
                                                     σ0 ) −1.79 10          −2.60 10−5        −δ ′ α”(θL ψC + ψL θC )/(1 + 1−β
                                                                                                                            σ0 )     1.58 10−2        2.34 10−3
                         ′                           ′                                            ′                           ′
                      ) ′                       1−β                                             )                        1−β
               − (1−β
                   σ0 α (θN ψA − ψN θA )/(1 + σ0 )                                      − (1−β
                                                                                            σ0 α”(θL ψC − ψL θC )/(1 + σ0 )
      ψN                       β ′ α′ (ψM ψA + θM θA ) −4.04 10−3         −6.69 10−4                     δ ′ α”(ψK ψC + θK θC ) −2.93 10−5         −3.97 10−4
                                                    ′                                                                        ′
                      ′ ′                                                                      ′
      θN            β α (θM ψA + ψM θA )/(1 + 1−βσ0 )   2.32 10−3         −6.19 10−5          δ α”(θK ψC + ψK θC )/(1 + 1−β
                                                                                                                          σ0 )   1.47 10−2         −5.21 10−3
                     ′                               ′                                        ′                               ′
                      ) ′                    1−β                                               )                      1−β
               + (1−β
                   σ0 α (θM ψA − ψM θA )/(1 + σ0 )                                      + (1−β
                                                                                            σ0 α”(θK ψC − ψK θC )/(1 + σ0 )
                                                                                                                                                                     Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                                                                                                                                                                                A P REPRINT
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT




Figure 3: Drivers of the entropy changes for each target variable. Panel (a) displays the barotropic variables:
ψA , ψ(K,L) , ψC , ψ(M,N ) , while panel (b) shows the baroclinic variables: θA , θ(K,L) , θC , θ(M,N ) . In the eight schemes,
the influencing and target groups are on the left and right, respectively. These are connected in the middle by arrows
labeled with the budget amplitudes (in 10−4 nats/time unit) and the nature of the processes acting on the target variable.
The leading terms appear in red.


(orography), ‘Fr’ (friction), ‘Nl1sy’ and ‘Nl1sg’ (synergetic and single contributions of NL1), and ‘Nl2sy’ and ‘Nl2sg’
(synergetic and single contributions of NL2). The groups of target variables are split into barotropic ψ (Fig. 3a) and
baroclinic θ (Fig. 3b), each one split into zonal/broad (mode A), zonal/sharp (mode C), eddy/broad (modes K,L) and
eddy/sharp (modes M,N). The zonal and eddy modes refer to longitude independent and longitude wavy dependent,
respectively, whereas the broad and sharp modes refer to latitude dependency with wave number 1 and 2, respectively.
The drivers (intervening in the different budget terms) can act as controllers or disturbers, corresponding respectively to
negative or positive entropy budget terms. The entropy budget terms concerning a group of target variables are obtained
as sums of the respective terms valid for the single target variables in the group. For instance, the NL2sy term of the
target group ψ(M,N ) and coming from the influencing group ψ(C,K,L) , θ(C,K,L) is the sum of the respective NL2sy
terms appearing in the entropy budget of ψM and ψN .
The analysis of the leading budget terms of barotropic modes (Fig. 3a) reveals that the barotropic/zonal/broad mode ψA
is mostly orographically disturbed by eddy/broad modes, whereas the barotropic/zonal/sharp mode ψC is disturbed


                                                             12
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



by the synergy across eddy modes from NL2. The barotropic/eddy/broad modes ψ(K,L) are mostly disturbed by the
single contributions of eddy/broad modes in NL1 and controlled by the synergy of eddy/sharp modes of NL2. The
barotropic/eddy/sharp modes ψ(M,N ) are mostly disturbed by eddy modes through friction and orography.
Similarly for the baroclinic modes (Fig. 3b), the analysis reveals that the barotropic/zonal/broad mode θA is mostly
disturbed by the synergy of eddy/broad modes through the NL1 terms, whereas the baroclinic/zonal/sharp mode θC is
mostly disturbed by the friction from the barotropic/zonal/sharp mode, by the orographic forcing of the eddy modes and
by the synergy of eddy modes through NL2 terms. The baroclinic/eddy/broad modes θ(K,L) are mostly disturbed by
friction coming from eddy/broad modes and controlled by single contributions of NL2 coming from eddy/sharp modes.
Finally, the baroclinic/eddy/sharp modes θ(M,N ) are mostly disturbed by friction coming from eddy/sharp modes and
the synergy of eddy/broad modes of NL2.

5     The Liang’s approach based on linear stochastic modelling
Liang developed an approach to estimate the single RETs from time series (Liang, 2014, 2021). It relies on the
assumption that the system may be described by a stochastic linear system. This assumption allows to get a simple
closed form of the rate of information transfer based on covariances between the observables and their temporal
derivatives. We will first test this approach to check the type of information one can gather, and then extend the
methodology by using nonlinear observables as in Pires et al. (2024) and Docquier et al. (2024). We will show that one
can indeed have access to the different terms of the entropy budget, provided that the Gaussian assumption is reasonably
met.

5.1   Liang’s approach (linear estimator)

Figure 4 displays the estimated RET based on the linear assumption for the first 6 variables, ψA , θA , ψK , θK , ψL , θL .
The length of the time series used is 500,000 data points sampled every 0.05 time units (equivalent to 0.0055 days),
covering 2,750 days. An error bar is also provided through a bootstrap method with replacement (100 bootstrap
samples were generated). A first general remark is the absence of information transfer from the second group of
variables to the first group. This result is indeed reasonable when one looks at the single RETs from the second group
to the first one in Table 1, which are relatively small. The amplitude of the RETs between the variables of the first
group, ψA , θA , ψK , θK , ψL , θL , are much larger. The RETs found via the Liang’s approach (Figure 4) are however
not always of the right amplitude and/or sign compared to the nonlinear case (Table 1). For the case of ψA as a target
variable, the values of the linear influence of θL and ψL are a little too small in amplitude as compared to the single
RETs displayed in Table 1, even if the equation related to ψA is linear: T (θL → ψA ) = −1.3910−3 with the linear
approach, while it is equal to −5.9310−3 when including nonlinearities as computed in Section 2.1 (Table 1), and
T (ψL → ψA ) = 6.5610−3 with the Liang’s method, while it is equal to 1.1210−2 with nonlinearities (Table 1). A
similar picture is found when nonlinearities play a role as illustrated for instance with the variable ψK , where strong
dependencies on θK and θL are found, which are quite different to the linear RETs of Table 1.
Figure 5 displays the RETs from the Liang’s approach for the second group of variables ψC , θC , ψM , θM , ψN , θN .
The first group of variables does not influence much the second group. Within the second group, although most of the
important variables influencing the target variables are picked up by the Liang’s approach, the amplitudes and/or signs
are in general not the appropriate ones.
In view of the above considerations on the linear approximation, one may wonder how things may be improved, in
particular concerning the amplitude and sign of the rates of information transfer for nonlinear models. A possibility is
to fit a nonlinear function to the conditional averages, as done in Pires et al. (2024), and to compute the RETs. This
approach, although successful, may however be strongly dependent on the quality of the fits defined by trial and error,
and we will not proceed in that direction here as it was already discussed in Pires et al. (2024). Another possibility is
to keep the linear assumption and to add new observables that take into account the nonlinearities of the dynamical
equations. This is the approach adopted in the next section.

5.2   Extension of the Liang’s approach to the nonlinear terms

In the context of the CS model, there are 12 variables in total. If we want to define new nonlinear observables, we
could of course take polynomial functions of these 12 variables. If we consider quadratic terms only, it would lead
to 78 additional observables when combined blindly. One may also consider higher order polynomial terms of cubic
or quartic types. In such cases, the number of observables would grow considerably. It is however obvious that for
dynamical systems like the one discussed here, the advection is a dominant nonlinearity, implying that the quadratic
terms should play a major role in the dynamics, and the entropy changes. We will therefore consider these quadratic


                                                           13
        Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                   A P REPRINT




                          0.015
                                                                                              ψA
                                                                                              ψK
                                                                                              ψL
                           0.01                                                                0



                          0.005
              Transfer




                                 0



                         -0.005



                          -0.01
                                      ψA

                                            ψK

                                                 ψL

                                                      θA

                                                           θK

                                                                     θL

                                                                          ψC

                                                                               ψM

                                                                                    ψN

                                                                                         θC

                                                                                               θM

                                                                                                    θN
                         0.02
                                                                                              θA
                                                                                              θK
                                                                                              θL
                         0.01                                                                  0



                            0
              Transfer




                         -0.01



                         -0.02



                         -0.03
                                     ψA

                                           ψK

                                                 ψL

                                                      θA

                                                           θK

                                                                 θL

                                                                          ψC

                                                                               ψM

                                                                                    ψN

                                                                                         θC

                                                                                               θM

                                                                                                    θN




Figure 4: Rate of information transfer from the 12 variables to the target variables ψA , ψK , ψL (top panel), and
θA , θK , θL (bottom panel), as obtained with the linear stochastic approximation.




                                                                14
        Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                   A P REPRINT




                           0.02
                                                                                              ψC
                                                                                              ψM
                          0.015                                                               ψN
                                                                                               0
                           0.01

                          0.005
              Transfer




                                 0

                         -0.005

                          -0.01

                         -0.015

                          -0.02
                                      ψA

                                            ψK

                                                 ψL

                                                      θA

                                                           θK

                                                                     θL

                                                                          ψC

                                                                               ψM

                                                                                    ψN

                                                                                         θC

                                                                                               θM

                                                                                                    θN
                         0.04
                                                                                              θC
                                                                                              θM
                                                                                              θN
                         0.03                                                                  0



                         0.02
              Transfer




                         0.01



                            0



                         -0.01
                                     ψA

                                           ψK

                                                 ψL

                                                      θA

                                                           θK

                                                                 θL

                                                                          ψC

                                                                               ψM

                                                                                    ψN

                                                                                         θC

                                                                                               θM

                                                                                                    θN




Figure 5: Rate of information transfer from the 12 variables to the target variables ψC , ψM , ψN (top panel), and
θC , θM , θN (bottom panel), as obtained with the linear stochastic approximation.




                                                                15
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



                                   0.7
                                                                                ∆T=0.01 TU
                                                                                ∆T=0.05 TU
                                   0.6                                          ∆T=0.10 TU
                                                                                ∆T=0.20 TU

                                   0.5
               Self influence, %


                                   0.4

                                   0.3

                                   0.2

                                   0.1

                                    0
                                             ψA ψK   ψL   θA   θK   θL    ψC ψM ψN   θC   θM   θN


                                    0.4
                                                                                ∆T=0.01 TU
                                                                                ∆T=0.05 TU
                                   0.35                                         ∆T=0.10 TU
                                                                                ∆T=0.20 TU
                                    0.3

                                   0.25
               Noise term, %




                                    0.2

                                   0.15

                                    0.1

                                   0.05

                                         0
                                             ψA ψK ψL     θA   θK    θL   ψC ψM ψN   θC   θM   θN


Figure 6: SEG (top panel) and noise amplitude (bottom panel) for the different variables as obtained for four different
sampling rates ∆t = 0.01, 0.05, 0.10 and 0.20 time units. 100,000 data points are used for the estimations.




terms only. Finally, as we know the dynamical equations and for the purpose of demonstration, we will define the
additional observables as the nonlinearities displayed in Table 4.
In total, we use the 12 original variables plus the 32 nonlinear terms defined in Table 4 after removing the coefficients.
For instance, one nonlinearity that will be used and which appears in the evolution of θA is θK ψL − θL ψK . The other
nonlinearities follow using the same procedure. The 44 observables are now directly used in the approach of Liang
(2021).


                                                                    16
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



As our system is deterministic and all the observables (linear and nonlinear) of the original model are used, the fitting
with the linear stochastic model should produce very small stochastic noise, if any. Of course, the way the series is
sampled should also have an effect: when the sampling rate is reduced, some information is lost between the successive
observation points and the estimation of the time derivatives is less accurate. This should lead to an increase of the
noise component. To check this effect, we construct several series sampled at different rates and we apply the linear
stochastic model to these series. Four series are built at a sampling rate of δt = 0.01, 0.05, 0.1 and 0.2 time unit. For
this analysis, 500,000 data points were used for each series.
Figure 6 (lower panel) displays the percentage contribution of the noise as estimated by fitting the linear stochastic
model for the different target variables. As expected, the smaller the δt, the lower the contribution of the noise. Another
interesting result concerns the self influences as obtained for the different sampling times: they are usually all centered
around a similar value for the different variables, indicating the robustness of the estimation (Fig. 6, upper panel). Note
that for the largest sampling rate of 0.20 time units, the estimates of the self-contributions usually differ more from
the others. This feature suggests that in order to get robust results in the current context the sampling rate should be
relatively high. Thus, in the following, we will use a series sampled every δt = 0.05 time units in order to keep the
estimated noise below 5%. Moreover, as we will use a series of 500,000 points, i.e. 25,000 time units, the series covers
2,750 days, a sufficiently long period to get robust results.
Figure 7 displays the RETs for the three target variables ψA , ψK , ψL as a function of the observables used in the
adjustment of the linear stochastic model. The 14 first nonlinearities are displayed for visibility. The other ones
associated with the dynamics of the second group of variables are not displayed as their contributions are very close to
0. Note that the values cannot be directly compared with the values in Table 1 as this table contains RETs that are based
on the impact of the causal variables coming from all the terms in the right-hand side of the dynamical equations, or in
other words also from the nonlinear terms. One must therefore directly compare with the terms of the entropy balance
in Tables 3 and 4.
For the variable ψA (Fig. 7), a similar result is found as when using the Liang’s approach without nonlinear variables
(Fig. 4, upper panel). In this case, the introduction of the nonlinear terms do not improve the quality of the estimations
as could be expected since there is no nonlinear terms in its evolution. For the second variable ψK , already discussed
in Section 5.1, the dependencies on θK and θL are now reduced as compared with the results of Fig. 4a, getting an
appropriate amplitude as given in Table 3. More interestingly, the amplitude of the contributions to the nonlinear terms
are captured and are close to the values of the contributions of the nonlinear terms to the entropy budget listed in Table
4. In this case, the signs are also well respected. This discussion can be extended to the other variables as well for this
group (see also Fig. 8).
Now, let us look at the second group. In Figs. 9 and 10, the RETs are plotted as a function of the original set of variables
and the nonlinear terms affecting only this second group. The influence of the nonlinear terms of the first group are
close to 0, and are not displayed to get a better visibility. Now the amplitudes and signs are well represented. To give an
example, let us consider the variable ψC , for which the approach used in Section 5.1 indicates a dependence on θC
close to −0.02 (Fig. 5). With the approach using the nonlinear terms, one gets a positive value (see Fig. 9), close to
the value of the impact of θC reported in Table 3. Furthermore, the contributions of the nonlinear terms to the entropy
budget are now accessible with an appropriate amplitude.
The approach proposed here is very encouraging as it allows to have access to the different contributions of the entropy
budget. Still, some differences are present between the real values reported in the Tables 3-4 above and the estimations
based on this extended set of variables. The most interesting example is the case of ψA , for which both methods
proposed in this section are not giving the right amplitude (although the signs are correct). To understand this feature,
one must go back to the properties of the definition of the RETs given in Eq. (6), applied to the target variable ψA . Let
us consider the impact of the causal variable ψL . The RETs in this case is equal to the expectation of the ψA -derivative
of the conditional expectation of 0.5h01 ψL , given ψA . Figure 11 displays the conditional expectation as a function of
ψA , which indeed displays a complex dependence, far from the linear dependence we would expect in a purely linear
stochastic system. Furthermore, the probability density of ψA , also shown on this figure, is multimodal. These features
leads to an estimate of the RET, far more complicate than a simple linear dependence of the conditional expectation and
a Gaussian distribution of ψA as assumed by the linear stochastic representation. In such a situation, one must rather
rely on a proper estimate of the conditional expectation and the probability density of the target variable.


6   Conclusion

The information entropy budget and the rate of information transfer between variables has been studied in the context
of a reduced-order atmospheric model in which the key ingredients of the dynamics are present, namely the baroclinic
and barotropic instabilities, the instability related to the presence of an orography, the dissipation related to the surface


                                                             17
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT




                            0.02
                                                                                       ψA
                                                                                       ψK
                           0.015                                                       ψL
                                                                                        0
                            0.01
               Transfer


                           0.005

                               0

                          -0.005

                           -0.01
                                                   ψA
                                                   ψK
                                                   ψL
                                                   θA
                                                   θK
                                                    θL
                                                   ψC
                                                   ψM
                                                   ψN
                                                   θC
                                                   θM
                                                   θN
                                      ψA ψL + θA θL
                                       ψN ψC+ θNθC
                                      ψA ψK+ θKθA
                                      ψM ψC+ θMθC
                                        θK ψL- ψKθL
                                      θ M ψ N - ψ Mθ N
                                       θL ψA+ ψLθA
                                        θL ψA- ψLθA
                                       θN ψC+ ψNθC
                                       θN ψC- ψNθC
                                      θK ψA+ ψKθA
                                       θK ψA- ψKθA
                                      θM ψC+ ψMθC
                                      θ M ψ C - ψ Mθ C
Figure 7: Rate of information transfer for variables ψA (red squares), ψK (green full circles) and ψL (blue triangles) as
obtained with the Liang’s approach using the 12 original variables and the 32 nonlinearities appearing in the equations
of the model (see Table 4 or Appendix A). Only the influence of 16 nonlinearities are displayed as the others show
negligible influences.




                           0.07
                           0.06 θ A
                                θ
                           0.05 θK
                                  L
                           0.04 0
                           0.03
               Transfer




                           0.02
                           0.01
                              0
                          -0.01
                          -0.02
                          -0.03
                          -0.04
                          -0.05
                                                ψA
                                                ψK
                                                ψL
                                                θA
                                                θK
                                                 θL
                                                ψC
                                                ψM
                                                ψN
                                                θC
                                                θM
                                                θN
                                   ψA ψL + θA θL
                                    ψN ψC+ θNθC
                                   ψA ψK+ θKθA
                                   ψM ψC+ θMθC
                                     θK ψL- ψKθL
                                   θ M ψ N - ψ Mθ N
                                    θL ψA+ ψLθA
                                     θL ψA- ψLθA
                                    θN ψC+ ψNθC
                                    θN ψC- ψNθC
                                   θK ψA+ ψKθA
                                    θK ψA- ψKθA
                                   θM ψC+ ψMθC
                                   θ M ψ C - ψ Mθ C




            Figure 8: As in Fig.7 but for θA (red squares), θK (green full circles) and θL (blue triangles).



                                                           18
        Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                   A P REPRINT




                         0.015
                                                                               ψC
                                                                               ψM
                                                                               ψN
                          0.01                                                  0
             Transfer



                         0.005


                                0


                        -0.005
                                                 ψA
                                                 ψK
                                                 ψL
                                                 θA
                                                 θK
                                                  θL
                                                 ψC
                                                 ψM
                                                 ψN
                                                 θC
                                                 θM
                                                 θN
                                    ψK ψN + θK θN
                                     ψM ψL+ θMθL
                                     ψA ψN+ θNθA
                                      ψC ψL+ θCθL
                                    ψ A ψ M+ θ A θ M
                                      ψC ψK+ θCθK
                                     θK ψN+ ψKθN
                                     θM ψL+ ψMθL
                                      θK ψN- ψKθN
                                      θM ψL- ψMθL
                                     θN ψA+ ψNθA
                                      θL ψC+ ψLθC
                                      θN ψA- ψNθA
                                      θL ψC - ψLθC
                                    θ M ψ A + ψ Mθ A
                                     θK ψC + ψKθC
                                    θA ψM - ψAθM
                                      θC ψK - ψCθK
Figure 9: As in Fig.7 but for ψC (red squares), ψM (green full circles) and ψN (blue triangles). Note that the
nonlinearities displayed on the x-axis are different than in Fig.7.




                        0.04
                                                                                θC
                                                                                θM
                        0.03                                                    θN
                                                                                 0

                        0.02
             Transfer




                        0.01

                           0

                        -0.01
                                                 ψA
                                                 ψK
                                                 ψL
                                                 θA
                                                 θK
                                                  θL
                                                 ψC
                                                 ψM
                                                 ψN
                                                 θC
                                                 θM
                                                 θN
                                    ψK ψN + θK θN
                                     ψM ψL+ θMθL
                                     ψA ψN+ θNθA
                                      ψC ψL+ θCθL
                                    ψ A ψ M+ θ A θ M
                                      ψC ψK+ θCθK
                                     θK ψN+ ψKθN
                                     θM ψL+ ψMθL
                                      θK ψN- ψKθN
                                      θM ψL- ψMθL
                                     θN ψA+ ψNθA
                                      θL ψC+ ψLθC
                                      θN ψA- ψNθA
                                      θL ψC - ψLθC
                                    θ M ψ A + ψ Mθ A
                                     θK ψC + ψKθC
                                    θA ψM - ψAθM
                                      θC ψK - ψCθK




Figure 10: As in Fig.9 but for θC (red squares), θM (green full circles) and θN (blue triangles). Note that the
nonlinearities displayed on the x-axis are different than in Fig. 8.




                                                      19
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



                                                0.03                                                                  7
                                                             E(0.5 h01 ψL|ψA)
                                                               T(ψL ==> ψA)
                                               0.025                    p(ψA)                                         6

              E(0.5 h01 ψL|ψA), T(ψL ==> ψA)    0.02
                                                                                                                      5
                                               0.015
                                                                                                                      4




                                                                                                                          p(ψA)
                                                0.01
                                                                                                                      3
                                               0.005
                                                                                                                      2
                                                   0

                                               -0.005                                                                 1

                                                -0.01                                                                 0
                                                        0   0.1   0.2   0.3   0.4   0.5   0.6   0.7   0.8   0.9   1
                                                                                    ψA


Figure 11: Estimation of the conditional expectation of 0.5h01 ψL , given ψA (black continuous line); the RET,
T (ψL → ψA ) (red dotted line); and the probability density of ψA (blue dotted line).


friction, and the large-scale forcing inducing a meridional imbalance of energy (Charney and Straus, 1980). For the
parameters chosen in the present work, the solutions display a chaotic dynamics and sensitivity to initial conditions
reminiscent of the large-scale atmospheric dynamics in the extra-tropics. The approach used to compute the different
terms of the entropy budget and the rate of entropy transfer is based on the computation of conditional expectations,
following the recent theory developed in Pires et al. (2024).
The detailed information entropy budget analysis of this system reveals that:

       • The linear rotation terms plays a minor role in the generation of uncertainties as compared to the orography
         and the surface friction.
       • By far, the dominant contribution comes from the nonlinear advection terms. The decomposition of the
         contributions in synergetic and single (impact of each single variable on the target one) rates of information
         transfer reveals that for some variables the co-variability within the nonlinear terms measured by the synergy
         dominates, but the opposite may occur.
       • In view of the importance of the synergetic contributions in the transfer of information/uncertainties, the
         causality of a variable measured only by single contributions T (Xj → Xi ) could be misleading or restrictive.
       • The variables of the model can be split into two groups having little transfer of information from one another:
         the large-scale group (wavenumber 1 in latitude) and the small(er) scale group (wavenumber 2 in latitude).
         There are however important synergetic contributions from one group to the other that couple the two groups.

The rates of information transfer have been computed based on the knowledge of the dynamical equations of the system.
Although important conclusions can be drawn on the role of the different components of the system as detailed above, a
natural question is to know whether such type of influences can be extracted from observations. An analysis has been
done here using the approach developed by Liang (2021), which consists in fitting a linear stochastic model to the
system, allowing for computing transfer of information between single variables. In the current system, this approach
applied to the 12 variables spots relatively well the causal influences, but often does not lead to reasonable amplitudes
and signs of the rate of information transfer. Thus, caution is needed when applying the linear approach designed by
Liang (2021) to data displaying high nonlinearities, as already pinpointed in Pires et al. (2024).
An extension has been proposed and tested, in which the nonlinear advection terms are also used as potential causal
variables, leading to considerable improvements in amplitudes and signs. It allows to compute more appropriately the


                                                                                    20
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



contributions of the nonlinear terms to the entropy budget. This approach is very promising and should be used in future
studies in contexts in which nonlinear contributions are expected.
Still, the extension of the Liang’s approach to nonlinear terms does not improve all rate of information transfer, in
particular to strongly non-gaussian variables. Also, the approach does not allow to extract separately single and
synergetic contributions. In this context, one needs to rely on the approach proposed by Pires et al. (2024), in which
the conditional expectations should be fitted using nonlinear functions, after which Eqs. (5-6) may be used. Further
research in that direction are worth performing.
Causal analysis may be used for developing models that will allow for characterizing in a simple way the evolution of
the system under scrutiny. An interesting example of that development has been put forward by Liang et al. (2023) in
which the causality analysis based on the linear stochastic modeling is used to feed a neural network. This approach is
very promising, and the straightforward extension to nonlinear variables discussed in the current analysis could be an
easy way to uncover more appropriate causal links.
Another important extension of the current work is to investigate multi-scale systems as for instance land-atmosphere,
ocean-atmosphere or cryosphere-atmosphere systems to clarify the importance of such interactions in controlling the
atmospheric dynamics. This question will be taken up in the future by first investigating reduced-order coupled models
available on the qgs platform (https://github.com/Climdyn/qgs; accessed 23/03/2024) described in Demaeyer
et al. (2020) for which the dynamical properties originating from coupling are well understood. More complex models
fitted to the real Earth System could then be analyzed to clarify the flow of information.

7   acknowledgements
The authors are partly supported by ROADMAP (Role of ocean dynamics and Ocean-Atmosphere interactions in
Driving cliMAte variations and future Projections of impact-relevant extreme events; https://jpi-climate.eu/
project/roadmap/), a coordinated JPI-Climate/JPI-Oceans project. David Docquier and Stéphane Vannitsem are
also partly supported by the Belgian Federal Science Policy Office under contract B2/20E/P1/ROADMAP. David
Docquier is also funded by the Belgian Science Policy Office (BELSPO) under the RESIST project (contract no.
RT/23/RESIST). Carlos Pires is supported by Portuguese funds: Fundação para a Ciência e a Tecnologia (FCT)
I.P./MCTES through national funds (PIDDAC) – UIDB/50019/2020 (https://doi.org/10.54499/UIDB/50019/
2020), UIDP/50019/2020 (https://doi.org/10.54499/UIDP/50019/2020) and LA/P/0068/2020 (https://doi.
org/10.54499/LA/P/0068/2020), and the project JPIOCEANS/0001/2019 (ROADMAP).




                                                          21
           Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                      A P REPRINT



A     Dynamical Equations




               dψA                          1
                            = −k(ψA − θA ) + h01 (ψL − θL )                                                                   (A.1)
                dt                          2
               dψK
                            = −β”α(ψL ψA + θL θA ) − δα”(ψN ψC + θN θC ) − k(ψK − θK ) + β1 ψL                                (A.2)
                dt
               dψL                                                                                 1
                            = β”α(ψK ψA + θK θA ) + δα”(ψM ψC + θM θC ) − k(ψL − θL ) − β1 ψK − hn1 (ψA − θA )                (A.3)
               dt                                                                                 2
                                                     α′
      
           1 dθA                α                                            h” ∗
        1+                  = − (θK ψL − ψK θL ) − (θM ψN − ψM θN ) +           (θ − θA ) + kψA − (k + 2k ′ )θA
           σ0   dt              σ0                   σ0                      σ0 A
                                1
                              − h01 (ψL − θL )                                                                                (A.4)
                              2
         1 − β”       dθK                                                                      h”(1 − β”)
    1+                      = −β”α(θL ψA + ψL θA ) − δα”(θN ψC + ψN θC ) + kψK − (k + 2k ′ +              )θK + β1 θL
           σ0          dt                                                                           σ0
                                1 − β”
                              −        [α(θL ψA − ψL θA ) + α”(θN ψC − ψN θC )]                                               (A.5)
                                  σ0
                 
         1 − β”       dθL                                                                     h”(1 − β”)
    1+                      = β”α(θK ψA + ψK θA ) + δα”(θM ψC + ψM θC ) + kψL − (k + 2k ′ +              )θL − β1 θK
           σ0          dt                                                                          σ0
                                1                1 − β”
                              + hn1 (ψA − θA ) −          [α(θA ψK − ψA θK ) + α”(θC ψM − ψC θM )]                            (A.6)
                                2                  σ0
               dψC                                                                        1
                            = ϵα”(ψK ψN + θK θN ) − ϵα”(ψM ψL + θM θL ) − k(ψC − θC ) + h02 (ψN − θN )                        (A.7)
                dt                                                                        2
               dψM
                            = −β ′ α′ (ψN ψA + θN θA ) − δ ′ α”(ψL ψC + θL θC ) − k(ψM − θM ) + β2 ψN                         (A.8)
                dt
               dψN                                                                                       1
                            = β ′ α′ (ψM ψA + θM θA ) + δ ′ α”(ψK ψC + θK θC ) − k(ψN − θN ) − β2 ψM − hn2 (ψC − θC )          (A.9)
              dt                                                                                       2
         1 − ϵ dθC                                                                                h”(1 − ϵ)          1
      1+                    = ϵα”(θK ψN + ψK θN ) − ϵα”(θM ψL + ψM θL ) + kψC − (k + 2k ′ +                 )θC − h02 (ψN − θN )
          σ0    dt                                                                                    σ0             2
                                  1−ϵ
                              −         [α”(θK ψN − ψK θN ) + α”(θM ψL − ψM θL )]                                             (A.10)
                                    σ0
         1 − β′                                                                                      h”(1 − β ′ )
                 
                      dθM
    1+                      = −β ′ α′ (θN ψA + ψN θA ) − δ ′ α”(θL ψC + ψL θC ) + kψM − (k + 2k ′ +               )θM + β2 θN
           σ0          dt                                                                                σ0
                                  1 − β′ ′
                              −          [α (θN ψA − ψN θA ) + α”(θL ψC − θC ψL )]                                            (A.11)
                                    σ0
    1 − β ′ dθN                                                                                     h”(1 − β ′ )
          
 1+                         = β ′ α′ (θM ψA + ψM θA ) + δ ′ α”(θK ψC + ψK θC ) + kψN − (k + 2k ′ +               )θN − β2 θM
      σ0     dt                                                                                         σ0
                                  1                 1 − β′ ′
                              + hn2 (ψC − θC ) −             [α (θA ψM − ψA θM ) + α”(θC ψK − ψC θK )]                        (A.12)
                                  2                   σ0

                                                            22
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



where the coefficients,
                                                               n2
                                                   β”   =                                                      (A.13)
                                                            n2 + 1
                                                            n2 + 3
                                                   β′   =                                                      (A.14)
                                                            n2 + 4
                                                             p
                                                            8 (2)n
                                                   α    =                                                      (A.15)
                                                                3π
                                                                p
                                                            32 (2)n
                                                   α′   =                                                      (A.16)
                                                                p3π
                                                            64 (2)n
                                                   α”   =                                                      (A.17)
                                                                 3π
                                                               n2
                                                    δ   =                                                      (A.18)
                                                            n2 + 1
                                                            n2 − 3
                                                   δ′   =                                                      (A.19)
                                                            n2 + 4
                                                                n L cos(ϕ0 )
                                                   β1   =                                                      (A.20)
                                                            n2 + 1 R sin(ϕ0 )
                                                                n L cos(ϕ0 )
                                                   β2   =     2
                                                                                                               (A.21)
                                                            n + 4 R sin(ϕ0 )
                                                            3
                                                    ϵ   =                                                      (A.22)
                                                            4
                                               h01      =   αhk                                                (A.23)
                                                              αhk
                                               hn1      =                                                      (A.24)
                                                            n2 + 1
                                                            α”hk
                                               h02      =                                                      (A.25)
                                                               4
                                                             α”hk
                                               hn2      =                                                      (A.26)
                                                            n2 + 4
                                                                                                               (A.27)

and the values of the basic parameters are


                                             2k     = C ′ = k ′ = h” = 0.0114                                  (A.28)
                                             σ0     = 0.2                                                      (A.29)
                                             hk     = 0.1                                                      (A.30)
                                                      2Ly
                                              n     =      = 1.77                                              (A.31)
                                                       Lx
                                             θ1∗    = 0.18                                                     (A.32)
                                                                   −1
                                         f0         =   0.0001036s                                             (A.33)
                                         Ly         =   5000km                                                 (A.34)
where n is the aspect ratio, σ0 the static stability parameter, hk the amplitude of the orography, and f0 the Coriolis
parameter at ϕ0 = 45◦ .

References
Alexander MA, Bladé I, Newman M, Lanzante JR, Lau NC, Scott JD. 2002. The atmospheric bridge: The influence
  of ENSO teleconnections on air–sea interaction over the global oceans. J. Climate 15: 2205–2231, doi:10.1175/
  1520-0442(2002)015<2205:TABTIO>2.0.CO;2.
Allen M, Stott PA. 2003. Estimating signal amplitudes in optimal fingerprinting, part i: theory. Climate Dynamics 21:
  477–491, doi:10.1007/s00382-003-0313-9.


                                                              23
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



Bellprat O, Guemas V, Doblas-Reyes F, Donat MG. 2019. Towards reliable extreme weather and climate event attribution.
  Nature Communications 10(1732), doi:10.1038/s41467-019-09729-2.
Bellucci A, Gualdi S, et al ES. 2008. Nao–ocean circulation interactions in a coupled general circulation model. Climate
  Dynamics 31: 759–777, doi:10.1007/s00382-008-0408-4.
Cehelsky P, Tung KK. 1987. Theories of multiple equilibria and weather regimes—a critical reexamination.
  part ii: Baroclinic two-layer models. Journal of Atmospheric Sciences 44(21): 3282 – 3303, doi:10.1175/
  1520-0469(1987)044<3282:TOMEAW>2.0.CO;2, URL https://journals.ametsoc.org/view/journals/
  atsc/44/21/1520-0469_1987_044_3282_tomeaw_2_0_co_2.xml.
Charney JG, Straus DM. 1980. Form-drag instability, multiple equilibria and propagating planetary waves in baro-
  clinic, orographically forced, planetary wave systems. Journal of Atmospheric Sciences 37(6): 1157 – 1176,
  doi:10.1175/1520-0469(1980)037<1157:FDIMEA>2.0.CO;2, URL https://journals.ametsoc.org/view/
  journals/atsc/37/6/1520-0469_1980_037_1157_fdimea_2_0_co_2.xml.
Chen H, Chen S, Mu M. 2024. A statistical review on the optimal fingerprinting approach in climate change studies.
  Climate Dynamics 62: 1439–1446, doi:10.1007/s00382-023-06975-5.
Dalcher A, Kalnay E. 1987. Error growth and predictability in operational ECMWF forecasts. Tellus A: Dynamic
  Meteorology and Oceanography 39(5): 474–491.
Demaeyer J, De Cruz L, Vannitsem S. 2020. qgs: A flexible python framework of reduced-order multiscale climate
  models. Journal of Open Source Software : 2597doi:10.21105/joss.02597.
Demaeyer J, Vannitsem S. 2020. Correcting for model changes in statistical postprocessing – an approach based
  on response theory. Nonlinear Processes in Geophysics 27(2): 307–327, doi:10.5194/npg-27-307-2020, URL
  https://npg.copernicus.org/articles/27/307/2020/.
Di Capua G, Kretschmer M, Donner RV, van den Hurk B, Vellore R, Krishnan R, Coumou D. 2020a. Tropical and
  mid-latitude teleconnections interactingwith the Indian summer monsoon rainfall: a theory-guided causal effect
  network approach. Earth System Dynamics 11: 17–34, doi:10.5194/esd-11-17-2020.
Di Capua G, Runge J, Donner RV, van den Hurk B, Turner AG, Vellore R, Krishnan R, Coumou D. 2020b. Dominant
  patterns of interaction between the tropics and mid-latitudes in boreal summer: causal relationships and the role of
  timescales. Weather and Climate Dynamics 1: 519–539, doi:10.5194/wcd-1-519-2020.
Docquier D, Di Capua G, Donner RV, Pires CAL, Simon A, Vannitsem S. 2024. A comparison of two causal methods in
  the context of climate analyses. Nonlinear Processes in Geophysics 31(1): 115–136, doi:10.5194/npg-31-115-2024,
  URL https://npg.copernicus.org/articles/31/115/2024/.
Docquier D, Vannitsem S, Bellucci A. 2023. The rate of information transfer as a measure of ocean-atmosphere
  interactions. Earth System Dynamics 14: 577–591, doi:10.5194/esd-14-577-2023.
Docquier D, Vannitsem S, Ragone F, Wyser K, Liang XS. 2022. Causal links between Arctic sea ice and its potential
  drivers based on the rate of information transfer. Geophysical Research Letters 49(9): e2021GL095 892, doi:
  10.1029/2021GL095892.
Eckmann J, Ruelle D. 1985. Ergodic theory of chaos and strange attractors. Reviews of Modern Physics 57(3): 617–656,
  doi:10.1103/RevModPhys.57.617.
Granger CW. 1969. Investigating causal relations by econometric models and cross-spectral methods. Econometrica
  37(3): 424–438, doi:10.2307/1912791.
Gray RM. 2011. Entropy and information theory. Springer, New York.
Hagan DFT, Dolman HAJ, Wang G, Lim Kam Sian KTC, Yang K, Ullag W, Shen R. 2022. Contrasting ecosystem
  constraints on seasonal terrestrial CO2 and mean surface air temperature causality projections by the end of the 21st
  century. Environmental Research Letters 17: 124 019, doi:10.1088/1748-9326/aca551.
Hagan DFT, Wang G, Liang XS, Dolman HAJ. 2019. A time-varying causality formalism based on the liang–kleeman
  information flow for analyzing directed interactions in nonstationary climate systems. J. Climate 32: 7521–7537,
  doi:10.1175/JCLI-D-18-0881.1.
Hlaváčková-Schindler K, Paluš M, Vejmelka M, Bhattacharya J. 2007. Causality detection based on information-
  theoretic approaches in time series analysis. Physics Reports 441(1): 1–46, doi:https://doi.org/10.1016/j.physrep.
  2006.12.004, URL https://www.sciencedirect.com/science/article/pii/S0370157307000403.
Kleeman R. 2011. Information theory and dynamical system predictability. Entropy 13(3): 612–649, doi:10.3390/
  e13030612, URL https://www.mdpi.com/1099-4300/13/3/612.
Krakovská A, Jakubík J, Chvosteková M, Coufal D, Jajcay N, Paluš M. 2018. Comparison of six methods for the
  detection of causality in a bivariate time series. Physical Review E 97(4): 042 207, doi:10.1103/PhysRevE.97.042207.


                                                          24
         Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                    A P REPRINT



Liang XS. 2014. Unraveling the cause-effect relation between time series. Physical Review E 90(5): 052 150, doi:
  10.1103/PhysRevE.90.052150.
Liang XS. 2015. Normalizing the causality between time series. Physical Review E 92: 022 126, doi:10.1103/PhysRevE.
  92.022126.
Liang XS. 2016. Information flow and causality as rigorous notions ab initio. Physical Review E 94(5): 052 201,
  doi:10.1103/PhysRevE.94.052201.
Liang XS. 2021. Normalized multivariate time series causality analysis and causal graph reconstruction. Entropy 23(6):
  679, doi:10.3390/e23060679.
Liang XS, Chen D, Zhang R. 2023. Quantitative causality, causality-aided discovery, and causal machine learning.
  Ocean-Land-Atmosphere Research 2: 0026, doi:10.34133/olar.0026, URL https://spj.science.org/doi/abs/
  10.34133/olar.0026.
Liang XS, Kleeman R. 2005. Information transfer between dynamical system components. Physical Review Letters
  95(24): 244 101, doi:10.1103/PhysRevLett.95.244101.
Lorenz E. 1969. Atmospheric predictability as revealed by naturally occurring analogues. J. Atmos. Sci. : 636–646doi:
  10.1175/1520-0469(1969)26<636:APARBN>2.0.CO;2.
Lorenz EN. 1963. Deterministic nonperiodic flow. Journal of the Atmospheric Sciences 20(2): 130–141, doi:10.1175/
  1520-0469(1963)020<0130:DNF>2.0.CO;2.
Lorenz EN. 1982. Atmospheric predictability experiments with a large numerical model. Tellus 34(6): 505–513.
Mosedale TJ, Stephenson DB, Collins M, Mills TC. 2006. Granger causality of coupled climate processes: Ocean
  feedback on the North Atlantic Oscillation. Journal of Climate 19(7): 1182–1194.
Nicolis C, Vannitsem S, Royer JF. 1995. Short-range predictability of the atmosphere: Mechanisms for superexponential
  error growth. Quarterly Journal of the Royal Meteorological Society 121(523): 705–722.
Nicolis G, Nicolis C. 2012. Foundations of complex systems. World Scientific, Singapore.
Paluš M, Komárek V, Hrnčír Z, Štěrbová K. 2001. Synchronization as adjustment of information rates: Detection from
   bivariate time series. Physical Review E 63: 046 211, doi:110.1103/PhysRevE.63.046211.
Paolini LF, Omrani NE, Bellucci A, Athanasiadis PJ, Ruggieri P, Patrizio CR, Keenlyside N. 2024. Nonstationarity in
   the nao–gulf stream sst front interaction. Journal of Climate 37(5): 1629 – 1650, doi:10.1175/JCLI-D-23-0476.1,
   URL https://journals.ametsoc.org/view/journals/clim/37/5/JCLI-D-23-0476.1.xml.
Papagiannopoulou C, Miralles DG, Decubber S, Demuzere M, Verhoest NEC, Dorigo WA, Waegeman W. 2017b.
  A non-linear granger-causality framework to investigate climate–vegetation dynamics. Geosci. Model Dev. 10:
  1945–1960, doi:10.5194/gmd-10-1945-2017.
Papana A, Siggiridou E, Kugiumtzis D. 2021. Detecting direct causality in multivariate time series: A comparative
   study. Communications in Nonlinear Science and Numerical Simulation 99: 105 797, doi:https://doi.org/10.1016/j.
   cnsns.2021.105797, URL https://www.sciencedirect.com/science/article/pii/S1007570421001088.
Parker TS, Chua L. 1989. Practical numerical algorithms for chaotic systems. Springer Verlag: New York.
Pires C, Docquier D, Vannitsem S. 2024. A general theory to estimate information transfer in nonlinear systems. Physica
  D: Nonlinear Phenomena 458: 133 988, doi:10.1016/j.physd.2023.133988.
Runge J. 2018. Causal network reconstruction from time series: From theoretical assumptions to practical estimation.
  Chaos 28: 075 310, doi:10.1063/1.5025050.
Runge J, Bathiany S, Bollt E, Camps-Valls G, Coumou D, Deyle E, Glymour C, Kretschmer M, Mahecha MD, Munoz-
   Mari J, van Nes EH, Peters J, Quax R, Reichstein M, Scheffer M, Scholkopf B, Spirtes P, Sugihara G, Sun J, Zhang
   K, Zscheischler J. 2019a. Inferring causation from time series in Earth system sciences. Nature Communications 10:
   2553, doi:10.1038/s41467-019-10105-3.
Runge J, Nowack P, Kretschmer M, Flaxman S, Sejdinovic D. 2019b. Detecting and quantifying causal associations in
   large nonlinear time series datasets. Science Advances 5: 11, doi:10.1126/sciadv.aau4996.
Sardeshmukh PD, Penland C. 2015. Understanding the distinctively skewed and heavy tailed character of atmospheric
   and oceanic probability distributions. Chaos: An Interdisciplinary Journal of Nonlinear Science 25(3): 036 410,
   doi:10.1063/1.4914169, URL https://doi.org/10.1063/1.4914169.
Savijarvi H. 1995. Error growth in a large numerical forecast system. Monthly Weather Review 123(1): 212–221.
Schemm S, Rivière G, Ciasto LM, Li C. 2018. Extratropical cyclogenesis changes in connection with tropospheric
   ENSO teleconnections to the North Atlantic: Role of stationary and transient waves. J. Atmos. Sci. 75: 3943–3964,
   doi:10.1175/JAS-D-17-0340.1.


                                                          25
        Causal dependencies and Shannon entropy budget - Analysis of a reduced order atmospheric model
                                                                                                   A P REPRINT



Schreiber T. 2000. Measuring information transfer. Physical Review Letters 85(2): 461–464, doi:10.1103/PhysRevLett.
   85.461.
Silini R, Masoller C. 2021. Fast and effective pseudo transfer entropy for bivariate data-driven causal influences.
  Scientific Reports 11: 8423, doi:10.1038/s41598-021-87818-3.
Silini R, Tirabassi G, Barreiro M, Ferranti L, Masoller C. 2022. Assessing causal dependencies in climatic indices.
  Climate Dynamics 61: 79–89, doi:10.1007/s00382-022-06562-0.
Stips A, Macias D, Coughlan C, Garcia-Gorriz E, Liang XS. 2016. On the causal structure between co2 and global
   temperature. Scientific Reports 6(21691), doi:10.1038/srep21691.
Sugihara G, May R, Ye H, Hsieh CH, Deyle E, Fogarty M, Munch S. 2012. Detecting causality in complex ecosystems.
  Science 338(6106): 496–500, doi:10.1126/science.1227079.
Tirabassi G, Masoller C, Barreiro M. 2015. A study of the air–sea interaction in the South Atlantic Convergence Zone
   through Granger causality. International Journal of Climatology 35: 3440–3453, doi:10.1002/joc.4218.
Vannitsem S. 2017. Predictability of large-scale atmospheric motions: Lyapunov exponents and error dynamics. Chaos
   27: 32 101, doi:10.1063/1.4979042.
Vannitsem S. 2023. Weather pattern dynamics over western europe under climate change: predictability, information
   entropy and production. Nonlinear Processes in Geophysics 30(1): 1–12, doi:10.5194/npg-30-1-2023, URL https:
  //npg.copernicus.org/articles/30/1/2023/.
Vannitsem S, Dalaiden Q, Goosse H. 2019. Testing for dynamical dependence: Application to the surface mass balance
   over Antarctica. Geophysical Research Letters 46(21): 12 125–12 135, doi:10.1029/2019GL084329.
Vannitsem S, Ghil M. 2017. Evidence of coupling in ocean-atmosphere dynamics over the North Atlantic. Geophys.
  Res. Lett. 44(4): 2016–2026.
Vannitsem S, Liang XS. 2022. Dynamical dependencies at monthly and interannual time scales in the climate system:
   Study of the North Pacific and Atlantic regions. Tellus A 74: 141–158, doi:10.16993/tellusa.44.
Xavier AK, Demaeyer J, Vannitsem S. 2023. Variability and predictability of a reduced-order land atmosphere coupled
   model. EGUsphere 2023: 1–26, doi:10.5194/egusphere-2023-2257, URL https://egusphere.copernicus.
   org/preprints/2023/egusphere-2023-2257/.
Yeh SW, Cai W, Min SK, McPhaden MJ, Dommenget D, Dewitte B, Collins M, Ashok K, An SI, Yim BY, Kug
  JS. 2018. Enso atmospheric teleconnections and their response to greenhouse gas forcing. Reviews of Geophysics
   56(1): 185–206, doi:https://doi.org/10.1002/2017RG000568, URL https://agupubs.onlinelibrary.wiley.
   com/doi/abs/10.1002/2017RG000568.
Zhou F, Hagan DFT, Wang G, Liang XS, Li S, Shao Y, Yeboah E, Wei X. 2024. Estimating time-dependent structures
   in a multivariate causality for land–atmosphere interactions. Journal of Climate 37(6): 1853 – 1876, doi:10.1175/
  JCLI-D-23-0207.1, URL https://journals.ametsoc.org/view/journals/clim/37/6/JCLI-D-23-0207.
  1.xml.




                                                        26
