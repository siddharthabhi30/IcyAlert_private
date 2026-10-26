# Full-text extraction

- Title: Information Transfer between Dynamical System Components
- Year: 2005
- DOI: https://doi.org/10.1103/PhysRevLett.95.244101
- PDF source: https://math.nyu.edu/~kleeman/prl2005.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                         PHYSICAL REVIEW LETTERS                                                      week ending
PRL 95, 244101 (2005)                                                                                              9 DECEMBER 2005



                      Information Transfer between Dynamical System Components
                                             X. San Liang* and Richard Kleeman
               Courant Institute of Mathematical Sciences, New York University, New York, New York 10012, USA
                                     (Received 8 August 2005; published 8 December 2005)
                We present a rigorous formalism of information transfer for systems with dynamics fully known. This
             follows from an accurate classification of the mechanisms for the entropy change of one component into a
             self-evolution plus a transfer from the other component. The formalism applies to both continuous flows
             and discrete maps. The resulting transfer measure possesses a property of asymmetry and is qualitatively
             consistent with the classical measures. It is further validated with the baker transformation and the Hénon
             map.

             DOI: 10.1103/PhysRevLett.95.244101                     PACS numbers: 05.45.a, 02.50.r, 89.70.+c, 89.75.k


   Information transfer between the components of a dy-                                          ZZ
                                                                                     Ht              logdx1 dx2 ;        (2)
namical system has been of interest since decades ago                                               
[1,2]. It is usually investigated as a subfield of nonlinear
signal coherence analysis in the context of some specific            evolves with time. For notational simplicity, we will drop
discipline [3], but its concept is also frequently seen in           the  in the double integral, and all double integrations
general physics literature. The well-studied baker trans-            henceforth are understood to be over the entire sample
formation is such an example: It has been argued that                space, unless otherwise indicated.
information is transferred continually from the stretching             Associated with (1), there is a Liouville equation:
direction to the folding direction [4,5], although the trans-                      @    @            @
fer is yet to be quantified. Recently, there comes much                                    F1       F2   0:           (3)
                                                                                   @t   @x1          @x2
renewed interest with this problem, motivated mainly by
the research of weather predictability and climate varia-            Multiplication by (1  log) gives
bility, where information transfer plays an important role               @log
[6].                                                                               F  rlog  1  logr  F  0:       (4)
                                                                            @t
   So far, the formalisms of information transfer are mostly
data-based, the widely used transfer measures including              Integrating,
the time-delayed mutual information [1] and, in the frame-            dH ZZ                            ZZ
work of a Markov chain, the more sophisticated transfer                        r   logFdx1 dx2     r  Fdx1 dx2  0:
                                                                      dt
entropy by Schreiber [2]. In this study, we will show that,
when dynamics is fully known (as in the above physical               In practice (particularly for weather systems or climate
problems), the measure of information transfer can be                models),  generally vanishes at boundaries; i.e., extreme
rigorously formulated.                                               events have zero probability. This assumption may also be
   We rely on a two-dimensional (2D) system to elucidate             weakened to include extreme events but with boundary
the fundamental idea. The formalism on a more generic                fluxes balanced in the x1 and x2 directions, respectively.
basis for arbitrarily many dimensions will follow later [7].         But, for practical purposes, we stick to the former assump-
We first derive the formula with a continuous flow, then             tion. TheRRsecond term in the above equation thus vanishes.
extend it to deal with more complicated discrete mappings.           So dH
                                                                         dt      x1 ; x2 r  Fdx1 dx2  0, or
The result is applied to study two classical problems where                                  dH
the physics of information transfer is qualitatively clear for                                   Er  F:                    (5)
validation.                                                                                  dt
   Consider a 2D autonomous system:                                  Equation (5) states that the time rate of change of H is due
                                                                     to the expectation of the divergence of F. In other words,
                        dx
                            Fx;                           (1)     the change of entropy is controlled totally by the contrac-
                        dt                                           tion or expansion of the phase space. Soon we will see that
where F  F1 ; F2, and x  x1 ; x2  2 . In this study,          the physics revealed by (5) is the key to the establishment
the sample space  is assumed to be a direct product of              of our transfer formalism.
1 and 2 . Let fX; tg be a stochastic process, X                      If only one component is involved, entropy along that
X1 ; X2  the random variables corresponding to (x1 ; x2 ),         coordinate can also be defined but with the marginal dis-
and   x1 ; x2 ; t the probability density distribution at       tribution. Suppose we are interested in the entropy evolu-
t. We need to find how the joint entropy of X1 and X2 ,              tion of theR first component. The marginal density is
which is defined as                                                  1 x1 ; t  2 x1 ; x2 ; tdx2 . The evolution equation of

0031-9007=05=95(24)=244101(4)$23.00                          244101-1                   © 2005 The American Physical Society
                                          PHYSICAL REVIEW LETTERS                                                             week ending
PRL 95, 244101 (2005)                                                                                                      9 DECEMBER 2005

1 is derived by integrating (3) with respect to x2 over the            there should be no information transfer from random vari-
subspace 2 :                                                           able component X2 to X1 , albeit the transfer in the other
               @1      @ Z                                             direction may be nonzero when F2 depends on both x1 and
                               F1 dx2  0:             (6)            x2 . This is true with the transfers defined in (10) and (11).
                @t     @x1 2
                                                                        In fact, when F1  F1 x1 ,
The third term in the original equation has been integrated                               Z Z                        
                                                                                                                        @F1 1 
out with the compact support assumption for . Following                      T2!1                2j1 x2 jx1 dx2             dx1
the same procedure    as above, the entropy in direction 1                                 1    2                       @x1
            R
H1 t   1 1 log1 dx1 evolves as                                                     Z @F1 1 
                                                                                                      dx1  0:
            dH1     ZZ         @F1 
                                        
                                                                                           1    @x1
                        log1           dx1 dx2 :      (7)
             dt                   @x1                                      It merits noting that, because of the asymmetry, infor-
Through integration by parts, this may also be written as               mation transfer is distinctly different from transfer of other
             dH1        ZZ F1 @1                                     quantities such as energy: Information does not have to be
                                     dx1 dx2 :       (8)             lost in one component in order for another component to
              dt               1 @x1                                   receive it. As elucidated above, while X1 gains information
   Equation (8) states how H1 evolves with time. The                    from X2 , X2 might have nothing to do with X1 .
evolutionary mechanism can be decomposed into two                          The foregoing formalism for continuous systems seems
parts: One is from X1 itself, which we write as dH1 =dt;               to be surprisingly simple. We now carry over the idea to
another from X2 through the coupling in the joint density               discrete maps. Maps usually display more complex and
distribution . Clearly, the latter is the information transfer.        more interesting features than continuous flows. In fact, the
We want to separate it out from the intertwined mechanism               information transfers by previous researchers are all for-
in the right-hand side of (8).                                          mulated in the context of discrete systems. We need to
   The separation is made through a heuristic reasoning                 extend (10) and (11) to 2D maps, even for the purpose of
based on what one observes with the joint entropy and (5):              making contacts with the classical formalisms. For sim-
The time change of H depends only on r  F. One may                     plicity, we first examine a map with invertible individual
argue that the entropy with X1 changes only with @F1 =@x1               components and then generalize to more generic cases.
if it evolves on its own. Paralleling (5) then should be an                Consider a transformation :  ! , which is made
equation:                                                               up of two components 1 :  哫 1 , 2 :  哫 2 . The
                             ZZ                                       evolution of its density is steered by the Frobenius-Perron
            dH1       @F1               @F
                 E                   1 dx1 dx2 :         (9)         operator (F-P operator hereafter) P : L1  ! L1 ,
             dt         @x 1             @x1                            where the sample space  is, again, a shorthand for 1 
The rate of entropy transfer from X2 to X1 is then                      2 . Given a density   x1 ; x2 , P is defined, in a loose
         d                     ZZ F1 @1 @F1                          sense (see [4] for a rigorous treatment using the measure
T2!1  H1  H1                             dx1 dx2               theory) such that
        dt                         1 @x1 @x1                             ZZ                          ZZ
           ZZ                @F1 1                                          P x1 ; x2 dx1 dx2           x1 ; x2 dx1 dx2 ; (12)
            2j1 x2 jx1            dx1 dx2 :       (10)                   !                             1 !
                               @x1
                                                                        where ! is any subset of . For an invertible transforma-
  Likewise, the transfer of entropy from x1 to x2 is                    tion ; P can be expressed explicitly as
                ZZ                 @F2 2                                            P x1 ; x2    1 x1 ; x2  jJ1 j;       (13)
     T1!2         1j2 x1 jx2            dx1 dx2 : (11)
                                     @x2                                          1        1                        1
                                                                        where J  J x1 ; x2   det @ x1 ; x2 =@x1 ; x2 
   As elaborated by Schreiber [2], a desired property about             is the determinant of the Jacobian matrix for the inverse
the information transfer is its asymmetry between the                   transformation of  [4].
components. Particularly, in system (1), if F1 has no de-                  Now compute the entropy increase after applying once
pendence on x2 , then x1 evolves on its own. That is to say,            an invertible mapping . From Eq. (13),
                             ZZ                            ZZ
                  H            P  logP dx1 dx2             logdx1 dx2
                             ZZ                                                                  ZZ
                                1 x1 ; x2 jJ1 j log 1 x1 ; x2 jJ1 j dx1 dx2            logdx1 dx2
                             ZZ                                                                   ZZ
                                u1 ; u2 jJ1 j logu1 ; u2   logjJ1 j jJjdu1 ; du2            logdx1 dx2
                             ZZ
                                x1 ; x2  logjJ1 jdx1 dx2 :


                                                                   244101-2
                                            PHYSICAL REVIEW LETTERS                                                                    week ending
PRL 95, 244101 (2005)                                                                                                               9 DECEMBER 2005

In the derivation, we have made a transformation of vari-                    due to two mechanisms: One is by X1 itself; another is the
ables from (x1 ; x2 ) to u1 ; u2   1 x1 ; x2  and use the             transfer from X2 . We denote these two by H1 and T2!1 ,
fact that 1   . The above equality can be con-                        respectively. In the case when 1 , the first component of
cisely rewritten as                                                          x1 ; x2 , is invertible, (14) implies that H1 is due to the
                                                                             expansion or contraction of the phase space in dimension
                        H  E logjJj:                            (14)
                                                                             x1 , while keeping dimension x2 unchanged. That is to say,
Notice that jJj is the rate of area change of the trans-
formation . Equation (14), hence, simply states that the                                             H1  E logjJ1 j;                          (15)
change of entropy is the average of the logarithm of area
change of the phase space.                                                   where J1  @1 =@x1 . Following the same argument with
   Equation (14) is consistent with its continuous coun-                     the continuous system, the transfer of entropy from X2 to
terpart (5). If the transformation  is replaced by an                       X1 , T2!1 , is simply the difference between H1 and H1 .
infinitesimal operator, the two are identical. An obvious                    Likewise, the transfer from the opposite direction may also
observation about (14) is, for an invertible measure-                        be calculated.
preserving transformation (jJj  1), entropy stays                              The above formulation works for the case when both
invariant.                                                                   1 and 2 are invertible. Maps, however, are much more
   We proceed to investigate the entropy transfer. Consider                  complex than the discretized form of (1). In this con-
the transfer from X2 to X1 first. The entropy of X1 increases                text, even though a 2D system is invertible, its individual
as                                                                           components may not be so. Well-studied examples in-
                                                                             clude the baker transformation and the Hénon map. We
                Z Z               Z              
     H1               P dx2 log         P dx2 dx1                       need to extend the foregoing formalism to allow for
                  1     2                   2                             noninvertibility.
                 Z                                                              The central point of the extension is with the starred
                      1 log1 dx1 ;                                        entropy increase. Taking direction 1 as an example, what is
                  1
                                                                             needed is to generalize (15) so that noninvertibility is
where 1 is the marginal distribution of X1 . This increase is               permissible. We claim the generalized version should be
                        Z                                ZZ
             H1           1 x1  log1 x1 dx1         P 1 1 1 x1 ; x2  logP 1 1 1 x1 ; x2 x2 jx1 jJ1 jdx1 dx2 ;            (16)

where P 1 is the F-P operator when x2 is fixed; i.e., x2 appears in P 1 as a parameter. Equation (16) is just a restatement of
our previous argument that H1 be the entropy increase in X1 from one time step to the next step with x2 frozen as a
parameter, given X1 at the present step. It is easy to prove that [7] (a) when 1 is invertible, (16) reduces to (15), namely,
E logjJ1 j, and (b) when 1 is independent of x2 , H1  H1 . Property (a) means that (16) is indeed an extension of our
previous formalism, while (b) is just the asymmetry property as expected. For all that account, the entropy transfer from X2
to X1 is, in a unified form,
               Z Z             Z                      ZZ
    T2!1               P dx2 log       P dx2 dx1         P 1 1 1 x1 ;x2 logP 1 1 1 x1 ;x2 x2 jx1 jJ1 jdx1 dx2 :
                 1     2                  2
                                                                                                                                                 (17a)
Likewise, the transfer from X1 to X2 is
              Z Z                  Z                      ZZ
   T1!2                    P dx1 log          P dx1 dx2     P 2 2 2 x1 ;x2 logP 2 2 2 x1 ;x2 x1 jx2 jJ2 jdx1 dx2 ;
                 2     1                  1
                                                                                                                                                 (17b)

where P 2 is the F-P operator corresponding to transfor-                     reflected in our formalism. In the case of a Markov chain of
mation 2 with x1 fixed as a parameter.                                      order one, Schreiber’s formula for the transfer entropy
   The information transfers given by (17a) and (17b) are                    from X2 to X1 is, at time step n,
physically consistent with the previous formalisms. In
particular, it is consistent with Schreiber’s transfer entropy                               X                               Pxn1  n n
                                                                                                                                1 jx1 ; x2 
                                                                                  T2!1          Px1n1 ; xn1 ; xn2  log                   ;    (18)
[2]. The transfer entropy is a Kullback entropy-like quan-                                                                    Pxn1   n
                                                                                                                                 1 jx1 
tity, which measures the incorrectness when the probability
mass function of X1 at time step n conditioned on the                        which
                                                                               P     is equal to the difference between A 
measurements at previous time steps is taken as the proba-                    P Pxn1    n        n1 n
                                                                                     1 ; x1  logPx1 jx1           and        B
                                                                                     n1   n   n       n1  n  n
                                                                              Px1 ; x1 ; x2  logPx1 jx1 ; x2 . These two terms
bility of X1 given the measurements of both X1 and X2 at
their previous time steps. The essence of this philosophy is                 correspond, respectively, to the entropy increases H1
                                                                    244101-3
                                         PHYSICAL REVIEW LETTERS                                                week ending
PRL 95, 244101 (2005)                                                                                        9 DECEMBER 2005

and H1 in our formalism upon one transformation: The               We have investigated the information transfer between
transition probability reflects the dynamics; when we             components in a 2D system, both in the form of a continu-
freeze a direction of the phase space to extract information      ous flow and with a discrete mapping. The resulting en-
transfer, it essentially produces the conditional probability     tropy transfer possesses a property of asymmetry, which
given the component for that direction. In this sense, our        requires that the transfer to random variable X1 from
formalism is physically consistent with the Schreiber for-        variable X2 goes to zero if X1 evolves independently of
mula with a Markov chain of order one.                            X2 , while in the same time the opposite does not need to be
   However, our formalism differs quantitatively from (18).       so. This formalism has been compared to Schreiber’s trans-
The major difference lies in that A and B are not strictly in     fer entropy and applied to several physical problems.
a form of entropy increase, while entropy increase forms          Applications to continuous dynamical systems are deferred
the building blocks for our formalism. This difference            to Ref. [7], as the minimal dimensionality required for
might lead to different results with the same problem, as         chaos is 3 [5]. Applications to discrete systems include
is clear in the following Hénon map application.                 one with the Hénon map and one with the baker trans-
   A Hénon map sets a good example for the 2D informa-           formation. For the former, it gives a simple and physically
tion transfer. Defined as   1 ; 2 : R2 ! R2 ,               clear transfer from the quadratic component to the linear
                                                                  component; for the latter, we found that there is always
              x1 ; x2  哫 1  x2  ax21 ; bx1 ;                information flowing from the stretching coordinate to the
with a > 0 and b > 0 two parameters; X2 depends solely            folding coordinate, while no transfer occurs in the opposite
on X1 . One therefore expects simple physics existing for         direction. The whole idea can be extended to dynamical
T1!2 . (T2!1 is much more complex, and we will consider it        systems with many dimensions. We will present that in the
in Ref. [7].) Specifically, a pure transfer from X1 is ex-        follow-ups to this Letter.
pected to account for all the entropy change in X2 , and,            X. S. L. has benefited from Andrew Majda’s lectures on
hence, T1!2 should be equal to the change of entropy in           information theory. This work was supported by NSF
terms of the marginal distribution of X2 . This is indeed the     under CMG Grant No. 0417728 to Courant Institute of
case by (17), which results in                                    Mathematical Sciences.

                    T1!2  logb  H1 :                    (19)
Equation (19) reconfirms the fact that the entropy trans-             *Electronic address: sanliang@cims.nyu.edu
ferred to X2 is all that X1 possesses, plus the part due to the    [1] K. Kaneko, Physica (Amsterdam) 23D, 436 (1986); J. A.
expansion/contraction of phase space (with a factor b).                Vastano and H. L. Swinney, Phys. Rev. Lett. 60, 1773
Particularly, when b  1, T1!2  H1 . This simple result               (1988); T. Schreiber, J. Phys. A 23, L393 (1990); M. G.
is just what one may expect from the transformation                    Rosenblum et al., Phys. Rev. Lett. 76, 1804 (1996);
                                                                       H. D. I. Abarbanel, N. Masuda, M. I. Rabinovich, and
2 x1 ; x2   bx1 . Among the transfer measures we
                                                                       E. Tumer, Phys. Lett. A 281, 368 (2001).
know, (17) is the only one that results in a transfer as           [2] T. Schreiber, Phys. Rev. Lett. 85, 461 (2000).
consistent with the dynamics of Hénon map as (19) is.             [3] References in different contexts can be found in H. Kantz
   The baker transformation is another example whose                   and T. Schreiber, Nonlinear Time Series Analysis
information transfer is qualitatively clear in physics, as             (Cambridge University Press, Cambridge, England,
mentioned in the beginning of this Letter. It is defined as            2004); H. D. I. Abarbanel, Analysis of Observed Chaotic
a mapping                                                              Data (Springer, New York, 1996).
                                                                  [4] A. Lasota and M. C. Mackey, Chaos, Fractals, and Noise:
                 2x1 ; x22        0 x1 12; 0 x2 1;                   Stochastic Aspects of Dynamics (Springer, New York,
x1 ; x2                   x2
                 2x1  1; 2  2 12 < x1 1; 0 x2 1;
                                 1                                     1994).
                                                                   [5] E. Ott, T. Sauer, and J. A. Yorke, Coping with Chaos:
mimicking a kneading dough. By computing 1 and P                    Analysis of Chaotic Data and the Exploitation of Chaotic
and using the formulas (17a) and (17b), it is straightfor-             Systems (Wiley-Interscience, New York, 1994); A. J.
ward to obtain [7]                                                     Lichtenberger and M. A. Lieberman, Regular and
                                                                       Chaotic Dynamics (Springer, New York, 1992).
                 T2!1  0;         T1!2 > 0:                       [6] For example, R. Kleeman, J. Atmos. Sci. 59, 2057 (2002);
                                                                       R. Kleeman, A. Majda, and I. Timofeyev, Proc. Natl.
This is to say, X1 (stretching) always loses information to            Acad. Sci. U.S.A. 99, 15 291 (2002); R. Kleeman and A.
X2 (folding), while no transfer is invoked in the other way.           Majda, J. Atmos. Sci. 62, 2864 (2005); R. Abram, A.
This is just as expected with the common physical intuition            Majdaov, and R. Kleeman, J. Atmos. Sci. 62, 65 (2005).
[4,5].                                                             [7] X. S. Liang and R. Kleeman (to be published).




                                                            244101-4
