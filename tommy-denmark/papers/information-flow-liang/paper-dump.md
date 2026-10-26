PHYSICAL REVIEW E 94, 052201 (2016)
Information flow and causality as rigorous notions ab initio
X. San Liang*
Nanjing Institute of Meteorology, Nanjing 210044, China
and China Institute for Advanced Study, Beijing 100081, China
(Received 23 June 2016; revised manuscript received 30 September 2016; published 1 November 2016)
Information flow or information transfer the widely applicable general physics notion can be rigorously derived
from first principles, rather than axiomatically proposed as an ansatz. Its logical association with causality is
firmly rooted in the dynamical system that lies beneath. The principle of nil causality that reads, an event is
not causal to another if the evolution of the latter is independent of the former, which transfer entropy analysis
and Granger causality test fail to verify in many situations, turns out to be a proven theorem here. Established
in this study are the information flows among the components of time-discrete mappings and time-continuous
dynamical systems, both deterministic and stochastic. They have been obtained explicitly in closed form, and put
to applications with the benchmark systems such as the Kaplan-Yorke map, R¨ossler system, baker transformation,
H´enon map, and stochastic potential flow. Besides unraveling the causal relations as expected from the respective
systems, some of the applications show that the information flow structure underlying a complex trajectory
pattern could be tractable. For linear systems, the resulting remarkably concise formula asserts analytically that
causation implies correlation, while correlation does not imply causation, providing a mathematical basis for the
long-standing philosophical debate over causation versus correlation.
DOI: 10.1103/PhysRevE.94.052201
I. INTRODUCTION
Information flow, or information transfer as it may be
referred to in the literature, has been realized as a fundamental
notion in general physics. Though literally one may associate
it with communication, its importance lies far beyond in
that it implies causation [1–5], uncertainty propagation [6],
predictability transfer [7–9], etc. In fact, it is the recognition
of its causality association that has attracted enormous interest
from a wide variety of disciplines, e.g., neuroscience [10–16],
finance [17,18], climate science [19,20], turbulence research
[21,22], network dynamics [23–26], and dynamical systems
particularly the field of synchronization [27–33].
This recognition has been further substantiated by the
finding that transfer entropy [5] and Granger causality [34]
are equivalent for Gaussian variables (up to a factor 2) [35].
Historically, many information theoretic quantities have
been axiomatically or empirically proposed to measure
information flow, including time-delayed mutual information
[36], transfer entropy [5], momentary information transfer
[20], and causation entropy [37]. Among these most notably
is transfer entropy, which has spawned many varieties in
its family, e.g., [13,17,38], and has been widely applied in
different disciplines.
A fundamental question to ask is whether information
flow needs to be axiomatically proposed as an ansatz (as the
transfer entropy above), or whether it can be derived from
first principles in information theory. Naturally, one would
like to minimize or avoid the use of axioms in introducing
new concepts in order to have the material more coherent
*sanliang@courant.nyu.edu
Published by the American Physical Society under the terms of the
Creative Commons Attribution 3.0 License. Further distribution of
this work must maintain attribution to the author(s) and the published
article’s title, journal citation, and DOI.
within the field to which it belongs. In physics, “flow” or
“transfer” does have definite meaning, albeit the meaning may
differ depending on the context. One then naturally expects
the concept to be rigorized. Indeed, as we will see soon, at
least within the framework of dynamical systems, information
flow/transfer can be rigorously derived from, rather than
empirically or axiomatically proposed with, Shannon entropy.
Another impetus regards the inference of causality. As
mentioned in the beginning, information flow arouses enor-
mous interest in a wide range of fields not because of its
original meaning in communication but because of its logical
implication of causation. Whether the cause-effect relation
underlying a system can be faithfully revealed is, therefore, the
touchstone for a formalism of information flow. That is to say,
information flow should be formulated with causality naturally
embedded; it should, in particular, accurately reproduce a
one-way causality (if existing), which is unambiguously equal
to zero on one side. More specifically, a faithful formalism
should verify the observational fact which we will henceforth
refer to as principle of nil causality: an event is not causal to
another event if the evolution of the latter does not depend on
the former. In this light, the widely used formalism, namely,
transfer entropy, is unfortunately not as satisfactory as one
expects. This has even led to discussions on whether the two
notions, namely, information flow and causality, should be
differentiated (e.g., [39]). Since it is established that Granger
causality and transfer entropy are equivalent, one may first
look at the problems from the former. Now it is well known
that spurious Granger causality may arise due to unobserved
variables that influence the system dynamics (a problem iden-
tified by Granger himself) [40], due to low resolution in time
[41,42], and due to observational noise [43]. Besides, Granger
explicitly excludes deterministic systems in establishing the
causality formalism, a case that is certainly important in
realistic problems. For transfer entropy, the issue has just
been systematically examined [45]. Aside from the failure in
recovering the many preset one-way causalities, evidence has
2470-0045/2016/94(5)/052201(28) 052201-1 Published by the American Physical Society
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
shown that sometimes it may even give qualitatively wrong
results; see [44] and [45] for such examples.
Realizing the limitation of transfer entropy, different
alternatives have been proposed; the above momentary
information transfer is one of these proposals. The purpose of
this study is, instead of just remedying the deficiencies of the
existing formalisms, to put information flow the fundamental
physical notion on a rigorous footing so that it is universally
applicable. The stringent one-way causality requirement will
not be just verified with certain given examples, but rigorously
proved as theorems.
With this faith, Liang and Kleeman [46] in 2005 took
the initiative to study the problem with dynamical systems.
In this framework, the information source and recipient are
abstracted as the system components, and hence the problem
is converted into the information flow or information transfer
between dynamical system components. The basic idea can be
best illustrated with a deterministic system of two components,
say, x1 and x2:
dx1
dt = F1(x1,x2,t), (1)
dx2
dt = F2(x1,x2,t), (2)
where we follow the convention in physics and do not
distinguish random and deterministic variables, which should
be clear in the context. Now what we are to consider are the
time evolutions of the marginal entropies of x1 and x2, denoted
respectively as H1 and H2. Look at x1; its marginal entropy
evolution may be due to x1 itself or subject to the influence
of x2. This partitions the set of mechanisms that cause H1 to
grow into two exclusive subsets. That is to say, if we write the
contribution from the former mechanism as dH ∗/dt and that
from the latter as T2→1, then
dH1
dt = dH ∗
1
dt + T2→1. (3)
This T2→1 is the very time rate of information flowing from
x2 to x1. We remark that this setting is rather generic, except
for the requirement of differentiability for the vector field
F = (F1,F2)T . In particular, the input-output communication
problem can be cast within the framework by letting, for
example, F2 = F2(x1,t), F1 = F1(x1,t), where x1 is the
input/drive and x2 the output/consequence, and the channel is
represented by F2.
From the above argument, the evaluation of the information
flow T2→1 may be fulfilled through evaluating dH ∗
1 /dt.
This is because that, when a dynamical system is given,
the density evolution is known through the corresponding
Liouville equation, and, accordingly, dH1/dt can be obtained.
In [46], Liang and Kleeman prove that the joint entropy of
(x1,x2) follows a very concise law
dH
dt = E(∇ · F), (4)
where E is the operator of mathematical expectation. They
then argue that
dH ∗
1
dt = E
( ∂F1
∂x1
)
, (5)
and hence obtain the time rate of information flowing from x2
to x1
T2→1 = dH1
dt − dH ∗
1
dt = −E
( 1
ρ1
∂F1ρ1
∂x1
)
, (6)
where ρ1 is the marginal probability density function of x1. The
thus-obtained information flow is asymmetric between x1 and
x2; moreover, it possesses a property of causality, which reads,
if the evolution of x1 does not depend on x2, then T2→1 = 0.
This is precisely the principle of nil causality.
The above result is later on rigorously proved [48,49]. It is
remarkable in that the principle of nil causality can be stated
as a proven theorem, rather than a fact for a formalism to
verify; see [47] for a review. This result, however, is only
for systems of dimension 2 (2D). For systems with many
components, it does not work any more. We have endeavored to
extend it to more general situations and have obtained results
for deterministic systems of arbitrary dimensionality which
possess the property of causality. But, as we will see in the
following section, the extension relies on an assumption that
is, again, axiomatically proposed. This makes the resulting
formalism not one fully derived from first principles, and as
we realize later on, it does not work for multidimensional
stochastic systems. This line of work, though with a promising
start, is stuck at this point.
In this study, we will show that the assumption can be
completely removed. In a unified approach, the notion of
information flow can be rigorously derived for both deter-
ministic and stochastic systems of arbitrary dimensionality.
In the following, we first briefly set up the framework, and
show where the snag lies in the above approach. The solution
is then presented, and applied to derive the information
flows for deterministic mappings (Sec. III), continuous-time
deterministic systems (Sec. IV), stochastic mappings (Sec. V),
and continuous-time stochastic systems (Sec. VI). For the
purpose of demonstration, each section contains one or more
applications. As an important particular case, we specialize
to do the derivation for linear systems, and the material is
presented in Sec. VII. This study is summarized in Sec. VIII.
II. THE SNAG IN THE LIANG-KLEEMAN FORMALISM
The success of the Liang-Kleeman formalism is remark-
able. It is, however, only for 2D dynamical systems. When the
dimensionality exceeds 2, the resulting quantity, namely, (6),
is not the information transfer from x2 to x1, but the cumulant
transfer to x1 from all other components x2,x3, . . . ,xn. In this
sense, the use of (6) is rather limited.
In order to extend the formalism to systems of higher
dimensionality, Liang and Kleeman [48,49] reinterpret the
term dH ∗
1 /dt in the above decomposition (3), for a 2D system,
as the evolution of H1 with the effect of x2 excluded. More
specifically, it is the evolution of H1 with x2 instantaneously
frozen as a parameter at time t. To avoid confusing with
dH ∗
1 /dt, denote it as dH1\2/dt, where the subscript \2 signifies
that x2 is frozen, or that its effect is removed. With this, the
disjoint decomposition (3) is restated as
dH1
dt = dH1\2
dt + T2→1. (7)
052201-2
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
Note this decomposition, albeit seemingly with only a change
of symbol, is actually fundamentally different from (3) in
physical meaning; it now holds for systems of arbitrary
dimensionality. The information flow is, therefore,
T2→1 = dH1
dt − dH1\2
dt . (8)
Of course, the key is how to find dH1\2
dt . In [48] and [49],
Liang and Kleeman start with discrete mappings, and then
take the limit as the time step size goes to zero. To illustrate,
let  : Rn → Rn be a mapping taking x(τ ) to x(τ + 1), as
time moves on, from step τ to τ + 1. Correspondingly there is
another mapping P : L1(Rn) → L1(Rn) that steers its density
ρ forward. This mapping is called a Frobenius-Perron operator;
we will refer to it as the F-P operator henceforth. Loosely
speaking, P is, for any ω ⊂ Rn, such that [50]
∫
ω
Pρ(x)dx =
∫
−1(ω)
ρ(x)dx. (9)
When the sample space is in a Cartesian product form, as
it is in this case (Rn), the operator can be evaluated. Let
a = (a1,a2, . . . ,an) be some constant point, and ω = [a1,x1] ×
[a2,x2] × . . . × [an,xn]. It has be established that (e.g., [50])
Pρ(x) = ∂ n
∂xn . . . ∂x2∂x1
×
∫
−1(ω)
ρ(ξ1,ξ2, . . . ,ξn)dξ1dξ2 . . . dξn. (10)
For convenience, a is usually taken to be the origin. Fur-
thermore, if  is nonsingular and invertible, then P can be
explicitly written out
Pρ(x) = ρ[−1(x)] · |J −1|, (11)
where J is the Jacobian of .
As the F-P operator carries ρ forth from time step τ to
τ + 1, accordingly the entropies H , H1, and H2 are also steered
forward. On [τ,τ + 1], let H1 be incremented by H1. By the
foregoing argument, the evolution of H1 can be decomposed
into two exclusive parts, namely, the information flow from
x2, T2→1, and the evolution with the effect of x2 excluded,
H1\2. Hence, for discrete mappings, we have the following
counterpart of (8):
T2→1 = H1 − H1\2. (12)
Liang and Kleeman derive the information flow for the
continuous system from the discrete mapping. So the whole
procedure relies on how
H1\2 = H1\2(τ + 1) − H1(τ )
is evaluated, or, more specifically, how H1\2(τ + 1) is evaluated
[since H1(τ ) is known]. To see where lies its difficulty, first
notice that
H1(τ + 1) = −
∫
R
(Pρ)1(x1) log(Pρ)1(x1)dx1,
which is the mean of − log(Pρ)1(x1). Here the base of the
log may be either 2 or e; it only affects the units of the results
(resp. bits and nats). We hence do not specify it here and in the
following formulas. But for consistency, let us use a base of
e throughout. Given , P can be found in the way as shown
above, so H1(τ + 1) is known. For H1\2, however, things are
much more difficult; − log(P\2ρ)1(x1) involves not only the
random variable x1(τ + 1), but also x2(τ ) (embedded in the
subscript \2). What is the joint density of (x2(τ ),x1(τ + 1))?
We do not know. In [48] and [49], an approximation was
proposed, which gives
H1\2(τ + 1) = −
∫
(P\2ρ)1(y1) log(P\2ρ)1(y1)
× ρ(x2|x1,x3, . . . ,xn)ρ3...n(x3, . . . ,xn)
× dy1dx2dx3 . . . dxn,
where y1 is employed to signify x1(τ + 1) and the symbol x1
is reserved for x1(τ ). This is a natural extension of what the
authors use in the their original study [46] for 2D discrete
mappings. A central approximation is that they use
ρ(x2|x1,x3, . . . ,xn)(P\2ρ)1(y1)ρ3...n(x3, . . . ,xn)
to represent the joint probability density function (pdf) of
y1 and x2 (and x3, . . . ,xn) [think about ρ(x2|x1)ρ(x1) =
ρ(x1,x2)]. This is, however, only an approximation, since we
really do not know what the joint pdf of (y1,x2) is. As we will
see soon, though the resulting formalism verifies dH1\2/dt =
dH ∗
1 /dt for 2D systems and the principle of nil causality for
one-way causal deterministic systems, when stochasticity gets
in, the causality property cannot be recovered this way.
III. DETERMINISTIC MAPPING
A. Derivation
Fortunately, the issue that stuck the Liang-Kleeman for-
malism can be fixed; we actually can get the entropy without
appealing to the joint probability density function of (y1,x2),
i.e., that of (x1(τ + 1),x2(τ )) as mentioned above. Consider a
mapping
 : → , x(τ )  → x(τ + 1) = (1(x),2(x), . . . ,n(x)),
where is the sample space (Rn in particular). Let ψ : →
be an arbitrary differentiable function of x. We have the
following theorem:
Theorem III.1.
Eψ(x(τ + 1)) = Eψ((x(τ ))). (13)
Remark 1. The expectation operator E on the right hand
side applies to a function of x(τ ); it is thence with respect
to ρ(τ ). Differently, the left hand side E is with respect to
ρ(τ + 1) = Pρ, where P is the F-P operator as introduced
in (9).
Remark 2. This equality is important in that one actually
can obtain the expectation of ψ(x(τ + 1)) without evaluating
Pρ.
Proof. The following proof is in the framework of Riemann-
Stieltjes integration. A more general proof in terms of
Lebesgue theory is also possible; in that case it may be used
to introduce the Koopman operator (e.g., [50]). But here this
is unnecessary, since the functions and vector fields we are
dealing with in this study are assumed to differentiable.
Let {ω1,ω2, . . . ,ωn} be a partitioning of the sample space
. The elements are mutually exclusive and = ∪n
k=1ωk. To
052201-3
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
make it simple, assume that these ωk’s have the same diameter
(the maximal distance between any two points in ωk). For
clarity, write x(τ + 1) as y, while x is reserved for x(τ ). Then
Eψ(x(τ + 1)) =
∫
Pρ(y)ψ(y)dy
= lim
n→∞
n∑
k=1
∫
ωk
Pρ(y)ψ(y)dy
= lim
n→∞
n∑
k=1
ψ(yk)
∫
ωk
Pρ(y)dy,
where yk ∈ ωk is some point in ωk. The existence of the
Riemann integral ∫ Pρ(y)ψ(y)dy assures that it can be any
point in ωk as n goes to infinity, while the resulting integral is
the same. Now by (9),
∫
ωk
Pρ(y)dy =
∫
−1(ωk)
ρ(x)dx.
So the above becomes
Eψ(x(τ + 1)) = lim
n→∞
n∑
k=1
ψ(yk)
∫
ωk
Pρ(y)dy
= lim
n→∞
n∑
k=1
ψ(yk)
∫
−1(ωk)
ρ(x)dx
= lim
n→∞
n∑
k=1
∫
−1(ωk)
ρ(x)ψ((x))dx.
Notice, for  : → , = ∪kωk, it must be that
∪k−1(ωk) = . So the limit converges to ∫ ρ(x)ψ((x))dx.
That is to say, Eψ(x(τ + 1)) = Eψ((x(τ ))). 
The equality (13) actually can be utilized to derive the F-P
operator. We look at the particular case when  is invertible.
By definition, Eq. (13) means
∫
ψ(x)ρ(τ + 1,x)dx =
∫
ψ((x))ρ(τ,x)dx.
If  is invertible, the right hand side is ∫ ψ(y) ·
ρ(τ,−1(y))|J −1|dy by transformation of variables. Since ψ
is arbitrary, we have
Pρ = ρ(τ + 1,x) = ρ(τ,−1(x)) · |J −1|,
which is precisely the Frobenius-Perron operator (11).
The above equality provides us a convenient and accurate
way to evaluate H1(τ + 1) and H1\2(τ + 1). Picking ψ as
(log Pρ)1 and log(P\2ρ)1, we obtain, respectively, the fol-
lowing formulas:
Corollary III.1.
H1(τ + 1) = −E log(Pρ)1(1(x)), (14)
H1\2(τ + 1) = −E log(P\2ρ)1(1(x)). (15)
In these formulas, both the expectations are taken with
respect to ρ(x1,x2, . . . ,xn), i.e., the pdf at time step τ . In (15),
we do not need to care about the joint pdf ρ(y,x2) any more.
The information flow from x2 to x1 is, therefore,
Theorem III.2.
T2→1 = E log(P\2ρ)1(1(x)) − E log(Pρ)1(1(x)). (16)
Proof.
T2→1 = H1 − H1\2 = [H1(τ + 1) − H1(τ )]
−[H1\2(τ + 1) − H1(τ )] = H1(τ + 1) − H1\2(τ + 1).
Substitute into the above formulas for H1 and H1\2 and (16)
follows.
Note that the evaluation of P\2ρ and Pρ generally depends
on the system in question. But when  and \2 are invertible,
the information flow can be found explicitly in a closed form.
B. Properties
Theorem III.3. For 2D systems, if 1 is invertible, then
H1\2 = H1\2(τ + 1) − H1(τ ) = E log |J1|.
Remark. This is the analog of (5) for discrete-time systems
[46,48].
Proof. Let x(τ + 1) ≡ y. For a 2D system, and if 1 is
invertible, we have
(P\2ρ)1(y) = ρ1
(−1
1 (y1)
) · ∣
∣J −1
1
∣
∣,
which gives
H1\2 = −Ex log [ρ1(−11(y1)) · |J −1
1 |]
= −E log [ρ1(x1) · |J −1
1 |]
= −E log ρ1(x1) + E log |J1|.
To avoid confusion, we use Ex to indicate that the expectation
is with respect to x when mixed variables x and y appear
simultaneously. Note here x1 = −11(y1) since this is a 1D
system after x2 is frozen. Thus
H1\2 = E log |J1|.

Theorem III.4 (principle of nil causality). If 1 is indepen-
dent of x2, then T2→1 = 0.
Proof. By the definition of the F-P operator,
∫
ω1
(P\2ρ)1(x1)dx1
=
∫
ω1×Rn−2
P\2ρ(x1,x3, . . . ,xn)dx1dx3 . . . dxn
=
∫
−1\2(ω1×Rn−2)
ρ\2(x1,x3, . . . ,xn)dx1dx3 . . . dxn
for any ω1 ⊂ R. Note
−1\2(ω1 × Rn−2) = −11\2(ω1 × Rn−2).
That is to say,
∫
ω1
(P\2ρ)1(x1)dx1
=
∫
−11\2ω1
dx1
∫
Rn−2
ρ\2(x1,x3, . . . ,xn)dx3 . . . dxn
=
∫
−11\2ω1
ρ1(x1)dx1 =
∫
−11ω1
ρ1(x1)dx1
052201-4
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
since 1 (hence −11) is independent of x2. On the other hand,
∫
ω1
(Pρ)1(x1)dx1 =
∫
ω1×Rn−1
Pρ(x)dx
=
∫
−1(ω1×Rn−1)
ρ(x)dx
=
∫
−11ω1×Rn−1
ρ(x)dx
=
∫
−11ω1
dx1
∫
Rn−1
ρ(x)dx2 . . . dxn
=
∫
−11ω1
ρ1(x1)dx1.
So ∫
ω1(P\2ρ)1(x1)dx1 = ∫
ω1(Pρ)1(x1)dx1, ∀ω1 ⊂ R, and
hence (P\2ρ)1 a.e.
= (Pρ)1. Therefore,
E log(Pρ)1(x1) = E log(P\2ρ)1(x1)
and
T2→1 = H1(τ + 1) − H1\2(τ + 1) = 0.

C. Application: Kaplan-Yorke map
Once a dynamical system is specified, in principle the
information flow can be obtained. This subsection presents
an application with a discrete-time dynamical system, the
Kaplan-Yorke map [51], that exhibits chaotic behavior.
The Kaplan-Yorke map is defined as a mapping  =
(1,2) : [0,1] × R → [0,1] × R, (x1,x2)  → (y1,y2), such
that
y1 = 1(x1,x2) = 2x1 mod 1, (17)
y2 = 2(x1,x2) = αx2 + cos(4πx1). (18)
A typical trajectory for α = 0.2 is plotted in Fig. 1. We now
compute the information flows between the two components.
First we need to find the F-P operator Pρ(y1,y2). Pick a
domain ω = [0,y1] × [0,y2]. By (10)
Pρ(y1,y2) = ∂ 2
∂y2∂y1
∫
−1(ω)
ρ(ξ1,ξ2)dξ1dξ2, (19)
so the key is the finding of −1(ω). Since
y1 =
{2x1, 0  x1  1
2 ,
2x1 − 1, x1 > 1
2 ,
it is easy to obtain
−1
1 ([0,y1]) =
[
0, y1
2
]
∪
[ 1
2 , 1 + y1
2
]
. (20)
Given y1, x1 may be either y1/2 or (1 + y1)/2, but either way,
cos(4πx1) = cos(2πy1). Thus
−1
2 ({y1} × [0,y2]) =
[
− cos 2πy1
α , y2 − cos 2πy1
α
]
. (21)
0.2 0.4 0.6 0.8
−1
−0.5
0
0.5
1
x1
x2
FIG. 1. The attractor of the Kaplan-Yorke map [Eqs. (17) and
(18)] with α = 0,2. To avoid the round-off error in the computation
which will quickly lead to a zero x1, we let b = 9 722 377, and in-
stead compute an+1 = 2an mod b, x1,n+1 = an/b, x2,n+1 = αx2,n +
cos(4πx1,n). The trajectory is initialized with x1 = 7 722 377/b,
x2 = 0. (The initial points outside the attractor are not shown.)
Equation (19) is, therefore,
Pρ(y1,y2) = ∂ 2
∂y2∂y1
∫ y1/2
0
dξ1
∫ y2−cos 2πy1
α
− cos 2πy1
α
ρ(ξ1,ξ2)dξ2
+ ∂ 2
∂y2∂y1
∫ (1+y1)/2
1/2
dξ1
∫ y2−cos 2πy1
α
− cos 2πy1
α
ρ(ξ1,ξ2)dξ2
= 1
2α
[
ρ
( y1
2 , y2 − cos 2πy1
α
)
+ρ
( 1 + y1
2 , y2 − cos 2πy1
α
)]
+ 1
α
[ ∫ y1/2
0
∂
∂y1
ρ
(
ξ1, y2 − cos 2πy1
α
)
dξ1
+
∫ (1+y1)/2
1/2
∂
∂y1
ρ
(
ξ1, y2 − cos 2πy1
α
)
dξ1
]
.
To compute T2→1, freeze x2. The resulting mapping \2 is
the dyadic mapping in the x1 direction. As above,
−1
\2 ([0,y1]) =
[
0, y1
2
]
∪
[ 1
2 , 1 + y1
2
]
,
which gives
P\2ρ(y1) = ∂
∂y1
∫
−1
\2 ([0,y1])
ρ1(ξ1)dξ1
= 1
2
[
ρ1
( y1
2
)
+ ρ1
( 1 + y1
2
)]
.
On the other hand,
(P)1(y1) =
∫
R
Pρ(y1,y2)dy2
= 1
2 ρ1
( y1
2
)
+ 1
2 ρ1
( 1 + y1
2
)
052201-5
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
+
∫ y1/2
0
∂
∂y1
ρ1(ξ1)dξ1 +
∫ (1+y1)/2
1/2
∂
∂y1
ρ1(ξ1)dξ1
= 1
2
[
ρ1
( y1
2
)
+ ρ1
( 1 + y1
2
)]
.
So
T2→1 = E log(P\2ρ)1(y1) − E log(Pρ)1(y1) = 0, (22)
just as one would expect based on the independence of 1 on
x2. This serves as a validation of Theorem III.4.
To compute T1→2, notice
−1
\1 ([0,y2]) =
[
− cos 4πx1
α , y2 − cos 4πx1
α
]
.
The corresponding F-P operator is such that
(P\1ρ)(y2) = ∂
∂y2
∫ y2−cos 4πx1
α
− cos 4πx1
α
ρ2(ξ2)dξ2
= 1
α ρ2
( y2 − cos 4πx1
α
)
= 1
α ρ2(x2),
which makes sense, considering that, when x1 is frozen, y2 is
just a translation followed by a rescaling of x2. On the other
hand, the marginal density
(Pρ)2(y2)
=
∫ 1
0
Pρ(y1,y2)dy1
= 1
2α
∫ 1
0
[
ρ
( y1
2 , y2 − cos 2πy1
α
)
+ρ
( 1 + y1
2 , y2 − cos 2πy1
α
)]
dy1
+ 1
α
∫ 1
0
dy1
[ ∫ y1/2
0
∂
∂y1
ρ
(
ξ1, y2 − cos 2πy1
α
)
dξ1
+
∫ (1+y1)/2
1/2
∂
∂y1
ρ
(
ξ1, y2 − cos 2πy1
α
)
dξ1
]
.
Because of the intertwined y1 and y2, these integrals cannot
be explicitly evaluated without specifications of ρ. But when
ρ is given, it is a straightforward exercise to compute
−E log(Pρ)2(y2)
= −
∫ 1
0
∫
R
log(Pρ)2[2(x1,x2)]ρ(x1,x2)dx1dx2.
Denote it by ˜H2. Then
T1→2 = E log(P\1ρ)2[2(x1,x2)] − E log(Pρ)2[2(x1,x2)]
=
∫ 1
0
∫
R
1
α ρ2(x2)ρ(x1,x2)dx1dx2 + ˜H2
= ˜H2 − H2/α. (23)
Generally this does not vanish. That is to say, within the
Kaplan-Yorke map, there exists a one-way information flow
from x1 to x2.
D. Applications: The baker transformation and
H´enon map revisited
Since its establishment, the Liang-Kleeman formalism has
been applied to a variety of dynamical system problems.
Hereafter we will restudy some benchmark examples and see
whether the results are different. In this subsection we look at
the baker transformation and H´enon map.
1. Baker transformation
The baker transformation is an extensively studied pro-
totype of area-conserving chaotic maps that has been used
to model the diffusion process in the real physical world. It
mimics the kneading of dough: first the dough is compressed,
then cut in half; the two halves are stacked on one another,
compressed, and so forth; see Fig. 2 for an illustration. In
formal language, it is  : → , = [0,1] × [0,1] being a
unit square,
(x1,x2)=
{(2x1, x2
2
), 0  x1  1
2 , 0  x2  1,
(2x1−1, 1
2 x2 + 1
2
), 1
2 < x1  1, 0  x2  1.
(24)
It is invertible, and the inverse is
−1(x1,x2)=
{( x1
2 , 2x2
), 0  x2  1
2 , 0  x1  1,
( x1+1
2 , 2x2−1), 1
2  x2  1, 0  x1  1.
(25)
Thus the F-P operator P can be easily found:
Pρ(x1,x2) = ρ[−1(x1,x2)] · |J −1|
=
{ρ( x1
2 ,2x2
), 0  x2 < 1
2 ,
ρ( 1+x1
2 ,2x2−1), 1
2  x2  1. (26)
(a)
0 1
1/2
1
2 0 1
1/2
1
2 0 1
1/2
1
2
)c()b(
FIG. 2. A schematic of the unidirectional information flow from the abscissa to the ordinate upon applying the baker transformation.
052201-6
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
We now use the above theorem to compute T2→1. Integrat-
ing (26) with respect to x2,
(Pρ)1(x1)
=
∫ 1/2
0
ρ
( x1
2 ,2x2
)
dx2 +
∫ 1
1/2
ρ
( x1 + 1
2 ,2x2 − 1
)
dx2
= 1
2
∫ 1
0
[
ρ
( x1
2 ,x2
)
+ ρ
( x1 + 1
2 ,x2
)]
dx2
= 1
2
[
ρ1
( x1
2
)
+ ρ1
( x1 + 1
2
)]
. (27)
When x2 is frozen as a parameter, the baker transformation
(24) becomes a dyadic mapping in the x1 direction, i.e., a
mapping 1 : [0,1] → [0,1],
1(x1) = 2x1 (mod 1).
For any 0 < x1 < 1, the counterimage of [0,x1] is
−1([0,x1]) =
[
0, x1
2
]
∪
[ 1
2 , 1 + x1
2
]
.
So
(P\2ρ)1(x1) = ∂
∂x1
∫
−1([0,x1])
ρ(s)ds
= ∂
∂x1
∫ x1/2
0
ρ(s)ds + ∂
∂x1
∫ (1+x1)/2
1/2
ρ(s)ds
= 1
2
[
ρ
( x1
2
)
+ ρ
( 1 + x1
2
)]
.
Thus
(P\2ρ)1(x1) = (Pρ)1(x1).
By the above theorem,
T2→1 = E log(P\2ρ)1[1(x)] − E log(Pρ)1[1(x)] = 0.
To compute T1→2, observe
(Pρ)2(x2) =
∫ 1
0
Pρ(x1,x2)dx1 =
{∫ 1
0 ρ( x1
2 ,2x2
)dx1, 0  x2 < 1
2 ,
∫ 1
0 ρ( x1+1
2 ,2x2 − 1)dx1, 1
2  x2  1. (28)
By Corollary III.1,
H2(τ + 1) = −Ex log(Pρ)2[2(x1,x2)]
= −
∫ 1/2
0
ρ2(x2) log
[∫ 1
0
ρ
( λ
2 ,x2
)
dλ
]
dx2 −
∫ 1
1/2
ρ2(x2) log
[∫ 1
0
ρ
( λ + 1
2 ,x2
)
dλ
]
dx2
= −
∫ 1/2
0
ρ2(x2) log
(
2
∫ 1/2
0
ρ(ξ,x2)dξ
)
dx2 −
∫ 1
1/2
ρ2(x2) log
(
2
∫ 1
1/2
ρ(ξ,x2)dξ
)
dx2
= − log 2 −
∫ 1/2
0
ρ2(x2) log
(∫ 1/2
0
ρ(ξ,x2)dξ
)
dx2 −
∫ 1
1/2
ρ2(x2) log
(∫ 1
1/2
ρ(ξ,x2)dξ
)
dx2,
so
H2 = H2(τ + 1) − H2(τ )
= − log 2 −
∫ 1/2
0
ρ2(x2) log
(∫ 1/2
0
ρ(ξ,x2)dξ
)
dx2 −
∫ 1
1/2
ρ2(x2) log
(∫ 1
1/2
ρ(ξ,x2)dξ
)
dx2
+
∫ 1
0
∫ 1
0
ρ(x1,x2)
[
log
(∫ 1
0
ρ(λ,x2)dλ
)]
dx1dx2
= − log 2 + (I + II ),
where
I =
∫ 1/2
0
ρ2(x2)
[
log
∫ 1
0 ρ(λ,x2)dλ
∫ 1/2
0 ρ(λ,x2)dλ
]
dx2, (29)
II =
∫ 1
1/2
ρ(x2)
[
log
∫ 1
0 ρ(λ,x2)dλ
∫ 1
1/2 ρ(λ,x2)dλ
]
dx2. (30)
To compute H2\1, notice that, when x1 is frozen, the
transformation is invertible; moreover, the Jacobian J2 = 1/2
is a constant. By Theorem III.3,
H2\1 = log 1
2 = − log 2, (31)
which gives
T1→2 = H2 − H2\1 = I + II. (32)
It is easy to show that I + II > 0. In fact, obviously I + II
is non-negative; besides, the two brackets cannot be zero
simultaneously, so it cannot be zero. Hence T1→2 is strictly
positive; that is to say, there is always information flowing
from the abscissa to the ordinate.
052201-7
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
−1 0 1
−0.2
0
0.2
x1
x2
FIG. 3. A typical trajectory of the canonical H´enon map (a = 1.4,
b = 0.3).
To summarize, T2→1 = 0, T1→2 = I + II > 0. These re-
sults are precisely the same as those obtained before in [46]
and [48]. That is to say, for the baker transformation, the
current formalism shows no difference from the previous one
based on heuristic arguments and with approximations.
2. H´enon map
The H´enon map is a mapping  = (1,2) : R2  → R2
defined such that
1(x1,x2) = 1 + x2 − ax2
1 ,
(33)
2(x1,x2) = bx1,
with a > 0, b > 0. The case with parameters a = 1.4 and
b = 0.3 is called a “canonical H´enon map,” whose attractor is
shown in Fig. 3.
It is easy to see that the H´enon map is invertible; its inverse
is
−1(x1,x2) =
( x2
b , x1 − 1 + a
b2 x2
2
)
. (34)
The F-P operator thus can be easily found from (11):
Pρ(x1,x2) = ρ(−1(x1,x2))|J −1|
= 1
b ρ
( x2
b , x1 − 1 + a
b2 x2
2
)
. (35)
In the following we compute the flows between the quadratic
component x1 and the linear component x2.
Look at T2→1 first. By (16), we need to find the marginal
density of x1 at step τ + 1 with and without the effect of x2,
i.e., (Pρ)1 and (Pρ)1\2. From (35), (Pρ)1 is
(Pρ)1(x1) =
∫
R
Pρ(x1,x2)dx2
=
∫
R
1
b ρ
( x2
b ,x1 − 1 + a
b x2
2
)
dx2
=
∫
R
ρ(η,x1 − 1 + aη2)dη (x2/b ≡ η).
If a = 0, this would give ρ2(x1 − 1), i.e., the marginal pdf of
x2 with argument x1 − 1. But here a > 0, the integration is
taken along a parabolic curve rather than a straight line. Still
the final result will be related to the marginal density of x2; for
notational simplicity, write
(Pρ)1(x1) = ˜ρ2(x1). (36)
To find (P\2ρ)1, use y1 to denote
1(x1) = 1 + x2 − ax2
1 ,
following our convention to distinguish variables at different
steps. Modify the system so that x2 is now a parameter. As
before, we need to find the counterimage of (−∞,y1] under
the transformation with x2 frozen:
−1
1 ((−∞,y1])
= (−∞, − √(1 + x2 − y1)/a]∪[√(1 + x2 − y1)/a, ∞).
Therefore,
(P\2ρ)1(y1) = d
dy1
∫
−1
1 ((−∞,y1])
ρ1(s)ds
= d
dy1
∫ −√(1+x2−y1)/a
−∞
ρ1(s)ds
+ d
dy1
∫ ∞
√(1+x2−y1)/a
ρ1(s)ds
= 1
2√a(1 + x2 − y1)
[ρ1(−√(1 + x2 − y1)/a)
+ρ1(
√(1 + x2 − y1)/a)] (y1 < 1 + x2)
= 1
2a|x1| [ρ1(−x1) + ρ1(x1)]
(recall y1 = 1 + x2 − axp12).
Denote the average of ρ1(−x1) and ρ1(x1) as ¯ρ1(x1) to make
an even function of x1. Then (P\2ρ)1 is simply
(P\2ρ)1(y1) = ¯ρ1(x1)
a|x1| . (37)
Note that the parameter x2 does not appear in the arguments.
Substitute all the above into (16) to get
T2→1 = E log(P\2ρ)1(y1) − E log(Pρ)1(y1)
= E log ¯ρ1(x1)
a|x1| − E log ˜ρ2
(1 + x2 − ax2
1
)
= E log ¯ρ1(x1) − E log |ax1| − E log ˜ρ2
(1 + x2 − ax2
1
).
Comparing this to the result in [48], except for the term
−E log |ax1|, all other terms are different.
Next consider T1→2. From (35), the marginal density of x2
at τ + 1 is
(Pρ)2(x2) =
∫
R
Pρ(x1,x2)dx1
=
∫
R
1
b ρ
( x2
b , x1 − 1 + a x2
2
b2
)
dx1
= 1
b
∫
R
ρ(y,ξ ) dξ = 1
b ρ1
( x2
b
)
.
Thus
H2 = −E(Pρ)2(y2)
= −
∫
R
1
b ρ1
( x2
b
)
log
[ 1
b ρ1
( x2
b
)]
dx2
= H1 + log b.
052201-8
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
The evaluation of H2\1 is much easier. As x1 is frozen as a
parameter, y2 becomes definite. In this case, the 2D random
variable is degenerated to a 1D variable. Correspondingly P\1ρ
becomes a pdf in x1 only. So
(P\1ρ)2 =
∫
R
P\1ρdx1 = 1.
Thus H2\1 = −E log(P\1ρ)2 = 0. By (16), the information
flow from x1 to x2 is, therefore,
T1→2 = H2 − H2\1 = H1 + log b. (38)
In other words, the flow from x1 to x2 is equal to the marginal
entropy of x1, modified by an amount related to the factor
b. Particularly, when b = 1, T1→2 = H1. This is precisely the
same as what is obtained before in [48].
In summary, the information flows within the baker trans-
formation are precisely the same as we have obtained before in
[48]. For the H´enon map, the flow from x1 to x2 has recovered
the benchmark result based on physical grounds, i.e., (38). But
T2→1 is generally different from that in [48].
IV. CONTINUOUS-TIME DETERMINISTIC SYSTEMS
A. Deriving the information flow
Now look at the information flow within continuous
systems, the 2D version of which have motivated this line
of work:
dx
dt = F(t; x). (39)
Consider a time interval [t,t + t]. Following [49], we
discretize the ordinary differential equation and construct a
mapping  : Rn → Rn, x(t)  → x(t + t) = x + Ft. Cor-
respondingly there is a Frobenius-Perron operator P :
L1(Rn) → L1(Rn), ρ(t)  → ρ(t + t). Write x(t + t) as
y, a convention we have been using all the time to
avoid confusion. Then the mapping  : x  → y is such
that
y1 = x1 + F1(x1,x2, . . . ,xn)t,
y2 = x2 + F2(x1,x2, . . . ,xn)t, (40)
... ...
yn = xn + Fn(x1,x2, . . . ,xn)t.
Its Jacobian is
J = det
( ∂y
∂x
)
= det
⎡
⎢
⎢
⎣
1 + ∂F1
∂x1 t . . . ∂F1
∂xn t
... . . . ...
∂Fn
∂xn t . . . 1 + ∂Fn
∂xn t
⎤
⎥
⎥
⎦
= 1 + ∑
i
∂Fi
∂xi t + o(t)
= 1 + ∇ · Ft + o(t). (41)
As t → 0, J → 1 = 0, so  thus constructed is always
invertible for t small enough. Moreover, it is easy to obtain
the inverse mapping
−1 : x = y − Ft + o(t) (42)
and J −1 = 1 − ∇ · Ft + o(t). So
Pρ(y) = ρ(−1(y)) · |J −1|
= ρ(y − Ft) · (1 − ∇ · Ft) + o(t)
= ρ(y) − ∇ρ · Ft − ρ∇ · Ft + o(t)
= ρ(y) − ∇ · (ρF)t + o(t).
As a verification, check
∂ρ
∂t = lim
t→0
Pρ(x) − ρ(x)
t = −∇ · (ρF).
This yields the Liouville equation ∂ρ
∂t + ∇ · (ρF) = 0, as
expected.
With Pρ we now can compute the marginal density
(P)1(y1) = ρ1(y1) − t
∫
Rn−1
∂ρF1
∂y1
dy2 . . . dyn + o(t)
which gives
− log(Pρ)1(y1) = − log ρ1(y1) −
[
log
(
1 − t
ρ1
∫
Rn−1
∂ρF1
∂y1
dy2 . . . dyn + o(t)
)]
= − log ρ1(y1) + t
ρ1(y1)
∫
Rn−1
∂ρF1
∂y1
dy2 . . . dyn + o(t)
= − log ρ1(x1 + F1t) + t
ρ1(x1)
∫
Rn−1
∂ρF1
∂x1
dx2 . . . dxn + o(t).
At the last step, the y’s have been replaced by x’s in the integral term. This is legitimate since the difference goes to higher order
terms.
We now evaluate the marginal entropy increase at t + t. The following is the key step: Take expectation on both sides, the
left hand side with respect to (Pρ)1(y1), while the right hand side with respect to ρ1(x1). This yields
H1(t + t) = −E log ρ1(x1 + F1t) + tE
( 1
ρ1
∫
Rn−1
∂ρF1
∂x1
dx2 . . . dxn
)
+ o(t)
= H1(t) − E ∂ log ρ1
∂x1
F1t + t
∫
R
ρ1
1
ρ1
dx1
∫
Rn−1
∂ρF1
∂x1
dx2 . . . dxn + o(t).
052201-9
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
Note the third term on the right hand side vanishes after
integration with respect to x1 due to the compactness of the
functions. So
H1(t + t) = H1(t) − tE
(
F1
∂ log ρ1
∂x1
)
+ o(t),
and hence
dH1
dt = lim
t→0
H1(t+t)−H1(t)
t = − E
(
F1
∂ log ρ1
∂x1
)
. (43)
This is precisely the same as that either from the F-P operator
[48] or directly from the Liouville equation [46], serving a
validation of our approach in this study.
When x2 is frozen as a parameter on [t,t + t], we need to
examine the modified mapping \2 : Rn−1 → Rn−1:
y1 = x1 + F1(x1,x2, . . . ,xn)t,
y3 = x3 + F3(x1,x2, . . . ,xn)t, (44)
... ...
yn = xn + Fn(x1,x2, . . . ,xn)t,
i.e., the mapping  with the equation y2 = x2 + F2t re-
moved, and x2 frozen as a parameter. Again, here xi stands for
xi(t), and yi for xi(t + t). For convenience, we further adopt
the following notations:
y\2 = (y1,y3, . . . ,yn)T ,
x\2 = (x1,x3, . . . ,xn)T ,
F\2 = (F1,F3, . . . ,Fn)T .
Besides, use ρ\2 to signify the joint density of x\2, and ρ1\2 to
denote the density of x1 with x2 frozen as a parameter on
[t,t + t]. Notice the fact that ρ1\2 = ρ1 at time t.
It is easy to know that the Jacobian of \2
J\2 = det
( y\2
x\2
)
= 1 + t ∑
i =2
∂Fi
∂xi + o(t). (45)
The corresponding F-P operator P\2 : L1(Rn−1) → L1(Rn−1)
is such that
P\2ρ\2(y) = ρ\2(−1\2(y)) · ∣
∣J −1
\2
∣
∣
= ρ\2(y\2 − F\2t) ·
⎛
⎝1 − ∑
i =2
∂Fi
∂xi t
⎞
⎠ + o(t)
= ρ\2(y\2) − ∇ · (ρ\2F\2)t + o(t).
Integrate with respect to (y3, . . . ,yn) (recall that x2 is now a
parameter) to get
(P\2ρ\2)1(y1)
= ρ1\2(y1) − t
∫
Rn−2
∂ρ\2F1
∂y1
dy3 . . . dyn + o(t), (46)
where other terms vanish due to the compactness assumed for
the functions. Hence
− log(P\2ρ\2)1(y1)
= − log ρ1\2(y1) − log
(
1 − t
ρ1\2(y1)
∫ ∂ρ\2F1
∂y1
dy3 . . . dyn
)
+o(t)
= − log ρ1\2(x1 + F1t) + t
ρ1\2(x1)
∫ ∂ρ\2F1
∂x1
dx3 . . . dxn
+o(t).
Note that in the integral term, the y’s have been replaced by
x’s; this is legitimate as the difference goes to the higher order
terms. Since ρ1\2(x1) = ρ1(x1) at t, so
ρ1\2(x1 + F1t) = ρ1(x1) + ∂ρ1
∂x1
F1t + o(t)
and hence
− log(P\2ρ\2)1(y1) = − log ρ1 − 1
ρ1
∂ρ1
∂x1
F1t
+ t
ρ1(x1)
∫ ∂ρ\2F1
∂x1
dx3 . . . dxn + o(t).
Take expectation on both sides, the left hand side with respect
to the joint probability density of (y1,x2), while the right hand
side with respect to (x1,x2). This is the key step that makes the
present study fundamentally different from [49] which relies
on an approximation to fulfill the derivation. This yields
H1\2(t + t) = Ht (t) − tE
(
F1
∂ log ρ1
∂x1
)
+t
∫
R2
ρ12(x1,x2)
ρ1(x1)
dx1dx2
×
∫
Rn−2
∂ρ\2F1
∂x1
dx3 . . . dxn + o(t)
= Ht (t) − tE
(
F1
∂ log ρ1
∂x1
)
+t
∫
R
ρ2|1
∂ρ\2F1
∂x1
dx + o(t),
where ρ2|1 is the conditional density of x2 on x1. Thus
dH1\2
dt = −E
(
F1
∂ log ρ1
∂x1
)
+
∫
Rn
ρ2|1
∂ρ\2F1
∂x1
dx. (47)
We therefore arrive at the following theorem:
Theorem IV.1.
T2→1 = dH1
dt − dH1\2
dt = −
∫
Rn
ρ2|1
∂ρ\2F1
∂x1
dx
= −E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
. (48)
An alternative derivation of the theorem is deferred to the
Appendix.
B. Properties
Theorem IV.2. For a 2D system
dx1
dt = F1(x1,x2,t),
dx2
dt = F2(x1,x2,t),
052201-10
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
we have
dH1\2
dt = E
( ∂F1
∂x1
)
. (49)
Remark. This recovers Eq. (5), the key equation originally
obtained by Liang and Kleeman [46] through heuristic argu-
ment. Here we rigorously prove it.
Proof. When n = 2, ρ\2 = ρ1, hence
dH1\2
dt = E
( 1
ρ1
∂F1ρ1
∂x1
)
− E
( ∂ log ρ1
∂x1
F1
)
= E
[ ∂F1
∂x1
+ F1
∂ρ1
∂x1
1
ρ1
− F1
∂ log ρ1
∂x1
]
= E
( ∂F1
∂x1
)
.

Theorem IV.3 (principle of nil causality). For the system
(39) if F1 is independent of x2, then T2→1 = 0.
Proof. If F1 has no dependence on x2, so is F1ρ\2. Thus
T2→1 = −E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
= −
∫
Rn
ρ(x2|x1)
∂F1ρ\2
∂x1
dx
= −
∫
Rn−1
∂F1ρ\2
∂x1
dx1dx3 . . . dxn = 0,
where the fact ∫ ρ(x2|x1)dx2 = 1 and the assumption of
compact support have been used. 
C. Application: R¨ossler system
In this subsection, we present an application study of the
information flows within the R¨ossler system:
dx
dt = Fx = −y − z, (50)
dy
dt = Fy = x + ay, (51)
dz
dt = Fz = b + z(x − c), (52)
where a, b, and c are parameters. R¨ossler finds a chaotic
attractor for a = 0.2, b = 0.2, c = 5.7 [52], as shown in
Fig. 4. From the figure the trajectories are limited within
[−12,12] × [−14,10] × [0,25].
To calculate the information flows, one needs to obtain the
joint probability density function ρ(x1,x2,x3). It is, of course,
obtainable through solving the Liouville equation
∂ρ
∂t + ∂Fxρ
∂x + ∂Fyρ
∂y + ∂Fzρ
∂z = 0
with some initial condition ρ0. However, there is another way,
namely, ensemble forecast, which is more efficient in terms of
−20 −10 0 10 20
−15
−10
−5
0
5
10
x
y
(a)
−20 −10 0 10 20
0
10
20
30
40
50
x
z
(b)
−15 −10 −5 0 5 10
0
10
20
30
40
50
y
z
(c)
−20
0
20
−20
0
20
0
20
40
60
x
(d)
y
z
FIG. 4. The R¨ossler attractor.
052201-11
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
eqn one time step
Bin counting
(t)ρ (t)ρ
Δ(t+ t)
Δρ(t+ t)
Random draw of
X based on
Ensemble of
X at time t
Integrate the Rossler
forward
at time
Ensemble of X
Integrate the Liouville system one time step
forward
FIG. 5. A schematic of ensemble prediction. Instead of solving
the Liouville equation for the density ρ, we make random draws
according to the initial distribution ρ(t0) to form an ensemble, then
let the R¨ossler system steer forth each member of the ensemble. At
each time step, bins are counted and the probability density function
is accordingly estimated.
computational load. As illustrated in Fig. 5, instead of solving
the Liouville equation, we solve the R¨ossler systems initialized
with an ensemble of initial values of x. This ensemble is formed
with entries randomly drawn according to the initial pdf ρ0. At
each time step, we count the bins thus obtained and estimate
the pdf. The resulting pdf is the desired ρ.
The R¨ossler system [Eqs. (50) and (51)] is solved using the
second order Runge-Kutta method with a time step size t =
0.01. A typical computed trajectory is plotted in Fig. 4. The
initial conditions are randomly drawn according to a Gaussian
distribution N(μ,), the mean vector and covariance matrix
being, respectively,
μ =
⎡
⎢
⎣
8
2
10
⎤
⎥
⎦,  =
⎡
⎢
⎣
4 0 0
0 4 0
0 0 4
⎤
⎥
⎦.
The initial mean values are chosen rather randomly (in
reference to Fig. 4); μx is chosen large to make dH
dt =
E(∇ · F) = μx − 5.5 positive.
Pick a computation domain ≡ [−16,16] × [−18,14] ×
[−4,28], which clearly covers the attractor. We discretize it
into 320 × 320 × 320 = 32 768 000 bins with x = y =
z = 0.1. To ensure one draw for each bin on average, in
the beginning we make 32 768 000 random draws. As the
ensemble scheme is carried forth, ρ and all other statistics
can be estimated as a function of time. By Theorem IV.1 the
information flow rates are computed accordingly.
For a system with three components (x,y,z), there are in
total 6 flow pairs: Tx→y, Ty→z, Tz→x, Tx→z, Ty→x, Tx→z.
A first examination of the system tells us that dy/dt does
not depend on z and dz/dt does not depend on y. By the
principle of nil causality (Theorem IV.3), Tz→y and Ty→z must
vanish. The computational results reconfirm this. In Fig. 6, the
two are essentially zero. What makes the results surprisingly
interesting is that Tx→z is also insignificant (more than one
order smaller in comparison to Ty→x and Tx→y), while the
1 2 3 4
−1.5
−1
−0.5
0
0.5
1
1.5
t
T
FIG. 6. The time series of the information flow rates within the
R¨ossler system (in nats per unit time). Dashed: Ty→x; dotted: Tx→y;
solid: Tz→x. Other flows are essentially zero in this duration. The
initial segments are not shown as some trajectories are still outside
the attractor.
dependence of dz/dt on x is explicitly specified. Besides,
Tz→x is also small in certain periods, e.g., in the interval [1,4.5]
as shown. In the figure are essentially the flows between x and
y: Ty→x and Tx→y.
The above information flow scenario motivates us to check
the system, for the period as shown, with only x and y
two components. This is an amplifying harmonic oscillator
dx
dt = Ax where A = [0 −1
1 a
], a linear system allowing the
information flow, say, from y to x, to be simply expressed as
Ty→x = a12 σ12
σ11 (see below in Sec. VII). That is to say, here the
covariance matrix  = (σij ) completely determines the flow.
The evolution of  follows
d
dt = A + AT .
Initialized by [4 0
0 4], σij can be easily computed; the resulting
Ty→x and Tx→y are shown in Fig. 7. Comparing to those in
1 2 3 4
−0.4
−0.2
0
0.2
0.4
t
Ty→x
Tx→y
FIG. 7. The time series of the information flow rates within the
amplifying harmonic system as shown in the text (in nats per unit
time).
052201-12
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
Fig. 6, the general trend, including the period, seems to be
similar, though the geometry of the curves has been modified
from harmonic into a seesaw one. Besides, the Tx→y (Ty→x)
is always negative (positive) for the harmonic oscillator, while
for the R¨ossler system, they can be both negative and positive.
Note the parameter a in A does not explicitly appear in
the formula, but it does contributes to the generation of the
information flow. One may easily check that, if it is zero, then
d
dt = 0, and hence the flow rates will stay zero if originally
σ12 = 0.
The above example is just used for the demonstration of
application and, in some cases, for the validation of the proven
theorems such as the principle of nil causality. The seemingly
vanishing Tx→z in spite of the dependence of dz/dx on x
certainly deserves further investigation but is beyond the scope
of this study. Here we just want to mention that this does
conform to the observations with complex systems; emergence
does not result from rules only (e.g., [53–55]). It has long
been found that regular patterns may emerge out of irregular
motions with some simple preset rules; a good example is
the 2D turbulent flow in natural world (e.g., [56]). Clearly,
these simple, rudimentary rules are not enough for explaining
the causal efficacy and the bottom-up flow of information
that leads to the emergence of the organized structure. As
commented on by Corning [57], “Rules, or laws, have no
causal efficacy; they do not in fact generate anything . . .
the underlying causal agencies must be separately specified.”
We shall see a more remarkable example in the following
subsection.
D. Application: The truncated Burgers-Hopf system revisited
Here we reexamine the truncated Burgers-Hopf system
(TBS hereafter), a chaotic system which seemingly has rather
simple information flow structures as shown in the studies
of Liang and Kleeman [49]. For a detailed description of the
system itself, see [58]. In this section we only examine the
following particular case:
dx1
dt = F1(x) = x1x4 − x3x2, (53)
dx2
dt = F2(x) = −x1x3 − x2x4, (54)
dx3
dt = F3(x) = 2x1x2, (55)
dx4
dt = F4(x) = −x2
1 + x2
2 . (56)
As we have described before, the system is intrinsically
chaotic, with a strange attractor embedded in
[−24.8,24.6] × [−25.0,24.5] × [−22.3,21.9] × [−23.7,23.7].
The information flow within the TBS cannot be found
analytically.
As before, we use the ensemble prediction technique to
estimate the density evolution, and then evaluate the T ’s. The
setting and procedure are made precisely the same as that in
[49] in order to facilitate a comparison. Details are referred to
the original paper and will not be presented here.
Figure 8 plots the results for the case with a Gaussian initial
distribution N(μ,), where
μ =
⎡
⎢
⎢
⎢
⎣
μ1
μ2
μ3
μ4
⎤
⎥
⎥
⎥
⎦,  =
⎡
⎢
⎢
⎢
⎣
σ 2
1 0 0 0
0 σ 2
2 0 0
0 0 σ 2
3 0
0 0 0 σ 2
4
⎤
⎥
⎥
⎥
⎦,
with μi = 9, σ 2
i = 9, for i = 1,2,3,4.
Shown specifically are the time rates of the 12 information
flows:
T2→1, T3→1, T4→1;
T1→2, T3→2, T4→2;
T1→3, T2→3, T4→3;
T1→4, T2→4, T3→4.
The results are qualitatively the same as before in [49]. That is
to say, except for T3→2, which is distinctly different from zero,
all others are either negligible, or oscillatory around zero. But,
of course, the present flows are much smaller in magnitude,
in comparison to the one obtained before in [49] using the
approximate formula.
V. STOCHASTIC MAPPING
A. Derivation
Consider the system
x(τ + 1) = (x(τ )) + B(x)w, (57)
where  : Rn → Rn is an n-dimensional mapping, B is an n ×
m matrix, and w an m-dimensional normally distributed ran-
dom vector, representing an m-dimensional standard Wiener
process. Without loss of generality, we assume the covariance
matrix of w,  = I, since the perturbation amplitude can be
put into B.
In general, B may depend on x. But this complicates the
derivation a great deal. For simplicity, in this section we only
consider the case when B is a constant n × m matrix. As
x(τ ) is taken to x(τ + 1), there exists an operator, written
P : L1(Rn) → L1(Rn), steering the pdf at time step τ , ρ, to
the pdf at step τ + 1, Pρ. Since x(τ ) and w are independent,
if B is a constant matrix, one may view x(τ + 1) as the sum
of two independent random variables, and then conjecture that
Pρ be the convolution of Pρ and some joint Gaussian
distribution. Here P stands for the F-P operator associated
with the mapping . This is indeed true, as is stated in the
following theorem.
Theorem V.1.
Pρ(y) =
∫
Rn
Pρ(y − Bw) · ρw(w)dw, (58)
where
ρw(w) = (2π)−m/2(det )−1/2e− 1
2 wT −1w.
Proof. We first assume that  is invertible to make the
approach more transparent to the reader. As always, write
x(τ + 1) as y to avoid confusion. Make a transformation:
 :
{y = (x) + Bw,
z = w. (59)
052201-13
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
−1
0
1 T2→1
(a)
−1
0
1 T3→1
(b)
−1
0
1 T4→1
(c)
−1
0
1 T1→2
(d)
−1
0
1
T3→2
(e)
−1
0
1 T4→2
(f)
−1
0
1 T1→3
(g)
−1
0
1 T2→3
(h)
−1
0
1 T4→3
(i)
3 4 5 6 7
−1
0
1
t
T1→4
(j)
3 4 5 6 7
−1
0
1
t
T2→4
(k)
3 4 5 6 7
−1
0
1
t
T3→4
(l)
FIG. 8. Information flows between the components of the 4D truncated Burgers-Hopf system in the invariant chaotic attractor.
Its Jacobian
Jπ = det
[ ∂(y,z)
∂(x,w)
]
= det
[ ∂
∂x B
0 I
]
= det
( ∂
∂x
)
= J ≡ J. (60)
The inverse mapping is
−1 :
{x = −1(y − Bz),
w = z. (61)
For any Sy ∈ Rn, Sz ∈ Rm,
∫
Sy ×Sz
ρyz(y,z)dydz =
∫
−1(Sy ×Sz)
ρxw(x,w)dxdw
=
∫
Sy ×Sz
ρxw(−1(y,z)) · ∣
∣J −1
π
∣
∣dydz.
So
ρyz(y,z) = ρxw(−1(y,z)) · ∣
∣J −1
π
∣
∣
= ρxw(−1(y − Bz),z) · |J −1|
= ρ(−1(y − Bz)) · |J −1| · ρw(z),
where the independence between x and w has been used (hence
ρxw = ρxρw). P(y) = ρy(y) is thence the marginal density by
integrating out z:
Pρ(y) =
∫
Rn
ρ(−1(y − Bz)) · |J −1| · ρw(z)dz.
Since ρ(−1(y)) · |J −1| = Pρ(y), the theorem thus follows.
When  is singular or noninvertible, let its F-P operator be
P, then ∀Sy ∈ Rn, Sz ∈ Rm,
∫
Sy ×Sz
ρyz(y,z)dydz =
∫
−1(Sy ×Sz)
ρxw(x,z)dxdz
=
∫
−1(Sy ×Sz)
ρ(x) · ρw(z)dxdz
=
∫
Sz
ρw(z)dz
∫
−1Sy−Bz
ρ(x)dx
=
∫
Sz
ρw(z)dz
∫
Sy−Bz
Pρ(x)dx
=
∫
Sz
ρw(z)dz
∫
Sy
P(y − Bz)dy.
The conclusion follows accordingly. 
With the above theorem, the information flow can be easily
computed. Note the theorem actually states that
Pρ(y) = EwPρ(y − Bw), (62)
052201-14
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
where Ew signifies the expectation taken with respect to w. So
H1(τ + 1) = −Ey log(Pρ)1(y1)
= −Ex
[
log
∫
Rn−1
EwPρ(y − Bw)dy2 . . . dyn
]
= −Ex[log Ew(Pρ)1(y1 − B1w)],
where B1 ≡ (b11, b12, . . . ,b1m) is the row vector. Likewise,
P\2ρ(y\2) = EwP\2ρ(y\2 − B\2w). (63)
In the equation, the subscript \2 in the vector(s) and matrix
means the second row is removed from the corresponding
entities. So
H1\2(τ + 1) = −Ey log(P\2ρ)1(y1)
= −Ex
[
log
∫
Rn−2
EwP\2ρ(y\2 − B\2w)dy3 . . . dyn
]
= −Ex[log Ew(P\2ρ)1(y1 − B1w)].
Subtract H1\2(τ + 1) from H1(τ + 1), and the information flow
T2→1 follows:
Theorem V.2.
T2→1 = Ex[log Ew(P\2ρ)1(y1 − B1w)]
−Ex[log Ew(Pρ)1(y1 − B1w)]. (64)
B. Properties
Theorem V.3 (principle of nil causality). For the system
(57), if 1 and B1 are independent of x2, then T2→1 = 0.
Proof. As we proved for the deterministic case, if 1 is
independent of x2, then (Pρ)1 a.e.
= (P\2ρ)1. If further B1 has
no dependence on x2, then the above H1(τ + 1) and H1\2(τ + 1)
are equal, and hence T2→1 = 0. 
C. Application: A noisy H´enon map
We now reconsider the benchmark systems that have been
examined before, but with Gaussian noise added. The baker
transformation is not appropriate here, since addition of noise
perturbation will take x outside the domain [0,1]. We hence
only look at the H´enon map  : R2 → R2 :
1(x1,x2) = 1 + x2 − αx2
1 ,
2(x1,x2) = βx1, (65)
with parameters α,β > 0, and consider only the flow T1→2
which has been shown as a benchmark case. Now perturb 
to make a stochastic mapping:
x(τ + 1) = (x(τ )) + Bw, (66)
where B = (bij ) is a constant matrix, w ∼ N(0,I). Let Bi ≡
(bi1,bi2) denote a row vector. It is easy to see that  is
invertible; in fact, J = [−2α2 1
β 0] = −β = 0. The inverse is
−1(x1,x2) =
( x2
β , x1 − 1 + α
β2 x2
2
)
. (67)
Thus
Pρ(x1,x2) = ρ(−1(x1,x2))|J −1|
= ρ
( x2
β , x1 − 1 + α
β2 x2
2
)
β−1. (68)
So Pρ(y) = EwPρ(y − Bw), and
(Pρ)2(y2) =
∫
R
dy1Ew 1
β ρ
( y2 − B2w
β , y1 − B1w
−1 + α
β2 (y2 − B2w)2
)
= 1
β Ewρ1
( y2 − B2w
β
)
.
If x1 is frozen, 2(x1,x2) = βx1 is a constant. Hence
H2\1(τ + 1) = 0, and
T1→2 = H2(τ + 1) − H2\1(τ + 1)
= −E
[
log 1
β Ewρ1
( y2 − B2w
β
)]
− 0
= log β − EwEx log ρ1
( y2 − B2w
β
)
= log β − EwEx log ρ1
(
x1 − B2w
β
)
= log β + F H1. (69)
Here F H1 is the functional H1 applied by a Gaussian filter.
One may understand it as H1 smeared out by a Gaussian filter.
It is less than H1, so the noise addition makes the system
lose some information, compared to T1→2 = log β + H1 in
the deterministic case.
VI. CONTINUOUS-TIME STOCHASTIC SYSTEMS
A. Derivation
Following what we have done in Sec. IV, we derive the
information flow within a continuous-time stochastic system
by taking the limit of the corresponding discrete stochastic
mapping. In doing this, the results in the preceding section are
ready for use. But, as noted, in the above derivation we have
assumed a constant matrix B, a simplified case allowing for
a clear expression of information flow. (This case does have
realistic relevance, though.) For a continuous-time system,
this assumption actually can be completely relaxed. In the
following we will see why.
Consider a system
dx = F(t; x)dt + B(t; x)dw, (70)
where x and F are n-dimensional vectors, B is an n × m matrix,
and w an m-vector of standard Wiener process. Note that B
can be a function of both x and time t. This above equation
may also be written as
dx
dt = F(t; x) + B(t; x) ˙w, (71)
052201-15
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
where ˙w a vector of white noise, or, in component form,
dx1
dt = F1(t; x) + B1(t; x) ˙w, (72)
dx2
dt = F2(t; x) + B2(t; x) ˙w, (73)
... ... (74)
dxn
dt = Fn(t; x) + Bn(t; x) ˙w. (75)
In the equations we have used Bi to indicate the ith row vector
of B. Now consider (70) on a small interval [t,t + t]. Euler-
Bernstein differencing,
x(t + t) = x(t) + Ft + Bw. (76)
This motivates the introduction of a transformation
 :
{y = x + F(x)t + B(x)w,
z = w. (77)
As shown in the discrete mapping case, generally this
transformation cannot be inverted. But for this special
case where t and w are small, the inversion can be done
asymptotically. In fact,
y = x + [F(y) + o(t)]t
+ [B(y)w + ∇(B(y)w)(x − y)] + o(w2)
= x + F(y)t + B(y)w
+ [∇(Bw)](−Ft − Bw) + o(t).
Note, here the higher order terms mean terms with order higher
than t or (w)2; we will see soon that E(w)2 = t. The
above expansion helps invert  to
−1 :
{x = y − Ft − Bz + ∇(Bz)(Bz) + o(t),
w = z. (78)
The following proposition finds the Jacobian associated
with the inverse transformation.
Proposition VI.1. Define the double dot of two dyadics A
and B as A : B = ∑
i,j aij bj i; then
J −1 = 1 − ∇ · Ft − ∇ · (Bz) + 1
2 ∇∇ : (BzzT BT ) + o(t).
(79)
Proof. By definition
J −1 =
[ ∂(x,w)
∂(y,z)
]
= det
[ ∂x
∂y
∂x
∂z
∂w
∂y
∂w
∂z
]
= det
[ ∂x
∂y −B + . . .
0 I
]
= det
( ∂x
∂y
)
. (80)
The key is the evaluation of det( ∂x
∂y ). By (78), it is, up to o(t), the determinant of
⎡
⎢
⎢
⎣
1 − ∂F1
∂y1 t − ∑
k
∂b1k
∂y1 zk + ∂
∂y1
( ∑
l,k,s
∂b1k
∂yl zkblszs) . . . − ∂F1
∂yn t − ∑
k
∂b1k
∂yn zk + ∂
∂yn
( ∑
l,k,s
∂b1k
∂yl zkblszs)
... . . . ...
− ∂Fn
∂y1 t − ∑
k
∂bnk
∂y1 zk + ∂
∂y1
( ∑
l,k,s
∂bnk
∂yl zkblszs) . . . 1 − ∂Fn
∂yn t − ∑
k
∂bnk
∂yn zk + ∂
∂yn
( ∑
l,k,s
∂bnk
∂yl zkblszs)
⎤
⎥
⎥
⎦. (81)
Recall that, for an n × n matrix A = (aij ),
det A = ∑
σ ∈Pn
sgn(σ )
n∏
i=1
ai,σi , (82)
where Pn is the totality of permutations of {1,2, . . . ,n}. By this formula, the terms of order t and w are easy to find; they can
only come from the diagonal entries. For terms of order (w)2, there are three sources:
(1) the last term at each diagonal entry, together with n − 1 1’s;
(2) multiplication of two entries at (i,i) and (j,j ), i = j , together with n − 2 1’s on the diagonal;
(3) similar to (2), but with entries at (i,j ) and (j,i), i = j .
In (3) the order between i and j switches and it has sgn = −1 for its permutation. Except for (3) involving off-diagonal
entries, all others are from the diagonal. So
det
( ∂x
∂y
)
=
n∏
i=1
[
1 − ∂Fi
∂yi t − ∑
k
∂bik
∂yi zk +
n∑
l=1
m∑
k,s=1
∂
∂yi
(
bls ∂bik
∂yl
)
zkzs
]
+ 1
2
∑
i,j
i =j
(−1)1
(
− ∑
k
∂bik
∂yj zk
)(
− ∑
s
∂bj s
∂yi zs
)
+ o(t).
052201-16
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
Notice the factor 1
2 in the last term. Because of the symmetry between i and j they repeat once when summed over i,j = 1,n.
Thus
det
( ∂x
∂y
)
= 1 − ∑
i
∂Fi
∂yi t − ∑
i
∑
k
∂bik
∂yi zk + 1
2
∑
i =j
∑
k
∂bik
∂yi zk
∑
s
∂bj s
∂yj zs + ∑
i,j
∑
k,s
∂
∂yi
(
bj s ∂bik
∂yj
)
zkzs
− 1
2
∑
i =j
∑
k
∂bik
∂yj zk
∑
s
∂bj s
∂yi zs + o(t).
Notice
∂ 2bikbj s
∂yi∂yj = ∂bik
∂yi
∂bj s
∂yj + bik ∂ 2bj s
∂yi∂yj + ∂bj s
∂yi
∂bik
∂yj + bj s ∂ 2bik
∂yi∂yj ,
and
∑
k,s
∑
i,j
∂b
∂yi j s
∂bik
∂yj zkzs = ∑
k,s
∑
i,j
∂bj s
∂yi
∂bik
∂yj zkzs + ∑
k,s
∑
i,j
bj s ∂ 2bik
∂yi∂yj zkzs
= 1
2
∑
k,s
∑
i =j
∂b[j s
∂yi
∂bik
∂yj zkzs + 1
2
∑
k,s
∑
i
∂bis
∂yi
∂bik
∂yi zkzs + 1
2
∑
k,s
∑
i,j
∂bj s
∂yi
∂bik
∂yj zkzs
+ 1
2
∑
k,s
∑
i,j
(
bj s ∂ 2bik
∂yi∂yj + bik ∂ 2bj s
∂yi∂yj
)
zkzs.
The last parenthesis holds because the two pairs (i,k) and (j,s) may be switched under the summation without changing the
result. Thence
det
( ∂x
∂y
)
= 1 − ∑
i
∂Fi
∂yi t − ∑
i
∑
k
∂bik
∂yi zk + 1
2
∑
i,j
∑
k,s
∂bik
∂yi
∂bj s
∂yj zkzs
+ 1
2
∑
i,j
∑
k,s
∂bj s
∂yi
∂bik
∂yj zkzs + 1
2
∑
i,j
∑
k,s
(
bj s ∂ 2bik
∂yi∂yj + bik ∂ 2bj s
∂yi∂yj
)
zkzs + o(t)
= 1 − ∑
i
∂Fi
∂yi t − ∑
i
∑
k
∂bik
∂yi zk + 1
2
∑
i,j
∂ 2 ∑
k,s bikzkzsbj s
∂yi∂yj + o(t)
= 1 − ∇ · Ft − ∇ · (Bz) + 1
2 ∇∇ : (BzzT BT ) + o(t),
which is J −1 by (80). 
With J −1, we can then evaluate the operator P and hence arrive at dH1
dt and dH1\2
dt .
Proposition VI.2. Let BBT ≡ G = (gij ). The time rate of change of H1 is
dH1
dt = −E
[
F1
∂ log ρ1
∂x1
]
− 1
2 E
[
g11
∂ 2 log ρ1
∂x2
1
]
. (83)
Proof. For any subset Sy ∈ Rn, Sz ∈ Rm,
∫
Sy ×Sz
ρyz(y,z)dydz =
∫
−1(Sy ×Sz)
ρxw(x,w)dxddelw =
∫
Sy ×Sz
ρxw(y − Ft − Bz + ∇(Bz) · (Bz), z) · |J −1|dydz
=
∫
Sy ×Sz
ρ(y − Ft − Bz + ∇(Bz) · (Bz))|J −1| · ρw(z)
because ρxw(a,b) = ρx(a) · ρw(b) = ρ(a) · ρw(b) due to the independence between x and w. Since Sy and Sz are arbitrarily
chosen, the integrand is the very joint pdf ρyz(y,z). Thus
Pρ(y) = ρy(y) =
∫
Rm
ρyz(y,z)dz =
∫
Rm
[ρ(y − Ft − Bz + ∇(Bz) · (Bz)) · |J −1|] · ρw(z)dz
= Ew{ρ(y − Ft − Bw + ∇(Bw) · (Bw)) · |J −1|}
= Ew
[
ρ(y) − ∇ρ · [Ft + Bw + ∇(Bw) · (Bw)] + 1
2 (Bw)(Bw)T : ∇∇ρ
]
052201-17
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
·
[
1 − ∇ · Ft − ∇ · (Bw) + 1
2 ∇∇ : (BwwT BT )
]
+ o(t)
= ρ(y) − (F · ∇ρ + ρ∇ · F)t + 1
2
{ρ∇∇ : (BBT ) + 2∇ρ · [∇ · (BBT )] + (BBT ) : (∇∇ρ)}t + o(t)
= ρ(y) − ∇ · (Fρ)t + 1
2 ∇∇ : (BBT ρ)t + o(t). (84)
Note here the fact
Ew = 0, EwwT = tI (85)
about Wiener process has been used. As a verification, one may obtain from this step
∂ρ
∂t = lim
t→0
Pρ(y) − ρ(y)
t = −∇ · (Fρ) + 1
2 ∇∇ : (BBT ρ), (86)
which is precisely the Fokker-Planck equation.
Denote BBT by G. Integrate both sides of the above equation with respect to (y2,y3, . . . ,yn) to obtain
(Pρ)1(y1) = ρ1(y1) − t
∫
Rn−1
∂F1ρ
∂y1
dy2 . . . dyn + t
2
∫
Rn−1
∂ 2g11ρ
∂y2
1
dy2 . . . dyn + o(t),
and hence
log(Pρ)1(y1) = log ρ1(y1) − t
ρ1
∫
Rn−1
∂F1ρ
∂y1
dy2 . . . dyn + t
2ρ1
∫
Rn−1
∂ 2g11ρ
∂y2
1
dy2 . . . dyn + o(t). (87)
So
H1(t + t) = −E log(Pρ)1(y1) = −E log ρ1(y1)
as the rest two terms vanish after applying the operator E(·) = ∫
R ρ1(·)dy1. Expanding y1 around x1, and denoting B1 ≡
(b11,b12, . . . ,b1n), we have
H1(t + t) = −E log ρ1(x1 + F1t + B1w)
= −E
[
log ρ1(x1) + ∂ log ρ1
∂x1
(F1t + B1w) + 1
2
∂ 2 log ρ1
∂x2
1
B1wwT BT
1
]
+ o(t)
= H1(t) − E
[
F1
∂ log ρ1
∂x1
]
t − 1
2 E
[
g11
∂ 2 log ρ1
∂x2
1
]
t + o(t).
Let t → 0 and we finally arrive at
dH1
dt = −E
[
F1
∂ log ρ1
∂x1
]
− 1
2 E
[
g11
∂ 2 log ρ1
∂x2
1
]
.

Now consider during the time interval [t,t + t] to freeze x2 as a parameter, and examine how the marginal entropy of x1
evolves. In this case we are actually considering a density ρ1\2, with ρ1\2(t) = ρ1(t) under an (n − 1)-dimensional transformation:
Rn−1 → Rn−1, x1\2 → y1\2:
y1 = x1(t + t) = x1(t) + F1t + B1w,
y3 = x3(t + t) = x3(t) + F3t + B3w,
. . .
yn = xn(t + t) = xn(t) + Fnt + Bnw.
With this system we have the following proposition.
Proposition VI.3. Let ρ\2 be
∫
R ρ(x)dx2; then
dH1\2
dt = −E
[
F1
∂ log ρ1
∂x1
]
− 1
2 E
[
g11
∂ 2 log ρ1
∂x2
1
]
+ E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
− 1
2 E
[ 1
ρ1
∫
Rn−2
∂ 2g11ρ\2
∂x2
1
dx3 . . . dxn
]
.
(88)
Proof. Following the same procedure as above, we arrive at an equation for log(P\2)1(y1) similar to (87):
log(P\2ρ)1(y1) = log ρ1\2(y1) − t
ρ1\2
∫
Rn−2
∂F1ρ\2
∂y1
dy3 . . . dyn + t
2ρ1\2
∫
Rn−2
∂ 2g11ρ\2
∂y2
1
dy3 . . . dyn + o(t).
052201-18
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
So
H1\2(t + t) = −E log(P\2ρ)1(y1) = −E log ρ1\2(y1) + E
[ 1
ρ1\2
∫
Rn−2
∂F1ρ\2
∂y1
dy3 . . . dyn
]
t
− 1
2 E
[ 1
ρ1\2
∫
Rn−2
∂ 2g11ρ\2
∂y2
1
dy3 . . . dyn
]
t + o(t).
Note at time t, ρ1\2 = ρ1, and in the last two terms y can be replaced by x with error going to higher order terms. Thus
H1\2(t + t) = −E
[
log ρ1(x1) + ∂ log ρ1
∂x1
(F1t + B1w) + 1
2
∂ 2 log ρ1
∂x2
1
B1wwT BT
1
]
+E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
t − 1
2 E
[ 1
ρ1
∫
Rn−2
∂ 2g11ρ\2
∂x2
1
dx3 . . . dxn
]
t + o(t)
= H1(t) − E
[
F1
∂ log ρ1
∂x1
]
t − 1
2 E
[
g11
∂ 2 log ρ1
∂x2
1
]
t + E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
t
− 1
2 E
[ 1
ρ1
∫
Rn−2
∂ 2g11ρ\2
∂x2
1
dx3 . . . dxn
]
t + o(t).
Take the limit
dH1\2
dt = lim
t→0
H1\2(t + t) − H1(t)
t
and we arrive at the conclusion. 
Theorem VI.1.
T2→1 = −E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
+ 1
2 E
[ 1
ρ1
∫
Rn−2
∂ 2g11ρ\2
∂x2
1
dx3 . . . dxn
]
(89)
= −
∫
Rn
ρ2|1(x2|x1)
∂F1ρ\2
∂x1
dx
+ 1
2
∫
Rn
ρ2|1(x2|x1)
∂ 2g11ρ\2
∂x2
1
dx. (90)
Proof. Subtract (88) from (83) and the conclusion
follows. 
B. Properties
Theorem VI.2. For a 2D system
dH1\2
dt = E
( ∂F1
∂x1
)
(91)
in the absence of stochasticity.
Remark. This recovers the heuristic argument by Liang and
Kleeman in [46]; see Eq. (5).
Proof. In this case g11 = 0, ρ\2 = ρ1, so
dH1\2
dt = −E
[
F1
∂ log ρ1
∂x1
]
+ E
[ 1
ρ1
∂F1ρ1
∂x1
]
= E
[ ρ1
ρ1
∂F1
∂x1
+ F1
∂ log ρ1
∂x1
− F1
∂ log ρ1
∂x1
]
= E
( ∂F1
∂x1
)
.

Theorem VI.3. If g11 = ∑m
k=1 b1kb1k is independent of x2,
the resulting T2→1 has a form the same as its deterministic
counterpart.
Proof. If g11 is independent of x2, so is
∫ ∂ 2g11ρ\2
∂x2
1
dx3 . . . dxn.
Hence the integration can be simplified:
∫
Rn
ρ2|1
∂ 2g11ρ\2
∂x2
1
dx
=
∫
Rn−1
(∫
R
ρ12
ρ1
dx2
) ∂ 2g11ρ\2
∂x2
1
dx1dx3 . . . dxn
=
∫
Rn−1
∂ 2g11ρ\2
∂x2
1
dx1dx3 . . . dxn = 0.

Theorem VI.4 (principle of nil causality). If both F1 and g11
are independent of x2, then T2→1 = 0.
Proof. As proved above, when g11 has no dependence on x2,
the last term of T2→1 becomes zero. If, moreover, F1 does not
depend on x2, then ∂F1ρ\2
∂x1 does not, either. So the integration
with respect to x2 can be taken inside directly to ρ12/ρ1 =
ρ2|1(x2|x1):
T2→1 = −
∫
R
dx1
∫
R
ρ2|1(x2|x1)dx2
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
=
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn = 0.

C. Application: A stochastic gradient system
We are about to study the information flow within a system
which has a drift function in the gradient form. We particularly
want to understand how stochastic perturbation may exert
052201-19
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
influence on the flow. The gradient systems are chosen because
their corresponding Fokker-Planck equations admit explicit
equilibrium solutions, i.e., solutions of the Boltzmann type.
To see this, let
F = −∇V , (92)
where V = V (x) is the potential function. For simplicity,
suppose that the stochastic perturbation amplitude B = bI
where I is the identity matrix and b = constant. Hence
G = BBT = gI, and g = b2 is a constant. It is trivial to verify
that
ρ = 1
Z e−2V /g, (93)
where Z is the normalizer (or partition function as is called in
statistical physics), solves
∇ · (ρF) = 1
2 g∇2ρ,
the equilibrium density equation for the system
dx = −∇V dt + bIdw. (94)
As an example, consider the potential function
V = 1
2
(x2
1 x2
2 + x2
2 x2
3 + x2
1 + x2
2 + x2
3
). (95)
This system, though simple, results in a compactly supported
density function, while allowing for asymmetric nonlinear
interactions among x1, x2, and x3. The resulting vector field is
F1 = −x1x2
2 − x1,
F2 = −x2x2
3 − x2x2
1 − x2,
F3 = −x3x2
2 − x3.
Obviously, T3→1 = T1→3 = 0 by the principle of nil causality.
The general flow from xj to xi is
Tj →i = −
∫
R3
ρj |i(xj |xi) ∂Fiρ\j
∂xi dx
= −
∫
R3
ρj |i
(
Fi ∂ρ\j
∂xi + ρ\j
∂Fi
∂xi
)
= −
∫
R3
ρj |i
(
Fi
∫
R
2
g ρFidxj + ρ\j
∂Fi
∂xi
)
dx. (96)
The computation seems to be easy, but by no means trivial.
The difficulty comes from the evaluation of the conditional
density ρj |i(xj |xi). Theoretically this is not a problem, but in
realizing the computation we have to consider the problem
on a limited domain, which may not effectively cover the
support of the density function. Here we choose a domain
0
0.05
0.1
T2→1
(a)
0
0.05
0.1
T1→2
(b)
0
0.05
0.1
T3→2
(c)
0
0.05
0.1
T2→3
(d)
0.4 0.6 0.8 1
0
0.05
0.1
T3→1
b
(e)
0.4 0.6 0.8 1
0
0.05
0.1
T1→3
b
(f)
FIG. 9. Information flow within a gradient system with the potential function (95).
052201-20
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
[−5,5] × [−5,5] × [−5,5], and a spacing size x = 0.05.
The computation is implemented henceforth.
To test how the stochastic perturbation may affect the
information flow, tune b to see the response. The tuning range is
rather limited, though, with the present computational domain.
Shown in Fig. 9 are the results. As expected, T3→1 and T1→3 are
identically zero. For others, the flow rates generally increase
with b. That is to say, they tend to increase the uncertainty
of their corresponding target components. This makes sense,
since g functions like temperature in thermodynamics, and
increase in T surely will lead to increase in uncertainty. If
examining more carefully, one finds that the increase is actually
not symmetric. Those going to x2 (T3→2 and T1→2) are faster
than those leaving x2 (T2→1 and T2→3), reflecting the property
of asymmetry of information flow.
Since ρ can be accurately obtained, this example can be
utilized to validate our numerical computations for more
general cases.
VII. LINEAR STOCHASTIC SYSTEMS
As always, it would be of interest to look at the particular
case, namely, the case with linear systems:
dx = Axdt + Bdw, (97)
where A and B are constant matrices. If originally x is normally
distributed, then it is normal/Gaussian forever. Let its mean
vector be μ and its covariance matrix be . Then
dμ
dt = Aμ, (98)
d
dt = A + AT + BBT . (99)
In component form μ = (μ1, . . . ,μn)T ,  = (σij )n×n, and
BBT has been denoted by G in the above. The distribution
is, therefore,
ρ = 1
√(2π)n det  e− 1
2 (x−μ)T −1(x−μ).
We need to find
ρ1,ρ12,ρ\2,
and the following facts will help.
Fact 1: ρ\2 is a multivariate Gaussian N(μ\2,\2) where
μ\2 = (μ1,μ3,μ4, . . . ,μn)n, and \2 is the covariance matrix
of (x1,x3,x4, . . . ,xn)n.
Fact 2: The conditional probability density function ρ2|1 is
ρ2|1(x2|x1) ∝ e− σ11
212 [x2−μ2− σ12
σ11 (x1−μ1)]2
, (100)
in other words,
x2|x1 ∼ N
(
μ2 + σ12
σ11
(x1 − μ1), 12
σ11
)
. (101)
In the above equations, we have used, and will be using, ij
to shorten det [σii σij
σij σjj ].
We now compute the information flow T2→1. Since B
is constant (hence independent of x1), the stochastic term
vanishes by Theorem VI.3. So we need only consider its
deterministic part:
T2→1= − E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
]
= −
∫
Rn
ρ2|1(x2|x1)
∂F1ρ\2
∂x1
dx.
As a starting point, let us consider the case n = 3. By the
proposition above,
ρ\2 = ρ13
= 1
√(2π)213
e− 1
13 [σ33(x1−μ1)2+σ11(x3−μ3)2−2σ13(x1−μ1)(x3−μ3)]
.
So ∫
R
∂F1ρ\2
∂x1
dx3
=
∫
R
ρ13{a11 + [σ13(x3 − μ3)
−σ33(x1 − μ1)](a11x1 + a12x2 + a13x3)/13}dx3
= a11ρ1 − σ13μ3 + σ33(x1 − μ1)(a11x1 + a12x2)
13
ρ1
+ 1
13
∫
R
ρ13
{a13σ13x2
3 + (a11x1 + a12x2)σ13x3
−[σ13μ3 + σ33(x1 − μ1)]a13x3
}dx3.
We need to find ∫
R x3ρ13dx3 and
∫
R x2
3 ρ13dx3. Since (x1,x3)
is a bivariate Gaussian,
x3|x1 ∼ N
(
μ3 + σ13
σ11
(x1 − μ1), 13
σ11
)
,
we thence have
∫
R
ρ13x3dx3 = ρ1
∫
R
ρ3|1x3dx3 = ρ1
(
μ3 + σ13
σ11
(x1 − μ1)
)
,
∫
R
ρ13x2
3 dx3 = ρ1
∫
R
ρ3|1x2
3 dx3
= ρ1
[
13
σ11
+
(
μ3 + σ13
σ11
(x1 − μ1)
)2]
.
Substituting back, we obtain
∫
R
∂F1ρ\2
∂x1
dx3
= a11ρ1 − σ13μ3 + σ33(x1 − μ1)(a11x1 + a12x2)
13
ρ1
+a13σ13
(
13
σ11
+
[
μ3 + σ13
σ11
(x1 − μ1)
]2)
ρ1
13
+{(a11x1 + a12x2)σ13 − [σ13μ3 + σ33(x1 − μ1)]a13}
×
[
μ3 + σ13
σ11
(x1 − μ1)
] ρ1
13
.
Thus
T2→1 = −E 1
ρ1
∂F1ρ13
∂x1
dx3
= −a11 − 1
13
{
−σ13μ3a11μ1 − σ13μ3a12μ2
−a11σ33σ11 − a12σ33σ12
052201-21
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
+a13σ13
13
σ11
+ a13σ13
[μ2
3 + (σ 2
13/σ 2
11
)σ11
]
+a11σ13μ3μ1
+a12μ3σ13μ2 − a13σ13μ2
3 − 0 + (a11σ 2
13/σ11
)σ11
+(a12σ 2
13/σ11
)σ12 − 0 − (a13σ33σ13/σ11)σ11
}
= a12
σ12
σ11
.
Here so many terms are canceled out, and the result turns out
to be precisely the same as that for the 2D case we have derived
before ever since Liang and Kleeman [46] in 2005.
The above remarkably concise formula actually holds for
systems of arbitrary dimensionality. This makes the following
theorem:
Theorem VII.1. If an n-dimensional (n  2) vector of
random variables (x1, . . . ,xn)T evolves subject to the linear
system
dx = Axdt + Bdw,
where A = (aij ) and B are constant matrices, and if its
covariance matrix is (σij ), then the information flow from xj
to xi is
Tj →i = aij σij
σii , (102)
for any i,j = 1, . . . ,n, i = j .
Proof. It suffices to prove the case (i,j ) = (1,2); if not,
we may always reorder the components to make them so. We
prove by induction. The 3D case has just been shown above.
Now suppose (102) holds for n-dimensional systems. Consider
an n+1-dimensional system
dx1
dt =
n∑
j =1
a1j xj + a1,n+1xn+1
... ...
dx2
dt =
n∑
j =1
anj xj + an,n+1xn+1
dxn+1
dt =
n∑
j =1
an+1,j xj + an+1,n+1xn+1.
To distinguish, we now use ρn to denote the joint density for
the n-dimensional system. The information flow from x2 to
x1 is
T2→1 = −
∫
Rn+1
ρ2|1(x2|x1)
∂F1ρ\2
∂x1
dx
=
∫
Rn+1
ρ2|1
∂
∂x1
⎡
⎣
⎛
⎝
n∑
j =1
a1j xj
⎞
⎠ρ\2 + (a1,n+1xn+1)ρ\2
⎤
⎦dx
=
∫
Rn
ρ2|1
∂
∂x1
⎛
⎝
n∑
j =1
a1j xj ρn
\2
⎞
⎠
+
∫
Rn+1
ρ2|1
∂
∂x1
(a1,n+1xn+1ρ\2)dx.
Note the first term results from integration with respect xn+1,
since all the variables except ρ\2 are independent of xn+1.
This is precisely the information flow from x2 to x1 for an
n-dimensional system; by our assumption it is a12σ12/σ11.
For the second term, note that all variables, except ρ2|1, are
independent of x2, so we may take the integral with respect
to x2 directly inside with ρ2|1. But
∫
R ρ2|1dx2 = 1, so the
second term results in the integral of ∂
∂x1 (a1,n+1xn+1ρ\2) which
vanishes by the compactness of ρ. Therefore (102) holds for
n+1-dimensional systems. By induction, it holds for systems
of arbitrary dimensionality. 
Let us see an example: A =
[ 1 −2 0
1 0 −5
−1 2 −1
]
, and B =
[1 0 0
0 2 0
0 0 3
]
. In component form, the equation is
dx1
dt = x1 − 2x2 + 0x3 + ˙w1, (103)
dx2
dt = x1 + 0x2 − 5x3 + 2 ˙w2, (104)
dx3
dt = −x1 + 2x2 − x3 + 3 ˙w3. (105)
The evolution of the covariance matrix C is governed by
dC
dt = AC + CAT + BBT . (106)
Let it be initialized by
[1 0 0
0 4 0
0 0 9
]
. The solution is shown in
Fig. 10.
The rates of information flow are subsequently obtained and
plotted in Fig. 11. Among them, T3→1 = 0, just as expected by
the principle of nil causality. T3→2 and T2→3 oscillate around
a value near zero, and T2→1 oscillates around −0.9. The
remaining transfers, T1→2 and T1→3, albeit still oscillatory,
approximately approach two constant values. The former
approaches 0.16, while the latter approaches 1.
In applied sciences, it has been a common practice to infer
causality via analyzing correlation, coherence, etc. However,
there has also been a long-time debate about whether this
makes sense. Though it has been generally agreed, based
on philosophical and/or physical arguments, that correlation
is not equivalent to causation, a clear-cut statement about
their relation is yet to be found. Here, Theorem VII.1 says
that, in the linear sense, the relation can be analytically
expressed. Specifically, σij = 0 implies Tj →i = 0, but the
converse is not true due to the existence of another term
aij . That is to say, two uncorrelated events do not have a
causality in between, but not vice versa. Contrapositively,
this means that causation implies correlation, but correlation
does not imply causation. Although this holds only in the
linear limit, the implication is far-reaching, considering that
when “correlation” is mentioned, we usually talk about “linear
correlation” characterized by Pearson’s population correlation
coefficient r = σij
√σii σjj .
VIII. CONCLUSIONS AND DISCUSSION
Information flow, or information transfer as it may appear
in the literature, is a fundamental notion in general physics
052201-22
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
0.5
1
1.5
2
2.5
x 105 (a)
σ11
0
2
4
6
8
10
12
14
x 104 (b)
σ12
−2.5
−2
−1.5
−1
−0.5
0 x 105 (c)
σ13
10 20 30 40 50
1
2
3
4
5
6
7
x 105 (d)
σ22
t
10 20 30 40 50
−2
0
2
4
x 104 (e)
σ23
t
10 20 30 40 50
0.5
1
1.5
2
2.5
x 105 (f)
σ33
t
FIG. 10. Covariance evolution with the linear system (103)–(105).
which has wide applications in different disciplines. In this
study we have shown that, within the framework of dynamical
systems, it can be rigorously derived from first principles.
That is to say, it is a notion ab initio, quite different from
the existing axiomatic postulates or empirical proposals. In
this light we have studied the information flow for both
time-discrete and time-continuous differentiable vector fields
in both deterministic and stochastic settings. In a nutshell, the
results can be summarized as follows.
Consider an n-dimensional state variable x =
(x1,x2, . . . ,xn), the corresponding probability density
function (pdf) being ρ(x1,x2, . . . ,xn), and the marginal pdf of
xi being ρi. For a deterministic mapping  : Rn → Rn,
x(τ )  → x(τ + 1) = (1(x),2(x), . . . ,n(x)),
the rate of information flowing from x2 to x1 proves to be
T2→1 = E log(P\2ρ)1(1(x)) − E log(Pρ)1(1(x)),
where E is the mathematical expectation with respect to x, P
the Frobenius-Perron operator of , and P\2 the same operator
of  but with x2 frozen as a parameter [so (P\2)1(x1) has no
dependence on x2]. The units are in nats per unit time; the
same below. If the system is continuous in time, i.e.,
dx
dt = F(x,t),
then
T2→1 = −
∫
Rn
ρ2|1
∂ρ\2F1
∂x1
dx
= −E
[ 1
ρ1
∫
Rn−2
∂ρ\2F1
∂x1
dx3 . . . dxn
]
,
where ρ\2 = ∫
R ρ(x1,x2, . . . ,xn)dx2, and ρ2|1 is the conditional
pdf of x2 on x1. When stochasticity comes in, in the discrete
mapping case,
x(τ + 1) = (x(τ )) + B(x)w,
where  : Rn → Rn is an n-dimensional mapping, B an n ×
m constant matrix, and w an m-dimensional standard Wiener
process, then
T2→1 = Ex[log Ew(P\2ρ)1(y1 − B1w)]
−Ex[log Ew(Pρ)1(y1 − B1w)],
with B1 = (b11,b12, . . . ,b1m) a row vector of the matrix B.
Here we use Ex and Ew to indicate that the expectation is taken
052201-23
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
−2
−1
0
1
2
T2→1
(a)
−2
−1
0
1
2
T1→2
(b)
−2
−1
0
1
2
T1→3
(c)
0 20 40
−2
−1
0
1
2
T2→3
t
(d)
0 20 40
−2
−1
0
1
2
T3→2
t
(e)
0 20 40
−2
−1
0
1
2
T3→1
t
(f)
FIG. 11. As Fig. 10, but for rates of information flow.
with respect to x and w, respectively. If what we consider is a
continuous-time stochastic system, i.e., a system as
dx = F(x,t)dt + Bdw,
or alternatively written as
dx
dt = F(x,t) + B ˙w,
where ˙w is the white noise (B need not be constant), then the
result can be explicitly evaluated:
T2→1 = −E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
+ 1
2 E
[ 1
ρ1
∫
Rn−2
∂ 2g11ρ\2
∂x2
1
dx3 . . . dxn
]
(107)
= −
∫
Rn
ρ2|1(x2|x1)
∂F1ρ\2
∂x1
dx
+ 1
2
∫
Rn
ρ2|1(x2|x1)
∂ 2g11ρ\2
∂x2
1
dx, (108)
where g11 = ∑m
j =1 b1j b1j . Note the first term is just from the
deterministic vector field, while the second the contribution
from the noise. It has been proved that, if b1j has no dependence
on x2, then the stochastic contribution vanishes, making the
information flow the same in form as that from its deterministic
counterpart. We have particularly examined the case F = Ax,
i.e., the case when the system is linear and autonomous,
dx = Axdt + Bdw
with A = (aij )n×n and B = (bij )n×m being constant matrices;
then the information flow from xj to xi is remarkably simple:
Tj →i = aij σij
σii ,
for any (i,j ), 1  i,j  n, i = j . This result is precisely the
same in form as what Liang and Kleeman obtained in 2005 for
2D deterministic systems based on intuitive arguments [46].
The above results have been put to applications with a va-
riety of benchmark systems. Particularly we have reexamined
the baker transformation, H´enon map, and truncated Burgers-
Hopf system. The results are qualitatively similar to what we
have obtained before using an approximate formalism, but
with magnitudes significantly smaller. Also shown are the
information flows within a Kaplan-Yorke map, a noisy H´enon
map, a R¨ossler system, and a stochastic gradient flow. We look
forward to more applications in the near future.
Historically it has been a long-time endeavor to relate
information flow to causality. We want specifically to have that,
if Tj →i = 0, then xj causes xi; otherwise xj is not causal. With
052201-24
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
0 0.2 0.4 0.6 0.8 1
0
0.05
0.1
α
Transfer Entropy TEx→ y: solid
TEy→ x: dashed
FIG. 12. The transfer entropy (TE) (in nats) between the compo-
nents of the anticipatory system (109) and (110) as a function of α
(a reproduction of the Fig. 1a of [44]). Ideally TEy→x (dashed line)
should be zero, but it is not. With our formalism, Ty→x is always zero,
as guaranteed by the principle of nil causality, i.e., Theorem III.4.
the existing empirical/half-empirical measures for information
flow, such as the widely used transfer entropy (denoted as
TE), the endeavor has been fruitful for some problems but
unsuccessful for others (e.g., [45]), and the inconsistency
has even led people to doubt about the association between
information flow and causality (e.g., [39]). An excellent
example is the anticipatory system introduced by Hahs and
Pethel [44]:
xn+1 = f (xn), (109)
yn+1 = 0.7f (yn) + 0.3[(1 − α)f (xn) + αf (f (xn))], (110)
where f (x) = 4x(1 − x) is the chaotic logistic map. Obvi-
ously xn is the drive and yn the response. If transfer entropy
were a faithful measure of information flow/transfer, then
ideally we would have TEy→x = 0. However, as shown in
Fig. 12, this is not the case. Moreover, as the parameter α
(called “anticipation” in [44]) increases from 0 to 1, TEy→x
(dashed line) even exceeds TEx→y (solid line).
The above example, among others [45], is a disaster
to transfer entropy analysis and the like such as Granger
causality test. In contrast, this is not at all a problem with
our rigorous formalism. By Theorem III.4, Ty→x ≡ 0, which
gives the precise result just as expected. This reflects how
our formalism differs fundamentally from transfer entropy
and other formalisms of the like: For any dynamical system,
the implied causality, the touchstone one-way causality in
particular, is a proved fact as stated in various theorems,
rather than something to be verified in applications. More
specifically, when the evolution of xi does not depend on
xj , then Tj →i = 0. This is particularly clear in the above
linear case; the dependence of xi on xj is from the entry
aij of A, so when it is zero, then xj is not causal to xi.
This result also quantitatively, and unambiguously, tells us that
causation implies correlation, but not vice versa, resolving the
long-standing debate over correlation versus causation.
The derivation of information flow is based on the time rate
of change of entropy. One naturally wonders what it would be
if the system is stationary, since in that case the entropy change
vanishes. This is actually not a problem, considering that an
information flow rate T2→1 can be negative as well as positive;
a negative T2→1 means that x2 acts to reduce the marginal
entropy of x1, i.e., H1. In the decomposition (3), for example,
it is very possible that dH ∗
1 /dt and T2→1 cancel out to make a
zero dH1/dt. But this does make an issue in normalizing the
obtained information flow; a detailed study can be found in
[59]. In some sense, that an information flow rate can be both
positive and negative makes a point in which our formalism
differs from transfer entropy, though in inferring causality only
the magnitude (absolute value) is needed.
In our previous formalism for 2D systems, we have shown
that the information flow rates actually can be estimated
from time series through maximum likelihood estimation.
Specifically, it has been established that [60], for two time
series x1 and x2, under the assumption of a linear model, the
maximum likelihood estimator of the information flow rate
from x2 to x1 is
ˆT2→1 = C11C12C2,d1 − C2
12C1,d1
C2
11C22 − C11C2
12
, (111)
where C = (Cij ) is the sample covariance matrix between
time series x1 and x2, and Ci,dj the sample covariance
between xi and a series derived from xj using the Euler
forward differencing scheme: ˙xj,n = (xj,n+1 − xj,n)/t [or
˙xj,n = (xj,n+2 − xj,n)/2t in some special cases, where t
is the time step size]. This remarkably concise formula
has been successfully applied to many real world problems,
such as the relation between CO2 and global warming [61],
financial economics [59], etc. And, even though it is under an
assumption of linearity, it proves to be very successful [60] in
the highly chaotic anticipatory system problem as shown above
in Fig. 12. We are therefore working on the estimation of the
information flows from time series for systems of arbitrary
dimensionality.
ACKNOWLEDGMENTS
This study was partially supported by the 2015 Jiangsu Pro-
gram for Innovation Research and Entrepreneurship Groups,
by the Jiangsu Chair Professorship Program, and by the
National Program on Global Change and Air-Sea Interaction
(GASI-IPOVAI-06).
APPENDIX: AN ALTERNATIVE PROOF
OF THEOREM IV.1
For the continuous system
dx
dt = F(x,t), (A1)
consider an interval [t,t + t], and a mapping
 : Rn → Rn, x(t)  → x(t + t) = x(t) + Ft.
Recall that by definition Eψ(x(t + t)) = ∫ ψ(x)ρ(x,t +
t)dx, for any test function ψ, and
Eψ(x(t + t)) = Eψ(x(t) + Ft + o(t))
= E[ψ(x(t)) + ∇ψ · Ft + o(t)].
Note the expectation on the left hand side is with respect to
ρ(t + t), and that on the right is with respect to ρ(t). This
way we obtain the Liouville equation.
052201-25
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
Now let ψ be the functional log(P\2ρ)1. When x2 is frozen,
on interval [t,t + t], there is a Liouville equation
∂ρ\2
∂t + ∂F1ρ\2
∂x1
+ ∂F3ρ\2
∂x3
+ . . . + ∂Fnρ\2
∂xn = 0 (A2)
for ρ\2 the joint density of (x1,x3, . . . ,xn). The equation for its
marginal density ρ1\2 = ∫
Rn−2 ρ\2dx3 . . . dxn is, after integra-
tion with respect to (x3,x4, . . . ,xn) and with the consideration
of the compact support assumption,
∂ρ1\2
∂t + ∂
∂x1
∫
Rn−2
F1ρ\2dx3 . . . dxn = 0.
Divided by ρ1\2, this yields
∂ log ρ1\2
∂t +
∫
Rn−2
1
ρ1\2
∂F1ρ\2
∂x1
dx3 . . . dxn = 0.
Discretizing, and noticing the fact ρ1\2(t) = ρ1(t),
log ρ1\2(t + t; x1)
= log ρ1(t; x1) − t
∫
Rn−2
1
ρ1\2
∂F1ρ\2
∂x1
dx3 . . . dxn + o(t),
which is log(P\2ρ)1(x1). As conventional, let x(t + t) ≡ y
and leave x for x(t) to avoid confusion. We actually need to
find
log(P\2ρ)1(y1) = log ρ1\2(t + t; y1)
= log ρ1(t; x(t + t))
−t
∫
Rn−2
1
ρ1\2
∂F1ρ\2
∂x1
dx3 . . . dxn + o(t)
= log ρ1(t; x) + ∂ log ρ1
∂x1
F1t
−t
∫
Rn−2
1
ρ1\2
∂F1ρ\2
∂x1
dx3 . . . dxn + o(t).
Taking expectation and multiplying by (−1) on both sides, we
obtain
H1\2(t + t) = H1(t) − tE
(
F1
∂ log ρ1
∂x1
)
+tE
∫
Rn−2
1
ρ1
∂F1ρ\2
∂x1
dx3 . . . dxn.
So
dH1\2
dt = lim
t→0
H1\2(t + t) − H1(t)
t
= E
∫
Rn−2
1
ρ1
∂F1ρ\2
∂x1
dx3 . . . dxn − E
(
F1
∂ log ρ1
∂x1
)
.
On the other hand, from the Liouville equation it is easy to
obtain
dH1
dt =
∫
Rn
log ρ1
∂F1ρ
∂x1
dx. (A3)
Hence
T2→1 = dH1
dt − dH1\2
dt
=
∫
Rn
log ρ1
∂F1ρ
∂x1
dx − E
∫
Rn−2
1
ρ1
∂F1ρ\2
∂x1
dx3 . . . dxn
+E
(
F1
∂ log ρ1
∂x1
)
= −E
[ 1
ρ1
∫
Rn−2
∂F1ρ\2
∂x1
dx3 . . . dxn
]
, (A4)
which is the same as (48) in Theorem IV.1.
[1] K. Hlavackova-Schindler, M. Palus, M. Vejmelka, and J.
Bhattacharya, Causality detection based on information-
theoretic approaches in time series analysis, Phys. Rep. 441, 1
(2007).
[2] J. Pearl, Causality: Models, Reasoning, and
Inference (Cambridge University Press, Cambridge,
2000).
[3] P. Sprites, C. Glymour, and R. Scheines, Causation, Prediction,
and Search (MIT Press, Cambridge, 2001).
[4] B. P. Bezruchko and D. A. Smirnov, Extracting Knowledge from
Time Series: An Introduction to Nonlinear Empirical Modeling
(Springer, Berlin, 2010).
[5] T. Schreiber, Measuring Information Transfer, Phys. Rev. Lett.
85, 461 (2000).
[6] X. S. Liang, Uncertainty generation in deterministic fluid flows,
Dyn. Atmos. Oceans 52, 51 (2011).
[7] R. Kleeman, Information flow in ensemble weather prediction,
J. Atmos. Sci. 64, 1005 (2007).
[8] T. Schneider, and S. M. Griffes, A conceptual framework for
predictability studies, J. Clim. 12, 3133 (1999).
[9] X. S. Liang, Local predictability and information flow in
complex dynamical systems, Physica D 248, 1 (2013).
[10] E. Pereda, R. Quian Quiroga, and J. Bhattacharya, Nonlinear
multivariate analysis of neurophysiological signals, Progr. Neu-
robiol. 77, 1 (2005).
[11] K. J. Friston, L. Harrison, and W. Penny, Dynamic causal
modeling, NeuroImage 19, 1273 (2003).
[12] B. Schelter, M. Winterhalder, M. Eichler, M. Peifer, B. Hellwig,
B. Guschlbauer, C. Leucking, R. Dahlhaus, and J. Timmer,
Testing for directed influences among neural signals using
partial directed coherence, J. Neurosci. Methods 152, 210
(2006).
[13] M. Staniek and K. Lehnertz, Symbolic Transfer Entropy, Phys.
Rev. Lett. 100, 158101 (2008).
[14] R. G. Andrzejak and T. Kreuz, Characterizing unidirectional
couplings between point processes and flows, Europhys. Lett.
96, 50012 (2011).
[15] S. Stramaglia, G. R. Wu, M. Pellicoro, and D. Marinazzo,
Expanding the transfer entropy to identify information circuits
in complex systems, Phys. Rev. E 86, 066211 (2012).
052201-26
INFORMATION FLOW AND CAUSALITY AS RIGOROUS . . . PHYSICAL REVIEW E 94, 052201 (2016)
[16] J. Wu, X. Liu, and J. Feng, Detecting causality be-
tween different frequencies, J. Neurosci. Methods 167, 367
(2008).
[17] R. Marschinski and H. Kantz, Analysing the information flow
between financial time series: An improved estimator for transfer
entropy, Eur. Phys. J. B 30, 275 (2002).
[18] S. S. Lee, Jumps and information flow in financial markets, Rev.
Financ. Stud. 25, 439 (2012).
[19] W. Wang, B. T. Anderson, R. K. Kaufmann, and R. B.
Myneni, The relation between the North Atlantic Oscillation
and SSTs in the North Atlantic basin, J. Climate 17, 4752
(2004).
[20] J. Runge, J. Heitzig, N. Marwan, and J. Kurths, Quantifying
causal coupling strength: A lag-specific measure for multivariate
time series related to transfer entropy, Phys. Rev. E 86, 061121
(2012).
[21] G. Tissot, A. Lozano-Dur´an, L. Cordier, J. Jim´enez, and B. R.
Noack, Granger causality in wall-bounded turbulence, J. Phys.:
Conf. Ser. 506, 1 (2014).
[22] X. S. Liang and A. Lozano-Dur´an, A preliminary study
of the causal structure in fully developed near-wall tur-
bulence, in Proceedings of the Summer Program 2016,
(Center for Turbulence Research, Stanford University, CA,
in press).
[23] R. Sun, A neural network model of causality, IEEE Transactions
on Neural Networks 5, 604 (1994).
[24] N. Ay and D. Polani, Information flows in causal networks, Adv.
Complex Syst. 11, 17 (2008).
[25] L. Sommerlade, M. Eichler, M. Jachan, K. Henschel, J. Timmer,
and B. Schelter, Estimating causal dependencies in networks
of nonlinear stochastic dynamical systems, Phys. Rev. E 80,
051128 (2009).
[26] M. Timme and J. Casadiego, Revealing networks from dy-
namics: An introduction, J. Phys. A: Math. Theor. 47, 343001
(2014).
[27] A. S. Pikovsky, M. G. Rosenblum, and J. Kurths, Synchroniza-
tion: A Universal Concept in Nonlinear Sciences (Cambridge
University Press, Cambridge, 2001).
[28] K. Lehnertz, S. Bialonski, M.-T. Horstmann, D. Krug, A.
Rothkegel, M. Staniek, and T. Wagner, Synchronization phe-
nomena in human epileptic brain networks, J. Neurosci. Methods
183, 42 (2009).
[29] S. Boccaletti, J. Kurths, G. Osipov, D. Valladares, and C. Zhou,
The synchronization of chaotic systems, Phys. Rep. 366, 1
(2002).
[30] E. Mosekilde, Yu. Maistrenko, and D. Postnov, Chaotic Syn-
chronization: Applications to Living Systems (World Scientific,
Singapore, 2002).
[31] G. V. Osipov, J. Kurths, and C. Zhou, Synchronization in
Oscillatory Networks (Springer, Berlin, 2007).
[32] A. Balanov, N. Janson, D. Postnov, and O. Sosnovtseva,
Syncrhonization: From Simple to Complex (Springer, Berlin,
2008).
[33] N. J. Corron and S. D. Pethel, Information flow in synchroniza-
tion, in IEEE International Conference on Systems, Man and
Cybernetics, Vol. 4 (IEEE, 2005), p. 3546.
[34] C. Granger, Investigating causal relations by econometric
models and cross-spectral methods, Econometrica 37, 424
(1969).
[35] L. Barnett, A. B. Barrett, and A. K. Seth, Granger Causality and
Transfer Entropy Are Equivalent for Gaussian Variables, Phys.
Rev. Lett. 103, 238701 (2009).
[36] J. A. Vastano and H. L. Swinney, Information Transport in
Spatiotemporal Systems, Phys. Rev. Lett. 60, 1773 (1988).
[37] J. Sun and E. Bolt, Causation entropy identifies indirect
influences, dominance of neighbors, and anticipatory couplings,
Physica D 267, 49 (2014).
[38] P. Duan, F. Yang, T. Chen, and S. L. Shah, Direct causality
detection via the transfer entropy approach, IEEE Trans. Control
Systems Tech. 21, 2052 (2013).
[39] J. T. Lizier and M. Prokopenko, Differentiating information
transfer and causal effect, Eur. Phys. J. B 73, 605 (2010).
[40] C. W. J. Granger, Testing for causality: A personal viewpoint, J.
Econ. Dyn. Control 2, 329 (1980).
[41] C. A. Sims, Discrete approximations to continuous time
distributed lags in econometrics, Econometrica 39, 545
(1971).
[42] D. A. Smirnov and B. P. Bezruchko, Spurious causalities
due to low temporal resolution: Towards detection of direc-
tional coupling from time series, Europhys. Lett. 100, 10005
(2012).
[43] H. Nalatore, M. Ding, and G. Rangarajan, Mitigating the effects
of measurement noise on Granger causality, Phys. Rev. E 75,
031123 (2007).
[44] D. W. Hahs and S. D. Pethel, Distinguishing Anticipation from
Causality: Anticipatory Bias in the Estimation of Information
Flow, Phys. Rev. Lett. 107, 128701 (2011).
[45] D. A. Smirnov, Spurious causalities with transfer entropy, Phys.
Rev. E 87, 042917 (2013).
[46] X. S. Liang and R. Kleeman, Information Transfer between
Dynamical System Components, Phys. Rev. Lett. 95, 244101
(2005).
[47] X. S. Liang, The Liang-Kleeman information flow: Theory and
application, Entropy 15, 327 (2013).
[48] X. S. Liang and R. Kleeman, A rigorous formalism of informa-
tion transfer between dynamical system components. I. Discrete
mapping, Physica D 231, 1 (2007).
[49] X. S. Liang and R. Kleeman, A rigorous formalism of in-
formation transfer between dynamical system components. II.
Continuous flow, Physica D 227, 173 (2007).
[50] A. Lasota and M. C. Mackey, Chaos, Fractals, and Noise:
Stochastic Aspects of Dynamics (Springer, New York, 1994).
[51] J. L. Kaplan and J. A. Yorke, Functional Differential Equations
and Approximations of Fixed Points, Lecture Notes in Mathe-
matics, Vol. 730 (Springer-Verlag, 1979).
[52] O. E. R¨ossler, An equation for continuous chaos, Phys. Lett. A
57, 397 (1976).
[53] Y. Bar-Yam, Dynamics of Complex Systems (Addison-Wesley
Press, Reading, MA, 1997).
[54] J. P. Crutchfield, The calculi of emergence: Computa-
tion, dynamics, and induction induction, Physica D 75, 11
(1994).
[55] J. Goldstein, Emergence as a construct: History and issues,
Emerg. Complex. Org. 1, 49 (1999).
[56] J. C. McWilliams, The emergence of isolated, coherent vortices
in turbulence flows, J. Fluid Mech. 146, 21 (1984).
[57] P. A. Corning, The re-emergence of emergence: A venerable
concept in search of a theory, Complexity 7, 18 (2002).
052201-27
X. SAN LIANG PHYSICAL REVIEW E 94, 052201 (2016)
[58] R. V. Abramov, G. Kovacic, and A. J. Majda, Hamiltonian
structure and statistically relevant conservative quantities for the
truncated Burgers-Hopf equation, Commun. Pure Appl. Math.
56, 1 (2003).
[59] X. S. Liang, Normalizing the causality between time series,
Phys. Rev. E 92, 022126 (2015).
[60] X. S. Liang, Unraveling the cause-effect relation between time
series, Phys. Rev. E 90, 052150 (2014).
[61] A. Stips, D. Macias, C. Coughlan, E. Garcia-Gorriz
and X. S. Liang, On the causal structure between
CO2 and global temperature, Sci. Rep. 6, 21691
(2016).
052201-28