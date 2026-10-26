# Full-text extraction

- Title: Information Flow and Causality as Rigorous Notions ab initio
- Year: 2016
- DOI: https://doi.org/10.1103/PhysRevE.94.052201
- PDF source: https://arxiv.org/pdf/1503.08389
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                                                       Information flow and causality
                                                                         as rigorous notions ab initio
                                                                                   X. San Liang∗
                                                              Nanjing Institute of Meteorology, Nanjing 210044, and
                                                             China Institute for Advanced Study, Beijing 100081, China
                                                                                 (Dated: March 31, 2015)
                                                                                        Abstract
arXiv:1503.08389v1 [nlin.CD] 29 Mar 2015




                                              Information flow (or information transfer as may be called) the widely applicable general physics
                                           notion can be rigorously derived from first principles, rather than axiomatically proposed as an
                                           ansatz. Its logical association with causality and, particularly, the most stringent one-way causality,
                                           if existing, is firmly substantiated and stated as a fact in proved theorems. Established in this study
                                           are the information flows among the components of time-discrete mappings and time-continuous
                                           dynamical systems, both deterministic and stochastic. They have been obtained explicitly in
                                           closed form, and all possess the property of causality, which reads: if a component, say xi , has
                                           an evolutionary law independent of xj , then the information flow from xj to xi vanishes. These
                                           results have been put to applications with benchmark systems, such as the Kaplan-Yorke map, the
                                           Rössler system, the baker transformation, the Hénon map, and a stochastic potential flow. Besides
                                           recovering the properties as expected from the respective systems, some of the applications show
                                           that the information flow structure underlying a complex trajectory pattern could be tractable. For
                                           linear systems, the resulting remarkably concise formula asserts analytically that causation implies
                                           correlation, while correlation does not imply causation, resolving unambiguously the long-standing
                                           debate over causation versus correlation.

                                           PACS numbers: 05.45.-a, 89.70.Cf, 89.75.Fb, 02.50.Ey, 05.45.Xt
                                           Keywords: Information flow, Causality, Shannon entropy, Predictability, Uncertainty propagation,
                                           Frobenius-Perron operator, Fokker-Planck equation, Stochastic process, Chaotic dynamical systems




                                           ∗
                                               Electronic address: sanliang@courant.nyu.edu,URL:http://www.ncoads.org.

                                                                                            1
I.   INTRODUCTION

    Information flow, or information transfer as it may be referred to in the literature, has
been realized as a fundamental notion in general physics. Though literally one may asso-
ciate it with communication, its importance lies far beyond in that it implies causation[1]-
[5], uncertainty propagation[6], predictability transfer[7], etc. In fact, it is the recognition
of its causality association that has attracted enormous interest from a wide variety of
disciplines, particularly in neuroscience[8]-[14], finance[15]-[16], climate science[17]-[18], tur-
bulence research[19]-[20], network dynamics[21]-[24], and dynamical systems particular in
the field of synchronization[25]-[31]. This recognition has been further substantiated by the
finding that transfer entropy[5] and Granger causality[32] are equivalent (up to a factor
2)[33].
    Historically, many information theoretic quantities have been proposed to measure infor-
mation flow, including time-delayed mutual information[34], transfer entropy[5], momentary
information transfer[18], causation entropy[35], to name a few. Among these most notably
is transfer entropy, which has spawned many varieties in its family, e.g., [15], [36], [11], and
has been widely applied in different disciplines.
    A fundamental question to ask is whether information flow needs to be axiomatically
proposed as an ansatz (as above), or it can be derived from the first principles in informa-
tion theory. Naturally, one would like to minimize or avoid the use of axioms in introducing
new concepts in order to have the material more coherent within the field to which it be-
longs. In physics, “flow” or “transfer” does have definite meaning, albeit the meaning may
differ depending on the context. One then naturally expects that the concept be rigorized.
Indeed, as we will see soon, at least within the framework of dynamical systems, informa-
tion flow/transfer can be rigorously derived from, rather than empirically or axiomatically
proposed with, Shannon entropy.
    Another impetus regards the inference of causality. As mentioned in the beginning, in-
formation flow arouses enormous interest in a wide range of fields not because of its original
meaning in communication but because of its logical implication of causation. Whether
the cause-effect relation underlying a system can be faithfully revealed is, therefore, the
touchstone for a formalism of information flow. That is to say, information flow should
be formulated with causality naturally embedded; it should, in particular, accurately re-
produce a one-way causality (if existing), which is unambiguously equal to zero on one
side. In this light, the widely used formalism namely transfer entropy is, unfortunately,
not as satisfactory one expects. This has even led to discussions on whether the two no-
tions, namely, information flow and causality , should be differentiated (e.g., [38]). Since
it is established that Granger causality and transfer entropy are equivalent, one may first
look at the problems from the former. Now it is well known that spurious Granger causal-
ity may arise due to unobserved variables that influence the system dynamics (a problem
identified by Granger himself)[39], due to low resolution in time[40][41], and due to observa-
tional noise[42]. Besides, Granger explicitly excludes deterministic systems in establishing
the causality formalism, a case that for sure is important in realistic problems. For trans-
fer entropy, the issue has just been systematically examined[44]. Aside from the failure in
recovering the many preset one-way causalities, evidence has shown that sometimes it may
even give qualitatively wrong results; see [44] and [43] for such examples.
    Realizing the limitation of transfer entropy, different alternatives have been proposed; the
above momentary information transfer is one of these proposals. The purpose of this study is,


                                               2
instead of just remedying the deficiencies of the existing formalisms, to put information flow
the fundamental physical notion on a rigorous footing so that it is universally applicable.
The stringent one-way causality requirement will not be just verified with certain given
examples, but rigorously proved as theorems.
   With this faith, recently Liang and Kleeman (2005)[45] take the initiative to study the
problem with dynamical systems. In this framework, the information source and recipient
are abstracted as the system components, and hence the problem is converted into the
information flow or information transfer between dynamical system components. The basic
idea can be best illustrated with a deterministic system of two components, say, x1 and x2 :
                                    dx1
                                        = F1 (x1 , x2 , t),                                (1)
                                     dt
                                    dx2
                                        = F2 (x1 , x2 , t),                                (2)
                                     dt
where we follow the convention in physics and do not distinguish random and deterministic
variables, which should be clear in the context. Now what we are to consider are the time
evolutions of the marginal entropies of x1 and x2 , denoted respectively as H1 and H2 . Look
at x1 , its marginal entropy evolution may be due to x1 itself or subject to the influence of
x2 . This partitions the mechanisms that cause H1 to grow into two exclusive parts. That
is to say, if we write the contribution from the former mechanism as dH ∗ /dt and that from
the latter as T2→1 ,
                                   dH1   dH1∗
                                       =      + T2→1 .                                     (3)
                                    dt    dt
This T2→1 is the very time rate of information flowing from x2 to x1 . We remark that this
setting is rather generic, except for the requirement of differentiability for the vector field
F = (F1 , F2 )T . In particular, the input-output communication problem can be cast within
the framework by letting, for example, F2 = F2 (x1 , t), F1 = F1 ((x1 , t), where x1 is the
input/drive and x2 the output/consequence, and the channel is represented by F2 .
    From the above argument, the evaluation of the information flow T2→1 may be fulfilled
through evaluating dH1∗ /dt. This is because that, when a dynamical system is given, the
density evolution is known through the corresponding Liouville equation, and, accordingly,
dH1 /dt can be obtained. In [45], Liang and Kleeman prove that the joint entropy of (x1 , x2 )
follow a very concise law
                                     dH
                                         = E(∇ · F),                                       (4)
                                      dt
where E is the operator of mathematical expectation. They then argue that

                                 dH1∗
                                                
                                             ∂F1
                                      =E           ,                                       (5)
                                  dt         ∂x1

and hence obtain the time rate of information flowing from x2 to x1

                               dH1 dH1∗
                                                             
                                                     1 ∂F1 ρ1
                       T2→1 =        −      = −E                ,                          (6)
                                 dt     dt           ρ1 ∂x1


                                              3
where ρ1 is the marginal probability density function of x1 . The thus-obtained information
flow is asymmetric between x1 and x2 ; moreover, it possesses a property of causality, which
reads, if the evolution of x1 does not depend on x2 , then T2→1 = 0.
    The above result is later on proved[47][48]. It is remarkable in that the stringent one-way
causality in a system, if existing, can be stated as a proven theorem, rather than a fact
for a formalism to verify; see [46] for a review. This result, however, is only for systems
of dimension 2 (2D). For systems with many components, it does not work any more. We
have endeavored to extend it to more general situations and do have obtained results for
deterministic systems of arbitrary dimensionality which possess the property of causality.
But, as we will see in the following section, the extension relies on an assumption that is,
again, axiomatically proposed. This makes the resulting formalism not one fully derived from
first principles, and as we realize later on, it does not work for multidimensional stochastic
systems. This line of work, though with a promising start, is stuck at this point.
    In this study, we will show that the assumption can be completely removed. In a unified
approach, the notion of information flow can be rigorously derived for both deterministic and
stochastic systems of arbitrary dimensionality. In the following, we first briefly set up the
framework, and show where the snag lies in the above approach. The solution is then pre-
sented, and applied to derive the information flows for deterministic mappings (section III),
continuous-time deterministic systems (section IV), stochastic mappings (section V), and
continuous-time stochastic systems (section VI). For the purpose of demonstration, each
section contains one ore more applications. As an important particular case, we specialize
to do the derivation for linear systems, and the material is presented in section VII. This
study is summarized in section VIII.


II.   THE SNAG THAT STUCK THE LIANG-KLEEMAN FORMALISM

    The success of the Liang-Kleeman formalism is remarkable. It is, however, only for 2D
dynamical systems. When the dimensionality exceeds 2, the resulting quantity, namely, (6),
is not the information transfer from x2 to x1 , but the cumulant transfer to x1 from all other
components x2 , x3 ,..., xn . In this sense, the use of (6) is rather limited.
    In order to extend the formalism to systems of higher dimensionality, Liang and
Kleeman[47][48] re-interpret the term dH1∗/dt in the above decomposition (3), for a 2D
system, as the evolution of H1 with the effect of x2 excluded. More specifically, it is the
evolution of H1 with x2 instantaneously frozen as a parameter at time t. To avoid confusing
with dH1∗ /dt, denote it as dH1\2 /dt, where the subscript \2 signifies that x2 is frozen, or that
its effect is removed. With this, the disjoint decomposition (3) is re-stated as
                                  dH1     dH1\2
                                      =         + T2→1 .                             (7)
                                   dt      dt
Note this decomposition, albeit seemingly with only a change of symbol, is actually fun-
damentally different from (3) in physical meaning; it now holds for systems of arbitrary
dimensionality. The information flow is, therefore,
                                             dH1 dH1\2
                                    T2→1 =       −     .                                      (8)
                                              dt   dt
                                        dH
   Of course, the key is how to find dt1\2 . In [47] and [48], Liang and Kleeman start with
discrete mappings, and then take the limit as the time stepsize goes to zero. To illustrate,

                                               4
let Φ : Rn → Rn be a mapping taking x(τ ) to x(τ + 1), from time step τ to τ + 1.
Correspondingly there is another mapping P : L1 (Rn ) → L1 (Rn ) that steers its density ρ
forward. This mapping is called a Frobenius-Perron operator; we will refer it to F-P operator
henceforth. Loosely speaking, P is, for any ω ⊂ Rn , such that[49]
                             Z              Z
                                Pρ(x)dx =          ρ(x)dx.                                (9)
                                       ω                      Φ−1 (ω)

When the sample space is in a Cartesian product form, as is in this case (Rn ), the operator
can be evaluated. Let a = (a1 , a2 , ..., an ) be some constant point, and ω = [a1 , x1 ] ×[a2 , x2 ] ×
... × [an , xn ]. It has be established that (e.g., [49])
                                     ∂n
                                              Z
                     Pρ(x) =                          ρ(ξ1 , ξ2, ..., ξn )dξ1dξ2 ...dξn .         (10)
                               ∂xn ...∂x2 ∂x1 Φ−1 (ω)
For convenience, a is usually taken to be the origin. Furthermore, if Φ is nonsingular and
invertible, then P can be explicitly written out
                               Pρ(x) = ρ Φ−1 (x) · |J −1 |
                                                 
                                                                                       (11)
where J is the Jacobian of Φ.
   As the F-P operator carries ρ forth from time step τ to τ + 1, accordingly the entropies
H, H1 , and H2 are also steered forward. On [τ, τ + 1], let H1 be incremented by ∆H1 . By
the foregoing argument, the evolution of H1 can be decomposed into two exclusive parts,
namely, the information flow from x2 , T2→1 , and the evolution with the effect of x2 excluded,
∆H1\2 . Hence, for discrete mappings, we have the following counterpart of (8):
                                             T2→1 = ∆H1 − ∆H1\2 .                                            (12)
   Liang and Kleeman derive the information flow for the continuous system from the dis-
crete mapping. So the whole procedure relies on how
                                        ∆H1\2 = H1\2 (τ + 1) − H1 (τ )
is evaluated, or, more specifically, how H1\2 (τ + 1) is evaluated (since H1 (τ ) is known). To
see where lies its difficulty, first notice that
                                          Z
                         H1 (τ + 1) = − (Pρ)1 (x1 ) log(Pρ)1 (x1 )dx1
                                                  R

which is the mean of − log(Pρ)1 (x1 ). Given Φ, P can be found in the way as shown above,
so H1 (τ + 1) is known. For H1\2 , however, things are much more difficult; − log(P\2 ρ)1 (x1 )
involves not only the random variable x1 (τ + 1), but also x2 (τ ) (embedded in the subscript
\2). What is the joint density of (x2 (τ ), x1 (τ + 1))? We do not know. In [47] and [48], an
approximation was proposed, which gives
                 Z
H1\2 (τ + 1) = − (P\2 ρ)1 (y1 ) log(P\2 ρ)1 (y1 ) · ρ(x2 |x1 , x3 , ..., xn ) · ρ3...n (x3 , ..., xn ) dy1dx2 dx3 ...dxn ,
                     Ω

where y1 is employed to signify x1 (τ + 1) and the symbol x1 is reserved for x1 (τ ). This is
a natural extension of what the authors use in the their original study[45] for 2D discrete
mappings. A central approximation is that they use
                           ρ(x2 |x1 , x3 , ..., xn ) · (P\2 ρ)1 (y1 )ρ3...n (x3 , ..., xn )

                                                          5
to represent the joint pdf of y1 and x2 (and x3 , ...xn ) (think about ρ(x2 |x1 )ρ(x1 ) = ρ(x1 , x2 )).
This is, however, only an approximation, since we really don’t know what the joint pdf of
(y1 , x2 ) is. As we will see soon, though the resulting formalism verifies dH1\2 /dt = dH1∗ /dt
for 2D systems and the zero-causality property for one-way causal deterministic systems,
when stochasticity gets in, the causality property cannot be recovered this way.


III.    DETERMINISTIC MAPPING

   A.    Derivation

    Fortunately, the issue that stuck the Liang-Kleeman formalism can be fixed; we actually
can get the entropy without appealing to the joint probability density function of (y1 , x2 ),
i.e., that of (x1 (τ + 1), x2 (τ )) as mentioned above. Consider a mapping

               Φ : Ω → Ω,         x(τ ) 7→ x(τ + 1) = (Φ1 (x), Φ2 )x), ..., Φn (x)) ,

where Ω is the sample space (Rn in particular). Let ψ : Ω → Ω be an arbitrary differentiable
function of x. We have the following theorem:
Theorem III.1

                                 Eψ(x(τ + 1)) = Eψ(Φ(x(τ ))).                                     (13)

Remark 1: The expectation operator E on the right hand side applies to a function of
x(τ ); it is thence with respect to ρ(τ ). Differently, the left hand side E is with respect to
ρ(τ + 1) = Pρ, where P is the F-P operator as introduced in (9).
   Remark 2: This equality is important in that one actually can obtain the expectation of
ψ(x(τ + 1)) without evaluating Pρ.
Proof. The following proof is in the framework of Riemann-Stieltjes integration. A more
general proof in terms of Lebesgue theory is also possible but is unnecessary, since the
functions and vector fields we are dealing with in this study are assumed to differentiable.
   Let {ω1 , ω2 , ..., ωn } be a partitioning of the sample space Ω. The elements are mutually
exclusive and Ω = ∪nk=1 ωk . To make it simple, assume that these ωk ’s have the same diameter
(the maximal distance between any two points in ωk ). For clarity, write x(τ + 1) as y, while
x is reserved for x(τ ). Then
                                       Z
                    Eψ(x(τ + 1)) =        Pρ(y)ψ(y)dy
                                        Ω
                           n Z
                           X                                     n
                                                                 X              Z
                  = lim               Pρ(y)ψ(y)dy = lim                ψ(yk )        Pρ(y)dy,
                     n→∞         ωk                     n→∞                     ωk
                           k=1                                   k=1
                                                                              R
where yk ∈ ωk is some point in ωk . The existence of the Riemann integral Ω Pρ(y)ψ(y)dy
assures that it can be any point in ωk as n goes to infinity, while the resulting integral is the
same. Now by (9),
                             Z                Z
                                 Pρ(y)dy =             ρ(x)dx.
                                  ωk                 Φ−1 (ωk )



                                                 6
So the above becomes
                                                            n
                                                            X              Z
                             Eψ(x(τ + 1)) = lim                   ψ(yk )        Pρ(y)dy
                                                    n→∞                    ωk
                                                            k=1
                                     n
                                     X              Z
                             = lim         ψ(yk )                 ρ(x)dx
                               n→∞                   Φ−1 (ωk )
                                     k=1
                                     Xn Z
                             = lim                      ρ(x)ψ(Φ(x))dx.
                               n→∞          Φ−1 (ωk )
                                     k=1

Notice,
  R     for Φ : Ω → Ω, Ω = ∪k ωk , it must be that ∪k Φ−1 (ωk ) = Ω. So the limit converges
to Ω ρ(x)ψ(Φ(x))dx. That is to say, Eψ(x(τ + 1)) = Eψ(Φ(x(τ ))). 
   The equality (13) actually can be utilized to derive the F-P operator. We look at the
particular case when Φ is invertible. By definition, Eq. (13) means
                     Z                         Z
                         ψ(x)ρ(τ + 1, x)dx =      ψ(Φ(x))ρ(τ, x)dx.
                         Ω                                   Ω

If Φ is invertible, the right hand side is Ω ψ(y) · ρ (τ, Φ−1 (y)) |J −1 | dy by transformation of
                                               R
variables. Since ψ is arbitrary, we have

                             Pρ = ρ(τ + 1, x) = ρ(τ, Φ−1 (x)) · J −1 ,

which is precisely the Frobenius-Perron operator (11).
   The above equality provides us a convenient and accurate way to evaluate H1 (τ + 1) and
H1 \2(τ + 1). Picking ψ as (log Pρ)1 and log(P\2 ρ)1 , we obtain, respectively, the following
formulas:
Corollary III.1

                                H1 (τ + 1) = −E log(Pρ)1 (Φ1 (x)),                           (14)
                                H1\2 (τ + 1) = −E log(P\2 ρ)1 (Φ1 (x)).                      (15)

In these formulas, both the expectations are taken with respect to ρ(x1 , x2 , ...xn ), i.e., the
pdf at time step τ . In (15), we do not need to care about the joint pdf ρ(y, x2 ) any more.
The information flow from x2 to x1 is, therefore,

Theorem III.2

                    T2→1 = E log(P\2 ρ)1 (Φ1 (x)) − E log(Pρ)1 (Φ1 (x)).                     (16)

Proof.

T2→1 = ∆H1 − ∆H1\2 = (H1 (τ + 1) − H1 (τ )) − (H1\2 (τ + 1) − H1 (τ )) = H1 (τ + 1) − H1\2 (τ + 1).

Substitute into the above formulas for H1 and H1\2 and (16) follows.
   Note that the evaluation of P\2 ρ and Pρ generally depends on the system in question.
But when Φ and Φ\2 are invertible, the information flow can be found explicitly in a closed
form.

                                                        7
    B.   Properties

Theorem III.3 For 2D systems, if Φ1 is invertible, then

                                ∆H1\2 = H1\2 (τ + 1) − H1 (τ ) = E log |J1 |.

Remark: This is the analog of (5) for discrete-time systems[45].
Proof. Let x(τ + 1) ≡ y. For a 2D system, and if Φ1 is invertible, we have

                                    (P\2 ρ)1 (y) = ρ1 (Φ−1           −1
                                                        1 (y1 )) · |J1 |,

which gives

                                 H1\2 = −Ex log ρ1 Φ−1 1 (y1 ) · |J1−1 |
                                                                       

                                      = −E log ρ1 (x1 )) · |J1−1 |
                                                                  

                                      = −E log ρ1 (x1 ) + E log |J1 |.

To avoid confusion, we use Ex to indicate that the expectation is with respect to x when
mixed variables x and y appear simultaneously. Note here x1 = Φ−1 1 (y1 ) since this is a 1D
system after x2 is frozen. Thus
                                   ∆H1\2 = E log |J1 |.


Theorem III.4 (Property of causality) If Φ1 is independent of x2 , then T2→1 = 0.

Proof. By the definition of the F-P operator,
            Z                       Z
                (P\2 ρ)1 (x1 )dx1 =           P\2 ρ(x1 , x3 , ..., xn )dx1 dx3 ...dxn
             ω1                      ω1 ×Rn−2
                                    Z
                                  =                 ρ\2 (x1 , x3 , ..., xn )dx1 dx3 ...dxn
                                                 Φ−1 \2 (ω1 ×Rn−2 )


for any ω1 ⊂ R. Note
                                 Φ−1 \2 (ω1 × Rn−2 ) = Φ−1 1\2 (ω1 × Rn−2 ).
That is to say,
             Z                               Z                   Z
                       (P\2 ρ)1 (x1 )dx1 =                 dx1           ρ\2 (x1 , x3 , ..., xn )dx3 ...dxn
                  ω1                         Φ−1 1\2 ω1           Rn−2
                                             Z                               Z
                                        =                  ρ1 (x1 )dx1 =                 ρ1 (x1 )dx1
                                             Φ−1 1\2 ω1                       Φ−1 1 ω1




                                                           8
since Φ1 (hence Φ−1 1 ) is independent of x2 . On the other hand,
                   Z                      Z
                         (Pρ)1 (x1 )dx1 =             Pρ(x)dx
                      ω1                    ω1 ×Rn−1
                                          Z
                                        =                    ρ(x)dx
                                            Φ−1 (ω1 ×Rn−1 )
                                          Z
                                        =                   ρ(x)dx
                                              −1       n−1
                                          ZΦ 1 ω1 ×R Z
                                        =            dx1         ρ(x)dx2 ...dxn
                                            Φ−1 1 ω1       Rn−1
                                          Z
                                        =            ρ1 (x1 )dx1 .
                                                   Φ−1 1 ω1
    R                       R                                                     a.e.
So ω1 (P\2 ρ)1 (x1 )dx1 =   ω1
                                 (Pρ)1 (x1 )dx1 , ∀ω1 ⊂ R, and hence (P\2 ρ)1 = (Pρ)1 . There-
fore,
                                 E log(Pρ)1 (x1 ) = E log(P\2 ρ)1 (x1 ),
and
                                 T2→1 = H1 (τ + 1) − H1\2 (τ + 1) = 0.



    C.   Application–Kaplan-Yorke map

   Once a dynamical system is specified, in principle the information flow can be obtained.
This subsection presents an application with a discrete-time dynamical system, the Kaplan-
Yorke map[50], that exhibits chaotic behavior.
   The Kaplan-Yorke map is defined as a mapping Φ = (Φ1 , Φ2 ) : [0, 1] × R → [0, 1] × R,
(x1 , x2 ) 7→ (y1 , y2 ), such that
                                   y1 = Φ1 (x1 , x2 ) = 2x1 mod 1,                        (17)
                                   y2 = Φ2 (x1 , x2 ) = αx2 + cos(4πx1 ).                 (18)
A typical trajectory for α = 0.2 is plotted in Fig. 1. We now compute the information flows
between the two components.
   First we need to find the F-P operator Pρ(y1 , y2). Pick a domain ω = [0, y1 ] × [0, y2].
By (10)
                                         ∂2
                                              Z
                       Pρ(y1 , y2 ) =                 ρ(ξ1 , ξ2)dξ1 dξ2 ,              (19)
                                      ∂y2 ∂y1 Φ−1 (ω)
so the key is the finding of Φ−1 (ω). Since
                                                              0 ≤ x1 ≤ 21 ,
                                  
                                     2x1 ,
                             y1 =
                                     2x1 − 1,                 x1 > 21
it is easy to obtain
                                                  h y i 1 1 + y 
                                                       1        1
                                Φ−1
                                 1 ([0, y1 ]) =    0,    ∪ ,       .                      (20)
                                                      2    2 2

                                                     9
                                   1


                                  0.5




                             2
                            x
                                   0


                                 −0.5


                                  −1
                                             0.2      0.4        0.6    0.8
                                                            x1


FIG. 1: The attractor of the Kaplan-Yorke map (17)-(18) with α = 0, 2. To avoid the round-off
error in the computation which will quickly lead to a zero x1 , we let b = 9722377, and instead
compute an+1 = 2an mod b, x1,n+1 = an /b, x2,n+1 = αx2,n + cos(4πx1,n ). The trajectory is
initialized with x1 = 7722377/b, x2 = 0. (The initial points outside the attractor are not shown.)



Given y1 , x1 may be either y1 /2 or (1 + y1 )/2, but either way, cos(4πx1 ) = cos(2πy1 ). Thus
                                                                      
                     −1                        cos 2πy1 y2 − cos 2πy1
                   Φ2 ({y1 } × [0, y2]) = −            ,                 .                  (21)
                                                   α           α
Eq. (19) is, therefore,
                               Z y1 /2      Z y2 −cos 2πy1
                        ∂2                             α
    Pρ(y1 , y2) =                      dξ1                   ρ(ξ1 , ξ2 )dξ2
                      ∂y2 ∂y1 0               −
                                                 cos 2πy1
                                                     α
                      Z (1+y1 )/2      Z y2 −cos 2πy1
             ∂2                                 α
         +                        dξ1                    ρ(ξ1 , ξ2 )dξ2
           ∂y2 ∂y1 1/2                  −
                                          cos 2πy1
                                              α
                                                                          
       1        y1 y2 − cos 2πy1                    1 + y1 y2 − cos 2πy1
    =      ρ        ,                     +ρ                ,
      2α         2          α                           2               α
          "Z                                                                                               #
              y1 /2                                            Z (1+y1 )/2                         
       1              ∂           y2 − cos 2πy1                              ∂          y2 − cos 2πy1
     +                   ρ ξ1 ,                          dξ1 +                   ρ ξ1 ,                 dξ1 .
       α 0           ∂y1                 α                          1/2      ∂y1              α
   To compute T2→1 , freeze x2 . The resulting mapping Φ\2 is the dyadic mapping in the x1
direction. As above,
                                          h y i 1 1 + y 
                            −1                 1           1
                          Φ\2 ([0, y1 ]) = 0,    ∪ ,          ,
                                              2    2   2
which gives
                                           ∂
                                              Z
                             P\2 ρ(y1 ) =                    ρ1 (ξ1 )dξ1
                                          ∂y1 Φ−1 ([0,y 1 ])
                                             \2                      
                                          1      y1               1 + y1
                                        =    ρ1        + ρ1                 .
                                          2      2                    2

                                                    10
On the other hand,
                Z
   (P)1 (y1) =     Pρ(y1 , y2 )dy2
                     R
                                            Z y1 /2                   Z (1+y1 )/2
                  1 y1       1 1 + y1               ∂                             ∂
                = ρ1 ( ) + ρ1 (         )+              ρ1 (ξ1 )dξ1 +                 ρ1 (ξ1)dξ1
                  2     2    2      2        0      ∂y1                1/2        ∂y1
                                       
                  1       y1        1 + y1
                =    ρ1      + ρ1              .
                  2       2           2
So
                         T2→1 = E log(P\2 ρ)1 (y1 ) − E log(Pρ)1 (y1 ) = 0,                        (22)
just as one would expect based on the independence of Φ1 on x2 . This serves as a validation
of Theorem III.4.
   To compute T1→2 , notice
                                                               
                        −1              cos 4πx1 y2 − cos 4πx1
                      Φ\1 ([0, y2]) = −         ,                 .
                                            α          α
The corresponding F-P operator is such that
                         Z y2 −cos 4πx1                                 
                      ∂           α                  1     y2 − cos 4πx1    1
       (P\1 ρ)(y2 ) =                   ρ2 (ξ2 )dξ2 = ρ2                   = ρ2 (x2 ),
                      ∂y2 − cos 4πx
                                α
                                    1                α           α          α

which makes sense, considering that, when x1 is frozen, y2 is just a translation followed by
a rescaling of x2 . On the other hand, the marginal density
                 Z 1
   (Pρ)2 (y2 ) =        Pρ(y1 , y2 )dy1
                   0
         Z 1                                                         
      1            y1 y2 − cos 2πy1              1 + y1 y2 − cos 2πy1
   =           ρ       ,                   +ρ          ,                     dy1
     2α 0          2            α                  2           α
         Z 1     "Z                                                                                      #
                       y1 /2                                 Z (1+y1 )/2                         
      1                      ∂          y2 − cos 2πy1                      ∂          y2 − cos 2πy1
    +        dy1                 ρ ξ1 ,                  dξ1 +                 ρ ξ1 ,                 dξ1 .
      α 0            0       ∂y1              α                 1/2        ∂y1              α

Because of the intertwined y1 and y2 , these integrals cannot be explicitly evaluated without
specifications of ρ. But when ρ is given, it is a straightforward exercise to compute
                                    Z 1Z
             −E log(Pρ)2 (y2 ) = −         log(Pρ)2 (Φ2 (x1 , x2 ))ρ(x1 , x2 )dx1 dx2 .
                                         0   R

Denote it by H̃2 . Then
                  T1→2 = E log(P\1 ρ)2 (Φ2 (x1 , x2 )) − E log(Pρ)2 (Φ2 (x1 , x2 ))
                         Z 1Z
                                1
                       =          ρ2 (x2 )ρ(x1 , x2 )dx1 dx2 + H̃2
                          0   R α
                       = H̃2 − H2 /α.                                                              (23)
Generally this does not vanish. That is to say, within the Kaplan-Yorke map, there exists a
one-way information flow from x1 to x2 .

                                                 11
   D.    Applications–The baker transformation and Hénon map revisited

   Since its establishment, the Liang-Kleeman formalism has been applied to a variety of
dynamical system problems. Hereafter we will re-study some benchmark examples and see
whether the results are different. In this subsection we look at the baker transformation and
Hénon map.


   1.   Baker transformation

   The baker transformation is an extensively studied prototype of area-conserving chaotic
maps that has been used to model the diffusion process in real physical world. It mimicks
the kneading of dough: first the dough is compressed, then cut in half; the two halves are
stacked on one-another, compressed, and so forth; see Fig. 2 for an illustration. In formal
language, it is Φ : Ω → Ω, Ω = [0, 1] × [0, 1] being a unit square,

                             (2x1 , x22 ),            0 ≤ x1 ≤ 12 , 0 ≤ x2 ≤ 1,
                           
             Φ(x1 , x2 ) =                                                              (24)
                             (2x1 − 1, 21 x2 + 12 ),  1
                                                      2
                                                        < x1 ≤ 1, 0 ≤ x2 ≤ 1.

It is invertible, and the inverse is
                               x1
                 −1             ( 2 , 2x2 ),                0 ≤ x2 ≤ 12 , 0 ≤ x1 ≤ 1,
               Φ (x1 , x2 ) =                                                               (25)
                                ( x12+1 , 2x2 − 1),         1
                                                            2
                                                              ≤ x2 ≤ 1, 0 ≤ x1 ≤ 1.

Thus the F-P operator P can be easily found

                                                           ρ( x21 , 2x2 ),  0 ≤ x2 < 21 ,
                                                       
                                −1            −1
                                        
          Pρ(x1 , x2 ) = ρ Φ (x1 , x2 ) · J        =          1+x1                          (26)
                                                           ρ( 2 , 2x2 − 1), 21 ≤ x2 ≤ 1.

   We now use the above theorem to compute T2→1 . Integrating (26) with respect to x2 ,
                                 Z 1/2                Z 1
                                     x1                        x1 + 1
               (Pρ)1 (x1 ) =       ρ( , 2x2 ) dx2 +        ρ(         , 2x2 − 1) dx2
                              0       2                1/2        2
                             1 1  x1
                               Z                                   
                                                      x1 + 1
                           =        ρ     , x2 + ρ              , x2     dx2
                             2 0       2                2
                                                         
                             1     x 
                                      1          x1 + 1
                           =    ρ1       + ρ1                .                              (27)
                             2       2              2

When x2 is frozen as a parameter, the baker transformation (24) becomes a dyadic mapping
in x1 direction, i.e., a mapping Φ1 : [0, 1] → [0, 1],

                                     Φ1 (x1 ) = 2x1 (mod 1).

For any 0 < x1 < 1, The counterimage of [0, x1 ] is
                                             h x i 1 1 + x 
                                −1                1        1
                               Φ ([0, x1 ]) = 0,    ∪ ,       .
                                                 2    2 2



                                                12
So
                                                ∂
                                                                  Z
                              (P\2 ρ)1 (x1 ) =                                     ρ(s) ds
                                               ∂x1                 Φ−1 ([0,x1 ])
                                                       Z x1 /2               Z (1+x1 )/2
                                                   ∂                       ∂
                                                =              ρ(s) ds +                 ρ(s) ds
                                                  ∂x1 0                   ∂x1 1/2
                                                                          
                                                  1  x1            1 + x1
                                                =    ρ         +ρ              .
                                                  2      2              2
Thus
                                                      (P\2 ρ)1 (x1 ) = (Pρ)1 (x1 ).
By the above theorem,
                              T2→1 = E log(P\2 ρ)1 (Φ1 (x)) − E log(Pρ1 (Φ1 (x)) = 0.
     To compute T1→2 , observe
                      Z 1                   R1                                         x1
                                                                                                                     0 ≤ x2 < 21 ;
                                                                                                  
                                                 ρ                                          , 2x2 dx1 ,
        (Pρ)2 (x2 ) =     Pρ(x1 , x2 ) dx1 = R01                                         2
                                                                                        x1 +1                                                   (28)
                                                                                                               dx1 , 12 ≤ x2 ≤ 1.
                                                                                                         
                       0                      0
                                                 ρ                                         2
                                                                                               , 2x2 − 1
By Proposition ??,
     H2 (τ + 1) = −Ex log(Pρ)2 (Φ2 (x1 , x2 ))
          Z 1/2              Z 1                  Z 1               Z 1                
                                    λ                                         λ+1
     =−         ρ2 (x2 ) log      ρ( , x2 )dλ dx2 −      ρ2 (x2 ) log      ρ(     , x2 )dλ dx2
           0                   0    2                1/2                0      2
                                               !
          Z    1/2             Z              1/2     Z                  Z               1                           1
     =−              ρ2 (x2 ) log 2                   ρ(ξ, x2 )dξ         dx2 −                ρ2 (x2 ) log 2              ρ(ξ, x2 )dξ dx2
           0                              0                                             1/2                       1/2
                         Z 1/2                        Z 1/2                       !             Z 1                    Z 1                 
     = − log 2 −                 ρ2 (x2 ) log                     ρ(ξ, x2 )dξ         dx2 −             ρ2 (x2 ) log              ρ(ξ, x2 )dξ dx2 ,
                          0                             0                                         1/2                       1/2

so
∆H2 = H2 (τ + 1) − H2 (τ )
                Z 1/2              Z 1/2            !      Z 1              Z 1            
    = − log 2 −       ρ2 (x2 ) log       ρ(ξ, x2 )dξ dx2 −     ρ2 (x2 ) log      ρ(ξ, x2 )dξ dx2
                                 0                             0                                         1/2                      1/2
                Z 1Z 1                                 Z 1                          
           +                   ρ(x1 , x2 ) · log                      ρ(λ, x2 )dλ          dx1 dx2
                     0    0                                   0
        = − log 2 + (I + II),
where
                                              Z 1/2                      "         R1                     #
                                                                                      0
                                                                                        ρ(λ, x2 )dλ
                                     I =                    ρ2 (x2 ) · log R 1/2     dx2 ,                                                      (29)
                                                  0
                                                                 0
                                                                     ρ(λ,   x2 )dλ
                                          Z 1          "     R1                 #
                                                                 ρ(λ,  x 2 )dλ
                                     II =      ρ(x2 ) · log R 10                   dx2 .                                                        (30)
                                           1/2               1/2
                                                                   ρ(λ, x 2 )dλ

                                                                             13
   To compute H2\1 , notice that, when x1 is frozen, the transformation is invertible; moreover,
the Jacobian J2 = 1/2 is a constant. By Theorem III.3,
                                                     1
                                  ∆H2\1 = E log        = − log 2,                              (31)
                                                     2
which gives

                                T1→2 = ∆H2 − ∆H2\1 = I + II.                                   (32)

It is easy to show that I + II > 0. In fact, obviously I + II is nonnegative; besides, the two
brackets cannot be zero simultaneously, so it cannot be zero. Hence T1→2 is strictly positive;
that is to say, there is always information flowing from the abscissa to the ordinate.
    To summarize, T2→1 = 0, T1→2 = I + II > 0. These results are precisely the same as those
obtained before in [45] and [47]. That is to say, for the baker transformation, the current
formalism shows no difference from the previous one based on heuristic arguments and with
approximations.




 10000000
  1111111
  0000000
  1111111                          1                                  10000000
                                                                       1111111
                                                                       0000000
                                                                       1111111
  0000000
  1111111                                                              1111111
                                                                       0000000
  0000000
  1111111
  0000000
  1111111                                                              1111111
                                                                       0000000
                                                                       1111111
                                                                       0000000
  1111111
  0000000
  0000000
  1111111                         1/2 000000
                                      111111
                                           111111
                                           000000                      1111111
                                                                       0000000
1/2
  1111111
  0000000                             111111
                                      000000
                                           000000
                                           111111
                                      111111
                                      000000
                                           111111
                                           000000
                                                                       0000000
                                                                       1111111
                                                                     1/2
                                                                       1111111
                                                                       0000000
  1111111
  0000000
  0000000
  1111111                             000000
                                      111111
                                           000000
                                           111111                      0000000
                                                                       1111111
  1111111
  0000000                             000000
                                      111111
                                           111111
                                           000000                      1111111
                                                                       0000000
  0000000
  1111111                             000000
                                      111111
                                           000000
                                           111111
                                      111111
                                      000000
                                           111111
                                           000000                      1111111
                                                                       0000000
                                                                       0000000
                                                                       1111111
    0   1              2              0    1    2                        0   1             2

FIG. 2: A schematic of the unidirectional information flow from the abscissa to the ordinate upon
applying the baker transformation.




   2.   Hénon map

   The Hénon map is a mapping Φ = (Φ1 , Φ2 ) : R2 7→ R2 defined such that

                              Φ1 (x1 , x2 ) = 1 + x2 − ax21 ,
                           
                                                                                               (33)
                              Φ2 (x1 , x2 ) = bx1 ,

with a > 0, b > 0. The case with parameters a = 1.4 and b = 0.3 is called a “canonical
Hénon map,” whose attractor is shown in Fig. 3.
   It is easy to see that the Hénon map is invertible; its inverse is
                                           x              a 2
                              −1             2
                            Φ (x1 , x2 ) =     , x1 − 1 + 2 x2 .                 (34)
                                            b              b
The F-P operator thus can be easily found from (11):

                           Pρ(x1 , x2 ) = ρ(Φ−1 (x1 , x2 ))|J −1 |

                                                14
                                0.2




                           2
                                  0


                         x
                               −0.2

                                       −1               0          1
                                                        x1

          FIG. 3: A typical trajectory of the canonical Hénon map (a = 1.4, b = 0.3).


                                             1  x2            a 
                                         =     ·ρ   , x1 − 1 + 2 x22 .                      (35)
                                             b    b           b
In the following we compute the flows between the quadratic component x1 and the linear
component x2 .
   Look at T2→1 first. By (16), we need to find the marginal density of x1 at step τ + 1 with
and without the effect of x2 , i.e., (Pρ)1 and (Pρ)1\2 . From (35), (Pρ)1 is
                                 Z
                 (Pρ)1 (x1 ) =       Pρ(x1 , x2 ) dx2
                                   R
                                      1  x2               a 
                                 Z
                             =          ·ρ     , x1 − 1 + x22 dx2
                                      b      b             b
                                 ZR
                             =       ρ(η, x1 − 1 + aη 2 ) dη.     (x2 /b ≡ η)
                                  R

If a = 0, this would give ρ2 (x1 − 1), i.e., the marginal pdf of x2 with argument x1 − 1. But
here a > 0, the integration is taken along a parabolic curve rather than a straight line. Still
the final result will be related to the marginal density of x2 ; for notational simplicity, write

                                      (Pρ)1 (x1 ) = ρ̃2 (x1 ).                              (36)

   To find (P\2 ρ)1 , use y1 to denote

                                   Φ1 (x1 ) = 1 + x2 − ax21 ,

following our convention to distinguish variables at different steps. Modify the system so
that x2 is now a parameter. As before, we need to find the counterimage of (−∞, y1 ] under
the transformation with x2 frozen:
                                  p                  i hp                       
       Φ−1
         1  ((−∞, y 1 ]) =  −∞,  −   (1 + x2 − y 1 )/a ∪    (1 + x2 − y 1 )/a, ∞   .



                                                15
Therefore,
                             d
                                Z
         (P\2 ρ)1 (y1 ) =                       ρ1 (s) ds
                            dy1 Φ−11 ((−∞,y1 ])
                   Z −√(1+x2 −y1 )/a                      Z ∞
               d                                      d
          =                            ρ1 (s) ds +                      ρ1 (s) ds
             dy1 −∞                                  dy1 √(1+x2 −y1 )/a
                         1           h  p                              p                   i
          = p                         ρ1 − (1 + x2 − y1 )/a + ρ1              (1 + x2 − y1 )/a
             2 a(1 + x2 − y1 )
                                                                   (y1 < 1 + x2 )
                 1
          =            [ρ1 (−x1 ) + ρ1 (x1 )] .        (recall y1 = 1 + x2 − ax21 )
             2a|x1 |
Denote the average of ρ1 (−x1 ) and ρ1 (x1 ) as ρ̄1 (x1 ) to make an even function of x1 . Then
P\2 ρ)1 is simply
                                                        ρ̄1 (x1 )
                                     (P\2 ρ)1 (y1 ) =             .                                (37)
                                                         a|x1 |
Note that the parameter x2 does not appear in the arguments. Substitute all the above into
(16) to get
                 T2→1 = E log(P\2 ρ)1 (y1) − E log(Pρ)1 (y1 )
                              ρ̄1 (x1 )
                      = E log           − E log ρ̃2 (1 + x2 − ax21 )
                                a|x1 |
                      = E log ρ̄1 (x1 ) − E log |ax1 | − E log ρ̃2 (1 + x2 − ax21 ).
Comparing this to the result in [47], except for the term −E log |ax1 |, all other terms are
different.
    Next consider T1→2 . From (35), the marginal density of x2 at τ + 1 is
                                      Z
                        (Pρ)2 (x2 ) =     Pρ(x1 , x2 ) dx1
                                        R
                                                               x22
                                                                  
                                          1     x2
                                      Z
                                    =       ρ      , x1 − 1 + a 2 dx1
                                        R b     b              b
                                      1                   1  x2 
                                         Z
                                    =       ρ(y, ξ) dξ = ρ1          .
                                      b R                 b     b
Thus
                          H2 = −E(Pρ)     2 (y2 )               
                                     1  x2             1  x2 
                                 Z
                             = −       ρ1         · log ρ1         dx2
                                   R b       b           b   b
                             = H1 + log b.
The evaluation of H2\1 is much easier. As x1 is frozen as a parameter, y2 becomes definite.
In this case, the 2D random variable is degenerated to a 1D variable. Correspondingly P\1 ρ
becomes a pdf in x1 only. So
                                           Z
                                (P\1 ρ)2 =    P\1 ρdx1 = 1.
                                                 R


                                                16
Thus H2\1 = −E log(P\1 ρ)2 = 0. By (16), the information flow from x1 to x2 is, therefore,

                              T1→2 = H2 − H2\1 = H1 + log b.                               (38)

In other words, the flow from x1 to x2 is equal to the marginal entropy of x1 , modified by
an amount related to the factor b. Particularly, when b = 1, T1→2 = H1 . This is precisely
the same as what is obtained before in [47].
   In a summary, the information flows within the baker transformation are precisely the
same as we have obtained before in [47]. For the Hénon map, the flow from x1 to x2 , has
recovered the benchmark result based on physical grounds. But T2→1 is generally different
from that in [47].


IV.     CONTINUOUS-TIME DETERMINISTIC SYSTEMS

   A.    Deriving the information flow

  Now look at the information flow within the continuous system, the 2D version of which
motivates this line of work:
                                       dx1
                                            = F1 (t; x1 , x2 , ..., xn ),                  (39)
                                        dt
                                       dx2
                                            = F2 (t; x1 , x2 , ..., xn ),                  (40)
                                        dt
                                         ..             ..
                                          .              .                                 (41)
                                       dxn
                                           = Fn (t; x1 , x2 , ..., xn ),                   (42)
                                        dt
or, in vectorial form,
                                             dx
                                                = F(t; x).                                 (43)
                                             dt
Consider a time interval [t, t + ∆t]. Following [48], we discretize the ordinary differential
equation and construct a mapping Φ : Rn → Rn , x(t) 7→ x(t + ∆t) = x + F∆t. Correspond-
ingly there is a Frobenius-Perron operator P : L1 (Rn ) → L1 (Rn ), ρ(t) 7→ ρ(t + ∆t). Write
x(t + ∆t) as y, a convention we have been using all the time to avoid confusion. Then the
mapping Φ : x 7→ y is such that

                               y1 = x1 + F1 (x1 , x2 , ..., xn )∆t,
                            
                            
                             y2 = x2 + F2 (x1 , x2 , ..., xn )∆t,
                            
                                  ..        ..                                          (44)
                            
                            
                                  .         .
                               yn = xn + Fn (x1 , x2 , ..., xn )∆t.

Its Jacobian is
                                                   1 + ∂F                   ∂F1
                                                                                      
                                                     ∂x1
                                                          1
                                                            ∆t . . .        ∂xn
                                                                                ∆t
                                  ∂y                   .       ..             ..
                    J = det                = det 
                                                      ..          .           .
                                                                                       
                                  ∂x
                                                                                       
                                                        ∂Fn
                                                        ∂xn
                                                            ∆t     . . . 1 + ∂F
                                                                             ∂xn
                                                                                n
                                                                                  ∆t

                                                   17
                               X ∂Fi
                       = 1+          ∆t + o(∆t)
                                i
                                 ∂xi
                       = 1 + ∇ · F∆t + o(∆t).                                                 (45)
As ∆t → 0, J → 1 6= 0, so Φ thus constructed is always invertible for ∆t small enough.
Moreover, it is easy to obtain the inverse mapping
                                 Φ−1 : x = y − F∆t + o(∆t)                                    (46)
and J −1 = 1 − ∇ · F∆t + o(∆t). So
                       Pρ(y) = ρ(Φ−1 (y)) · |J −1 |
                             = ρ(y − F∆t) · (1 − ∇ · F∆t) + o(∆t)
                             = ρ(y) − ∇ρ · F∆t − ρ∇ · F∆t + o(∆t)
                             = ρ(y) − ∇ · (ρF)∆t + o(∆t).
As a verification, check
                           ∂ρ       Pρ(x) − ρ(x)
                              = lim              = −∇ · (ρF).
                           ∂t ∆t→0      ∆t
This yields the Liouville equation ∂ρ∂t
                                         + ∇ · (ρF) = 0, as is expected.
  With Pρ we now can compute the marginal density
                                                     ∂ρF1
                                              Z
                   (P)1 (y1 ) = ρ1 (y1 ) − ∆t             dy2 ...dyn + o(∆t)
                                                Rn−1 ∂y1

which gives
                                                                                       
                                                       ∆t       ∂ρF1
                                                           Z
      − log(Pρ)1 (y1 ) = − log ρ1 (y1 ) − log 1 −                     dy2 ...dyn + o(∆t)
                                                       ρ1 Rn−1 ∂y1
                                            ∆t           ∂ρF1
                                                  Z
                       = − log ρ1 (y1 ) +                     dy2...dyn + o(∆t)
                                          ρ1 (y1 ) Rn−1 ∂y1
                                                      ∆t          ∂ρF1
                                                            Z
                       = − log ρ1 (x1 + F1 ∆t) +                       dx2 ...dxn + o(∆t).
                                                    ρ1 (x1 ) Rn−1 ∂x1
At the last step, the y ′s have been replaced by x′ s in the integral term. This is legitimate
since the difference goes to higher order terms.
   We now evaluate the marginal entropy increase at t + ∆t. The following is the key step:
Take expectation on both sides, the left hand side with respect to (Pρ)1 (y1 ), while the right
hand side with respect to ρ1 (x1 ). This yields
                                                     Z                        
                                                     1        ∂ρF1
     H1 (t + ∆t) = −E log ρ1 (x1 + F1 ∆t) + ∆tE                    dx2 ...dxn + o(∆t).
                                                     ρ1 Rn−1Z ∂x1
                                ∂ρρ1                  1           ∂ρF1
                                                Z
                  = H1 (t) − E       F1 ∆t + ∆t ρ1 dx1                  dx2 ...dxn + o(∆t).
                                ∂x1               R  ρ1      Rn−1 ∂x1

Note the third term on the right hand side vanishes after integration with respect to x1 due
to the compactness of the functions. So
                                                           
                                                   ∂ log ρ1
                   H1 (t + ∆t) = H1 (t) − ∆tE F1              + o(∆t),
                                                     ∂x1

                                              18
and hence
                                                                   
                   dH1        H1 (t + ∆t) − H1 (t)         ∂ log ρ1
                       = lim                       = −E F1            .                            (47)
                    dt   ∆t→0         ∆t                     ∂x1
This is precisely the same as that either from the F-P operator[47] or directly from the
Liouville equation[45], serving a validation of our approach in this study.


   When x2 is frozen as a parameter on [t, t+ ∆t], we need to examine the modified mapping
Φ\2 : Rn−1 → Rn−1
                              y1 = x1 + F1 (x1 , x2 , ..., xn )∆t,
                            
                            
                             y3 = x3 + F3 (x1 , x2 , ..., xn )∆t,
                            
                                 ..         ..                                        (48)
                            
                                 .          .
                              yn = xn + Fn (x1 , x2 , ..., xn )∆t,
                            

i.e., the mapping Φ with the equation y2 = x2 +F2 ∆t removed, and x2 frozen as a parameter.
Again, here xi stands for xi (t), and yi for xi (t + ∆t). For convenience, we further adopt the
following notations:
                                          y\2 = (y1 , y3 , ..., yn )T ,
                                          x\2 = (x1 , x3 , ..., xn )T ,
                                          F\2 = (F1 , F3 , ..., Fn )T .
Besides, use ρ\2 to signify the joint density of x\2 , and ρ1\2 to denote the density of x1 with
x2 frozen as a parameter on [t, t + ∆t]. Notice the fact ρ1\2 = ρ1 at time t.
   It is easy to know that the Jacobian of Φ\2
                                    y\2
                                                   X ∂Fi
                         J\2 = det       = 1 + ∆t              + o(∆t).                     (49)
                                    x\2               i6=2
                                                           ∂xi


The corresponding F-P operator P\2 : L1 (Rn−1 → L1 (Rn−1 is such that
                   P\2 ρ\2 (y) = ρ\2 (Φ−1 \2 (y)) · |J\2−1 |
                                                                                 !
                                                                  X ∂Fi
                               = ρ\2 (y\2 − F\2 ∆t) ·       1−                  ∆t   + o(∆t)
                                                                          ∂xi
                                                                  i6=2
                               = ρ\2 (y\2 ) − ∇ · (ρ\2 F\2 )∆t + o(∆t).
Integrate with respect to (y3, ..., yn ) (recall that x2 is now a parameter) to get
                                                        ∂ρ\2 F1
                                                   Z
               (P\2 ρ\2 )1 (y1 ) = ρ1\2 (y1 ) − ∆t              dy3...dyn + o(∆t),                 (50)
                                                    Rn−2 ∂y1

where other terms vanish due to the compactness assumed for the functions. Hence
                                                                      ∂ρ\2 F1
                                                                                       
                                                            ∆t
                                                                   Z
    − log(P\2 ρ\2 )1 (y1 ) = − log ρ1\2 (y1) − log 1 −                        dy3...dyn + o(∆t)
                                                        ρ1\2 (y1 )     ∂y1
                                                          ∆t         ∂ρ\2 F1
                                                                  Z
                           = − log ρ1\2 (x1 + F1 ∆t) +                       dx3 ...dxn + o(∆t).
                                                       ρ1\2 (x1 )     ∂x1

                                                    19
Note in the integral term, the y ′ s have been replaced by x′ s; this is legitimate as the difference
goes to the higher order terms. Since ρ1\2 (x1 ) = ρ1 (x1 ) at t, so

                                                          ∂ρ1
                         ρ1\2 (x1 + F1 ∆t) = ρ1 (x1 ) +       F1 ∆t + o(∆t)
                                                          ∂x1
and hence
                                         1 ∂ρ1            ∆t           ∂ρ\2 F1
                                                                   Z
     − log(P\2 ρ\2 )1 (y1 ) = − log ρ1 −        F1 ∆t +                        dx3 ...dxn + o(∆t).
                                         ρ1 ∂x1         ρ1 (x1 )        ∂x1

Take expectation on both sides, the left hand side with respect to the joint probability density
of (y1 , x2 ), while the right hand side with respect to (x1 , x2 ). This is the key step that makes
the present study fundamentally different from [48] which relies on an approximation to
fulfill the derivation. This yields

                                                                                       ∂ρ\2 F1
                                              
                                      ∂ log ρ1            ρ12 (x1 , x2 )
                                                      Z                          Z
H1\2 (t + ∆t) = Ht (t) − ∆tE F1                  + ∆t                    dx1 dx2               dx3 ...dxn + o(∆t)
                                        ∂x1            R2   ρ1 (x1 )               Rn−2 ∂x1
                                                              ∂ρ\2 F1
                                              
                                      ∂ log ρ1
                                                      Z
                = Ht (t) − ∆tE F1                + ∆t ρ2|1            dx + o(∆t),
                                        ∂x1            R       ∂x1

where ρ2|1 is the conditional density of x2 on x1 . Thus

                      dH1\2                                   ∂ρ\2 F1
                                                 Z
                                        ∂ log ρ1
                            = −E F1                +     ρ2|1         dx.                            (51)
                        dt                ∂x1         Rn       ∂x1

We therefore arrive at the following theorem:

Theorem IV.1
               dH1 dH1\2                     ∂ρ\2 F1                 ∂F1 ρ\2
                                                              Z                       
                                                              1
                                    Z
        T2→1 =     −     =−             ρ2|1         dx = −E                 dx3 ...dxn .            (52)
                dt   dt              Rn       ∂x1             ρ1 Rn−2 ∂x1

   B.    An alternative derivation

   For the continuous system
                                           dx
                                              = F(x, t),                                             (53)
                                           dt
consider an interval [t, t + ∆t], and a mapping

                       Φ : Rn → Rn ,  x(t) 7→ x(t + ∆t) = x(t) + F∆t.
                                        R
Recall that by definition Eψ(x(t+ ∆t) = ψ(x)ρ(x, t+ ∆t)dx, +o(∆t), for any test function
ψ, and

                      Eψ(x(t + ∆t) = Eψ(x(t) + F∆t + o(∆t))
                                   = E [ψ(x(t)) + ∇ψ · F∆t + o(∆t)] .


                                                 20
Note the expectation on the left hand side is with respect to ρ(t + ∆t), and that on the right
is with respect to ρ(t). This way we obtain the Liouville equation.
    Now let ψ be the functional log(P\2 ρ)1 . When x2 is frozen, on interval [t, t + ∆t], there
is a Liouville equation
                           ∂ρ\2 ∂F1 ρ\2 ∂F3 ρ\2                   ∂Fn ρ\2
                                +           +          + ... +            =0                     (54)
                            ∂t        ∂x1       ∂x3                ∂xn
for
R ρ\2 the joint density of (x1 , x3 , ..., xn ). The equation for its marginal density ρ1\2 =
      ρ dx3 ...dxn is, after integration with respect to (x3 , x4 , ..., xn ) and with the considera-
  Rn−2 \2
tion of the compact support assumption,
                              ∂ρ1\2      ∂
                                             Z
                                    +               F1 ρ\2 dx3 ...dxn = 0.
                               ∂t       ∂x1 Rn−2
Divided by ρ1\2 , this yields
                           ∂ log ρ1\2            1 ∂F1 ρ\2
                                         Z
                                       +                     dx3 ...dxn = 0.
                               ∂t          Rn−2 ρ1\2 ∂x1

Discretizing, and noticing the fact ρ1\2 (t) = ρ1 (t),
                                                                1 ∂F1 ρ\2
                                                       Z
         log ρ1\2 (t + ∆t; x1 ) = log ρ1 (t; x1 ) − ∆t                    dx3 ...dxn + o(∆t),
                                                          Rn−2 ρ1\2 ∂x1

which is log(P\2 ρ)1 (x1 ). As conventional, let x(t + ∆t) ≡ y and leave x for x(t) to avoid
confusion. We actually need to find
            log(P\2 ρ)1 (y1 ) = log ρ1\2 (t + ∆t; y1)
                                                        1 ∂F1 ρ\2
                                                 Z
                = log ρ1 (t; x(t + ∆t)) − ∆t                       dx3 ...dxn + o(∆t)
                                                  Rn−2 ρ1\2 ∂x1
                                    ∂ log ρ1                     1 ∂F1 ρ\2
                                                        Z
                  = log ρ1 (t; x) +          F1 ∆t − ∆t                     dx3 ...dxn + o(∆t).
                                      ∂x1                  Rn−2 ρ1\2 ∂x1

Taking expectation and multiplying by (-1) on both sides, we obtain
                                                                              1 ∂F1 ρ\2
                                                        
                                                ∂ log ρ1
                                                                     Z
        H1\2 (t + ∆t) = H1 (t) − ∆tE F1                     + ∆tE                       dx3 ...dxn .
                                                   ∂x1                 Rn−2 ρ1 ∂x1
So
  dH1\2           H1\2 (t + ∆t) − H1 (∆t)                   1 ∂F1 ρ\2
                                                                                                      
                                                                                              ∂ log ρ1
                                                    Z
        = lim                                 =E                       dx3 ...dxn − E F1                 .
   dt      ∆t→0               ∆t                      Rn−2 ρ1 ∂x1                               ∂x1
On the other hand, from the Liouville equation it is easy to obtain
                                      dH1                  ∂F1 ρ
                                              Z
                                            =       log ρ1       dx.                                       (55)
                                       dt       Rn          ∂x1
Hence
                        dH1 dH1\2
              T2→1 =          −
                          dt       dt
                                                       1 ∂F1 ρ\2
                                                                                                
                               ∂F1 ρ                                                    ∂ log ρ1
                  Z                           Z
                =       log ρ1       dx − E                      dx3 ...dxn + E F1
                   Rn          ∂x1             R n−2 ρ1   ∂x1                            ∂x1
                                    ∂F1 ρ\2
                                                       
                           1
                             Z
                = −E                        dx3 ...dxn ,                                                   (56)
                          ρ1 Rn−2 ∂x1
which is the same as (52) in Theorem IV.1.

                                                    21
    C.    Properties

Theorem IV.2 For a 2D system
                                   dx1
                                       = F1 (x1 , x2 , t),
                                    dt
                                   dx2
                                       = F2 (x1 , x2 , t),
                                    dt
we have
                                   dH1\2
                                                        
                                                   ∂F1
                                         =E                  .                    (57)
                                    dt             ∂x1

Remark: This recovers Eq. (5), the key equation originally obtained by Liang and
Kleeman[45] through heuristic argument. Here we rigorously prove it.
Proof. When n = 2, ρ\2 = ρ1 , hence

                      dH1\2
                                                                 
                                      1 ∂F1 ρ1          ∂ log ρ1
                              = E                −E              F1
                        dt           ρ1 ∂x1               ∂x1
                                                                    
                                     ∂F1       ∂ρ1 1        ∂ log ρ1
                              = E        + F1         − F1
                                     ∂x1       ∂x1 ρ1         ∂x1
                                        
                                     ∂F1
                              = E          .
                                     ∂x1



Theorem IV.3 Property of causality
For the system (39)-(42), if F1 is independent of x2 , then T2→1 = 0.

Proof. If F1 has no dependence on x2 , so is F1 ρ\2 . Thus

                                                   ∂F1 ρ\2
                                      Z                              
                                        1
                         T2→1 = −E                         dx3 ...dxn
                                       ρ1 Rn−2 ∂x1
                                                   ∂F1 ρ\2
                                   Z
                              = −       ρ(x2 |x1 )         dx
                                    Rn               ∂x1
                                          ∂F1 ρ\2
                                   Z
                              = −                  dx1 dx3 ...dxn
                                    Rn−1 ∂x1
                              = 0.
               R
where the fact ρ(x2 |x1 )dx2 = 1 and the assumption of compact support have been used.





                                             22
   D.   Application–Rössler system

   In this subsection, we present an application study of the information flows within the
Rössler system:
                                          dx
                                             = Fx = −y − z,                                                 (58)
                                          dt
                                          dy
                                             = Fy = x + ay,                                                 (59)
                                          dt
                                          dz
                                             = Fz = b + z(x − c),                                           (60)
                                          dt
where a, b, and c are parameters. Otto E. Rössler finds a chaotic attractor for a = 0.2,
b = 0.2, c = 5.7 ([51]), as shown in Fig. 4. From the figure the trajectories are limited
within [−12, 12] × [−14, 10] × [0, 25].

               10                                                50

                5                                                40

                0                                                30
          y




                                                             z




               −5                                                20

              −10                                                10

              −15                                                0
               −20    −10        0        10       20            −20       −10         0         10   20
                                 x                                                     x


               50

               40                                                60

                                                                 40
               30
                                                             z
           z




                                                                 20
               20
                                                                  0
               10                                                20
                                                                                                       20
                                                                       0
                                                                                                 0
               0
               −15   −10    −5        0        5   10                  y         −20   −20   x
                                 y


                                      FIG. 4: The Rössler attractor.


   To calculate the information flows, one needs to obtain the joint probability density
function ρ(x1 , x2 , x3 ). It is, of course, obtainable through solving the Liouville equation

                                     ∂ρ ∂Fx ρ ∂Fy ρ ∂Fz ρ
                                        +    +     +      =0
                                     ∂t   ∂x   ∂y    ∂z
with some initial condition ρ0 . However, there is another way, namely, ensemble forecast,
which is more efficient in terms of computational load. As illustrated in Fig. 5, instead of

                                                        23
solving the Liouville equation, we solve the Rössler systems initialized with an ensemble of
initial values of x. This ensemble is formed with entries randomly drawn according to the
initial pdf ρ0 . At each time step, we count the bins thus obtained and estimate the pdf. The
resulting pdf is the desired ρ.
   The Rössler system (58)-(59) is solved using the second order Runge-Kutta method with
a time step size ∆t = 0.01. A typical computed trajectory is plotted in Fig. 4. The initial
conditions are randomly drawn according to a Gaussian distribution N(µ, Σ), the mean
vector and covariance matrix being, respectively,
                                                          
                                     8                 4 0 0
                              µ =  2 ,        Σ =  0 4 0 .
                                     10                0 0 4
The initial mean values are chosen rather randomly (in reference to Fig. 4); µx is chosen
large to make dHdt
                   = E(∇ · F) = µx − 5.5 positive.
   Pick a computation domain Ω ≡ [−16, 16] × [−18, 14] × [−4, 28], clearly covers the at-
tractor. We discretize it into 320 × 320 × 320 = 32, 768, 000 bins with ∆x = ∆y = ∆z = 0.1.
To ensure one draw for each bin on average, in the beginning we make 32, 768, 000 random
draws. As the ensemble scheme is carried forth, ρ and all other statistics can be estimated as
a function of time. By Theorem IV.1 the information flow rates are computed accordingly.


                                                   Random draw of      Ensemble of
                               ρ(t)                X based on ρ(t)      X at time t




                         Integrate the Liouville                     Integrate the Rossler
                         eqn one time step                           system one time step
                         forward                                     forward




                                                                     Ensemble of X
                             ρ(t+ ∆ t)               Bin counting
                                                                     at time (t+ ∆t)




FIG. 5: A schematic of ensemble prediction. Instead of solving the Liouville equation for the
density ρ, we make random draws according to the initial distribution ρ(t0 ) to form an ensemble,
then let the Rössler system steer forth each member of the ensemble. At each time step, bins are
counted and the probability density function is accordingly estimated.


   For a system with three components (x, y, z), there are in total 6 flow pairs: Tx→y ,
Ty→z , Tz→x , Tx→z , Ty→x , Tx→z . A first examination of the system tells that dy/dt does not
depend on z and dz/dt does not depend on y. By the property of causality (Theorem IV.3),
Tz→y and Ty→z must vanish. The computational results reconfirm this. In Fig. 6, the two
are essentially zero. What makes the results surprisingly interesting is that Tx→z is also
insignificant, while the dependence of dz/dt on x is explicitly specified. Besides, Tz→x is also
small. In the figure are essentially the flows between x and y: Ty→x and Tx→y .
   The above information flow scenario motivates us to check the system with only      x andy
                                                                                        0 −1
two components. This is an amplifying harmonic oscillator dx       = Ax where A =              ,
                                                                dt                      1 a

                                                        24
                                  1.5

                                      1

                                  0.5

                                      0



                          T
                              −0.5

                                  −1

                              −1.5
                                          1              2                    3         4
                                                                      t

FIG. 6: The time series of the information flow rates within the Rössler system (in nats per unit
time). Dashed: Ty→x ; dotted: Tx→y ; solid: Tz→x . Other flows are essentially zero in this duration.
The initial segments are not shown as some trajectories are still outside the attractor.


                          0.4

                                                                                  T
                                                                                  y→x
                          0.2


                              0


                         −0.2
                                              Tx→y


                         −0.4
                                  1                  2                    3             4
                                                                  t

FIG. 7: The time series of the information flow rates within the amplifying harmonic system as
shown in the text (in nats per unit time).



a linear system allowing the information flow, say, from y to x, to be simply expressed
as Ty→x = a12 σσ12
                11
                   (see below in section VII). That is to say, here the covariance matrix
Σ = (σij ) completely determines the flow. The evolution of Σ follows
                                                 dΣ
                                                    = AΣ + ΣAT .
                                                 dt
                  
               4 0
Initialized by      , σij can be easily computed; the resulting Ty→x and Tx→y are shown
               0 4
in Fig. 7. Comparing to those in Fig. 6, the general trend, including the period, seems to be

                                                             25
similar, though the geometry of the curves has been modified from harmonic into a seesaw
ones. Besides, the Tx→y (Ty→x ) is always negative (positive) for the harmonic oscillator,
while for the Rössler system, they can be both negative and positive. Note the parameter a
in A does not explicitly appear in the formula, but it does contributes to the generation of
the information flow. One may easily check that, if it is zero, then dΣ dt
                                                                           = 0, and hence the
flow rates will stay zero if originally σ12 = 0.
    The above example is just used for the demonstration of application and, in some cases,
for the validation of the proven theorems such as the property of causality. The seemingly
vanishing Tx→z in spite of the dependence of dz/dx on x for sure deserves further investigation
but is beyond the scope of this study. Here we just want to mention that this does conform
to the observations with complex systems–Emergence does not result from rules only (e.g.,
[53]-[54]). It has long been found that regular patterns may emerge out of irregular motions
with some simple preset rules; a good example is the 2D turbulent flow in natural world
(e.g., [55]). Clearly, these simple, rudimentary rules are not enough for explaining the causal
efficacy and the bottom-up flow of information that leads to the emergence of the organized
structure. As commented by Corning[56], “Rules, or laws, have no causal efficacy; they do
not in fact generate anything... the underlying causal agencies must be separately specified.”
We shall see a more remarkable example in the following subsection.


   E.   Application—The truncated Burgers-Hopf system revisited

   Here we re-examine the Truncated Burgers-Hopf system (TBS hereafter), a chaotic system
which seemingly has rather simple information flow structures in the studies of Liang and
Kleeman[48]. For a detailed description of the system itself, see [58]. In this section we only
examine the following particular case:
                              dx1
                                  = F1 (x) = x1 x4 − x3 x2 ,                          (61)
                               dt
                              dx2
                                  = F2 (x) = −x1 x3 − x2 x4 ,                         (62)
                               dt
                              dx3
                                  = F3 (x) = 2x1 x2 ,                                 (63)
                               dt
                              dx4
                                  = F4 (x) = −x21 + x22 .                             (64)
                               dt
As we have described before, the system is intrinsically chaotic, with a strange attractor
embedded in
                 [−24.8, 24.6] × [−25.0, 24.5] × [−22.3, 21.9] × [−23.7, 23.7].
   The information flow within the TBS cannot be found analytically. As before, we use the
ensemble prediction technique to estimate the density evolution, and then evaluate the T ’s.
The setting and procedure are made precisely the same as that in [48] in order to facilitate
a comparison. Details are referred to the original paper and will not be presented here.
   Figure 8 plots the results for the case with a Gaussian initial distribution N(µ, Σ), where
                                                2             
                                 µ1                σ1 0 0 0
                                µ2              0 σ2 0 0 
                                                        2
                         µ=        ,
                                µ3        Σ  =  0 0 σ32 0  ,
                                                                
                                 µ4                0 0 0 σ42

                                             26
with µ = (9, 9, 9, 9), σ 2 = (9, 9, 9, 9). Shown specifically are the time rates of the 12 infor-
mation flows:

                                        T2→1 ,   T3→1 ,         T4→1 ;
                                        T1→2 ,   T3→2 ,         T4→2 ;
                                        T1→3 ,   T2→3 ,         T4→3 ;
                                        T1→4 ,   T2→4 ,         T3→4 .

The results are qualitatively the same as before in [48]. That is to say, except for T3→2 ,
which is distinctly different from zero, all others are either negligible, or oscillatory around
zero. But, of course, the present flows are much smaller in magnitude, in comparison to the
one obtained before in [48] using the approximate formula.


 1                   T              1                      T              1                   T
                         2→1                                   3→1                                4→1

 0                                  0                                     0

−1                                 −1                                    −1

     3   4   5       6         7        3    4     5       6         7        3   4   5       6         7

 1                   T              1                                     1                   T
                         1→2                                                                      4→2

 0                                  0                                     0
                                                           T
                                                               3→2
−1                                 −1                                    −1

     3   4   5       6         7        3    4     5       6         7        3   4   5       6         7

 1                   T              1                      T              1                   T
                         1→3                                   2→3                                4→3

 0                                  0                                     0

−1                                 −1                                    −1

     3   4   5       6         7        3    4     5       6         7        3   4   5       6         7

 1                   T              1                      T              1                   T
                         1→4                                   2→4                                3→4

 0                                  0                                     0

−1                                 −1                                    −1

     3   4   5       6         7        3    4     5       6         7        3   4   5       6         7
                 t                                     t                                  t

FIG. 8: Information flows between the components of the 4D truncated Burgers-Hopf system in
the invariant chaotic attractor.




                                                 27
V.    STOCHASTIC MAPPING

     A.   Derivation

     Consider the system
                                x(τ + 1) = Φ(x(τ )) + B(x)w,                           (65)
where Φ : Rn → Rn is an n-dimensional mapping, B is an n × m matrix, and w an m-
dimensional normally distributed random vector, representing an m-dimensional standard
Wiener process. Without loss of generality, we assume the covariance matrix of w, Σ = I,
since the perturbation amplitude can be put into B.
   In general, B may depend on x. But this complicates the derivation a lot. For simplicity,
in this section we only consider the case when B is a constant n × m matrix. As x(τ ) is
taken to x(τ + 1), there exists an operator, written P : L1 (Rn ) → L1 (Rn ), steering the
pdf at time step τ , ρ, to the pdf at step τ + 1, Pρ. Since x(τ ) and w are independent,
if B is a constant matrix, one may view x(τ + 1) as the sum of two independent random
variables, and then conjecture that Pρ be the convolution of PΦ ρ and some joint Gaussian
distribution. Here PΦ stands for the F-P operator associated with the mapping Φ. This is
indeed true, as is stated in the following theorem.

Theorem V.1
                                      Z
                           Pρ(y) =               PΦ ρ(y − Bw) · ρw (w)dw               (66)
                                         Rn

where
                                                                 1   T   −1 w
                           ρw (w) = (2π)−m/2 (det Σ)−1/2 e− 2 w Σ               .

Proof. We first assume that Φ is invertible to make the approach more transparent to the
reader. As always, write x(τ + 1) as y to avoid confusion. Make a transformation:
                                    
                                      y = Φ(x) + Bw,
                                Π:                                                  (67)
                                      z = w.
Its Jacobian
                                      ∂Φ           
                        ∂(y, z)             B          ∂Φ
               Jπ = det           = det ∂x      = det     = JΦ ≡ J.                    (68)
                        ∂(x, w)          0 I           ∂x
The inverse mapping is
                                                 x = Φ−1 (y − Bz),
                                             
                                    −1
                                  Π      :                                             (69)
                                                 w = z.
For any Sy ∈ Rn , Sz ∈ Rm ,
               Z                         Z
                        ρyz (y, z)dydz =                 ρxw (x, w)dxdw
                 Sy ×Sz                    Π−1 (Sy ×Sz )
                                         Z
                                                  ρxw Π−1 (y, z) · Jπ−1 dydz.
                                                                   
                                       =
                                                   Sy ×Sz


                                                     28
So
                          ρyz (y, z) = ρxw Π−1 (y, z) · Jπ−1
                                                     

                                     = ρxw Φ−1 (y − Bz), z) · J −1
                                                            

                                     = ρ Φ−1 (y − Bz) · J −1 · ρw (z),
                                                       

where the independence between x and w has been used (hence ρxw = ρx ·ρw ). P(y) = ρy (y)
is thence the marginal density by integrating out z:
                              Z
                                  ρ Φ−1 (y − Bz) · J −1 · ρw (z) dz.
                                                  
                    Pρ(y) =
                                  Rn

Since ρ (Φ−1 (y)) · |J −1 | = PΦ ρ(y), the theorem thus follows.
   When Φ is singular or noninvertible, let its F-P operator be PΦ , then ∀Sy ∈ Rn , Sz ∈ Rm ,
                          Z                             Z
                                   ρyz (y, z)dydz =                    ρxw (x, z)dxdz
                            Sy ×Sz                       Π−1 (Sy ×Sz )
                             Z
                          =                  ρ(x) · ρw (z)dxdz
                               Π−1 (Sy ×Sz )
                             Z                Z
                          =       ρw (z)dz               ρ(x)dx.
                               Sz              Φ−1 Sy−Bz
                             Z                Z
                          =       ρw (z)dz           PΦ ρ(x) dx
                               Sz              Sy−Bz
                             Z                Z
                          =       ρw (z)dz        PΦ (y − Bz)dy.
                             Sz           Sy

The conclusion follows accordingly. 
   With the above theorem, the information flow can be easily computed. Note the theorem
actually states that
                                  Pρ(y) = Ew PΦ ρ(y − Bw)                                (70)
where Ew signifies the expectation taken with respect to w. So
                  H1 (τ + 1) = −Ey log(Pρ)1 (y1 )
                                    Z                                
                             = −Ex log       Ew PΦ ρ(y − Bw)dy2...dyn
                                               Rn−1
                              = −Ex [log Ew (PΦ ρ)1 (y1 − B1 w)] ,
where B1 ≡ (b11 , b12 , ..., b1m ) is the row vector. Likewise,
                              P\2 ρ(y\2 ) = Ew PΦ\2 ρ(y\2 − B\2 w).                      (71)
In the equation, the subscript \2 in the vector(s) and matrix means the second row is removed
from the corresponding entities. So
                H1\2 (τ + 1) = −Ey log(P\2 ρ)1 (y1 )
                                    Z                                          
                             = −Ex log         Ew PΦ\2 ρ(y\2 − B\2 w)dy3 ...dyn
                                        Rn−2
                                   h                             i
                             = −Ex log Ew (PΦ\2 ρ)1 (y1 − B1 w) .
Subtract H1\2 (τ + 1) from H1 (τ + 1), and the information flow T2→1 follows:

                                                29
Theorem V.2
                 h                            i
        T2→1 = Ex log Ew (PΦ\2 ρ)1 (y1 − B1 w) − Ex [log Ew (PΦ ρ)1 (y1 − B1 w)] .                (72)


   B.   Properties

Theorem V.3 Property of causality
For the system (65), if Φ1 and B1 are independent of x2 , then T2→1 = 0.
                                                                                                   a.e.
Proof. As we proved for the deterministic case, if Φ1 is independent of x2 , then (PΦ ρ)1 =
(PΦ\2 ρ)1 . If further B1 has no dependence on x2 , then the above H1 (τ + 1) and H1\2 (τ + 1)
are equal, and hence T2→1 = 0. 


   C.   Application: A noisy Hénon map

   We now reconsider the benchmark systems that have been examined before, but with
Gaussian noise added. The baker transformation is not appropriate here, since the added
noise perturbation will take x outside the domain [0, 1]. We hence only look at the Hénon
map Φ : R2 → R2 :
                                Φ1 (x1 , x2 ) = 1 + x2 − αx21 ,
                              
                                                                                      (73)
                                Φ2 (x1 , x2 ) = βx1 ,
with parameters α, β > 0, and consider only the case T1→2 which has been shown as a
benchmark case. Now perturb Φ to make a stochastic mapping:
                                  x(τ + 1) = Φ(x(τ )) + Bw                                        (74)
where B = (bij ) is a constant matrix, w ∼ N(0, I).    Let2 Bi ≡ (bi1 , bi2 ) denote a row vector.
                                                       −2α 1
It is easy to see that Φ is invertible; in fact, J =              = −β 6= 0. The inverse is
                                                          β 0
                                                                
                              −1              x2            α 2
                            Φ (x1 , x2 ) =       , x1 − 1 + 2 x2 .                              (75)
                                              β            β
Thus
                                                                                    
                                −1               −1            x2            α
            PΦ ρ(x1 , x2 ) = ρ(Φ (x1 , x2 )) J        =ρ          , x1 − 1 + 2 x22       · β −1   (76)
                                                               β            β
So Pρ(y) = Ew PΦ ρ(y − Bw), and
                                                                              
                              1    y2 − B2 w                   α
                    Z
                                                                             2
      (Pρ)2 (y2) =     dy1 Ew ρ              , y1 − B1 w − 1 + 2 (y2 − B2 w)
                     R        β        β                      β
                                       
                    1         y2 − B2 w
                 = Ew ρ1                  .
                    β             β
   If x1 is frozen, Φ2 (x1 , x2 ) = βx1 is a constant. Hence H2\1 (τ + 1) = 0, and
                          T1→2 = H2 (τ + 1) − H2\1 (τ + 1)

                                                 30
                                                           
                                      1            y2 − B2 w
                              = −E log Ew ρ1                     −0
                                      β              β          
                                                       y2 − B2 w
                              = log β − Ew Ex log ρ1
                                                          β     
                                                            B2 w
                              = log β − Ew Ex log ρ1 x1 −
                                                             β
                              = log β + F H1 .                                           (77)

Here F H1 is the functional H1 applied by a Gaussian filter. One may understand it as H1
smeared out by a Gaussian filter. It is less than H1 , so the noise addition makes the system
lose some information, compared to T1→2 = log β + H1 in the deterministic case.


VI.     CONTINUOUS-TIME STOCHASTIC SYSTEMS

   A.    Derivation

    Following what we have done in section IV, we derive the information flow within a
continuous-time stochastic system by taking the limit of the corresponding discrete stochastic
mapping. In doing this, the results in the preceding section are ready for use. But, as noted,
in the above derivation we have assumed a constant matrix B, a simplified case allowing
for a clear expression of information flow. (This case does have realistic relevance, though.)
For a time continuous system, this assumption actually can be completely relaxed. In the
following we will see why.
    Consider a system

                               dx = F(t; x)dt + B(t; x)dw,                               (78)

where x and F are n-dimensional vector, B is an n × m matrix, and w an m-vector of
standard Wiener process. Note that B can be a function of both x and time t. This above
equation may also be written as
                                 dx
                                    = F(t; x) + B(t; x)ẇ,                               (79)
                                 dt
where ẇ a vector of white noise, or, in component form,
                                 dx1
                                      = F1 (t; x) + B1 (t; x)ẇ,                         (80)
                                  dt
                                 dx2
                                      = F2 (t; x) + B2 (t; x)ẇ,                         (81)
                                  dt
                                   ..            ..
                                    .             .                                      (82)
                                 dxn
                                     = Fn (t; x) + Bn (t; x)ẇ.                          (83)
                                  dt
In the equations we have used Bi to indicate the i-th row vector of B. Now consider (78)
on a small interval [t, t + ∆t]. Euler-Bernstein differencing,

                            x(t + ∆t) = x(t) + F∆t + B∆w.                                (84)

                                            31
This motivates the introduction of a transformation
                              
                                y = x + F(x)∆t + B(x)∆w,
                          Π:                                                                      (85)
                                z = ∆w.

As shown in the discrete mapping case, generally this transformation cannot be inverted. But
for this special case where ∆t and ∆w are small, the inversion can be done asymptotically.
In fact,

           y = x + [F(y) + o(∆t)]∆t + [B(y)∆w + ∇(B(y)∆w)(x − y)] + o(∆w 2 )
             = x + F(y)∆t + B(y)∆w + [∇(B∆w)](−F∆t − B∆w) + o(∆t).

Note, here the higher order terms means terms with order higher than ∆t or (∆w)2 — We
will see soon that E(∆w)2 = ∆t. The above expansion helps invert Π to
                        
                    −1    x = y − F∆t − Bz + ∇(Bz)(Bz) + o(∆t),
                   Π :                                                            (86)
                          ∆w = z.

   The following proposition finds the Jacobian associated with the inverse transformation.
                                                                                 P
Proposition VI.1 Define the double dot of two dyadics A and B as A : B = i,j aij bji ,
then
                                                1
                 J −1 = 1 − ∇ · F∆t − ∇ · (Bz) + ∇∇ : (BzzT BT ) + o(∆t).                         (87)
                                                2
Proof. By definition
                               ∂x ∂x              ∂x                       
      −1      ∂(x, ∆w)             ∂y   ∂z               ∂y
                                                             −B  +  ...          ∂x
     J =                  = det ∂∆w ∂∆w = det                             = det     .   (88)
               ∂(y, z)             ∂y    ∂z               0       I              ∂y
                                  
                                  ∂x
The key is the evaluation of det ∂y   . By (86), it is, up to o(∆t), the determinant of
                                        P                                               P                       
                          ∂b1k                      ∂b1k                P ∂b1k                       ∂b1k
    1 − ∂F                         ∂
                                                       ... − ∂F                        ∂
                    P
        ∂y1
           1
             ∆t −       k ∂y1 zk + ∂y1        l,k,s ∂yl zk bls zs
                                                                1
                                                              ∂yn
                                                                  ∆t −         z
                                                                         k ∂yn k  +   ∂yn
                                                                                                          z b
                                                                                               l,k,s ∂yl k ls sz

                       .
                        ..                             . ..                        .
                                                                                   ..
                                                                                                                      
                                                                                                                      (8
                                                                                                                      
                              P                                                           P                      
  − ∂F   ∆t − k ∂b         ∂           ∂bnk
                                                       ... 1 − ∂F   ∆t − k ∂b            ∂             ∂bnk
             P                                                          P
    ∂y1
       n          nk
                ∂y1 k
                     z + ∂y  1   l,k,s ∂yl zk bls zs           ∂yn
                                                                  n           nk
                                                                            ∂yn k
                                                                                 z + ∂y    n     l,k,s ∂yl zk bls zs


Recall that, for an n × n matrix A = (aij ),
                                                    X                   n
                                                                        Y
                                         det A =           sgn(σ)             ai,σi               (90)
                                                    σ∈Pn                i=1

where Pn is the totality of permutations of {1, 2, ..., n}. By this formula, the terms of order
∆t and ∆w are easy to find; they can only come from the diagonal entries. For terms of
order (∆w)2 , there are three sources:
    (1) the last term at each diagonal entry, together with n − 1 1’s;
    (2) multiplication of two entries at (i, i) and (j, j), i 6= j, together with n − 2 1’s on the
        diagonal;

                                                         32
 (3) similar to (2), but with entries at (i, j) and (j, i), i 6= j.
In (3) the order between i and j switches and it has sgn = −1 for its permutation. Except
for (3) involving off-diagonal entries, all others are from the diagonal. So
                 Y      n
                             "                               n X  m                       #
                 ∂x               ∂Fi        X ∂bik        X          ∂        ∂bik
           det         =      1−      ∆t −            zk +                 bls        zk zs
                 ∂y      i=1
                                  ∂yi         k
                                                  ∂yi       l=1 k,s=1
                                                                      ∂yi      ∂yl
                                                    !                 !
                       1X              X ∂bik            X ∂bjs
                     +       (−1)1 −             zk    −            zs + o(∆t).
                       2 i,j            k
                                            ∂y j           s
                                                               ∂y i
                            i6=j

Notice the factor 12 in the last term. Because of the symmetry between i and j and they
repeat once when summed over i, j = 1, n. Thus
                     
                      ∂x          X ∂Fi           X X ∂bik
               det          =1−              ∆t −                 zk
                      ∂y            i
                                       ∂y  i         i   k
                                                             ∂y i

                       1 X X ∂bik          X ∂bjs          X X ∂  ∂bik 
                     +                zk ·           zs +                 bjs      zk zs
                       2 i6=j k ∂yi          s
                                                ∂y j       i,j k,s
                                                                     ∂y i     ∂y j

                       1 X   X   ∂bik      X    ∂bjs
                     −                zk ·           zs + o(∆t).
                       2 i6=j k ∂yj          s
                                                ∂yi

Notice
                   ∂ 2 bik bjs   ∂bik ∂bjs        ∂ 2 bjs   ∂bjs ∂bik        ∂ 2 bik
                               =           + bik          +           + bjs          ,
                   ∂yi ∂yj       ∂yi ∂yj         ∂yi ∂yj    ∂yi ∂yj         ∂yi ∂yj
and
         X X ∂b            ∂bik         X X ∂bjs ∂bik             XX           ∂ 2 bik
                                zk zs =                   zk zs +         bjs            zk zs
         k,s   i,j
                   ∂y i js ∂y j
                                        k,s i,j
                                                ∂y i ∂y j
                                                                  k,s i,j
                                                                              ∂y i ∂y  j

             1 X X ∂b[ js ∂bik                1 X X ∂bis ∂bik           1 X X ∂bjs ∂bik
          =                          zk zs +                    zk zs +                   zk zs
             2 k,s i6=j ∂yi ∂yj               2 k,s i ∂yi ∂yi           2 k,s i,j ∂yi ∂yj
                             ∂ 2 bik          ∂ 2 bjs
                                                     
            1 XX
          +             bjs           + bik             zk zs .
            2 k,s i,j       ∂yi ∂yj          ∂yi ∂yj

The last parenthesis holds because the two pairs (i, k) and (j, s) may be switched under the
summation without changing the result. Thence
             
             ∂x            X ∂Fi          X X ∂bik               1 X X ∂bik ∂bjs
        det         =1−            ∆t −                  zk +                             zk zs
             ∂y              i
                               ∂yi          i    k
                                                    ∂yi          2 i,j k,s ∂yi ∂yj
                                                            ∂ 2 bik            ∂ 2 bjs
                                                                                      
             1 X X ∂bjs ∂bik              1 XX
           +                     zk zs +               bjs            + bik              zk zs + o(∆t)
             2 i,j k,s ∂yi ∂yj            2 i,j k,s        ∂yi ∂yj            ∂yi ∂yj
                                                            2
                                                               P
                X ∂Fi          X X ∂bik            1X∂             k,s bik zk zs bjs
          =1−             ∆t −                zk +                                    + o(∆t)
                  i
                     ∂y i       i
                                         ∂y i      2  i,j
                                                                   ∂y  i ∂y j
                                         k
                                    1
          = 1 − ∇ · F∆t − ∇ · (Bz) + ∇∇ : (BzzT BT ) + o(∆t),
                                    2

                                                     33
which is J −1 by (88). 
                                                                              dH
  With J −1 , we can then evaluate the operator P and hence arrive at dH
                                                                       dt
                                                                         1
                                                                           and dt1\2 .
Proposition VI.2 Let BBT ≡ G = (gij ). The time rate of change of H1 is
                                                   ∂ 2 log ρ1
                                                           
                  dH1         ∂ log ρ1      1
                      = −E F1            − E g11                .                        (91)
                   dt           ∂x1         2         ∂x21
Proof. For any subset Sy ∈ Rn , Sz ∈ Rm ,
             Z                          Z
                      ρyz (y, z)dydz =                 ρxw (x, ∆w)dxddelw
               Sy ×Sz                    Π−1 (Sy ×Sz )
                      Z
                   =           ρxw (y − F∆t − Bz + ∇(Bz) · (Bz), z) · J −1 dydz
                       S ×S
                      Z y z
                   =           ρ(y − F∆t − Bz + ∇(Bz) · (Bz)) J −1 · ρw (z)
                      Sy ×Sz

because ρxw (a, b) = ρx (a) · ρw (b) = ρ(a) · ρw (b) due to the independence between x and
∆w. Since Sy and Sz are arbitrarily chosen, the integrand is the very joint pdf ρyz (y, z).
Thus
                      Z
  Pρ(y) = ρy (y) =        ρyz (y, z)dz
         Z             Rm

                ρ(y − F∆t − Bz + ∇(Bz) · (Bz)) · J −1 · ρw (z) dz
                                                        
      =
          Rm
      = Ew  ρ(y − F∆t − B∆w + ∇(B∆w) · (B∆w)) · J −1                                     
                                                                   1              T
      = Ew ρ(y) − ∇ρ · (F∆t + B∆w + ∇(B∆w) · (B∆w)) + (B∆w)(B∆w) : ∇∇ρ
                                                                  2
                                             1
           · 1 − ∇ · F∆t − ∇ · (B∆w) + ∇∇ : (B∆w∆wT BT ) + o(∆t)
                                             2
      = ρ(y) − (F · ∇ρ + ρ∇ · F)∆t
              1
           + ρ∇∇ : (BBT ) + 2∇ρ · [∇ · (BBT )] + (BBT ) : (∇∇ρ) ∆t + o(∆t)
                                                                      
              2
                                1
      = ρ(y) − ∇ · (Fρ)∆t + ∇∇ : (BBT ρ)∆t + o(∆t).                                    (92)
                                2
Note here the fact
                               E∆w = 0,    E∆w∆wT = ∆tI                                  (93)
about Wiener process has been used. As a verification, one may obtain from this step
                ∂ρ       Pρ(y) − ρ(y)              1
                   = lim              = −∇ · (Fρ) + ∇∇ : (BBT ρ)                         (94)
                ∂t  ∆t→0     ∆t                    2
which is precisely the Fokker-Planck equation (cf. the appendix).
    Denote BBT by G. Integrate both sides of the above equation with respect to
(y2 , y3 , ..., yn ) to obtain
                                       ∂F1 ρ             ∆t    ∂ 2 g11 ρ
                                 Z                          Z
     (Pρ)1 (y1 ) = ρ1 (y1 ) − ∆t             dy2...dyn +                 dy2 ...dyn + o(∆t),
                                  Rn−1 ∂y1               2 Rn−1 ∂y12

                                           34
and hence
                                ∆t            ∂F1 ρ              ∆t            ∂ 2 g11 ρ
                                     Z                                 Z
log(Pρ)1 (y1 ) = log ρ1 (y1 ) −                     dy2 ...dyn +                     2
                                                                                         dy2 ...dyn + o(∆t).
                                                                                                          (95)
                                ρ1       Rn−1 ∂y1                2ρ1       Rn−1 ∂y1

So

                    H1 (t + ∆t) = −E log(Pρ)1 (y1 ) = −E log ρ1 (y1 )
                                                                 R
as the rest two terms vanish after applying the operator E(·) = R ρ1 (·)dy1. Expanding y1
around x1 , and denoting B1 ≡ (b11 , b12 , ..., b1n ), we have

     H1 (t + ∆t) = −E log ρ1 (x1 + F1 ∆t + B1 ∆w)
                                                             1 ∂ 2 log ρ1
                                                                                     
                               ∂ log ρ1                                          T T
          = −E log ρ1 (x1 ) +           (F1 ∆t + B1 ∆w) +                 B1 ∆w∆w B1 + o(∆t)
                                 ∂x1                        2 ∂x21
                                                    ∂ 2 log ρ1
                                               
                           ∂ log ρ1         1
          = H1 (t) − E F1             ∆t − E g11                ∆t + o(∆t).
                             ∂x1            2          ∂x21
Let ∆t → 0 and we finally arrive at

                                                       ∂ 2 log ρ1
                                                               
                    dH1             ∂ log ρ1    1
                         = −E F1               − E g11              .
                     dt               ∂x1       2         ∂x21

    Now consider during the time interval [t, t + ∆t] to freeze x2 as a parameter, and examine
how the marginal entropy of x1 evolves. In this case we are actually considering a density
ρ1\2 , with rho1\2 (t) = ρ1 (t) under an (n − 1)-dimensional transformation: Rn−1 → Rn−1 ,
x1\2 → y1\2 :
                        
                           y = x1 (t + ∆t) = x1 (t) + F1 ∆t + B1 ∆w,
                         1
                        
                        
                           y3 = x3 (t + ∆t) = x3 (t) + F3 ∆t + B3 ∆w,
                        
                          ...
                         y = x (t + ∆t) = x (t) + F ∆t + B ∆w.
                             n    n            n         n       n

With this system we have the following proposition.
                             R
Proposition VI.3 Let ρ\2 be R ρ(x)dx2 , then

                     dH1\2                                         ∂ 2 log ρ1
                                                                           
                                         ∂ log ρ1       1
                           = −E F1                  − E g11              2
                      dt                   ∂x 1         2             ∂x1
                                                ∂F1 ρ\2
                                    Z
                                      1
                               +E                        dx3 ...dxn
                                     ρ1 RZn−2 ∂x1
                                                  ∂ 2 g11 ρ\2
                                                                         
                                 1      1
                               − E                            dx3 ...dxn .                               (96)
                                 2      ρ1 Rn−2 ∂x21

Proof. Following the same procedure as above, we arrive at an equation for log(P\2 )1 (y1)
similar to (95):

                                     ∆t       ∂F1 ρ\2               ∆t       ∂ 2 g11 ρ\2
                                         Z                              Z
log(P\2 ρ)1 (y1 ) = log ρ1\2 (y1 ) −                  dy3 ...dyn +                       dy3 ...dyn + o(∆t).
                                     ρ1\2 Rn−2 ∂y1                 2ρ1\2 Rn−2 ∂y12

                                                   35
So

                        H1\2 (t + ∆t) = −E log(P\2 ρ)1 (y1 )
                              = −E log ρ1\Z2 (y1 )
                                                    ∂F1 ρ\2
                                                                        
                                       1
                                +E                          dy3...dyn ∆t
                                      ρ1\2 Rn−2 ∂y1
                                                     ∂ 2 g11 ρ\2
                                                                          
                                  1       1
                                              Z
                                − E                              dy3 ...dyn ∆t + o(∆t).
                                  2     ρ1\2 Rn−2 ∂y12
Note at time t, ρ1\2 = ρ1 , and in the last two terms y can be replaced by x with error going
to higher order terms. Thus
                                                                        1 ∂ 2 log ρ1
                                                                                               
                                           ∂ log ρ1                                         T T
    H1\2 (t + ∆t) = −E log ρ1 (x1 ) +               (F1 ∆t + B1 ∆w) +                B1 ∆w∆w B1
                                              ∂x1                      2 ∂x21
                            ∂F1 ρ\2
                 Z
                   1
            +E                      dx3 ...dxn ∆t
                  ρ1 RZn−2 ∂x1
                             ∂ 2 g11 ρ\2
                                                   
              1      1
            − E                          dx3 ...dxn ∆t + o(∆t)
              2      ρ1 Rn−2 ∂x21 
                                                        ∂ 2 log ρ1
                                                                  
                            ∂ log ρ1             1
          = H1 (t) − E F1                ∆t − E g11           2
                                                                     ∆t
                              ∂x  1              2         ∂x 1
                            ∂F1 ρ\2
                 Z                             
                   1
            +E                      dx3 ...dxn ∆t
                  ρ1 RZn−2 ∂x1
                             ∂ 2 g11 ρ\2
                                                   
              1      1
            − E                          dx3 ...dxn ∆t + o(∆t).
              2      ρ1 Rn−2 ∂x21
Take the limit
                             dH1\2        H1\2 (t + ∆t) − H1 (t)
                                   = lim
                              dt     ∆t→0           ∆t
and we arrive at the conclusion. 

Theorem VI.1
                                  ∂F1 ρ\2                                  ∂ 2 g11 ρ\2
                                                           Z                                  
                       1                                1      1
                         Z
          T2→1 = −E                       dx3 ...dxn + E                               dx3 ...dxn .    (97)
                      ρ1 Rn−2 ∂x1                       2     ρ1 Rn−2 ∂x21
                                      ∂F1 ρ\2      1                   ∂ 2 g11 ρ\2
                   Z                                 Z
               = −     ρ2|1 (x2 |x1 )         dx +      ρ2|1 (x2 |x1 )             dx.                 (98)
                    Rn                 ∂x1         2 Rn                   ∂x21
Proof. Subtract (96) from (91) and the conclusion follows. 


     B.   Properties

Theorem VI.2 For a 2D system
                                             dH1\2
                                                                  
                                                             ∂F1
                                                   =E                                                  (99)
                                              dt             ∂x1
                                                                                                      (100)

in the absence of stochasticity.

                                                   36
Remark: This recovers the heuristic argument by Liang and Kleeman in [45]; see Eq. (5).
Proof. In this case g11 = 0, ρ\2 = ρ1 , so

                      dH1\2
                                                                   
                                           ∂ log ρ1          1 ∂F1 ρ1
                             = −E F1                  +E
                        dt                  ∂x1             ρ1 ∂x1        
                                     ρ1 ∂F1         ∂ log ρ1      ∂ log ρ1
                             = E               + F1          − F1
                                    ρ 1 ∂x1         ∂x 1          ∂x1
                                     ∂F1
                             = E              .
                                      ∂x1



Theorem VI.3 If g11 = m
                           P
                             k=1 b1k b1k is independent of x2 , the resulting T2→1 has a form
same as its deterministic counterpart.
                                                    R ∂ 2 g11 ρ\2
Proof. If g11 is independent of x2 , so is               ∂x21
                                                                  dx3 ...dxn . Hence the integration can be
simplified:

                         ∂ 2 g11 ρ\2
                                                                      2
                                                                          ∂ g11 ρ\2
                                                    Z
                                                           ρ12
                Z                           Z
                    ρ2|1       2
                                     dx =                         dx2 ·             dx1 dx3 ...dxn
                 Rn         ∂xZ1             Rn−1       R ρ1                ∂x21
                                       ∂ 2 g11 ρ\2
                           =                       dx1 dx3 ...dxn = 0.
                                 Rn−1     ∂x21


Theorem VI.4 (Property of causality)
If both F1 and g11 are independent of x2 , then T2→1 = 0.

Proof. As proved above, when g11 has no dependence on x2 , the last term of T2→1 becomes
                                                    ∂F ρ
zero. If, moreover, F1 does not depend on x2 , then ∂x1 1 \2 does not, either. So the integration
with respect to x2 can be taken inside directly to ρ12 /ρ1 = ρ2|1 (x2 |x1 ):

                                           ∂F1 ρ\2                      ∂F1 ρ\2
            Z      Z                 Z                           Z
  T2→1 = − dx1 ρ2|1 (x2 |x1 )dx2 ·                 dx3 ...dxn =                 dx3 ...dxn = 0.
              R      R                 Rn−2 ∂x1                    Rn−2 ∂x1




    C.   Application: A stochastic gradient system

   We are about to study the information flow within a system which has a drift function
in the gradient form. We particularly want to understand how stochastic perturbation may
exert influence on the flow. The gradient systems are chosen because their corresponding
Fokker-Planck equation admit explicit equilibrium solutions, i.e., solutions of the Boltzmann
type. To see this, let

                                             F = −∇V,                                               (101)



                                                  37
where V = V (x) is the potential function. For simplicity, suppose that the stochastic
perturbation amplitude B = bI where I is the identity matrix and b = const. Hence
G = BBT = gI, and g = b2 is a constant. It is trivial to verify that
                                             1 −2V /g
                                        ρ=     e      ,                                   (102)
                                             Z
where Z is the normalizer (or partition function as is called in statistical physics), solves
                                               1
                                     ∇ · (ρF) = g∇2ρ,
                                               2
the equilibrium density equation for the system

                                   dx = −∇V dt + bIdw.                                    (103)

   As an example, consider the potential function
                              1
                           V = (x21 x22 + x22 x23 + x21 + x22 + x23 ).                    (104)
                              2
This system, though simple, results in a compactly supported density function, while allow-
ing for asymmetric nonlinear interactions among x1 , x2 , and x3 . The resulting vector field
is

                                    F1 = −x1 x22 − x1 ,
                                    F2 = −x2 x23 − x2 x21 − x2 ,
                                    F3 = −x3 x22 − x3 .

Obviously, T3→1 = T1→3 = 0 by the theorem on causality property. The general flow from
xj to xi is

                                                 ∂Fi ρ\j
                             Z
                    Tj→i = −      ρj|i (xj |xi )         dx
                             ZR3                  ∂xi
                                             ∂ρ\j
                                                            
                                                         ∂Fi
                         = −      ρj|i Fi          + ρ\j
                             ZR3        ∂x  Z i         ∂xi          
                                                  2               ∂Fi
                         = −      ρj|i Fi           ρFi dxj + ρ\j       dx.      (105)
                               R3              R g                ∂xi

The computation seems to be easy, but by no means trivial. The difficulty comes from the
evaluation of the conditional density ρj|i (xj |xi ). Theoretically this is not a problem, but
in realizing the computation we have to consider the problem on a limited domain, which
may not effectively cover the support of the density function. Here we choose a domain
[−5, 5] × [−5, 5] × [−5, 5], and a spacing size ∆x = 0.05. The computation is implemented
henceforth.
   To test how the stochastic perturbation may affect the information flow. tune b to see
the response. The tuning range is rather limited, though, with the present computational
domain. Shown in Fig. 9 are the results. As expected, T3→1 and T1→3 are identically
zero. For others, the flow rates generally increase with b. That is to say, they tend to
increase the uncertainty of their corresponding target components. This makes sense, since g

                                               38
 0.1                                                    0.1
                T2→1                                                T1→2
0.05                                                  0.05


  0                                                      0

   0.4              0.6          0.8        1             0.4           0.6          0.8          1


 0.1                                                    0.1
                T                                                   T
                 3→2                                                  2→3
0.05                                                  0.05


  0                                                      0

   0.4              0.6          0.8        1             0.4           0.6          0.8          1


 0.1                                                    0.1
                          T3→1                                                T1→3
0.05                                                  0.05


  0                                                      0

   0.4              0.6          0.8        1             0.4           0.6          0.8          1
                          b                                                   b

         FIG. 9: Information flow within a gradient system with the potential function (104).



functions like temperature in thermodynamics, and increase in T surely will lead to increase
in uncertainty. If examining more carefully, one finds that the increase is actually not
symmetric. Those going to x2 (T3→2 and T1→2 ) are faster than those leaving x2 (T2→1 and
T2→3 ), reflecting the property of asymmetry of information flow.
   Since ρ can be accurately obtained, this example can be utilized to validate our numerical
computations for more general cases.


VII.     LINEAR STOCHASTIC SYSTEMS

   As always, it would be of interest to look at the particular case, namely, the case with
linear systems:

                                       dx = Axdt + Bdw,                                         (106)




                                                39
with A and B being constant matrices. If originally x is normally distributed, then it is
normal/Gaussian forever. Let its mean vector be µ and its covariance matrix be Σ. Then
                                       dµ
                                          = Aµ,                                                       (107)
                                       dt
                                       dΣ
                                          = AΣ + ΣAT + BBT .                                          (108)
                                       dt
In component form µ = (µ1 , ..., µn )T , Σ = (σij )n×n , and BBT has been denoted by G in
the above. The distribution is, therefore,
                                            1                    1       T     −1 (x−µ)
                              ρ= p                       e− 2 (x−µ) Σ                     .
                                       (2π)n det Σ
We need to find
                                                  ρ1 , ρ12 , ρ\2
, and the following facts will help.
    Fact 1: ρ\2 is a multivariate Gaussian N(µ\2 , Σ\2 ) where µ\2 = (µ1 , µ3 , µ4, ..., µn )n , and Σ\2
is the covariance matrix of (x1 , x3 , x4 , ..., xn )n .
    Fact 2: The conditional probability density function ρ2|1 is
                                                            h                         i2
                                                   σ                     σ
                                                − 2∆11          x2 −µ2 − σ12 (x1 −µ1 )
                             ρ2|1 (x2 |x1 ) ∝ e        12                 11               ,          (109)

in other words,
                                                               
                                            σ12             ∆12
                            x2 |x1 ∼ N µ2 +     (x1 − µ1 ),       .                                   (110)
                                            σ11             σ11
                                                                                              
                                                                                   σii σij
In the above equations, we have used, and will be using, ∆ij to shorten det                  .
                                                                                   σij σjj
    We now compute the information flow T2→1 . Since B is constant (hence independent of
x1 ), the stochastic term vanishes by Theorem VI.3. So we need only consider its deterministic
part:
                                       ∂F1 ρ\2                         ∂F1 ρ\2
                              Z               
                               1
                                                    Z
                 T2→1 = −E                       =−     ρ2|1 (x2 |x1 )         dx.
                               ρ1 Rn−2 ∂x1           Rn                 ∂x1
As a starting point, let us consider the case n = 3. By the proposition above,
                              1        − 1 [σ (x −µ )2 +σ11 (x3 −µ3 )2 ]−2σ13 (x1 −µ1 )(x3 −µ3 )]
            ρ\2 = ρ13 = p             e ∆13 33 1 1                                                .
                            (2π)2 ∆13
So
     ∂F1 ρ\2
  Z                 Z
             dx3 =      ρ13 {a11 + [σ13 (x3 − µ3 ) − σ33 (x1 − µ1 )] · (a11 x1 + a12 x2 + a13 x3 )/∆13 } dx3
   R ∂x1              R
              σ13 µ3 + σ33 (x1 − µ1 )(a11 x1 + a12 x2 )
  = a11 ρ1 −                                             ρ1
                                 ∆13
        1
           Z
               ρ13 · a13 σ13 x23 + (a11 x1 + a12 x2 )σ13 x3 − (σ13 µ3 + σ33 (x1 − µ1 ))a13 x3 dx3 .
                                                                                            
    +
      ∆13 R

                                                       40
                                         x23 ρ13 dx3 . Since (x1 , x3 ) is a bivariate Gaussian,
                   R                      R
We need to find      R
                         x3 ρ13 dx3 and   R
                                                                        
                                                  σ13               ∆13
                               x3 |x1 ∼ N µ3 +         (x1 − µ1 ),          ,
                                                  σ11               σ11
we thence have
                                                                           
                                                              σ13
           Z                        Z
                  ρ13 x3 dx3 = ρ1 ρ3|1 x3 dx3 = ρ1 · µ3 +         (x1 − µ1 ) ,
                R                   R                         σ11
                                                       "                             2 #
                                                         ∆             σ
              Z                   Z
                                                          13            13
                  ρ13 x23 dx3 = ρ1 ρ3|1 x23 dx3 = ρ1 ·       + µ3 +        (x1 − µ1 )      .
                R                   R                    σ11           σ11

Substituting back, we obtain:
          ∂F1 ρ\2                σ13 µ3 + σ33 (x1 − µ1 )(a11 x1 + a12 x2 )
       Z
                  dx3 = a11 ρ1 −                                           ρ1
        R ∂x1                                      ∆13
                                                    2 !
                       ∆13            σ13                 ρ1
           +a13 σ13         + µ3 +        (x1 − µ1 )
                       σ11            σ11                 ∆13
                                                                                          
                                                                            σ13              ρ1
           + [(a11 x1 + a12 x2 )σ13 − (σ13 µ3 + σ33 (x1 − µ1 ))a13 ] µ3 +       (x1 − µ1 )       .
                                                                            σ11              ∆13
Thus
                          1 ∂F1 ρ13
            T2→1 = −E                dx3
                          ρ1 ∂x1
                                1
                   = −a11 −        [−σ13 µ3 a11 µ1 − σ13 µ3 a12 µ2 − a11 σ33 σ11 − a12 σ33 σ12
                               ∆13
                                     ∆13
                           +a13 σ13      + a13 σ13 (µ23 + σ13
                                                            2    2
                                                              /σ11  · σ11 ) + a11 σ13 µ3 µ1
                                     σ11
                           +a12 µ3 σ13 µ2 − a13 σ13 µ23 − 0 + a11 σ13
                                                                    2
                                                                       /σ11 · σ11
                                   2
                           +a12 σ13 /σ11 · σ12 − 0 − a13 σ33 σ13 /σ11 · σ11 ]
                         σ12
                   = a12     .
                         σ11
The so many terms are canceled out, and the result turn out to be precisely the same as
that for the 2D case we have derived before ever since Liang and Kleeman (2005)!
    The above remarkably concise formula actually holds for systems of arbitrary dimension-
ality. This makes the following theorem:
Theorem VII.1 If an n-dimensional (n ≥ 2) vector of random variables (x1 , ..., xn )T
evolves subject to the linear system
                                              dx = Axdt + Bdw,
where A = (aij ) and B are constant matrices, and if its covariance matrix is (σij ), then the
information flow from xj to xi is
                                                             σij
                                                Tj→i = aij       ,                                 (111)
                                                             σii
for any i, j = 1, ..., n, i 6= j.

                                                     41
Proof. It suffices to prove the case (i, j) = (1, 2); if not, we may always reorder the com-
ponents to make them so. We prove by induction. The 3D case has just been shown above.
Now suppose (111) holds for n-dimensional systems. Consider an n+1-dimensional system
                                     n
                              dx1 X
                                  =     a1j xj + a1,n+1 xn+1 ,
                               dt   j=1
                                ..                   ..
                                 .                    .
                                      n
                              dx2    X
                                   =     anj xj + an,n+1 xn+1
                               dt    j=1
                                      n
                              dxn+1 X
                                   =     an+1,j xj + an+1,n+1 xn+1 .
                               dt    j=1

To distinguish, we now use ρn to denote the joint density for the n-dimensional system. The
information flow from x2 to x1 is
                                            ∂F1 ρ\2
                      Z
          T2→1 = −           ρ2|1 (x2 |x1 )          dx
                        Rn+1                 ∂x1
                                    " n                                     #
                                ∂
                    Z                    X
                 =        ρ2|1         (     a1j xj )ρ\2 + (a1,n+1 xn+1 )ρ\2 dx
                     Rn+1      ∂x1 j=1
                                      n
                                                     ! Z
                              ∂                                       ∂
                    Z               X
                                          a1j xj ρn\2 +
                                                                                          
                 =      ρ2|1                                    ρ2|1       a1,n+1 xn+1 ρ\2 dx.
                     Rn      ∂x1 j=1                       Rn+1      ∂x1

Note the first term results from integration with respect xn+1 , since all the variables except
ρ\2 are independent of xn+1 . This is precisely the information flow from x2 to x1 for an
n-dimensional system; by our assumption it is a12 σ12 /σ11 . For the second term, note that
all variables, except ρ2|1 , are independent
                                      R         of x2 , so we may take integral with respect to
x2 directly inside with ρ2|1 . But R ρ2|1 dx2 = 1, so the second term results in the integral
    ∂
of ∂x 1
        (a1,n+1 xn+1 ρ\2 ) which vanishes by the compactness of ρ. Therefore (111) holds for
n+1-dimensional systems. By induction,
                                            it holds
                                                    for systems of arbitrary
                                                                              dimensionality. 
                                        1 −2 0                    1 0 0
    Let us see an example: A =  1 0 −5 , and B =  0 2 0  . In component form,
                                       −1 2 −1                    0 0 3
the equation is
                                  dx1
                                      = x1 − 2x2 + 0x3 + ẇ1 ,                            (112)
                                   dt
                                  dx2
                                      = x1 + 0x2 − 5x3 + 2ẇ2 ,                           (113)
                                   dt
                                  dx3
                                      = −x1 + 2x2 − x3 + 3ẇ3 .                           (114)
                                   dt
The evolution of the covariance matrix C is governed by
                                dC
                                   = AC + CAT + BBT .                                     (115)
                                dt

                                              42
                                
                           1 0 0
Let it be initialized by  0 4 0 . The solution is shown in Fig. 10. The rates of information
                           0 0 9


          9     σ                           8    σ                            9   σ
      x 10       11                     x 10         12                   x 10       13
2.5                                15                               0.5

 2                                                                   0
                                   10
                                                                   −0.5
1.5
                                    5                               −1
 1
                                                                   −1.5
                                    0
0.5                                                                 −2

 0                                 −5                              −2.5



          9     σ                           8    σ                            9   σ
      x 10       22                     x 10         23                   x 10       33
 7                                  6                               2.5

 6
                                    4                                2
 5

 4                                  2                               1.5

 3                                  0                                1
 2
                                   −2                               0.5
 1

 0                                 −4                                0
      0          50          100        0        50          100          0          50   100

                 FIG. 10: Covariance evolution with the linear system (112)-(114).


flow are subsequently obtained and plotted in Fig. 11. Among them, T3→1 = 0, just as
expected by the property of causality. T3→2 and T2→3 oscillate around a value near zero, and
T2→1 oscillates around -0.9. The remaining transfers, T1→2 and T1→3 , albeit still oscillatory,
approximately approach two constant values. The former approaches 0.16, while the latter
approaches 1.


VIII.         SUMMARY

   Information flow, or information transfer as it may appear in the literature, is a funda-
mental notion in general physics which has wide applications in different disciplines. In this
study we have shown that, within the framework of dynamical systems, it can be rigorously

                                                43
             T2→1                                  T1→2                           T1→3
 2                                    2                                  2


 1                                    1                                  1


 0                                    0                                  0


−1                                   −1                                 −1


−2                                   −2                                 −2


             T                                     T                              T
                 2→3                                  3→2                             3→1
 2                                    2                                  2


 1                                    1                                  1


 0                                    0                                  0


−1                                   −1                                 −1


−2                                   −2                                 −2
     0      20           40               0      20         40               0   20         40

                          FIG. 11: As Fig. 10, but for rates of information.



derived from first principles. That is to say, it is a notion ab initio, quite different from
the existing axiomatic postulates or empirical proposals. In this light we have studied the
information flow for both time-discrete and time-continuous differentiable vector fields in
both deterministic and stochastic settings. In a nutshell, the results can be summarized as
follows.
    Consider an n-dimensional state variable x = (x1 , x2 , ...xn ), the corresponding probability
density function (pdf) being ρ(x1 , x2 , ...xn ), and the marginal pdf of xi being ρi . For a
deterministic mapping Φ : Rn → Rn ,
                           x(τ ) 7→ x(τ + 1) = (Φ1 (x), Φ2 (x), ...Φn (x)),
the rate of information flowing from x2 to x1 proves to be
                       T2→1 = E log(P\2 ρ)1 (Φ1 (x)) − E log(Pρ)1 (Φ(1 (x)),
where E is the mathematical expectation with respect to x, P the Frobenius-Perron oper-
ator of Φ, and P\2 the same operator of Φ but with x2 frozen as a parameter (so (P\2 )1 (x1 )

                                                 44
has dependence on x2 ). The units are in nats per unit time; same below. If the system is
continuous in time, i.e.,
                                             dx
                                                = F(x, t),
                                             dt
then
                                 ∂ρ\2 F1                 ∂ρ\2 F1
                                                  Z                       
                                                  1
                            Z
                T2→1 = −    ρ2|1         dx = −E                 dx3 ...dxn ,
                         Rn       ∂x1             ρ1 Rn−2 ∂x1
            R
where ρ\2 = R ρ(x1 , x2 , ..., xn )dx2 , and ρ2|1 is the conditional pdf of x2 on x1 . When stochas-
ticity comes in, in the discrete mapping case:

                                   x(τ + 1) = Φ(x(τ ))) + B(x)w,

where Φ : Rn → Rn is an n-dimensional mapping, B an n × m constant matrix, and w an
m-dimensional standard Wiener process, then

          T2→1 = Ex [log Ew (PΦ\2 ρ)1 (y1 − B1 w)] − Ex [log Ew (PΦ ρ)1 (y1 − B1 w)],

with B1 = (b11 , b12 , ..., b1m ) a row vector of the matrix B. Here we use Ex and Ew to indicate
that the expectation is taken with respect to x and w, respectively. If what we consider is
a continuous-time stochastic system, i.e., a system as

                                       dx = F(x, t)dt + Bdw,

or alternatively written as
                                         dx
                                            = F(x, t) + Bẇ,
                                         dt
where ẇ is the white noise, then the result can be explicitly evaluated:
                                       ∂F1 ρ\2                                  ∂ 2 g11 ρ\2
                          Z                                     Z                                  
                           1                                 1      1
          T2→1 = −E                            dx3 ...dxn + E                               dx3 ...dxn . (116)
                           ρ1 Rn−2 ∂x1                       2     ρ1 Rn−2 ∂x21
                                           ∂F1 ρ\2      1                   ∂ 2 g11 ρ\2
                      Z                                   Z
                = −         ρ2|1 (x2 |x1 )         dx +      ρ2|1 (x2 |x1 )             dx,              (117)
                        Rn                  ∂x1         2 Rn                   ∂x21

where g11 = m
              P
                 j=1 b1j b1j . Note the first term is just from the deterministic vector field, while
the second the contribution from the noise. It has been proved that, if b1j has no dependence
on x2 , then the stochastic contribution vanishes, making the information flow same in form
as that from its deterministic counterpart. We have particularly examined the case F = Ax,
i.e., the case when the system is linear and autonomous,

                                          dx = Axdt + Bdw

with A = (aij )n×n and B = (bij )n×m being constant matrices, then the information flow
from xj to xi is remarkably simple:
                                                          σij
                                             Tj→i = aij       ,
                                                          σii

                                                    45
for any (i, j), 1 ≤ i, j ≤ n, i 6= j. This result is precisely the same in form as originally we
obtained for 2D deterministic systems based on intuitive arguments in [45].
    Historically it has been a long-time endeavor to relate information flow to causality. We
want specifically to have that, if Tj→i 6= 0, then xj causes xi , otherwise xj is not causal.
With the existing empirical/half-empirical measures for information flow, such as the widely
used transfer entropy, the endeavor has been fruitful for some problems but unsuccessful
for others (e.g., [44]), and the inconsistency has even led to doubt about the association
between information flow and causality (e.g., [38]). In this study, the implied causality, the
touchstone one-way causality in particular, is a proved fact for dynamical systems, as stated
in various theorems. More specifically, when the evolution of xi does not depend on xj , then
Tj→i = 0. This is particularly clear in the above linear case, the dependence of xi on xj
is from the entry aij of A, so when it is zero, then xj is not causal to xi . This result also
quantitatively, and unambiguously, tells us that, causation implies correlation, but not vice
versa, resolving the long-standing debate over correlation versus causation.
    The above results have been put to applications with a variety of benchmark systems.
Particularly we have re-examined the baker transformation, Hénon map, and truncated
Burgers-Hopf system. The results are qualitatively similar to what we have obtained before
using an approximate formalism, but with magnitudes significantly smaller. Also shown are
the information flows within a Kaplan-Yorke map, a noisy Hénon map, a Rössler system,
and a stochastic gradient flow. We look forward to more applications to real world problems
in the near future.


   Acknowledgment

   This study was supported by the Jiangsu Provincial Government through the “Specially
Appointed Professor Program” (Jiangsu Chair Professorship) to X.S.L., and by the Ministry
of Finance of China through the Basic Research Funding to China Institute for Advanced
Study.



 [1] K. Hlavackova-Schindler, M. Palus, M. Vejmelka, and J. Bhattacharya, “Causality detection
     based on information-theoretic approaches in time series analysis,” Phys. Rep., vo.. 441, no.
     1, pp. 1-46, 2007.
 [2] J. Pearl, Causality: Models, Reasoning, and Inference, Cambridge University Press, Cam-
     bridge, 2000.
 [3] P. Sprites, C. Glymour, and R. Scheines, Causation, Prediction, and Search, MIT Press,
     Cambridge, MA, 2001.
 [4] B.P. Bezruchko and D.A. Smirnov, Extracting Knowledge from Time Series: An Introduction
     to Nonlinear Empirical Modeling, Springer, Berlin, 2010.
 [5] T. Schreiber, “Measuring information transfer”, Phys. Rev. Lett., vol. 85, no. 2, pp. 461-464,
     2000.
 [6] X.S. Liang, ”Uncertainty generation in deterministic fluid flows,” Dyn. Atmos. Oceans, vol.
     52, 51-79, 2011.
 [7] R. Kleeman, ”Information flow in ensemble weather prediction,” J. Atmos. Sci., vol. 64, no.
     3, 1005-1016, 2007.


                                              46
 [8] E. Pereda, R. Quian Quiroga, and J. Bhattacharya, ”Nonlinear multivariate analysis of neu-
     rophysiological signals,” Progr. Neurobiol., vol. 77, nos. 1-2, 1-37, 2005.
 [9] K.J. Friston, L. Harrison, and W. Penny, ”Dynamic causal modeling,” NeuroImage, vo. 19,
     no. 4, 1273-1302, 2003.
[10] B. Schelter, M. Winterhalder, M. Eichler, M. Peifer, B. Hellwig, B. Guschlbauer, C. Leucking,
     R. Dahlhaus, and J. Timmer, ”Testing for directed influences among neural signals using
     partial directed coherence,” J. Neurosci. Methods, vo. 152, no. 1, 210-219, 2006.
[11] M. Staniek and K. Lehnertz, ”Symbolic transfer entropy,” Phys. Rev. Lett., 100, 158101, 2008.
[12] R.G. Andrzejak and T. Kreuz, ”Characterizing unidrectional couplings between point pro-
     cesses and flows,” Europhys. Lett., 96, 50012, 2011.
[13] S. Stramaglia, G.R. Wu, M. Pellicoro, and D. Marinazzo, ”Expanding the transfer entropy to
     identify information circuits in complex systems,” Phys. Rev. E, 86, 066211, 2012.
[14] J. Wu, X. Liu, and J. Feng, ”Detect6ing causality between different frequencies,” J. Neurosci.
     Meth., vol. 167, 367-375, 2008.
[15] R. Marschinski and H. Kantz, ”Analysing the information flow between financial time series:
     An improved estimator for transfer entropy,” Eur. Phys. J. B, vol 30, 275-281, 2002.
[16] S.S. Lee, ”Jumps and information flow in financial markets,” Rev. Financ. Stud., vol. 25,
     439-479, 2012.
[17] W. Wang, B.T. Anderson, R. K. Kaufmann, and R.B. Myneni, ”The relation between the
     North Atlantic Oscillation and SSTs in the North Atlantic basin,” J. Climate, vol. 17, no. 24,
     4752-4759, 2004.
[18] J. Runge, J. Heitzig, N. Marwan, and J. Kurths, ”Quantifying causal coupling strength: A
     lag-specific measure for multivariate time series related to transfer entropy,” Phys. Rev. E,
     vol. 86, 061121, 2012.
[19] G. Tissot, A. Lozano-Durán, L. Cordier, J. Jiménez, and B. R. Noack, ”Granger causality in
     wall-bounded turbulence”, Journal of Physics: Conference Series, vol. 506, doi:10.1088/1742-
     6596/506/1/012006, 2014.
[20] M. Materassi, Giuseppe Consolini, N. Smith, and R. De Marco, ”Information theory analysis
     of cascading process in a synthetic model of fluid turbulence,” Entropy, vol. 16, no. 3, 1272-
     1286, 2014.
[21] R. Sun, ”A neural network model of causality,” IEEE Transactions on Neural Networks, vol.
     5, no. 4, 604-611, 1994.
[22] N. Ay and D. Polani, ”Information flows in causal networks,” Advs. Complex Syst., vol. 11,
     17, 2008. doi:10.1142/S0219525908001465.
[23] L. Sommerlade, M. Eichler, M. Jachan, K. Henschel, J. Timmer, and B. Schelter, ”Estimating
     causal dependencies in networks of nonlinear stochastic dynamical systems,” Phys. Rev. E,
     vol. 80, no. 5, 051128, 2009.
[24] M. Timme and J. Casadiego, ”Revealing networks from dynamics: an introduction,” J. Phys.
     A: Math. Theor., vol. 47, 343001, 2014.
[25] A.S. Pikovsky, M.G. Rosenblum, and J. Kurths, Synchronization: A Universal Concept in
     Nonlinear Sciences, Cambridge University Press, Cambridge, 2001.
[26] K. Lehnertz, S. Bialonski, M.-T. Horstmann, D. Krug, A. Rothkegel, M. Staniek, T. Wagner,
     ”Synchronization phenomena in human epileptic brain networks,” J. Neurosci. Meth., vol.
     183, 42-48, 2009.
[27] S. Boccaletti, J. Kurths, G. Osipov, D. Valladares, and C. Zhou, ”The synchronization of
     chaotic systems,” Phys. Rep., vol. 366, no. 1, 1-101, 2002.


                                              47
[28] E. Mosekilde, Yu. Maistrenko, and D. Postnov, Chaotic Syncrhonization: Applications to
     Living SYstems, World Scientific, Singapore, 2002.
[29] G.V. Osipov, J. Kurths, and C. Zhou, Synchronization in Oscillatory Networks, Springer,
     Berlin, 2007.
[30] A. Balanov, N. Janson, D. Postnov, and O. Sosnovtseva, Syncrhonization: From Simple to
     Complex, Springer, Berlin, 2008.
[31] N.J. Corron and S.D. Pethel, ”Information flow in synchronization,” IEEE In-
     ternational Conference on Systems, Man and Cybernetics, vol. 4, 3546-3551,
     DOI:10.1109/ICSMC.2005.1571697, 2005.
[32] C. Granger, ”Investigating causal relations by econometric models and cross-spectral meth-
     ods,” Econometrica, vol. 37, 424, 1969.
[33] L. Barnett, A.B. Barrett, and A.K. Seth, “Granger causality and transfer entropy are equiv-
     alent for Gaussian variables,” Phys. Rev. Lett., vol. 103, no. 23, pp. 238701, 2009.
[34] J.A. Vastano and H.L. Swinney, ”Information transport in spatiotemporal systems,” Phys.
     Rev. Lett., vol. 60, 1773, 1988.
[35] J. Sun and E. Bolt, ”Causation entropy identifies indirect influences, dominance of neighbors,
     and anticipatory couplings. Physica D, vol. 267, 49-57, 2014.
[36] P. Duan, F. Yang, T. Chen, and S.L. Shah, “Direct causality detection via the transfer entropy
     approach,” IEEE Trans. Control Systems Tech., vol. 21, no. 6, pp. 2052-2066, 2013.
[37] U. Feldmann and J. Bhattacharya, “Predictability improvement as an asymmetrical measure
     of interdependence in bivariate time series,” Int. J. Bifurcat. Chaos Appl. Sci. Eng., vol. 14,
     no. 2, pp. 505-514, 2004.
[38] J.T. Lizier and M. Prokopenko, ”Differentiating information transfer and causal effect,” Eu-
     ropean Phys. J. B, 73(4), 605-615, 2010.
[39] C.W.J. Granger, ”Testing for causality: a personal viewpoint,” J. Econ. Dyn. Control, vol. 2,
     329-352, 1980.
[40] C.A. Sims, ”Discrete approximations to continuous time distributed lags in econometrics,”
     Econometrica, 39, 545-563, 1971.
[41] D.A. Smirnov and B.P. Bezruchko, ”Spurious causalities due to low temporal resolution:
     Towards detection of directional coupling from time series,” Europhys. Lett., vo..100, 100005,
     2012.
[42] H. Nalatore, M. Ding, and G. Rangarajan, ”Mitigating the effects of measurement noise on
     Granger causality,” Phys. Rev. E, 75, 031123, 2007.
[43] D.W. Hahs and S.D. Pethel, ”Distinguishing anticipation from causality: Anticipatory bias in
     the estimation of information flow,” Phys. Rev. Lett., vol. 107, 128701, 2011.
[44] D.A. Smirnov, “Spurious causalities with transfer entropy,” Phys.Rev. E, vol. 87, 042917,
     2013.
[45] X.S. Liang and R. Kleeman, “Information transfer between dynamical system components,”
     Phys. Rev. Lett., vol. 95, no. 24, 244101, 2005.
[46] X.S. Liang, “The Liang-Kleeman information flow: Theory and application,” Entropy, vol. ,
     2013.
[47] X.S. Liang and R. Kleeman, ”A rigorous formalism of information transfer between dynamical
     system components. I. Discrete mapping,” Physica D, vol. 231, 1-9, 2007.
[48] X.S. Liang and R. Kleeman, ”A rigorous formalism of information transfer between dynamical
     system components. I . Continuous flow,” Physica D, vol. 227, 173-182, 2007.
[49] A. Lasota and M.C. Mackey, Chaos, Fractals, and Noise: Stochastic Aspects of Dynamics.


                                               48
     Springer, New York, 1994.
[50] J.L. Kaplan and J.A. Yorke, Functional Differential Equations and Approximations of Fixed
     Points (Lecture notes in Mathematics 730). Springer-Verlag, 1979.
[51] O.E. Rössler, ”An equation for continuous chaos,” Phys. Lett., vol. 57A(5), 397-398, 1976.
[52] Y. Bar-Yam, Dynamics of Complex Systems. Addison-Welsley Press. Reading, MA, USA,
     1997. 864pp.
[53] J.P. Crutchfield, ”The calculi of emergence: computation, dynamics, and induction induction,”
     Physica D, vol. 75, 11-54, 1994.
[54] J. Goldstein, ”Emergence as a construct: History and issues,” Emerg. Complex. Org., vol. 1,
     49-72, 1999.
[55] J.C. McWilliams, ”The emergence of isolated, coherent vortices in turbulence flows,” J. Fluid
     Mech., vol. 146, 21-43, 1984.
[56] P.A. Corning, ”The re-emergence of emergence: A venerable concept in search of a theory,”
     Complexity, vol. 7, 18-30, 2002.
[57] T.M. Cover and J.A. Thomas, Elements of Information Theory, John Wiley & Sons, Inc.,
     1991
[58] R.V. Abramov, G. Kovacic, and A.J. Majda, ”Hamiltonian structure and statistically relevant
     conservative quantities for the truncated Burgers-Hopf equation,” Comm. Pure & Appl. Math.,
     vol. LVI, 1-46, 2003.




                                              49
