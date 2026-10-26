Physica D 458 (2024) 133988
Available online 11 November 2023
0167-2789/© 2023 The Author(s). Published by Elsevier B.V. This is an open access article under the CC BY license (http://creativecommons.org/licenses/by/4.0/).A general theory to estimate Information transfer in nonlinear systems✰
Carlos A. Pires a,*, David Docquier b, St´ephane Vannitsem b
a Universidade de Lisboa, Faculdade de Ciˆencias, Instituto Dom Luiz, Edifício C8, DEGGE, Campo Grande 16, Lisboa, 1749-016, Portugal
b Royal Meteorological Institute of Belgium, Brussels, Belgium
A R T I C L E I N F O
Keywords:
Information flow/transfer
Causality
Entropy budget
Nonlinear synergy
Causal sensitivity
A B S T R A C T
A general theory for computing information transfers in nonlinear stochastic systems driven by deterministic
forcings and additive and/or multiplicative noises, is presented, satisfying quite general boundary conditions in
the state-space: either closed, periodic or satisfying a vanishing probability density function. It extends the Liang-
Kleeman (LK) framework of causality inference to nonlinear cases based on information transfer across system
variables, which is presented in detail in (Liang, 2016. Information flow and causality as rigorous notions ab
initio. Phys. Rev. E, 94: 052201. DOI: 10.1103/PhysRevE.94.052201). We present an effective method of
computing formulas of the rates of Shannon entropy transfer (RETs) between selected causal and consequential
variables, the ‘Causal Sensitivity Method’ (CSM), relying on the estimation from data of conditional expectations
of the system forcings and their derivatives. Those expectations are approximated by nonlinear differentiable
regressions, leading to a much easier and more robust way of computing RETs than the ‘brute-force’ approach
which calls for the computation of numerical integrals over the state-space and the knowledge of the multivariate
probability density function of the system. The CSM is furthermore fully adapted to the case where no model
equations are available, starting with a nonlinear model fitting from data of the consequential variables, with the
subsequent application of CSM to the fitted model. RETs are decomposed into deterministic and stochastic
components, being compensated by the self generation of entropy in ergodic conditions. Moreover, RETs are
decomposed into sums of single one-to-one RETs plus synergetic terms (of pure nonlinear nature) accounting for
the joint causal effect of groups of variables. State-dependent (or specific) RET formulas are also introduced,
puting in evidence where in state-space the entropy transfers and local synergies are more relevant. A com-
parison of the RETs estimations is performed between: 1) the ‘brute-force’, expensive (taken as benchmark),
probability-density-based approach (AN), 2) the CSM-based approach with and/or without model fitting, and 3)
the multivariate linear (ML) approach, in the context of two different models: (i) a model derived from a po-
tential function and (ii) the classical chaotic Lorenz system, both forced by additive and/or multiplicative noises.
The analysis demonstrates that the CSM estimations are robust, cheaper, and less data-demanding than the AN-
reference values in the different experiments, providing evidence of the possibilities and generalizations offered
by the method (e.g. causality diagnostics between subspaces) and opening new perspectives on real-world
applications.
1. Introduction
Causal inference has a long history in a wide range of fields as dis-
cussed for instance in the overview of Pearl [1] from medicine to social
sciences. The nice example put forward by Pearl [1] is the question on
the influence of symptoms on the actual disease of a patient. Finding the
directionality of the influence from the cause to the consequence is
therefore key in answering such type of question, building in that way a
graph of influence from one process to another.
One famous approach to analyze such types of problems is the
Granger’s causality which consists in evaluating whether one variable X,
provides additional predictive power to the forecast of another variable
Y, implying that X is a cause of Y [2]. This approach has been applied in
many different contexts from economy to atmospheric variability [3–4].
Since these early developments, other methods have been designed, in
particular in the context of information theory. In the 1970s, this
✰ Submission to: ‘Physica D: Nonlinear Phenomena’
* Corresponding author.
E-mail address: clpires@fc.ul.pt (C.A. Pires).
Contents lists available at ScienceDirect
Physica D: Nonlinear Phenomena
journal homepage: www.elsevier.com/locate/physd
https://doi.org/10.1016/j.physd.2023.133988
Received 19 July 2023; Received in revised form 10 November 2023; Accepted 10 November 2023
Physica D: Nonlinear Phenomena 458 (2024) 133988
2question was addressed by the development of the directed information
theory [5,6]. Since then, many information-theoretic techniques have
been designed and compared, e.g. Schreiber [7] and
Hlavackova-Schindler et al. [8] . Other approaches based on dynamical
systems theory or connected directed networks have been also devel-
oped in parallel and illustrated in different applications [9,10].
One important development in the conjunction of dynamical systems
theory and information theory has been initiated by Liang and Kleeman
[11]. They developed a theory of the rate of information transfer be-
tween specific variables starting from the fundamental dynamical
equations describing the evolution of the Shannon entropy. The theory
was then considerably expanded in a series of papers by Liang [12–18],
culminating on one side to analytical expressions of the rate of infor-
mation transfer in multivariate systems, and on the other side, to specific
simple expressions that can be used when dealing pragmatically with
time series. The latter developments were done by assuming that the
system underlying the dynamics of the observed data could be approx-
imated by a multivariate linear stochastic system with additive noise
[18], i.e. a multivariate Ornstein-Uhlenbeck process. These tools have,
in particular, considerably been used in the context of climate science
[19–25].
This linear approximation, however, is restrictive as some important
nonlinear interactions could be missed. In the present work, the exten-
sion of the estimation to nonlinear dynamical systems will be addressed.
The main objective is therefore to find a closed formula, to evaluate the
rate of entropy transfer (RET) – equivalent to the rate of information
transfer in Liang-Kleeman’s (LK)’s theory - in nonlinear systems forced
by additive or multiplicative noise that can be robustly estimated from
data (e.g. time-series or time-evolving ensembles), under closed, peri-
odic or pdf vanishing boundary conditions. The main idea is to apply the
hereafter called ‘Causal Sensitivity Method’ (CSM) relying on the
computation of conditional expectations (and their derivatives or sen-
sitivities) of the deterministic and stochastic terms of the model, for a
selected consequential variable.
This applies also to the computation of the Shannon entropy budget
terms, bridging them with the RETs. This raises the important concept of
synergetic causality, coming from the joint effects of groups of variables,
not accounted for in single variable-to-variable RETs. Formulas of RETs
have been obtained for closed or periodic boundary conditions in the
state-space. Open conditions in the state-space call for additional
boundary terms in the entropy budget.
Comparison and validation of the different approaches to estimating
the RETs is performed, namely:
a) The analytical-numerical (AN) method where the model stochastic
equations are known and the probability density function (pdf),
(analytical or estimated from data) is used with ‘brute-force’ in the
integral formula of RET in state-space.
b) The CSM approach developed in the context of this study, based on
conditional expectations (obtained from nonlinear regressions) and
their derivatives with respect to the selected consequential variable.
Here the model equations are supposed to be known.
c) The model fitting (MF), from data, of both the deterministic term and
of the diffusivity coefficients, with subsequent application of the
CSM to the fitted model. Only the evolution equation of the selected
consequential variable is necessary.
d) The multivariate linear (ML) approach proposed in Liang [18],
supposing a multivariate linear model fitting forced by additive
noise.
The analysis is performed in the context of two different models: a
potential model following Liang [16,17] and the famous Lorenz model
[26], where the advantages of the CSM and MF approaches are
exemplified.
Sections 2 and 3 are devoted to the fundamental theory of the en-
tropy budget and the rates of entropy transfer respectively. Section 4
explains the numerical aspects of the different techniques. Section 5
describes the results obtained with the potential model for which one
performs a sensitivity analysis to the presence of linear, and nonlinear
terms and additive or multiplicative noises, as well as with respect to the
time-series length. In Section 6, the approach is also illustrated in the
context of the Lorenz model, with the specific purpose of providing
robust examples of estimations based on data only, and with a particular
interest of trying to obtain good RET estimations from quite short time-
series, simulating real situations of low data availability. Finally in
Section 7, the main results are summarized and discussed, together with
potential extensions of this type of analysis to more complex and higher
dimension systems. Three appendices are added with theoretical proofs,
numerical technicalities and a list of symbols and achronyms.
2. Theory of the entropy budget
Let us consider a D-dimensional stochastic continuous system
described by the state vector X = (X1, …, XD)T (where T stands for
transpose) and a parameter vector θ, which evolves by Euler-Bernstein
equations:
Xi(t + dt) = Xi(t) + Fi(X, θ, t)dt + ∑Dn
k=1
Bi,k(X, θ, t)dWk (1)
where Fi(X, θ, t) are the deterministic terms, a component of the D
-dimensional differentiable vector F. Stochastic forcings are introduced
where dWk ∼̅̅̅̅̅ dt
√ N(0, 1) are independent Gaussian Wiener processes
and Bi,k are noise-diffusion coefficients, merged in the differentiable
matrix B, from which one builts the positive-definite matrix of pdf dif-
fusivities G ≡ BBT with elements gi,j ≡ ∑Dn
k=1 Bi,k Bj,k.
We will hereafter denote by X∼i ≡ (X1, …, Xi 1, Xi+1, …, XD)T the set
of variables different from Xi or its complementary vector, which will be
used to discuss the effect of X∼i, taken as a set of causal variables on Xi
taken as a consequential variable.
In this work, we adopt the approach introduced originally by Liang
[11-18,27], relying upon the concept of Shannon entropy HXi =
E( logρi) of Xi and its rate of change dHXi
dt . In the formula, ρi denotes the
probability density function (pdf) of Xi and E stands for the expectation
operator over the state-space. When the rate is positive (negative), there
is a loss (gain) of information. For Gaussian pdfs, dHXi
dt is the relative rate
of variation of the variance var(Xi) per time unit (e.g. dHXi
dt = 2 means that
variance doubles at every unit of time).
In that framework, one aims to decompose the rate of entropy change
(REC) dHXi
dt as:
dHXi
dt = T(X∼i→Xi) + dHXi,self
dt (2)
where the first term comes from the causal influence of X∼i on Xi or the
rate of entropy transfer (RET) and the second term is the self entropy
generation (SEG), obtained in a process where X∼i is ‘frozen in time’
during a time-step, leading to REC=SEG+RET. This approach follows
the Liang-Kleeman (LK) rationale [27]. However, that time-step can be
short or long thus making the causality diagnostics dependent on the
considered time-scale, with the limit of a permanent ‘freezing’. The way
how to perform the so called ‘removal of causal influence’ remains a
question of debate, despite the numerous causality approaches pre-
sented since decades.
The causality problem (2) was solved for two-dimensional systems
(Theorem 5.1. of Liang [27]) leading to the following rate of entropy
transfer:
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
3T(X2→X1) = T(X∼1→X1) =
=  E
( 1
ρ1
∂F1ρ1
∂X1
)
+ 1
2 E
(
1
ρ1
∂2g1,1ρ1
∂X2
1
) (3)
where X∼1 = X2 is the complementary of vector of X1 in two-
dimensional systems. That RET expression can be generalized to any
dimension D ≥ 3 in the form:
T(X∼i→Xi) =  E
( 1
ρi
∂Fiρi
∂Xi
)
+ 1
2 E
(
1
ρi
∂2gi,iρi
∂X2
i
)
=
= T(X∼i→Xi) F + T(X∼i→Xi) g,
(4)
where T(X∼i→Xi) F and T(X∼i→Xi) g are respectively the determinist
RET (D-RET), subindexed with F, depending on Fi and the stochastic RET
(S-RET), subindexed with g, depending on gi,i. The same subindexes will
be taken along the manuscript for other quantities. The proof of Eq. (4)
(in Appendix A1) comes from the expression of the Frobenius-Perron
operator governing the time evolution of the pdf of Xi when X∼i is
frozen within the period [t,t + dt], by using a similar procedure to that of
Propositions VI.2, VI.3 and VI.4 of Liang in 2016 [16]. Since, the full
state-space is spanned by Xi and X∼i, there are no ‘indirect’ transfers, via
excluded variables.
The rate of variation of HXi (2) is obtained from the Fokker-Plank
equation, governing the time evolution of the pdf ρX of the system:
∂ρX
∂t =  ∑D
j=1
∂FjρX
∂Xj + 1
2
∑D
j,k=1
∂2gj,kρX
∂Xj∂Xk , (5)
by multiplying by  (1 + logρi) and integrating over the state-space
domain. We further indistinctly assume one of the boundary condi-
tions in the state-space: 1) vanishing ρX when ‖ X ‖ →∞ or at the border
of the pdf support set, 2) closed and non-diffusive boundary conditions,
i.e. ρXFi = ∑D
j,k=1
∂gi,kρX
∂Xk = 0 , at borders perpendicular to the Xi direction,
3) periodic boundary conditions at the support set border.
Under those quite generic boundary conditions, we obtain the rate of
entropy change decomposed into the deterministic part (D-REC),
depending on Fi and the stochastic part (S-REC), depending on gi,i as:
dHXi
dt =
(dHXi
dt
)
F
+
(dHXi
dt
)
g
, (6a)
(dHXi
dt
)
F
= E
(∂Fi
∂Xi
)
+ E
[
Fi∂logρ∼i|i
∂Xi
]
, (6b)
(dHXi
dt
)
g
=  1
2 E
[
gi,i
d2logρi
dX2
i
]
, (6c)
where ρ∼i|i is the conditional pdf of X∼i given Xi.
When any of the above considered boundary conditions do not hold,
then extra terms must be added to (6b,6c). For instance, for open
boundary conditions, we must add terms ∮
∂S
ρX[ log(ρi)]F⋅n dl and ∮
∂S
ρX[ 
log(ρi)] 1
2 ∇(∇⋅G)⋅n dl, respectively to
(dHXi
dt
)
Fand
(dHXi
dt
)
g, representing
the externally driven inward (deterministic and diffusive) fluxes of en-
tropy HXi along the border ∂S of the pdf support S in the state-space. In
the expressions, n is the inward unit vector, the dot represents inner
product, ∇ is the gradient operator and dl is the infinitesimal element
of ∂S. Those terms appear, for instance, when a non-null F is imposed by
some external control at the system boundary ∂S as it happens in certain
thermodynamical open systems. An example of that is the case of a mass
of moist air subjected to liquid-evaporation and vapor-condensation and
taking the mass Mv of vapor as a dynamical state variable, which is
lower-bounded by zero (dry conditions) and upper-bounded by the
saturation value. Therefore, the sum of boundary terms contributing to
the budget of Shannon entropy (uncertainty) is 
ρdrylog(ρdry) ˙M˙v,dry + ρsatlog(ρsat) ˙M˙v,sat where ρdry, ρsat are the pdfs at dry
and saturated states respectively, ˙M˙v,dry is the rate of liquid-evaporation
at dry conditions and ˙M˙v,sat is the rate of vapor-condensation at saturated
conditions. That shows that the importation/exportation of entropy at
the boundaries of state-variables can affect the causality. Despite their
great interest, the effect of boundary fluxes in the state-space is out of
the scope of this study and will henceforth not be considered.
Therefore, under closed or periodic boundaries, the S-REC
(dHXi
dt
)
gis
further decomposed as:
(dHXi
dt
)
g
=
(dHXi
dt
)
g,a
+
(dHXi
dt
)
g,m
(7a)
(dHXi
dt
)
g,a
= 1
2 E
[
gi,i
(dlogρi
dXi
)2]
≥ 0 (7b)
(dHXi
dt
)
g,m
=  1
2 E
[gi,i
ρi
d2ρi
dX2
i
]
(7c)
where (7b) and (7c) are, respectively, the additive-noise part of S-REC
and the multiplicative-noise part of S-REC.
(7b) is always non-negative, being an entropy source coming from
the dynamical noise. The term (7c) is zero whenever gi,i is constant (i.e.
under an additive noise). A non-vanishing (7c) value calls for a state
dependent or multiplicative noise.
After taking the difference between (6a) and (4), we obtain the SEG
decomposed in its deterministic and stochastic parts:
dHXi,self
dt = dHXi
dt  T(X∼i→Xi) =
=
(dHXi ,self
dt
)
F
+
(dHXi ,self
dt
)
g
(8)
When we look for the expressions of RET and SEG, it is useful to
decompose Fi and gi,i as:
Fi(Xi, X∼i) =̂ F i(Xi) + Fi,∼i(Xi, X∼i) (9a)
gi,i(Xi, X∼i) =̂ gi,i(Xi) + gi,i,∼i(Xi, X∼i) (9b)
where ̂ Fi,̂ g i,i are exclusive functions of Xi and Fi,∼i, gi,i.∼i are the causal-
depending parts of Fi, gi,i since they contain a cross dependency (from the
point of view of Xi) on X∼i.
2.1. Deterministic part of RET and SEG
For the considered boundary conditions and after some integral
manipulations (e.g. integration by parts), we obtain the D-RET and D-
SEG written respectively as:
• Theorem 1
T(X∼i→Xi) F = E
[
Fi∂logρ∼i|i
∂Xi
]
= E
[
Fi,∼i
∂logρ∼i|i
∂Xi
]
, (10a)
(dHXi ,self
dt
)
F
= E
(∂Fi
∂Xi
)
(10b)
See proof of (10a) in Appendix A2. (10b) is the difference between
(6b) and (10a). From (10a,b), it is clear that D-RET (10a) and D-SEG
(10b) are linear in terms of Fi, i.e. the D-RET and D-SEG of a linear
combination of deterministic terms and diffusivities is the respective
linear combination of D-RETs and D-SEGs.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
4The term (10a), can be interpreted by considering the surprise
function  logρi =  logρ + logρ∼i|i whose averaged value is HXi . The
rate of variation accompanying the state-space evolution is ∂( logρi)
∂t +
∑D
k=1Fk∂( logρi)
∂Xk . The ‘advective’ term due to Fi in the sum is Fi∂( logρi)
∂Xi =
Fi∂( logρ)
∂Xi + Fi∂logρ∼i|i
∂Xi and thus Fi∂logρ∼i|i
∂Xi in (10a) contributes to augment
entropy following the state-space trajectory. Furthermore, only the
parcel of Fi with cross-dependency on X∼i (i.e. Fi,∼i) contributes to the D-
RET.
The entropy generation (10b) is the contribution of Fi for the average
state-space speed divergence. When all the parcels of div(F) ≡ ∑D
k=1
∂Fk
∂Xk
are constant and negative, that leads to the contraction of state-space
volumes and to the decreasing of entropy.
Therefore, the D-RET (10a) can be further written as (proven in
Appendix A3):
T(X∼i→Xi) F = E
[ d
dXi E Fi,∼i⃒⃒ Xi)]
 E
(∂Fi,∼i
∂Xi
)
(11)
The first term of the r.h.s. of (11) is the average derivative with
respect to Xi (or sensitivity) of the conditional expectancy E(Fi,∼i⃒⃒ Xi) of
the causal-depending term Fi,∼i for a given Xi. Moreover, note that (11) is
zero with Fi,∼i changed into ̂ F i. A non-zero inference of causality (11)
means that causes, (through Fi,∼i), are acting in a different way on
different consequence values Xi. For this reason, the application of (11)-
like formulas will be part of the hereafter ‘Causal Sensitivity Method’
(CSM).
Now, recalling that the full expectation decomposes as E(…) =
Ei[E∼i(…|Xi)], we can write (11) as an the average of the specific D-RET,
i.e.:
T(X∼i→Xi) F = E F i,∼i,F
) (12a)
F i,∼i,F(Xi) ≡ d
dXiE∼i
 Fi,∼i⃒⃒ Xi)  E∼i
(∂Fi,∼i
∂Xi⃒⃒⃒⃒ Xi
)
. (12b)
The function (12a) provides information about the states where the
entropy transfer is positive, or negative, and also about its intensity.
A very important point, is the fact that the RET formula (10a) de-
pends explicitly on the pdf (obtained from integration of the Fokker-
Planck equation or estimation from data), whereas the alternative for-
mula (11) depends only on conditional expectancies like E(Fi,∼i⃒⃒ Xi). This
is a key advantage with respect to (10a) because the estimation of (10a)
calls for a ‘brute-force’ and computationally expensive integration over
the state-space, growing exponentially with dimension D whereas (11)
represents a much cheaper approach. There, E∼i(Fi,∼i⃒⃒ Xi) can be esti-
mated from some linear or non-linear fitting of Fi,∼i as a function of Xi by
using an ensemble of realizations of the pdf of the state-vector X, where
the pdf can be either a transient ensemble or a long enough time-series if
ρX is ergodic. Note that E(Fi,∼i⃒⃒ Xi) = E∼i(Fi,∼i⃒⃒ Xi) in which E∼i is the
expectation over the variables X∼i.
A corollary of (11) comes out:
Corollary of Theorem 1
If Fi,∼i = f1(Xi)f2(X∼i), i.e. the deterministic term is multiplicative-
separable in terms of factors depending on Xi and X∼i respectively, then:
T(X∼i→Xi) F = Ei
[
f1
d
dXiE∼i(f2|Xi)
]
(13)
The proof is straightforward since, using (11), we get
Ei
[ d
dXiE∼i(Fi,∼i⃒⃒ Xi)
]
 E
(∂Fi,∼i
∂Xi
)
= Ei
{ d
dXi [f1E∼i(f2|Xi)]
}
 Ei
[
E∼i
(
f2 df1
dXi |Xi
)]
=
Ei
[
f1 d
dXiE∼i(f2|Xi)
]
. The above separation is quite common (e.g. Fi given
by a multivariate polynomial of the variables). From (13), we easily
verify that, if X∼i is statistically independent of Xi, then E∼i(f2|Xi) is
independent of Xi, its derivative is zero and hence (13) vanishes.
Therefore, a non-vanishing D-RET (13) comes from the statistical
dependency on the consequential variable Xi of the causal-dependent
factor f2(X∼i).
Let us give a concrete example of (13) in dimension D = 3, with i =
1, ∼ i = 2, 3 and assuming Fi,∼i = F1,∼1 = X1X2
2 + X2X3, which leads to
T(X∼1→X1) F = E
[
X1
d
dX1
E(X2
2⃒⃒ X1)
]
+E
[ d
dX1
E(X2X3|X1)
] . That needs the estimation of two
conditional expectations E(X2
2⃒⃒ X1) and E(X2X3|X1) and their derivatives
with respect to X1. Thanks to the variable’s separability, the CSM be-
comes a very expeditious and elegant way of computing RETs.
2.2. Stochastic part of RET and SEG
The S-REC (6c) depends on the diffusivity gi,i and how it depends on
Xi and X∼i. The additive-noise part of S-REC (7b) is retained in the S-SEG,
i.e.:
(dHXi ,self
dt
)
g,a
=
(dHXi
dt
)
g,a
= 1
2Ei
[
E gi,i⃒⃒ Xi)(dlogρi
dXi
)2]
≥ 0, (14)
which contributes to increase the entropy. In a random walk process
(14) is the sole entropy budget term, leading to a variance increasing
with a constant time rate gi,i/2.
In what concerns the multiplicative-noise term (7c), it decomposes
as:
(dHXi
dt
)
g,m
=
(dHXi,self
dt
)
g,m
+ T(X∼i→Xi) g (15)
whose expressions are given by:
• Theorem 2
(dHXi ,self
dt
)
g,m
= Ei
(
 d2E gi,i⃒⃒ Xi)
dX2
i
)
(16a)
T(X∼i→Xi) g = 1
2 E
(
1
ρi
∂2gi,i,ρi
∂X2
i
)
= 1
2 E
[
1
ρi
∂2gi,i∼i,ρi
∂X2
i
]
. (16b)
We must note here, that the S-SEG terms (14, 16a) depend uniquely
on the conditional expectation of the diffusivity E(gi,i⃒⃒⃒ Xi), which is an
exclusive function of Xi, independently of any cross-dependency. The
term (16a) is proportional to the concavity of E(gi,i⃒⃒⃒ Xi), through the
second derivative in (16a) (see proof in Appendix A4). The non-
vanishing of the S-RET (16b) calls for a cross-dependency of the diffu-
sivity gi,i, on X∼i. In fact, if gi,i is constant or owns a unique self-
dependency on Xi, then (16b) is zero.
After, some integral manipulations, the S-RET (16b) get a CSM-like
expression:
T(X∼i→Xi)g = 1
2 E
(
∂2gi,i∼i
∂X2
i
)
+ 1
2 E
[ d2
dX2
i
E gi,i∼i⃒⃒ Xi)]
 E
[ d
dXi E
(∂gi,i∼i
∂Xi⃒⃒⃒⃒ Xi
)]
(17)
which depends on the causal sensitivities (first and second derivatives)
of the conditional diffusitivity E(gi,i∼i⃒⃒⃒ Xi) with respect to Xi.
The proof of (17) comes in Appendix A5. Like (11), the formula (17)
has no explicit dependency on the pdf, hence its calculation is rather
cheap.
The specific contribution for the S-RET (17) like for the D-RET in
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
5(12b) is:
F i,∼i,g(Xi) ≡ 1
2 E
(
∂2gi,i∼i
∂X2
i
|Xi
)
+ 1
2 E d2
dX2
i
 gi,i∼i⃒⃒ Xi)  d
dXi E
(∂gi,i∼i
∂Xi⃒⃒⃒⃒ Xi
)
(18)
From (17) we infer the corollary below:
Corollary of Theorem 2
If gi,i,∼i = f3(Xi)f4(X∼i), i.e. the diffusivity is multiplicatively-
separable in terms of factors depending on Xi and X∼i respectively, then
T(X∼i→Xi)g = 1
2Ei
[
f3
d2
dX2
i
E∼i(f4|Xi)
]
(19)
The proof is similar to the one of Corollary of Theorem 1, playing
with second derivatives and separating the factors f3, f4 in the integrals
spanning Xi and X∼i respectively in the expectation operator. The for-
mula (19), like (13) provides a very simple form to compute the S-RET.
2.3. Stationary balance of entropy
If the pdf ρX is stationary, for instance when the system (1) is
autonomous and reaches the ergodic pdf, then the entropy HXi evolves
towards a stationary value and all the terms of dHXi
dt must balance, i.e.
their sum is zero as:
dHXi
dt =
(dHXi,self
dt
)
F
+ T(X∼i→Xi)F +
(dHXi ,self
dt
)
g
+ T(X∼i→Xi)g = 0 (20)
The SEG contributions can be estimated from model equations,
through the expressions of Fi, gi,i and also from the marginal pdf ρi,
estimated from data. The RET terms can be obtained by the CSM ex-
pressions (11,17) from data-estimated conditional expectations on Xi
and their derivatives, which is important to check the correct estimation
of every term. Under additive noise conditions, the D-RET is given by:
T(X∼i→Xi)F = 
(dHXi,self
dt
)
F

(dHXi,self
dt
)
g,a
(21)
Furthermore, In the case of a noise-free dissipative model that moves
to the balance: T(X∼i→Xi)F = 
(dHXi ,self
dt
)
F
> 0.
3. Rate of entropy transfer due to a single variable
3.1. Integral expressions of the RET
Let us now consider the RETs, T(Xj→Xi), j ∕= i, between single vari-
ables as in [16]. The integrated influence of X∼i upon the consequential
variable Xi, through T(X∼i→Xi) cannot in general be split as the sum of
single RETs, T(Xj→Xi), j ∕= i, except when variables in X∼i are condi-
tionally independent with respect to Xi. We will come back to this point
at the end of this section.
Liang [11–18] has established formulas for the deterministic and
stochastic, single contributions of T(Xj→Xi), j ∕= i. We introduce here
alternative formulas to those of Liang, similar to (11–17) and relying on
the CSM approach.
We start with a result (proven in Appendix A6).
• Theorem 3
The rate of entropy transfer T(Xj→Xi) towards the consequential
variable Xi due the influence of the causal variable Xj, j ∕= i, is decom-
posed into a D-RET and S-RET as:
T Xj→Xi) ≡
≡ T Xj→Xi)
F + T Xj→Xi)
g, (22a)
T Xj→Xi) F
= 
∫
RD
ρj|i
∂ Fi ρ∼j
)
∂Xi dX = E
[
Fi ρj|i
ρj|∼j
∂log ρj|i
)
∂Xi
]
, (22b)
T Xj→Xi) g = 1
2
∫
RD
ρj|i
∂2 gi,i ρ∼j
)
∂X2
i
dX
= E
[(
 1
2ρ∼j
∂ gi,i ρ∼j
)
∂Xi
) ρj|i
ρj|∼j
∂log ρj|i
)
∂Xi
] (22c)
where ρ∼j is the pdf of the set of variables different from Xj and ρj|i, ρj|∼j
are conditional pdfs. Liang [16] has obtained T(Xj→Xi) as the difference
between the rate dHXi
dt and the of rate of change of HXi in a process in
which Xj is frozen. The middle terms of (22b,c) are from Liang [16], and
the rightmost ones are the new relationships based on the conditional
pdfs. For the two-dimensional case ρj|i
ρj|∼j
= 1 and T(Xj→Xi) = T(X∼i→Xi).
Moreover, if variables Xj ∕= Xi are statistically independent from the
remaining variables Xk ∕= Xi, Xj, then ρj|i
ρj|∼j
= 1, which is equivalent to the
two-dimensional case spanned uniquely by the causal and consequential
variables Xj, Xi.
By summing (22b) and (22c), we get a compact formula:
T Xj→Xi) = E
[
Ri ρj|i
ρj|∼j
∂log ρj|i
)
∂Xi
]
= E
[
Ri,j
ρj|i
ρj|∼j
∂log ρj|i
)
∂Xi
]
(23a)
Ri = Fi  1
2ρ∼j
∂ gi,i ρ∼j
)
∂Xi = Fi  gi,i
1
2
∂log ρ∼j
)
∂Xi  1
2
∂gi,i
∂Xi . (23b)
where Ri is a generalized speed in state-space composed by the deter-
ministic speed (Fi) and stochastic components, this one, poiting towards
lower pdf values and lower diffusivities (i.e. pointing against the
gradient). Note in (23a) that ∂log(ρj|i)
∂Xi = ∂logcop(i,j)
∂Xi where cop(Xi, Xj) ≡ ρi,j
ρiρj
is
the copula function, expressing the form how variables are interrelated,
independently of the marginal pdfs. The average value of log[cop(Xi, Xj)]
is the mutual information between Xi and Xj. We can shown that (23a)
appears with opposite sign in the budget equation of the copula entropy
 I(Xj, Xi) ≡  E
[
log
( ρi,j
ρiρj
)]
, which is the opposite of the mutual infor-
mation, and thus the RET is an indirect entropy transfer, via the copula
entropy.
The use of D-dimensional integrals for estimating the RETs like
(23a), calls for the estimation of the pdf of the system. This can be
difficult due to data restrictions and sampling, even for moderately low
dimensions. Moreover, the state-space discretization and bounding
required for the numerical computation of the integrals represents an
additional source error. This will be further illustrated in Sections 5 and
6 when computing RETs for two different models.
There are alternative integral formulas for the RETs containing less
sources of errors, which relies on the sensitivities (derivatives) of Fi, gii
with respect to Xj, agreeing with the Theorem below, proven in Ap-
pendix A7:
• Theorem 4
T Xj→Xi) = E
[ 1
ρj|∼j
∂Prex(j|i)
∂Xi
∂Ri
∂Xj
]
(24)
where we use the conditional exceedance probability of Xj given Xi:
Prex(j|i) ≡ Prob( uj ≥ Xj⃒⃒ Xi) =
∫+∞
Xj
ρj|i(uj⃒⃒ Xi)duj = 1  Pr(j|i). Its deriva-
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
6tive in (24) is ∂Prex(j|i)
∂Xi = ∫+∞
Xj
∂ρj|i(uj|Xi)
∂Xi duj = = ∫+∞
Xj
ρj|i
∂logρj|i
∂Xi duj which van-
ishes if Xj and Xi are statistically independent.
The sensitivity of the generalized speed Ri (23b) with respect to the
causal variable Xj appearing in (24) is:
∂Ri
∂Xj = ∂Fi
∂Xj  1
2
∂gi,i
∂Xj
∂log ρ∼j
)
∂Xi  1
2
∂2gi,i
∂Xj∂Xi (25)
Splitting the first, second and third terms leads to corresponding
formulas for the D-RET T(Xj→Xi) F and S-RET T(Xj→Xi) g as:
T Xj→Xi) F = E
[ 1
ρj|∼j
∂Prex(j|i)
∂Xi
∂Fi
∂Xj
]
(26a)
T Xj→Xi) g
= E
[
1
ρj|∼j
∂Prex(j|i)
∂Xi
(
 1
2
∂gi,i
∂Xj
∂log ρ∼j
)
∂Xi  1
2
∂2gi,i
∂Xj∂Xi
) ] (26b)
Let us interpret heuristically the sign of T(Xj→Xi) in (24). A positive
value of T(Xj→Xi) is favoured by ∂Prex(j|i)
∂Xi and ∂Ri
∂Xj having the same sign. In
particular, ∂Prex(j|i)
∂Xi > 0 means that for a state-space displacement δXi > 0,
the tail (or exceedance) probability Prob( uj ≥ Xj⃒⃒ Xi) is larger, and thus
values greater than Xj are more likely, i.e. δXi > 0 drives δXj > 0.
Furthermore, if ∂Ri
∂Xj > 0, that induces a variation δRi
δXi = ∂Ri
∂Xj
δXj
δXi > 0 and
therefore contributes positively to the divergence of the generalized
speed and in analogy with (10b) to an increase of HXi .
Given the dependence on the sensitivity term ∂Ri
∂Xj in (25), we have the
following corollary:
Corollary of Theorem 4
Only the additive terms of Ri in (8), depending explicitly on
Xj contribute to T(Xj→Xi) and therefore Ri can be substituted in (8) by
Ri,j ≡ Fi,j  1
2ρ∼j
∂ gi,i,j ρ∼j
)
∂Xi = Fi,j  gi,i,j
1
2
∂log ρ∼j
)
∂Xi  1
2
∂gi,i,j
∂Xi (27)
where Fi,j, gi,i,j (like 9a,b) is the sum of the additive terms of Fi, gi,i that
depend on Xj, i.e. satisfying ∂Fi
∂Xj = ∂Fi,j
∂Xj and ∂gi,i
∂Xj = ∂gi,i,j
∂Xj . For instance for D=3,
if F1 = X1X2 + X2
2 + X1X3, then F1,2 = X1X2 + X2
2 and F1,3 = X1X3.
The difference Ri  Ri,j includes all the terms not depending on Xj, in
particular the diffusion speed, under additive noise, i.e. the term 
gi,i1
2
∂log(ρ∼j)
∂Xi in (27). In the case of additive or self-dependent multiplica-
tive noise, we have Ri,j = Fi,j. The restriction to terms in Ri,j in (27)
simplifies considerably the computation of (24) since many terms can be
discarded. It also shows that all the terms without dependence on Xj
have only an implicit impact on the RET via the shape of the pdf.
3.2. Expressions of the RETs based on the Causal Sensitivity Method
(CSM)
Let us now focus on how (26a,b) can be modified in order to enable a
simple estimation based on conditional expectations, by using the CSM
already used to reach (11–17),
In order to simplify the notation, we split the variables into three
kinds: the causal variable Xi, the consequential variable Xj (the target)
and the remaining outer variables within the state vector, denoted by Xk
where k ≡∼ (j, i) stand for variables different from the pair (Xj, Xi). The
outer space, spanned by Xk can be extended from the null space to any
variable physically possible or in practice those which have plausible
connections to Xj, Xi in a certain context and so Xk spans the contextual
variables, like third-part agents interacting with Xj, Xi.
That outer space also contains all the possible factors that can lead
from Xj to Xi, by any sort of causal mechanism. The average of the
deterministic term and diffusivity along the outer space, for a fixed value
of the consequential variable, takes a very important role in the causality
diagnostics like the RETs. The RET values can even depend crucially on
the extent of the outer space of variables.
Let us denote the overbar quantities as
¯Fi,j ≡ Ek Fi,j|Xi) = E∼(i,j)
 Fi,j|Xi) (28a)
¯gi,i,j ≡ Ek gi,i,j|Xi) = E∼(i,j)
 gi,i,j|Xi) (28b)
where
Ek(⋯|Xi) ≡
∫
Xk
ρk|i (⋯.) dXk =
=
∫
X∼(i,j)
ρ∼(i,j)|i (⋯.) dX∼(i,j)
(28c)
is the conditional expectation to Xi, over the outer space of variables k =
∼ (j,i). Those quantities are bivariate functions of (Xi,Xj). In particular,
in the two-dimensional isolated case (cause, consequence) or in the two-
dimensional equivalent case where the outer variables are totally in-
dependent of Xi, we have ¯Fi,j = Fi,j and ¯gi,i,j = gi,i,j.
For instance, in fluid dynamics, the Reynolds turbulent stresses,
parametrized as a function of large-scale variables Xi, Xj is a conditional
expectation of the form ¯Fi,j.
Let us also denote by Ei(…) and Ej(…) the expectations over the
causal and consequential space respectively and by Ei,j(…) =
Ei[Ej(…)|Xi] the joint average.
Now, we have the CSM equivalent theorem (proven in Appendices
A8 and A9):
• Theorem 5
T Xj→Xi)
F = Ei
[ d
dXiEj ¯Fi,j⃒⃒ Xi)]
 Ei,j
(∂¯Fi,j
∂Xi
)
(29a)
T Xj→Xi)
g = 1
2Ei,j
(
∂2¯gi,i,j
∂X2
i
)
+1
2Ei
[ d2
dX2
i
Ej ¯gi,i,j⃒⃒ Xi)]
 Ei
[ d
dXiEj
(∂¯gi,i,j
∂Xi⃒⃒⃒⃒ Xi
)]
(29b)
where the expectation’s variables are sub-indexed in the expectation
operator, for ease of interpretation.
Equations (29a,b) show that the RETs depend on conditional
consequential averages Ej(…|Xi) of the deterministic terms and diffu-
sivities (averaged over the outer space) and their first and second de-
rivatives with respect to the Xi. The terms in (29a,b) do not vanish in
general because the above used operators: Ej(…|Xi) and d(…)
dXi do not
commute.
The formulas (29a,b) are linear in Fi,j, gi,i,j, and thus the single RETs
coming from a linear combination of deterministic terms or diffusivities
is the linear combination of single RETs produced by each term.
The RET is the average value of the specific rate of entropy transfer
F j(Xi), in analogy with (12, 18) i.e.
T Xj→Xi) = Ei[ F i,j(Xi)], (30)
to which contribute the corresponding determinist and stochastic com-
ponents:
F i,j(Xi) = F i,j,F(Xi) + F i,j,g(Xi) (31a)
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
7F i,j,F(Xi) = d
dXiEj ¯Fi,j⃒⃒ Xi)  Ej
(d¯Fi,j
dXi⃒⃒⃒⃒ Xi
)
(31b)
F i,j,g(Xi) =  d
dXiEj
(∂¯gi,i,j
∂Xi⃒⃒⃒⃒ Xi
)
+ 1
2
d2
dX2
i
Ej ¯gi,i,j⃒⃒ Xi) + 1
2Ej
(
∂2¯gi,i,j
∂X2
i
|Xi
)
(31c)
We must note that the value of F i,j(Xi) is constant for Gaussian pdfs
associated to linear systems but can vary for non-Gaussian pdfs, yielding
to contributions to the rate of entropy that can fluctuate from positive to
negative values depending on Xi.
The formulas (29a,b) have the major advantage as compared with
(26a,b), that its computation does not explicitly require the pdf of the
system. In practice, the terms ¯Fi,j = Ek(Fi,j|Xi), ¯gi,i,j = Ek(gi,i,j|Xi) and
other terms like Ej(¯Fi,j⃒⃒ Xi) and Ej
(∂¯Fi,j
∂Xi⃒⃒⃒ Xi
)
are conditional expectations
with respect to Xi and can be estimated by nonlinear regression using a
certain set of basis functions (e.g. monomials) or by parametrizing the
joint pdfs by Bayesian methods, followed by an estimation of the
average. The regression can be obtained from an ensemble of re-
alizations of state-space trajectories - like time-series – exploring the
ergodic pdf, or a time-evolving transient ensemble where the regression
coefficients vary on time.
Theorem 5 has important corollaries allowing for simple applications
to quite general systems, linear, or nonlinear with additive or multipli-
cative noises with or without cross dependencies. They also provide
relevant information about the rates of entropy transfer in models where
the governing equations are known.
Corollary 1 of Theorem 5
If Fi,j = AijXj = ¯Fi,j where Aij is constant, i.e. the deterministic term is
linear with respect to the causal variable Xj, then
T Xj→Xi)
F = AijEi
[ d
dXiEj Xj⃒⃒ Xi)]
(32)
The systems verifying that condition can even depend nonlinearly
both on Xi and variables Xk, k ∕= i, j. The proof is straightforward, since
∂¯Fi,j
∂Xi = 0 and Ej(¯Fi,j⃒⃒ Xi) = AijEj(Xj⃒⃒ Xi). Then the RET comes as
Ei
[ d
dXiEj(¯Fi,j⃒⃒ Xi)
]
= AijEi
[ d
dXiEj(Xj⃒⃒ Xi)
]
providing the result. The result also
applies in particular to linear systems giving rise to:
Corollary 2 of Theorem 5
For a linear system of dimension D:
dX
dt = AX + B dW
dt (33)
where A is a constant matrix and noise is additive, i.e. B is a constant
matrix, the ergodic pdf ρX, is Gaussian with zero average and covari-
ance matrix Cx,x with entries Cij and the rate of entropy transfer is:
T Xj→Xi) = Cij
CiiAij = Cij
Cii
1
det Cx,x
) ∑D
l=1
Cd(i),lΔlj, (34)
where the (i, j) entry of A is Aij = ∂Fi
∂Xj; Cd(i),l is the covariance between dXi
dt
and Xl (l = 1, .., D) and Δlj is the (l, j) cofactor-entry of Cx,x. In the ergodic
Gaussian (zero mean) case, we have Ej(Xj⃒⃒ Xi) = Cij
CiiXi and thus d
dXiEj(Xj⃒⃒ Xi)
= Cij
Cii. After using (32), we get the middle term of result (34), recovering
the result of Eq. (14) of Liang [18].
The last equality is obtained by taking the matrix right hand side
product of dX
dt with XTin (33), followed by the expectation operator.
Recalling that E dw
dt XT) = 0, we obtain the covariance matrix between
time derivatives of the state vector and X as CdX
dt ,x = E dX
dt XT) =
AE(XXT) = ACx,x. Then A = CdX
dt ,xC 1
x,x with (35) following from the fact
that (C 1
x,x )lj = 1
det(Cx,x)Δlj. This applies when variables are not redundant
making sure the invertibility of Cx,x.
In the particular case of a two-dimensional linear system driven by
additive noise, we have, after computing the cofactors, the Liang [15]
result:
T Xj→Xi) = CiiCijCj,d(i)  C2
ijCi,d(i)
C2
iiCjj  CiiC2
ij
(35)
A very important corollary of Theorem 5, based on the CSM is the
case where the deterministic terms of Fi,j and diffusivity terms of gi,j
have a separate product dependence between the causal variable and the
remaining variables, leading the following result (proven in Appendices
A10 and A11):
Corollary 3 of Theorem 5
For the separable case Fi,j = f1(Xj)f2(Xi, Xk) and gi,i,j = f3(Xj)f4(Xi,Xk),
where f1, f2, f3, f4 are certain continuous differentiable functions, the
RET simplifies as:
T Xj→Xi)
F = Ei
[
Ek(f2|Xi) d
dXiEj(f1|Xi)
]
(36a)
T Xj→Xi)
g = 1
2Ei
[
Ek(f4|Xi) d2
dX2
i
Ej(f3|Xi)
]
(36b)
Those values correspond to averages of specific RETs: F i,j,F(Xi) =
Ek(f2|Xi) d
dXiEj(f1|Xi) and F i,j,g(Xi) = 1
2Ek(f4⃒⃒ Xi) d2
dX2
i
Ej(f3⃒⃒ Xi) respectively for
(36a) and (36b). The result can be extended as follows when separability
works for f2 and f4:
Corollary 4 of Theorem 5
In the particular case Fi,j = f1(Xj)f2a(Xi)f2b(Xk), then:
T Xj→Xi)
F = Ei
[
f2a(Xi) Ek(f2b|Xi) d
dXiEj(f1|Xi)
]
(37a)
In a similar way, for gi,i,j = f3(Xj)f4a(Xi)f4b(Xk), we get:
T Xj→Xi)
g = 1
2Ei
[
f4a(Xi) Ek(f4b|Xi) d2
dX2
i
Ej(f3|Xi)
]
(37b)
The above closed formulas should be applied to each term of the
deterministic part and diffusivity. These relations constitute the prac-
tical basis of the CSM for the single rates of entropy transfer.
Let us give a concrete example in a 3D system to compute T(X2→X1)
where
F1 = exp(X1)sin(X2) + X1X3 (38a)
g1,1 = (X3  X1X2)2 = X2
3 + X2
1X2
2  2X1X2 ≥ 0 (38b)
The first step is to obtain F1,2 = exp(X1)sin(X2) and g1,1,2 = X2
1X2
2 
2X1X2 to which we apply (37a,b), obtaining:
T(X2→X1)F = E1
{
exp(X1) dE2(sin(X2)|X1)
dX1
}
(39a)
T(X2→X1)g = 1
2E1
[
X2
1
d2E2
 X2
2⃒⃒ X1
)
dX2
1
 2X1
d2E2(X2|X1)
dX2
1
]
(39b)
3.3. Causal synergies and rates of entropy transfer
At the beginning of Section 3.1, the problem of relating the global
RET T(X∼i→Xi) with the RET between pairs of variables was posed. In
order to figure out the link between these different quantities, we
consider the simplest situation of dimension D = 3 (without loss of
generality) and a multiplicatively separable deterministic term F1(X1,X2,
X3) = f1(X1)f2(X2)f3(X3). Then, applying (13), the RET T(X∼1→X1) is:
T(X∼1→X1) F = T X2,3→X1
) F = E1
[
f1
d
dX1
E2,3(f2f3|X1)
]
(40)
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
8Now, let us decompose the averaged conditional product as
E2,3(f2f3⃒⃒ Xi) = E2(f2|Xi)E3(f3⃒⃒ X1) + cov(f2, f3⃒⃒ X1), i.e. the product of con-
ditional expectations plus the conditional covariance. Next, after taking
the derivative and applying the single RET expression (37a), we get:
T(X∼1→X1) F
= T X2,3→X1
) F = T X2,3→X1
) F,sing + +T X2,3→X1
) F,syn
(41a)
T X2,3→X1
) F,sing
= T(X2→X1) F + T(X3→X1) F
(41b)
T X2,3→X1
) F,syn = E1
[
f1
d
dX1
cov(f2, f3|X1)
]
(41c)
which shows that, the joint RET is the sum of single RETs (41b) plus a
synergetic term (41c) related to the conditional covariance between the
functions of the complementary variables X2, X3. The same procedure
can be replicated for multiple variables putting into evidence the effect
of synergies of couples, triplets and other groups of variables which are
accounted for in multivariate forms of the mutual information, like the
Interaction Information for triplets [28].
The sum of single RETs equals the global RET when all the non-
consequential variables are conditionally independent with respect to
the consequential variable.
This led us to present the concept of synergetic rate of entropy
transfer as the difference between the global RET and the sum of single
RETs and the corresponding deterministic and stochastic contributions:
T(X∼i→Xi) syn
= T(X∼i→Xi)  ∑
j∕=i
T Xj→Xi)
= T(X∼i→Xi)F,syn + T(X∼i→Xi)g,syn
(42a)
T(X∼i→Xi) sing = ∑
j∕=i
T Xj→Xi)
= T(X∼i→Xi) F,sing + T(X∼i→Xi) g,sing
(42b)
For linear systems the deterministic synergetic RET vanishes, though
this is not a sufficient condition of linearity.
3.4. Rate of entropy transfer between transformed variables
We address in this section the problem of how variable changes can
affect the values of T(Xj→Xi). Ideally, in a naive view, any independent
variable changes should not influence the RET because the causality
only depends on the link between variables and not on how variables or
processes are represented, in particular the physical units.
The next theorem checks in a rigorous manner, the effect of one-to-
one diffeomorphism variable-changes in the rate of entropy transfer. For
that, let us consider new variables ̂ Xi,̂ Xj,̂ Xk defined in a union of open
intervals (eventually not connected), which are functions respectively of
Xi, Xj, Xk, where k ≡∼ (j, i) stands for variables different from j, i and
where, without loss of generality, all the jacobians are strictly positive, i.
e. ℑi ≡ d̂ X i
dXi > 0, ℑj ≡ d̂ X j
dXj > 0, ℑk ≡ d̂ X k
dXk > 0. Then, we have the following
result proven in Appendix A12.
• Theorem 6
The rate of entropy transfer (RET) between one-to-one diffeo-
morphism variable changes is:
T̂ X j→̂ X i) = T Xj→Xi) + T Xj→Xi)
tr (43a)
T Xj→Xi)
tr =  1
2 E
[ 1
ρj|∼j
∂Prex(j|i)
∂Xi
∂gi,i
∂Xj
dlogIi
dXi
]
= Ei
{dlogIi
dXi
[ d
dXiEj gi,i,j⃒⃒ Xi)  Ej
(∂gi,i,j
∂Xi⃒⃒⃒⃒ Xi
)]} (43b)
The result (43b) shows that the RET correction T(Xj→Xi)tr is a unique
function of the diffusion term, being the deterministic part of T(Xj→Xi)
kept invariant for any one-to-one diffeomorphisms of variables. Only the
stochastic RET can change, being invariant when any of the factors in
(43b) vanish, i.e.: the noise is additive or multiplicative without cross
dependencies, i.e. ∂gi,i
∂Xj = 0 or when the variable transformation Xi→̂ Xi is
affine (translation and scaling) leading to ∂logℑi
∂Xi = 0. This guarantees the
RET invariance under quite generic conditions. This is a revision of
Remark 1 of Theorem III.3 of Liang [17], showing that in certain con-
ditions, it is possible to make invertible changes of the consequential
variable, keeping the value of the entropy transfer. The variables ̂ Xk
where k ≡∼ (j, i) can additionally be an invertible mixture of Xk, since
ρj|∼j is preserved by that transformation. The r.h.s. of (43b) shows that
the correction, due to the variable change is obtained by conditional
expectations of the diffusivity. The result (43b) can be important for the
RET estimation, since certain variable changes can make the pdf
simpler, as for instance Gaussian anamorphoses of the single variables
[29] where ̂ Xi,̂ Xj,̂ Xk are such that the marginal pdfs follow a standard
Gaussian pdf, though the multivariate pdf is not necessarily Gaussian.
When the variable changes are not injective, the problem is more
complicated. For instance, for Xi→̂ Xi = X2
i we have the entropy
H(X2
i ) = H(Xi) + E(log|2Xi|)  H(Xi⃒⃒ X2
i ), where H(Xi⃒⃒ X2
i ) is the entropy of
inverse images of the transformation, which vanishes in the case of
injective variable changes. This problem is not addressed here.
4. Numerical approach to the computation of RETs
The estimation of the rates of entropy transfer (RETs) is a more
complicated task than the estimation of the single, multivariate and
conditional entropies, for which numerous estimators exist in the liter-
ature as seen in the review [30]. The main difficulty comes from the RET
dependency, not only on the pdfs and conditional pdfs (like the entropy)
but also on the partial derivatives of pdfs (10a, 23a). The later can be
difficult to evaluate, especially if pdfs display abrupt changes or their
support set has a fractional Hausedorff dimension as in strange chaotic
attractors, leading to non-differentiable pdfs (albeit some pdf pro-
jections like marginal pdfs can be differentiable). This difficulty is
alleviated if enough (in intensity) stochastic forcing noise is added to the
evolution equations of deterministic chaotic systems, thus producing
non-vanishing pdf values at the fractal gaps of the strange attractors.
Therefore, the estimation of pdf derivatives by finite differences call for
the prescription, both of the full pdf and of conditional pdfs along a
regular grid of the state-space. This constraint call for the estimation of
RET integral formulas using integrals over the pdf, as used by Liang in
[16,17], which will be considered as a benchmark to compare with the
CSM approach.
Therefore, in testing the methods to evaluate the rate of entropy
transfer, T(Xj→Xi), (i, j = 1, …D, i ∕= j), four different approaches are
considered: the Analytical-Numerical (AN) approach which consists in
using the direct estimations of the probabilities and integrals over the
pdfs, the Causal Sensitivity Method (CSM), the Model Fitting (MF) fol-
lowed by application of CSM and finaly the Multivariate Linear (ML)
approach of Liang [18], which supposes a linear model fitting and
Gaussian distributed noises. The four methods will be applied into two
low-order models of dimension D = 3 whose equations are known: (1) a
model derived from a potential function [16,17], with some general-
izations to include multiplicative noise, linearity and non-linearity, all
weighted by appropriate parameters and (2) the classical Lorenz chaotic
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
9model [26], driven by additive or multiplicative noise, weighted by
controlled parameters. The details of the four referred approaches are
described below. Sections 5 and 6 present model results.
4.1. Analytical-Numerical (AN) approach
In the first approach, the so called ‘Analytical-Numerical’ (AN), we
evaluate the integrals implicitly in (26a,b). An analytical or a data-
estimated multivariate (3D) pdf as well as the analytical values of the
sensitivities to the causal variable: ∂Fi
∂Xj, ∂gi,i
∂Xj , ∂2gi,i
∂Xj∂Xi are used in the cen-
troids (Xi′, Xj′, Xk′) of equal-volume voxels (3D cells) with sides Δi,Δj, Δk,
respectively in the variables Xi,Xj,Xk, (k ∕= i,j). The indexed voxel (i′,j′,k′)
∈ {1,…,Ni} × {1,…,Nj} × {1,…,Nk} belongs to a regular coarse-grained
grid-mesh of the parallelepipedic subset [Li, Ui] × [Lj, Uj]× [Lk, Uk] of the
state-space in which the bulk of the multivariate pdf lies. In the forth-
coming discretized expressions, we use plica-indices for the respective
variable (e.g. i′ is the index discretizing variable Xi). This method was
used in Liang [16,17] but using integrals of (22b,c).
Recall that in three dimensions, there is only one outer variable k ∕= i,
j. The probability of each voxel (i′, j′, k′) is denoted as P(i′,j′,k′) =̃ ρX(Xi′,Xj′,
Xk′)/Z, where the normalizing constant is Z = ∑Ni
i′=1
∑Nj
j′=1
∑Nk
k′=1̃ ρX(Xi′,Xj′,
Xk′), such that probabilities sum one altogether and ̃ ρX is prescribed or
estimated. The pdf is estimated as ̃ ρX/(ΔiΔjΔk).
The one- or two-indexed probabilities are sums over the remaining
indices, e.g. P(i′, j′) = ∑Nk
k′=1P(i′, j′, k′), which are necessary to compute
conditional probabilities, like P(j′|i′) = P(i′, j′)/P(i′).
Therefore, by restricting the 3D-integrals of (26a,b) over the boun-
ded domain, we get:
T Xj→Xi) ≈ 
∫Ui
Li
dXi′
∫Uj
Lj
dXj′
∂
∂Xi
⎡
⎢
⎣
∫
Xj′
Lj
ρ Xj’′|Xi′
)dXj’′
⎤
⎥
⎦
∫Uk
Lk
ρ(Xi′Xk′) ∂Ri
∂Xj dXk′ (44)
where ρ stands for pdf. In (44), the derivatives ∂A
∂Xi of a generic quantity A
at the voxel (i′, j′, k′) are estimated by centered differences as δ′i[A]
Δi where
one uses the discretized operator δi′[A] ≡ 1
2 [A(i′ + 1,j′,k′)  A(i′  1,j′,k′)];
while at the interval bounds: i′ = 1, Ni one takes the values at i′ = 2, Ni
 1 respectively.
After the discretization of (44), one obtains:
T Xj→Xi)
≈  1
Δi
∑Ni
i′=1
∑Nj
j′=1
∑Nk
k′=1
δi′
[ ∑j′
j’′=1
P(i′, j’′)
P(i′)
]
P(i′, k′) ∂Ri
∂Xj.
(45)
By using the prescribed analytical expressions values of ∂Fi
∂Xj , ∂gi,i
∂Xj and
∂2gi,i
∂Xj∂Xi to form ∂Ri
∂Xj in (45) at each voxel (i′,j′,k′), the rightmost factor of the
above sum is:
P(i′, k′) ∂Ri
∂Xj = P(i′, k′) ∂Fi
∂Xj  1
2Δi
δi′[P(i′, k′)] ∂gi,i
∂Xj  1
2 P(i′, k′) ∂2gi,i
∂Xj∂Xi (46)
The truncation and discretization errors (due to finite bounds Li, Ui
and non-infinitesimal Δi respectively) committed in the estimated cau-
sality, depends much on the model equations and pdf. For instance, if
[Li, Ui, ] spans n standard deviations around the average Xi, the esti-
mation error εA in the generic average of A(Xi) within the probabilistic
integral, satisfies, after using the Tchebitchev inequality, |εA| ≤ |Aave Aext |
n2 ,
where Aave is the estimated average in the bounded interval and Aext is
the average of A outside the interval [Li, Ui]. In the problem of
computing T(Xj→Xi), the above A quantities are terms of ∂Ri
∂Xj. Therefore,
to minimize |εA|, high enough n must be taken, especially if A(Xi) is
monotonic increasing with a positive power of |Xi|. Moreover, |Li|, |Ui|
increase in the case of fatter pdf tails. As a rule of thumb, at least n = 3
standard deviations must be included in the interval used in the nu-
merical integral. In practice, a stopping criterium for increasing |Li|, |Ui|
and increasing resolution Ni is that the estimated averages of the
highest-order products of variables (e.g. X2
i X2
j ) have corrections smaller
than 1% of that average. The deterministic and noise contributions
T(Xj→Xi)F,AN and T(Xj→Xi)g,AN by AN, are computed and used as
benchmarks for the other methods. The AN method is considered as a
‘brute-force’ method, since it requires the direct computation of the
integrals. This can be a very heavy computation, since the number of
cells in domain integrals increases as a power of the system dimension.
Moreover, the effective implementation increases in complexity with the
dimension.
4.2. Causal Sensitivity Method (CSM)
In the second approach, which we developed in the context of this
analysis, we identify the parts Fi,j and gi,i,j (27) of the deterministic term
Fi and diffusivity gi,i that depends on Xj. Then, in the case, Fi,j and gi,i,j
are composed by additive terms with a separation of the causal variable,
we apply the formulas (36a,b) or (37a,b), which dependent on the
particular form of model equations.
In the application of the CSM, the expectations are computed as
averages over a certain ensemble of different realizations of the model
states. The ensemble can be: 1) a transient ensemble of a large number
Nr of time-evolving states driven by the equations of the model or 2) a
long enough time-series of length Lt with sampling-time Δt, tunned to
uncover the ergodic pdf of the model, with Nr = Lt/Δt realizations. The
RET coming from a very large ensemble (long time-series) or the average
of RETs obtained from shorter ensembles (time-series) can be taken. In
that case, realizations of the estimated RET are obtained by generating a
number of Ns (30 in practice) time-series i.e. obtained with different
noise generator seeds and initial conditions, leading to Ns RET esti-
mations (ensemble members) whose mean and standard deviation over
the sampled realizations are computed. The sensitivity to the time series
length is also studied.
In practice, the values of Fi,j and gi,i,j are calculated for each reali-
zation (ensemble member or instant). One of the assumptions for
applying the CSM formulas (36a,b) or (37a,b) is that the different ad-
ditive terms of Fi,j and gi,i,j can be factorized by factors depending on the
different variables. That happens, for instance, when the deterministic
terms are products of monomials of the different variables Xi, Xj, Xk. For
each term, the single dependent functions of Xi, Xj, Xk are identified,
after which one computes the conditional expectations for a given value
of Xi. Thanks to the product separability of forcings, the regressions are
univariate. There, in general nonlinear regressions are performed in
which we consider a certain set of basis functions (e.g. monomials Xk
i ,
i = 0, …, Nd, up to a certain degree Nd or a set of orthogonal functions,
wavelets, trigonometric functions, polynomial splines over a set of
subintervals of Xi) ranged by decreasing scale (e.g. polynomial order,
wave number). The conditional expectation function must be differen-
tiable to apply CSM with algorithmic expressions for the first and second
derivatives. The most efficient and robust regression depends on the
freedom choice of the basis functions or of the regression formula as a
whole. In this respect, some strategies could be followed: 1) mixing
different basis functions (e.g. polynomials, trigonometric functions,
wavelets); 2) use of machine learning techniques such as Relevance
Vector Machines [31] and 3) use of evolving basis functions towards an
optimal set by using Symbolic Regression [32]. In general, the regression
formula may depend nonlinearly on the fitted parameters.
For the sake of algorithmic simplicity and didactic presentation, we
will restrict our analysis to polynomial basis functions. In the case of
small ensembles or short time-series, the regressions must be accom-
panied by statistical significance tests in order to obtain robust
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
10regressions (e.g. forward step-regression or computation of the Akaike
Information Criterium).
The regression coefficients are fixed for an ergodic pdf or time-
evolving for transient ensembles of the model. For a good perfor-
mance of CSM, the conditional averages like Ek[f(Xk|Xi)] must be accu-
rately estimated as well as their derivatives. Therefore, depending on the
particular RET, Nd must be high enough, such that regressions do not
differ much from the probabilistic averages ∫ ρ(Xk|Xi)f(Xk)dXk along the
interval [Li, Ui]. Too small Nd can lead to biases.
After, calculating the regressions, their first and second derivatives
with respect to Xi are computed as well as the required products and
averages. Then ensemble (or time) averages are taken. If the regressions
are computed using a basis of unbounded functions like monomials, the
regressions as well as the values of the specific RETs F i,j,F(Xi) and
F i,j,F(Xi) can reach (in absolute value) much higher values when Xi is
extrapolated beyond the bounds of the dataset. In those cases, a certain
from of trimmed average (cutting the extremes) can be applied.
The computational complexity of CSM is much lower than in AN,
being thus an excellent alternative to the highly-demanding AN espe-
cially in high dimensionsional systems.
4.3. Model fitting (MF) followed by CSM
The CSM approach assumes known model equations. However, in
practice, both the deterministic terms and diffusivities Fi, gii(i = 1, …, D)
may be partially or totally unknown. In this case, an additional pre-
liminar operation to apply CSM afterwards. This procedure, hereafter
referred as ‘Model fitting followed by CSM’ (MF) is described bellow.
In order to apply the CSM, we suppose that, Fi, gii(i = 1, …, D) are
written as linear combinations of variable-separable basis functions
(including the unity), Ψl, Φl belonging to certain prefixed classes (e.g.
multivariate polynomials). Let us consider the deterministic term
decomposition
Fi(X) = ∑
l
θF,l,iΨl(X) (47a)
Ψl(X) = ∏D
r=1
Ψl,r(Xr) (47b)
and the diffusivity decomposition
gi,i(X) = ∑
l
θg,l,iΦl(X) ≥ 0 (48a)
Φl(X) = ∏D
r=1Φl,r(Xr); θg,l,i, Φl,r ≥ 0 (48b)
where θF,l,i (merged in the matrix θF) and θg,l,i (merged in the matrix θg)
are constant parameters. The corresponding fitted values from data are
denoted respectively as ̂ θF,l,i and ̂ θg,l,i, merged in matrices ̂ θF and ̂ θg.
Like in the case of conditional expectancies, other regression tech-
niques may be applied (e.g. machine learning techniques), paying
attention to the product separability of forcings and algorithmic ex-
pressions of their derivatives. Moreover, robust regressions must be
accompanied by statistical significance tests when the available time-
series are short.
The estimation method is presented in Appendix B1. For instance in
order to fit a linear model, we consider the class of basis-functions
{Ψl(X)} = {1, X1, …, XD}.
Since the RETs of a linear combination of deterministic terms or
diffusivities (47a, 48a) is the linear combination of the RETs driven by
each term, we can write the total RET obtained by MF, as a sum over the
basis-functions as:
T Xj→Xi)
F,MF = ∑
l
T Xj→Xi)
F,MF,l (49a)
T Xj→Xi)
g,MF = ∑
l
T Xj→Xi)
g,MF,l (49b)
By applying the CSM to each contribution (49a,b) and using the
estimated parameters, one has the RETs associated to each basis
function:
T Xj→Xi)
F,MF,l =
=̂ θF,l,i E
[
Ψl,i
d E Ψl,j⃒⃒ Xi)
dXi E
(∏
r∕=i,j
Ψl,r⃒⃒⃒⃒⃒ Xi
) ] (50a)
T Xj→Xi)
F,MF,l =
=̂ θg,l,i
2 E
[
Φl,i
d2 E Φl,j⃒⃒ Xi)
dX2
i
E
(∏
r∕=i,j
Φl,r⃒⃒⃒⃒⃒ Xi
) ] (50b)
Therefore, looking in detail (50a,b), and for each pair (i,j), and basis
function Ψl, Φl, one evaluates first the conditional expectations of the
outer-variable factors. Then, conditional expectations E(Ψl,j⃒⃒ Xi) and
E(Φl,j⃒⃒ Xi) are assessed as well as their first and second derivatives,
respectively. Then, the average products are taken multiplied by the
fitted model coefficients. Finally the sum (49a,b) is calculated. We must
note that the estimation of T(Xj→Xi), calls uniquely for the fitting of the
evolution equation of the consequential variable Xi as a linear combi-
nation of functions of type f1(Xi)f2(Xj)f3(X∼(i,j)), separating causal,
consequential and contextual variables. This fitting depends on the
extension of space in which Xi, Xj are embedded.
The RET estimations may have biases and sampling variances,
coming from: 1) the model fitting through the estimation of time-
derivatives (time-step, difference scheme used), 2) the extent and type
of basis functions used in the model fitting, 3) overfitting of the model
equations, 4) the ensemble size or time-series length, 5) the accuracy of
the nonlinear regressions used to estimate the conditional expectations.
Despite the above constraints, it happens that the CSM and MF ap-
proaches are computationally cheaper and technically easier than the
AN approach, even ih high system dimensions. Test of MF will be
restricted to the Lorenz model here (see Section 6).
4.4. Multivariate linear approach
The multivariate linear (ML) approach uses the formulas obtained by
Liang [18] and covered in (34) where, a multivariate linear model with
additive Gaussian noise is fitted to data, using the maximum likelihood
estimator of the model coefficients, and also minimizing the mean
squared error of the time derivative of Xi. Then, the corresponding RET,
denoted as T(Xj→Xi)F,ML is obtained using the linear fitted model. Since
the fitted model has no multiplicative noise, T(Xj→Xi)g,ML = 0.
The ML approach is equivalent to the CSM approach, when the fitted
model is linear and the regressions used for the conditional expectations
are linear, i.e. the order of the fitting poynomials is Nd = 1. This method
is used to emphasize the limitations of such a linear approach which is
not expected to work as accurately as a nonlinear estimator in strongly
nonlinear situations. Therefore, it is expected that ML works under weak
nonlinearity as will be shown below in examples.
4.5. Summary of the tested methods
Table 1 summarizes the methods of RET estimation, the used models
in this study, the drawbacks, advantages and the computational cost
(raw estimation of the number of simple algebraic operations) of each
method in terms of size parameters: D= state-space dimension, Nv =
Number of voxels (bins) taken in each variable, Nr = Number of
ensemble realizations or time-series values, Nb = Number of basis-
functions or free regression parameters. According to Table 1, compu-
tational complexity grows exponentialy with D in the AN approach
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
11essentially due to the pdf estimation whereas the one of the CSM grows
as a power of D, essentially due to the solution of regression problems.
This shows clearly the much higher efficiency of CSM compared to AN.
5. Potential model
5.1. Model description
The AN computation of RETs was performed by [16,17] on a sto-
chastic potential model. Here, we will make independent estimations on
the same model, adding some generalizations for the validation of three
of the different methods of computing RETs, proposed in Section 4: AN,
CSM and ML methods. The MF will be tested with the Lorenz model in
Section 6.
The generalized potential model used here is described by a three-
dimensional (D = 3) vector X = (X1, X2, X3)T ∈ R3 whose stochastic
differential equations are derived from a potencial function V(X) in the
form:
dXi =  ∂V(X)
∂xi dt + B(X)dWi, i = 1, 2, 3 (51a)
V(X) = 1
2
[αnl X2
1 X2
2 + X2
3X2
2
) + (X1  αlX2)2 + (X2  αlX3)2 + (X3  αlX1)2)]
≥ 0
(51b)
B(X) = [αmV(X) + b2]1/2 ≥ 0 (51c)
where αnl ≥ 0, αl ≥ 0 are parameters weighting the nonlinear and linear
terms respectively of the deterministic terms, which are given by:
F1(X1, X2, X3) =  ∂V
∂X1
=  X1
[αnlX2
2 +  1 + α2
l
)] + αl(X2 + X3) (52a)
F2(X1, X2, X3) =  ∂V
∂X2
=  X2
[αnl X2
1 + X2
3
) +  1 + α2
l
)] + αl(X1 + X3)
(52b)
F3(X1, X2, X3) =  ∂V
∂X3
=  X3
[αnlX2
2 +  1 + α2
l
)] + αl(X2 + X1) (52c)
The stochastic forcing is driven by identical diffusivities gi,i(X) = αmV
+ b2 = B2, i = 1,2,3. The parameters αm ≥ 0, b ≥ 0, give the weight of
the multiplicative and additive noises, respectively. The noises follow
the law: dWi ∼̅̅̅̅̅ dt
√ N(0, 1).
The values αnl = 1, αm = αl = 0, reproduce the same situation
studied by Liang [17]. The parameter αl ∕= 0 produces a cross-linear
symmetric term across the variables whereas αnl = αl = 0 leads to
pure Ornestein-Ulenbeck processes (the equivalent to continuous
red-noise processes).
The stationary solution of the Fokker-Planck Eq. (5) governing the
model pdf is ρX(X1, X2, X3) ≡̂ ρX/Z, with ̂
ρX(X1, X2, X3) =
⎧
⎪⎪⎪⎪⎨
⎪⎪⎪⎪⎩
exp
( 2V
b2
)
, αm = 0
(
V + b2
αm
)
(
1+ 2
αm
)
, αm ∕= 0,
(53)
where Z is the normalization constant such that the integral of ρX over
R3 equals one.
5.2. Formulas of the rates of entropy transfer
From the 6 possible RETs of type T(Xj→Xi), (i,j = 1,2,3, i ∕= j), only
three of them are independent due to the functional symmetries of Fi(X1,
X2, X3) and gi,i(X1, X2, X3) written below:
[F1(X1, X2, X3) = F3(X3, X2, X1) ∧ g1,1(X1, X2, X3) = g3,3(X3, X2, X1)]
⇒[T(X2→X1) = T(X2→X3) ∧ T(X3→X1) = T(X1→X3)]
(54a)
[F2(X1, X2, X3) = F2(X3, X2, X1) ∧ g2,2(X1, X2, X3) = g2,2(X3, X2, X1)]
⇒[T(X1→X2) = T(X3→X2)]
(54b)
Therefore, in practice, we compute only T(X2→X1), T(X1→X2) and
T(X1→X3).
For the implementation of the AN approach and computation of (45),
one requires the sensitivities of the generalized speed Ri with respect to
Xj (25) which can be written for the potential model as:
∂Ri
∂Xj = ∂Fi
∂Xj
(
1  αm
2
)
+ 1
2αmFj∂log ρ∼j
)
∂Xi , (55a)
in which we have used:
∂gi,i
∂Xj =  αmFj (55b)
∂2gi,i
∂XiXj =  αm∂Fi
∂Xj (55c)
The RETs based on the CSM approach are obtained by using the
procedure described in Section 4.2, whose particular forms are given
below.
5.2.1. Formula of T(X2→X1)
Here, the causal variable Xj is X2, whereas the consequential vari-
able Xi is X1 and the single outer variable is Xk = X3 or i = 1,j = 2,k =
3. The terms used in the computation are:
F1,2 =  αnlX1X2
2 + αlX2 (56a)
Table 1
Summary of tested methods with the applied models, drawbacks, advantages and computational cost of the RET estimation.
Method Models used Drawbacks or limitations Advantages Comp. Cost
AN with exact model and
pdf
Potential 1 state-space discretization
2 cut of pdf tails
Exact model and pdf O(ND
v )
AN with exact model and
estimated pdf
Lorenz 1 Cost growing exponentially with
dimension
Inaccuracy of estimated pdf from
ensembles or time-series
Exact model O(ND
v Nr).
CSM Potential and
Lorenz
1 Factorization of forcings and
diffusivities
2 Accuracy dependent on the time-series
length and sampling
1 No explicit pdf needed,
2 Low comp. cost.
3 Nonlinear models
O(D2N3
b Nr)
MF Lorenz fitting of model equations 1 Only time-series
necessary in MF
O(D3N3
b Nr)
ML Potential and
Lorenz
1 Linear model assumption.
2 Inaccurate on highly nonlinear models.
3 Assumption of Gaussian errors.
Very low comp. cost. O(D3Nr)
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
12g1,1,2 = αm
2
[αnlX2
2
 X2
1 + X2
3
) +  1 + α2
l
)X2
2  2αlX2(X1 + X3)] (56b)
Application of (37a,b) to each term of F1,2 and g1,1,2 leads to:
T(X2→X1)F
=  αnlE1
[
X1
dE2
 X2
2⃒⃒ X1
)
dX1
]
+ αlE1
[dE2(X2|X1)
dX1
] (57a)
T(X2→X1)g
= αm
4 E1
{[αnl[X2
1 + E3
 X2
3⃒⃒ X1
)] +  1 + α2
l
)] d2E2
 X2
2⃒⃒ X1
)
dX2
1
}
 2αl E1
{
[X1 + E3(X3|X1)] d2E2(X2|X1)
dX2
1
}
(57b)
The deterministic part (57a) is decomposed into a nonlinear contri-
bution, proportional to αnl and a linear one, proportional to αl whereas
the noise part (57b) is proportional to the multiplicative-noise param-
eter αm.
For the computation of (57a,b) by CSM, we need to assess four
conditional expectations on X1: E2(X2|X1), E2(X2
2⃒⃒ X1), E3(X3|X1),
E3(X2
3⃒⃒ X1) and their first and second derivatives.
5.2.2. Formula of T(X1→X2)
Applying the same procedure as before with i = 2,j = 1,k = 3, leads
to:
F2,1 =  αnlX2X2
1 + αlX1 (58a)
g2,2,1 = αm
2
[αnlX2
2X2
1 +  1 + α2
l
)X2
1  2αlX1(X2 + X3)] (58b)
and:
T(X1→X2)F =  αnlE2
[
X2
dE1
 X2
1⃒⃒ X2
)
dX2
]
+ αlE2
[dE1(X1|X2)
dX2
]
(59a)
T(X1→X2)g = αm
4 E2
{[αnlX2
2 +  1 + α2
l
)] d2E1
 X2
1⃒⃒ X2
)
dX2
2
}
 2αl E2
{
[X2 + E3(X3|X2)] d2E1(X1|X2)
dX2
2
} (59b)
For this specific computation we need three conditional expectations
on X2 namely: E1(X1|X2), E1(X2
1⃒⃒ X2), E3(X3|X2) and their first and sec-
ond derivatives.
5.2.3. Formula of T(X1→X3)
In a similar way with i = 3, j = 1, k = 2 and
F3,1 = αlX1 (60a)
g3,3,1 = g2,2,1
= αm
2
[αnlX2
2X2
1 +  1 + α2
l
)X2
1  2αlX1(X2 + X3)] (60b)
one gets:
T(X1→X3)F = αlE3
[dE1(X1|X3)
dX3
]
(61a)
T(X1→X3)g = αm
4 E3
{[αnl E2
 X2
2|X3
) +  1 + α2
l
)] d2E1
 X2
1|X3
)
dX2
3
 2αl[X3 + E2(X2|X3)] d2E1(X1|X3)
dX2
3
} (61b)
In this case four dependent conditional expectations on X3 are
necessary: E1(X1|X3), E1(X2
1⃒⃒ X3), E2(X2|X3), E2(X2
2⃒⃒ X3) and their first and
second derivatives.
5.3. Results of the experiments
We have computed the RETs for different values of αnl, αl, αm. Three
scenarios were considered:
1) An additive noise scenario with increasing non-linearity controlled
by αnl.
2) A linear scenario with increasing multiplicative noise controlled by
αm.
3) A multiplicative noise scenario with increasing non-linearity
controlled by αnl.
In all validation cases, the pdf is ergodic and the CSM and ML esti-
mates of the RET are obtained using model runs of size Lt = 4000 (and
400) time units corresponding to Nr = 105(104) time-steps dt = Δt =
0.04. Ergodicity was assessed by verifying the similarity of the statistical
properties of independent model runs. The degree of polynomial re-
gressions of the conditional expectations is fixed to Nd = 4 with some
tests using Nd = 2, 8. Model runs are started at X1 = X2 = X3 = 0.01,
using Ns = 30 random seeds for the noise generator. The AN integrals
are estimated in a cube with edges [  U,U],U = 10. This will obviously
limit the pdf tails, but to a relatively low extent. A discretization of Np =
200 points along every edge of the cube is used, leading to a number of
2003 cubic voxels.
5.3.1. Additive noise with increasing non-linearity
Here, wet set αl = 0., b = 1, αm = 0 and αnl ∈ [0, 1], starting with a
linear model (αnl = 0), and then increasing the amplitude of the non-
linearity. The stochastic part of the RET vanishes since the noise is
purely additive and additionally T(X1→X3)F = 0 (61a). The value αnl =
1, reproduces the case studied by Liang [17].
Fig. 1 shows the values of T(X2→X1) and T(X1→X2) computed by
the AN, CSM and ML approaches as a function of αnl. The RETs increase
with the strength of nonlinearity due to nonlinear cross-dependencies. In
this case T(X2→X1)F =  αnlE1
[
X1
dE2(X2
2|X1)
dX1
]
. Despite its explicit linear
dependence on αnl, it increases in a nonlinear way due to the modifi-
cations of the pdf as a function of αnl. One obtains a good estimate with a
quadratic regression of the conditional expectation as shown below.
Therefore,
E2
 X2
2⃒⃒ X1
) ≈ E2
 X2
2
) + cov X2
2, X2
1
)
var X2
1
)  X2
1  E1
 X2
1
)) (62a)
where cov and var stand for covariance and variance, respectively.
Taking the derivative, one gets:
dE2
 X2
2⃒⃒ X1
)
dX1
= 2X1
cov X2
2, X2
1
)
var X2
1
) , (62b)
leading to an estimate of the specific RET:
F 1,2,F(X1) =  αnlX1
dE2
 X2
2⃒⃒ X1
)
dX1
=  2αnlcov X2
2 , X2
1
)
var X2
1
) X2
1 (63)
varying with X1 as expected in nonlinear systems. Its average is
T(X2→X1)F = E1
[F 1,2,F(X1)] ≈  2αnlcov X2
2, X2
1
)
var X2
1
) E1
 X2
1
) (64)
For instance for αnl = 1, we have, cov(X2
2, X2
1) =  0.038, var(X2
1) =
0.348, E1(X2
1) = 0.402, the computation provides T(X2→X1)F ≈0.088,
which is fairly close to T(X2→X1)F,AN = 0.094, which was obtained
independently by [15] .
Fig. 1 show the AN value of RETs (dotted line) and the average (solid
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
13lines) and standard deviation (error bar length) over the 30 seeds of the
RETs obtained by CSM and ML. The AN and CSM values are relatively
close to each other, with a negative slight bias of CSM, lower than
7–10%, valid both for the long time series (Fig. 1a) (Lt = 4000, Nr =
105) and the short time series (Fig. 1b) (Lt = 400, Nr = 104). The dif-
ference is due to estimation errors both in the AN, due to the specific
choices of the interval size U,and its resolution Np and in CSM due to the
regression accuracy. By comparing Fig. 1a-b, we see that the standard
deviation of RETs is approximately proportional to 1 /̅̅̅̅̅̅ Nr
√ , being 5% of
the RET by AN for the long time series. Therefore to achieve an
acceptable error of less than 20%, we must have Lt > 160. The ML es-
timates of T(X1→X2) and T(X2→X1) are close to zero for the tested
nonlinearity weights, which shows that the ML estimates are not able to
detect RETs with those nonlinear terms.
5.3.2. Linear system with increasing multiplicative noise
Here we set αnl = 0, αl = 0.5, b = 1 and αm ∈ [0, 1], starting with a
situation of a pure additive noise (αm = 0). Then, the multiplicative noise
strength increases, producing non-Gaussian statistics, despite the fact
the system is linear [34]
Thanks to the model symmetrization when αnl = 0, all the RETs are
equal, and thus we only evaluate T(X2→X1)F and T(X2→X1)g for the
diverse approaches (AN, CSM, ML). Note that in this scenario, both the
deterministic term and noise scales as ‖ X ‖, leading to extreme be-
haviors when X is large. In fact, for the range αm ∈ [0, 1], the standard
deviation of X1 increases from 0.92 to 1.94 and its kurtosis-excess in-
creases from 0.04 to 34, which is an extreme scenario. This is easily
verified through the pdf formula (53). For instance for αm = 0.25, the
pdf scales as ̂ ρX ∼ V 9 while for αm = 1, the pdf scales as ̂ ρX ∼ V 3,
producing a fat-tailled distribution.
In this case, the RET is approximated using a simple linear regres-
Fig. 1. RETs for the scenario αl = 0., b = 1, αm = 0, with αnl ∈ [0, 1] of the potential model. Mean over 30 noise seeds of T(X1→X2) (red curves) and T(X2→X1)
(black curves) by the AN (dotted line, squares), CSM (solid line,circles) and ML (solid line, triangles). Standard deviations over the ensemble of seeds are marked by
the error bar length. Pannels a) and b) refer respectively to period (time series) length of 4000 and 400 time units. Note that curves for T(X1→X2) and T(X2→X1) for
the ML approach superpose to each other.
Fig. 2. RETs for the scenario αnl = 0, αl = 0.5, b = 1 and αm ∈ [0, 1] of the potential model. Mean over 30 noise seeds of T(X2→X1)F by CSM (red curve, squares), by
ML (green solid, diamonds) and of T(X2→X1)g by CSM (magenta solid, triangles).Values of T(X2→X1)F by AN (black dotted) and T(X2→X1)g by AN (blue dotted).
Standard deviations over the ensemble of seeds are marked by the error bar length. Pannels a) and b) refer respectively to period (time series) length of 4000 and 400
time units.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
14sion:
T(X2→X1)F = αlE1
[dE2(X2|X1)
dX1
]
≈ αlcov(X1, X2)
var X2
1
) = αlcor(X1, X2) (65)
For all the range of αm, we have the correlation value cor(X1, X2) ≈
0.66 and thus T(X2→X1)F ≈ 0.33 = 0.66 × 0.5, which perfectly agrees
with the AN and CSM-based RET estimations shown in Fig. 2 through
their average over noise seed values.
The ML estimation, also shown in Fig. 2, is able to detect the deter-
ministic RET, though affected by a bias, which becomes large for highly
leptokurtic (high kurtosis) probability distributions, associated with
high αm.
The stochastic RET is:
T(X2→X1)g = αm
4 E2
{ 1 + α2
l
) d2E2
 X2
2⃒⃒ X1
)
dX2
1
}
 2αl E2
{
[X1 + E3(X3|X1)] d2E2(X2|X1)
dX2
1
} (66)
For symmetry reasons all the cross statistics are symmetric and thus
E1(X1|X2) and E2(X2|X1) must have the same linear functional de-
pendency, leading to d2E2(X2 |X1 )
dX2
1
= 0. Moreover, by using a quadratic
regression for X2
2, we get d2 E2(X2|X1)
dX2
1
≈ 2 cor(X2
1, X2
2) ≈ 0.52 in all the range.
Therefore, one obtains:
T(X2→X1)g = αm
2
 1 + α2
l
)cor X2
1 , X2
2
) ≈ αm × 0.325 (67)
Fig. 2 also shows the values of the S-RET T(X2→X1)g, i.e. the sto-
chastic RET, obtained with the AN and CSM approaches. Both ap-
proaches agree quite well for αm ≤ 0.6, after which, the excess-kurtosis
is larger than 3 and the AN value becomes highly biased if too short
interval bounds are used. Here the interval [ 10, 10] was shown to be
sufficient for accounting for the pdf tails. The CSM value grows almost
linearly with αm in agreement with (67). This suggests that the CSM
estimation can even provide a more accurate and outlier-resistant esti-
mate than the AN method in certain circumstances. The standard de-
viations of RETs obtained by CSM grows with the intensity αm of the
multiplicative noise and scale approximately as 1/̅̅̅̅̅ Nr
√ (as in scenario of
Section 5.3.1) by comparing the values for the long period (Fig. 2a) and
short period (Fig. 2b).
Another interesting aspect is that, in certain extreme noise condi-
tions, the stochastic RET can be larger than the deterministic RET (e.g.
αm > 1), which means that information flow occurs mostly trough the
noise than through the deterministic dynamics.
5.3.3. Multiplicative noise with increasing nonlinearity
Here we set αl = 0.5, αm = 0.3, b = 1 and αnl ∈ [0, 1], simulating a
mixture of non-linearity and multiplicative noise. The symmetry be-
tween variables is broken through a non-vanishing αnl. Moreover, ac-
cording to (51a-c), the deterministic terms are scaled as ‖ X ‖3 whereas
the noise scales as ‖ X ‖2, and therefore that contributes for smaller
kurtosis of the system variables than in the previous scenario.
As concerns T(X2→X1)F (57a), and using the linear regression for
E2(X2|X1) and the quadratic regression for E2(X2
2⃒⃒ X1), one gets:
T(X2→X1)F ≈  2αnlcov X2
2, X2
1
)
var X2
1
) E1
 X2
1
) + αlcov(X1, X2)
var(X1) (68)
Fig. 3 shows the values of T(X2→X1)F using the AN and CSM ap-
proaches, using the regression degree Nd = 8, as well as the minimal
regression approach given by (68) (acronym MN) and the ML method.
Fig. 3 shows that all AN,CSM and MN estimations are quite close to each
other. The ML approach is reasonable only for small values of the
nonlinearity (small αnl), i.e. weak nonlinearity.
The specific RET is not constant, as expected from nonlinear systems
and has higher amplitude for larger values of X2
1 according to:
F 1,2,F(X1) ≈  2αnlX2
1
cov X2
2, X2
1
)
var X2
1
) + αlcov(X1, X2)
var(X1) (69)
The minimal regression of T(X2→X1)g (59b), leads to
T(X2→X1)g ≈ αm
2
{αnl[E1
 X2
1
) + E3
 X2
3
)] +  1 + α2
l
)} cov X2
2, X2
1
)
var X2
1
) (70)
Fig. 3 also shows the values of T(X2→X1)g (Fig 3a: long period, Fig
3b: short period), obtained with the AN, CSM and MN approximations.
The AN and CSM agree quite well, with quite short standard deviation
over noise-generated samples, as seen in error bars of Fig. 3a,b, while
MN presents lower values of RET. Despite this bias, the dependence on
αnl is well detected by the minimal regression of MN. The standard de-
viation of sampled RETs by CSM are also approximately scaled as 1/̅̅̅̅̅ Nr
√
Fig. 3. RETs for the scenario αl = 0.5, αm = 0.3, b = 1 and αnl ∈ [0, 1] of the potential model. Mean over 30 noise seeds of T(X2→X1)F by CSM (red, solid), by ML
(gree, solid), by MN (deep blue, solid) and of T(X2→X1)g by CSM (magenta, solid) and by MN (purple, solid). Values of T(X2→X1)F by AN (black, dotted) and
T(X2→X1)g by AN (blue, dotted). Standard deviations over the ensemble of seeds are marked by the error bar length. Pannels a) and b) refer respectively to period
(time series) length of 4000 and 400 time units.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
15as in previous scenarios.
The figures for T(X1→X2) and T(X1→X3) are similar to those of Fig. 3
(not shown).
6. Lorenz model
In this section we compute the RETs without the explicit knowledge
of the model pdf as in the previous section. For that extension of the
analysis to more classical models, the Lorenz 1963 model [26] driven by
a noise term, is used [35]. The Lorenz model and its extensions have
been used in numerous theoretical and methodological studies, such as
predictability [36,37], data assimilation [38], bifurcation theory [39],
ergodic theory [40], thermodynamics [41], signal processing [42]
among many others. The model is a minimal Galerkin truncation of the
Boussinesq equations of the two-dimensional fluid convection, with
heating at the bottom and cooling at the top, where the model variables
are ̂ X1, proportional to the rate of convection and ̂ X2,̂ X3 which are
proportional to the temperature variation in the horizontal and vertical
directions, respectively. The usual parameter values: σ = 10 (Prandtl
number), Ra = 27 (rescaled Rayleigh number) and β = 8
3 (aspect ratio),
are used. The model exhibits a chaotic attractor and an ergodic pdf with
expectations μ1 = μ2 = 0, μ3 ≈ 22.61 and standard deviations σ1 ≈
7.74, σ2 ≈ 8.76 and σ3 ≈ 8.35 for ̂ X1,̂ X2,̂ X3, respectively. The model is
slightly transformed to describe the evolution of the standardized vari-
ables Xi ≡̂ X 1 μi
σi , i = 1,2,3. We run the stochastic Lorenz models through
a Predictor-Corrector scheme (see Appendix B2), and setting μi,σi. i = 1,
2, 3 to the above values in all experiments. The model equations are:
dX1 =
[(σσ2
σ1
)
X2  σX1
]
dt + B1dW1 (71a)
dX2 =
{[σ1
σ2
(Ra  μ3)
]
X1 
(σ1σ3
σ2
)
X1X3  X2
}
dt + B2dW2 (71b)
dX3 =
[(σ1σ2
σ3
)
X1X2  βX3 
(βμ3
σ3
)]
dt + B3dW3, (71c)
where we set equal noise coefficients:
B1 = B2 = B3 = [b2 + αmexp  X2
1
)]1/2 = g1/2, (71d)
with b2 ≥ 0 and αm ≥ 0 being parameters associated with the ampli-
tudes of the additive and multiplicative noises respectively. The noise-
free model is set to b = αm = 0. The noises follow the law: dWi ∼̅̅̅̅̅
dt
√ N(0, 1). The model converges to pullback attractors whose prop-
erties depend on the parameter values [34].
6.1. Rates of entropy transfer and budget of entropy
The deterministic terms in (71a-c) are composed of polynomials,
satisfying the separability assumption for the application of CSM for-
mulas (37a,b). The deterministic and stochastic RETs are easily
computed as:
T(X2→X1)F = σσ2
σ1
E1
[dE2(X2|X1)
dX1
]
(72a)
T(X3→X1)F = 0 (72b)
T(X1→X2)F = E2
{[σ1
σ2
(Ra  μ3) 
(σ1σ3
σ2
)
E3(X3|X2)
] dE1(X1|X2)
dX2
}
(72c)
T(X1→X2)g = αm
2 E2
[d2E1
 exp  X2
1
)⃒⃒ X2
)
dX2
2
]
(72d)
T(X3→X2)F = 
(σ1σ3
σ2
)
E2
[
E1(X1|X2) dE3(X3|X2)
dX2
]
(72e)
T(X1→X3)F = σ1σ2
σ3
E3
[
E2(X2|X3) dE1(X1|X3)
dX3
]
; (72f)
T(X1→X3)g = αm
2 E3
[d2E1
 exp  X2
1
)⃒⃒ X3
)
dX2
3
]
(72g)
T(X2→X3)F = σ1σ2
σ3
E3
[
E1(X1|X3) dE2(X2|X3)
dX3
]
(72h)
T(X2→X1)g = T(X3→X1)g = T(X3→X2)g = T(X2→X3)g = 0 (72i)
Since the normalization is an affine variable change, the RETs are the
same as those from the non-normalized variables according to theorem 6
(43b).
In what concerns the entropy budget, the terms of (20) can be easily
estimated using the CSM formulas of Secs. 2 and 3. The generic entropy
balance for the three variables is:
where the first term is the self-determinist generation (SEG), the second
term is the sum of single RETs (42a) the third one is the synergetic RET
(42b), the fourth and fifth terms are the additive-noise and
multiplicative-noise terms respectively, which have the following
expressions:
(dHXi
dt
)
g,a
= E
[(αm
2 exp  X2
1
) + b2
2
)(dlogρi
dXi
)2]
(74a)
(dHXi
dt
)
g,m
=  αm
2
 1 + δi,1
)E
[d2E exp  X2
1
)⃒⃒ Xi)
dX2
i
]
(74b)
where δi,1 is the Kronecker symbol. For the Lorenz system, we still have:
E
(∂F1
∂X1
)
=  σ; E
(∂F2
∂X2
)
=  1, E
(∂F3
∂X3
)
=  β (75a)
T(X∼1→X1)F = T X2,3→X1
)
F = σσ2
σ1
E
[dE(X2|X1)
dX1
]
(75b)
T(X∼2→X2)F = T X1,3→X2
)
F
= σ1
σ2
(Ra  μ3)E2
[dE(X1|X2)
dX2
]

(σ1σ3
σ2
)
E
[dE(X1X3|X2)
dX2
]
(75c)
E
(∂Fi
∂Xi
)
+ T(X∼i→Xi)F,sing + T(X∼i→Xi)F,syn +
(dHXi
dt
)
g,a
+
(dHXi
dt
)
g,m
= dHXi
dt = 0 (73)
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
16T(X∼3→X3)F = T X1,2→X3
)
F =
(σ1σ2
σ3
)
E
[dE(X1X2|X3)
dX3
]
(75d)
We must note that, in the Lorenz model, there are two quadratic
terms responsible for the nonlinearity: X1X3 in dX2
dt (71b) and X1X2 in dX3
dt
(71c), yielding synergetic RETs in T(X1,3→X2)F and T(X1,2→X3)F:
T X1,3→X2
)
F,syn = 
(σ1σ3
σ2
)
E
[d cov(X1, X3|X2)
dX2
]
(76a)
T X1,2→X3
)
F,syn =
(σ1σ2
σ3
)
E
[d cov(X1, X2|X3)
dX3
]
(76b)
These terms are relevant for the entropy budget as we will show
below and are also important in the turbulent chaotic regime simulated
by the Lorenz model. The conditional covariance terms cov(X1, X3|X2)
and cov(X1, X2|X3) are essentially the vertical and horizontal heat fluxes
and the derivatives in (76a), (76b) are their parametrizations with
respect to temperature gradients. Therefore, the synergetic terms (76a),
(76b) are simply associated with the horizontal and vertical turbulent
heat flux diffusivities as a function of temperature gradients. This
example suggests that formulas provided by the CSM can be good tools
to identify physical factors influencing the entropy budget and the
inferred causality.
All the remaining terms in the RETs come from the cross-dependent
linear terms in equations:
(σσ2
σ1
)
X2 in dX1
dt (71a) and
[σ1
σ2 (Ra  μ3)
]
X1 in dX2
dt
(71c), which are detected by the ML approach.
6.2. Setup of experiments
The RET values are calculated by the AN, CSM, MF and ML ap-
proaches for three situations: noise free (b = αm = 0); additive noise
(b = 1., αm = 0) and multiplicative noise (b = 0, αm = 1.). The variance
of different variables is 1 for the free-noise case and within the interval
[0.9,1.1] for the noisy scenarios which are particularly extreme because
the signal to noise ratio is small, and the noise can considerably affect
the S-RETs.
The numerical 3D integration, used in AN is made over the cube
[ L, L]3, L = 4., regularly discretized into cubic voxels of side Δ = L
/100. Two integration periods are tested, after a relaxation of 100 time
units and with lengths Lt = 400 time units (long run), and Lt = 80 time
units (short run), simulating real situations of low data availability. Used
time-steps are of size dt = Δt = 0.02. An extra time-step dt = Δt = 0.01
is used in the MF where time-derivatives are computed by forward dif-
ferences. The sampling mean and variability of RETs are assessed by
generating Ns = 30 independent integration realizations by varying the
seed of the noise generator and initial condition.
The ergodic pdf of the model is estimated by a kernel-based
approach, using the probabilities P(X) at every state-space voxel
centroid X ∈ [ L, L]3 estimated as:
P(X) = 1
Z
∑Nr
t=1
exp[  d2]1
[
d ≤̅̅̅ 3
√ Δ
]
;
d2 = ‖ X  X(t)‖2
(77)
The instantaneous state X(t) has an effect only at points within a
Cartesian distance ̅̅̅ 3
√ Δ, which is set by using the indicator function 1
[...] (1 or 0 if the condition is true or false respectively). Z is the
normalizing constant. Accuracy tests were performed, by comparing
probabilistic and temporal averages of powers (up to degree 4) of the
variables. After the P(X) computation, the AN-based RETs are assessed
at the voxel centroids.
In the CSM approach, we use polynomial regressions of degree Nd =
10 to obtain accurate representations of the conditional expectations
and their derivatives, though lower degrees are sufficient for certain
terms. This will be further discussed below in the validation section.
In the MF approach, the deterministic terms and diffusivities Fi, gi,i
are estimated independently and used afterwards in the CSM formulas.
The fitting of time-derivatives dXi
dt is performed using the class of 10
mixed monomials (base-functions) Ψl(X) (47b) of maximum degree 2, i.
e. {Ψl(X)} = {1, X1, X2, X3, X2
1, X1X2, X1X3, X2
2, X2X3, X2
3} to which the
model (71a-c) belongs to, allowing to get an unbiased fitting. For the
fitting of noise, we chose the constrained class {Φl(X)} = {1, exp( 
X2
1)}. The model fitted coefficients are then used to compute D-RETs and
S-RETs, using the sums over the basis functions (49a,b) and (50a,b).
6.3. Minimal CSM results (MN)
We provide here approximations of the D-RETs, by doing minimal
(MN) regressions appearing in the CSM formulas for the noise-free sit-
uation. The conditional expectations, valid for the standardized vari-
ables are approximated by:
E2(X2|X1) ≈ cor(X1, X2)X1 = 0.88 X1 (78a)
E3(X3|X1) ≈ cor X3, X2
1
)
std X2
1
)  X2
1  1) = 0.563 X2
2  1) (78b)
E1(X1|X2) ≈ cor(X1, X2)X2 = 0.88 X2 (78c)
E3(X3|X2) ≈ cor X3, X2
2
)
std X2
2
)  X2
2  1) = 0.068 X2
2  1) (78d)
E1(X1|X3) = 0 (78e)
E1(X2|X3) = 0 (78f)
Those regressions are quite obvious from Fig. 4 showing the two-
dimensional pdfs ρ1,2(X1, X2), ρ1,3(X1, X3), and ρ2,3(X2, X3). In fact, the
linear correlation cor(X1, X2) > 0 appears from the straight positive
slope of ρ1,2 contours (Fig. 4a) whereas the positive quadratic correla-
tions cor(X3, X2
1) and cor(X3, X2
2) come from the convex parabolic shapes
of ρ1,3 (Fig. 4b) and ρ2,3 (Fig. 4c) respectively. The pdfs were estimated
by the kernel-based method, with a run of 10,000 time units.
By substituting the minimal regressions into the D-RET formulas, we
get:
T(X2→X1)F ≈ σσ2
σ1
× 0.88 = 9.96 (79a)
T(X1→X2)F
= E2
{[σ1
σ2
(Ra  μ3) 
(σ1σ3
σ2
)
E3(X3|X2)
] dE1(X1|X2)
dX2
}
≈ σ1
σ2
(Ra  μ3) × 0.88 = 3.88
(79b)
T(X3→X2)F = 
(σ1σ3
σ2
)
E2
[
E1(X1|X2) dE3(X3|X2)
dX2
]
≈ 
(σ1σ3
σ2
)
E(0.88X2 × 2. × 0.068X2) =  0.883 (79c)
The values of T(X1→X2)g and T(X1→X3)g calls for the Taylor
expansion of exp( X2
1) and X3 regression of at least 4th degree. All the
remaining single D-RETs are zero.
6.4. Validation of the RET estimation
Table 2 presents the overall results of the different deterministic and
stochastic single RETs, computed with the two period lengths (Lt = 400
and Lt = 80 with Δt = 0.02 and Lt = 80 with Δt = 0.01) for the
different scenarios: noise free, additive noise, and multiplicative noise
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
17and using the four tested approaches: AN, CSM, MF and ML. The sample
averages and sample standard deviations of RETs were computed from
an ensemble of 30 independent realizations of model runs. Polynomials
of order 10 have been applied for the nonlinear regressions in CSM and
MF. Model fitting uses polynomials of second order. The ensemble
average AN values obtained with the long run are taken as reference
values (in bold in Table 2). The sources of estimation errors are dis-
cussed in Section 4 and summarized in Table 1.
From the analysis of the Table 2, the main conclusions about the
RETs estimations are:
1) The deterministic RETs obtained by minimal CSM, i.e. MN, compare
quite well with the AN-based values showing that relatively simple
regressions can recover the RETs. The biases are associated to the
representation of the conditional expectations by polynomials of
very low order.
2) There is a good agreement between the AN and CSM estimations with
biases ranging within 1–5%, for both run lengths and noise scenarios.
The CSM variability, measured by the standard deviation among
samples range within 1–14% for the long-runs being roughly pro-
portional to 1̅̅̅
Lt
√ . (inverse of the root square of the run length), i.e.
~2.2 larger in the short-run samples. The CSM variability is in most
cases less than the AN variability, justifying the robustness of CSM.
3) The MF estimations have comparable biases to those of CSM, except
in T(X2→X1)F . That bias in MF can be decreased by taking smaller
time-steps (see comparison between dt=0.02 and 0.01). The sam-
pling standard deviation of MF ranges within 2–10% in the long runs
and 4–25% in the short runs, being generally larger than that of CSM
due to model fitting errors and being also roughly proportional to 1̅̅̅
Lt
√ .
It shows that even with very short time series without the knowledge
of model equations, it is possible to obtain relatively accurate cau-
sality diagnostics.
4) In what concerns the ML values, T(X2→X1)F agrees with those from
AN, due to the absence of nonlinear terms in (71a). All the remaining
ML values are close to zero, except T(X1→X2)F because the product 
(σ1σ3
σ2
)
X1X3 in (71b) correlates with  X1, leading to a negative
(highly biased) D-RET (see Table 2). The zero ML values agree with
AN in the cases T(X1→X3)F, T(X2→X3)F because of two coincidental
properties of the model: the absence of cross-linear terms in the
equation governing X3 (71c) and the symmetry of pdfs ρ1,3(X1, X3)
and ρ2,3(X2, X3) (see Fig. 4).
5) The AN values computed with short runs exhibit high variability
(sampling standard deviation), reaching twice to three times larger
than that of CSM, especially due the inaccuracy of estimated pdfs.
Therefore, the time-series length and model dimension are severe
limitations to the applicability of AN.
6) The deterministic RETs (D-RETs), which are mostly associated to
nonlinear terms in T(X1→X2)F, T(X3→X2)F decrease in amplitude in
the noisy scenarios because the nonlinear dependencies weaken with
respect to the noise-free situation. In particular, in the additive-noise
scenario, the model becomes closer to Ornstein-Uhlenbeck models.
The sensitivity of the CSM and MF values with respect to the degree
Nd of polynomial regression used in the conditional expectations is
illustrated in Fig. 5, showing the average and standard deviation (over
30 noise seeds) of two RETs, essentially of nonlinear nature: T(X1→X2)F,
T(X3→X2)F for the noise free and additive noise scenarios, short run
(Lt = 80) and dt=0.02. We conclude from the figure that the speed of
convergence as Nd grows, depends on the considered RET. For the noise-
free scenario, T(X1→X2)F stabilizes for Nd ≥ 4 whereas T(X3→X2)F sta-
bilizes for Nd ≥ 10, justifying that choice in the CSM validation. In the
noisy scenario, since the pdf is less non-Gaussian than in the noise-free
situation, and non-linearity decreases, the RETs have smaller absolute
value and the convergence is faster, showing that in both RETs stabilize
for Nd ≥ 4. The final bias (difference with respect to the analytical
value) is still nonzero indicating other sources of errors, either from the
analytical or from the CSM and MF algorithms.
The remaining RETs converge rather quickly at Nd = 2 (not shown).
This makes clear that the representativness of the conditional expecta-
tions call in some cases for higher-order polynomial regressions or
eventually for more appropriate regression functions, namely with finite
L2 norms in the real domain.
The convergence speed of the polynomial regressions of the condi-
tional expectations generally depends on the nonlinearities of the
studied model, the shape of the corresponding pdf and also of the set of
basis functions (e.g. polynomials, trigonometric functions, orthogonal
eigen-functions, wavelets). Two factors weakening the convergence of
regressions are the abruptness of pdf variations along state-space, the
existence of topologically complex pdf shape and the ‘strangeness’ and
fractal nature of chaotic attractors, especially if the Hausedorff dimen-
sion is small. In the 3D noise-free Lorenz model, the Hausedorff
dimension is ~2.06 [43] and the atractor projects quite well on each of
the three variables, thus leading to smooth univariate and bivariate pdfs
(Fig. 4). The strength of the Gaussian white noise forcings tends to make
pdfs more, Gaussian and smoothed, leading to faster convergence re-
gressions as shown in Fig. 5.
6.5. Discussion of the entropy budget
The entropy budget terms (73) of each consequential variable Xi as
Fig. 4. Two-dimensional pdfs ρ1,2(X1, X2) (a) ρ1,3(X1, X3) (b) and ρ2,3(X2, X3) (c) of the standardized Lorenz model (unit variance of each variable) (71a-c) in the
noise-free scenario in the domain [ 4, 4]2.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
18well as their specific or local contributions along the state-space are
important to identify certain dynamical aspects of the system and pro-
vide key information about the local/global predictability, causality and
synergies across variables. Therefore, we present Table 3 listing the
budget terms (in rows) of (73) for the three Lorenz’ system scenarios (in
columns) and the three variables (in sub-columns) using the (long run)
CSM values. First of all, the sum of terms (last row of Table 3) is of the
order of their sampling standard deviation (in Table 2) revealing a zero
entropy budget as expected in ergodic conditions. Secondly, the relevant
values of the synergetic RETs clearly put in evidence the influence of the
Lorenz system nonlinearities in the entropy transfers. In fact, whereas,
for X1, the deterministic forcings are linear (71a), leading to vanishing
synergetic RETs, we get non-zero values for X2 and X3. In the case of X3,
the RET is totally explained by the synergetic contribution, coming from
the joint effect (rather than individual) of X1, X2 through the product
X1X2 in the evolution equation of X3 (71c). This must partially be a result
of the high interrelation between X1 and X2, coming from the sharp joint
(X1, X2) pdf (Fig. 4a) and high linear correlation (0.88 in the noise free
situation).
The example of the Lorenz system synergies raises the possibility in
most nonlinear and complex network systems (like the atmospheric-
oceanic system) of an incomplete ’causality picture’ which is
described uniquely by single RETs and their sum (T(X∼i→Xi)F,sing).
Therefore, the set of one-to-one causal links, not only of the LK type but
also issued from other techniques (e.g., conditional mutual information
(CMI) [44], Peter and Clark Momentary Conditional Independence
(PCMCI) [45], Granger causality [2,6]) may not reproduce the ‘full
story’ about the system causality.
Another important issue revealed by synergies is the help for the
clustering or mixing of variables looking for a simplification of the
causality picture. For instance, if variables are highly (linear or non-
linearly) interrelated, then they can be ‘concentrated’ onto low-order
Table 2
Values of D-RETs and S-RETs (indicated in the first column), for the 3 scenarios (noise-free, additive and multiplicative noise), estimated by the 4 approaches (AN,
CSM, MF and ML). The values are given in the format (μ±σ) where μ and σ are sampling average and sampling standard deviation, obtained from an ensemble 30
independent model run realizations, using runs of 400 and 80 time units (indicated in third column) and Δt = 0.02. The value 80(a) refers to MF values using runs of 80
time units and Δt = 0.01. The reference values (AN with long run) is given in boldface type. The RET value of T(X3→X1)F is not included since it is theoretically null.
RET Noise
Type
Run NA CSM MF ML
T(X2→X1)F Free 400
80
80(a)
9.92±0.023
9.96±0.109
9.96±0.002
9.96±0.013
8.87±0.002
8.87±0.011
9.44±0.009
9.98±0.003
9.98±0.014
Add. 400
80
80(a)
9.30±0.068
9.24±0.217
9.30±0.059
9.37±0.113
8.29±0.127
8.35±0.270
8.89±0.285
9.21±0.085
9.24±0.172
Mult. 400
80
80(a)
9.82±0.040
9.70±0.152
9.86±0.020
9.85±0.050
8.77±0.094
8.73±0.284
9.36±0.220
9.53±0.065
9.51±0.144
T(X1→X2)F Free 400
80
3.62±0.026
3.63±0.098
3.58±0.014
3.57±0.052
3.83±0.078
3.76±0.168
 9.18±0.010
 9.18±0.032
Add. 400
80
2.28±0.115
2.29±0.238
2.24±0.117
2.26±0.187
2.30±0.205
2.42±0.375
 6.47±0.082
 6.42±0.185
Mult. 400
80
2.47±0.086
2.46±0.234
2.43±0.082
2.45±0.233
2.87±0.278
2.97±0.573
 7.31±0.066
 7.21±0.149
T(X3→X2)F Free 400
80
¡0.76±0.046
 0.85±0.166
 0.73±0.022
 0.72±0.047
 0.80±0.022
 0.77±0.049
0.0003±0.0005
0.0004±0.002
Add. 400
80
¡0.55±0.089
 0.77±0.303
 0.52±0.075
 0.57±0.159
 0.56±0.078
 0.597±0.162
0.001±0.0022
0.008±0.016
Mult. 400
80
¡0.44±0.070
 0.58±0.200
 0.41±0.057
 0.45±0.138
 0.43±0.057
 0.48±0.143
0.001±0.0019
0.005±0.0087
T(X1→X3)F Free 400
80
0.03±0.028
0.005±0.107
0.01±0.035
0.06±0.091
0.008±0.025
0.04±0.061
 0.002±0.0036
 0.009±0.010
Add. 400
80
0.01±0.039
0.03±0.178
0.005±0.013
0.045±0.053
0.003±0.013
0.003±0.054
 0.003±0.0048
 0.004±0.016
Mult. 400
80
0.02±0.037
0.07±0.138
0.02±0.023
0.07±0.052
0.02±0.018
0.05±0.056
 0.005±0.0077
 0.017±0.033
T(X2→X3)F Free 400
80
0.008±0.028
 0.02±0.145
0.005±0.013
0.041±0.057
 0.002±0.045
0.009±0.094
0.003±0.0046
0.01±0.012
Add. 400
80
0.002±0.053
0.06±0.247
0.003±0.011
0.047±0.059
0.001±0.019
0.030±0.070
 0.003±0.0055
 0.018±0.037
Mult. 400
80
0.007±0.054
¡0.007±0.218
0.007±0.009
2.53±0.051
0.001±0.019
0.02±0.067
 0.002±0.0089
 0.01±0.029
T(X1→X2)g Mult. 400
80
¡0.11±0.010
 0.10±0.056
 0.11±0.0068
 0.11±0.018
 0.09±0.0059
 0.09±0.016
na
na
T(X1→X3)g Mult. 400
80
¡0.03±0.012
 0.06±0.056
 0.021±0.002
 0.018±0.076
 0.020±0.0016
 0.015±0.0062
na
na
Fig. 5. Values (sample averages and standard deviations in error bars) of
T(X1→X2)F by CSM (black) and by MF (green) and T(X3→X2)F by CSM (red)
and by MF (blue) for polynomial regressions of degrees Nd=2,4,6,8,10,14. Soild
and dotted lines refer to noise-free and additive noise scenarios respectively.
The analytical value is marked at Nd=16.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
19spaces spanned by mixed variables (e.g. through principal component
analysis, independent component and subspace analysis [46,47],
nonlinear principal component analysis [42] and projection pursuit
[48]). Then single RETs can be computed between those mixed variables
and the remaining variables, thus producing a causality description of
lower dimension.
In order to illustrate that rationale in the noise-free scenario, we
consider the pair of variables (X3, X4) where X4 ≡ X2
1  E(X2
1) = X2
1  1
and the linear regression: X2X1 = α3X3 + α4X4 + E(X2X1) + εreg = 
0.56X3 + 1.20X4 + 0.88 + εreg, where the regression error εreg has zero
average and variance 0.14 along the attractor. The evolution Eqs. (71c)
and (71a multiplied by 2X1), of X3 and X4 respectively become:
dX3
dt =
[(σ1σ2
σ3
α3  β
)
X3 +
(σ1σ2
σ3
α4
)
X4 +
(σ1σ2
σ3
E(X1X2)  βμ3
σ3
)]
+ σ1σ2
σ3
εreg
≈  7.21X3 + 9.74X4 (80a)
dX4
dt =
[(2σσ2
σ1
α3
)
X3 +
(2σσ2
σ1
α4
)
X4 +
(2σσ2
σ1
E(X1X2)  1
)]
+ 2σσ2
σ1
εreg
≈  12.67X3 + 7.16X4
(80b)
where the neglected terms (constants and terms proportional to εreg) are
in average, 10–20 times less than the retained ones. The two-
dimensional system ( Eqs. 80a,80b) appears as approximately linear
and quasi Hamiltonian, due the close vanishing of the sum of forcing
divergence terms, i.e. the sum  7.21 + 7.16 ∼ 0. This behavior leads to
the near conservation of area elements along the dynamical system flow
as well as to the near stationarity of a positive-defined Hamiltonian
function: 6.34 X2
3 + 4.87X2
4  7.18X3X4. The driving matrix
[  7.21 9.74
 12.67 7.61
]
of (80a,80b) has two imaginary conjugate eigenvalues
±iω leading to oscillations of (X3, X4) with a period 2π
ω =
2π̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅̅
12.67 × 9.74 7.21 × 7.61
√ ∼ 0.76, being quite close of the that of the Lorenz
system oscillations. The time evolution of (X3, X4) is shown in Fig. 6, in
which the oscillations are evident. The reduced 2D system also satisfy
closed boundary conditions since the state-space speed is tangent to the
axis X4 = 0, being thus within the validity conditions of the presented
theory (Sections 2 and 3)
In what concerns the LK causality, the system (80a, 80b) is nearly
linear and thus the RET formula (34), valid for linear systems can be
applied leading to the approximation:
T(X4→X3) ∼ 9.74 cov(X3, X4)
var(X3) = 7.11 (81a)
T(X3→X4) ∼  12.67 cov(X3, X4)
var(X4) =  7.09 (81b)
The above RET values compensate very well the deterministic en-
tropy self-generations,  7.21 and 7.16, concerning respectively X3 and
X4 (80a,80b), leading thus to a near zero entropy budget in both vari-
ables. Those near symmetric values of the entropy transfers appear as a
characteristic of two-dimensional linear Hamiltonian systems. This has
been verified independently by empirical estimations of T(X2
1→X3) and
T(X3→X2
1), respectively 6.99 and  7.03 as well as in [49]. Therefore,
from the above values, we conclude that entropy is self-generated by X2
1,
through variable X4 (i.e. the square of convection intensity), then
transferred to X3 (intensity of the vertical temperature gradient), being
self-dissipated afterwards by X3. The variable X2
2, (square of the intensity
of the horizontal temperature gradient) is nonlinearly driven by (X3,X4),
whose approximate evolution equation is obtained by (71b) multiplied
by 2X2 after using the regression for X2X1 with a positive RET T(X3, X4→
X2) compensating the dissipation. In a similar way, an approximately
Hamiltonian system will be obtained by considering the pair (X2X1, X3).
The Liang-Kleeman entropy diagnostics can thus suggest groups of
variables which, when mixed together, can provide a simplified picture
of the entropy transfers.
For stochastic dissipative systems, the presence of noise induces an
amplitude decreasing of the deterministic RETs (single and synergetic
terms), since the noise contributes positively to the entropy generation
which will partially balance the deterministic dissipation. Moreover,
systems forced by additive noise become closer to Ornstein-Uhlenbeck
stochastic processes as far as noise variance increases, leading in par-
allel to a decrease of the amplitude of single RETs.
6.6. Specific contributions for the rates of entropy transfer
We will study in the noise-free scenario, the specific contributions
(along the state-space) for T(X∼i→Xi)F, i.e. F i,∼i,F(Xi) or specific RETs
(31b). The deterministic contributions (12b,31b) for X1 and X3 are
nearly uniform along the range of the consequential variable, being
Table 3
Terms of the budget of entropy for the 3 variables of the stochastic Lorenz system and the three studied noise scenarios.
Noise-free Add. Noise Mult. Noise
X1 X2 X3 X1 X2 X3 X1 X2 X3
T(X∼i→Xi)F,sing 9.97 2.85 0.02 9.30 1.72 0.01 9.86 2.02 0.01
T(X∼i→Xi)F,syn 0  1.82 2.61 0  1.17 2.06 0  1.19 2.33
(dHXi
dt
)
g,m
0 0 0 0 0 0 0.05 0.11 0.02
(dHXi
dt
)
g,a
0 0 0 0.65 0.49 0.56 0.08 0.09 0.28
E
(∂Fi
∂Xi
)  10  1  2.66  10  1  2.66  10  1  2.66
Total Budget  0.03 0.03  0.03  0.05  0.04  0.03  0.01 0.03  0.03
Fig. 6. Time evolution of X3 and X4 ≡ X2
1  1 in the noise-free scenario of the
Lorenz 63 system.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
20retained by the single and synergetic terms, respectively for X1 and X3, i.
e.:
F 1,∼1,F(X1) = σσ2
σ1
dE(X2|X1)
dX1
≈ F 1,∼1,F,sing(X1) ≈ T(X∼1→X1)F,sing ≈ 9.974
(82a)
F 2,∼2,F(X2)
= σ1
σ2
(Ra  μ3) dE(X1|X2)
dX2

(σ1σ3
σ2
) dE(X1X3|X2)
dX2
≈ T(X∼2→X2)F ≈ 1.03
(82b)
F 3,∼3,F(X3)
=
(σ1σ2
σ3
) dE(X1X2|X3)
dX3
≈ F 3,∼3,F,syn(X3) ≈ T(X∼3→X3)F,syn = 2.61
(82c)
However, In what concerns X2, that regularity is not holding, as seen
by the strong changes of specific RETs F 2,1,F(X2), F 2,3,F(X2) and
F 2,∼2,F,syn(X2) along the range of X2 (see Fig. 7) which is a clear mark of
nonlinearity, since specific RETs are kept constant for linear systems. In
fact, while F 2,1,F(X2) is positive ranging in the interval [1,4] (black
curve in Fig. 7), the value of F 2,3,F(X2) (red curve in Fig. 7) is positive
near the X2 = 0 and reaches large negative values ( 6 and  8) at the
lobes of the attractor. The synergetic term F 2,∼2,F,syn(X2) (blue curve in
Fig. 7) coming from the joint effect of (X1, X3) is mostly negative near X2
= 0 and positive elsewhere. This means that, both X1 and X3 separately
contribute to increase the entropy of X2, whereas their joint combination
contributes to decrease entropy of X2.
Most of the RETs take place near the point of maximum joint pdf at
(X1 = 0, X2 = 0, X3 ∼  0.3) where most of sign changes of the
convective cells take place, when the system orbit approaches the un-
stable fixed point of no convection:
(
X1 = 0, X2 = 0, X3 =  μ3
σ3 = 
2.71
)
.
7. Discussion and conclusions
A general theory is derived for computing Shannon entropy transfers
in nonlinear (deterministic and/or stochastic) systems, holding under
quite generic state-space boundary conditions, namely: 1) unbounded
pdf support set; 2) closed boundaries, i.e. null deterministic and diffu-
sive fluxes at the pdf support set borders; 3) periodic conditions in state-
space. The theory extends the Liang-Kleeman (LK) framework [16] of
causality inference, by decomposing the evolution of the Shannon en-
tropy of a single state vector component (taken as the consequential
variable), into a self entropy generation (SEG) and a global rate of en-
tropy transfer (RET) issued from the complementary space of the
consequential variable, with contributions assigned either, to the
deterministic or the stochastic forcings. In the case of open conditions,
some extra terms must be added to the entropy balance equation, related
to externally driven fluxes of entropy to the state-space, imposed by
non-zero speeds or diffusivities at the borders of the pdf support set in
the space-space.
The RET comes from the existence of cross variable dependencies,
either in the deterministic components or in probabilistic diffusivities in
the multiplicative-noise case. The global RET is further decomposed into
the sum of RETs from the single variables spanning the complementary
space plus a synergetic RET accounting for synergetic causal effects due
to groups (e.g. triplets, quartets) of variables [28]. The synergetic term
vanishes in linear systems, being thus of purely nonlinear origin.
Synergies due to nonlinearities (e.g. products of variables in the
forcings), as well as redundancies between variables suggest the
extended RET computation between a generic causal subspace and a
generic consequential subspace (or more generally manifolds), and for
given contextual or outer subspace. As a climatic example of the causal,
consequential and contextual subspaces, we can choose sub-spaces
spaning the low-frequency variability of separate oceanic basins and
the overlying atmosphere where indirect oceanic links may take place
via an ‘atmospheric dynamical bridge’ [50]. Consistent expressions of
the space-to-space RETs, are being devised (author’s future manuscript),
following the same CSM technique presented here.
The diagnostics of causality between two particular variables
(inferred by RETs) can strongly depend on the set of contextual or
remaining variables, spaning the so-called outer space acting as room of
‘hidden’ indirect interactions between that pair of variables. This effect
can be amplified when the allowed interactions jump from linear to
nonlinear and the dimension of the ‘outer’ space increases, thus calling
for a proper analysis of the extension of the ‘causality outer space’.
An effective method of estimating RETs, the ‘Causal Sensitivity
Method’ (CSM) is then introduced, as an alternative to the ‘brute-force’
and more expensive estimation approaches calling for the explicit
knowledge of the pdf of the system, which may have severe pitfals. In
fact, the pdf estimation can be unreliable even for moderate system di-
mensions if not enough data are available, and being biased by effect of
the ‘curse of dimensionality’ (fact that multivariate outliers become
more probable than near average values).
The CSM relies on RET formulas depending explicitly on derivatives
(sensitivities) of conditional expectations of the deterministic terms and
noise diffusivities, conditioned on the consequential variable. The CSM
is fully appropriate to cases where an ensemble of realizations is avail-
able, from which the conditional expectations are estimated using
nonlinear differentiable regressions based upon an extended set of basis
functions (e.g. monomials, orthogonal functions, wavelets) which can be
fixed or optimized through signal processing techniques and machine
learning, as relevant vector machines and symbolic regression. Those
ensembles can be time-evolving or obtained from a sampled long time-
series covering the attractor of the system. In particular in ensemble
forecasting (e.g. medium-to-long ensemble weather forecasting), en-
tropy of forecast errors grows with the ensemble spread, and the RETs
become important to diagnose drivers of predictability or unpredict-
ability of chosen variables.
Formulas for the CSM-based specific contributions to RETs, along the
state-space are available, being uniform (varying) on linear (nonlinear)
systems, and thus providing information where the RETs are intense or
not. The CSM-based RET formulas could also help to propose certain
parametrizations of the effects of the outer variables on the causal-
consequential pair, as for instance in parameterizing sub-grid scale
processes in turbulence or in meteorology.
Fig. 7. Specific deterministic RET contributions for X2 in the noise-free sce-
nario, through F 2,1,F(X2), (black curve), F 2,3,F(X2) (red curve) and
F 2,∼2,F,syn(X2) (blue curve).
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
21To exemplify the usefulness of the CSM formulas, four RET estima-
tion approaches are compared: The ‘brute-force’ computationally
expensive analytical-numerical (AN) method, relying upon numerical
integrals on the state-space depending on the system pdf and taken as
the reference in our study; the CSM, when the dynamical equations are
known; the MF method based on the model fitting followed by the CSM;
and the multivariate linear (ML) approach of Liang [18]. The methods
are validated in two three-dimensional models: a model derived from a
potential function and the classical chaotic Lorenz model [26], both
subject to a variety of noises and nonlinearities. The CSM values appear
to be robust and close to the reference AN values, being thus appropriate
for application with real data. The ML approach only works under weak
nonlinearity, being potentially strongly biased when strong non-
linearities and synergies across variables are present. This justifies the
need for using a nonlinear estimate for nonlinear problems. Diagnostics
of RETs can suggested ways of separating system variables leading to
more simplified pictures of entropy fluxes.
The application of the CSM, with or without model fitting, is sus-
ceptible of generalization to differentiable maps [12] and estimation of
RETs between subspaces of variability, thus opening a straightfull, and
computationally cheap methodology to infer information flows across
variables or groups of variables of a system, for instance spanning
sub-spaces of variability of the climatic system. Furthermore, this study
has raised the importance of a systematic study of RETs on chaotic and
stochastic system as a function of bifurcation and noise parameters.
The application of the CSM, as well as other causality diagnostics to
real systems of moderate dimension D (10–20) and high dimension
represents a great endeavor, both in the cases of known and unknown
evolution equations, with the computational cost of many problems
growing exponentially with D and the ‘curse of dimensionality’ effect.
Furthermore, when available time series are short, for selected spatial
and temporal scales, we add the need of making robust model fittings,
avoiding overfitting. In high-dimension systems, governed by complex
networks (like the climatic system), there are possible high levels of
linear or nonlinear redundancies (measured for instance by mutual in-
formation). Therefore, it is advisable to first compute low-dimensional
spaces (by linear and/or nonlinear principal component analysis and
independent and/or subspace component analysis), and then diagnose
the causality between the spaning variables or between subspaces,
following the same CSM strategy. Those variables can be substituted by
other relevant common indices (e.g. climatic indices in the climatic
system, like El-Ni˜no index), acting as drivers (causal variables) of the
raw system variables, for instance, helping to locate which regions are
more or less influenced. For higher-dimensional problems, there is still
the possibility of using Monte-Carlo direct estimations of the log-pdf
gradient (present in the RET expressions), relying upon the techniques
of ‘score-estimation’ and ‘score-matching’ [51].
The implementation of the CSM in real cases studies without avail-
able model equations has important prerequisites related to efficient and
robust regressions both in the fitting of model equations and also in the
expression of CSM conditional expectations. Robust regressions should
preferentially be accompanied by statistical significance tests. The
fitting may be performed by standard linear or non-linear regression
techniques or more sophisticated machine-learning-based and genetic
programming (e.g. relevance vector machines), keeping in mind that
basis-functions must be multiplicatively separable in terms of the
causal/consequential/outer variables. The basis-functions should pref-
erentially be non-recurrent (issued from sets of orthogonal functions),
and ranging from large to small scales.
An important step forward is to make a systematic study of the RETs
in stochastic systems and how they evolve along the space of bifurcation
parameters, noise intensity and its characteristics, which is out of the
scope for the present study. Another possible step is the merging of
signal-processing techniques and blind source separation methods with
the Liang-Kleeman entropy diagnostics, using the nonlinear approach
devised in this study.
Further applications to real-world class of problems like the inter-
action between different components of the climate system [50] with
presence of feedbacks is certainly a way forward that is taken up and will
be reported in the near future. Moreover, the CSM technique can be
applied to ensemble forecasting (e.g. short-to-long weather range fore-
casting) where the Shannon entropy mostly comes from the ensemble
spread and forecast error variance. There, the identification of causes
(drivers) of the ensemble forecast spread through the RETs can be useful
to determine the conditions of predictability or unpredictability of
selected variables on specific situations, thus opening a ‘world’ of
applications.
8. Author statement
The authors declare no have statements regarding this work.
CRediT authorship contribution statement
Carlos A. Pires: Conceptualization, Methodology, Formal analysis,
Validation, Investigation, Writing – original draft, Writing – review &
editing, Visualization. David Docquier: Methodology, Validation.
St´ephane Vannitsem: Methodology, Formal analysis, Writing – review
& editing.
Declaration of Competing Interest
The authors declare that they have no known competing financial
interests or personal relationships that could have appeared to influence
the work reported in this paper.
Data availability
Data will be made available on request.
Declaration of Generative AI and AI assisted technologies in the writing
process
Generative AI/AI assisted technologies were not used in the prepa-
ration of this work.
Acknowledgements
We thank Reik Donner and Giorgia Di Capua for very fruitful dis-
cussions during the preparation of this work and also the constructive
comments of two anonymous reviewers. It is funded by the Portuguese
´Fundaç˜ao para a Ciˆencia e a Tecnologia’ (FCT) I.P./MCTES through
national funds (PIDDAC) – UIDB/50019/2020- IDL and the project
JPIOCEANS/0001/2019 (ROADMAP: ’The Role of ocean dynamics and
Ocean–Atmosphere interactions in Driving Climate variations and
future Projections of impact–relevant extreme events’). D. Docquier and
S. Vannitsem also acknowledge the partial financial support from the
Belgian Federal Scientific Policy Office (Belspo) under contract B2/20E/
P1/ROADMAP.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
22Appendix A Proofs of the theoretical results
• A.1. Proof of (4)
Let us denote: Xi(t +dt) = Xi(t) + Yi(dt); Yi(dt) ≡ Fi(X, θ, t)dt + ∑Dn
k=1Bi,k(X, θ, t)dWk and ρi,self (Xi) the pdf of Xi in the stochastic process where X∼i
is frozen in the infinitesimal period [t, t + dt]. The entropy of that process, needs the writing of the Frobenius-Perron (FP) operator ℘[ρi,self (Xi)]
evolving ρi,self from t to t+dt. For that, we use a similar procedure to that of Liang in 2016 [16] (his Proposition VI.3) in which the FP operator of the
pdf of X1 (denoted as ρ1,\2 ) under frozen X2 is written as:
℘[ ρ1,\2 (X1
)] = ρ1,\2 (X1 + Y1)
 dt
∫
RD 2
∂F1 ρ∼2
∂X1
dX3…dXD
+dt
2
∫
RD 2
∂2g1,1 ρ∼2
∂2X1
dX3…dXD + o(dt)
(A.1)
where ρ∼2 = ∫
R
ρ(X)dX2. Now, in a similar way, the transformed pdf is ℘[ρi,self (Xi)], which is obtained by changing, in the previous equation, the sub-
index 1 into i, the sub-index 2 into ∼ i (corresponding to the set of frozen variables), and the integration ∫
RD 2
(..)dX3…dXD into the integrand function
(..). WE thus have the FP:
℘[ρi,self (Xi)] = ℘[ ρi,\∼i (Xi)] = ρi,self (Xi + Yi)  dt ∂Fiρi
∂Xi + dt
2
∂2gi,i ρi
∂2Xi + o(dt) (A.2)
where the pdf ρ∼2 was changed into ρ∼∼i = ρi . The corresponding entropy HXi,self (t +dt) is obtained by taking minus logarithm of the above pdf,
followed by the expectation operator E and the Taylor expansion of ρi,self (Xi + Yi) around Xi (see the similar procedure in Proposition VI.2 and VI.3 of
[16]). Then, after subtracting HXi,self (t) = HX1 (t), dividing by dt and taking the limit dt→0, we obtain the SEG given by the time derivative:
d HXi,self
dt =  E
[
Fi∂log ρi
∂Xi
]
 1
2 E
[
gi,i
∂2logρi
∂2Xi
]
+ E
[ 1
ρi
∂Fiρi
∂Xi
]
 1
2 E
[
1
ρi
∂2gi,i ρi
∂2Xi
]
(A.3)
According to Proposition VI.2 of [16], the time derivative d HXi
dt is the sum of the third and fourth terms of the r.h.s. of the above equation.
Consequently, the RET is given by
T(X∼i→Xi) = d HXi
dt  d HXi ,self
dt =  E
( 1
ρi
∂Fiρi
∂Xi
)
+ 1
2 E
(
1
ρi
∂2gi,iρi
∂X2
i
)
(A.4)
Providing the result (4).
• A.2. Proof of (10a)
We have T(X∼i→Xi) F =  E
( 1
ρi
∂Fiρi
∂Xi
)
=  ∫
∼i
∫
i
ρX
ρi
∂Fiρi
∂Xi dX =  ∫
∼i
∫
i
ρ∼i|i
∂Fiρi
∂Xi dX = ∫
∼i
∫
i
Fiρi
∂ρ∼i|i
∂Xi dX= ∫
∼i
∫
i
Fi ρX
ρ∼i|i
∂ρ∼i|i
∂Xi dX = E
(
Fi∂logρ∼i|i
∂Xi
)
, where ∫
i
and ∫
∼i
stand
for integration on Xi and X∼i respectively. In the forth equality we apply integration by parts and lim
‖X‖→∞
ρXFi = 0. Now, let us take (9a): Fi =̂ F i(Xi) +
Fi,∼i. The part depending on ̂ Fi is ∫
∼i
∫
î F iρi
∂ρ∼i|i
∂Xi dX = ∫
î F iρi d
dXi
∫
∼i
ρ∼i|idX = 0, since ∫
∼i
ρ∼i|idX∼i = 1, and the second equality of (10a) follows.
• A.3. Proof of (11)
(11) comes from: E
[
Fi,∼i
∂logρ∼i|i
∂Xi
]
= ∫
∼i
∫
i
ρXFi,∼i
∂logρ∼i|i
∂Xi dX = ∫
∼i
∫
i
ρiFi,∼i
∂ρ∼i|i
∂Xi dX = ∫
∼i
∫
i
ρi
∂Fi,∼iρ∼i|i
∂Xi dX  ∫
∼i
∫
i
ρiρ∼i|i
∂Fi,∼i
∂Xi dX = ∫
i
ρi d
dXi
∫
∼i
ρ∼i|iFi,∼idX  E
(∂Fi,∼i
∂Xi
)
=
Ei
[ d
dXiE∼i(Fi,∼i⃒⃒ Xi)
]
 E
(∂Fi,∼i
∂Xi
)
.
• A.4. Proof of (16a)
(16a) is obtained through:
(dHXi ,self
dt
)
g,m =
(dHXi
dt
)
g,m  T(X∼i→Xi)g =  1
2
∫
∼i
∫
i
gi,iρ∼i|i
d2ρi
dX2
i
dX  1
2
∫
∼i
∫
i
ρ∼i|i
∂2gi,iρi
∂X2
i
dX =  1
2
∫
∼i
∫
i
(
ρi
∂2gi,iρ∼i|i
∂X2
i
+ ρ∼i|i
∂2gi,iρi
∂X2
i
)
dX = 
1
2
∫
∼i
∫
i
(d2gi,iρ∼i|iρi
dX2
i
 2 ∂gi,iρ∼i|i
∂Xi
dρi
dXi
)
dX = ∫
∼i
∫
i
∂gi,iρ∼i|i
∂Xi
dρi
dXi dX =  ∫
i
ρi d2
dX2
i
∫
∼i
gi,iρ∼i|idX = Ei
(
 d2E(gi,i|Xi)
dX2
i
)
. In the third equality we apply integration by parts twice
with respect to Xi and once in the fifth and sixth equalities.
• A.5. Proof of (17)
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
23(17) is obtained from:T(X∼i→Xi) g = 1
2 E
[ 1
ρi
∂2gi,i∼i,ρi
∂X2
i
]
= 1
2
∫
∼i
∫
i
ρ∼i|i
∂2gi,i∼i ρi
∂X2
i
dX = 1
2
∫
∼i
∫
i
ρ∼i|i
(
ρi
∂2gi,i∼i
∂X2
i
+ gi,i∼id2ρi
dX2
i
+ 2 ∂gi,i∼i
∂Xi
dρi
dXi
)
dX = ∫
∼i
∫
i
[1
2ρ∼i|iρi
∂2gi,i∼i
∂X2
i
+
1
2ρi
d2ρ∼i|i gi,i∼i
dX2
i
 ρi d
dXi
(
ρ∼i|i
∂gi,i∼i
∂Xi
)]
dX = 1
2 E
(∂2gi,i∼i
∂X2
i
)
+ 1
2Ei
[ d2
dX2
i
E∼i(gi,i∼i⃒⃒⃒ Xi)
]
  Ei
[ d
dXiE∼i
(∂gi,i∼i
∂Xi⃒⃒⃒ Xi
)]
, thus yielding the result.
• A.6. Proof of (22a-c, 23a,b)
According to formula (2) of Liang [16], the rate of entropy transfer to Xi due to the influence of Xj is:
T Xj→Xi) =

∫
RD
ρj|i
∂ Fi ρ∼j
)
∂Xi dX + 1
2
∫
RD
ρj|i
∂2 gi,i ρ∼j
)
∂X2
i
dX (A.5)
Integration by parts with respect to Xi and assuming that lim
Xi→±∞ρj|iFi ρ∼j = 0, leads the deterministic term (first of the r.h.s.) of (A.5) to be written as:
∫
RD
Fi ρ∼j
∂ ρj|i
)
∂Xi dX =
∫
RD
ρj,∼jFiρ∼jρj|i
ρj,∼j
∂logρj|i
∂Xi dX = E
[
Fi ρj|i
ρj|∼j
∂log ρj|i
)
∂Xi
]
, (A.6)
where the full pdf writes as ρj,∼j leading to the expectation E[(…)] = ∫
RD
ρj,∼j (…)dX and we use the definition of conditional pdf ρj,∼j
ρ∼j
= ρj|∼j. Similar
procedure applied to the noise term (second of the r.h.s.) of (A.5) leads it to be written in a similar form of (A.6):
 1
2
∫
RD
∂ gi,i ρ∼j
)
∂Xi
∂ ρj|i
)
∂Xi dX =
∫
RD
ρj,∼j
ρ∼jρj|i
ρj,∼j
(
 1
2ρ∼j
∂ gi,i ρ∼j
)
∂Xi
) ∂logρj|i
∂Xi dX = E
[ (
 1
2ρ∼j
∂ gi,i ρ∼j
)
∂Xi
) ρj|i
ρj|∼j
∂log ρj|i
)
∂Xi
]
. (A.7)
The sum of deterministic and noise terms leads to the result by defining the generalized speed Ri = Fi  1
2ρ∼j
∂(gi,i ρ∼j)
∂Xi .
• A.7. Proof of (24, 25,26a-b)
The derivative of the cumulated distribution function (cdf) is the pdf, and thus the term appearing in the expected value (1a) writes as ∂log(ρj|i)
∂Xi =
1
ρj|i
∂2Pr(j|i)
∂Xi∂Xj =  1
ρj|i
∂2Prex(j|i)
∂Xi∂Xj . The manipulation of the full and conditional pdfs leads to
E
[
Ri ρj|i
ρj|∼j
∂log ρj|i
)
∂Xi
]
= 
∫
∼j
ρ∼j dX∼j
∫
j
Ri∂2Prex(j|i)
∂Xi∂Xj dXj (A.8)
where the ∼ j-integration means integration with respect to all variables different from Xj (i.e. X∼j) and ρ∼j is the pdf of X∼j. Applying integration by
parts with respect to Xj, we get
∫∞
 ∞
Ri∂2Prex(j|i)
∂Xi∂Xj dXj = Ri∂Prex(j|i)
∂Xi |Xj=∞
Xj= ∞ 
∫∞
 ∞
∂Prex(j|i)
∂Xi
∂Ri
∂Xj dXj. The first term vanishes because it depends on the de-
rivatives of a probability: zero or one, at Xj =  ∞ and Xj = ∞ respectively. After its substitution and recalling that ρ∼j = ρj,∼j
ρj|∼j
and applying the
expectation operator on the state-space, the result follows.
• A.8. Proof of (29a)
After expanding the expectation in terms of pdfs with Ri substituted by Ri,j we get:
T Xj→Xi) = E
[
Ri,j
ρj|i
ρj|i,k
∂log ρj|i
)
∂Xi
]
=
∫
i
ρi dXi
∫
j
∂ρj|i
∂Xi dXj
∫
k
ρk|i Ri,jdXk
=
∫
i
ρi dXi
∫
j
Ri,j
∂ρj|i
∂Xi dXj
(A.9)
where ¯Ri,j ≡ ∫
k
ρk|i Ri,jdXk = ¯Fi,j  1
2
∂¯gi,i,j
∂Xi  1
2
dlogρi
dXi ¯gi,i,j = ¯Fi,j  1
2ρi
∂ρi ¯gi,i,j
∂Xi with conditional averages over the outer variables given by ¯Fi,j ≡ ∫
k
ρk|i Fi,jdXk and
¯gi,i,j ≡ ∫
k
ρk|i gi,i,jdXk.
Integration by parts with respect to Xi, leads to: T(Xj→Xi) = =  ∫
j
dXj∫
i
dXiρj|i
∂ρiRi,j
∂Xi = T(Xj→Xi)F + T(Xj→Xi)g. The term due to the deterministic
term develops as:
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
24T Xj→Xi)
F = 
∫
j
dXj
∫
i
dXiρj|iρi
(∂¯Fi,j
∂Xi
)

∫
j
dXj
∫
i
dXiρj|i ¯Fi,j
(∂ρi
∂Xi
)
(A.10)
The first term of the r.h.s is  Ei,j
(∂¯Fi,j
∂Xi
)
, whereas in the second term we apply integration by parts with respect to Xi yielding:  ∫
j
dXj∫
i
dXiρj|iFi,j
(∂ρi
∂Xi
)
= ∫
i
ρidXi ∂
∂Xi
∫
j
ρj|iFi,jdXi = Ei
[ d
dXiEj(Fi,j⃒⃒ Xi)
]
, providing the formula of T(Xj→Xi)F.
• A.9. Proof of (29b)
The term due to the diffusivity is:
T Xj→Xi)
g = 1
2
∫
j
dXj
∫
i
dXiρj|i
∂2ρigi,i,j
∂X2
i
= 1
2
∫
j
dXj
∫
i
dXiρj|i
(
ρi∂2gi,i,j
∂X2
i
+ gi,i,j
∂2ρi
∂X2
i
+ 2 ∂gi,i,j
∂Xi
∂ρi
∂Xi
)
.
(A.11)
Application of integration by parts with respect to Xi, twice and once, to the second and third terms, respectively, leads to the result:
T Xj→Xi)
g = 1
2Ei,j
(
∂2¯gi,i,j
∂X2
i
)
+ 1
2Ei
[ d2
dX2
i
Ej ¯gi,i,j⃒⃒ Xi)]
 Ei
[ d
dXiEj
(∂¯gi,i,j
∂Xi⃒⃒⃒⃒ Xi
)]
(A.12)
• A.10. Proof of (36a)
Let us consider w.l.g. AF = f1(Xj)f2(Xi, Xk) = Fi,j. Let us build the terms appearing in the l.h.s. of Theorem 3. Then ¯Fi,j = f1Ek(f2|Xi) and ∂¯Fi,j
∂Xi =
f1Ek(f2|Xi)′ where the prime (double prime) stands for the first (second) derivative with respect to Xi. Then Ei,j
(∂¯Ri,j
∂Xi
)
= Ei(Ej(f1 |Xi)Ek(f2|Xi)′). Now,
Ej(¯Fi,j⃒⃒ Xi) = Ek(f2|Xi)Ej(f1|Xi), its derivative is d
dXiEj(¯Ri,j|Xi) = Ek(f2|Xi)′Ej(f1 |Xi) + Ek(f2|Xi)Ej(f1 |Xi)′ and the Xi expectation comes as Ei
[ d
dXiEj(¯Ri,j⃒⃒ Xi)
]
=
Ei(Ek(f2|Xi)′Ej(f1 |Xi) + Ek(f2|Xi)Ej(f1 |Xi)′). Subtracting Ei,j
(∂¯Ri,j
∂Xi
)
, we get T(Xj→Xi)AF = Ei
[
Ek(f2|Xi) d
dXiEj(f1|Xi)
]
.
• A.11. Proof of (36b)
Considering Ag = f3(Xj)f4(Xi, Xk) = gi,i,j, one obtains ¯gi,i,j = f3 Ek(f4⃒⃒ Xi). Now, playing with the terms whose Xi average is taken in T(Xj→Xi)g, we
get:
1
2Ej
(
∂2¯gi,i,j
∂X2
i
|Xi
)
= 1
2Ej(f3|Xi)Ek(f4|Xi)″ (A.13)
1
2
d2
dX2
i
Ej ¯gi,i,j|Xi) = 1
2Ej(f3|Xi)Ek(f4|Xi)″ + Ej(f3|Xi)′Ek(f4|Xi)′ + 1
2Ej(f3|Xi)″Ek(f4|Xi) (A.14)
 d
dXiEj
(∂¯gi,i,j
∂Xi⃒⃒⃒⃒ Xi
)
=  Ej(f3|Xi)Ek(f4|Xi)″  Ej(f3|Xi)′Ek(f4|Xi)′ (A.15)
where primes are derivatives with respect Xi. By summing up, and taking Xi averaging, we obtain
T Xj→Xi)
Ag = 1
2Ei
[
Ek(f4|Xi) d2
dX2
i
Ej(f3|Xi)
]
(A.16)
• A.12. Proof of (43b)
The equation governing ̂ Xi writes:
d̂ X i =̂ F i(̂ X, θ)dt + ∑Dn
k=1̂
Bi,k(̂ X, θ)dWk, (A.17)
where ̂ X is the changed vector, ̂ F i = ℑiFi and ̂ Bi,k = ℑiBi,k. The changed diffusion term comes as ̂ gii = ℑ2
i gii. By using the expression of Theorem 2 we
have:
T̂ X j→̂ X i) = E
[ 1̂
ρj|∼j
∂̂ Pr ex(j|i)
∂̂ X i
∂̂ Ri
∂̂ X j
]
(A.18)
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
25where hatted quantities (...)
∧
refer to quantities obtained with the changed variables. Then we take into account that: 1̂
ρ j|∼j
= ℑj
ρj|∼j
, ∂
∂̂ X j
= 1
ℑj
∂
∂Xj, ̂ Prex(j|i) =
Prob(̂ uj ≥̂ Xĵ⃒⃒ Xi) = Prob( uj ≥ Xj⃒⃒ Xi) = Prex(j|i) and ∂
∂̂ X i
= 1
ℑi
∂
∂Xi. Furthermore, we have ̂ Ri =̂ F i ̂ g i,i1
2
∂log(̂ ρ∼j)
∂̂ Xi
 1
2
∂̂ g i,i
∂̂ X i
. There, recall that ∂log(̂ ρ∼j)
∂̂ X i
= 1
ℑi
∂log(ρ∼j)
∂Xi
 1
ℑi
∂log(ℑi)
∂Xi and ∂̂ g i,i
∂̂ X i
= 1
ℑi
∂ℑ2
i gi,i
∂Xi = ℑi
∂gi,i
∂Xi + 2ℑigi,i∂log(ℑi)
∂Xi , which yields ̂ Ri = ℑi
(
Ri  1
2gi,i∂log(ℑi)
∂Xi
)
and the derivative ∂̂ R i
∂̂ Xj
= ℑi
ℑj
(∂Ri
∂Xj  1
2
∂gi,i
∂Xj
∂log(ℑi)
∂Xi
)
. Then, plugging all
the terms into T(̂ Xj→̂ Xi), we get the result.
Appendix B Technical Details about the RET estimation methods
• B.1. The fitting of nonlinear models with multiplicative noise
In order to fit the model, let us consider the empirical Xi time-derivatives, ˙Xi ≡ [Xi(t + dt)  Xi(t)]/dt, obtained with, either successive ensemble
realizations at a particular instant t or taken from a single time-series in the ergodic case.
Referring to [33], one can find the minimum mean square difference between ˙Xi and Fi by applying ordinary multivariate linear regression yielding
the fitted matrix of parameters through the matrix product: ̂
θ F = C 1
Ψ,Ψ E Ψ ˙X˙T ) (B.1)
where C 1
Ψ,Ψ is the inverse of the matrix of averaged function products CΨ,Ψ(r,s) = E(ΨrΨs) and matrix E(Ψ ˙X˙T) contains the average product entries
E(Ψ ˙XT)(r,s) = E(Ψr ˙Xs), where Ψ = (Ψ1, ….)T.
The fitting of the multiplicative noise is obtained from the residuals εi = ˙Xi  ∑
l̂ θF,l,iΨl(X). By dealing with the stochastic equation, their squares
are di = ε2
i = gii W2
i
dt , filling the vector d and where Wi ∼ N(0, 1) are independent white standard Gaussian noises. After multiplying ε2
i by the positive
basis-functions Φl and taking average, we obtain a linear system of equations in terms of the parameters θg,l,i. Therefore, the matrix of fitted parameters
is obtained as: ̂
θ g = dt C 1
Φ,Φ E[ΦdT] (B.2)
where C 1
Φ,Φ is the inverse of the matrix CΦ,Φ of averaged function products used to fit the diffusivities and (r, s)  entries of matrix E[ΦdT] are the
expectation products E(Φrε2
s ). The fitting is consistent only if ̂ θg,l,i.
The simplest example of 1D model with both a deterministic and a multiplicative noise part depending on one function each is
˙x˙dt = x(t + dt)  x(t) = [θF,0 + θF,1Ψ(x(t))]dt +̅̅̅̅ dt
√ [θg,0 + θg,1Φ(x(t))]1/2W(t) (B.3)
where W(t) ∼ N(0, 1) is a standard Gaussian white noise.
The fitted parameters are: ̂
θ F,0 = E( ˙x˙)  θF,1E(Ψ) (B.4a)̂
θ F,1 = cov( ˙x˙, Ψ)
var(Ψ) (B.4b)
The square errors of the tendency are ε2 = ˙x˙  [̂ θF,0 +θF,1Ψ(x)] from which one infers: ̂
θ g,0 = dt E ε2)  θg,1E(Φ) (B.5a)̂
θ g,1 = dt cov(ε2, Φ)
var(Φ) (B.5b)
• B.2. The Predictor-Corrector scheme
The stochastic differential equations are integrated in time using the predictor-corrector scheme described by the steps below:
X*
i,t+dt = Xi,t + dt Fi(Xt) +̅̅̅̅̅̅̅ 2dt
√ Bi(Xt)W1,t (B.6)
X**
i,t+dt = Xi,t + dt Fi X*
t
) +̅̅̅̅̅̅̅ 2dt
√ Bi X*
t
)W2,t (B.7)
Xi,t+dt = 1
2
(
X*
i,t+dt + X**
i,t+dt
)
(B.8)
where X*
i,t+dt, X**
i,t+dt are preliminar estimates of Xi at time t + dt and W1,t, W2,t are independent realizations of standard Gaussian white noise processes.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
26Appendix C List of Symbols and achronyms
Bi,k noise-diffusion coefficients merged in matrix B
dHXi
dt ,
(dHXi
dt
)
F
,
(dHXi
dt
)
g
Rate of entropy change (REC) and its deterministic and stochastic parts.
(dHXi
dt
)
g
,
(dHXi
dt
)
g,a
,
(dHXi
dt
)
g,m
Stochastic part of the rate of entropy change (REC) and its additive and multiplicative noise parts
dHXi ,self
dt ,
(dHXi ,self
dt
)
F
,
(dHXi ,self
dt
)
g
Self entropy generation (SEG) and its deterministic (D-RET) and stochastic (S-RET) parts
Fi, Fi,j component i of the vector F of deterministic terms and the part dependent on Xj only
F i,∼i,F(Xi), F i,∼i,g(Xi) Specific functions of D-RET T(X∼i→Xi) F and S-RET T(X∼i→Xi) g
F i,j,F(Xi), F i,j,g(Xi) Specific functions of the single D-RET and S-RET
gi,i, gi,i,j component i,i of the diffusivities, merged in matrix G and part dependent on Xj
HXi Shannon entropy of variable Xi
℘[... ] Frobenius Perron operator
Ri, Ri,j Component I of the generalized speed and the part dependent on Xj
T(X∼i→Xi), T(X∼i→Xi) F, T(X∼i→Xi) g Rate of entropy transfer (RET) between the complementary vector of Xi and its deterministic (D-RET) and stochastic (S-RET) parts
T(X∼i→Xi) sing, T(X∼i→Xi) syn RETs associated to single RETs and synergies
T(Xj→Xi), T(Xj→Xi) F, T(Xj→Xi) g Single rate of entropy transfer (RET) between the causal variable Xj and the consequential variable Xi and its deterministic (D-RET) and
stochastic (S-RET) parts
Xi, X∼i component i of the state vector X and its complementary vector
AN Analytical-Numerical Method
CSM Causal Sensitivity Method
MF Model Fitting followed by CSM
ML Multivariate Linear Method
MN Minimal CSM
References
[1] J. Pearl, Causality: Models, Reasoning and Inference, 2nd Ed., Cambridge
University Press, 2009, p. 484. ISBN 978-0-52-189560-6.
[2] C.W.J. Granger, Investigating causal relations by econometric models and cross-
spectral methods, Econometrica 37 (3) (1969) 424–438, https://doi.org/10.2307/
1912791.
[3] G. Tirabassi, C. Masoller, M. Barreiro, A study of the air–sea interaction in the
South Atlantic convergence zone through Granger causality Int, J. Climatol 35
(2015) 3440–3453, https://doi.org/10.1002/joc.4218.
[4] E. Bach, S. Motesharrei, E. Kalnay, A. Ruiz-Barradas, Local atmosphere–ocean
predictability: dynamical origins, lead times, and seasonality, J. Clim. 32 (2019)
7507–7519, 10.1175/JCLI-D-18-0817.1.
[5] H. Marko, The bidirectional communication theory–a generalization of information
theory, IEEE Trans. Commun. 21 (1973) 1345–1351, https://doi.org/10.1109/
TCOM.1973.1091610.
[6] P.-O. Amblard, O.J.J. Michel, The relation between granger causality and directed
information theory: a review, Entropy 15 (2013) 113–143, https://doi.org/
10.3390/e15010113.
[7] T. Schreiber, Measuring information transfer, Phys. Rev. Lett. 85 (2) (2000)
461–465, https://doi.org/10.1103/PhysRevLett.85.461.
[8] K. Hlavackova-Schindler, M. Palus, M. Vejmelka, J. Bhattacharya, Causality
detection based on information-theoretic approaches in time series analysis, Phys.
Rep. 441 (2007) 1–46, https://doi.org/10.1016/j.physrep.2006.12.004.
[9] M. Palus, A. Krakovsk´a, J. Jakubík, M Chvostekov´a, Causality, dynamical systems
and the arrow of time, Chaos: Interdiscip. J. Nonlinear Sci. 28 (7) (2018), 075307,
https://doi.org/10.1063/1.5019944.
[10] J. Runge, S. Bathiany, E. Bollt, G. Camps-Valls, D. Coumou, E. Deyle, C. Glymour,
M. Kretschmer, M.D. Mahecha, J. Muoz-Mar, E.H. van Nes, J. Peters, R. Quax,
M. Reichstein, M. Scheffer, B. Schlkopf, P. Spirtes, G. Sugihara, J. Sun, K. Zhang,
J Zscheischler, Inferring causation from time series in earth system sciences, Nat.
Commun. 10 (1) (2019) 2553, https://doi.org/10.1038/s41467-019-10105-3.
[11] X.S. Liang, R Kleeman, Information transfer between dynamical system
components, Phys. Rev. Lett. 95 (2005), 244101, https://doi.org/10.1103/
PhysRevLett.95.244101.
[12] X.S. Liang, R. Kleeman, A rigorous formalism of information transfer between
dynamical system components. I. Discrete mapping, Physica D 231 (2007) 1–9,
https://doi.org/10.1016/j.physd.2007.04.002.
[13] X.S. Liang, R. Kleeman, A rigorous formalism of information transfer between
dynamical system components. II. Continuous flow, Physica D 227 (2007)
173–182, https://doi.org/10.1016/j.physd.2006.12.012.
[14] X.S. Liang, Entropy evolution and uncertainty estimation with dynamical systems,
Entropy 16 (7) (2014) 3605–3634, https://doi.org/10.3390/e16073605.
[15] X.S. Liang, Unraveling the cause-effect relation between time series, Phys. Rev. E
90 (2014), 052150, https://doi.org/10.1103/PhysRevE.90.052150.
[16] X.S. Liang, Information flow and causality as rigorous notions ab initio, Phys. Rev.
E 94 (2016), 052201, https://doi.org/10.1103/PhysRevE.94.052201.
[17] X.S. Liang, Causation and information flow with respect to relative entropy, Chaos
28 (2018), 075311, https://doi.org/10.1063/1.5010253.
[18] X.S. Liang, Normalized multivariate time series causality analysis and causal graph
reconstruction, Entropy 23 (6) (2021), https://doi.org/10.3390/e23060679.
[19] A. Stips, D. Macias, C. Coughlan, E. Garcia-Gorriz, X.S. Liang, On the causal
structure between CO2 and global temperature, Sci. Rep. 6 (2016) 21691, https://
doi.org/10.1038/srep21691.
[20] D.F.T. Hagan, G. Wang, X.S. Liang, H.A.J Dolman, A time-varying causality
formalism based on the Liang-Kleeman information flow for analyzing directed
interactions in nonstationary climate systems, J. Climate 32 (21) (2019)
7521–7537, https://doi.org/10.1175/JCLI-D-18-0881.1.
[21] S. Vannitsem, Q. Dalaiden, H Goosse, Testing for dynamical dependence:
application to the surface mass balance over Antarctica, Geophys. Res. Lett. 46 (21)
(2019) 12125–12135, https://doi.org/10.1029/2019GL084329.
[22] D. Docquier, S. Vannitsem, F. Ragone, K. Wyser, X Liang, Causal links between
Arctic sea ice and its potential drivers based on the rate of information transfer,
Geophys. Res. Lett. 49 (2022), e2021GL095892, https://doi.org/10.1029/
2021GL095892.
[23] D.F.T. Hagan, H.A.J. Dolman, G. Wang, K.T.C.L.K. Sian, K. Yang, W. Ullah, R. Shen,
Contrasting ecosystem constraints on seasonal terrestrial CO2 and mean surface air
temperature causality projections by the end of the 21st century, Environ. Res.
Lett. 17 (2022), 124019, https://doi.org/10.1088/1748-9326/aca551.
[24] S. Vannitsem, X.S Liang, Dynamical dependencies at monthly and interannual time
scales in the climate system: study of the North Pacific and Atlantic regions, Tellus
A: Dyn. Meteorol. Oceanogr. 74 (2022) (2022) 141–158, https://doi.org/
10.16993/tellusa.44.
[25] D. Docquier, S. Vannitsem, A. Bellucci, The rate of information transfer as a
measure of ocean–atmosphere interactions, Earth Syst. Dynam. 14 (2023)
577–591, https://doi.org/10.5194/esd-14-577-2023.
[26] E.N. Lorenz, Deterministic nonperiodic flow, J. Atmos. Sci. 20 (2) (1963) 130–141,
https://doi.org/10.1175/1520-0469(1963)020<0130:DNF>2.0.CO;2.
[27] X.S. Liang, The Liang-Kleeman information flow: theory and applications, Entropy
15 (1) (2013) 327–360, https://doi.org/10.3390/e15010327, 2013.
[28] C.A. Pires, R.A.P Perdig˜ao, Non-Gaussian interaction information: estimation,
optimization and diagnostic application of triadic wave resonance, Nonlinear
Process Geophys. 22 (2015) 87–108, https://doi.org/10.5194/npg-22-87-2015.
[29] C.A. Pires, R.A.P. Perdig˜ao, Non-Gaussianity and asymmetry of the winter monthly
precipitation estimation from the NAO. Mon, Wea, Rev. 135 (2007) 430–448.
Vol1175/mwr3407.1.
[30] A. Feutrill, M. Roughan, A review of shannon and differential entropy rate
estimation, Entropy 23 (8) (2021) 1046, https://doi.org/10.3390/e23081046,
2021.
[31] H. Iba, J. Feng, H. Izadi Rad, GP-RVM: genetic programing-based symbolic
regression using relevance vector machine, in: 2018 IEEE International Conference
on Systems, Man, and Cybernetics (SMC), 2018, pp. 255–262, https://doi.org/
10.1109/SMC.2018.00054.
[32] A. Angelis, F. Sofos, T.E. Karakasidis, Artifcial intelligence in physical sciences:
symbolic regression trends and perspectives, Arch. Comput. Methods Eng. 30
(2023) 3845–3865, https://doi.org/10.1007/s11831-023-09922-z, 2023.
[33] D.A. Freedman, Statistical Models: Theory and Practice, Cambridge University
Press, 2009. ISBN 978-1-139-47731-4.
[34] P.D. Sardeshmukh, P. Sura, Reconciling non-Gaussian climate statistics with linear
dynamics, J. Clim. 22 (5) (2009) 1193–1207, https://doi.org/10.1175/
2008JCLI2358.1, 2009.
C.A. Pires et al.
Physica D: Nonlinear Phenomena 458 (2024) 133988
27[35] M.D. Chekroun, E. Simonnet, M Ghil, Stochastic climate dynamics: random
attractors and time-dependent invariant measures, Physica D 240 (2011)
1685–1700, https://doi.org/10.1016/j.physd.2011.06.005.
[36] J. Slingo, T. Palmer, Uncertainty in weather and climate prediction, Phil. Trans. R.
Soc. A 369 (2011) 4751–4767, https://doi.org/10.1098/rsta.2011.0161, 2011.
[37] M. Pe˜na, E. Kalnay, Separating fast and slow modes in coupled chaotic systems,
Nonlin. Processes Geophys. 11 (2004) 319–327, https://doi.org/10.5194/npg-11-
319-2004.
[38] C.A. Pires, R. Vautard, O. Talagrand, On extending the limits of variational
assimilation in nonlinear chaotic systems, Tellus 48A (1996) 96–121. https://
www.tandfonline.com/doi/abs/10.3402/tellusa.v48i1.11634.
[39] S. Kehui, J.C. Sprott, Dynamics of a simplified Lorenz system, Int. J. Bifurc. Chaos
19 (4) (2009) 1357–1366, https://doi.org/10.1142/s0218127409023688.
[40] S. Luzzatto, I. Melbourne, F. Paccaut, The Lorenz attractor is mixing, Commun.
Math. Phys 260 (2005) 393–401, https://doi.org/10.1007/s00220-005-1411-9.
[41] Li, Z., Izumida Y. (2023) Thermodynamic efficiency of atmospheric motion
governed by Lorenz system.arXiv:2302.03887v3 https://doi.org/10.48550/
arXiv.2302.03887.
[42] A.H. Monahan, Nonlinear principal component analysis by neural networks: theory
and application to the Lorenz system, J. Clim. 13 (2000) 821–835, https://doi.org/
10.1175/1520-0442(2000)013<0821:NPCABN>2.0.CO;2.
[43] N.V. Kuznetsov, T.N. Mokaev, O.A. Kuznetsova, E.V. Kudryashova, The Lorenz
system: hidden boundary of practical stability and the Lyapunov dimension,
Nonlinear Dyn. 102 (2) (2020) 713–732, https://doi.org/10.1007/s11071-020-
05856-4.
[44] J. Runge, J. Heitzig, N. Marwan, J. Kurths, Quantifying causal coupling strength: a
lag-specific measure for multivariate time series related to transfer entropy, Phys.
Rev. E 86 (2012), 061121, https://doi.org/10.1103/PhysRevE.86.061121.
[45] J. Runge, P. Nowack, M. Kretshcmer, S. Flaxman, D Sejdinovic, Detecting and
quantifying causal associations in large nonlinear time series analysis, Sci. Adv. 5
(11) (2019), https://doi.org/10.1126/sciadv.aau4996. VolIssue.
[46] A. Hannachi, S. Unkel, N.T. Trendafilov, I.T. Jolliffe, Independent component
analysis of climate data: a new look at EOF rotation, J. Clim. 22 (11) (2009)
2797–2812, https://doi.org/10.1175/2008JCLI2571.1.
[47] C.A. Pires, A. Hannachi, Independent component analysis of the sea surface
temperature variability: non-Gaussian sources and sensitivity to sampling and
dimensionality, Complexity 23 (2017), 3076810, https://doi.org/10.1155/2017/
3076810, 2017pages.
[48] C.A. Pires, A. Ribeiro, Separation of the atmospheric variability into non-Gaussian
multidimensional sources by projection pursuit techniques, Climate Dyn. (2016),
https://doi.org/10.1007/s00382-016-3112-9.
[49] D. Docquier, G. Di Capua, R.V. Donner, C.A.L. Pires, A. Simon, S. Vannitsem,
A comparison of two causal methods in the context of climate analyses, Nonlinear
Proc. Geophys. Discussion (2023), https://doi.org/10.5194/egusphere-2023-2212.
[50] Z. Liu, M Alexander, Atmospheric bridge, oceanic tunnel, and global climatic
teleconnections, Rev. Geophys. 45 (2007) RG2005, https://doi.org/10.1029/
2005RG000172.
[51] Sasaki, H., Hyv¨arinen, A., Sugiyama, M. (2014). Clustering via mode seeking by
direct estimation of the gradient of a log-density. In: Calders, T., Esposito, F.,
Hüllermeier, E., Meo, R. (eds) Machine Learning and Knowledge Discovery in
Databases. ECML PKDD 2014. Lecture Notes in Computer Science, vol 8726.
Springer, Berlin, Heidelberg. https://doi.org/10.1007/978-3-662-44845-8_2.
C.A. Pires et al.