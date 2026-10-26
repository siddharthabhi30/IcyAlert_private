# Full-text extraction

- Title: A General Theory to Estimate Information Transfer in Nonlinear Systems
- Year: 2024
- DOI: https://doi.org/10.1016/j.physd.2023.133988
- PDF source: https://arxiv.org/pdf/2307.10623
- Extraction: `pdftotext -layout` from the verified local PDF

---

A general theory to estimate Information transfer in nonlinear systems
                       Carlos A. Pires (*), (1), David Docquier, (2), Stéphane Vannitsem, (2)



    (1) Universidade de Lisboa, Faculdade de Ciências, Instituto Dom Luiz, Lisboa, Portugal.
    (2) Royal Meteorological Institute of Belgium, Brussels, Belgium.



∗ Corresponding author: E-mail address: clpires@fc.ul.pt

Address: Carlos A. L. Pires. Faculdade de Ciências, Edifício C8, DEGGE, Campo Grande 16, 1749-016 Lisboa,
Portugal

Submission to: ‘Physica D: Nonlinear Phenomena’, Revised version October 2023

Abstract

A general theory for computing information transfers in nonlinear stochastic systems driven by deterministic
forcings and additive and/or multiplicative noises, is presented, satisfying indistinctly closed, periodic or pdf
vanishing boundary conditions of the state-space. It extends the Liang-Kleeman (LK) framework of causality
inference to nonlinear cases based on information transfer across system variables (Liang, 2016. Information flow
and causality as rigorous notions ab initio. Phys. Rev. E, 94: 052201. DOI: 10.1103/PhysRevE.94.052201). We present
an effective method of computing formulas of the rates of Shannon entropy transfer (RETs) between selected causal
and consequential variables, the ‘Causal Sensitivity Method’ (CSM), relying on the estimation from data of
conditional expectations of the system forcings and their derivatives. Those expectations are approximated by
nonlinear differentiable regressions, leading to a much easier and more robust way of computing RETs than the
‘brute-force’ approach calling for numerical integrals over the state-space and the knowledge of the multivariate
probability density function of the system. The CSM is furthermore fully adapted to the case where no model
equations are available, starting with a nonlinear model fitting from data of the consequential variables, with the
subsequent application of CSM to the fitted model. RETs are decomposed into deterministic and stochastic
components, being compensated by the self generation of entropy. Moreover, RETs are decomposed into sums of
single one-to-one RETs plus synergetic terms (of pure nonlinear nature) accounting for the joint causal effect of
groups of variables. State-dependent (or specific) RET formulas are also introduced, puting in evidence where in
state-space the entropy transfers and local synergies are more relevant. A comparison of the RETs estimations is
performed between: 1) the ‘brute-force’, expensive (taken as benchmark), probability-density-based approach (AN),
2) the CSM-based approach with and/or without model fitting, and the multivariate linear (ML) approach, in the
context of two different models: (i) a model derived from a potential function and (ii) the classical chaotic Lorenz
system, both forced by additive and/or multiplicative noises. The analysis demonstrates that the CSM estimations
are robust, cheaper, and less data-demanding than the AN-reference values in the different experiments, providing
evidence of the possibilities and generalizations offered by the method (e.g. causality diagnostics between
subspaces) and opening new perspectives on real-world applications.

Keywords: Information flow/transfer, causality, entropy budget, nonlinear synergy, causal sensitivity




                                                                                                                  1
1. Introduction

Causal inference has a long history in a wide range of fields as discussed for instance in the overview of Pearl [1]
from medicine to social sciences. The nice example put forward by Pearl [1] is the question on the influence of
symptoms on the actual disease of a patient. Finding the directionality of the influence from the cause to the
consequence is therefore key in answering such type of question, building in that way a graph of influence from one
process to another.

One famous approach to analyze such types of problems is the Granger’s causality which consists in evaluating
whether one variable X, provides additional predictive power to the forecast of another variable Y, implying that X
is a cause of Y [2]. This approach has been applied in many different contexts from economy to atmospheric
variability [3-4]. Since these early developments, other methods have been designed, in particular in the context of
information theory. In the 1970s, this question was addressed by the development of the directed information
theory [5,6]. Since then, many information-theoretic techniques have been designed and compared, e.g. Schreiber
[7] and Hlavackova-Schindler et al. [8] . Other approaches based on dynamical systems theory or connected directed
networks have been also developed in parallel and illustrated in different applications [9,10].

One important development in the conjunction of dynamical systems theory and information theory has been
initiated by Liang and Kleeman [11]. They developed a theory of the rate of information transfer between specific
variables starting from the fundamental dynamical equations describing the evolution of the Shannon entropy. The
theory was then considerably expanded in a series of papers by Liang [12-18], culminating on one side to analytical
expressions of the rate of information transfer in multivariate systems, and on the other side, to specific simple
expressions that can be used when dealing pragmatically with time series. The latter developments were done by
assuming that the system underlying the dynamics of the observed data could be approximated by a multivariate
linear stochastic system with additive noise [18], i.e. a multivariate Ornstein-Uhlenbeck process. These tools have,
in particular, considerably been used in the context of climate science [19-25].

This linear approximation, however, is restrictive as some important nonlinear interactions could be missed. In the
present work, the extension of the estimation to nonlinear dynamical systems will be addressed. The main objective
is therefore to find a closed formula, to evaluate the rate of entropy transfer (RET) – equivalent to the rate of
information transfer in Liang-Kleeman’s (LK)’s theory - in nonlinear systems forced by additive or multiplicative noise
that can be robustly estimated from data (e.g. time-series or time-evolving ensembles), under closed and/or
periodic or pdf vanishing boundary conditions. The main idea is to apply the hereafter called ‘Causal Sensitivity
Method’ (CSM) relying on the computation of conditional expectations (and their derivatives or sensitivities) of the
deterministic and stochastic terms of the model, for a selected consequential variable.

This applies also to the computation of the Shannon entropy budget terms, bridging them with the RETs. This raises
the important concept of synergetic causality, coming from the joint effects of groups of variables, not accounted
for in single variable-to-variable RETs. Formulas of RETs have been obtained for closed or periodic boundary
conditions in the state-space. Open conditions in the state-space call for additional boundary terms in the entropy
budget.

Comparison and validation of the different approaches to estimating the RETs is performed, namely:

a) The analytical-numerical (AN) method where the model stochastic equations are known and the probability
density function (pdf), (analytical or estimated from data) is used with ‘brute-force’ in the integral formula of RET in
state-space.




                                                                                                                      2
b) The CSM approach developed in the context of this study, based on conditional expectations (obtained from
nonlinear regressions) and their derivatives with respect to the selected consequential variable. Here the model
equations are supposed to be known.

c) The model fitting (MF), from data, of both the deterministic term and of the diffusivity coefficients, with
subsequent application of the CSM to the fitted model. Only the evolution equation of the selected consequential
variable is necessary.

d) The multivariate linear (ML) approach proposed in Liang [18], supposing a multivariate linear model fitting forced
by additive noise.

The analysis is performed in the context of two different models: a potential model following Liang [16,17] and the
famous Lorenz model [26], where the advantages of the CSM and MF approaches are exemplified.

Sections 2 and 3 are devoted to the fundamental theory of the entropy budget and the rates of entropy transfer
respectively. Section 4 explains the numerical aspects of the different techniques. Section 5 describes the results
obtained with the potential model for which one performs a sensitivity analysis to the presence of linear, and
nonlinear terms and additive or multiplicative noises, as well as with respect to the time-series length. In Section 6,
the approach is also illustrated in the context of the Lorenz model, with the specific purpose of providing robust
examples of estimations based on data only, and with a particular interest of trying to obtain good RET estimations
from quite short time-series, simulating real situations of low data availability. Finally in Sec. 7, the main results are
summarized and discussed, together with potential extensions of this type of analysis to more complex and higher
dimension systems. Three appendices are added with theoretical proofs, numerical technicalities and a list of
symbols and achronyms.

2. Theory of the entropy budget

Let us consider a 𝐷-dimensional stochastic continuous system described by the state vector 𝐗 = (𝑋1 , … , 𝑋𝐷 )𝑇
(where 𝑇 stands for transpose) and a parameter vector 𝛉, which evolves by Euler-Bernstein equations:
                                                   𝑛𝐷
         𝑋𝑖 (𝑡 + 𝑑𝑡) = 𝑋𝑖 (𝑡) + 𝐹𝑖 (𝐗, 𝛉, 𝑡)𝑑𝑡 + ∑𝑘=1 𝐵𝑖,𝑘 (𝐗, 𝛉, 𝑡)𝑑𝑊𝑘 , 𝑖 = 1, . . . , 𝐷                                   (1)

where 𝐹𝑖 (𝐗, 𝛉, 𝑡) are the deterministic terms, a component of the 𝐷 -dimensional differentiable vector 𝐅. Stochastic
forcings are introduced where 𝑑𝑊𝑘 ~√𝑑𝑡 𝑁(0, 1) are independent Wiener processes and 𝐵𝑖,𝑘 are noise-diffusion
coefficients, merged in the differentiable matrix 𝐁, from which one builts the positive-definite matrix of pdf
                                                𝐷𝑛
diffusivities 𝐆 ≡ 𝐁𝐁𝑻 with elements 𝑔𝑖,𝑗 ≡ ∑𝑘=1     𝐵𝑖,𝑘 𝐵𝑗,𝑘 .

We will hereafter denote by 𝑋~𝑖 ≡ (𝑋1 , … , 𝑋𝑖−1 , 𝑋𝑖+1 , … , 𝑋𝐷 )𝑇 the set of variables different from 𝑋𝑖 or its
complementary vector, which will be used to discuss the effect of 𝑋~𝑖 , taken as a set of causal variables on 𝑋𝑖 taken
as a consequential variable.

In this work, we adopt the approach introduced originally by Liang [11-18,27], relying upon the concept of Shannon
                                                                 𝑑𝐻𝑋𝑖
entropy 𝐻𝑋𝑖 = 𝐸(− log 𝜌𝑖 ) of 𝑋𝑖 and its rate of change                 . In the formula, 𝜌𝑖 denotes the probability density
                                                                  𝑑𝑡
function (pdf) of 𝑋𝑖 and 𝐸 stands for expectation operator over the state-space. When the rate is positive (negative),
                                                                                                      𝑑𝐻𝑋𝑖
there is a loss (gain) of information and 𝑋𝑖 becomes less (more) precise. For Gaussian pdfs,           𝑑𝑡
                                                                                                             is the the relative
                                                                    𝑑𝐻𝑋𝑖
rate of variation of the variance 𝑣𝑎𝑟(𝑋𝑖 ) per time unit (e.g.         𝑑𝑡
                                                                            = 2 means that variance doubles at every unit of
time).



                                                                                                                              3
                                                                                                     𝑑𝐻𝑋𝑖
In that framework, one aims to decompose the rate of entropy change (REC)                             𝑑𝑡
                                                                                                            as:
                                         𝑑𝐻𝑋𝑖                                𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓
                                          𝑑𝑡
                                                = 𝑇(𝑋~𝑖 → 𝑋𝑖 ) +                  𝑑𝑡
                                                                                                                                   (2)

where the first term comes from the influence of 𝑋~𝑖 on 𝑋𝑖 or the rate of entropy transfer (RET) and the second
term is the self entropy generation (SEG), obtained in a process where 𝑋~𝑖 is ‘frozen in time’, i.e. REC=SEG+RET. This
problem was solved for two-dimensional systems (Theorem 5.1. of Liang [27]) leading to the following rate of
entropy transfer:
                                                                                        1 𝜕𝐹1 𝜌1     1    1 𝜕2 𝑔 𝜌
                                𝑇(𝑋2 → 𝑋1 ) = 𝑇(𝑋~1 → 𝑋1 ) = −𝐸 (𝜌                         𝜕𝑋
                                                                                                 ) + 2 𝐸 (𝜌 𝜕𝑋1,12 1 )             (3)
                                                                                         1    1            1    1


where 𝑋~1 = 𝑋2 is the complementary of vector of 𝑋1 in two-dimensional systems. That RET expression can be
generalized to any dimension 𝐷 ≥ 3 in the form:
                                      1 𝜕𝐹𝑖 𝜌𝑖     1     1 𝜕2 𝑔𝑖,𝑖 𝜌𝑖
               𝑇(𝑋~𝑖 → 𝑋𝑖 ) = −𝐸 (𝜌            ) +   𝐸 (𝜌𝑖 𝜕𝑋𝑖2
                                                                      ) = 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 + 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔 ,                        (4)
                                       𝑖 𝜕𝑋𝑖       2

where 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 and 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔 are respectively the determinist RET (D-RET), subindexed with 𝐹,
depending on 𝐹𝑖 and the stochastic RET (S-RET), subindexed with 𝑔, depending on 𝑔𝑖,𝑖 . The same subindexes will be
taken along the manuscript for other quantities. The proof of (4) (in Appendix A1) comes from the expression of the
Frobenius-Perron operator governing the time evolution of the pdf of 𝑋𝑖 in the stochastic process where 𝑋~𝑖 is
frozen in the period [𝑡, 𝑡 + 𝑑𝑡], by using a similar procedure to that of Propositions VI.2, VI.3 and VI.4 of Liang in
2016 [16]. Since, the full state-space is spanned by 𝑋𝑖 and 𝑋~𝑖 , there are no ‘indirect’ transfers, via excluded
variables.

The rate of variation of 𝐻𝑋𝑖 (2) is obtained from the Fokker-Plank equation, governing the time evolution of the pdf
𝜌𝐗 of the system:
                                         𝜕𝜌𝐗          𝜕𝐹𝑗 𝜌𝐗   1 𝐷     𝜕2 𝑔 𝜌
                                             = − ∑𝐷
                                                  𝑗=1        +   ∑𝑗,𝑘=1 𝑗,𝑘 𝐗 ,                                                    (5)
                                          𝜕𝑡           𝜕𝑋𝑗     2       𝜕𝑋𝑗 𝜕𝑋𝑘

by multiplying by −(1 + log 𝜌𝑖 ) and integrating over the state-space domain. We further indistinctly assume one of
the boundary conditions in the state-space: 1) vanishing 𝜌𝐗 when ‖𝐗‖ → ∞ or at the border of the pdf support set,
                                                                                    𝜕𝑔𝑖,𝑘 𝜌𝐗
2) closed and non-diffusive boundary conditions i.e 𝜌𝐗 𝐹𝑖 = ∑𝐷
                                                             𝑗,𝑘=1                      𝜕𝑋𝑘
                                                                                                = 0 at borders perpendicular to the 𝑋𝑖
direction, 3) periodic boundary conditions at the support set border.

Under those quite generic boundary conditions, we obtain the rate of entropy change decomposed into the
deterministic part (D-REC), depending on 𝐹𝑖 and the stochastic part (S-REC), depending on 𝑔𝑖,𝑖 as:
                                       𝑑𝐻𝑋𝑖         𝑑𝐻𝑋                𝑑𝐻𝑋
                                         𝑑𝑡
                                               = ( 𝑑𝑡 𝑖 ) + ( 𝑑𝑡 𝑖 ) ,                                                            (6a)
                                                          𝐹                   𝑔

                                         𝑑𝐻𝑋                  𝜕𝐹                  𝜕 log 𝜌~𝑖|𝑖
                                       ( 𝑑𝑡 𝑖 ) = 𝐸 (𝜕𝑋𝑖 ) + 𝐸 [𝐹𝑖                     𝜕𝑋𝑖
                                                                                                ],                                (6b)
                                                𝐹                  𝑖

                                         𝑑𝐻𝑋              1             𝑑 2 log 𝜌𝑖
                                        ( 𝑑𝑡 𝑖 ) = − 2 𝐸 [𝑔𝑖,𝑖             𝑑𝑋𝑖2
                                                                                   ],                                             (6c)
                                                𝑔

where 𝜌~𝑖|𝑖 is the conditional pdf of 𝑋~𝑖 given 𝑋𝑖 .




                                                                                                                                    4
When any of the above considered boundary conditions do not hold, then extra terms must be added to (6b,6c).
For instance,     for open boundary                 conditions, we must add terms                               ∮𝜕𝑆 𝜌𝐗 [− log(𝜌𝑖 )] 𝐅 ∙ 𝐧 dl   and
                   1                                              𝑑𝐻𝑋𝑖                𝑑𝐻𝑋𝑖
∮𝜕𝑆 𝜌𝐗 [− log(𝜌𝑖 )] 2 ∇(∇ ∙ 𝐆) ∙ 𝐧 dl, respectively to ( 𝑑𝑡 ) and ( 𝑑𝑡 ) , representing the externally driven inward
                                                                          𝐹                     𝑔
(deterministic and diffusive) fluxes of entropy 𝐻𝑋𝑖 along the border 𝜕𝑆 of the pdf support 𝑆 in the state-space. In
the expressions, 𝐧 is the inward unit vector, the dot represents inner product, ∇ is the gradient operator and dl is
the infinitesimal element of 𝜕𝑆. Those terms appear, for instance, when a non-null 𝐅 is imposed by some external
control at the system boundary 𝜕𝑆 as it in certain thermodynamical open systems. An example of that is the case of
a mass of moist air subjected to liquid-evaporation and vapour-condensation and taking the mass 𝑀𝑣 of vapour as
a dynamical state variable, which is lower-bounded by zero (dry conditions) and upper-bounded by the saturation
value. Therefore, the sum of boundary terms contributing to the budget of Shannon entropy (uncertainty) is
−𝜌𝑑𝑟𝑦 log(𝜌𝑑𝑟𝑦 ) 𝑀̇𝑣,𝑑𝑟𝑦 + 𝜌𝑠𝑎𝑡 log(𝜌𝑠𝑎𝑡 ) 𝑀̇𝑣,𝑠𝑎𝑡 where 𝜌𝑑𝑟𝑦 , 𝜌𝑠𝑎𝑡 are the pdfs at dry and saturated states
respectively, 𝑀̇𝑣,𝑑𝑟𝑦 is the rate of liquid-evaporation at dry conditions and 𝑀̇𝑣,𝑠𝑎𝑡 is the rate of vapour-condensation
at saturated conditions. That shows that the importation/exportation of entropy through at the bounds of state-
variables can affect the causality. Despite their great interest, the effect of boundary fluxes in the state-space is out
of the scope of this study and will henceforth not be considered.
                                                                               𝑑𝐻𝑋
Therefore, under closed or periodic boundaries, the S-REC ( 𝑑𝑡 𝑖 ) is further decomposed as:
                                                                                        𝑔

                                              𝑑𝐻𝑋                𝑑𝐻𝑋                𝑑𝐻𝑋
                                          ( 𝑑𝑡 𝑖 ) = ( 𝑑𝑡 𝑖 )                  + ( 𝑑𝑡 𝑖 )                                                      (7a)
                                                         𝑔               𝑔,𝑎                  𝑔,𝑚

                                              𝑑𝐻𝑋𝑖               1              𝑑 log 𝜌𝑖 2
                                         (           )         = 𝐸 [𝑔𝑖,𝑖 (              ) ]≥0                                                  (7b)
                                               𝑑𝑡    𝑔,𝑎         2                𝑑𝑋𝑖

                                              𝑑𝐻𝑋𝑖                   1     𝑔     𝑑 2 𝜌𝑖
                                          (          )         = − 𝐸 [ 𝑖,𝑖              ]                                                      (7c)
                                               𝑑𝑡        𝑔,𝑚         2        𝜌𝑖 𝑑𝑋𝑖2

where (7b) and (7c) are, respectively, the additive-noise part of S-REC and the multiplicative-noise part of S-REC.

(7b) is always non-negative, being an entropy source coming from the dynamical noise. The term (7c) is null
whenever 𝑔𝑖,𝑖 is constant (i.e. under an additive noise). A non-vanishing (7c) value calls for a state dependent or
multiplicative noise.

After taking the difference between (6a) and (4), we obtain the SEG decomposed in its deterministic and stochastic
parts:
                                 𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓       𝑑𝐻𝑋𝑖                                      𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓       𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓
                                    𝑑𝑡
                                              =     𝑑𝑡
                                                             − 𝑇(𝑋~𝑖 → 𝑋𝑖 ) = (                𝑑𝑡
                                                                                                         ) +(   𝑑𝑡
                                                                                                                          )                     (8)
                                                                                                         𝐹                𝑔

When we looks for the expressions of RET and SEG, is useful to decompose 𝐹𝑖 and 𝑔𝑖,𝑖 as:

                                          𝐹𝑖 (𝑋𝑖 , 𝑋~𝑖 ) = 𝐹̂𝑖 (𝑋𝑖 ) + 𝐹𝑖,~𝑖 (𝑋𝑖 , 𝑋~𝑖 )                                                       (9a)

                                         𝑔𝑖,𝑖 (𝑋𝑖 , 𝑋~𝑖 ) = 𝑔̂𝑖,𝑖,~𝑖 (𝑋𝑖 ) + 𝑔𝑖,𝑖,~𝑖 (𝑋𝑖 , 𝑋~𝑖 )                                               (9b)

where 𝐹̂𝑖 , 𝑔̂𝑖,𝑖,~𝑖 are exclusive functions of 𝑋𝑖 and 𝐹𝑖,~𝑖 , 𝑔𝑖,𝑖,~𝑖 are the causal-depending parts of 𝐹𝑖 , 𝑔𝑖,𝑖 since they
contain a cross dependency (from the point of view of 𝑋𝑖 ) on 𝑋~𝑖 .




                                                                                                                                                 5
2.1. Deterministic part of RET and SEG

For the considered boundary conditions and after, some integral manipulations (e.g. integration by parts), we obtain
the D-RET and D-SEG written respectively as:

Theorem 1
                                                                               𝜕 log 𝜌~𝑖|𝑖                   𝜕 log 𝜌~𝑖|𝑖
                                       𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 = 𝐸 [𝐹𝑖                     𝜕𝑋𝑖
                                                                                             ] = 𝐸 [𝐹𝑖,~𝑖          𝜕𝑋𝑖
                                                                                                                           ],       (10a)

                                        𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓                    𝜕𝐹
                                       (   𝑑𝑡
                                                     ) = 𝐸 (𝜕𝑋𝑖 )                                                                   (10b)
                                                      𝐹                    𝑖


See proof of (10a) in Appendix A2. (10b) is the difference between (6b) and (10a). From (10a,b), it is clear that D-
RET (10a) and D-SEG (10b) are linear in terms of 𝐹𝑖 , i.e. the D-RET and D-SEG of a linear combination of deterministic
terms and diffusivities is the respective linear combination of D-RETs and D-SEGs.

The term (10a), can be interpreted by considering the surprise function − log 𝜌𝑖 = −log 𝜌 + log 𝜌~𝑖|𝑖 whose
                                                                                    𝜕(− log 𝜌𝑖 )             𝜕(− log 𝜌𝑖 )
averaged value is 𝐻𝑋𝑖 . The rate of variation accompanying the state-space evolution is 𝜕𝑡
                                                                                                 + ∑𝐷
                                                                                                    𝑘=1 𝐹𝑘       𝜕𝑋𝑘
                                                                                                                          .
                                               𝜕(− log 𝜌 ) 𝜕(− log 𝜌)     𝜕 log 𝜌~𝑖|𝑖               𝜕 log 𝜌~𝑖|𝑖
The ‘advective’ term due to 𝐹𝑖 in the sum is 𝐹𝑖 𝜕𝑋 𝑖 = 𝐹𝑖 𝜕𝑋          + 𝐹𝑖 𝜕𝑋         and thus 𝐹𝑖 𝜕𝑋            in (10a)
                                                                  𝑖                      𝑖                     𝑖                𝑖
contributes to augment entropy following the state-space trajectory. Furthermore, only the parcel of 𝐹𝑖 with cross-
dependency on 𝑋~𝑖 (i.e. 𝐹𝑖,~𝑖 ) contributes to the D-RET.

The entropy generation (10b) is the contribution of 𝐹𝑖 for the average state-space speed divergence. When all the
                           𝜕𝐹𝑘
parcels of div(𝐅) ≡ ∑𝐷
                     𝑘=1       are constant and negative, that leads to the contraction of state-space volumes and
                           𝜕𝑋𝑘
to the decreasing of entropy.

Therefore, the D-RET (10a) can be further written as (proven in Appendix A3):
                                                           𝑑                      𝜕𝐹
                                𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 = 𝐸 [          𝐸(𝐹𝑖,~𝑖 |𝑋𝑖 )] − 𝐸 ( 𝑖,~𝑖 )                                            (11)
                                                          𝑑𝑋𝑖                      𝜕𝑋𝑖

The first term of the r.h.s. of (11) is the average derivative with respect to 𝑋𝑖 (or sensitivity) of the conditional
expectancy 𝐸(𝐹𝑖,~𝑖 |𝑋𝑖 ) of the causal-depending term 𝐹𝑖,~𝑖 for a given 𝑋𝑖 . Moreover, note that (11) is zero with 𝐹𝑖,~𝑖
changed into 𝐹̂𝑖 . A non-null inference of causality (11) means that causes, (through 𝐹𝑖,~𝑖 ), are acting in a different
way on different consequence values 𝑋𝑖 . For this reason, the application of (11)-like formulas will be part of the
hereafter referred ‘Causal Sensitivity Method’ (CSM).

Now, recalling that the full expectation decomposes as 𝐸(… ) = 𝐸𝑖 [𝐸~𝑖 (… |𝑋𝑖 )], we can write (11) as an the average
of the specific D-RET, i.e:

                                       𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 = 𝐸(ℱ𝑖,~𝑖,𝐹 )                                                                 (12a)
                                                          𝑑                                         𝜕𝐹
                                       ℱ𝑖,~𝑖,𝐹 (𝑋𝑖 ) ≡ 𝑑𝑋 𝐸~𝑖 (𝐹𝑖,~𝑖 |𝑋𝑖 ) − 𝐸~𝑖 ( 𝜕𝑋𝑖,~𝑖 |𝑋𝑖 ).                                    (12b)
                                                              𝑖                                          𝑖


The function (12a) provides information about the states where the entropy transfer is positive, or negative, and
also about its intensity.

A very important point, is the fact that the RET formula (10a) depends explicitly on the pdf (obtained from
integration of the Fokker-Planck equation or estimation from data), whereas the alternative formula (11) depends
only on conditional expectancies like 𝐸(𝐹𝑖,~𝑖 |𝑋𝑖 ). This is a key advantage with respect to (10a) because the


                                                                                                                                       6
estimation of (10a) calls for a ‘brute-force’ and computationally expensive integration over the state-space, growing
exponentially with dimension 𝐷 whereas (11) represents a much cheaper approach. There, 𝐸~𝑖 (𝐹𝑖,~𝑖 |𝑋𝑖 ) can be
estimated from some linear or non-linear fitting of 𝐹𝑖,~𝑖 as a function of 𝑋𝑖 by using an ensemble of realizations of
the pdf of the state-vector 𝐗, where the pdf can be either a transient ensemble or a long enough time-series if 𝜌𝐗
is ergodic. Note in (11) that 𝐸(𝐹𝑖,~𝑖 |𝑋𝑖 ) = 𝐸~𝑖 (𝐹𝑖,~𝑖 |𝑋𝑖 ) in which 𝐸~𝑖 is the expectation over the variables in 𝑋~𝑖 .

A corollary of (11) comes out:

Corollary of Theorem 1

If 𝐹𝑖,~𝑖 = 𝑓1 (𝑋𝑖 )𝑓2 (𝑋~𝑖 ), i.e. the deterministic term is multiplicative-separable in terms of factors depending on 𝑋𝑖
and 𝑋~𝑖 respectively, then:
                                                                                    𝑑
                                        𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 = 𝐸𝑖 [𝑓1 𝑑𝑋 𝐸~𝑖 (𝑓2|𝑋𝑖 )]                                                      (13)
                                                                                        𝑖

                                                                        𝑑                                 𝜕𝐹                 𝑑
The proof is immediate since, using (11), we get 𝐸𝑖 [𝑑𝑋 𝐸~𝑖 (𝐹𝑖,~𝑖 |𝑋𝑖 )] − 𝐸 ( 𝜕𝑋𝑖,~𝑖) = 𝐸𝑖 {𝑑𝑋 [𝑓1 𝐸~𝑖 (𝑓2|𝑋𝑖 )]} −
                                                                            𝑖                                  𝑖                 𝑖
            𝑑𝑓                   𝑑
𝐸𝑖 [𝐸~𝑖 (𝑓2 𝑑𝑋1 |𝑋𝑖 )] = 𝐸𝑖 [𝑓1 𝑑𝑋 𝐸~𝑖 (𝑓2|𝑋𝑖 )]. The above separation is quite common (e.g. 𝐹𝑖 given by a multivariate
               𝑖                   𝑖
polynomial of the variables). From (13), we easily verify that, If 𝑋~𝑖 is statistically independent from 𝑋𝑖 , then
𝐸~𝑖 (𝑓2 |𝑋𝑖 ) is independent of 𝑋𝑖 , its derivative is null and hence (13) vanishes. Therefore, a non-vanishing D-RET (13)
comes from the statistical dependency on the consequential variable 𝑋𝑖 of the causal-dependent factor 𝑓2 (𝑋~𝑖 ).

Let us give a concrete example of (13) in dimension 𝐷 = 3, with 𝑖 = 1, ~𝑖 = 2,3 and 𝐹𝑖,~𝑖 = 𝐹1,~1 = 𝑋1 𝑋22 + 𝑋2 𝑋3,
                                              𝑑                     𝑑
which leads to 𝑇(𝑋~1 → 𝑋1 ) 𝐹 = 𝐸 [𝑋1            𝐸(𝑋22 |𝑋1 )] + 𝐸 [ 𝐸(𝑋2 𝑋3 |𝑋1 )]. That needs the estimation of two
                                             𝑑𝑋1                   𝑑𝑋1
conditional expectations 𝐸(𝑋22 |𝑋1 ) and 𝐸(𝑋2 𝑋3 |𝑋1 ) and their derivatives with respect to 𝑋1 . Thanks to the
variable’s separability, the CSM becomes a very expeditious and elegant way of computing RETs.

2.2. Stochastic part of RET and SEG

The S-REC (6c) depends on the diffusivity 𝑔𝑖,𝑖 and how it depends on 𝑋𝑖 and 𝑋~𝑖 . The additive-noise part of S-REC
(7b) is retained in the S-SEG, i.e.:
                                           𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓              𝑑𝐻𝑋                       1                 𝑑 log 𝜌   2
                                        (     𝑑𝑡
                                                        )      = ( 𝑑𝑡 𝑖 )               = 2 𝐸𝑖 [𝐸(𝑔𝑖,𝑖 |𝑋𝑖 ) ( 𝑑𝑋 𝑖) ] ≥ 0,           (14)
                                                         𝑔,𝑎                    𝑔,𝑎                                 𝑖


which contributes to increase the entropy. In a random walk process (14) is the sole entropy budget term, leading
to a variance increasing with a constant time rate 𝑔𝑖,𝑖 /2.

In what concerns the multiplicative-noise term (7c), it decomposes as:
                                           𝑑𝐻𝑋                  𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓
                                        ( 𝑑𝑡 𝑖 )            =(     𝑑𝑡
                                                                                )           + 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔                          (15)
                                                   𝑔,𝑚                          𝑔,𝑚

whose expressions are given by:

Theorem 2
                                        𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓                          𝑑 2 𝐸(𝑔𝑖,𝑖 |𝑋𝑖 )
                                       (     𝑑𝑡
                                                     )         = 𝐸𝑖 (−              𝑑𝑋𝑖2
                                                                                                 )                                   (16a)
                                                        𝑔,𝑚

                                                                  1         1 𝜕2 𝑔𝑖,𝑖, 𝜌𝑖    1   1 𝜕2 𝑔𝑖,𝑖~𝑖, 𝜌𝑖
                                      𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔 = 𝐸 (                          2     ) = 𝐸[                 ].                  (16b)
                                                                  2         𝜌𝑖 𝜕𝑋𝑖           2   𝜌𝑖   𝜕𝑋𝑖2



                                                                                                                                        7
We must note here, that the S-SEG terms (14, 16a) depend uniquely on the conditional expectation of the diffusivity
𝐸(𝑔𝑖,𝑖 |𝑋𝑖 ), which is an exclusive function of 𝑋𝑖 , independently of any cross-dependency. The term (16a) is
proportional to the concavity of 𝐸(𝑔𝑖,𝑖 |𝑋𝑖 ), through the second derivative in (16a) (see proof in Appendix A4). The
non-vanishing of the S-RET (16b) calls for a cross-dependency of the diffusivity 𝑔𝑖,𝑖, on 𝑋~𝑖 . In fact, if 𝑔𝑖,𝑖 is constant
or owns a unique self-dependency on 𝑋𝑖 , then (16b) is zero.

After, some integral manipulations, the S-RET (16b) get a CSM-like expression:
                                              1          𝜕2 𝑔       1        𝑑2                                             𝑑           𝜕𝑔
                       𝑇(𝑋~𝑖 → 𝑋𝑖 )𝑔 = 2 𝐸 ( 𝜕𝑋𝑖,𝑖~𝑖                                         𝑖,𝑖~𝑖
                                                2 ) + 2 𝐸 [𝑑𝑋 2 𝐸(𝑔𝑖,𝑖~𝑖 |𝑋𝑖 )] − 𝐸 [𝑑𝑋 𝐸 ( 𝜕𝑋     |𝑋𝑖 )]                                         (17)
                                                                𝑖                 𝑖                                             𝑖            𝑖


which depends on the causal sensitivities (first and second derivatives) of the conditional diffusitivity 𝐸(𝑔𝑖,𝑖~𝑖 |𝑋𝑖 )
with respect to 𝑋𝑖 .

The proof of (17) comes in the Appendix A5. Like (11), the formula (17) has no explicit dependency on the pdf, hence
its calculation is rather cheaper.

The specific contribution for the S-RET (17) like for the D-RET in (12b) is:
                                         1        𝜕2 𝑔              1        𝑑2                               𝑑         𝜕𝑔
                       ℱ𝑖,~𝑖,𝑔 (𝑋𝑖 ) ≡ 2 𝐸 ( 𝜕𝑋𝑖,𝑖~𝑖                                       𝑖,𝑖~𝑖
                                                2 |𝑋𝑖 ) + 2 𝐸 𝑑𝑋 2 (𝑔𝑖,𝑖~𝑖 |𝑋𝑖 ) − 𝑑𝑋 𝐸 ( 𝜕𝑋     |𝑋𝑖 )                                            (18)
                                                         𝑖                    𝑖                                   𝑖                 𝑖


From (17) we infer the corollary below:

Corollary of Theorem 2

If 𝑔𝑖,𝑖,~𝑖 = 𝑓3 (𝑋𝑖 )𝑓4 (𝑋~𝑖 ), i.e. the diffusivity is multiplicatively-separable in terms of factors depending on 𝑋𝑖 and
𝑋~𝑖 respectively, then
                                                                1       𝑑2
                                𝑇(𝑋~𝑖 → 𝑋𝑖 )𝑔 = 2 𝐸𝑖 [𝑓3 𝑑𝑋 2 𝐸~𝑖 (𝑓4 |𝑋𝑖 )]                                                                      (19)
                                                                         𝑖


The proof looks like that of the Corollary of Theorem 1, playing with second derivatives and separating the factors
𝑓3 , 𝑓4 in the integrals spanning 𝑋𝑖 and 𝑋~𝑖 respectively in the expectation operator. The formula (19), like (13)
provides a very simple form to compute the S-RET.

2.3. Stationary balance of entropy

If the pdf 𝜌𝐗 is stationary, for instance when the system (1) is autonomous and reaches the ergodic pdf, then the
                                                                                              𝑑𝐻𝑋𝑖
entropy 𝐻𝑋𝑖 evolves towards a stationary value and all the terms of                               𝑑𝑡
                                                                                                           must balance, i.e. their sum is zero as:
                       𝑑𝐻𝑋𝑖     𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓                                            𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓
                        𝑑𝑡
                              =(    𝑑𝑡
                                             ) + 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹 + (                       𝑑𝑡
                                                                                                   ) + 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝑔 = 0                          (20)
                                              𝐹                                                        𝑔

The SEG contributions can be estimated from model equations, through the expressions of 𝐹𝑖 , 𝑔𝑖,𝑖 and also from the
marginal pdf 𝜌𝑖 , estimated from data. The RET terms can be obtained by the CSM expressions (11,17) from data-
estimated conditional expectations on 𝑋𝑖 and their derivatives. That is important to check the correct estimation of
every term. Under additive noise conditions, the D-RET is given by:
                                                                             𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓                    𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓
                                             𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹 = − (                  𝑑𝑡
                                                                                           ) −(               𝑑𝑡
                                                                                                                        )                         (21)
                                                                                              𝐹                         𝑔,𝑎




                                                                                                                                                      8
Furthermore, In the case of a noise-free dissipative model that moves to the balance: 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹 =
   𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓
−(              ) > 0.
      𝑑𝑡        𝐹




3. Rate of entropy transfer due to a single variable

3.1. Integral expressions of the RET

Let us now consider the RETs, 𝑇(𝑋𝑗 → 𝑋𝑖 ) , 𝑗 ≠ 𝑖, between single variables as in [16]. The integrated influence of
𝑋~𝑖 upon the consequential variable 𝑋𝑖 , through 𝑇(𝑋~𝑖 → 𝑋𝑖 ) cannot in general be split as the sum of single RETs,
𝑇(𝑋𝑗 → 𝑋𝑖 ) , 𝑗 ≠ 𝑖, except when variables in 𝑋~𝑖 are conditionally independent with respect to 𝑋𝑖 . We will come
back to this point at the end of this section.

Liang [11-18] has established formulas for the deterministic and stochastic, single contributions of 𝑇(𝑋𝑗 → 𝑋𝑖 ), 𝑗 ≠
𝑖. We introduce here alternative formulas to those of Liang, looking like (11-17) and relying on the CSM approach.

We start with a result (proven in Appendix A6).

Theorem 3

The rate of entropy transfer 𝑇(𝑋𝑗 → 𝑋𝑖 ) towards the consequential variable 𝑋𝑖 due the influence of the causal
variable 𝑋𝑗 , 𝑗 ≠ 𝑖, is decomposed into a D-RET and S-RET as:

                                                𝑇(𝑋𝑗 → 𝑋𝑖 ) ≡ 𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹 + 𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 ,                                                         (22a)

                                                                   𝜕(𝐹𝑖 𝜌~𝑗 )                            𝜌       𝜕log(𝜌𝑗|𝑖 )
                         𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝐹 = − ∫ℝ𝐷 𝜌𝑗|𝑖                      𝜕𝑋𝑖
                                                                                  𝑑𝐗 = 𝐸 [𝐹𝑖 𝜌 𝑗|𝑖                       𝜕𝑋𝑖
                                                                                                                               ],                  (22b)
                                                                                                          𝑗|~𝑗


                         1              𝜕2 (𝑔𝑖,𝑖 𝜌~𝑗 )                           1     𝜕(𝑔𝑖,𝑖 𝜌~𝑗 )      𝜌𝑗|𝑖    𝜕log(𝜌𝑗|𝑖 )
     𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝑔 = 2 ∫ℝ𝐷 𝜌𝑗|𝑖             𝜕𝑋𝒊𝟐
                                                         𝑑𝐗 = 𝐸 [(− 2𝜌                        𝜕𝑋𝑖
                                                                                                      )𝜌                 𝜕𝑋𝑖
                                                                                                                               ],                   (22c)
                                                                                  ~𝑗                      𝑗|~𝑗


where 𝜌~𝑗 is the pdf of the set of variables different from 𝑋𝑗 and 𝜌𝑗|𝑖 , 𝜌𝑗|~𝑗 are conditional pdfs. Liang [16] has
                                                                                     𝑑𝐻𝑋
obtained 𝑇(𝑋𝑗 → 𝑋𝑖 ) as the difference between the rate 𝑑𝑡 𝑖 and the of rate of change of 𝐻𝑋𝑖 in a process in which
𝑋𝑗 is frozen. The middle terms of (22b,c) are from Liang [16], and the rightmost ones are the new relationships based
                                                                                     𝜌𝑗|𝑖
on the conditional pdfs. For the two-dimensional case 𝜌                                       = 1 and 𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝑇(𝑋~𝑖 → 𝑋𝑖 ). Moreover, if
                                                                                       𝑗|~𝑗
                                                                                                                                    𝜌𝑗|𝑖
variables 𝑋𝑗 ≠ 𝑋𝑖 are statistically independent from the remaining variables 𝑋𝑘 ≠ 𝑋𝑖 , 𝑋𝑗 , then                                            = 1, which is
                                                                                                                                    𝜌𝑗|~𝑗
equivalent to the two-dimensional case spanned uniquely by the causal and consequential variables 𝑋𝑗 , 𝑋𝑖 .

By summing (22b) and (22c), we get a compact formula:
                                              𝜌𝑗|𝑖    𝜕 log(𝜌𝑗|𝑖 )                            𝜌𝑗|𝑖    𝜕 log(𝜌𝑗|𝑖 )
                𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝐸 [𝑅𝑖 𝜌                        𝜕𝑋𝑖
                                                                     ] = 𝐸 [𝑅𝑖,𝑗 𝜌                       𝜕𝑋𝑖
                                                                                                                     ]                              (23a)
                                               𝑗|~𝑗                                            𝑗|~𝑗


                                                         1    𝜕(𝑔𝑖,𝑖 𝜌~𝑗 )                       1 𝜕 log(𝜌~𝑗 )   1 𝜕𝑔
                                    𝑅𝑖 = 𝐹𝑖 − 2𝜌                   𝜕𝑋𝑖
                                                                               = 𝐹𝑖 − 𝑔𝑖,𝑖 2           𝜕𝑋𝑖
                                                                                                               − 2 𝜕𝑋𝑖,𝑖.                          (23b)
                                                         ~𝑗                                                           𝑖


where 𝑅𝑖 is a generalized speed in state-space composed by the deterministic speed (𝐹𝑖 ) and stochastic
components, this one, poiting towards lower pdf values and lower diffusivities (i.e. pointing against the gradient).
                     𝜕 log(𝜌𝑗|𝑖 )       𝜕log 𝑐𝑜𝑝(𝑖,𝑗)                       𝜌
Note in (23a) that       𝜕𝑋𝑖
                                    =       𝜕𝑋𝑖
                                                      where 𝑐𝑜𝑝(𝑋𝑖 , 𝑋𝑗 ) ≡ 𝜌 𝑖,𝑗 is the copula function, expressing the form how
                                                                             𝑖 𝜌𝑗



                                                                                                                                                       9
variables are interrelated, independently of the marginal pdfs. The average value of log[𝑐𝑜𝑝(𝑋𝑖 , 𝑋𝑗 )] is the mutual
information between 𝑋𝑖 and 𝑋𝑗 . We can shown that (23a) appears with opposite sign in the budget equation of the
                                            𝜌
copula entropy −𝐼(𝑋𝑗 , 𝑋𝑖 ) ≡ −𝐸[log(𝜌 𝑖,𝑗
                                       𝜌
                                           )], which is the opposite of the mutual information, and thus the RET is an
                                             𝑖 𝑗
indirect entropy transfer, via the copula entropy.

The use of 𝐷-dimensional integrals for estimating the RETs like (23a) , calls for the estimation of the pdf of the
system. This can be difficult due to data restrictions and sampling, even for moderately low dimensions. Moreover,
the state-space discretization and bounding required for the numerical computation of the integrals represents an
additional source error. This will be further illustrated in Secs. 5 and 6 when computing RETs for two different
models.

There are alternative integral formulas for the RETs containing less sources of errors, which relies on the sensitivities
(derivatives) of 𝐹𝑖 , 𝑔𝑖𝑖 with respect to 𝑋𝑗 , agreeing with the Theorem below, proven in Appendix A7:

Theorem 4
                                                                                1    𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖) 𝜕𝑅𝑖
                                            𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝐸 [ 𝜌                         𝜕𝑋𝑖      𝜕𝑋𝑗
                                                                                                     ]                                            (24)
                                                                                𝑗|~𝑗


where we use the conditional exceedance probability of 𝑋𝑗 given 𝑋𝑖 :                                            𝑃𝑟𝑒𝑥 (𝑗|𝑖) ≡ Prob( 𝑢𝑗 ≥ 𝑋𝑗 |𝑋𝑖 ) =
  +∞                                                                                                           𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖 )    +∞ 𝜕𝜌𝑗|𝑖 (𝑢𝑗 |𝑋𝑖 )
∫𝑋     𝜌𝑗|𝑖 (𝑢𝑗 |𝑋𝑖 )𝑑𝑢𝑗 = 1 − 𝑃𝑟(𝑗|𝑖).         Its    derivative               in     (24)      is                         = ∫𝑋                  𝑑𝑢𝑗 =
  𝑗                                                                                                               𝜕𝑋  𝑖           𝑗    𝜕𝑋 𝑖
 +∞    𝜕log 𝜌𝑗|𝑖
∫𝑋 𝜌𝑗|𝑖 𝜕𝑋 𝑑𝑢𝑗 which vanishes if 𝑋𝑗 and 𝑋𝑖 are statistically independent.
  𝑗         𝑖


The sensitivity of the generalized speed 𝑅𝑖 (23b) with respect to the causal variable 𝑋𝑗 appearing in (24) is:

                                            𝜕𝑅𝑖  𝜕𝐹  1 𝜕𝑔𝑖,𝑖 𝜕 log(𝜌~𝑗 )   1 𝜕2 𝑔𝑖,𝑖
                                                = 𝑖−                     −                                 .                                      (25)
                                            𝜕𝑋𝑗  𝜕𝑋𝑗 2 𝜕𝑋𝑗       𝜕𝑋𝑖       2 𝜕𝑋𝑗 𝜕𝑋𝑖

Splitting the first, second and third terms leads to corresponding formulas for the D-RET 𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝐹 and S-RET
𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝑔 as:
                                                                                1    𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖 ) 𝜕𝐹𝑖
                                          𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝐹 = 𝐸 [ 𝜌                         𝜕𝑋𝑖       𝜕𝑋𝑗
                                                                                                      ]                                          (26a)
                                                                                𝑗|~𝑗


                                     1      𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖 )         1 𝜕𝑔       𝜕 log(𝜌~𝑗 )       1 𝜕2 𝑔
             𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝑔 = 𝐸 [ 𝜌               𝜕𝑋𝑖
                                                           (− 2 𝜕𝑋𝑖,𝑖            𝜕𝑋𝑖
                                                                                                  𝑖,𝑖
                                                                                          − 2 𝜕𝑋 𝜕𝑋   ) ]                                       (26b)
                                     𝑗|~𝑗                               𝑗                         𝑗    𝑖




Let us interpret heuristically the sign of 𝑇(𝑋𝑗 → 𝑋𝑖 ) in (24). A positive value of 𝑇(𝑋𝑗 → 𝑋𝑖 ) is favoured by
𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖)     𝜕𝑅                                       𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖 )
   𝜕𝑋
            and 𝜕𝑋 𝑖 having the same sign. In particular, 𝜕𝑋          > 0 means that for a state-space displacement 𝛿𝑋𝑖 >
       𝑖          𝑗                                                         𝑖

0, the tail (or exceedance) probability Prob( 𝑢𝑗 ≥ 𝑋𝑗 |𝑋𝑖 ) is larger, and thus values greater than 𝑋𝑗 are more likely,
                                                           𝜕𝑅                                                    𝛿𝑅       𝜕𝑅 𝛿𝑋
i.e. 𝛿𝑋𝑖 > 0 drives 𝛿𝑋𝑗 > 0. Furthermore, if 𝜕𝑋𝑖 > 0, that induces a variation 𝛿𝑋𝑖 = 𝜕𝑋 𝑖 𝛿𝑋𝑗 > 0 and therefore
                                                             𝑗                                                        𝑖    𝑗      𝑖
contributes positively to the divergence of the generalized speed and in analogy with (10b) to an increase of 𝐻𝑋𝑖 .
                                                        𝜕𝑅𝑖
Given the dependence on the sensitivity term                in (25), we have the following corollary:
                                                        𝜕𝑋𝑗




                                                                                                                                                    10
Corollary of Theorem 4

Only the additive terms of 𝑅𝑖 in (8), depending explicitly on 𝑋𝑗 contribute to 𝑇(𝑋𝑗 → 𝑋𝑖 ) and therefore 𝑅𝑖 can be
substituted in (8) by
                                        1    𝜕(𝑔𝑖,𝑖,𝑗 𝜌~𝑗 )                  1 𝜕 log(𝜌~𝑗 )   1 𝜕𝑔𝑖,𝑖,𝑗
                       𝑅𝑖,𝑗 ≡ 𝐹𝑖,𝑗 − 2𝜌          𝜕𝑋𝑖
                                                              = 𝐹𝑖,𝑗 − 𝑔𝑖,𝑖,𝑗 2    𝜕𝑋𝑖
                                                                                           − 2 𝜕𝑋𝑖
                                                                                                                         (27)
                                        ~𝑗

                                                                                                                   𝜕𝐹    𝜕𝐹
where 𝐹𝑖,𝑗 , 𝑔𝑖,𝑖,𝑗 (like 9a,b) is the sum of the additive terms of 𝐹𝑖 , 𝑔𝑖,𝑖 that depend on 𝑋𝑗 , i.e. satisfying 𝜕𝑋𝑖 = 𝜕𝑋𝑖,𝑗
                                                                                                                    𝑗         𝑗
    𝜕𝑔𝑖,𝑖   𝜕𝑔𝑖,𝑖,𝑗
and 𝜕𝑋 =     𝜕𝑋𝑗
                 . For instance for D=3, if 𝐹1 = 𝑋1 𝑋2 + 𝑋22 + 𝑋1 𝑋3 , then 𝐹1,2 = 𝑋1 𝑋2 + 𝑋22 and 𝐹1,3 = 𝑋1 𝑋3 .
        𝑗


The difference 𝑅𝑖 − 𝑅𝑖,𝑗 includes all the terms not depending on 𝑋𝑗 , in particular the diffusion speed, under additive
                           1 𝜕 log(𝜌~𝑗 )
noise, i.e. the term −𝑔𝑖,𝑖 2     𝜕𝑋𝑖
                                         in (27). In the case of additive or self-dependent multiplicative noise, we have
𝑅𝑖,𝑗 = 𝐹𝑖,𝑗 . The restriction to terms in 𝑅𝑖,𝑗 in (27) simplifies considerably the computation of (24) since many terms
can be discarded. It also shows that all the terms without dependence on 𝑋𝑗 have only an implicit impact on the
RET via the shape of the pdf.

3.2. Expressions of the RETs based on the Causal Sensitivity Method (CSM)

Let us now focus on how (26a,b) can be modified in order to enable a simple estimation based on conditional
expectations, by using the CSM already used to reach (11-17),

In order to simplify the notation, we split the variables into three kinds: the causal variable 𝑋𝑖 , the consequential
variable 𝑋𝑗 (the target) and the remaining outer variables within the state vector, denoted by 𝑋𝑘 where 𝑘 ≡ ~(𝑗, 𝑖)
stand for variables different from the pair (𝑋𝑗 , 𝑋𝑖 ). The outer space, spanned by 𝑋𝑘 can be extended from the null
set up to any variable physically possible or in practice those which have plausible connections to 𝑋𝑗 , 𝑋𝑖 in a certain
context and so 𝑋𝑘 spans the contextual variables, like third-part agents interacting with 𝑋𝑗 , 𝑋𝑖 .

That outer space also contains all the possible factors that can lead from 𝑋𝑗 to 𝑋𝑖 , by any sort of causal mechanism.
The average of the deterministic term and diffusivity along the outer space, for a fixed value of the consequential
variable, takes a very important role in the causality diagnostics like the RETs. The RET values can even depend
crucially on the extent of the outer space of variables.

Let us denote the overbar quantities as

                                                    𝐹̅𝑖,𝑗 ≡ 𝐸𝑘 (𝐹𝑖,𝑗 |𝑋𝑖 ) = 𝐸~(𝑖,𝑗) (𝐹𝑖,𝑗 |𝑋𝑖 )                        (28a)

                                                   𝑔̅𝑖,𝑖,𝑗 ≡ 𝐸𝑘 (𝑔𝑖,𝑖,𝑗 |𝑋𝑖 ) = 𝐸~(𝑖,𝑗) (𝑔𝑖,𝑖,𝑗 |𝑋𝑖 )                   (28b)

where

                               𝐸𝑘 (… |𝑋𝑖 ) ≡ ∫𝑋 𝜌𝑘|𝑖 (… . ) 𝑑𝑋𝑘 = ∫𝑋                   𝜌~(𝑖,𝑗)|𝑖 (… . ) 𝑑𝑋~(𝑖,𝑗)        (28c)
                                                   𝑘                          ~(𝑖,𝑗)


is the conditional expectation to 𝑋𝑖 , over the outer space of variables 𝑘 = ~(𝑗, 𝑖). Those quantities are bivariate
functions of (𝑋𝑖 , 𝑋𝑗 ). In particular, in the two-dimensional isolated case (cause, consequence) or in the two-
dimensional equivalent case where the outer variables are totally independent of 𝑋𝑖 , we have 𝐹̅𝑖,𝑗 = 𝐹𝑖,𝑗 and 𝑔̅𝑖,𝑖,𝑗 =
𝑔𝑖,𝑖,𝑗 .




                                                                                                                          11
For instance, in fluid dynamics, the Reynold turbulent stresses, parametrized as a function of large-scale variables
𝑋𝑖 , 𝑋𝑗 is a conditional expectation of the form 𝐹̅𝑖,𝑗 .

Let us also denote by 𝐸𝑖 (… ) and 𝐸𝑗 (… ) the expectations over the causal and consequential space respectively and
by 𝐸𝑖,𝑗 (… ) = 𝐸𝑖 [𝐸𝑗 (… )|𝑋𝑖 ] the joint average.

Now, we have the CSM equivalent theorem (proven in Appendices A8,A9) :

Theorem 5
                                                                         𝑑                          𝜕𝐹̅
                                        𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹 = 𝐸𝑖 [𝑑𝑋 𝐸𝑗 (𝐹̅𝑖,𝑗 |𝑋𝑖 )] − 𝐸𝑖,𝑗 ( 𝜕𝑋𝑖,𝑗 )                                       (29a)
                                                                             𝑖                            𝑖

                                        1       𝜕2 𝑔̅𝑖,𝑖,𝑗       1           𝑑2                           𝑑           𝜕𝑔̅𝑖,𝑖,𝑗
                      𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 = 2 𝐸𝑖,𝑗 ( 𝜕𝑋 2 ) + 2 𝐸𝑖 [𝑑𝑋 2 𝐸𝑗 (𝑔̅𝑖,𝑖,𝑗 |𝑋𝑖 )] −𝐸𝑖 [𝑑𝑋 𝐸𝑗 ( 𝜕𝑋 |𝑋𝑖 )]                           (29b)
                                                      𝑖                          𝑖                            𝑖              𝑖


where the expectation’s variables are sub-indexed in the expectation operator, for ease of interpretation.

(29a,b) show that the RETs depend on conditional consequential averages 𝐸𝑗 (… |𝑋𝑖 ) of the deterministic terms and
diffusivities (averaged over the outer space) and their first and second derivatives with respect to the 𝑋𝑖 . The terms
                                                                                                                  𝑑(… )
in (29a,b) do not vanish in general because the above used operators: 𝐸𝑗 (… |𝑋𝑖 ) and 𝑑𝑋 do not commute.
                                                                                                                      𝑖


The formulas (29a,b) are linear in 𝐹𝑖,𝑗 , 𝑔𝑖,𝑖,𝑗 , and thus the single RETs coming from a linear combination of
deterministic terms or diffusivities is the linear combination of single RETs produced by each term.

The RET is the average value of the specific rate of entropy transfer ℱ𝑗 (𝑋𝑖 ), in analogy with (12,18) i.e.

                                                      𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝐸𝑖 [ ℱ𝑖,𝑗 (𝑋𝑖 )],                                                  (30)

to which contribute the corresponding determinist and stochastic components:

                                                  ℱ𝑖,𝑗 (𝑋𝑖 ) = ℱ𝑖,𝑗,𝐹 (𝑋𝑖 ) + ℱ𝑖,𝑗,𝑔 (𝑋𝑖 )                                            (31a)
                                                        𝑑                       𝑑𝐹𝑖,𝑗       ̅
                                        ℱ𝑖,𝑗,𝐹 (𝑋𝑖 ) = 𝑑𝑋 𝐸𝑗 (𝐹̅𝑖,𝑗 |𝑋𝑖 ) − 𝐸𝑗 ( 𝑑𝑋 |𝑋𝑖 )                                             (31b)
                                                             𝑖                                  𝑖

                                                  𝑑          𝜕𝑔̅                     1 𝑑2                         1       𝜕2 𝑔̅
                               ℱ𝑖,𝑗,𝑔 (𝑋𝑖 ) = − 𝑑𝑋 𝐸𝑗 ( 𝜕𝑋𝑖,𝑖,𝑗 |𝑋𝑖 ) + 2 𝑑𝑋 2 𝐸𝑗 (𝑔̅𝑖,𝑖,𝑗 |𝑋𝑖 ) + 2 𝐸𝑗 ( 𝜕𝑋𝑖,𝑖,𝑗
                                                                                                             2 |𝑋𝑖 )                  (31c)
                                                      𝑖              𝑖                  𝑖                                         𝑖

We must note that the value of ℱ𝑖,𝑗 (𝑋𝑖 ) is constant for Gaussian pdfs associated to linear systems but can vary for
non-Gaussian pdfs, yielding to contributions to the rate of entropy that can fluctuate from positive to negative values
depending on 𝑋𝑖 .

The formulas (29a,b) have the major advantage as compared with (26a,b) that its computation does not explicitly
require the pdf of the system. In practice, the terms 𝐹̅𝑖,𝑗 = 𝐸𝑘 (𝐹𝑖,𝑗 |𝑋𝑖 ), 𝑔̅𝑖,𝑖,𝑗 = 𝐸𝑘 (𝑔𝑖,𝑖,𝑗 |𝑋𝑖 ) and other terms like
                       ̅𝜕𝐹𝑖,𝑗
𝐸𝑗 (𝐹̅𝑖,𝑗 |𝑋𝑖 ) and 𝐸𝑗 ( 𝜕𝑋 |𝑋𝑖 ) are conditional expectations with respect to 𝑋𝑖 and can be estimated by nonlinear
                           𝑖
regression using a certain set of basis functions (e.g. monomials) or by parametrizing the joint pdfs by Bayesian
methods, followed by an estimation of the average. The regression can be obtained from an ensemble of realizations
of state-space trajectories - like time-series – exploring the ergodic pdf, or a time-evolving transient ensemble where
the regression coefficients vary on time.




                                                                                                                                        12
Theorem 5 has important corollaries allowing for simple applications to quite general systems, linear, or nonlinear
with additive or multiplicative noises with or without cross dependencies. They also provide relevant information
about the rates of entropy transfer in models where the governing equations are known.

Corollary 1 of Theorem 5

If 𝐹𝑖,𝑗 = 𝐴𝑖𝑗 𝑋𝑗 = 𝐹̅𝑖,𝑗 where 𝐴𝑖𝑗 is constant, i.e. the deterministic term is linear with respect to the causal variable
𝑋𝑗 , then
                                                                                       𝑑
                                                   𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹 = 𝐴𝑖𝑗 𝐸𝑖 [𝑑𝑋 𝐸𝑗 (𝑋𝑗 |𝑋𝑖 )]                             (32)
                                                                                           𝑖


The systems verifying that condition can even depend nonlinearly both on 𝑋𝑖 and variables 𝑋𝑘 , 𝑘 ≠ 𝑖, 𝑗. The proof
                           𝜕𝐹̅                                                                           𝑑
is straitghforward, since 𝜕𝑋𝑖,𝑗 = 0 and 𝐸𝑗 (𝐹̅𝑖,𝑗 |𝑋𝑖 ) = 𝐴𝑖𝑗 𝐸𝑗 (𝑋𝑗 |𝑋𝑖 ). Then the RET comes as 𝐸𝑖 [𝑑𝑋 𝐸𝑗 (𝐹̅𝑖,𝑗 |𝑋𝑖 )] =
                                 𝑖                                                                           𝑖
         𝑑
𝐴𝑖𝑗 𝐸𝑖 [ 𝐸𝑗 (𝑋𝑗 |𝑋𝑖 )] providing the result. The result also applies in particular to linear systems giving rise to:
        𝑑𝑋𝑖

Corollary 2 of Theorem 5

For a linear system of dimension D:
                                                           𝑑𝐗         𝑑𝐖
                                                           𝑑𝑡
                                                              = 𝐀𝐗 + 𝐁 𝑑𝑡                                              (33)

where 𝐀 is a constant matrix and noise is additive, i.e 𝐁 is a constant matrix, the ergodic pdf 𝜌𝐗 , is Gaussian with
zero average and covariance matrix 𝐂𝐱,𝐱 with entries 𝐶𝑖𝑗 and the rate of entropy transfer is:
                                                          𝐶𝑖𝑗           𝐶𝑖𝑗    1
                                     𝑇(𝑋𝑗 → 𝑋𝑖 ) =              𝐴𝑖𝑗 =                 ∑𝐷 𝐶       Δ ,                   (34)
                                                          𝐶𝑖𝑖           𝐶𝑖𝑖 det(𝐂𝐱,𝐱 ) 𝑙=1 𝑑(𝑖),𝑙 𝑙𝑗

                                             𝜕𝐹𝑖                            𝑑𝑋𝑖
where the (𝑖, 𝑗) entry of 𝐀 is 𝐴𝑖𝑗 =             ;    𝐶𝑑(𝑖),𝑙 is the covariance between
                                                                                and 𝑋𝑙 (𝑙 = 1, . . , 𝐷) and Δ𝑙𝑗 is the
                                             𝜕𝑋𝑗                             𝑑𝑡
                                                                                                      𝐶
(𝑙, 𝑗) cofactor-entry of 𝐂𝐱,𝐱 . In the ergodic Gaussian (null average) case, we have 𝐸𝑗 (𝑋𝑗 |𝑋𝑖 ) = 𝑖𝑗 𝑋𝑖 and thus
                                                                                                      𝐶          𝑖𝑖
 𝑑             𝐶
   𝐸 (𝑋 |𝑋 ) = 𝐶𝑖𝑗. After using (32), we get the middle term of result (34), recovering the result of Eq. (14) of Liang
𝑑𝑋𝑖 𝑗 𝑗 𝑖        𝑖𝑖
[18].
                                                                                                   𝑑𝐗
The last equality is obtained by taking the matrix right hand side product of 𝑑𝑡 with 𝐗 𝑇 in (33), followed by the
                                                     𝑑𝐰
expectation operator. Recalling that 𝐸 ( 𝑑𝑡 𝐗 𝑇 ) = 𝟎, we obtain the covariance matrix between time derivatives of
                                              𝑑𝐗
the state vector and 𝐗 as 𝐂𝑑𝐗,𝐱 = 𝐸 ( 𝑑𝑡 𝐗 𝑇 ) = 𝐀𝐸(𝐗𝐗 𝑇 ) = 𝐀𝐂𝐱,𝐱 . Then 𝐀 = 𝐂𝑑𝐗,𝐱 𝐂𝐱,𝐱 −1 . Then, the result follows
                             𝑑𝑡                                                                    𝑑𝑡
                                         1
from the fact that (𝐂𝐱,𝐱 −1 )𝑙𝑗 = det(𝐂             Δ .
                                                   ) 𝑙𝑗
                                             𝐱,𝐱


In the particular case of a two-dimensional linear system driven by additive noise, we have, after computing the
cofactors, the Liang [15] result:
                                                                                      2
                                                                    𝐶𝑖𝑖 𝐶𝑖𝑗 𝐶𝑗,𝑑(𝑖) −𝐶𝑖𝑗 𝐶𝑖,𝑑(𝑖)
                                               𝑇(𝑋𝑗 → 𝑋𝑖 ) =                  𝐶𝑖𝑖2 𝐶𝑗𝑗 −𝐶𝑖𝑖 𝐶𝑖𝑗
                                                                                             2                         (35)

A very important corollary of Theorem 5, based on the CSM is the case where the deterministic terms of 𝐹𝑖,𝑗 and
diffusivity terms of 𝑔𝑖,𝑗 have a separate product dependence between the causal variable and the remaining
variables, leading the following result (proven in Appendices A10,A11):


                                                                                                                        13
Corollary 3 of Theorem 5

For the separable case 𝐹𝑖,𝑗 = 𝑓1 (𝑋𝑗 )𝑓2 (𝑋𝑖 , 𝑋𝑘 ) and 𝑔𝑖,𝑖,𝑗 = 𝑓3 (𝑋𝑗 )𝑓4 (𝑋𝑖 , 𝑋𝑘 ), where 𝑓1 , 𝑓2 , 𝑓3 , 𝑓4 are certain
continuous differentiable functions, the RET simplifies as:
                                                                              𝑑
                                         𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹 = 𝐸𝑖 [ 𝐸𝑘 (𝑓2 |𝑋𝑖 ) 𝑑𝑋 𝐸𝑗 (𝑓1 |𝑋𝑖 )]                           (36a)
                                                                                  𝑖

                                                            1                  𝑑2
                                         𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 = 2 𝐸𝑖 [𝐸𝑘 (𝑓4 |𝑋𝑖 ) 𝑑𝑋 2 𝐸𝑗 (𝑓3 |𝑋𝑖 )]                        (36b)
                                                                                      𝑖

                                                                                                      𝑑
Those values correspond to averages of specific RETs: ℱ𝑖,𝑗,𝐹 (𝑋𝑖 ) = 𝐸𝑘 (𝑓2 |𝑋𝑖 ) 𝑑𝑋 𝐸𝑗 (𝑓1 |𝑋𝑖 ) and ℱ𝑖,𝑗,𝑔 (𝑋𝑖 ) =
                                                                                                          𝑖
1              𝑑2
  𝐸𝑘 (𝑓4 |𝑋𝑖 ) 2 𝐸𝑗 (𝑓3 |𝑋𝑖 ) respectively for (36a) and (36b). The result can be extended as follows when separability
2             𝑑𝑋𝑖
works for 𝑓2 and 𝑓4 :

Corollary 4 of Theorem 5

In the particular case 𝐹𝑖,𝑗 = 𝑓1 (𝑋𝑗 )𝑓2𝑎 (𝑋𝑖 )𝑓2𝑏 (𝑋𝑘 ) , then:
                                                                              𝑑
                                𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝐸𝑖 [𝑓2𝑎 (𝑋𝑖 ) 𝐸𝑘 (𝑓2𝑏 |𝑋𝑖 )       𝐸 (𝑓 |𝑋 )]                           (37a)
                                             𝐹                               𝑑𝑋𝑖 𝑗 1 𝑖

In a similar way, for 𝑔𝑖,𝑖,𝑗 = 𝑓3 (𝑋𝑗 )𝑓4𝑎 (𝑋𝑖 )𝑓4𝑏 (𝑋𝑘 ), we get:

                                                   1                                  𝑑2
                                𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 = 2 𝐸𝑖 [𝑓4𝑎 (𝑋𝑖 ) 𝐸𝑘 (𝑓4𝑏 |𝑋𝑖 ) 𝑑𝑋 2 𝐸𝑗 (𝑓3 |𝑋𝑖 )]                      (37b)
                                                                                          𝑖

The above closed formulas should be applied to each term of the deterministic part and diffusivity. These relations
constitute the practical basis of the CSM for the single rates of entropy transfer.

Let us give a concrete example in a 3D system to compute 𝑇(𝑋2 → 𝑋1 ) where

                                         𝐹1 = exp(𝑋1 )sin(𝑋2 ) + 𝑋1 𝑋3                                               (38a)

                                         𝑔1,1 = (𝑋3 − 𝑋1 𝑋2 )2 = 𝑋32 + 𝑋12 𝑋22 − 2𝑋1 𝑋2 ≥ 0                          (38b)

The first step is to obtain 𝐹1,2 = exp(𝑋1 )sin(𝑋2 ) and 𝑔1,1,2 = 𝑋12 𝑋22 − 2𝑋1 𝑋2 to which we apply (37a,b), obtaining:
                                                                           𝑑𝐸2 [sin(𝑋2 )|𝑋1 ]
                                         𝑇(𝑋2 → 𝑋1 )𝐹 = 𝐸1 {exp(𝑋1 )             𝑑𝑋1
                                                                                             }                       (39a)

                                                            1        𝑑 2 𝐸2 (𝑋22 |𝑋1 )       𝑑 2 𝐸2 (𝑋2 |𝑋1 )
                                         𝑇(𝑋2 → 𝑋1 )𝑔 = 2 𝐸1 [𝑋12         𝑑𝑋1 2        − 2𝑋1      𝑑𝑋12
                                                                                                              ]      (39b)

3.3. Causal synergies and rates of entropy transfer

At the beginning of Sec. 3.1, the problem of relating the global RET 𝑇(𝑋~𝑖 → 𝑋𝑖 ) with the RET between pairs of
variables was posed. In order to figure out the link between these different quantities, we consider the simplest
situation of dimension 𝐷 = 3 (without loss of generality) and a multiplicatively separable deterministic term
𝐹1 (𝑋1 , 𝑋2 , 𝑋3 ) = 𝑓1 (𝑋1 )𝑓2 (𝑋2 )𝑓3 (𝑋3 ). Then, applying (13), the RET 𝑇(𝑋~1 → 𝑋1 ) is:
                                                                                              𝑑
                                 𝑇(𝑋~1 → 𝑋1 ) 𝐹 = 𝑇(𝑋2,3 → 𝑋1 ) 𝐹 = 𝐸1 [𝑓1 𝑑𝑋 𝐸2,3 (𝑓2 𝑓3 |𝑋1 )]                      (40)
                                                                                                  1




                                                                                                                        14
Now, let us decompose the averaged conditional product as 𝐸2,3 (𝑓2 𝑓3|𝑋𝑖 ) = 𝐸2 (𝑓2|𝑋𝑖 )𝐸3 (𝑓3|𝑋1 ) + 𝑐𝑜𝑣(𝑓2 , 𝑓3|𝑋1 ),
i.e. the product of conditional expectations plus the conditional covariance. Next, after taking the derivative and
applying the single RET expression (37a), we get:

                           𝑇(𝑋~1 → 𝑋1 ) 𝐹 = 𝑇(𝑋2,3 → 𝑋1 ) 𝐹 = 𝑇(𝑋2,3 → 𝑋1 ) 𝐹,𝑠𝑖𝑛𝑔 + +𝑇(𝑋2,3 → 𝑋1 ) 𝐹,𝑠𝑦𝑛                        (41a)

                                              𝑇(𝑋2,3 → 𝑋1 ) 𝐹,𝑠𝑖𝑛𝑔 = 𝑇(𝑋2 → 𝑋1 ) 𝐹 + 𝑇(𝑋3 → 𝑋1 ) 𝐹                               (41b)
                                                                                    𝑑
                                              𝑇(𝑋2,3 → 𝑋1 ) 𝐹,𝑠𝑦𝑛 = 𝐸1 [𝑓1 𝑑𝑋 𝑐𝑜𝑣(𝑓2 , 𝑓3|𝑋1 )]                                  (41c)
                                                                                        1


which shows that, the joint RET is the sum of single RETs (41b) plus a synergetic term (41c) related to the conditional
covariance between the functions of the complementary variables 𝑋2 , 𝑋3 . The same procedure can be replicated
for multiple variables putting into evidence the effect of synergies of couples, triplets and other groups of variables
which are accounted for in multivariate forms of the mutual information, like the Interaction Information for triplets
[28].

The sum of single RETs equals the global RET when all the non-consequential variables are conditionally
independent with respect to the consequential variable.

This led us to present the concept of synergetic rate of entropy transfer as the difference between the global RET
and the sum of single RETs and the corresponding deterministic and stochastic contributions:

       𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑠𝑦𝑛 = 𝑇(𝑋~𝑖 → 𝑋𝑖 ) − ∑𝑗≠𝑖 𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹,𝑠𝑦𝑛 + 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝑔,𝑠𝑦𝑛                                (42a)

              𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑠𝑖𝑛𝑔 = ∑𝑗≠𝑖 𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹,𝑠𝑖𝑛𝑔 + 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔,𝑠𝑖𝑛𝑔                                   (42b)

For linear systems the deterministic synergetic RET vanishes, though this is not a sufficient condition of linearity.

3.4 Rate of entropy transfer between transformed variables

We address in this section the problem of how variable changes can affect the values of 𝑇(𝑋𝑗 → 𝑋𝑖 ). Ideally, in a
naive view, any independent variable changes should not influence the RET because the causality only depends on
the link between variables and not on how variables or processes are represented, in particular the physical units.

The next theorem checks in a rigorous manner, the effect of one-to-one diffeomorphism variable-changes in the
rate of entropy transfer. For that, let us consider new variables 𝑋̂𝑖 , 𝑋̂𝑗 , 𝑋̂𝑘 defined in a union of open intervals
(eventually not connected), which are functions respectively of 𝑋𝑖 , 𝑋𝑗 , 𝑋𝑘 , where 𝑘 ≡ ~(𝑗, 𝑖) stands for variables
                                                                                                                           𝑑𝑋̂
different from 𝑗, 𝑖 and where, without loss of generality, all the jacobians are strictly positive, i.e. ℑ𝑖 ≡ 𝑑𝑋𝑖 > 0, ℑ𝑗 ≡
                                                                                                                             𝑖
𝑑𝑋̂𝑗          𝑑𝑋̂
𝑑𝑋𝑗
    > 0, ℑ𝑘 ≡ 𝑑𝑋𝑘 > 0. Then, we have the following result proven in Appendix A12.
                 𝑘


Theorem 6

The rate of entropy transfer (RET) between one-to-one diffeomorphism variable changes is:

                                              𝑇(𝑋̂𝑗 → 𝑋̂𝑖 ) = 𝑇(𝑋𝑗 → 𝑋𝑖 ) + 𝑇(𝑋𝑗 → 𝑋𝑖 )𝑡𝑟                                        (43a)

                             1       1     𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖 ) 𝜕𝑔𝑖,𝑖 𝑑 log ℑ𝑖           𝑑 log ℑ    𝑑                    𝜕𝑔̅ 𝑖,𝑖,𝑗
       𝑇(𝑋𝑗 → 𝑋𝑖 )
                     𝑡𝑟
                          = − 𝐸[
                             2     𝜌𝑗|~𝑗      𝜕𝑋𝑖       𝜕𝑋𝑗     𝑑𝑋𝑖
                                                                         ] = 𝐸𝑖 { 𝑑𝑋 𝑖 [𝑑𝑋 𝐸𝑗 (𝑔̅𝑖,𝑖,𝑗 |𝑋𝑖 ) − 𝐸𝑗 ( 𝜕𝑋 |𝑋𝑖 )]}   (43b)
                                                                                     𝑖          𝑖                      𝑖




                                                                                                                                   15
The result (43b) shows that the RET correction 𝑇(𝑋𝑗 → 𝑋𝑖 )𝑡𝑟 is a unique function of the diffusion term, being the
deterministic part of 𝑇(𝑋𝑗 → 𝑋𝑖 ) kept invariant for any one-to-one diffeomorphisms of variables. Only the stochastic
RET can change, being invariant when any of the factors in (43b) vanish, i.e.: the noise is additive or multiplicative
                                   𝜕𝑔𝑖,𝑖
without cross dependencies, i.e.
                               𝜕𝑋𝑗
                                         = 0 or when the variable transformation 𝑋𝑖 → 𝑋̂𝑖 is affine (translation and
                   𝜕 log ℑ𝑖
scaling) leading to 𝜕𝑋 = 0. This guarantees the RET invariance under quite generic conditions. This is a revision
                        𝑖
of Remark 1 of Theorem III.3 of Liang [17], showing that in certain conditions, it is possible to make invertible
changes of the consequential variable, keeping the value of the entropy transfer. The variables 𝑋̂𝑘 where 𝑘 ≡ ~(𝑗, 𝑖)
can additionally be an invertible mixture of 𝑋𝑘 , since 𝜌𝑗|~𝑗 is preserved by that transformation. The r.h.s. of (43b)
shows that the correction, due to the variable change is obtained by conditional expectations of the diffusivity. The
result (43b) can be important for the RET estimation, since certain variable changes can make the pdf simpler, as for
instance Gaussian anamorphoses of the single variables [29] where 𝑋̂𝑖 , 𝑋̂𝑗 , 𝑋̂𝑘 are such that the marginal pdfs follow
a standard Gaussian pdf, though the multivariate pdf is not necessarily Gaussian.

When the variable changes are not injective, the problem is more complicated. For instance, for 𝑋𝑖 → 𝑋̂𝑖 = 𝑋𝑖2 we
have the entropy 𝐻(𝑋𝑖2 ) = 𝐻(𝑋𝑖 ) + 𝐸(log|2𝑋𝑖 |) − 𝐻(𝑋𝑖 |𝑋𝑖2 ), where 𝐻(𝑋𝑖 |𝑋𝑖2 ) is the entropy of inverse images of
the transformation, which vanishes in the case of injective variable changes. This problem is not addressed here.

4. Numerical approach to the computation of RETs

The estimation of the rates of entropy transfer (RETs) is a more complicated task than the estimation of the single,
multivariate and conditional entropies, for which numerous estimators exist in the literature as seen in the review
[30]. The main difficulty comes from the RET dependency, not only on the pdfs and conditional pdfs (like the
entropy) but also on the partial derivatives of pdfs (10a, 23a). The later can be difficult to evaluate, especially if pdfs
display abrupt changes or their support set has a fractionary Hausedorff dimension as in strange chaotic attractors,
leading to non-differentiable pdfs (albeit some pdf projections like marginal pdfs can be differentiable). This
difficulty is alleviated if enough (in intensity) stochastic forcing noise is added to the evolution equations of
deterministic chaotic systems, thus producing non-vanishing pdf values at the fractal gaps of the strange attractors.
Therefore, the estimation of pdf derivatives by finite differences call for the prescription, both of the full pdf and of
conditional pdfs along a regular grid of the state-space. This constraint call for the estimation of RET integral
formulas using integrals over the pdf, as used by Liang in [16,17], which will be considered as a benchmark to
compare with the CSM approach.

Therefore, in testing the methods to evaluate the rate of entropy transfer, 𝑇(𝑋𝑗 → 𝑋𝑖 ), (𝑖, 𝑗 = 1, … 𝐷, 𝑖 ≠ 𝑗), four
different approaches are considered: the Analytical-Numerical (AN) approach which consists in using the direct
estimations of the probabilities and integrals over the pdfs, the Causal Sensitivity Method (CSM), the Model Fitting
(MF) followed by application of CSM and finaly the Multivariate Linear (ML) approach of Liang [18], which supposes
a linear model fitting and Gaussian distributed noises. The four methods will be applied into two low-order models
of dimension 𝐷 = 3 whose equations are known: (1) a model derived from a potential function [16,17], with some
generalizations to include multiplicative noise, linearity and non-linearity, all weighted by appropriate parameters
and (2) the classical Lorenz chaotic model [26], driven by additive or multiplicative noise, weighted by controlled
parameters. The details of the four referred approaches are described below. Sections 5 and 6 present model results.

4.1. Analytical-Numerical (AN) approach

In the first approach, the so called ‘Analytical-Numerical’ (AN), we evaluate the integrals implicitly in (26a,b). An
analytical or a data-estimated multivariate (3D) pdf as well as the analytical values of the sensitivities to the causal


                                                                                                                        16
               𝜕𝐹𝑖 𝜕𝑔𝑖,𝑖 𝜕2 𝑔𝑖,𝑖
variable:         ,     ,
               𝜕𝑋𝑗 𝜕𝑋𝑗 𝜕𝑋𝑗 𝜕𝑋𝑖
                                 are used in the centroids (𝑋𝑖′ , 𝑋𝑗′ , 𝑋𝑘′ ) of equal-volume voxels (3D cells) with sides
∆𝑖, ∆𝑗 , ∆𝑘 , respectively in the variables 𝑋𝑖 , 𝑋𝑗 , 𝑋𝑘 , (𝑘 ≠ 𝑖, 𝑗). The indexed voxel (𝑖 ′ , 𝑗 ′ , 𝑘 ′ ) ∈ {1, … , 𝑁𝑖 } × {1, … , 𝑁𝑗 } ×
{1, … , 𝑁𝑘 } belongs to a regular coarse-grained grid-mesh of the parallelepipedic subset [𝐿𝑖 , 𝑈𝑖 ] × [𝐿𝑗 , 𝑈𝑗 ] × [𝐿𝑘 , 𝑈𝑘 ]
of the state-space in which the bulk of the multivariate pdf lies. In the forthcoming discretized expressions, we use
plica-indices for the respective variable (e.g. 𝑖 ′ is the index discretizing variable 𝑋𝑖 ). This method was used in Liang
[16,17] but using integrals of (22b,c).

Recall that in three dimensions, there is only one outer variable 𝑘 ≠ 𝑖, 𝑗. The probability of each voxel (𝑖 ′ , 𝑗 ′ , 𝑘 ′ ) is
denoted       as     𝑃(𝑖 ′ , 𝑗 ′ , 𝑘 ′ ) = 𝜌̃𝐗 (𝑋𝑖′ , 𝑋𝑗′ , 𝑋𝑘′ )/𝑍, where the normalizing     constant     is          𝑍=
         𝑁
∑𝑁  𝑖
       ∑ 𝑗 ∑𝑁𝑘 ̃𝐗 (𝑋𝑖′ , 𝑋𝑗′ , 𝑋𝑘′ ), such that probabilities sum one altogether and 𝜌̃𝐗 is prescribed or estimated.
 𝑖 ′ =1 𝑗 ′ =1 𝑘 ′ =1 𝜌
The pdf is estimated as 𝜌̃𝐗 /(∆𝑖 ∆𝑗 ∆𝑘 ).
                                                                                                                                  𝑁
The one- or two-indexed probabilities are sums over the remaining indices, e.g. 𝑃(𝑖 ′ , 𝑗 ′ ) = ∑𝑘 ′𝑘=1 𝑃(𝑖 ′ , 𝑗 ′ , 𝑘 ′ ), which
are necessary to compute conditional probabilities, like 𝑃(𝑗 ′ |𝑖 ′ ) = 𝑃(𝑖 ′ , 𝑗 ′ )/𝑃(𝑖 ′ ).

Therefore, by restricting the 3D-integrals of (26a,b) over the bounded domain, we get:
                                          𝑈            𝑈        𝜕       𝑋                               𝑈                   𝜕𝑅
                𝑇(𝑋𝑗 → 𝑋𝑖 ) ≈ − ∫𝐿 𝑖 𝑑 𝑋𝑖′ ∫𝐿 𝑗 𝑑 𝑋𝑗′ 𝜕𝑋 [∫𝐿 𝑗′ 𝜌(𝑋𝑗′′ |𝑋𝑖′ )𝑑𝑋𝑗′′ ] ∫𝐿 𝑘 𝜌(𝑋𝑖′ 𝑋𝑘′ ) 𝜕𝑋𝑖 𝑑 𝑋𝑘′                            (44)
                                          𝑖            𝑗            𝑖   𝑗                                  𝑘                      𝑗

                                                               𝜕𝐴
where 𝜌 stands for pdf. In (44), the derivatives 𝜕𝑋 of a generic quantity 𝐴 at the voxel (𝑖 ′ , 𝑗 ′ , 𝑘 ′ ) are estimated by
                                                                𝑖
                       𝛿 ′ [𝐴]                                                   1
centred differences as 𝑖∆ where one uses the discretized operator 𝛿𝑖′ [𝐴] ≡ 2 [𝐴(𝑖 ′ + 1, 𝑗 ′ , 𝑘 ′ ) − 𝐴(𝑖 ′ − 1, 𝑗 ′ , 𝑘 ′ )];
                            𝑖
while at the interval bounds: 𝑖 ′ = 1, 𝑁𝑖 one takes the values at 𝑖 ′ = 2, 𝑁𝑖 − 1 respectively.

After the discretization of (44), one obtains:
                                                  1        𝑁   𝑁        𝑁             𝑗′       𝑃(𝑖 ′ ,𝑗 ′′ )              𝜕𝑅
                          𝑇(𝑋𝑗 → 𝑋𝑖 ) ≈ − ∆ ∑𝑖′𝑖=1 ∑𝑗′𝑗=1 ∑𝑘 ′𝑘=1 𝛿𝑖′ [∑𝑗′′ =1                  𝑃(𝑖 ′ )
                                                                                                            ] 𝑃(𝑖 ′ , 𝑘′) 𝜕𝑋𝑖 .            (45)
                                                   𝑖                                                                        𝑗

                                                                            𝜕𝐹        𝜕𝑔             𝜕2 𝑔                   𝜕𝑅
By using the prescribed analytical expressions values of 𝜕𝑋𝑖 , 𝜕𝑋𝑖,𝑖 and 𝜕𝑋 𝜕𝑋
                                                                             𝑖,𝑖
                                                                                 to form 𝜕𝑋𝑖 in (45) at each voxel
                                                                             𝑗             𝑗           𝑗       𝑖                  𝑗
(𝑖 ′ , 𝑗 ′ , 𝑘 ′ ), the rightmost factor of the above sum is:
                                        𝜕𝑅𝑖                𝜕𝐹   1                  𝜕𝑔    1               𝜕2 𝑔𝑖,𝑖
                          𝑃(𝑖 ′ , 𝑘′)       = 𝑃(𝑖 ′ , 𝑘 ′ ) 𝑖 − 𝛿𝑖′ [𝑃(𝑖 ′ , 𝑘 ′ )] 𝑖,𝑖 − 𝑃(𝑖 ′ , 𝑘 ′ )                                    (46)
                                        𝜕𝑋𝑗                𝜕𝑋𝑗 2∆𝑖                 𝜕𝑋𝑗   2              𝜕𝑋𝑗 𝜕𝑋𝑖

The truncation and discretization errors (due to finite bounds 𝐿𝑖 , 𝑈𝑖 and non-infinitesimal Δ𝑖 respectively)
committed in the estimated causality, depends much on the model equations and pdf. For instance, if [𝐿𝑖 , 𝑈𝑖 ] spans
𝑛 standard deviations around the average 𝑋𝑖 , the estimation error 𝜀𝐴 in the generic average of 𝐴(𝑋𝑖 ) within the
                                                                                                      |𝐴𝑎𝑣𝑒 −𝐴𝑒𝑥𝑡 |
probabilistic integral, satisfies, after using the Tchebitchev inequality, |𝜀𝐴 | ≤                        𝑛2
                                                                                                                   , where 𝐴𝑎𝑣𝑒 is the estimated
average in the bounded interval and 𝐴𝑒𝑥𝑡 is the average of 𝐴 outside the interval [𝐿𝑖 , 𝑈𝑖 ]. In the problem of
                                                                                 𝜕𝑅
computing 𝑇(𝑋𝑗 → 𝑋𝑖 ), the above 𝐴 quantities are terms of 𝜕𝑋𝑖 . Therefore, to minimize |𝜀𝐴 |, high enough 𝑛 must
                                                                                  𝑗
be taken, especially if 𝐴(𝑋𝑖 ) is monotonic increasing with a positive power of |𝑋𝑖 |. Moreover, |𝐿𝑖 |, |𝑈𝑖 | increase in
the case of fatter pdf tails. As a rule of thumb, at least 𝑛 = 3 standard deviations must be included in the interval
used in the numerical integral. In practice, a stopping criterium for increasing |𝐿𝑖 |, |𝑈𝑖 | and increasing resolution 𝑁𝑖
is that the estimated averages of the highest-order products of variables (e.g. 𝑋𝑖2 𝑋𝑗2 ) have corrections smaller than
1% of that average. The deterministic and noise contributions 𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹,𝐴𝑁 and 𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔,𝐴𝑁 by AN, are


                                                                                                                                             17
computed and used as benchmarks for the other methods. The AN method is considered as a ‘brute-force’ method,
since it requires the direct computation of the integrals. This cab be a very heavy computation, since the number of
cells in domain integrals increases as a power of the system dimension. Moreover, the effective implementation
increases in complexity with the dimension.

4.2. Causal Sensitivity Method (CSM)

In the second approach, which we developed in the context of this analysis, we identify the parts 𝐹𝑖,𝑗 and 𝑔𝑖,𝑖,𝑗 (27)
of the deterministic term 𝐹𝑖 and diffusivity 𝑔𝑖,𝑖 that depends on 𝑋𝑗 . Then, in the case, 𝐹𝑖,𝑗 and 𝑔𝑖,𝑖,𝑗 are composed
by additive terms with a separation of the causal variable, we apply the formulas (36a,b) or (37a,b), which
dependent on the particular form of model equations.

In the application of the CSM, the expectations are computed as averages over a certain ensemble of different
realizations of the model states. The ensemble can be: 1) a transient ensemble of a large number 𝑁𝑟 of time-evolving
states driven by the equations of the model or 2) a long enough time-series of length 𝐿𝑡 with sampling-time Δ𝑡 ,
tunned to uncover the ergodic pdf of the model, with 𝑁𝑟 = 𝐿𝑡 /Δ𝑡 realizations. The RET coming from a very large
ensemble (long time-series) or the average of RETs obtained from shorter ensembles (time-series) can be taken. In
that case, realizations of the estimated RET are obtained by generating a number of 𝑁𝑠 (30 in practice) time-series
i.e. obtained with different noise generator seeds and initial conditions, leading to 𝑁𝑠 RET estimations (ensemble
members) whose mean and standard deviation over the sampled realizations are computed. The sensitivity to the
time series length is also studied.

In practice, the values of 𝐹𝑖,𝑗 and 𝑔𝑖,𝑖,𝑗 are calculated for each realization (ensemble member or instant). One of the
assumptions for applying the CSM formulas (36a,b) or (37a,b) is that the different additive terms of 𝐹𝑖,𝑗 and 𝑔𝑖,𝑖,𝑗
can be factorized by factors depending on the different variables. That happens, for instance, when the deterministic
terms are products of monomials of the different variables 𝑋𝑖 , 𝑋𝑗 , 𝑋𝑘 . For each term, the single dependent functions
of 𝑋𝑖 , 𝑋𝑗 , 𝑋𝑘 are identified, after which one computes the conditional expectations for a given value of 𝑋𝑖 . Thanks
to the product separability of forcings, the regressions are univariate. There, in general nonlinear regressions are
performed in which we consider a certain set of basis functions (e.g. monomials 𝑋𝑖𝑘 , 𝑖 = 0, … , 𝑁𝑑 , up to a certain
degree 𝑁𝑑 or a set of orthogonal functions, wavelets, trigonometric functions, polynomial splines over a set of
subintervals of 𝑋𝑖 ) ranged by decreasing scale (e.g. polynomial order, wave number). The conditional expectation
function must be differentiable to apply CSM with algorithmic expressions for the first and second derivatives. The
most efficient and robust regression depends on the freedom choice of the basis functions or of the regression
formula as a whole. In this respect, some strategies could be followed: 1) mixing different basis functions (e.g.
polynomials, trigonometric functions, wavelets); 2) use of machine learning techniques such as Relevance Vector
Machines [31] and 3) use of evolving basis functions towards an optimal set by using Symbolic Regression [32]. In
general, the regression formula may depend nonlinearly on the fitted parameters.

For the sake of algorithmic simplicity and didactic presentation, we will restrict our analysis to polynomial basis
functions. In the case of small ensembles or short time-series, the regressions must be accompanied by statistical
significance tests in order to obtain robust regressions (e.g. forward step-regression or computation of the Akaike
Information Criterium).

The regression coefficients are fixed for an ergodic pdf or time-evolving for transient ensembles of the model. For a
good performance of CSM, the conditional averages like 𝐸𝑘 [𝑓(𝑋𝑘 |𝑋𝑖 )] must be accurately estimated as well as their
derivatives. Therefore, depending on the particular RET, 𝑁𝑑 must be high enough, such that regressions do not differ
much from the probabilistic averages ∫ 𝜌(𝑋𝑘 |𝑋𝑖 )𝑓(𝑋𝑘 ) 𝑑𝑋𝑘 along the interval [𝐿𝑖 , 𝑈𝑖 ]. Too small 𝑁𝑑 can lead to
biases.

                                                                                                                    18
After, calculating the regressions, their first and second derivatives with respect to 𝑋𝑖 are computed as well as the
required products and averages. Then ensemble (or time-averages) averages taken. If the regressions are computed
using a basis of unbounded functions like monomials, the regressions as well as the values of the specific RETs
ℱ𝑖,𝑗,𝐹 (𝑋𝑖 ) and ℱ𝑖,𝑗,𝐹 (𝑋𝑖 ) can reach (in absolute value) much higher values when 𝑋𝑖 is extrapolated beyond the
bounds of the dataset. In those cases, a certain from of trimmed average (cutting the extremes) can be applied.

The computational complexity of CSM is much lower than in AN, being thus an execelent alternative to the highly-
demanding AN especially in high dimensionsional systems.

4.3. Model fitting (MF) followed by CSM

The CSM approach assumes known model equations. However, in practice, both the deterministic terms and
diffusivities 𝐹𝑖 , 𝑔𝑖𝑖 (𝑖 = 1, … , 𝐷) may be partially or totally unknown. In this case, an additional preliminar operation
to apply CSM afterwards. This procedure, hereafter referred as ‘Model fitting followed by CSM’ (MF) is described
bellow.

In order to apply the CSM, we suppose that, 𝐹𝑖 , 𝑔𝑖𝑖 (𝑖 = 1, … , 𝐷) are written as linear combinations of variable-
separable basis functions (including the unity), Ψ𝑙 , Φ𝑙 belonging to certain prefixed classes (e.g. multivariate
polynomials). Let us consider the deterministic term decomposition

                                                𝐹𝑖 (𝐗) = ∑𝑙 𝜃𝐹,𝑙,𝑖 Ψ𝑙 (𝐗)                                            (47a)

                                                 Ψ𝑙 (𝐗) = ∏𝐷
                                                           𝑟=1 Ψ𝑙,𝑟 (𝑋𝑟 )                                            (47b)

and the diffusivity decomposition

                                                𝑔𝑖,𝑖 (𝐗) = ∑𝑙 𝜃𝑔,𝑙,𝑖 Φ𝑙 (𝐗) ≥ 0                                      (48a)

                                       Φ𝑙 (𝐗) = ∏𝐷
                                                 𝑟=1 Φ𝑙,𝑟 (𝑋𝑟 ) ; 𝜃𝑔,𝑙,𝑖 , Φ𝑙,𝑟 ≥ 0                                  (48b)

where 𝜃𝐹,𝑙,𝑖 (merged in the matrix 𝛉𝐹 ) and 𝜃𝑔,𝑙,𝑖 (merged in the matrix 𝛉𝑔 ) are constant parameters. The
corresponding fitted values from data are denoted respectively as 𝜃̂𝐹,𝑙,𝑖 and 𝜃̂𝑔,𝑙,𝑖 , merged in matrices 𝛉
                                                                                                           ̂𝐹 and 𝛉
                                                                                                                  ̂𝑔 .

Like in the case of conditional expectancies, other regression techniques may be applied (e.g. machine learning
techniques), paying attention to the product separability of forcings and algorithmic expressions of their derivatives.
Moreover, robust regressions must be accompanied by statistical significance tests when the available time-series
are short.

The estimation method is presented in Appendix B1. For instance in order to fit a linear model, we consider the
class of basis-functions {Ψ𝑙 (𝐗)} = {1, 𝑋1 , … , 𝑋𝐷 }.

Since the RETs of a linear combination of deterministic terms or diffusivities (47a, 48a) is the linear combination of
the RETs driven by each term, we can write the total RET obtained by MF, as a sum over the basis-functions as:

                                       𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹,𝑀𝐹 = ∑𝑙 𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹,𝑀𝐹,𝑙                                        (49a)

                                       𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔,𝑀𝐹 = ∑𝑙 𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔,𝑀𝐹,𝑙                                        (49b)

By applying the CSM to each contribution (49a,b) and using the estimated parameters, one has the RETs associated
to each basis function:
                                                                     𝑑 𝐸(Ψ𝑙,𝑗 |𝑋𝑖 )
                              𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹,𝑀𝐹,𝑙 = 𝜃̂𝐹,𝑙,𝑖 𝐸 [Ψ𝑙,𝑖           𝑑𝑋𝑖
                                                                                      𝐸(∏𝑟≠𝑖,𝑗 Ψ𝑙,𝑟 |𝑋𝑖 ) ]          (50a)

                                                                                                                        19
                                                    ̂𝑔,𝑙,𝑖
                                                    𝜃                  𝑑 2 𝐸(Φ𝑙,𝑗 |𝑋𝑖 )
                              𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹,𝑀𝐹,𝑙 =     2
                                                             𝐸 [Φ𝑙,𝑖        𝑑𝑋𝑖2
                                                                                          𝐸( ∏𝑟≠𝑖,𝑗 Φ𝑙,𝑟 |𝑋𝑖 ) ]                 (50b)

Therefore, looking in detail (50a,b), and for each pair (𝑖, 𝑗), and basis function Ψ𝑙 , Φ𝑙 , one evaluates first the
conditional expectations of the outer-variable factors. Then, conditional expectations 𝐸(Ψ𝑙,𝑗 |𝑋𝑖 ) and 𝐸(Φ𝑙,𝑗 |𝑋𝑖 )
are assessed as well as their first and second derivatives, respectively. Then, the average products are taken
multiplied by the fitted model coefficients. Finally the sum (49a,b) is calculated. We must note that the estimation
of 𝑇(𝑋𝑗 → 𝑋𝑖 ), calls uniquely for the fitting of the evolution equation of the consequential variable 𝑋𝑖 as a linear
combination of functions of type 𝑓1 (𝑋𝑖 )𝑓2 (𝑋𝑗 )𝑓3 (𝑋~(𝑖,𝑗) ), separating causal, consequential and contextual variables.
This fitting depends on the extension of space in which 𝑋𝑖 , 𝑋𝑗 are embedded.

The RET estimations may have biases and sampling variances, coming from: 1) the model fitting through the
estimation of time-derivatives (time-step, difference scheme used), 2) the extent and type of basis functions used
in the model fitting, 3) overfitting of the model equations, 4) the ensemble size or time-series length, 5) the accuracy
of the nonlinear regressions used to estimate the conditional expectations.

Despite the above constraints, it happens that the CSM and MF approaches are computationally cheaper and
technically easier than the AN approach, even ih high system dimensions. Test of MF will be restricted to the Lorenz
model here (see Sec. 6).

4.4. Multivariate Linear Approach

The multivariate linear (ML) approach uses the formulas obtained by Liang [18] and covered in (34) where, a
multivariate linear model with additive Gaussian noise is fitted to data, using the maximum likelihood estimator of
the model coefficients, and also minimizing the mean squared error of the time derivative of 𝑋𝑖 . Then, the
corresponding RET, denoted as 𝑇(𝑋𝑗 → 𝑋𝑖 )      is obtained using the linear fitted model. Since the fitted model has
                                             𝐹,𝑀𝐿
no multiplicative noise, 𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔,𝑀𝐿 = 0.

The ML approach is equivalent to the CSM approach, when the fitted model is linear and the regressions used for
the conditional expectations are linear, i.e. the order of the fitting poynomials is 𝑁𝑑 = 1. This method is used to
emphasize the limitations of such a linear approach which is not expected to work as accurately as a nonlinear
estimator in strongly nonlinear situations. Therefore, it is expected that ML works under weak nonlinearity as will
be shown below in examples.

4.5. Summary of the tested methods

Table 1 summarizes the methods of RET estimation, the used models in this study, the drawbacks, advantages and
the computational cost (raw estimation of the number of simple algebraic operations) of each method in terms of
size parameters: 𝐷= state-space dimension, 𝑁𝑣 = Number of voxels (bins) taken in each variable, 𝑁𝑟 = Number of
ensemble realizations or time-series values, 𝑁𝑏 = Number of basis-functions or free regression parameters.
According to Table 1, computational complexity grows exponentialy with 𝐷 in the AN approach essentially due to
the pdf estimation whereas the one of the CSM grows as a power of 𝐷, essentially due to the solution of regression
problems. This shows clearly the much higher efficiency of CSM compared to AN.

 Method            Models used           Drawbacks or                                      Advantages              Comp. Cost
                                           limitations
 AN with exact Potential              1:       state-space                                 Exact model and            𝑂(𝑁𝑣 𝐷 )
 model and pdf                        discretization                                       pdf


                                                                                                                                   20
                                     2: cut of pdf tails


 AN with exact Lorenz            3: Cost growing Inaccuracy of Exact model            𝑂(𝑁𝑣 𝐷 𝑁𝑟 ).
 model     and                   exponentially with estimated pdf
 estimated pdf                   dimension             from ensembles
                                                       or time-series
 CSM               Potential and 1: Factorization of                  1: No explicit   𝑂(𝐷 2 𝑁𝑏3 𝑁𝑟 )
                   Lorenz        forcings         and                 pdf needed,
                                 diffusivities
                                                                      2: Low comp.
                                 2:           Accuracy                cost.
                                 dependent on the
                                 time-series length                   3:    Nonlinear
                                 and sampling                         models

 MF                Lorenz                             fitting of model 4: Only time-                   𝑂(𝐷 3 𝑁𝑏3 𝑁𝑟 )
                                                      equations        series necessary
                                                                       in MF
 ML                Potential and 1: Linear model assumption.           Very low comp.                      𝑂(𝐷 3 𝑁𝑟 )
                   Lorenz                                              cost.
                                 2:Inaccurate on highly nonlinear
                                 models.

                                     2: Assumption of Gaussian errors.


Table 1: Summary of tested methods with the applied models, drawbacks, advantages and computational cost of
the RET estimation.



5. Potential Model

5.1. Model description

The AN computation of RETs was performed by [16,17] on a stochastic potential model. Here, we will make
independent estimations on the same model, adding some generalizations for the validation of three of the different
methods of computing RETs, proposed in Sec. 4: AN, CSM and ML methods. The MF will be tested with the Lorenz
model in Sec. 6.

The generalized potential model used here is described by a three-dimensional (𝐷 = 3) vector 𝐗 =
(𝑋1 , 𝑋2 , 𝑋3 )𝑇 ∈ ℝ3 whose stochastic differential equations are derived from a potencial function 𝑉(𝐗) in the form:
                                       𝜕𝑉(𝐗)
                             𝑑𝑋𝑖 = − 𝜕𝑥 𝑑𝑡 + 𝐵(𝐗)𝑑𝑊𝑖 , 𝑖 = 1,2,3                                                    (51a)
                                          𝑖

                     1
            𝑉(𝐗) = 2 [𝛼𝑛𝑙 (𝑋12 𝑋22 + 𝑋32 𝑋22 ) + (𝑋1 − 𝛼𝑙 𝑋2 )2 + (𝑋2 − 𝛼𝑙 𝑋3 )2 + (𝑋3 − 𝛼𝑙 𝑋1 )2 )] ≥ 0            (51b)

                                     𝐵(𝐗) = [𝛼𝑚 𝑉(𝐗) + 𝑏 2 ]1/2 ≥ 0                                                 (51c)



                                                                                                                        21
where 𝛼𝑛𝑙 ≥ 0, 𝛼𝑙 ≥ 0 are parameters weighting the nonlinear and linear terms respectively of the deterministic
terms, which are given by:
                                               𝜕𝑉
                      𝐹1 (𝑋1 , 𝑋2 , 𝑋3 ) = − 𝜕𝑋 = −𝑋1 [𝛼𝑛𝑙 𝑋22 + (1 + 𝛼𝑙2 )] + 𝛼𝑙 (𝑋2 + 𝑋3 )                      (52a)
                                                 1

                                      𝜕𝑉
            𝐹2 (𝑋1 , 𝑋2 , 𝑋3 ) = − 𝜕𝑋 = −𝑋2 [𝛼𝑛𝑙 (𝑋12 + 𝑋32 ) + (1 + 𝛼𝑙2 )] + 𝛼𝑙 (𝑋1 + 𝑋3 )                       (52b)
                                         2

                                               𝜕𝑉
                      𝐹3 (𝑋1 , 𝑋2 , 𝑋3 ) = −       = −𝑋3 [𝛼𝑛𝑙 𝑋22 + (1 + 𝛼𝑙2 )] + 𝛼𝑙 (𝑋2 + 𝑋1 )                   (52c)
                                               𝜕𝑋3

The stochastic forcing is driven by identical diffusivities 𝑔𝑖,𝑖 (𝐗) = 𝛼𝑚 𝑉 + 𝑏 2 = 𝐵2 , 𝑖 = 1,2,3. The parameters 𝛼𝑚 ≥
0, 𝑏 ≥ 0, give the weight of the multiplicative and additive noises, respectively. The noises follow the law:
𝑑𝑊𝑖 ~√𝑑𝑡 𝑁(0,1).
The values 𝛼𝑛𝑙 = 1, 𝛼𝑚 = 𝛼𝑙 = 0, reproduce the same situation studied by Liang [17]. The parameter 𝛼𝑙 ≠ 0
produces a cross-linear symmetric term across the variables whereas 𝛼𝑛𝑙 = 𝛼𝑙 = 0 leads to pure Ornestein-
Ulenbeck processes (the equivalent to continuous red-noise processes).

The stationary solution of the Fokker-Planck equation (5) governing the model pdf is 𝜌𝐗 (𝑋1 , 𝑋2 , 𝑋3 ) ≡ 𝜌̂𝐗 /𝑍, with
                                                                               −2𝑉
                                                                         exp (     ) , 𝛼𝑚 = 0
                                                                                𝑏2
                                             𝜌̂𝐗 (𝑋1 , 𝑋2 , 𝑋3 ) = {             2
                                                                            −(1+𝛼 )                                (53)
                                                                         𝑏2      𝑚
                                                                    (𝑉 + 𝛼 )        , 𝛼𝑚 ≠ 0 ,
                                                                           𝑚


where 𝑍 is the normalization constant such that the integral of 𝜌𝐗 over ℝ3 equals one.

5.2. Formulas of the rates of entropy transfer

From the 6 possible RETs of type 𝑇(𝑋𝑗 → 𝑋𝑖 ), (𝑖, 𝑗 = 1,2,3, 𝑖 ≠ 𝑗), only three of them are independent due to the
functional symmetries of 𝐹𝑖 (𝑋1 , 𝑋2 , 𝑋3 ) and 𝑔𝑖,𝑖 (𝑋1 , 𝑋2 , 𝑋3 ) written below:

         [𝐹1 (𝑋1 , 𝑋2 , 𝑋3 ) = 𝐹3 (𝑋3 , 𝑋2 , 𝑋1 ) 𝑎𝑛𝑑 𝑔1,1 (𝑋1 , 𝑋2 , 𝑋3 ) = 𝑔3,3 (𝑋3 , 𝑋2 , 𝑋1 )]

                      ⇒ [𝑇(𝑋2 → 𝑋1 ) = 𝑇(𝑋2 → 𝑋3 ) 𝑎𝑛𝑑 𝑇(𝑋3 → 𝑋1 ) = 𝑇(𝑋1 → 𝑋3 )]                                 (54a)

         [𝐹2 (𝑋1 , 𝑋2 , 𝑋3 ) = 𝐹2 (𝑋3 , 𝑋2 , 𝑋1 ) 𝑎𝑛𝑑 𝑔2,2 (𝑋1 , 𝑋2 , 𝑋3 ) = 𝑔2,2 (𝑋3 , 𝑋2 , 𝑋1 )]

                                ⇒ [𝑇(𝑋1 → 𝑋2 ) = 𝑇(𝑋3 → 𝑋2 )]                                                     (54b)

Therefore, in practice, we compute only 𝑇(𝑋2 → 𝑋1 ), 𝑇(𝑋1 → 𝑋2 ) and 𝑇(𝑋1 → 𝑋3 ).

For the implementation of the AN approach and computation of (45), one requires the sensitivities of the
generalized speed 𝑅𝑖 with respect to 𝑋𝑗 (25) which can be written for the potential model as:

                                           𝜕𝑅𝑖   𝜕𝐹      𝛼      1      𝜕 log(𝜌~𝑗 )
                                           𝜕𝑋𝑗
                                               = 𝜕𝑋𝑖 (1 − 2𝑚) + 2 𝛼𝑚 𝐹𝑗 𝜕𝑋 ,                                      (55a)
                                                   𝑗                         𝑖


in which we have used:
                                                              𝜕𝑔𝑖,𝑖
                                                              𝜕𝑋𝑗
                                                                      = −𝛼𝑚 𝐹𝑗                                    (55b)

                                                              𝜕2 𝑔𝑖,𝑖            𝜕𝐹
                                                              𝜕𝑋𝑖 𝑋𝑗
                                                                        = −𝛼𝑚 𝜕𝑋𝑖                                 (55c)
                                                                                  𝑗



                                                                                                                     22
The RETs based on the CSM approach are obtained by using the procedure described in Sec. 4.2, whose particular
forms are given below.

5.2.1. Formula of 𝑻(𝑿𝟐 → 𝑿𝟏 )

Here, the causal variable 𝑋𝑗 is 𝑋2 , whereas the consequential variable 𝑋𝑖 is 𝑋1 and the single outer variable is 𝑋𝑘 =
𝑋3 or 𝑖 = 1, 𝑗 = 2, 𝑘 = 3. The terms used in the computation are:

                                                𝐹1,2 = −𝛼𝑛𝑙 𝑋1 𝑋22 + 𝛼𝑙 𝑋2                                                       (56a)
                              𝛼
                     𝑔1,1,2 = 2𝑚 [𝛼𝑛𝑙 𝑋22 (𝑋12 + 𝑋32 ) + (1 + 𝛼𝑙2 )𝑋22 − 2𝛼𝑙 𝑋2 (𝑋1 + 𝑋3 )]                                      (56b)

Application of (37a,b) to each term of 𝐹1,2 and 𝑔1,1,2 leads to:
                                                                    2
                                                              𝑑𝐸2 (𝑋2 |𝑋1 )                 𝑑𝐸2 (𝑋2 |𝑋1 )
                             𝑇(𝑋2 → 𝑋1 )𝐹 = −𝛼𝑛𝑙 𝐸1 [𝑋1            𝑑𝑋1
                                                                              ] + 𝛼𝑙 𝐸1 [       𝑑𝑋1
                                                                                                            ]                    (57a)

                                                     𝑇(𝑋2 → 𝑋1 )𝑔 =
               𝛼                                                𝑑 2 𝐸2 (𝑋22 |𝑋1 )                           𝑑 2 𝐸2 (𝑋2 |𝑋1 )
            = 4𝑚 𝐸1 {[𝛼𝑛𝑙 [𝑋12 + 𝐸3 (𝑋32 |𝑋1 )] + (1 + 𝛼𝑙2 )]        𝑑𝑋1 2        − 2𝛼𝑙 [𝑋1 + 𝐸3 (𝑋3 |𝑋1 )]      𝑑𝑋12
                                                                                                                             }   (57b)

The deterministic part (57a) is decomposed into a nonlinear contribution, proportional to 𝛼𝑛𝑙 and a linear one,
proportional to 𝛼𝑙 whereas the noise part (57b) is proportional to the multiplicative-noise parameter 𝛼𝑚 .

For the computation of (57a,b) by CSM, we need to assess four conditional expectations on 𝑋1 :
𝐸2 (𝑋2 |𝑋1 ), 𝐸2 (𝑋22 |𝑋1 ), 𝐸3 (𝑋3 |𝑋1 ), 𝐸3 (𝑋32 |𝑋1 ) and their first and second derivatives.

5.2.2. Formula of 𝑻(𝑿𝟏 → 𝑿𝟐 )

Applying the same procedure as before with 𝑖 = 2, 𝑗 = 1, 𝑘 = 3, leads to:

                                      𝐹2,1 = −𝛼𝑛𝑙 𝑋2 𝑋12 + 𝛼𝑙 𝑋1                                                                 (58a)
                                                𝛼
                                      𝑔2,2,1 = 2𝑚 [𝛼𝑛𝑙 𝑋22 𝑋12 + (1 + 𝛼𝑙2 )𝑋12 − 2𝛼𝑙 𝑋1 (𝑋2 + 𝑋3 )]                              (58b)

and:
                                                                               2
                                                                         𝑑𝐸1 (𝑋1 |𝑋2 )                 𝑑𝐸1 (𝑋1 |𝑋2 )
                                      𝑇(𝑋1 → 𝑋2 )𝐹 = −𝛼𝑛𝑙 𝐸2 [𝑋2               𝑑𝑋2
                                                                                         ] + 𝛼𝑙 𝐸2 [            𝑑𝑋2
                                                                                                                      ]          (59a)

                     𝛼𝑚                            𝑑 2 𝐸1 (𝑋12 |𝑋2 )                          𝑑 2 𝐸 (𝑋 |𝑋 )
    𝑇(𝑋1 → 𝑋2 )𝑔 =      𝐸2 {[𝛼𝑛𝑙 𝑋22 + (1 + 𝛼𝑙2 )]          2        − 2𝛼𝑙 [𝑋2 + 𝐸3 (𝑋3 |𝑋2 )] 1 21 2 }                          (59b)
                      4                                 𝑑𝑋2                                        𝑑𝑋2

For this specific computation we need three conditional                                       expectations            on   𝑋2 namely:
𝐸1 (𝑋1 |𝑋2 ), 𝐸1 (𝑋12 |𝑋2 ), 𝐸3 (𝑋3 |𝑋2 ) and their first and second derivatives.

5.2.3. Formula of 𝑻(𝑿𝟏 → 𝑿𝟑 )

In a similar way with 𝑖 = 3, 𝑗 = 1, 𝑘 = 2 and

                                      𝐹3,1 = 𝛼𝑙 𝑋1                                                                               (60a)
                                                         𝛼
                                      𝑔3,3,1 = 𝑔2,2,1 = 2𝑚 [𝛼𝑛𝑙 𝑋22 𝑋12 + (1 + 𝛼𝑙2 )𝑋12 − 2𝛼𝑙 𝑋1 (𝑋2 + 𝑋3 )]                     (60b)


                                                                                                                                   23
one gets:
                                                                   𝑑𝐸1 (𝑋1 |𝑋3 )
                                        𝑇(𝑋1 → 𝑋3 )𝐹 = 𝛼𝑙 𝐸3 [                     ]                                               (61a)
                                                                         𝑑𝑋3

                       𝛼                                          𝑑 2 𝐸1 (𝑋12 |𝑋3 )                           𝑑 2 𝐸1 (𝑋1 |𝑋3 )
    𝑇(𝑋1 → 𝑋3 )𝑔 = 4𝑚 𝐸3 {[𝛼𝑛𝑙 𝐸2 (𝑋22 |𝑋3 ) + (1 + 𝛼𝑙2 )]             𝑑𝑋3 2        − 2𝛼𝑙 [𝑋3 + 𝐸2 (𝑋2 |𝑋3 )]      𝑑𝑋32
                                                                                                                               }   (61b)

In      this      case       four      dependent        conditional       expectations     on              𝑋3       are      necessary:
                    2                          2
𝐸1 (𝑋1 |𝑋3 ), 𝐸1 (𝑋1 |𝑋3 ), 𝐸2 (𝑋2 |𝑋3 ), 𝐸2 (𝑋2 |𝑋3 ) and their first and second derivatives.

5.3. Results of the experiments

We have computed the RETs for different values of 𝛼𝑛𝑙 , 𝛼𝑙 , 𝛼𝑚 . Three scenarios were considered:

         1) An additive noise scenario with increasing non-linearity controlled by 𝛼𝑛𝑙 .
         2) A linear scenario with increasing multiplicative noise controlled by 𝛼𝑚 .
         3) A multiplicative noise scenario with increasing non-linearity controlled by 𝛼𝑛𝑙 .

In all validation cases, the pdf is ergodic and the CSM and ML estimates of the RET are obtained using model runs
of size 𝐿𝑡 = 4000 (and 400) time units corresponding to 𝑁𝑟 = 105 (104 ) time-steps 𝑑𝑡 = ∆𝑡 = 0.04. Ergodicity was
assessed by verifying the similarity of the statistical properties of independent model runs. The degree of polynomial
regressions of the conditional expectations is fixed to 𝑁𝑑 = 4 with some tests using 𝑁𝑑 = 2,8. Model runs are
started at 𝑋1 = 𝑋2 = 𝑋3 = 0.01, using 𝑁𝑠 = 30 random seeds for the noise generator. The AN integrals are
estimated in a cube with edges [−𝑈, 𝑈], 𝑈 = 10. This will obviously limit the pdf tails, but to a relatively low extent.
A discretization of 𝑁𝑝 = 200 points along every edge of the cube is used, leading to a number of 2003 cubic voxels.

5.3.1. Additive noise with increasing non-linearity

Here, wet set 𝛼𝑙 = 0. , 𝑏 = 1, 𝛼𝑚 = 0 and 𝛼𝑛𝑙 ∈ [0,1], starting with a linear model (𝛼𝑛𝑙 = 0), and then increasing
the amplitude of the non-linearity. The stochastic part of the RET vanishes since the noise is purely additive and
additionally 𝑇(𝑋1 → 𝑋3 )𝐹 = 0 (61a). The value 𝛼𝑛𝑙 = 1, reproduces the case studied by Liang [17].

Figure 1 shows the values of 𝑇(𝑋2 → 𝑋1 ) and 𝑇(𝑋1 → 𝑋2 ) computed by the AN, CSM and ML approaches as a
function of 𝛼𝑛𝑙 . The RETs increase with the strength of nonlinearity due to nonlinear cross-dependencies. In this
                                          2
                                   𝑑𝐸2 (𝑋2 |𝑋1 )
                  )
case 𝑇(𝑋2 → 𝑋1 𝐹 = −𝛼𝑛𝑙 𝐸1 [𝑋1                   ]. Despite its explicit linear dependence on 𝛼𝑛𝑙 , it increases in a
                                        𝑑𝑋   1

nonlinear way due to the modifications of the pdf as a function of 𝛼𝑛𝑙 . One obtains a good estimate with a quadratic
regression of the conditional expectation as shown below. Therefore,
                                                                      𝑐𝑜𝑣(𝑋22 ,𝑋12 )
                                        𝐸2 (𝑋22 |𝑋1 ) ≈ 𝐸2 (𝑋22 ) +                  (𝑋12 − 𝐸1 (𝑋12 ))                             (62a)
                                                                       𝑣𝑎𝑟(𝑋12 )

where 𝑐𝑜𝑣 and 𝑣𝑎𝑟 stand for covariance and variance, respectively. Taking the derivative, one gets:
                                                       2
                                                 𝑑𝐸2 (𝑋2 |𝑋1 )           𝑐𝑜𝑣(𝑋22 ,𝑋12 )
                                                     𝑑𝑋1
                                                                 = 2𝑋1    𝑣𝑎𝑟(𝑋12 )
                                                                                       ,                                           (62b)

leading to an estimate of the specific RET:
                                                                         2
                                                                   𝑑𝐸2 (𝑋2 |𝑋1 )                 𝑐𝑜𝑣(𝑋22 ,𝑋12 ) 2
                                          ℱ1,2,𝐹 (𝑋1 ) = −𝛼𝑛𝑙 𝑋1         𝑑𝑋1
                                                                                       = −2𝛼𝑛𝑙    𝑣𝑎𝑟(𝑋12 )
                                                                                                               𝑋1                   (63)

varying with 𝑋1 as expected in nonlinear systems. Its average is

                                                                                                                                     24
                                                                                  𝑐𝑜𝑣(𝑋22 ,𝑋12 )
                                      𝑇(𝑋2 → 𝑋1 )𝐹 = 𝐸1 [ℱ1,2,𝐹 (𝑋1 )] ≈ −2𝛼𝑛𝑙     𝑣𝑎𝑟(𝑋12 )
                                                                                                 𝐸1 (𝑋12 )       (64)

For instance for 𝛼𝑛𝑙 = 1, we have, 𝑐𝑜𝑣(𝑋22 , 𝑋12 ) = −0.038, 𝑣𝑎𝑟(𝑋12 ) = 0.348, 𝐸1 (𝑋12 ) = 0.402, the computation
provides 𝑇(𝑋2 → 𝑋1 )𝐹 ≈0.088, which is fairly close to 𝑇(𝑋2 → 𝑋1 )𝐹,𝐴𝑁 = 0.094, which was obtained
independently by [15] .

Figure. 1 show the AN value of RETs (dotted line) and the average (solid lines) and standard deviation (error bar
length) over the 30 seeds of the RETs obtained by CSM and ML. The AN and CSM values are relatively close to each
other, with a negative slight bias of CSM, lower than 7-10%, valid both for the long time series (Fig. 1a) (𝐿𝑡 =
4000, 𝑁𝑟 = 105 ) and the short time series (Fig. 1b) (𝐿𝑡 = 400, 𝑁𝑟 = 104 ). The difference is due to estimation errors
both in the AN, due to the specific choices of the interval size 𝑈,and its resolution 𝑁𝑝 and in CSM due to the
regression accuracy. By comparing Fig. 1a-b, we see that the standard deviation of RETs is approximately
proportional to 1/√𝑁𝑟 , being 5% of the RET by AN for the long time series. Therefore to achieve an acceptable error
of less than 20%, we must have 𝐿𝑡 > 160. The ML estimates of 𝑇(𝑋1 → 𝑋2 ) and 𝑇(𝑋2 → 𝑋1 ) are close to zero for
the tested nonlinearity weights, which shows that the ML estimates are not able to detect RETs with those nonlinear
terms.




Figure 1. RETs for the scenario 𝛼𝑙 = 0. , 𝑏 = 1, 𝛼𝑚 = 0, with 𝛼𝑛𝑙 ∈ [0,1] of the potential model. Mean over 30 noise
seeds of 𝑇(𝑋1 → 𝑋2 ) (red curves) and 𝑇(𝑋2 → 𝑋1 ) (black curves) by the AN (dotted line, squares), CSM (solid
line,circles) and ML (solid line, triangles). Standard deviations over the ensemble of seeds are marked by the error
bar length. Pannels a) and b) refer respectively to period (time series) length of 4000 and 400 time units. Note that
curves for 𝑇(𝑋1 → 𝑋2 ) and 𝑇(𝑋2 → 𝑋1 ) for the ML approach superpose to each other.

5.3.2. Linear system with increasing multiplicative noise

Here we set 𝛼𝑛𝑙 = 0, 𝛼𝑙 = 0.5, 𝑏 = 1 and 𝛼𝑚 ∈ [0,1], starting with a situation of a pure additive noise (𝛼𝑚 = 0).
Then, the multiplicative noise strength increases, producing non-Gaussian statistics, despite the fact the system is
linear [34]

Thanks to the model symmetrization when 𝛼𝑛𝑙 = 0, all the RETs are equal, and thus we only evaluate 𝑇(𝑋2 → 𝑋1 )𝐹
and 𝑇(𝑋2 → 𝑋1 )𝑔 for the diverse approaches (AN,CSM,ML). Note that in this scenario, both the deterministic term

                                                                                                                   25
and noise scales as ‖𝐗‖, leading to extreme behaviors when 𝐗 is large. In fact, for the range 𝛼𝑚 ∈ [0,1], the
standard-deviation of 𝑋1 increases from 0.92 to 1.94 and its kurtosis-excess increases from 0.04 to 34, which is an
extreme scenario. This is easily verified through the pdf formula (53). For instance for 𝛼𝑚 = 0.25, the pdf scales as
𝜌̂𝐗 ~𝑉 −9 while for 𝛼𝑚 = 1, the pdf scales as 𝜌̂𝐗 ~𝑉 −3, producing a fat-tailled distribution.

In this case, the RET is approximated using a simple linear regression:
                                                           𝑑𝐸2 (𝑋2 |𝑋1 )          𝑐𝑜𝑣(𝑋 ,𝑋 )
                                                                                      1 2
                                 𝑇(𝑋2 → 𝑋1 )𝐹 = 𝛼𝑙 𝐸1 [           𝑑𝑋1
                                                                           ] ≈ 𝛼𝑙 𝑣𝑎𝑟(𝑋 2 ) = 𝛼𝑙 𝑐𝑜𝑟(𝑋1 , 𝑋2 )           (65)
                                                                                          1


For all the range of 𝛼𝑚 , we have the correlation value 𝑐𝑜𝑟(𝑋1 , 𝑋2 ) ≈ 0.66 and thus 𝑇(𝑋2 → 𝑋1 )𝐹 ≈ 0.33 = 0.66 ×
0.5, which perfectly agrees with the AN and CSM-based RET estimations shown in Fig. 2 through their average over
noise seed values.

The ML estimation, also shown in Fig. 2, is able to detect the deterministic RET, though affected by a bias, which
becomes large for highly leptokurtic (high kurtosis) probability distributions, associated with high 𝛼𝑚 .

The stochastic RET is:
                                  𝛼                   𝑑 2 𝐸2 (𝑋22 |𝑋1 )                           𝑑 2 𝐸2 (𝑋2 |𝑋1 )
               𝑇(𝑋2 → 𝑋1 )𝑔 = 4𝑚 𝐸2 {(1 + 𝛼𝑙2 )            𝑑𝑋1 2        − 2𝛼𝑙 [𝑋1 + 𝐸3 (𝑋3 |𝑋1 )]      𝑑𝑋12
                                                                                                                   }     (66)

For symmetry reasons all the cross statistics are symmetric and thus 𝐸1 (𝑋1 |𝑋2 ) and 𝐸2 (𝑋2 |𝑋1 ) must have the same
                                              𝑑 2 𝐸2 (𝑋2 |𝑋1 )
linear functional dependency, leading to           𝑑𝑋12
                                                               = 0. Moreover, by using a quadratic regression for 𝑋22 , we get
𝑑 2 𝐸2 (𝑋2 |𝑋1 )
                 ≈ 2 𝑐𝑜𝑟(𝑋12 , 𝑋22 ) ≈ 0.52 in all the range. Therefore, one obtains:
     𝑑𝑋12

                                                              𝛼
                                          𝑇(𝑋2 → 𝑋1 )𝑔 = 2𝑚 (1 + 𝛼𝑙2 )𝑐𝑜𝑟(𝑋12 , 𝑋22 ) ≈ 𝛼𝑚 × 0.325                       (67)

Figure 2 also shows the values of the S-RET 𝑇(𝑋2 → 𝑋1 )𝑔 , i.e. the stochastic RET, obtained with the AN and CSM
approaches. Both approaches agree quite well for 𝛼𝑚 ≤ 0.6, after which, the excess-kurtosis is larger than 3 and
the AN value becomes highly biased if too short interval bounds are used. Here the interval [−10,10] was shown
to be sufficient for accounting for the pdf tails. The CSM value grows almost linearly with 𝛼𝑚 in agreement with
(67). This suggests that the CSM estimation can even provide a more accurate and outlier-resistant estimate than
the AN method in certain circumstances. The standard deviations of RETs obtained by CSM grows with the intensity
𝛼𝑚 of the multiplicative noise and scale approximately as 1/√𝑁𝑟 (as in scenario of Sec. 5.3.1) by comparing the
values for the long period (Fig. 2a) and short period (Fig. 2b).

Another interesting aspect is that, in certain extreme noise conditions, the stochastic RET can be larger than the
deterministic RET (e.g. 𝛼𝑚 > 1), which means that information flow occurs mostly trough the noise than through
the deterministic dynamics.




                                                                                                                           26
Figure 2. RETs for the scenario 𝛼𝑛𝑙 = 0, 𝛼𝑙 = 0.5, 𝑏 = 1 and 𝛼𝑚 ∈ [0,1] of the potential model. Mean over 30 noise
seeds of 𝑇(𝑋2 → 𝑋1 )𝐹 by CSM (red curve, squares), by ML (green solid, diamonds) and of 𝑇(𝑋2 → 𝑋1 )𝑔 by CSM
(magenta solid, triangles).Values of 𝑇(𝑋2 → 𝑋1 )𝐹 by AN (black dotted) and 𝑇(𝑋2 → 𝑋1 )𝑔 by AN (blue dotted).
Standard deviations over the ensemble of seeds are marked by the error bar length. Pannels a) and b) refer
respectively to period (time series) length of 4000 and 400 time units.

5.3.3. Multiplicative noise with increasing nonlinearity

Here we set 𝛼𝑙 = 0.5, 𝛼𝑚 = 0.3, 𝑏 = 1 and 𝛼𝑛𝑙 ∈ [0,1], simulating a mixture of non-linearity and multiplicative
noise. The symmetry between variables is broken through a non-vanishing 𝛼𝑛𝑙 . Moreover, according to (51a-c), the
deterministic terms are scaled as ‖𝐗‖3 whereas the noise scales as ‖𝐗‖2 , and therefore that contributes for smaller
kurtosis of the system variables than in the previous scenario.

As concerns 𝑇(𝑋2 → 𝑋1 )𝐹 (57a), and using the linear regression for 𝐸2 (𝑋2 |𝑋1 ) and the quadratic regression for
𝐸2 (𝑋22 |𝑋1 ), one gets:
                                                        𝑐𝑜𝑣(𝑋22 ,𝑋12 )                  𝑐𝑜𝑣(𝑋 ,𝑋 )
                              𝑇(𝑋2 → 𝑋1 )𝐹 ≈ −2𝛼𝑛𝑙       𝑣𝑎𝑟(𝑋12 )
                                                                         𝐸1 (𝑋12 ) + 𝛼𝑙 𝑣𝑎𝑟(𝑋
                                                                                            1 2
                                                                                              )
                                                                                                               (68)
                                                                                              1


Figure 3 shows the values of 𝑇(𝑋2 → 𝑋1 )𝐹 using the AN and CSM approaches, using the regression degree 𝑁𝑑 = 8,
as well as the minimal regression approach given by (68) (acronym MN) and the ML method. Figure 3 shows that all
AN,CSM and MN estimations are quite close to each other. The ML approach is reasonable only for small values of
the nonlinearity (small 𝛼𝑛𝑙 ), i.e. weak nonlinearity.

The specific RET is not constant, as expected from nonlinear systems and has higher amplitude for larger values of
𝑋12 according to:
                                                       𝑐𝑜𝑣(𝑋 2 ,𝑋 2 )         𝑐𝑜𝑣(𝑋 ,𝑋 )
                              ℱ1,2,𝐹 (𝑋1 ) ≈ −2𝛼𝑛𝑙 𝑋12 𝑣𝑎𝑟(𝑋
                                                           2 1
                                                             2
                                                                        1 2
                                                               + 𝛼𝑙 𝑣𝑎𝑟(𝑋 )
                                                                                                               (69)
                                                                1)                  1


The minimal regression of 𝑇(𝑋2 → 𝑋1 )𝑔 (59b), leads to
                                      𝛼𝑚                                            𝑐𝑜𝑣(𝑋22 ,𝑋12 )
                     𝑇(𝑋2 → 𝑋1 )𝑔 ≈      {𝛼𝑛𝑙 [𝐸1 (𝑋12 ) + 𝐸3 (𝑋32 )] + (1 + 𝛼𝑙2 )}                            (70)
                                       2                                             𝑣𝑎𝑟(𝑋12 )

                                                                                                                 27
Figure 3 also shows the values of 𝑇(𝑋2 → 𝑋1 )𝑔 (Fig3a: long period, Fig 3b: short period), obtained with the AN, CSM
and MN approximations. The AN and CSM agree quite well, with quite short standard deviation over noise-
generated samples, as seen in error bars of Fig.3a,b, while MN presents lower values of RET. Despite this bias, the
dependence on 𝛼𝑛𝑙 is well detected by the minimal regression of MN. The standard deviation of sampled RETs by
CSM are also approximately scaled as 1/√𝑁𝑟 as in previous scenarios.

The graphics for 𝑇(𝑋1 → 𝑋2 ) and 𝑇(𝑋1 → 𝑋3 ) are similar to those of Fig. 3 (not shown).




Figure 3. RETs for the scenario 𝛼𝑙 = 0.5, 𝛼𝑚 = 0.3, 𝑏 = 1 and 𝛼𝑛𝑙 ∈ [0,1] of the potential model. Mean over 30
noise seeds of 𝑇(𝑋2 → 𝑋1 )𝐹 by CSM (red, solid), by ML (gree, solid), by MN (deep blue, solid) and of 𝑇(𝑋2 → 𝑋1 )𝑔 by
CSM (magenta, solid) and by MN (purple, solid). Values of 𝑇(𝑋2 → 𝑋1 )𝐹 by AN (black, dotted) and 𝑇(𝑋2 → 𝑋1 )𝑔 by
AN (blue, dotted). Standard deviations over the ensemble of seeds are marked by the error bar length. Pannels a)
and b) refer respectively to period (time series) length of 4000 and 400 time units.



6. Lorenz Model

In this section we compute the RETs without the explicit knowledge of the model pdf as in the previous section. For
that extension of the analysis to more classical models, the Lorenz’s 1963 model [26] driven by a noise term, is used
[35]. The Lorenz model and its extensions have been used in numerous theoretical and methodological studies,
such as predictability [36,37], data assimilation [38], bifurcation theory [39], ergodic theory [40], thermodynamics
[41], signal processing [42] among many others. The model is a minimal Galerkin truncation of the Boussinesq
equations of the two-dimensional fluid convection, with heating at the bottom and cooling at the top, where the
model variables are 𝑋̂1, proportional to the rate of convection and 𝑋̂2 , 𝑋̂3 which are proportional to the temperature
variation in the horizontal and vertical directions, respectively. The usual parameter values: 𝜎 = 10 (Prandtl
                                                            8
number), 𝑅𝑎 = 27 (rescaled Rayleigh number) and 𝛽 = 3 (aspect ratio), are used. The model exhibits a chaotic
attractor and an ergodic pdf with expectations 𝜇1 = 𝜇2 = 0, 𝜇3 ≈ 22.61 and standard deviations 𝜎1 ≈ 7.74, 𝜎2 ≈
8.76 and 𝜎3 ≈ 8.35 for 𝑋̂1 , 𝑋̂2 , 𝑋̂3 , respectively. The model is slightly transformed to describe the evolution of the
                              𝑋̂1 −𝜇𝑖
standardized variables 𝑋𝑖 ≡      𝜎𝑖
                                      , 𝑖 = 1,2,3. We run the stochastic Lorenz models through a Predictor-Corrector

                                                                                                                      28
scheme (see Appendix B2), and setting 𝜇𝑖 , 𝜎𝑖 . 𝑖 = 1,2,3 to the above values in all experiments. The model equations
are:
                                      𝜎𝜎
                             𝑑𝑋1 = [( 𝜎 2 ) 𝑋2 − 𝜎𝑋1 ] 𝑑𝑡 + 𝐵1 𝑑𝑊1                                                               (71a)
                                          1

                                      𝜎                                𝜎 𝜎
                             𝑑𝑋2 = {[𝜎1 (𝑅𝑎 − 𝜇3 )] 𝑋1 − ( 𝜎1 3 ) 𝑋1 𝑋3 − 𝑋2 } 𝑑𝑡 + 𝐵2 𝑑𝑊2                                       (71b)
                                         2                                2

                                         𝜎 𝜎                              𝛽𝜇
                             𝑑𝑋3 = [( 𝜎1 2 ) 𝑋1 𝑋2 − 𝛽𝑋3 − ( 𝜎 3 )] 𝑑𝑡 + 𝐵3 𝑑𝑊3 ,                                                (71c)
                                             3                                3


where we set equal noise coefficients:

                                     𝐵1 = 𝐵2 = 𝐵3 = [𝑏 2 + 𝛼𝑚 exp(−𝑋12 )]1/2 = 𝑔1/2 ,                                            (71d)

with 𝑏 2 ≥ 0 and 𝛼𝑚 ≥ 0 being parameters associated with the amplitudes of the additive and multiplicative noises
respectively. The noise-free model is set to 𝑏 = 𝛼𝑚 = 0. The noises follow the law: 𝑑𝑊𝑖 ~√𝑑𝑡 𝑁(0, 1). The model
converges to pullback attractors whose properties depend on the parameter values [34].

6.1. Rates of entropy transfer and budget of entropy

The deterministic terms in (71a-c) are composed of polynomials, satisfying the separability assumption for the
application of CSM formulas (37a,b). The deterministic and stochastic RETs are easily computed as:
                                                 𝜎𝜎2    𝑑𝐸 (𝑋 |𝑋 )
                             𝑇(𝑋2 → 𝑋1 )𝐹 =          𝐸 [ 2 2 1 ];                                                                (72a)
                                                  𝜎1 1      𝑑𝑋1

                             𝑇(𝑋3 → 𝑋1 )𝐹 = 0;                                                                                   (72b)

                                                          𝜎                          𝜎 𝜎                    𝑑𝐸1 (𝑋1 |𝑋2 )
                             𝑇(𝑋1 → 𝑋2 )𝐹 = 𝐸2 [[𝜎1 (𝑅𝑎 − 𝜇3 ) − ( 𝜎1 3 ) 𝐸3 (𝑋3 |𝑋2 )]                         𝑑𝑋2
                                                                                                                            ];   (72c)
                                                           2                           2


                                                 𝛼𝑚     𝑑 2 𝐸 (exp(−𝑋12 )|𝑋2 )
                             𝑇(𝑋1 → 𝑋2 )𝑔 =         𝐸2 [ 1                    ];                                                 (72d)
                                                  2              𝑑𝑋22

                                                         𝜎 𝜎                           𝑑𝐸3 (𝑋3 |𝑋2 )
                             𝑇(𝑋3 → 𝑋2 )𝐹 = − ( 𝜎1 3 ) 𝐸2 [𝐸1 (𝑋1 |𝑋2 )                      𝑑𝑋2
                                                                                                       ];                        (72e)
                                                          2

                                                 𝜎 𝜎                              𝑑𝐸1 (𝑋1 |𝑋3 )
                             𝑇(𝑋1 → 𝑋3 )𝐹 = 𝜎1 2 𝐸3 [𝐸2 (𝑋2 |𝑋3 )                                 ];                             (72f)
                                                     3                                 𝑑𝑋3

                                                 𝛼             𝑑 2 𝐸1 (exp(−𝑋12 )|𝑋3 )
                             𝑇(𝑋1 → 𝑋3 )𝑔 = 2𝑚 𝐸3 [                      𝑑𝑋32
                                                                                      ]:                                         (72g)

                                                 𝜎 𝜎                              𝑑𝐸2 (𝑋2 |𝑋3 )
                             𝑇(𝑋2 → 𝑋3 )𝐹 = 𝜎1 2 𝐸3 [𝐸1 (𝑋1 |𝑋3 )                     𝑑𝑋3
                                                                                                  ];                             (72h)
                                                     3


                             𝑇(𝑋2 → 𝑋1 )𝑔 = 𝑇(𝑋3 → 𝑋1 )𝑔 = 𝑇(𝑋3 → 𝑋2 )𝑔 = 𝑇(𝑋2 → 𝑋3 )𝑔 = 0                                       (72i)

Since the normalization is an affine variable change, the RETs are the same as those from the non-normalized
variables according to theorem 6 (43b).

In what concerns the entropy budget, the terms of (20) can be easily estimated using the CSM formulas of Secs. 2
and 3. The generic entropy balance for the three variables is:
        𝜕𝐹𝑖                                               𝑑𝐻𝑋     𝑑𝐻𝑋       𝑑𝐻𝑋𝑖
     𝐸(     ) + 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹,𝑠𝑖𝑛𝑔 + 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹,𝑠𝑦𝑛 + ( 𝑖 ) + ( 𝑖 )    =      = 0, 𝑖 = 1,2,3                                   (73)
        𝜕𝑋𝑖                                                𝑑𝑡 𝑔,𝑎  𝑑𝑡 𝑔,𝑚    𝑑𝑡



                                                                                                                                   29
where the first term is the self-determinist generation (SEG), the second term is the sum of single RETs (42a) the
third one is the synergetic RET (42b), the fourth and fifth terms are the additive-noise and multiplicative-noise terms
respectively, which have the following expressions:
                                       𝑑𝐻𝑋                     𝛼                     𝑏2           𝑑 log 𝜌    2
                                      ( 𝑑𝑡 𝑖 )         = 𝐸 [( 2𝑚 exp(−𝑋12 ) + 2 ) ( 𝑑𝑋 𝑖) ]                                                (74a)
                                                 𝑔,𝑎                                                     𝑖

                                                                                              2
                                       𝑑𝐻𝑋                 𝛼                      𝑑 2 𝐸(exp(−𝑋1 )|𝑋𝑖 )
                                     ( 𝑑𝑡 𝑖 )          = − 2𝑚 (1 + 𝛿𝑖,1 )𝐸 [                      𝑑𝑋𝑖2
                                                                                                                   ]                       (74b)
                                                 𝑔,𝑚

where 𝛿𝑖,1 is the Kronecker symbol. For the Lorenz system, we still have:
                                         𝜕𝐹                        𝜕𝐹                𝜕𝐹
                                      𝐸 (𝜕𝑋1 ) = −𝜎; 𝐸 (𝜕𝑋2 ) = −1, 𝐸 (𝜕𝑋3 ) = −𝛽                                                          (75a)
                                             1                      2                     3


                                                                                        𝜎𝜎               𝑑𝐸(𝑋2 |𝑋1 )
                                     𝑇(𝑋~1 → 𝑋1 )𝐹 = 𝑇(𝑋2,3 → 𝑋1 )𝐹 = 𝜎 2 𝐸 [                                𝑑𝑋1
                                                                                                                       ]                   (75b)
                                                                                              1


                                          𝜎1                𝑑𝐸(𝑋1 |𝑋2 )     𝜎 𝜎         𝑑𝐸(𝑋1 𝑋3 |𝑋2 )
    𝑇(𝑋~2 → 𝑋2 )𝐹 = 𝑇(𝑋1,3 → 𝑋2 )𝐹 =
                                          𝜎2
                                             (𝑅𝑎 − 𝜇3 )𝐸2 [
                                                               𝑑𝑋2
                                                                       ] − ( 𝜎1 3 ) 𝐸 [     𝑑𝑋2
                                                                                                      ]                                    (75c)
                                                                               2


                                                                                              𝜎 𝜎            𝑑𝐸(𝑋1 𝑋2 |𝑋3 )
                                     𝑇(𝑋~3 → 𝑋3 )𝐹 = 𝑇(𝑋1,2 → 𝑋3 )𝐹 = ( 𝜎1 2 ) 𝐸 [                                 𝑑𝑋3
                                                                                                                              ]            (75d)
                                                                                                  3


We must note that, in the Lorenz model, there are two quadratic terms responsible for the nonlinearity: 𝑋1 𝑋3 in
𝑑𝑋2                   𝑑𝑋
    (71b) and 𝑋1 𝑋2 in 3 (71c), yielding synergetic RETs in 𝑇(𝑋1,3 → 𝑋2 )𝐹 and 𝑇(𝑋1,2 → 𝑋3 )𝐹 :
 𝑑𝑡                    𝑑𝑡

                                                                          𝜎 𝜎        𝑑 𝑐𝑜𝑣(𝑋1 ,𝑋3 |𝑋2 )
                                      𝑇(𝑋1,3 → 𝑋2 )𝐹,𝑠𝑦𝑛 = − ( 𝜎1 3 ) 𝐸 [                  𝑑𝑋2
                                                                                                        ]                                  (76a)
                                                                              2

                                                                        𝜎 𝜎       𝑑 𝑐𝑜𝑣(𝑋1 ,𝑋2 |𝑋3 )
                                     𝑇(𝑋1,2 → 𝑋3 )𝐹,𝑠𝑦𝑛 = ( 1 2 ) 𝐸 [                                ]                                     (76b)
                                                                         𝜎3             𝑑𝑋3

These terms are relevant for the entropy budget as we will show below and are also important in the turbulent
chaotic regime simulated by the Lorenz model. The conditional covariance terms 𝑐𝑜𝑣(𝑋1 , 𝑋3 |𝑋2 ) and
𝑐𝑜𝑣(𝑋1 , 𝑋2 |𝑋3 ) are essentially the vertical and horizontal heat fluxes and the derivatives in (76a), (76b) are their
parametrizations with respect to temperature gradients. Therefore, the synergetic terms (76a), (76b) are simply
associated with the horizontal and vertical turbulent heat flux diffusivities as a function of temperature gradients.
This example suggests that formulas provided by the CSM can be good tools to identify physical factors influencing
the entropy budget and the inferred causality.
                                                                                                                              𝜎𝜎      𝑑𝑋
All the remaining terms in the RETs come from the cross-dependent linear terms in equations: ( 𝜎 2 ) 𝑋2 in 𝑑𝑡1 (71a)
                                                                                                                                  1
     𝜎                   𝑑𝑋
and [𝜎1 (𝑅𝑎 − 𝜇3 )] 𝑋1 in 𝑑𝑡2 (71c), which are detected by the ML approach.
      2


6.2. Setup of experiments

The RET values are calculated by the AN, CSM, MF and ML approaches for three situations: noise free (𝑏 = 𝛼𝑚 =
0); additive noise (𝑏 = 1. , 𝛼𝑚 = 0) and multiplicative noise (𝑏 = 0, 𝛼𝑚 = 1. ). The variance of different variables
is 1 for the free-noise case and within the interval [0.9,1.1] for the noisy scenarios which are particularly extreme
because the signal to noise ratio is small, and the noise can considerably affect the S-RETs.

The numerical 3D integration, used in AN is made over the cube [−𝐿, 𝐿]3 , 𝐿 = 4., regularly discretized into cubic
voxels of side ∆= 𝐿/100. Two integration periods are tested, after a relaxation of 100 time units and with lengths

                                                                                                                                             30
𝐿𝑡 = 400 time units (long run), and 𝐿𝑡 = 80 time units (short run), simulating real situations of low data availability.
Used time-steps are of size 𝑑𝑡 = ∆𝑡 = 0.02. An extra time-step 𝑑𝑡 = ∆𝑡 = 0.01 is used in the MF where time-
derivatives are computed by forward differences. The sampling mean and variability of RETs are assessed by
generating 𝑁𝑠 = 30 independent integration realizations by varying the seed of the noise generator and initial
condition.

The ergodic pdf of the model is estimated by a kernel-based approach, using the probabilities 𝑃(𝐗) at every state-
space voxel centroid 𝐗 ∈ [−𝐿, 𝐿]3 estimated as:
                                         1   𝑁
                                           𝑟
                                𝑃(𝐗) = 𝑍 ∑𝑡=1 exp[−𝑑2 ] 𝟏[𝑑 ≤ √3∆ ]                ; 𝑑2 = ‖𝐗 − 𝐗(𝑡)‖2                   (77)

The instantaneous state 𝐗(𝑡) has an effect only at points within a Cartesian distance √3∆, which is set by using the
indicator function 𝟏 (1 or 0 if the condition is true or false respectively). 𝑍 is the normalizing constant. Accuracy
tests were performed, by comparing probabilistic and temporal averages of powers (up to degree 4) of the variables.
After the 𝑃(𝐗) computation, the AN-based RETs are assessed at the voxel centroids.

In the CSM approach, we use polynomial regressions of degree 𝑁𝑑 = 10 to obtain accurate representations of the
conditional expectations and their derivatives, though lower degrees are sufficient for certain terms. This will be
further discussed below in the validation section.

In the MF approach, the deterministic terms and diffusivities 𝐹𝑖 , 𝑔𝑖,𝑖 are estimated independently and used
                                                                              𝑑𝑋
afterwards in the CSM formulas. The fitting of time-derivatives 𝑑𝑡𝑖 is performed using the class of 10 mixed
monomials           (base-functions)            Ψ𝑙 (𝐗)       (47b)    of   maximum       degree      2,    i.e.    {Ψ𝑙 (𝐗)} =
                    2                    2            2
{1, 𝑋1 , 𝑋2 , 𝑋3 , 𝑋1 , 𝑋1 𝑋2 , 𝑋1 𝑋3 , 𝑋2 , 𝑋2 𝑋3 , 𝑋3 } to which the model (71a-c) belongs to, allowing to get an unbiased
fitting. For the fitting of noise, we chose the constrained class {Φ𝑙 (𝐗)} = {1, exp(−𝑋12 )}. The model fitted
coefficients are then used to compute D-RETs and S-RETs, using the sums over the basis functions (49a,b) and
(50a,b).

6.3. Minimal CSM results (MN)

We provide here approximations of the D-RETs, by doing minimal (MN) regressions appearing in the CSM formulas
for the noise-free situation. The conditional expectations, valid for the standardized variables are approximated by:

                                       𝐸2 (𝑋2 |𝑋1 ) ≈ 𝑐𝑜𝑟(𝑋1 , 𝑋2 )𝑋1 = 0.88 𝑋1                                        (78a)
                                                        𝑐𝑜𝑟(𝑋3 ,𝑋12 )
                                       𝐸3 (𝑋3 |𝑋1 ) ≈                   (𝑋12 − 1) = 0.563(𝑋22 − 1)                     (78b)
                                                         𝑠𝑡𝑑(𝑋12 )

                                        𝐸1 (𝑋1 |𝑋2 ) ≈ 𝑐𝑜𝑟(𝑋1 , 𝑋2 )𝑋2 = 0.88 𝑋2                                       (78c)
                                                        𝑐𝑜𝑟(𝑋3 ,𝑋22 )
                                       𝐸3 (𝑋3 |𝑋2 ) ≈                   (𝑋22 − 1) = 0.068(𝑋22 − 1)                     (78d)
                                                         𝑠𝑡𝑑(𝑋22 )

                                       𝐸1 (𝑋1 |𝑋3 ) = 0                                                                (78e)

                                        𝐸1 (𝑋2 |𝑋3 ) = 0                                                               (78f)

Those regressions are quite obvious from Fig. 4 showing the two-dimensional pdfs 𝜌1,2 (𝑋1 , 𝑋2 ), 𝜌1,3 (𝑋1 , 𝑋3 ), and
𝜌2,3 (𝑋2 , 𝑋3 ). In fact, the linear correlation 𝑐𝑜𝑟(𝑋1 , 𝑋2 ) > 0 appears from the straight positive slope of 𝜌1,2 contours
(Fig. 4a) whereas the positive quadratic correlations 𝑐𝑜𝑟(𝑋3 , 𝑋12 ) and 𝑐𝑜𝑟(𝑋3 , 𝑋22 ) come from the convex parabolic
shapes of 𝜌1,3 (Fig. 4b) and 𝜌2,3 (Fig. 4c) respectively. The pdfs were estimated by the kernel-based method, with a
run of 10000 time units.

                                                                                                                          31
By substituting the minimal regressions into the D-RET formulas, we get:
                                       𝜎𝜎
                     𝑇(𝑋2 → 𝑋1 )𝐹 ≈ 𝜎 2 × 0.88 = 9.96                                                                   (79a)
                                         1


                           𝜎                 𝜎 𝜎                 𝑑𝐸1 (𝑋1 |𝑋2 )    𝜎1
    𝑇(𝑋1 → 𝑋2 )𝐹 = 𝐸2 [[ 1 (𝑅𝑎 − 𝜇3 ) − ( 1 3 ) 𝐸3 (𝑋3 |𝑋2 )]                ]≈      (𝑅𝑎 − 𝜇3 ) × 0.88 = 3.88           (79b)
                           𝜎2                 𝜎2                     𝑑𝑋2          𝜎2

                          𝜎 𝜎                    𝑑𝐸3 (𝑋3 |𝑋2 )      𝜎 𝜎
    𝑇(𝑋3 → 𝑋2 )𝐹 = − ( 𝜎1 3 ) 𝐸2 [𝐸1 (𝑋1 |𝑋2 )       𝑑𝑋2
                                                             ] ≈ − ( 𝜎1 3 ) 𝐸(0.88𝑋2 × 2.× 0.068𝑋2 ) = −0.883 (79c)
                            2                                         2


The values of 𝑇(𝑋1 → 𝑋2 )𝑔 and 𝑇(𝑋1 → 𝑋3 )𝑔 calls for the Taylor expansion of exp(−𝑋12 ) and 𝑋3 regression of at
least 4th degree. All the remaining single D-RETs are zero.




Figure 4. Two-dimensional pdfs 𝜌1,2 (𝑋1 , 𝑋2 ) (a) 𝜌1,3 (𝑋1 , 𝑋3 ) (b) and 𝜌2,3 (𝑋2 , 𝑋3 ) (c) of the standardized Lorenz
model (unit variance of each variable) (71a-c) in the noise-free scenario in the domain [−4,4]2 .

6.4. Validation of the RET estimation

Table 2 presents the overall results of the different deterministic and stochastic single RETs, computed with the two
period lengths (𝐿𝑡 = 400 and 𝐿𝑡 = 80 with ∆𝑡 = 0.02 and 𝐿𝑡 = 80 with ∆𝑡 = 0.01) for the different scenarios:
noise free, additive noise, and multiplicative noise and using the four tested approaches: AN, CSM, MF and ML. The
sample averages and sample standard deviations of RETs were computed from an ensemble of 30 independent
realizations of model runs. Polynomials of order 10 have been applied for the nonlinear regressions in CSM and MF.
Model fitting uses polynomials of second order. The ensemble average AN values obtained with the long run are
taken as reference values (in bold in Table 2). The sources of estimation errors are discussed in Sec. 4 and
summarized in Table 1.

From the analysis of the table 2, the main conclusions about the RETs estimations are:

    1) The deterministic RETs obtained by minimal CSM, i.e. MN, compare quite well with the AN-based values
       showing that relatively simple regressions can recover the RETs. The biases are associated to the
       representation of the conditional expectations by polynomials of very low order.
    2) There is a good agreement between the AN and CSM estimations with biases ranging within 1-5%, for both
       run lengths and noise scenarios. The CSM variability, measured by the standard deviation among samples
                                                                                    1
        range within 1-14% for the long-runs being roughly proportional to                . (inverse of the root square of the
                                                                                   √𝐿 𝑡
        run length), i.e. ~2.2 larger in the short-run samples. The CSM variability is in most cases less than the AN
        variability, justifying the robustness of CSM.

                                                                                                                           32
    3) The     MF     estimations    have      comparable       biases   to  those       of    CSM,     except    in
       𝑇(𝑋2 → 𝑋1 )𝐹 . That bias in MF can be decreased by taking smaller time-steps (see comparison between
       dt=0.02 and 0.01). The sampling standard deviation of MF ranges within 2-10% in the long runs and 4-25%
       in the short runs, being generally larger than that of CSM due to model fitting errors and being also roughly
                           1
        proportional to          . It shows that even with very short time series without the knowledge of model
                          √𝐿 𝑡
       equations, it is possible to obtain relatively accurate causality diagnostics.
    4) In what concerns the ML values, 𝑇(𝑋2 → 𝑋1 )𝐹 agrees with those from AN, due to the absence of nonlinear
       terms in (71a). All the remaining ML values are close to zero, except 𝑇(𝑋1 → 𝑋2 )𝐹 because the product
            𝜎 𝜎
        − ( 𝜎1 3 ) 𝑋1 𝑋3 in (71b) correlates with −𝑋1 , leading to a negative (highly biased) D-RET (see Table 2). The
              2
       zero ML values agree with AN in the cases 𝑇(𝑋1 → 𝑋3 )𝐹 , 𝑇(𝑋2 → 𝑋3 )𝐹 because of two coincidences: the
       absence of cross-linear terms in the equation governing 𝑋3 (71c) and the symmetry of pdfs 𝜌1,3 (𝑋1 , 𝑋3 ) and
       𝜌2,3 (𝑋2 , 𝑋3 ) (see Fig. 4).
    5) The AN values computed with short runs exhibit high variability (sampling standard deviation), reaching
       twice to three times larger than that of CSM, especially due the inaccuracy of estimated pdfs. Therefore, ,
       the time-series length and model dimension are severe limitations to the applicability of AN.
    6) The deterministic RETs (D-RETs), which are mostly associated to nonlinear terms in
       𝑇(𝑋1 → 𝑋2 )𝐹 , 𝑇(𝑋3 → 𝑋2 )𝐹 decrease in amplitude in the noisy scenarios because the nonlinear
       dependencies weaken with respect to the noise-free situation. In particular, in the additive-noise scenario,
       the model becomes closer to Ornstein-Uhlenbeck models.


The sensitivity of the CSM and MF values with respect to the degree 𝑁𝑑 of polynomial regression used in the
conditional expectations is illustrated in Fig. 5, showing the average and standard deviation (over 30 noise seeds) of
two RETs, essentially of nonlinear nature: 𝑇(𝑋1 → 𝑋2 )𝐹 , 𝑇(𝑋3 → 𝑋2 )𝐹 for the noise free and additive noise
scenarios, short run (𝐿𝑡 = 80) and dt=0.02. We conclude from the figure that the speed of convergence as Nd
grows, depends on the considered RET. For the noise-free scenario, 𝑇(𝑋1 → 𝑋2 )𝐹 stabilizes for 𝑁𝑑 ≥ 4 whereas
𝑇(𝑋3 → 𝑋2 )𝐹 stabilizes for 𝑁𝑑 ≥ 10, justifying that choice in the CSM validation. In the noisy scenario, since the pdf
is less non-Gaussian than in the noise-free situation, and non-linearity decreases, the RETs have smaller absolute
value and the convergence is faster, showing that in both RETs stabilize for 𝑁𝑑 ≥ 4. The final bias (difference with
respect to the analytical value) is still nonzero indicating other sources of errors, either from the analytical or from
the CSM and MF algorithms.

The remaining RETs converge rather quickly at 𝑁𝑑 = 2 (not shown). This makes clear that the representativness of
the conditional expectations call in some cases for higher-order polynomial regressions or eventually for more
appropriate regression functions, namely with finite L2 norms in the real domain.

The convergence speed of the polynomial regressions of the conditional expectations generally depends on the
nonlinearities of the studied model, the shape of the corresponding pdf and also of the set of basis functions (e.g.
polynomials, trigonometric functions, orthogonal eigen-functions, wavelets). Two factors weakening the
convergence of regressions are the abruptness of pdf variations along state-space, the existence of topologically
complex pdf shape and the ‘strangeness’ and fractal nature of chaotic attractors, especially if the Hausedorff
dimension is small. In the 3D noise-free Lorenz model, the Hausedorff dimension is ~2.06 [43] and the atractor
projects quite well on each of the three variables, thus leading to smooth univariate and bivariate pdfs (Fig. 4). The
strength of the Gaussian white noise forcings tends to make pdfs more, Gaussian and smoothed, leading to faster
convergence regressions as shown in Fig. 5.



                                                                                                                     33
RET              Noise Run      NA               CSM             MF                ML
                 type
                 Free 400       9.920.023       9.960.002      8.870.002        9.980.003
                       80       9.960.109       9.960.013      8.870.011        9.980.014
                       80(a)                                     9.440.009
𝑇(𝑋2 → 𝑋1 )𝐹     Add. 400       9.300.068       9.300.059      8.290.127        9.210.085
                       80       9.240.217       9.370.113      8.350.270        9.240.172
                       80(a)                                     8.890.285
                 Mult. 400      9.820.040       9.860.020      8.770.094        9.530.065
                       80       9.700.152       9.850.050      8.730.284        9.510.144
                       80(a)                                     9.360.220
                 Free 400       3.620.026       3.580.014      3.830.078        -9.180.010
                       80       3.630.098       3.570.052      3.760.168        -9.180.032
𝑇(𝑋1 → 𝑋2 )𝐹     Add. 400       2.280.115       2.240.117      2.300.205        -6.470.082
                       80       2.290.238       2.260.187      2.420.375        -6.420.185
                 Mult. 400      2.470.086       2.430.082      2.870.278        -7.310.066
                       80       2.460.234       2.450.233      2.970.573        -7.210.149
                 Noise 400      -0.760.046      -0.730.022     -0.800.022       0.00030.0005
                       80       -0.850.166      -0.720.047     -0.770.049       0.00040.002
𝑇(𝑋3 → 𝑋2 )𝐹     Add. 400       -0.550.089      -0.520.075     -0.560.078       0.0010.0022
                       80       -0.770.303      -0.570.159     -0.5970.162      0.0080.016
                 Mult. 400      -0.440.070      -0.410.057     -0.430.057       0.0010.0019
                       80       -0.580.200      -0.450.138     -0.480.143       0.0050.0087
                 Noise 400      0.030.028       0.010.035      0.0080.025       -0.0020.0036
                       80       0.0050.107      0.060.091      0.040.061        -0.0090.010
𝑇(𝑋1 → 𝑋3 )𝐹     Add. 400       0.010.039       0.0050.013     0.0030.013       -0.0030.0048
                       80       0.030.178       0.0450.053     0.0030.054       -0.0040.016
                 Mult. 400      0.020.037       0.020.023      0.020.018        -0.0050.0077
                       80       0.070.138       0.070.052      0.050.056        -0.0170.033
                 Noise 400      0.0080.028      0.0050.013     -0.0020.045      0.0030.0046
                       80       -0.020.145      0.0410.057     0.0090.094       0.010.012
𝑇(𝑋2 → 𝑋3 )𝐹     Add. 400       0.0020.053      0.0030.011     0.0010.019       -0.0030.0055
                       80       0.060.247       0.0470.059     0.0300.070       -0.0180.037
                 Mult. 400      0.0070.054      0.0070.009     0.0010.019       -0.0020.0089
                       80       -0.0070.218     2.530.051      0.020.067        -0.010.029
𝑇(𝑋1 → 𝑋2 )𝑔     Mult. 400      -0.110.010      -0.110.0068    -0.090.0059      na
                       80       -0.100.056      -0.110.018     -0.090.016       na
𝑇(𝑋1 → 𝑋3 )𝑔     Mult. 400      -0.030.012      -0.0210.002    -0.0200.0016     na
                       80       -0.060.056      -0.0180.076    -0.0150.0062     na


Table 2 Values of D-RETs and S-RETs (indicated in the first column), for the 3 scenarios (noise-free, additive and
multiplicative noise), estimated by the 4 approaches (AN, CSM, MF and ML). The values are given in the format
() where  and  are sampling average and sampling standard deviation, obtained from an ensemble 30
independent model run realizations, using runs of 400 and 80 time units (indicated in third column) and Δ𝑡 = 0.02.

                                                                                                               34
The value 80(a) refers to MF values using runs of 80 time units and Δ𝑡 = 0.01. The reference values (AN with long
run) is given in boldface type. The RET value of 𝑇(𝑋3 → 𝑋1 )𝐹 is not included since it is theoretically null.




Figure 5. Values (sample averages and standard deviations in error bars) of 𝑇(𝑋1 → 𝑋2 )𝐹 by CSM (black) and by MF
(green) and 𝑇(𝑋3 → 𝑋2 )𝐹 by CSM (red) and by MF (blue) for polynomial regressions of degrees Nd=2,4,6,8,10,14.
Soild and dotted lines refer to noise-free and additive noise scenarios respectively. The analytical value is marked at
Nd=16.

6.5. Discussion of the entropy budget

The computation of the entropy budget terms and specific contributions is important to identify the leading
dynamical mechanisms and provide key information about predictability, causality and synergies. We present in
Table 3 the different terms (rows) of the budget (73) for the three scenarios (columns) and the three variables (sub-
columns) using the CSM values based on a long run of 400 time units. As expected, the sum of terms (last row) is
very close to zero, being of the order of the sampling variability (in Table 2). The entropy budget points out the very
important role of synergetic RETs coming from the nonlinearities of the Lorenz system. In fact, while, for 𝑋1 , the
deterministic terms are linear, leading to vanishing synergetic RETs, the synergetic RETs for 𝑋2 (joint effect of 𝑋1 , 𝑋3 )
and 𝑋3 (joint effect of 𝑋1 , 𝑋2 ) are different from 0. In the case of 𝑋3 , the synergetic RET gets the total value of the
RET (Table 3). It shows, that, despite the presence of 𝑋1 and 𝑋2 in the dynamics of 𝑋3 , it is rather their joint effect,
through the product 𝑋1 𝑋2 in (71c) that contribute to the entropy change. This must partially be a result of the high
interrelation between 𝑋1 and 𝑋2 , coming from their sharp pdf (Fig. 4a) and high linear correlation (~0.88 in the noise
free situation).

The computation of single RETs (one to one entropy transfers or more appropriately, entropy generation of one
variable under the effect of another one), as well their sum, hereby denoted as 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹,𝑠𝑖𝑛𝑔 , both in the


                                                                                                                        35
Lorenz system and probably in most nonlinear and complex network systems (like the atmospheric-oceanic system)
appears to be an incomplete picture of the causality due to the effect of synergies. Therefore, the set of one-to-one
causal links, not only of the LK type but also issued from other techniques (e.g., conditional mutual information
(CMI) [44], Peter and Clark Momentary Conditional Independence (PCMCI) [45], Granger causality [2,6]) may not
reproduce the ‘full story’ about the system causality.

Moreover, the importance of synergetic terms reveals the usefulness (possibly holding on more general models), of
merging highly interrelated variables and concentrating them onto low-order spaces or mixed variables (e.g.
through principal component analysis, independent component and subspace analysis [46,47], nonlinear principal
component analysis [42] and projection pursuit [48]), followed by computation of RETs between those mixed
variables and the remaining variables.

In order to illustrate that rationale in the noise-free scenario, we consider the pair of variables (𝑋3 , 𝑋4 ) where
𝑋4 ≡ 𝑋12 − 𝐸(𝑋12 ) = 𝑋12 − 1 and the linear regression: 𝑋2 𝑋1 = 𝛼3 𝑋3 + 𝛼4 𝑋4 + 𝐸(𝑋2 𝑋1 ) + 𝜀𝑟𝑒𝑔 = −0.56𝑋3 +
1.20𝑋4 + 0.88 + 𝜀𝑟𝑒𝑔 , where the regression error 𝜀𝑟𝑒𝑔 has zero average and variance 0.14 along the attractor. The
evolution equations (71c) and (71a multiplied by 2𝑋1 ), of 𝑋3 and 𝑋4 respectively become:
    𝑑𝑋3     𝜎 𝜎                𝜎 𝜎             𝜎 𝜎             𝛽𝜇     𝜎 𝜎
        = [( 1 2 𝛼3 − 𝛽) 𝑋3 + ( 1 2 𝛼4 ) 𝑋4 + ( 1 2 𝐸(𝑋1 𝑋2 ) − 3 )] + 1 2 𝜀𝑟𝑒𝑔 ≈ −7.21𝑋3 + 9.74𝑋4              (80a)
     𝑑𝑡      𝜎3                 𝜎3              𝜎3              𝜎3     𝜎3

    𝑑𝑋4     2𝜎𝜎           2𝜎𝜎           2𝜎𝜎                  2𝜎𝜎2
        = [( 2 𝛼3 ) 𝑋3 + ( 2 𝛼4 ) 𝑋4 + ( 2 𝐸(𝑋1 𝑋2 ) − 1)] +      𝜀  ≈ −12.67𝑋3 + 7.16𝑋4                        (80b)
     𝑑𝑡      𝜎1            𝜎1            𝜎1                   𝜎1 𝑟𝑒𝑔

where the neglected terms are about 10-20 times less than the retained ones. The two-dimensional system
(80a,80b) appears as approximately linear and quasi Hamiltonian, due the near vanishing of the sum of forcing
divergences: −7.21 + 7.16~0, (i.e. the preservation of area elements with the dynamical system flow) and a nearly
                                                                                               −7.21 9.74
conserving positive-defined Hamiltonian 6.34 𝑋32 + 4.87𝑋42 − 7.18𝑋3 𝑋4 . The driving matrix [                ] of
                                                                                              −12.67 7.61
(80a,80b) has two imaginary conjugate eigenvalues ±𝑖𝜔 leading to oscillations of (𝑋3 , 𝑋4 ) with a period
         2𝜋
                      ~0.76, which is close to that of Lorenz system oscillations. The time evolution of (𝑋3 , 𝑋4 ) is
√12.67×9.74−7.21×7.61
shown in Fig. 6, in which the oscillations are evident. The system also satisfy closed boundary conditions since the
state-space speed is tangent to the axis 𝑋4 = 0, thus being the validy conditions of the presented theory (Secs. 2
and 3)




                                                                                                                   36
Figure 6. Time evolution of 𝑋3 and 𝑋4 ≡ 𝑋12 − 1 in the noise-free scenario of the Lorenz 63 system.

In what concerns the LK causality, the system (80a, 80b) is nearly linear and thus the RET formula (34), valid for
linear systems can be applied leading to the approximation:
                                                        𝑐𝑜𝑣(𝑋 ,𝑋 )
                                                          3 4
                                     𝑇(𝑋4 → 𝑋3 )~9.74 𝑣𝑎𝑟(𝑋 )
                                                              = 7.11                                           (81a)
                                                               3

                                                             𝑐𝑜𝑣(𝑋3 ,𝑋4 )
                                     𝑇(𝑋3 → 𝑋4 )~ − 12.67                 = −7.09                              (81b)
                                                              𝑣𝑎𝑟(𝑋4 )

The above RET values compensate very well the deterministic entropy self-generations, −7.21 and 7.16,
respectively for 𝑋3 and 𝑋4 (80a,80b), confirming the equilibrium of the entropy budget in both variables. Those near
symmetric values of the entropy transfer appear as a characteristic of two-dimensional linear Hamiltonian systems.
This has been verified independently by empirical estimations of 𝑇(𝑋12 → 𝑋3 ) and 𝑇(𝑋3 → 𝑋12 ), respectively
6.99 and −7.03 as well as in [49]. Therefore, the entropy appears as being self-generated by 𝑋12 (i.e. the square of
convection intensity), then transferred to 𝑋3 (intensity of the vertical temperature gradient), being self-dissipated
afterwards by 𝑋3 . The variable 𝑋22 , (square of the intensity of the horizontal temperature gradient) is nonlinearly
driven by (𝑋3 ,𝑋4 ), whose approximate evolution equation is obtained by (71b) multiplied by 2𝑋2 after using the
regression for 𝑋2 𝑋1 with a positive RET 𝑇(𝑋3 , 𝑋4 → 𝑋2 ) compensating the dissipation. In a similar way, an
approximately Hamiltonian system will be obtained by considering the pair (𝑋2 𝑋1 , 𝑋3 ).

The Liang-Kleeman entropy diagnostics can thus suggest groups of variables which, when mixed together, can
provide a simplified picture of the entropy transfers.

For stochastic systems, the presence of noise induces a decrease of the amplitude of the deterministic RETs (singles
and synergetic), since the noise contributes positively to the entropy balance. In the case of additive noise and as
far its amplitude increase, every single variable becomes more approximately governed by Ornstein-Uhlenbeck
processes producing RETs of smaller amplitude as far as noise variance increases



                                                                                                                  37
An important step forward is to make a systematic study of the RETs in stochastic systems and how they evolve
along the space of bifurcation parameters, noise intensity and its characteristics, which is out of the scope for the
present study. Another possible step is the merging of signal-processing techniques and blind source separation
methods with the Liang-Kleeman entropy diagnostics, using the nonlinear approach devided in this study.




                         Noise-free                                       Add. Noise                            Mult. Noise
                             𝑋1               𝑋2                𝑋3             𝑋1             𝑋2          𝑋3       𝑋1           𝑋2       𝑋3
  𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹,𝑠𝑖𝑛𝑔     9.97            2.85             0.02            9.30           1.72          0.01     9.86       2.02       0.01
  𝑇(𝑋~𝑖 → 𝑋𝑖 )𝐹,𝑠𝑦𝑛      0               -1.82            2.61            0              -1.17         2.06     0          -1.19      2.33
       𝑑𝐻𝑋𝑖              0               0                0               0              0             0        0.05       0.11       0.02
     (      )
        𝑑𝑡 𝑔,𝑚
      𝑑𝐻𝑋𝑖               0               0                0               0.65           0.49          0.56     0.08       0.09       0.28
      (    )
       𝑑𝑡 𝑔,𝑎
         𝜕𝐹𝑖             -10             -1               -2.66           -10            -1            -2.66    -10        -1         -2.66
      𝐸(     )
         𝜕𝑋𝑖
 Budget Sum              -0.03           0.03             -0.03           -0.05          -0.04         -0.03    -0.01      0.03       -0.03


Table 3. Terms of the budget of entropy for the 3 variables of the stochastic Lorenz system and the three noise
scenarios.

For the specific RETs, it allows determining the regions of state-space that most contribute to the RET. By focusing
on the noise-free situation, the deterministic contributions (12b,31b) for 𝑋1 and 𝑋3 are nearly constant along the
range of the consequential variable, being retained by the single and synergetic terms, respectively for 𝑋1 and 𝑋3 ,
i.e.:
                               𝜎𝜎 𝑑𝐸(𝑋2 |𝑋1 )
             ℱ1,~1,𝐹 (𝑋1 ) = 𝜎 2     𝑑𝑋1
                                              ~ℱ1,~1,𝐹,𝑠𝑖𝑛𝑔 (𝑋1 )~𝑇(𝑋~1 → 𝑋1 )𝐹,𝑠𝑖𝑛𝑔 = 9.974                                         (82a)
                                1

                               𝜎                     𝑑𝐸(𝑋1 |𝑋2 )         𝜎 𝜎      𝑑𝐸(𝑋1 𝑋3 |𝑋2 )
             ℱ2,~2,𝐹 (𝑋2 ) = 𝜎1 (𝑅𝑎 − 𝜇3 )                𝑑𝑋2
                                                                     − ( 𝜎1 3 )        𝑑𝑋2
                                                                                                   ~𝑇(𝑋~2 → 𝑋2 )𝐹 = 1.03             (82b)
                                  2                                        2

                                   𝜎 𝜎    𝑑𝐸(𝑋1 𝑋2 |𝑋3 )
             ℱ3,~3,𝐹 (𝑋3 ) = ( 1 2 )                            ~ℱ3,~3,𝐹,𝑠𝑦𝑛 (𝑋3 )~𝑇(𝑋~3 → 𝑋3 )𝐹,𝑠𝑦𝑛 = 2.61                          (82c)
                                    𝜎3              𝑑𝑋3

Concerning 𝑋2 , there are really strong variations and changes of the sign of the specific deterministic RETs
ℱ2,1,𝐹 (𝑋2 ), ℱ2,3,𝐹 (𝑋2 ) and ℱ2,~2,𝐹,𝑠𝑦𝑛 (𝑋2 ) along the range of 𝑋2 (see Fig. 7) which is a clear mark of nonlinearity,
since on linear systems the specific RETs are constant. In fact, while, the specific value of 𝑇(𝑋1 → 𝑋2 )𝐹 , i.e.
ℱ2,1,𝐹 (𝑋2 ) = is mostly positive and constant ~3.7 (black curve in Fig. 7), the specific 𝑇(𝑋3 → 𝑋2 )𝐹 i.e. ℱ2,3,𝐹 (𝑋2 )
(red curve in Fig. 6) is positive near the 𝑋2 = 0 but reaches large negative values at the lobes of the attractor while
the synergetic effect of (𝑋1 , 𝑋3 ) through ℱ2,~2,𝐹,𝑠𝑦𝑛 (𝑋2 ) (blue curve in Fig. 7) is mostly negative, displaying an
opposite behavior. This means that, both 𝑋1 and 𝑋3 separately contribute to increase the entropy of 𝑋2 , whereas
their joint combination contributes to decrease entropy of 𝑋2 .

Most of the RETs take place near the point of maximum joint pdf at (𝑋1 = 0, 𝑋2 = 0, 𝑋3 ~ − 0.3) where most of
sign changes of the convective cells take place, when the system orbit approaches the unstable fixed point of no
                                              −𝜇
convection: (𝑋1 = 0, 𝑋2 = 0, 𝑋3 = 𝜎 3 = −2.71). Here, the average and specific RETs are evaluated along the
                                                3



                                                                                                                                       38
ergodic pdf. However, they can be evaluated on forecast ensembles, particulary on short-to-long range weather
forecasting. There, entropy is interpreted as the entropy of forecast error, coming mostly from the ensemble spread.
That is useful to identify the drivers of predictability or unpredictability on specific situations.




Figure 7. Specific D-RET contributions for 𝑇(𝑋~2 → 𝑋2 )𝐹 , in the noise-free scenario, through 𝑇(𝑋1 → 𝑋2 )𝐹 , (black
curve), 𝑇(𝑋3 → 𝑋2 )𝐹 (red curve) and 𝑇(𝑋~2 → 𝑋2 )𝐹,𝑠𝑦𝑛 (blue curve).



7.Discussion and Conclusions

A general theory is derived for computing Shannon entropy transfers in nonlinear (deterministic and/or stochastic)
systems, holding under quite generic state-space boundary conditions, namely: 1) unbounded pdf support set; 2)
closed boundaries, i.e. null deterministic and diffusive fluxes at the pdf support set borders; 3) periodic conditions
in state-space. The theory extends the Liang-Kleeman (LK) framework [16] of causality inference, by decomposing
the evolution of the Shannon entropy of a single state vector component (taken as the consequential variable), into
a self entropy generation (SEG) and a global rate of entropy transfer (RET) issued from the complementary space of
the consequential variable, with contributions assigned either, to the deterministic or the stochastic forcings. In the
case of open conditions, some extra terms must be added to the entropy balance equation, related to externally
driven fluxes of entropy to the state-space, imposed by nun-null speeds or diffusivities at the borders of the pdf
support set in the space-space.

The RET comes from the existence of cross variable dependencies, either in the deterministic components or in
probabilistic diffusivities in the multiplicative-noise case. The global RET is further decomposed into the sum of RETs
from the single variables spanning the complementary space plus a synergetic RET accounting for synergetic causal
effects due to groups (e.g. triplets, quartets) of variables [28]. The synergetic term vanishes in linear systems, being
thus of purely nonlinear origin.

                                                                                                                     39
Synergies due to nonlinearities (e.g. products of variables in the forcings), as well as redundancies between variables
suggest the extended RET computation between a generic causal subspace and a generic consequential subspace
(or more generally manifolds), and for given contextual or outer subspace. As a climatic example of the causal,
consequential and contextual subspaces, we can choose sub-spaces spaning the low-frequency variability of
separate oceanic basins and the overlying atmosphere where indirect oceanic links may take place via an
‘atmospheric dynamical bridge’ [50]. Consistent expressions of the space-to-space RETs, are being devised (author’s
future manuscript), following the same CSM technique presented here.

The diagnostics of causality between two particular variables (inferred by RETs) can strongly depend on the set of
contextual or remaining variables, spaning the so-called outer space acting as room of ‘hidden’ indirect interactions
between that pair of variables. This effect can be amplified when the allowed interactions jump from linear to
nonlinear and the dimension of the ‘outer’ space increases, thus calling for a proper analysis of the extension of the
‘causality outer space’.

An effective method of estimating RETs, the ‘Causal Sensitivity Method’ (CSM) is then introduced, as an alternative
to the ‘brute-force’ and more expensive estimation approaches calling for the explicit knowledge of the pdf of the
system, which may have severe pitfals. In fact, the pdf estimation can be unreliable even for moderate system
dimensions if not enough data are available, and being biased by effect of the ‘curse of dimensionality’ (fact that
multivariate outliers become more probable than near average values).

The CSM relies on RET formulas depending explicitly on derivatives (sensitivities) of conditional expectations of the
deterministic terms and noise diffusivities, conditioned on the consequential variable. The CSM is fully appropriate
to cases where an ensemble of realizations is available, from which the conditional expectations are estimated using
nonlinear differentiable regressions based upon an extended set of basis functions (e.g. monomials, orthogonal
functions, wavelets) which can be fixed or optimized through signal processing techniques and machine learning,
as relevant vector machines and symbolic regression. Those ensembles can be time-evolving or obtained from a
sampled long time-series covering the attractor of the system. In particular in ensemble forecasting (e.g. medium-
to-long ensemble weather forecasting), entropy of forecast errors grows with the ensemble spread, and the RETs
become important to diagnose drivers of predictability or unpredictability of chosen variables.

Formulas for the CSM-based specific contributions to RETs, along the state-space are available, being uniform
(varying) on linear (nonlinear) systems, and thus providing information where the RETs are intense or not. The CSM-
based RET formulas could also help to propose certain parametrizations of the effects of the outer variables on the
causal-consequential pair, as for instance in parameterizing sub-grid scale processes in turbulence or in
meteorology.

To exemplify the usefulness of the CSM formulas, four RET estimation approaches are compared: The ‘brute-force’
computationally expensive analytical-numerical (AN) method, relying upon numerical integrals on the state-space
depending on the system pdf and taken as the reference in our study; the CSM, when the dynamical equations are
known; the MF method based on the model fitting followed by the CSM; and the multivariate linear (ML) approach
of Liang [18]. The methods are validated in two three-dimensional models: a model derived from a potential
function and the classical chaotic Lorenz model [26], both subject to a variety of noises and nonlinearities. The CSM
values appear to be robust and close to the reference AN values, being thus appropriate for application with real
data. The ML approach only works under weak nonlinearity, being potentially strongly biased when strong
nonlinearities and synergies across variables are present. This justifies the need for using a nonlinear estimate for
nonlinear problems. Diagnostics of RETs can suggested ways of separating system variables leading to more
simplified pictures of entropy fluxes.



                                                                                                                    40
The application of the CSM, with or without model fitting, is susceptible of generalization to differentiable maps
[12] and estimation of RETs between subspaces of variability, thus opening a straightfull, and computationally cheap
methodology to infer information flows across variables or groups of variables of a system, for instance spanning
sub-spaces of variability of the climatic system. Furthermore, this study has raised the importance of a systematic
study of RETs on chaotic and stochastic system as a function of bifurcation and noise parameters.

The application of the CSM, as well as other causality diagnostics to real systems of moderate dimension 𝐷 (10-20)
and high dimension represents a great endeavor, both in the cases of known and unknown evolution equations,
with the computational cost of many problems growing exponentially with 𝐷 and the ‘curse of dimensionality’
effect. Furthermore, when available time series are short, for selected spatial and temporal scales, we add the need
of making robust model fittings, avoiding overfitting. In high-dimension systems, governed by complex networks
(like the climatic system), there are possible high levels of linear or nonlinear redundancies (measured for instance
by mutual information). Therefore, it is advisable to first compute low-dimensional spaces (by linear and/or
nonlinear principal component analysis and independent and/or subspace component analysis), and then diagnose
the causality between the spaning variables or between subspaces, following the same CSM strategy. Those
variables can be substituted by other relevant common indices (e.g. climatic indices in the climatic system, like El-
Niño index), acting as drivers (causal variables) of the raw system variables, for instance, helping to locate which
regions are more or less influenced.

The implementation of the CSM in real cases studies without available model equations has important prerequisites
related to efficient and robust regressions both in the fitting of model equations and also in the expression of CSM
conditional expectations. Robust regressions should preferentially be accompanied by statistical significance tests.
The fitting may be performed by standard linear or non-linear regression techniques or more sophisticated machine-
learning-based and genetic programming (e.g. relevance vector machines), keeping in mind that basis-functions
must be multiplicatively separable in terms of the causal/consequential/outer variables. The basis-functions should
preferentially be non-recurrent (issued from sets of orthogonal functions), and ranging from large to small scales.

Further applications to real-world class of problems like the interaction between different components of the
climate system [50] with presence of feedbacks is certainly a way forward that is taken up and will be reported in
the near future. Moreover, the CSM technique can be applied to ensemble forecasting (e.g. short-to-long weather
range forecasting) where the Shannon entropy mostly comes from the ensemble spread and forecast error variance.
There, the identification of causes (drivers) of the ensemble forecast spread through the RETs can be useful to
determine predictability conditions of selected variables, thus opening a ‘world’ of applications.

CRediT authorship contribution statement

Carlos Pires: Conceptualization, Methodology, Formal Analysis, Validation, Investigation, Writing – original draft,
Writing – review & editing, Visualization. David Docquier: Methodology, Validation. Stéphane Vannitsem:
Methodology, Formal analysis ,Writing – review & editing.

Declaration of competing interest

The authors declare that they have no known competing financial interests or personal relationships that could have
appeared to influence the work reported in this paper.

Declaration of Generative AI and AI assisted technologies in the writing process

Generative AI/AI assisted technologies were not used in the preparation of this work.

Data availability

                                                                                                                  41
Data will be made available on request.

Acknowledgements

We thank Reik Donner and Giorgia Di Capua for very fruitful discussions during the preparation of this work and also
the constructive comments of two anonymous reviewers. It is funded by the Portuguese ´Fundação para a Ciência
e a Tecnologia’ (FCT) I.P./MCTES through national funds (PIDDAC) – UIDB/50019/2020- IDL and the project
JPIOCEANS/0001/2019 (ROADMAP: ’The Role of ocean dynamics and Ocean–Atmosphere interactions in Driving
Climate variations and future Projections of impact–relevant extreme events’). D. Docquier and S. Vannitsem also
acknowledge the partial financial support from the Belgian Federal Scientific Policy Office (Belspo) under contract
B2/20E/P1/ROADMAP.

Appendix A Proofs of the theoretical results

A.1. Proof of (4)
                                                                                       𝐷𝑛
Let us denote: 𝑋𝑖 (𝑡 + 𝑑𝑡) = 𝑋𝑖 (𝑡) + 𝑌𝑖 (𝑑𝑡); 𝑌𝑖 (𝑑𝑡) ≡ 𝐹𝑖 (𝐗, 𝛉, 𝑡)𝑑𝑡 + ∑𝑘=1              𝐵𝑖,𝑘 (𝐗, 𝛉, 𝑡)𝑑𝑊𝑘 , 𝑖 = 1, … , 𝐷
and 𝜌𝑖,𝑠𝑒𝑙𝑓 (𝑋𝑖 ) the pdf of 𝑋𝑖 in the stochastic process where 𝑋~𝑖 is frozen in the infinitesimal period [𝑡, 𝑡 + 𝑑𝑡]. The
entropy of that process, needs the writing of the Frobenius-Perron (FP) operator ℘[𝜌𝑖,𝑠𝑒𝑙𝑓 (𝑋𝑖 )] evolving 𝜌𝑖,𝑠𝑒𝑙𝑓
from 𝑡 to 𝑡+dt. For that, we use a similar procedure to that of Liang in 2016 [16] (his Proposition VI.3) in which the
FP operator of the pdf of 𝑋1 (denoted as 𝜌1,\2 ) under frozen 𝑋2 is written as:
                                                                𝜕𝐹1 𝜌~2             𝑑𝑡       𝜕2 𝑔1,1 𝜌~2
          ℘[ 𝜌1,\2 (𝑋1 )] = 𝜌1,\2 (𝑋1 + 𝑌1 ) − 𝑑𝑡 ∫ℝ𝐷−2           𝜕𝑋1
                                                                        𝑑𝑋3 … 𝑑𝑋𝐷 + 2 ℝ
                                                                                       ∫ 𝐷−2
                                                                                                𝜕2 𝑋1
                                                                                                         𝑑𝑋3 … 𝑑𝑋𝐷 + 𝑜(𝑑𝑡)

                                                                                                                              (A.1)

where 𝜌~2 = ∫ℝ 𝜌(𝐗) 𝑑𝑋2 . Now, in a similar way, the transformed pdf is ℘[𝜌𝑖,𝑠𝑒𝑙𝑓 (𝑋𝑖 )], which is obtained by
changing, in the previous equation, the sub-index 1 into 𝑖, the sub-index 2 into ~𝑖 (corresponding to the set of
frozen variables), and the integration ∫ℝ𝐷−2 (. . )𝑑𝑋3 … 𝑑𝑋𝐷 into the integrand function (. . ). WE thus have the FP:

                                                                                    𝜕𝐹 𝜌     𝑑𝑡 𝜕2 𝑔𝑖,𝑖 𝜌𝑖
              ℘[𝜌𝑖,𝑠𝑒𝑙𝑓 (𝑋𝑖 )] = ℘[ 𝜌𝑖,\~𝑖 (𝑋𝑖 )] = 𝜌𝑖,𝑠𝑒𝑙𝑓 (𝑋𝑖 + 𝑌𝑖 ) − 𝑑𝑡 𝜕𝑋𝑖 𝑖 + 2             𝜕2 𝑋𝑖
                                                                                                           + 𝑜(𝑑𝑡)            (A.2)
                                                                                        𝑖


where the pdf 𝜌~2 was changed into 𝜌~~𝑖 = 𝜌𝑖 . The corresponding entropy 𝐻𝑋𝑖,𝑠𝑒𝑙𝑓 (𝑡 + 𝑑𝑡) is obtained by taking
minus logarithm of the above pdf, followed by the expectation operator 𝐸 and the Taylor expansion of 𝜌𝑖,𝑠𝑒𝑙𝑓 (𝑋𝑖 +
𝑌𝑖 ) around 𝑋𝑖 (see the similar procedure in Proposition VI.2 and VI.3 of [16]). Then, after subtracting 𝐻𝑋𝑖,𝑠𝑒𝑙𝑓 (𝑡) =
 𝐻𝑋1 (𝑡), dividing by 𝑑𝑡 and taking the limit 𝑑𝑡 → 0, we obtain the SEG given by the time derivative:
                      𝑑 𝐻𝑋𝑖,𝑠𝑒𝑙𝑓               𝜕 log 𝜌𝑖     1         𝜕2 log 𝜌𝑖         1 𝜕𝐹𝑖 𝜌𝑖     1     1 𝜕2 𝑔𝑖,𝑖 𝜌𝑖
                            𝑑𝑡
                                   = − 𝐸 [𝐹𝑖      𝜕𝑋𝑖
                                                        ] − 2
                                                              𝐸 [𝑔𝑖,𝑖   𝜕 2 𝑋𝑖
                                                                                ] + 𝐸 [ 𝜌𝑖 𝜕𝑋𝑖
                                                                                                 ] − 2
                                                                                                       𝐸 [ 𝜌𝑖 𝜕2 𝑋𝑖
                                                                                                                        ]     (A.3)

                                                                     𝑑 𝐻𝑋𝑖
According to Proposition VI.2 of [16], the time derivative                   is the sum of the third and fourth terms of the r.h.s.
                                                                        𝑑𝑡
of the above equation. Consequently, the RET is given by
                                                    𝑑 𝐻𝑋𝑖       𝑑 𝐻𝑋𝑖,𝑠𝑒𝑙𝑓          1 𝜕𝐹𝑖 𝜌𝑖     1    1 𝜕2 𝑔 𝜌
                                   𝑇(𝑋~𝑖 → 𝑋𝑖 ) =     𝑑𝑡
                                                            −      𝑑𝑡
                                                                             = −𝐸 (𝜌   𝜕𝑋
                                                                                             ) + 2 𝐸 (𝜌 𝜕𝑋𝑖,𝑖2 𝑖 )            (A.4)
                                                                                     𝑖    𝑖            𝑖    𝑖


Providing the result (4).




                                                                                                                                42
A.2. Proof of (10a)
                                     1 𝜕𝐹𝑖 𝜌𝑖                                                  𝜌𝐗 𝜕𝐹𝑖 𝜌𝑖                                       𝜕𝐹 𝜌                            𝜕𝜌~𝑖|𝑖
We have 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 = −𝐸 (𝜌                ) = − ∫~𝑖 ∫𝑖                                               𝑑𝐗 = − ∫~𝑖 ∫𝑖              𝜌~𝑖|𝑖 𝜕𝑋𝑖 𝑖 𝑑𝐗 = ∫~𝑖 ∫𝑖 𝐹𝑖 𝜌𝑖 𝜕𝑋 𝑑𝐗 =
                                      𝑖 𝜕𝑋𝑖                                                    𝜌𝑖 𝜕𝑋𝑖                                               𝑖                               𝑖
               𝜌 𝜕𝜌                𝜕 log 𝜌
∫~𝑖 ∫𝑖     𝐹𝑖 𝜌 𝐗 𝜕𝑋~𝑖|𝑖 𝑑𝐗 = 𝐸 (𝐹𝑖 𝜕𝑋 ~𝑖|𝑖), where ∫𝑖                                           and ∫~𝑖            stand for integration on 𝑋𝑖 and 𝑋~𝑖 respectively.
               ~𝑖|𝑖  𝑖                    𝑖

In the forth equality we apply integration by parts and lim 𝜌𝐗 𝐹𝑖 = 0. Now, let us take (9a): 𝐹𝑖 = 𝐹̂𝑖 (𝑋𝑖 ) + 𝐹𝑖,~𝑖 .
                                                                                                  ‖𝐗‖→∞
                                          𝜕𝜌                      𝑑
The part depending on 𝐹̂𝑖 is ∫~𝑖 ∫𝑖 𝐹̂𝑖 𝜌𝑖 𝜕𝑋~𝑖|𝑖 𝑑𝐗 = ∫𝑖 𝐹̂𝑖 𝜌𝑖 𝑑𝑋 ∫~𝑖 𝜌~𝑖|𝑖 𝑑𝐗 = 0, since ∫~𝑖 𝜌~𝑖|𝑖 𝑑𝑋~𝑖 = 1, and the
                                                                            𝑖                                 𝑖
the second equality of (10a) follows.

A.3. Proof of (11)
                                                                                     𝜕 log 𝜌~𝑖|𝑖                                   𝜕 log 𝜌~𝑖|𝑖                                 𝜕𝜌
(11)                   comes                from:                   𝐸 [𝐹𝑖,~𝑖              𝜕𝑋𝑖
                                                                                                   ] = ∫~𝑖 ∫𝑖 𝜌𝐗 𝐹𝑖,~𝑖                𝜕𝑋𝑖
                                                                                                                                                 𝑑𝐗 = ∫~𝑖 ∫𝑖 𝜌𝑖 𝐹𝑖,~𝑖 𝜕𝑋~𝑖|𝑖 𝑑𝐗 =
                                                                                                                                                                                    𝑖
                𝜕𝐹𝑖,~𝑖 𝜌~𝑖|𝑖                                𝜕𝐹𝑖,~𝑖                                 𝑑                         𝜕𝐹               𝑑
∫~𝑖 ∫𝑖 𝜌𝑖              𝜕𝑋𝑖
                                𝑑𝐗 − ∫~𝑖 ∫𝑖 𝜌𝑖 𝜌~𝑖|𝑖 𝜕𝑋 𝑑𝐗 = ∫𝑖                                𝜌𝑖 𝑑𝑋 ∫~𝑖 𝜌~𝑖|𝑖 𝐹𝑖,~𝑖 𝑑𝐗 − 𝐸 ( 𝜕𝑋𝑖,~𝑖 ) = 𝐸𝑖 [𝑑𝑋 𝐸~𝑖 (𝐹𝑖,~𝑖 |𝑋𝑖 )] −
                                                                        𝑖                            𝑖                            𝑖             𝑖
      𝜕𝐹𝑖,~𝑖
𝐸 ( 𝜕𝑋 ).
          𝑖


A.4. Proof of (16a)
                                                                𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓                         𝑑𝐻𝑋                                                    1                     𝑑2 𝜌
(16a)          is      obtained           through     :     (        𝑑𝑡
                                                                                    )          = ( 𝑑𝑡 𝑖 )           − 𝑇(𝑋~𝑖 → 𝑋𝑖 )𝑔 = − 2 ∫~𝑖 ∫𝑖 𝑔𝑖,𝑖 𝜌~𝑖|𝑖 𝑑𝑋 2𝑖 𝑑𝐗 −
                                                                               𝑔,𝑚                           𝑔,𝑚                                                                    𝑖
1                       𝜕2 𝑔𝑖,𝑖 𝜌𝑖          1                       𝜕2 𝑔𝑖,𝑖 𝜌~𝑖|𝑖                      𝜕2 𝑔𝑖,𝑖 𝜌𝑖      1                            𝑑 2 𝑔𝑖,𝑖 𝜌~𝑖|𝑖 𝜌𝑖
  ∫ ∫
2 ~𝑖 𝑖
               𝜌    ~𝑖|𝑖 𝜕𝑋 2        𝑑𝐗 = − 2 ∫~𝑖 ∫𝑖       (𝜌𝑖              𝜕𝑋𝑖2
                                                                                         + 𝜌~𝑖|𝑖         𝜕𝑋𝑖2
                                                                                                              ) 𝑑𝐗 = − 2 ∫~𝑖 ∫𝑖                 (        𝑑𝑋𝑖2
                                                                                                                                                                        −
                             𝑖
    𝜕𝑔𝑖,𝑖 𝜌~𝑖|𝑖 𝑑𝜌𝑖                          𝜕𝑔𝑖,𝑖 𝜌~𝑖|𝑖 𝑑𝜌𝑖                                     𝑑2                                             𝑑 2 𝐸(𝑔𝑖,𝑖 |𝑋𝑖 )
2      𝜕𝑋𝑖          𝑑𝑋
                       ) 𝑑𝐗 = ∫~𝑖 ∫𝑖            𝜕𝑋𝑖       𝑑𝑋
                                                             𝑑𝐗 = − ∫𝑖 𝜌𝑖 𝑑𝑋 2 ∫~𝑖 𝑔𝑖,𝑖 𝜌~𝑖|𝑖 𝑑𝐗 = 𝐸𝑖 (−                                                𝑑𝑋𝑖2
                                                                                                                                                                   ).       In the third
                       𝑖                                    𝑖                                      𝑖
equality we apply integration by parts twice with respect to 𝑋𝑖 and once in the fifth and sixth equalities.

A.5. Proof of (17)
                                                                    1           1 𝜕2 𝑔𝑖,𝑖~𝑖, 𝜌𝑖     1                            𝜕2 𝑔𝑖,𝑖~𝑖 𝜌𝑖              1                     𝜕2 𝑔𝑖,𝑖~𝑖
(17) is obtained from: 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔 = 2 𝐸 [𝜌                                       𝜕𝑋𝑖2
                                                                                                ] = 2 ∫~𝑖 ∫𝑖             𝜌~𝑖|𝑖      𝜕𝑋𝑖2
                                                                                                                                                𝑑𝐗 = 2 ∫~𝑖 ∫𝑖 𝜌~𝑖|𝑖 (𝜌𝑖             𝜕𝑋𝑖2
                                                                                                                                                                                             +
                                                                                 𝑖
         𝑑 2 𝜌𝑖    𝜕𝑔    𝑑𝜌                                     1                   𝜕2 𝑔𝑖,𝑖~𝑖      1       𝑑 2 𝜌~𝑖|𝑖 𝑔𝑖,𝑖~𝑖            𝑑        𝜕𝑔
𝑔𝑖,𝑖~𝑖          + 2 𝑖,𝑖~𝑖 𝑖 ) 𝑑𝐗 = ∫~𝑖 ∫𝑖                   [2 𝜌~𝑖|𝑖 𝜌𝑖                         + 𝜌𝑖                          − 𝜌𝑖        (𝜌~𝑖|𝑖 𝑖,𝑖~𝑖)] 𝑑𝐗 =
         𝑑𝑋𝑖2       𝜕𝑋𝑖 𝑑𝑋𝑖                                                             𝜕𝑋𝑖2       2              𝑑𝑋𝑖2                𝑑𝑋𝑖        𝜕𝑋𝑖
1    𝜕2 𝑔      1     𝑑2                         𝑑    𝜕𝑔
  𝐸 ( 𝑖,𝑖~𝑖
          2 ) + 𝐸𝑖 [ 2 𝐸~𝑖 (𝑔𝑖,𝑖~𝑖 |𝑋𝑖 )] −𝐸𝑖 [ 𝐸~𝑖 ( 𝑖,𝑖~𝑖 |𝑋𝑖 )], thus yielding the result.
2     𝜕𝑋𝑖      2    𝑑𝑋𝑖                        𝑑𝑋𝑖    𝜕𝑋𝑖

A.6. Proof of (22a-c, 23a,b)

According to formula (2) of Liang [16], the rate of entropy transfer to 𝑋𝑖 due to the influence of 𝑋𝑗 is:
                                               𝜕(𝐹𝑖 𝜌~𝑗 )                       1               𝜕2 (𝑔𝑖,𝑖 𝜌~𝑗 )
       𝑇(𝑋𝑗 → 𝑋𝑖 ) = − ∫ℝ𝐷 𝜌𝑗|𝑖                     𝜕𝑋𝑖
                                                            𝑑𝐗 + 2 ∫ℝ𝐷 𝜌𝑗|𝑖                            𝜕𝑋𝒊𝟐
                                                                                                                  𝑑𝐗                                                                    (A.5)

Integration by parts with respect to 𝑋𝑖 and assuming that lim 𝜌𝑗|𝑖 𝐹𝑖 𝜌~𝑗 = 0 , leads the deterministic term (first
                                                                                                       𝑋𝑖 →±∞
of the r.h.s.) of (A.5) to be written as :
                           𝜕(𝜌𝑗|𝑖 )                            𝜌     𝜌          𝜕 log 𝜌𝑗|𝑖                          𝜌      𝜕 log(𝜌𝑗|𝑖 )
       ∫ℝ𝐷 𝐹𝑖 𝜌~𝑗            𝜕𝑋𝑖
                                      𝑑𝐗 = ∫ℝ𝐷 𝜌𝑗,~𝑗 𝐹𝑖 𝜌~𝑗 𝑗|𝑖                     𝜕𝑋𝑖
                                                                                               𝑑𝐗 = 𝐸 [𝐹𝑖 𝜌 𝑗|𝑖               𝜕𝑋𝑖
                                                                                                                                          ],                                            (A.6)
                                                                    𝑗,~𝑗                                            𝑗|~𝑗


where the full pdf writes as 𝜌𝑗,~𝑗 leading to the expectation 𝐸[(… )] = ∫ℝ𝐷 𝜌𝑗,~𝑗 (… ) 𝑑𝐗 and we use the definition
                                𝜌
of conditional pdf 𝜌𝑗,~𝑗 = 𝜌𝑗|~𝑗 . Similar procedure applied to the noise term (second of the r.h.s.) of (A.5) leads it
                                     ~𝑗
to be written in a similar form of (A.6):

                                                                                                                                                                                           43
                                                                    1              𝜕(𝑔𝑖,𝑖 𝜌~𝑗 ) 𝜕(𝜌𝑗|𝑖 )                      𝜌     𝜌          1 𝜕(𝑔𝑖,𝑖 𝜌~𝑗 ) 𝜕 log 𝜌𝑗|𝑖
                                                              − ∫ℝ𝐷                                        𝑑𝐗 = ∫ℝ𝐷 𝜌𝑗,~𝑗 ~𝑗 𝑗|𝑖 (−                          )           𝑑𝐗 =
                                                               2                       𝜕𝑋𝑖       𝜕𝑋𝑖                           𝜌𝑗,~𝑗          2𝜌~𝑗  𝜕𝑋𝑖          𝜕𝑋𝑖
               1        𝜕(𝑔𝑖,𝑖 𝜌~𝑗 )   𝜌          𝜕 log(𝜌𝑗|𝑖 )
     𝐸 [ (− 2𝜌             𝜕𝑋𝑖
                                   ) 𝜌 𝑗|𝑖             𝜕𝑋𝑖
                                                                    ].                                                                                                     (A.7)
                   ~𝑗                      𝑗|~𝑗


The sum of deterministic and noise terms leads to the result by defining the generalized speed 𝑅𝑖 = 𝐹𝑖 −
 1 𝜕(𝑔𝑖,𝑖 𝜌~𝑗 )
               .
2𝜌~𝑗  𝜕𝑋𝑖

A.7. Proof of (24, 25,26a-b)

The derivative of the cumulated distribution function (cdf) is the pdf, and thus the term appearing in the expected
                      𝜕log(𝜌𝑗|𝑖 )   𝟏 𝜕2 𝑃𝑟(𝑗|𝑖 )  −1 𝜕2 𝑃𝑟𝑒𝑥 (𝑗|𝑖 )
value (1a) writes as     𝜕𝑋
                                  =𝜌   𝜕𝑋 𝜕𝑋
                                                  =𝜌    𝜕𝑋 𝜕𝑋
                                                                    . The manipulation of the full and conditional pdfs
                                       𝑖               𝑗|𝑖              𝑖     𝑗           𝑗|𝑖      𝑖   𝑗
leads to
                                                             𝜌𝑗|𝑖           𝜕log(𝜌𝑗|𝑖 )                                       𝜕2 𝑃𝑟𝑒𝑥 (𝑗|𝑖 )
                                            𝐸 [𝑅𝑖                                         ] = − ∫~𝑗 𝜌~𝑗 𝑑𝑋~𝑗 ∫𝑗 𝑅𝑖                             𝑑𝑋𝑗                         (A.8)
                                                         𝜌𝑗|~𝑗                 𝜕𝑋𝑖                                                𝜕𝑋𝑖 𝜕𝑋𝑗

where the ~𝑗-integration means integration with respect to all variables different from 𝑋𝑗 (i.e 𝑋~𝑗 ) and 𝜌~𝑗 is the
                                                                        ∞    𝜕2 𝑃𝑟 (𝑗|𝑖 )       𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖 ) 𝑋𝑗 =∞
pdf of 𝑋~𝑗 . Applying integration by parts with respect to 𝑋𝑗 , we get ∫−∞ 𝑅𝑖 𝜕𝑋𝑒𝑥𝜕𝑋 𝑑𝑋𝑗 = 𝑅𝑖 𝜕𝑋            |𝑋𝑗=−∞ −
                                                                                                                                    𝑖     𝑗                        𝑖
 ∞ 𝜕𝑃𝑟𝑒𝑥 (𝑗|𝑖 ) 𝜕𝑅𝑖
∫−∞ 𝜕𝑋          𝜕𝑋𝑗
                    𝑑𝑋𝑗 . The first term vanishes because it depends on the derivatives of a probability: zero or one,
          𝑖
                                                                                              𝜌𝑗,~𝑗
at 𝑋𝑗 = −∞ and 𝑋𝑗 = ∞ respectively. After its substitution and recalling that 𝜌~𝑗 = 𝜌               and applying the
                                                                                                                                                       𝑗|~𝑗
expectation operator on the state-space, the result follows.

A.8. Proof of (29a)

After expanding the expectation in terms of pdfs with 𝑅𝑖 substituted by 𝑅𝑖,𝑗 we get:
                                           𝜌𝑗|𝑖       𝜕log(𝜌𝑗|𝑖 )                                      𝜕𝜌𝑗|𝑖                                              𝜕𝜌
    𝑇(𝑋𝑗 → 𝑋𝑖 ) = 𝐸 [𝑅𝑖,𝑗                                                   ] = ∫𝑖 𝜌𝑖 𝑑𝑋𝑖 ∫𝑗                     𝑑𝑋𝑗 ∫𝑘 𝜌𝑘|𝑖 𝑅𝑖,𝑗 𝑑𝑋𝑘 = ∫𝑖 𝜌𝑖 𝑑𝑋𝑖 ∫𝑗 𝑅̅𝑖,𝑗 𝑗|𝑖 𝑑𝑋𝑗
                                       𝜌𝑗|𝑖,𝑘            𝜕𝑋𝑖                                               𝜕𝑋𝑖                                                           𝜕𝑋𝑖
                                                                                                                                                                           (A.9)
                                                                  1 𝜕𝑔̅𝑖,𝑖,𝑗
where 𝑅̅𝑖,𝑗 ≡ ∫𝑘 𝜌𝑘|𝑖 𝑅𝑖,𝑗 𝑑𝑋𝑘 = 𝐹̅𝑖,𝑗 − 2 𝜕𝑋 − 2
                                                                                       1 𝑑 log 𝜌𝑖
                                                                                                  𝑔̅ 𝑖,𝑖,𝑗 = ̅𝑖,𝑗 − 1 𝜕𝜌𝑖 𝑔̅𝑖,𝑖,𝑗 with conditional averages over
                                                                                                             𝐹
                                                                               𝑖           𝑑𝑋𝑖                     2𝜌𝑖 𝜕𝑋𝑖

the outer variables given by 𝐹̅𝑖,𝑗 ≡ ∫𝑘 𝜌𝑘|𝑖 𝐹𝑖,𝑗 𝑑𝑋𝑘 and 𝑔̅𝑖,𝑖,𝑗 ≡ ∫𝑘 𝜌𝑘|𝑖 𝑔𝑖,𝑖,𝑗 𝑑𝑋𝑘 .
                                                                                                                                                    𝜕𝜌𝑖 𝑅̅𝑖,𝑗
Integration by parts with respect to 𝑋𝑖 , leads to: 𝑇(𝑋𝑗 → 𝑋𝑖 ) = − ∫𝑗 𝑑𝑋𝑗 ∫𝑖                                                            𝑑𝑋𝑖 𝜌𝑗|𝑖     𝜕𝑋𝑖
                                                                                                                                                                = 𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹 +
𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 .The term due to the deterministic term develops as:

                                                                                                           𝜕𝐹̅𝑖,𝑗                                       𝜕𝜌
                            𝑇(𝑋𝑗 → 𝑋𝑖 ) = − ∫𝑗 𝑑𝑋𝑗 ∫𝑖                                     𝑑𝑋𝑖 𝜌𝑗|𝑖 𝜌𝑖 (             ) − ∫𝑗 𝑑𝑋𝑗 ∫𝑖       𝑑𝑋𝑖 𝜌𝑗|𝑖 𝐹̅𝑖,𝑗 ( 𝑖 )              (A.10)
                                                  𝐹                                                         𝜕𝑋𝑖                                          𝜕𝑋𝑖

                                                       𝜕𝐹̅
The first term of the r.h.s is −𝐸𝑖,𝑗 ( 𝜕𝑋𝑖,𝑗), whereas in the second term we apply integration by parts with respect to
                                                              𝑖
                                         𝜕𝜌               𝜕                         𝑑
𝑋𝑖 yielding: − ∫𝑗 𝑑𝑋𝑗 ∫𝑖 𝑑𝑋𝑖 𝜌𝑗|𝑖 𝐹̅𝑖,𝑗 ( 𝑖 ) = ∫𝑖 𝜌𝑖 𝑑𝑋𝑖   ∫𝑗 𝜌𝑗|𝑖 𝐹̅𝑖,𝑗 𝑑𝑋𝑖 = 𝐸𝑖 [ 𝐸𝑗 (𝐹̅𝑖,𝑗 |𝑋𝑖 )], providing the
                                                                  𝜕𝑋𝑖                            𝜕𝑋𝑖                                    𝑑𝑋𝑖
formula of 𝑇(𝑋𝑗 → 𝑋𝑖 )𝐹 .




                                                                                                                                                                               44
A.9. Proof of (29b)

The term due to the diffusivity is:
                              1                                       𝜕2 𝜌𝑖 𝑔̅𝑖,𝑖,𝑗       1                          𝜕2 𝑔̅𝑖,𝑖,𝑗                  𝜕2 𝜌   𝜕𝑔̅        𝜕𝜌
             𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 = 2 ∫𝑗 𝑑𝑋𝑗 ∫𝑖 𝑑𝑋𝑖 𝜌𝑗|𝑖                             𝜕𝑋𝒊𝟐
                                                                                        = 2 ∫𝑗 𝑑𝑋𝑗 ∫𝑖 𝑑𝑋𝑖 𝜌𝑗|𝑖 (𝜌𝑖       𝜕𝑋𝒊𝟐
                                                                                                                                  + 𝑔̅𝑖,𝑖,𝑗 𝜕𝑋 𝟐𝑖 + 2 𝜕𝑋𝑖,𝑖,𝑗 𝜕𝑋𝑖 ).
                                                                                                                                                    𝒊         𝑖         𝑖
                                                                                                                                                                  (A.11)

Application of integration by parts with respect to 𝑋𝑖 , twice and once, to the second and third terms, respectively,
leads to the result:
                                                 1              𝜕2 𝑔̅𝑖,𝑖,𝑗          1      𝑑2                    𝑑              𝜕𝑔̅𝑖,𝑖,𝑗
                        𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 = 2 𝐸𝑖,𝑗 ( 𝜕𝑋 2 ) + 2 𝐸𝑖 [𝑑𝑋 2 𝐸𝑗 (𝑔̅𝑖,𝑖,𝑗 |𝑋𝑖 )] −𝐸𝑖 [𝑑𝑋 𝐸𝑗 ( 𝜕𝑋 |𝑋𝑖 )]                                                     (A.12)
                                                                      𝑖                       𝑖                      𝑖               𝑖


A.10. Proof of (36a)

Let us consider w.l.g. 𝐴𝐹 = 𝑓1 (𝑋𝑗 )𝑓2 (𝑋𝑖 , 𝑋𝑘 ) = 𝐹𝑖,𝑗 . Let us build the terms appearing in the l.h.s. of Theorem 3. Then
                            𝜕𝐹̅
𝐹̅𝑖,𝑗 = 𝑓1 𝐸𝑘 (𝑓2 |𝑋𝑖 ) and 𝜕𝑋𝑖,𝑗 = 𝑓1 𝐸𝑘 (𝑓2 |𝑋𝑖 )′ where the prime (double prime) stands for the first (second) derivative
                                  𝑖
                                𝜕𝑅               ̅
with respect to 𝑋𝑖 . Then 𝐸𝑖,𝑗 ( 𝜕𝑋𝑖,𝑗 ) = 𝐸𝑖 (𝐸𝑗 (𝑓1 |𝑋𝑖 )𝐸𝑘 (𝑓2 |𝑋𝑖 )′). Now, 𝐸𝑗 (𝐹̅𝑖,𝑗 |𝑋𝑖 ) = 𝐸𝑘 (𝑓2 |𝑋𝑖 )𝐸𝑗 (𝑓1|𝑋𝑖 ), its
                                                     𝑖
                   𝑑
derivative is        𝐸 (𝑅̅𝑖,𝑗 |𝑋𝑖 ) = 𝐸𝑘 (𝑓2 |𝑋𝑖 )′𝐸𝑗 (𝑓1 |𝑋𝑖 ) + 𝐸𝑘 (𝑓2 |𝑋𝑖 )𝐸𝑗 (𝑓1 |𝑋𝑖 )′                  and the 𝑋𝑖 expectation comes as
                  𝑑𝑋𝑖 𝑗
     𝑑                                                                                                 𝜕𝑅                                ̅
𝐸𝑖 [𝑑𝑋 𝐸𝑗 (𝑅̅𝑖,𝑗 |𝑋𝑖 )] = 𝐸𝑖 (𝐸𝑘 (𝑓2 |𝑋𝑖 )′𝐸𝑗 (𝑓1 |𝑋𝑖 ) + 𝐸𝑘 (𝑓2|𝑋𝑖 )𝐸𝑗 (𝑓1 |𝑋𝑖 )′). Subtracting 𝐸𝑖,𝑗 ( 𝜕𝑋𝑖,𝑗 ), we get 𝑇(𝑋𝑗 →
         𝑖                                                                                                                                   𝑖
                            𝑑
𝑋𝑖 )𝐴 = 𝐸𝑖 [𝐸𝑘 (𝑓2 |𝑋𝑖 )      𝐸 (𝑓 |𝑋 )].
     𝐹                     𝑑𝑋𝑖 𝑗 1 𝑖

A.11. Proof of (36b)

Considering 𝐴𝑔 = 𝑓3 (𝑋𝑗 )𝑓4 (𝑋𝑖 , 𝑋𝑘 ) = 𝑔𝑖,𝑖,𝑗 , one obtains 𝑔̅𝑖,𝑖,𝑗 = 𝑓3 𝐸𝑘 (𝑓4 |𝑋𝑖 ). Now, playing with the terms whose
𝑋𝑖 average is taken in 𝑇(𝑋𝑗 → 𝑋𝑖 )𝑔 , we get:

                                                 1     𝜕2 𝑔̅𝑖,𝑖,𝑗         1
                                                 2
                                                   𝐸𝑗 ( 𝜕𝑋𝑖2
                                                                  |𝑋𝑖 ) = 2 𝐸𝑗 (𝑓3|𝑋𝑖 )𝐸𝑘 (𝑓4|𝑋𝑖 )′′                                                              (A.13)

   1 𝑑2                     1                                                         1
         𝐸 (𝑔̅𝑖,𝑖,𝑗 |𝑋𝑖 ) = 2 𝐸𝑗 (𝑓3|𝑋𝑖 )𝐸𝑘 (𝑓4 |𝑋𝑖 )′′ + 𝐸𝑗 (𝑓3|𝑋𝑖 )′𝐸𝑘 (𝑓4 |𝑋𝑖 )′ + 2 𝐸𝑗 (𝑓3|𝑋𝑖 )′′𝐸𝑘 (𝑓4|𝑋𝑖 )
   2 𝑑𝑋𝑖2 𝑗
                                                                                                                                                                  (A.14)

                                         𝑑           𝜕𝑔̅𝑖,𝑖,𝑗
                                      − 𝑑𝑋 𝐸𝑗 ( 𝜕𝑋 |𝑋𝑖 ) = −𝐸𝑗 (𝑓3 |𝑋𝑖 )𝐸𝑘 (𝑓4 |𝑋𝑖 )′′ − 𝐸𝑗 (𝑓3 |𝑋𝑖 )′𝐸𝑘 (𝑓4|𝑋𝑖 )′                                                (A.15)
                                             𝑖            𝑖


where primes are derivatives with respect 𝑋𝑖 . By summing up, and taking 𝑋𝑖 averaging, we obtain
                                                                                    1                 𝑑2
                                                 𝑇(𝑋𝑗 → 𝑋𝑖 )𝐴 = 2 𝐸𝑖 [𝐸𝑘 (𝑓4 |𝑋𝑖 ) 𝑑𝑋 2 𝐸𝑗 (𝑓3 |𝑋𝑖 )]                                                             (A.16)
                                                                             𝑔                         𝑖


A.12. Proof of (43b)

The equation governing 𝑋̂𝑖 writes:

                                                             ̂, 𝛉)𝑑𝑡 + ∑𝐷
                                                 𝑑𝑋̂𝑖 = 𝐹̂𝑖 (𝐗           𝑛 ̂      ̂
                                                                        𝑘=1 𝐵𝑖,𝑘 (𝐗, 𝛉)𝑑𝑊𝑘 ,                                                                      (A.17)

where 𝐗̂ is the changed vector, 𝐹̂𝑖 = ℑ𝑖 𝐹𝑖 and 𝐵̂𝑖,𝑘 = ℑ𝑖 𝐵𝑖,𝑘 . The changed diffusion term comes as 𝑔̂𝑖𝑖 = ℑ2𝑖 𝑔𝑖𝑖 . By
using the expression of Theorem 2 we have:



                                                                                                                                                                     45
                                                                       1    ̂𝑒𝑥 (𝑗|𝑖 ) 𝜕𝑅̂𝑖
                                                                           𝜕𝑃𝑟
                                                𝑇(𝑋̂𝑗 → 𝑋̂𝑖 ) = 𝐸 [ 𝜌̂        𝜕𝑋̂𝑖     𝜕𝑋̂𝑗
                                                                                            ]                            (A.18)
                                                                      𝑗|~𝑗


                         ̂) refer to quantities obtained with the changed variables. Then we take into account
where hatted quantities (…
      1     ℑ     𝜕      1 𝜕
that:    = 𝑗 ,        =        ̂𝑒𝑥 (𝑗|𝑖) = Prob( 𝑢̂𝑗 ≥ 𝑋̂𝑗 |𝑋̂𝑖 ) = Prob( 𝑢𝑗 ≥ 𝑋𝑗 |𝑋𝑖 ) = 𝑃𝑟𝑒𝑥 (𝑗|𝑖) and 𝜕 = 1 𝜕 .
                             , 𝑃𝑟
      ̂ 𝑗|~𝑗
      𝜌        𝜌𝑗|~𝑗   𝜕𝑋̂𝑗   ℑ𝑗 𝜕𝑋𝑗                                                                              𝜕𝑋̂𝑖   ℑ𝑖 𝜕𝑋𝑖
                                               ̂ )
                                       1 𝜕 log(𝜌   1 𝜕𝑔̂                             ̂ )
                                                                               𝜕 log(𝜌   1 𝜕 log(𝜌~𝑗 )   1 𝜕 log(ℑ𝑖 )
Furthermore, we have 𝑅̂𝑖 = 𝐹̂𝑖 − 𝑔̂𝑖,𝑖 2 𝜕𝑋̂ ~𝑗 − 2 𝜕𝑋̂𝑖,𝑖 . There, recall that 𝜕𝑋̂ ~𝑗 = ℑ     𝜕𝑋𝑖
                                                                                                       − ℑ𝑖 𝜕𝑋𝑖
                                                                                                                      and
                                               𝑖         𝑖                           𝑖    𝑖
𝜕𝑔̂𝑖,𝑖   1 𝜕ℑ2𝑖 𝑔𝑖,𝑖     𝜕𝑔              𝜕 log(ℑ𝑖 )                             1     𝜕 log(ℑ𝑖 )                     𝜕𝑅̂
   ̂
       =             = ℑ𝑖 𝑖,𝑖 + 2ℑ𝑖 𝑔𝑖,𝑖           , which yields 𝑅̂𝑖 = ℑ𝑖 (𝑅𝑖 − 𝑔𝑖,𝑖            ) and the derivative ̂ 𝑖 =
𝜕𝑋𝑖      ℑ𝑖 𝜕𝑋𝑖          𝜕𝑋𝑖                𝜕𝑋𝑖                                 2        𝜕𝑋𝑖                         𝜕𝑋𝑗
ℑ𝑖 𝜕𝑅𝑖   1 𝜕𝑔𝑖,𝑖 𝜕 log(ℑ𝑖 )
  (    −                    ). Then, plugging all the terms into 𝑇(𝑋̂𝑗 → 𝑋̂𝑖 ), we get the result.
ℑ𝑗 𝜕𝑋𝑗   2 𝜕𝑋𝑗      𝜕𝑋𝑖




Appendix B Technical Details about the RET estimation methods

B.1. The fitting of nonlinear models with multiplicative noise

In order to fit the model, let us consider the empirical 𝑋𝑖 time-derivatives, 𝑋̇𝑖 ≡ [𝑋𝑖 (𝑡 + 𝑑𝑡) − 𝑋𝑖 (𝑡)]/𝑑𝑡, obtained
with, either successive ensemble realizations at a particular instant 𝑡 or taken from a single time-series in the ergodic
case.

Referring to [33], one can find the minimum mean square difference between 𝑋̇𝑖 and 𝐹𝑖 by applying ordinary
multivariate linear regression yielding the fitted matrix of parameters through the matrix product:
                                                 ̂𝐹 = 𝐂Ψ,Ψ
                                                 𝛉     −1
                                                           𝐸(𝚿𝐗̇ 𝑇 )                                                      (B.1)
        −1
where 𝐂Ψ,Ψ  is the inverse of the matrix of averaged function products 𝐂Ψ,Ψ(𝑟,𝑠) = 𝐸(Ψ𝑟 Ψ𝑠 ) and matrix
𝐸(𝚿𝐗̇ ) contains the average product entries 𝐸(𝚿𝐗̇ 𝑇 )(𝑟,𝑠) = 𝐸(Ψ𝑟 𝑋𝑠̇ ), where 𝚿 = (Ψ1 , … . )𝑇 .
     𝑇


The fitting of the multiplicative noise is obtained from the residuals 𝜀𝑖 = 𝑋̇𝑖 − ∑𝑙 𝜃̂𝐹,𝑙,𝑖 Ψ𝑙 (𝐗). By dealing with the
                                               𝑔𝑖𝑖 𝑊𝑖2
stochastic equation, their squares are 𝑑𝑖 = 𝜀𝑖2 =𝑑𝑡
                                                       , filling the vector 𝐝 and where 𝑊𝑖 ~𝑁(0,1) are independent
white standard Gaussian noises. After multiplying 𝜀𝑖2 by the positive basis-functions Φ𝑙 and taking average, we
obtain a linear system of equations in terms of the parameters 𝜃𝑔,𝑙,𝑖 . Therefore, the matrix of fitted parameters is
obtained as:
                                                 ̂𝑔 = 𝑑𝑡 𝐂Φ,Φ
                                                 𝛉        −1
                                                              𝐸[𝚽𝐝𝑻 ]                                                     (B.2)
         −1
where 𝐂Φ,Φ    is the inverse of the matrix 𝐂Φ,Φ of averaged function products used to fit the diffusivities and
(𝑟, 𝑠) −entries of matrix 𝐸[𝚽𝐝𝑻 ] are the expectation products 𝐸(Φ𝑟 𝜀𝑠2 ). The fitting is consistent only if 𝜃̂𝑔,𝑙,𝑖 .

The simplest example of 1D model with both a deterministic and a multiplicative noise part depending on one
function each is
                                                                                                     1/2
               𝑥̇ 𝑑𝑡 = 𝑥(𝑡 + 𝑑𝑡) − 𝑥(𝑡) = [𝜃𝐹,0 + 𝜃𝐹,1 Ψ(𝑥(𝑡))]𝑑𝑡 + √𝑑𝑡[𝜃𝑔,0 + 𝜃𝑔,1 Φ(𝑥(𝑡))]               𝑊(𝑡)           (B.3)

where 𝑊(𝑡)~𝑁(0,1) is a standard Gaussian white noise.

The fitted parameters are:

                                       𝜃̂𝐹,0 = 𝐸(𝑥̇ ) − 𝜃𝐹,1 𝐸(Ψ)                                                        (B.4a)


                                                                                                                            46
                                                                             𝑐𝑜𝑣(𝑥̇ ,Ψ)
                                                                     𝜃̂𝐹,1 = 𝑣𝑎𝑟(Ψ)                                                   (B.4b)

The square errors of the tendency are 𝜀 2 = 𝑥̇ − [𝜃̂𝐹,0 + 𝜃𝐹,1 Ψ(𝑥)] from which one infers:

                                                             𝜃̂𝑔,0 = 𝑑𝑡 𝐸(𝜀 2 ) − 𝜃𝑔,1 𝐸(Φ)                                           (B.5a)
                                                                                𝑐𝑜𝑣(𝜀 ,Φ) 2
                                                                      𝜃̂𝑔,1 = 𝑑𝑡 𝑣𝑎𝑟(Φ)                                               (B.5b)

B.2. The Predictor-Corrector scheme

The stochastic differential equations are integrated in time using the predictor-corrector scheme described by the
steps below:
                                                      ∗
                                                     𝑋𝑖,𝑡+𝑑𝑡 = 𝑋𝑖,𝑡 + 𝑑𝑡 𝐹𝑖 (𝐗 𝑡 ) + √2𝑑𝑡 𝐵𝑖 (𝐗 𝑡 )𝑊1,𝑡                                (B.6)
                                                      ∗∗
                                                     𝑋𝑖,𝑡+𝑑𝑡 = 𝑋𝑖,𝑡 + 𝑑𝑡 𝐹𝑖 (𝐗 ∗𝑡 ) + √2𝑑𝑡 𝐵𝑖 (𝐗 ∗𝑡 )𝑊2,𝑡                              (B.7)
                                                                         1∗         ∗∗
                                                              𝑋𝑖,𝑡+𝑑𝑡 = (𝑋𝑖,𝑡+𝑑𝑡 + 𝑋𝑖,𝑡+𝑑𝑡 )                                           (B.8)
                                                                       2
        ∗        ∗∗
where 𝑋𝑖,𝑡+𝑑𝑡 , 𝑋𝑖,𝑡+𝑑𝑡 are preliminar estimates of 𝑋𝑖 at time 𝑡 + 𝑑𝑡 and 𝑊1,𝑡 , 𝑊2,𝑡 are independent realizations of
standard Gaussian white noise processes.

Appendix C List of Symbols and achronyms

𝐵𝑖,𝑘                                                     noise-diffusion coefficients merged in matrix 𝐁
𝑑𝐻𝑋𝑖        𝑑𝐻𝑋𝑖                𝑑𝐻𝑋𝑖
         ,(           ) ,(             )                 Rate of entropy change (REC) and its deterministic and stochastic parts.
 𝑑𝑡             𝑑𝑡     𝐹         𝑑𝑡     𝑔

 𝑑𝐻𝑋𝑖                𝑑𝐻𝑋𝑖              𝑑𝐻𝑋𝑖
(        ) ,(               )      ,(           )        Stochastic part of the rate of entropy change (REC) and its additive and
    𝑑𝑡      𝑔         𝑑𝑡     𝑔,𝑎           𝑑𝑡    𝑔,𝑚
                                                         multiplicative noise parts
𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓           𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓            𝑑𝐻𝑋𝑖 ,𝑠𝑒𝑙𝑓
    𝑑𝑡
                ,(      𝑑𝑡
                                  ) ,(          𝑑𝑡
                                                        ) Self entropy generation (SEG) and its deterministic (D-RET) and stochastic (S-RET)
                                   𝐹                     𝑔
                                                         parts

𝐹𝑖 , 𝐹𝑖,𝑗                                                component i of the vector 𝐅 of deterministic terms and the part dependent on 𝑋𝑗
                                                         only

ℱ𝑖,~𝑖,𝐹 (𝑋𝑖 ), ℱ𝑖,~𝑖,𝑔 (𝑋𝑖 )                             Specific functions of D-RET 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 and S-RET 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔

ℱ𝑖,𝑗,𝐹 (𝑋𝑖 ), ℱ𝑖,𝑗,𝑔 (𝑋𝑖 )                               Specific functions of the single D-RET and S-RET

𝑔𝑖,𝑖 , 𝑔𝑖,𝑖,𝑗                                            component i,i of the diffusivities, merged in matrix 𝐆 and part dependent on 𝑋𝑗

𝐻𝑋𝑖                                                      Shannon entropy of variable 𝑋𝑖

℘[… ]                                                    Frobenius Perron operator

𝑅𝑖 , 𝑅𝑖,𝑗                                                Component I of the generalized speed and the part dependent on 𝑋𝑗

𝑇(𝑋~𝑖 → 𝑋𝑖 ), 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝐹 , 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑔    Rate of entropy transfer (RET) between the complementary
                                 vector of 𝑋𝑖 and its deterministic (D-RET) and stochastic (S-RET) parts

                                                                                                                                           47
𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑠𝑖𝑛𝑔 , 𝑇(𝑋~𝑖 → 𝑋𝑖 ) 𝑠𝑦𝑛     RETs associated to single RETs and synergies

𝑇(𝑋𝑗 → 𝑋𝑖 ), 𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝐹 , 𝑇(𝑋𝑗 → 𝑋𝑖 ) 𝑔 Single rate of entropy transfer (RET) between the causal variable 𝑋𝑗 and
                                  the consequential variable 𝑋𝑖 and its deterministic (D-RET) and stochastic (S-RET)
                                  parts

𝑋𝑖 , 𝑋~𝑖                         component i of the state vector 𝐗 and its complementary vector

AN                               Analytical-Numerical Method

CSM                              Causal Sensitivity Method

MF                               Model Fitting followed by CSM

ML                               Multivariate Linear Method

MN                               Minimal CSM


References

[1] Pearl, J. (2009) Causality: Models, Reasoning and Inference. 2nd Ed. Cambridge University Press. pp. 484. ISBN
9780521895606

[2] Granger, C. W. J. (1969) Investigating Causal Relations by Econometric Models and Cross-spectral
Methods. Econometrica 37 (3): 424–438. doi:10.2307/1912791

[3] Tirabassi G, Masoller C. and Barreiro M. (2015) A study of the air–sea interaction in the South Atlantic
convergence zone through Granger causality Int. J. Climatol. 35 3440–53. doi.org/10.1002/joc.4218

[4] Bach, E., Motesharrei, S., Kalnay, E. and Ruiz-Barradas, A.(2019) Local atmosphere–ocean predictability:
dynamical origins, lead times, and seasonality. Journal of Climate, 32, 7507–7519. doi.org/10.1175/JCLI-D-18-
0817.1.

[5] Marko, H. (1973) The bidirectional communication theory–a generalization of information theory. IEEE Trans.
Commun., 21, 1345–1351. DOI: 10.1109/TCOM.1973.1091610

[6] Amblard, P.-O.; Michel, O.J.J. (2013) The Relation between Granger Causality and Directed Information Theory:
A Review. Entropy, 15, 113-143. DOI: 10.3390/e15010113

[7] Schreiber, T. (2000) Measuring                information    transfer.   Phys.    Rev.    Lett.,   85(2):461–465.
doi.org/10.1103/PhysRevLett.85.461

[8] Hlavackova-Schindler, K.; Palus, M.; Vejmelka, M.; Bhattacharya, J. (2007) Causality detection based on
information-theoretic approaches in time series analysis. Phys. Rep., 441, 1–46. DOI:
10.1016/j.physrep.2006.12.004

[9] Palus, M, Krakovská, A, Jakubík, J and Chvosteková, M. (2018) Causality, dynamical systems and the arrow of
time. Chaos: An Interdisciplinary Journal of Nonlinear Science, 28(7): 075307. DOI: 10.1063/1.5019944

[10] Runge, J, Bathiany, S, Bollt, E, Camps-Valls, G, Coumou, D, Deyle, E, Glymour, C, Kretschmer, M, Mahecha, MD,
Muoz-Mar, J, van Nes, EH, Peters, J, Quax, R, Reichstein, M, Scheffer, M, Schlkopf, B, Spirtes, P, Sugihara, G, Sun, J,

                                                                                                                    48
Zhang, K and Zscheischler, J. (2019) Inferring causation from time series in earth system sciences. Nature
Communications, 10(1): 2553. DOI: 10.1038/s41467-019-10105-3

[11] Liang, XS and Kleeman, R. (2005) Information transfer between dynamical system components. Phys. Rev. Lett.,
95: 244101. DOI: 10.1103/ PhysRevLett.95.244101

[12] Liang, X.S.; Kleeman, R. (2007a) A rigorous formalism of information transfer between dynamical system
components. I. Discrete mapping. Physica D, 231, 1–9. doi.org/10.1016/j.physd.2007.04.002

[13] Liang, X.S.; Kleeman, R. (2007b) A rigorous formalism of information transfer between dynamical system
components. II. Continuous flow. Physica D, 227, 173–182. https://doi.org/10.1016/j.physd.2006.12.012

[14] Liang, XS. (2014a) Entropy evolution and uncertainty estimation with dynamical systems. Entropy, 16(7): 3605–
3634. DOI: 10.3390/e16073605

[15] Liang, XS. (2014b) Unraveling the cause-effect relation between time series. Phys. Rev. E, 90: 052150. DOI:
10.1103/PhysRevE.90.052150

[16] Liang, XS. (2016) Information flow and causality as rigorous notions ab initio. Phys. Rev. E, 94: 052201. DOI:
10.1103/PhysRevE.94.052201

[17] Liang, XS. (2018) Causation and information flow with respect to relative entropy. Chaos, 28: 075311. DOI:
10.1063/1.5010253

[18] Liang, XS. (2021) Normalized multivariate time series causality analysis and causal graph reconstruction.
Entropy, 23(6). DOI: 10.3390/e23060679

[19] Stips, A., Macias, D., Coughlan, C., Garcia-Gorriz, E., and Liang, X. S. (2016) On the causal structure between
CO2 and global temperature, Scientific Reports, 6, 21691, DOI: 10.1038/srep21691.

[20] Hagan, DFT, Wang, G, Liang, XS and Dolman, HAJ. (2019) A time-varying causality formalism based on the Liang-
Kleeman information flow for analyzing directed interactions in nonstationary climate systems. J. Climate, 32(21):
7521–7537. DOI: 10.1175/ JCLI-D-18-0881.1

[21] Vannitsem, S, Dalaiden, Q and Goosse, H. (2019) Testing for dynamical dependence: Application to the surface
mass balance over Antarctica. Geophysical Research Letters, 46(21): DOI: 12125–12135. DOI:
10.1029/2019GL084329

[22] Docquier, D, Vannitsem, S, Ragone, F, Wyser, K and Liang, X. (2022) Causal links between Arctic sea ice and its
potential drivers based on the rate of information transfer. Geophys. Res. Lett., 49, e2021GL095892, DOI:
10.1029/2021GL095892

[23] Hagan, D. F. T., Dolman, H. A.J., Wang, G., Sian, K. T. C. L. K., and Yang, K. (2022) Contrasting ecosystem
constraints on seasonal terrestrial CO2 and mean surface air temperature causality projections by the end of the
21st century, Environ. Res. Lett., 17, 124019, DOI: 10.1088/1748-9326/aca551.

[24] Vannitsem, S and Liang, XS. (2022) Dynamical Dependencies at Monthly and Interannual Time Scales in the
Climate System: Study of the North Pacific and Atlantic Regions. Tellus A: Dynamic Meteorology and Oceanography,
74(2022), 141–158. DOI: 10.16993/tellusa.44

[25] Docquier, D., Vannitsem, S., and Bellucci, A. (2023) The rate of information transfer as a measure of ocean–
atmosphere interactions, Earth Syst. Dynam., 14, 577–591, DOI: 10.5194/esd-14-577-2023.


                                                                                                                 49
[26] Lorenz, E.N. (1963) Deterministic nonperiodic flow. Journal of the Atmospheric Sciences.20(2): 130–141.
doi:10.1175/1520-0469(1963)020<0130:DNF>2.0.CO;2.

[27] Liang, XS (2013) The Liang-Kleeman Information Flow: Theory and Applications. Entropy2013, 15(1), 327-
360; https://doi.org/10.3390/e15010327

[28] Pires, CA, Perdigão, R.A.P.(2015) Non-Gaussian interaction information: estimation, optimization and diagnostic
application of triadic wave resonance. Nonlinear Processes in Geophysics,22, 87-108. DOI:10.5194/npg-22-87-2015

[29] Pires C.A., Perdigão R.A.P. (2007). Non-Gaussianity and asymmetry of the winter monthly precipitation
estimation from the NAO. Mon. Wea, Rev. Vol 135, pp 430-448. DOI: 1175/mwr3407.1

[30] Feutrill A., Roughan M. (2021) A Review of Shannon and Differential Entropy Rate Estimation.
Entropy 2021, 23(8), 1046; https://doi.org/10.3390/e23081046

[31] Iba, H., Feng, J., and Izadi Rad, H. (2018) GP-RVM: Genetic programing-based symbolic regression using
relevance vector machine. In 2018 IEEE International Conference on Systems, Man, and Cybernetics (SMC), 255-
262. DOI 10.1109/SMC.2018.00054

[32] Angelis A., Sofos, F., Karakasidis, T.E.,(2023) Artifcial Intelligence in Physical Sciences: Symbolic Regression
Trends and Perspectives. Archives of Computational Methods in Engineering (2023) 30:3845–3865
https://doi.org/10.1007/s11831-023-09922-z

[33] Freedman DA (2009) Statistical Models: Theory and Practice. Cambridge University Press. ISBN 978-1-139-
47731-4.


[34] Sardeshmukh P.D. and P. Sura (2009) Reconciling non-Gaussian climate statistics with linear dynamics, Journal
of Climate, vol. 22, no. 5, pp. 1193–1207, 2009. https://doi.org/10.1175/2008JCLI2358.1

[35] Chekroun, M. D., Simonnet E., and Ghil M. (2011) Stochastic climate dynamics: Random attractors and time-
dependent invariant measures. Physica D, 240, 1685–1700, doi:10.1016/j.physd.2011.06.005

[36] Slingo J. and Palmer T. (2011) Uncertainty in weather and climate prediction. Phil. Trans. R. Soc. A, 369 (2011),
pp. 4751-4767 http://dx.doi.org/10.1098/rsta.2011.0161

[37] Peña, M. and Kalnay, E. (2004) Separating fast and slow modes in coupled chaotic systems, Nonlin. Processes
Geophys., 11, 319–327, https://doi.org/10.5194/npg-11-319-2004

[38] Pires, C.A., Vautard, R., Talagrand, O., (1996) On Extending the limits of Variational Assimilation in Nonlinear
Chaotic Systems. Tellus, 48A, p. 96-121. https://www.tandfonline.com/doi/abs/10.3402/tellusa.v48i1.11634

[39] Kehui, S., Sprott, J.C. (2009) Dynamics of a simplified Lorenz system. International Journal of Bifurcation and
Chaos, 19(4), 1357-1366. doi:10.1142/s0218127409023688


[40] Luzzatto S., Melbourne I., Paccaut F. (2005) The Lorenz Attractor is Mixing. Commun. Math. Phys. 260, 393–401.
DOI: 10.1007/s00220-005-1411-9.

[41] Li, Z., Izumida Y. (2023) Thermodynamic efficiency of atmospheric motion governed by Lorenz system.
arXiv:2302.03887v3. https://doi.org/10.48550/arXiv.2302.03887


                                                                                                                   50
[42] Monahan, A. H. (2000) Nonlinear principal component analysis by neural networks: Theory and application to
the Lorenz system, J. Clim., 13, 821 – 835. doi.org/10.1175/1520-0442(2000)013<0821:NPCABN>2.0.CO;2

[43] Kuznetsov, N. V., Mokaev, T. N., Kuznetsova, O. A., & Kudryashova, E. V. (2020) The Lorenz system : hidden
boundary of practical stability and the Lyapunov dimension. Nonlinear Dynamics, 102(2), 713-
732. https://doi.org/10.1007/s11071-020-05856-4

[44] Runge J. Heitzig J., Marwan N., Kurths J. (2012) Quantifying causal coupling strength: A lag-specific measure for
multivariate     time      series    related      to    transfer    entropy.     Phys.     Rev.     E 86,     061121.
https://doi.org/10.1103/PhysRevE.86.061121

[45] Runge J., Nowack, P; Kretshcmer M., Flaxman S., Sejdinovic, D. (2019) Detecting and quantifying causal
associations in large nonlinear time series analysis. SCIENCE ADVANCES, Vol 5, Issue 11, DOI:
10.1126/sciadv.aau4996

[46]Hannachi, A., Unkel S., Trendafilov N.T. and Jolliffe I.T. (2009) Independent component analysis of climate data:
a new look at EOF rotation. Journal of Climate, vol. 22, no. 11, pp. 2797–2812.
https://doi.org/10.1175/2008JCLI2571.1

[47] Pires C.A., Hannachi A. (2017) Independent Component Analysis of the Sea Surface Temperature Variability:
Non-Gaussian Sources and Sensitivity to Sampling and Dimensionality. Complexity, 2017, 3076810, 23 pages.
DOI: 10.1155/2017/3076810

[48] Pires C.A., Ribeiro A. (2016) Separation of the atmospheric variability into non-Gaussian multidimensional
sources by projection pursuit techniques. Climate Dynamics DOI: 10.1007/s00382-016-3112-9.

[49] Docquier D., Di Capua G., Donner R.V., Pires C.A.L., Simon A. and Vannitsem S.(2023) A comparison of two causal
methods in the context of climate analyses. Nonlinear Proc. In Geophysics (submitted).

[50] Liu, Z., and Alexander, M. (2007) Atmospheric bridge, oceanic tunnel, and global climatic teleconnections. Rev.
Geophys., 45, RG2005, doi:10.1029/2005RG000172.




                                                                                                                   51
