
64 6 Kalman Filters and 3DVar
which has an explicit solution
za = zf + C−1
zz + GTC−1
dd G−1GTC−1
dd
d − Gzf . (6.2)
Here y = Gz is the linear prediction of the measurements, which we can write as
y = Gz = H
⎛
⎜
⎜
⎜
⎝
z
x1
...
xK
⎞
⎟
⎟
⎟
⎠ = H
⎛
⎜
⎜
⎜
⎝
z
M1z
...
MK . . . M1z
⎞
⎟
⎟
⎟
⎠ = H
⎛
⎜
⎜
⎜
⎝
I
M1
...
MK . . . M1
⎞
⎟
⎟
⎟
⎠ z = HMz, (6.3)
which deﬁnes G, and where we introduce M for later use. Thus, if the model is
linear, we can compute the update at the initial time of the assimilation window from
measurements located throughout the assimilation window by solving Eq. (6.2). We
include a time-step index on M so that the equation will also apply in the nonlinear
case where Mk is the tangent-linear model at time tk .
To ﬁnd an explicit solution of the estimation problem in Eq. (3.11) in the nonlinear
case, we introduce the following approximation
Approximation 5 (Linearization) Linearize g(z) around the prior estimate zf ,
gz ≈ gzf  + Gz − zf , (6.4)
and approximate the gradient in Eq. (6.1) with the gradient evaluated at the prior
estimate
∇z gz ≈ GT, (6.5)
where we have deﬁned
GT = ∇z gz
z=zf . (6.6)
Here, G is the tangent-linear operator of g(z) evaluated at zf , and GT is its adjoint.
Note that the Eq. (6.6) implies the following
MT
k = ∇z mz
z=zk and HT = ∇m(z)hm(z)
z=zk . (6.7)
The linearization in Eq. (6.4) and approximation in Eq. (6.5) allow us to rewrite
Eq. (3.11) in terms of g(zf ) and G, with an explicit solution
za = zf + C−1
zz + GTC−1
dd G−1GTC−1
dd
d − gzf  . (6.8)
We can write this equation in an alternative form by using the corollaries
Woodbury corollaries
C−1 + GTD−1G−1 = C − CGT(GCGT + D)−1GC, (6.9)
GTD−1G + C−1−1GTD−1 = CGTGCGT + D−1, (6.10)
6.1 Linear Update from Predicted Measurements 65
which we derive from the Woodbury identity. We then obtain
za = zf + CzzGTGCzzGT + Cdd
−1d − gzf  , (6.11)
where we solve for the update in measurement space. Due to Approx. 5, the Eqs. (6.8)
and (6.11) are only valid for small updates.
Using Eq. (6.11), we can compute an approximate update of the state vector z from
measurements distributed over the assimilation window. Thus, the method solves a
similar problem to the SC-4DVar discussed in Chap. 4 without using iterations.
Interestingly, from Eq. (6.3), the products GCzz and GCzzGT include a forward
propagation of the background-error-covariance matrix Czz leading to a covariance
matrix for the model state over the whole data assimilation window. When we mea-
sure the resulting covariances, we obtain the covariances between the predicted
measurements and the state vector, i.e., Cyz = GCzz and Cyy = GCzzGT . With this,
we can write Eq. (6.11) as
za = zf + Czy
Cyy + Cdd
−1d − gzf  . (6.12)
In a prediction system, we would like to initialize the prediction for the next
assimilation window. A question is whether it is possible to update the solution at
the end of the assimilation window. Below, we will see that this is possible with
the Kalman ﬁlter that provides an update and optimal solution at the end of the
assimilation window by sequentially assimilating the measurements while evolving
the model solution and its error statistics forward in time.
Let’s revert to Eq. (6.11) and multiply the equation with M deﬁned in Eq. (6.3)
to obtain
Mza = Mzf + MCzzMTHTGCzzGT + Cdd
−1d − gzf  . (6.13)
We can write this equation as
⎛
⎜
⎜
⎜
⎝
za
xa
1
...
xa
K
⎞
⎟
⎟
⎟
⎠ =
⎛
⎜
⎜
⎜
⎝
zf
xf
1
...
xf
K
⎞
⎟
⎟
⎟
⎠+
⎛
⎜
⎜
⎜
⎝
Czz . . . Czx K
Cx1 z . . . Cx1 x K
... . . . ...
Cx K z . . . Cx K x K
⎞
⎟
⎟
⎟
⎠ HTGCzzGT +Cdd
−1d−gzf . (6.14)
It is clear that this formulation gives a smoother update of the model solution over the
whole assimilation window, processing all the measurements in one go, as discussed
in Sect. 2.4.1. If we are only interested in the solution at the time t K , we can compute
the following
xa
K = xf
K + CxK z . . . CxK x K
 HTGCzzGT + Cdd
−1d − gzf   (6.15)
= xf
K + CxK y
Cyy + Cdd
−1d − gzf . (6.16)
As for the case where we updated the initial model state of the assimilation window,
we now use the covariance matrix CxK y to update the ﬁnal model state of the assim-
ilation window. Using Eq. (6.14), we can update the model-state vector at any time
within the assimilation window.
66 6 Kalman Filters and 3DVar
In Eq. (6.14), we must integrate the model to predict xf
K and the covariance matrix
through MCzzMT , where the equation to update MCzzMT is similar to the error
covariance equation from Eq. (2.28) without explicit model errors.
From the above, we learn that it is possible to update the model state at a particu-
lar time using measurements distributed in time by exploiting the time correlations.
Sakov et al. (2010) discussed this “asynchronous” data assimilation in the ensemble
Kalman ﬁlter. They showed how to assimilate batches of multiple measurements dis-
tributed in time to avoid stopping and restarting the model integration too frequently.
The above computations are not convenient, but the approach becomes practical
with the ensemble data-assimilation methods. Finally, note that in this linear case,
without model errors, updating x0 and propagating this solution forward to time t K
to ﬁnd xK gives the same result for xK as if we ﬁrst run the model to obtain a forecast
of xK and then compute its update.
6.2 3DVar
3DVar used to be a popular approach to minimize the cost function from Eq. (3.9),
assuming that the prior and the measurements are both available at the initial time of
the assimilation window. This “time-independence” implies that the possibly non-
linear function g(z) represents only the measurement operator and not the model
operator. In this case, the state vector z includes the model state at the initial time of
the assimilation window and may contain model parameters. We then start from the
cost function
3DVar costfunction
J(z) = 1
2
z − zf T C−1
zz
z − zf  + 1
2
h(z) − dT C−1
dd
h(z) − d. (6.17)
The 3DVar method refers speciﬁcally to a sequential data-assimilation approach
where we use a constant-in-time background or prior error covariance Czz for each
subsequent update step. Thus, the method does not propagate error statistics from one
update time till the next, and there is no updating of the analysis error covariance. This
3DVar update scheme solves a Gauss–Newton iteration like in Eqs. (3.14) or (3.17).
Thus, 3DVar is a computationally efﬁcient, although approximate method.
The gradient of the cost function is still the one in Eq. (3.10) but with g(z) replaced
by h(z), i.e.,
∇zJ(z) = C−1
zz
z − zf  + HT C−1
dd
h(z) − d, (6.18)
where we have used
HT = ∇z hz
z=z. (6.19)
No explicit solution solves Eq. (6.18) being equal to zero since the gradient includes
the nonlinear measurement operator h(z). Thus, to compute the 3DVar solution, we
must use an iterative solver. Another reason for using an iterative approach is that
6.2 3DVar 67
we avoid forming the explicit model state covariance matrix and invert it, as in the
4DVar methods.
Typically, we initialize a Gauss–Newton iteration with the prior estimate
z0 = zf , (6.20)
and iterate
zi+1 = zi − γ i Bi ∇zJzi , (6.21)
until convergence. In this expression, Bi is the inverse of the Hessian given by
C−1
zz + Hi TC−1
dd Hi . (6.22)
If we use the gradient from Eq. (6.18), we can write the iteration in Eq. (6.21) as
zi+1 = zi − γ i C−1
zz + Hi TC−1
dd Hi −1
C−1
zz
zi − zf  + HiT C−1
dd
h(zi ) − d
(6.23)
= zi − γ i (zi − zf )
+ γ i CzzHTHCzzHT + Cdd
−1H(zi − zf ) − h(zi ) − d , (6.24)
where we again used the corollaries from Eqs. (6.9) and (6.10).
Instead of forming the Hessian and inverting, it is common to introduce the control-
variable transform as in strong-constraint 4Dvar. It is then possible to apply iterative
methods like conjugate-gradient to solve the linearized problem.
An advantage of 3DVar is that it minimizes the cost function with a nonlinear
measurement operator. The method is highly efﬁcient as it does not update or evolve
error statistics in time. Still, the approximation of a constant-in-time background-
error-covariance matrix can be an essential drawback of 3DVar. Furthermore, while
3DVar solves for the update with a nonlinear measurement functional, we can com-
pute the update even more efﬁciently in the case with a linear measurement functional
using the Kalman-ﬁlter update equations. With the assumptions on linearity, this ap-
proach avoids iterations and leads to the Optimal Interpolation method in the case
of stationary error statistics.
6.3 Kalman Filter
Generally, it is only possible to write a closed-form solution of the Eq. (3.11) in the
trivial case when g(z) is linear. In the case with a linear measurement functional, and
when the measurements are available at the initial time of the assimilation window,
Eq. (3.11) reduces to Eq. (6.17). With a linear measurement operator, h(z) becomes
Hz, and we write the cost function in Eq. (6.17) as
J(z) = 1
2
z − zf T C−1
zz
z − zf  + 1
2
Hz − dT C−1
dd
Hz − d. (6.25)
68 6 Kalman Filters and 3DVar
By setting the gradient of the cost function to zero,
C−1
zz
za − zf  + HT C−1
dd
Hza − d = 0, (6.26)
we ﬁnd the Kalman ﬁlter update equation
za = zf + C−1
zz + HTC−1
dd H−1HTC−1
dd
d − Hzf , (6.27)
We solve the analysis za in the state space because we deﬁne the matrices we invert
in the state space. By using the matrix identity from Eq. (6.10), we can rewrite
Eq. (6.27) to obtain the standard form of the Kalman ﬁlter update equation
The Kalman ﬁlter state update
za = zf + CzzHTHCzzHT + Cdd
−1d − Hzf , (6.28)
which solves for the solution in the measurement space just like the formulation in
Eq. (6.11). Indeed, the matrix we have to invert is deﬁned in the measurement space.
We can ﬁnd the Hessian of the cost function in Eq. (6.25) by taking the second
derivative, leading to
∇z ∇z J(z) = C−1
zz + HC−1
dd HT . (6.29)
Note that the Hessian is not dependent on the state z but only on the prior and the
measurement covariances. We know that the posterior is Gaussian, with covariance
matrix Ca
zz . Hence, we can write the cost function as
J(z) = 1
2
z − zaT Ca
zz
−1 z − za + constant (6.30)
in which the constant depends on the measurement d, but not on z. Taking the second
derivative of this version of the cost function gives
∇z ∇z J(za) = Ca
zz
−1 . (6.31)
Since the two expressions for the Hessian must be the same, we ﬁnd for the posterior
covariance Ca
zz
−1 = C−1
zz + HC−1
dd HT . (6.32)
With this expression, we have proven that in the linear case, the inverse of the Hessian
is the posterior error-covariance matrix. Eq. (6.32) is the equation for computing
the error-covariance matrix in the state space, and we can rewrite it using the matrix
identity (6.9) to ﬁnd
The Kalman ﬁlter error-covariance update
Czza = Czz − CzzHTHCzzHT + Cdd
−1HCzz. (6.33)
6.3 Kalman Filter 69
In contrast to using a stationary background-error-covariance matrix in 3DVar, the
Kalman ﬁlter updates and evolves the error statistics in time, using Eq. (2.28). The
standard form for the Kalman ﬁlter is a recursion over measurement times where we
evolve the state vector and its covariance from one measurement time till the next by
solving the following model and error covariance equations, starting from the update
zk = za and Czz,k = Czza at the time tk
zk+1 = Mzk , (6.34)
Czz,k+1 = MCzz,k MT + Cqq. (6.35)
We integrate these equations until the next time tk when we update the model with
new measurements. We then set zf = zk and Czz = Czz,k , and we compute the update
from Eqs. (6.28) and (6.33), before we continue the integration of Eqs. (6.34) and
(6.35).
Thus, we deﬁne the assimilation windows in the KF to cover the time intervals
between two consecutive measurement times. We integrate the model solution and
the error covariance matrix from the start of an assimilation window till the next. We
then update the predicted model state vector and its error covariance matrix at the
initial time of the next assimilation window. We repeat this recursion as we progress
from one assimilation window to the next.
In the case of a linear measurement operator and Gaussian priors, Eqs. (6.28) and
(6.33) provide the variance minimizing solution of
f (z|d) ∝ exp − 1
2 J(z)

, (6.36)
with cost function J deﬁned in Eq. (6.25). We note that the variance-minimizing
solution is equal to the MAP solution for a purely Gaussian problem. Thus, the
Eqs. (6.28) and (6.33) exactly represent the posterior pdf for the Gauss-linear case
as described in the cost function in Eq. (3.9).
One of the main issues with the KF is the storage of the vast error-covariance
matrix Czz and the computational cost of its evolution in time. For an example of
using the KF and its properties, we refer to Chaps. 12 and 13.
We observe that we can also write the KF update in Eq. (6.28) using the notation
za = zf + Kd − hzf , (6.37)
Czza = I − KHCzz, (6.38)
where K ∈ n×m deﬁnes the Kalman gain matrix of the Kalman ﬁlter (Kalman,
1960),
K = CzzHTHCzzHT + Cdd
−1, (6.39)
and Eqs. (6.37)–(6.39) represent the update step of the Kalman ﬁlter.
This section showed that the solution of Eq. (3.11) is deﬁned in the state space,
i.e., we solve for za . However, we have transformed the update computation to the
measurement space using the Woodbury identity, identiﬁable by the matrix that we
70 6 Kalman Filters and 3DVar
must invert in the Kalman ﬁlter. Bennett (1992) showed that it is possible to write
the exact solution of Eq. (6.28) as
za = zf + Czyb. (6.40)
which is a linear combination of “representer functions”
Czy = CzzHT, (6.41)
with coefﬁcients b found by solving the linear system
HCzzHT + Cdd
b = d − Hzf . (6.42)
The update to zf resides in an m-dimensional space in this formulation, hence the
notation measurement space. The notation state space makes sense as the state vector
belongs to it. On the other hand, the notation measurement space refers to the fact
that we ﬁrst ﬁnd the solution in the measurement space, and then transform it to the
state space via the Czy matrix. We are still computing the solution in the state space,
but the update is a linear combination of m representer functions Czy. Hence, as we
calculate the update to zf in the space spanned by the m representer functions, we
could also have used a name like “representer space.” The critical point is that we
reduce the inverse calculations from an n-dimensional problem to an m-dimensional
one.
6.4 Optimal Interpolation
From the KF formulation, we obtain an even more straightforward sequential up-
dating algorithm named optimal interpolation (OI) by applying the approximation
of time-invariant error statistics. In OI, we only solve for the model prediction in
Eq. (6.34) and update the model state according to Eq. (6.28), with Czz being a
constant-in-time prior error-covariance matrix. In the linear case, optimal interpola-
tion is equivalent to the 3DVar method. However, the iterative solution method used
in 3DVar allows for solving the update with a nonlinear measurement functional.
Avoiding a matrix inversion can be much more efﬁcient, even in the linear case.
6.5 Extended Kalman Filter
The extended Kalman ﬁlter (EKF) allows applying the KF with a nonlinear model
and measurement operator. To derive the equations for the update step, we again
start with the 3DVar cost function in Eq. (6.17) and its gradient Eq. (6.18). To ﬁnd
an explicit but approximate solution z of the gradient in Eq. (6.18) equal to zero, we
use the Approx. 5, which allows us to write
C−1
zz
za − zf  + HT C−1
dd
h(zf ) + H(za − zf ) − d. (6.43)
6.5 Extended Kalman Filter 71
Like for the KF, we ﬁnd an explicit solution of this equation as
za = zf + CzzHTHCzzHT + Cdd
−1d − hzf  . (6.44)
The update equation becomes identical to the Eq. (6.33) used in the Kalman ﬁlter but
now uses h instead of H when comparing the measurements to the model prediction.
To derive an equation for the error covariance evolution, we need to linearize the
model equations. By introducing the linearization from Eq. (6.7) in Approx. 5, we
can compute the time evolution of the model state and its error covariance from
zk+1 = mzk
 (6.45)
Czz,k+1 = Mk Czz,k MT
k + Cqq, (6.46)
where Eq. (6.46) was derived in Sect. 2.3.2.
Note that the EKF applies linear versions of the model and measurement op-
erators. The state vector zf contains the predicted model state at an update time
originating from the nonlinear model Eq. (2.5). However, an approximate linearized
equation (2.28) describes the time evolution of the state-error-covariance matrix.
Evensen (1992 found that using a linearized error-covariance equation led to linear
instabilities, which would cause the predicted error covariance to blow up for many
nonlinear models with unstable dynamics such as ocean and atmospheric models.
We will discuss the EKF further in the example in Chap. 12.
Open Access This chapter is licensed under the terms of the Creative Commons Attribution 4.0
International License (http://creativecommons.org/licenses/by/4.0/), which permits use, sharing,
adaptation, distribution and reproduction in any medium or format, as long as you give appropriate
credit to the original author(s) and the source, provide a link to the Creative Commons license and
indicate if changes were made.
The images or other third party material in this chapter are included in the chapter’s Creative
Commons license, unless indicated otherwise in a credit line to the material. If material is not
included in the chapter’s Creative Commons license and your intended use is not permitted by
statutory regulation or exceeds the permitted use, you will need to obtain permission directly from
the copyright holder.
7Randomized-Maximum-Likelihood
Sampling
In the following, we derive some methods for sampling the posterior conditional pdf
in Eq. (3.8). We aim to estimate the full pdf, not only ﬁnding its maximum. We will,
in this chapter, use an approach named randomized maximum likelihood (RML)
sampling. Note th