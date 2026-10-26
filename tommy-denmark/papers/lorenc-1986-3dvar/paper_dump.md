1
Three-dimensional variational assimilation (3D-Var)
In the derivation of Optimal Interpolation, we found the optimal weight matrix W that
minimizes the total analysis error variance.
Lorenc (1986) showed that this solution is equivalent to a specific variational assimilation
problem:
Find the optimal analysis xa field that minimizes a (scalar) cost function, where the cost
function is defined as the distance between x and the background xb, weighted by the
inverse of the background error covariance, plus the distance to the observations yo,
weighted by the inverse of the observation error covariance:1 11 1
( ) ( ) ( ) ( ( )) ( ( ))
2 2
T T
b b o o
J H H 
     x x x B x x y x R y x
(5.1)
Reference:
Lorenc, A. C., 1986: Analysis methods for numerical weather prediction. Quart. J. Roy.
Meteor. Soc., 112, 1177-1194.
Note: Lorenc (1986) is a classic paper on modern data assimilation – the scanned paper is
provided at the course web site – read it.
2
In the paper of Lorenc (1986),
 Bayesian probabilistic arguments are used to derive idealized equations for finding the best
analysis for NWP.
 The equations are discussed in the light of the physical characteristics of the NWP analysis
problem:
(1) the predetermined nature of the basis for the analysis,
(2) the need for approximation because of large-order systems,
(3) the underdeterminacy of the problem when using observations alone, and
(4) the availability of prior relationships to resolve the underdeterminacy
 Prior relationships result from
(1) knowledge of the time evolution of the model (which together with the use of a time
distribution of observations constitutes four-dimensional data assimilation);
(2) knowledge that the atmosphere varies slowly (leading to balance relationships);
(3) other nonlinear relationships coupling parameters and scales in the atmosphere.
 The paper also discussed other DA methods, including variational techniques, smoothing
splines, Kriging, optimal interpolation, successive corrections, constrained initialization, the
Kalman-Bucy filter, and adjoint model data assimilation.
3
 The paper showed that all these methods are related to the idealized analysis, and hence to each
other. The paper also gave opinions on when particular methods might he more appropriate and
discussed appropriate choices of parameters in the practical methods.
Remark: Derivative of a quadratic scalar function of a vector:
The general form of a scalar quadratic function is1
( ) 2
T T
F x c  x Ax d x where A is a
symmetric matrix, d is a vector and c a scalar.
The gradient of this scalar function with respect to vector x is defined as1
2
/
/
.
/ n
F x
F xF
F
F x
  
          
  
x x
,
which is a column vector. To find the gradient, we use the following properties of the
gradient with respect to x:( ) ( )T T
   d x x d d
(sinceT
 xx I , the identity matrix), or
41 1 2 2 1 1
1 1 2 2 2 2
1 1 2 2
1 1 2 2
( ... ) /
( ... ) /
( ) ( ... ) . .
( ... ) /
n n
n nT
n n
n n n n
d x d x d x x d
d x d x d x x d
d x d x d x
d x d x d x x d
      
      
          
   
   
      
d x d
.
And( ) 2T
 x Ax Ax .
We can see this by taking, say, time derivative of x:( ) ( ) 2
T
T T T T T T T Td
dt       
x Ax x Ax x Ax x Ax x Ax x Ax x Ax x Ax( ) 2 2( )T T T
d d d x Ax x A x Ax x
Because the differential of function1 2
( ) ( , ,..., )n
F F x x xx is 
1
2
1 2
1 2 1 2
.... .... .
T
n x
n n
n
dx
dxF F F F F F
dF dx dx dx F d
x x x x x x
dx
 
 
                         
 
x
5
In our current case,T
F  x Ax , therefore( ) 2T
 x Ax Ax
Therefore,1
( ) 2
T T
F x c  x Ax d x ,2
( ) , ( )F F    x Ax d x A
and( )T
F F

  x
The above will be used when deriving the gradient of quadratic-form cost function with
respective the analysis variable x, which is needed when we try to find 3DVAR or
4DVAR solution.
6
The variational problem: Find analysis xa that minimizes J
The minimum of J(x) in (5.1) is attained for x=xa, i.e., the analysis is given by the
solution of( ) 0a
J x x
(5.2)
An exact solution can be obtained in the following way.
We expand observation increment or innovation in the second term of Eq. (5.1) around backgroundb
x
and linearize H assuming state variablex and the final analysisa
x remains close enough to ..:( ) ( ( )) { ( )} ( )o o b b o b b
H H H        y x y x x x y x H x x
(5.3)
Plugging (5.3) into (5.1) we get1 1
2 ( ) ( ) ( ) [{ ( )} ( )] [{ ( )} ( )]T T
b b o b b o b b
J H H 
         x x x B x x y x H x x R y x H x x
(5.4)
Expanding the products, and using the rules for transpose of matrix products:1 1 1
1 1
2 ( ) ( ) ( ) ( ) ( ) { ( )} ( )
( ) { ( )} { ( )} { ( )}
T T T T
b b b b o b b
T T T
b o b o b o b
J H
H H H
  
 
        
     
x x x B x x x x H R H x x y x R H x x
x x H R y x y x R y x
(5.5)
7
The cost function is a quadratic function of the analysis increment( )b
  x x x :1 1 1 11 1
( ) ( ) { ( )} { ( )} { ( )}
2 2
T T T T
o b o b o b
J H H H


   
      x x B H R H x y x R H x y x R y x
(5.1a)
The above is actually called the incremental form of cost function because it’s in terms
of analysis increment
x.
Remember a remark given earlier: Given a quadratic function1
( ) 2
T T
F c  x x Ax d x ,
where A is a symmetric matrix, d is a vector and c a scalar, the gradient is given by( )F  x Ax d
. The gradient of the cost function J wrt x is1 1 1
( ) { } { ( )}T T
o b
J H
  
    x B H R H x H R y x
(5.6)
We now set( ) 0a
J x to ensure that J is a minimum, and obtain an equation for( )a a b
  x x x1 1 1
( ) { ( )}T T
a o b
H
  
  B H R H x H R y x
(5.7)
or1 1 1 1
( ) { ( )}T T
a b o b
H   
   x x B H R H H R y x
(5.8)
8
or, in incremental form1 1 1 1
( )T T
a o

   
 x B H R H H R y
(5.8)'
whereo
 y is the innovation vector, as defined earlier.
Eq. (5.8) is the solution of the variational (3D-Var) analysis problem, because we took a
variation of the cost function, and obtained the solution by requiring that the variation to
be zero for all possible variations in x.
The problem is, solution (5.9) is no where near being easy to evaluate, because the
involvement of the inverse of both background and analysis error covariance matrices. In
fact, it’s is even harder to evaluate than the OI solution, which is1
( )T T
a b o

  x x BH R HBH y
.
In practice the solution is obtained through minimization algorithms for J(x) using
iterative methods for minimization such as conjugate gradient or quasi-Newton.
We will discuss the typical iterative procedure for minimizing J more later.
9
Note that the control variable for the minimization (i.e., the variable with respect to
which we are minimizing the cost function J) is now the analysis, x, not the weights, W,
as in OI.
The equivalence between
 the minimization of the total analysis error variance (finding the optimal weights
through a least squares approach – OI approach), and
 the 3D variational cost function approach (finding the optimal analysis that
minimizes the distance to the observations weighted by the inverse of the error
variance)
is an important property, which we will show in next section.
10
Equivalence between the OI and 3D-Var statistical problems
We now demonstrate the equivalence of the 3D-Var solution to the OI analysis solution
obtained earlier.
We have to show that the weight matrix that multiplies the innovation{ ( )}o b o
H
 y x y
in (5.8) is the same as the weight matrix obtained with OI, i.e., that1 1 1 1
( )T T   
  W B H R H H R1
( )( )T T 
BH R HBH
(5.9).
If the variables that we are observing are the same as the model variables, i.e., ifT
 H H I
, then it is rather straightforward to prove (5.9), using the rules for inverse and
transpose of matrix products (exercise).
However, in generalH is rectangular, and non-invertible. The equality (5.9) can be
proven by considering the following block matrix equation:0
1T
a


    
        
wR H y
xH B 0
(5.10)
wherew is a vector to be further discussed later. We want to derive from (5.10) an
equation of the forma o
 x W y .
11
Eliminatingw from both block rows in (5.10), we find that1 1 1 1
( )T T
a o

   
 x B H R H H R y
, the 3D-Var version of the weight matrix.
Namely:1 1 1
0
1
1 1
0
1
1 1 1
0
1
1 1 1
0
1 1 1 1
0
0
( )
( )
T T T
T
a
T T T
T
a
T T
T
a
T T
a
T T
a



 





  

 

  

  
   
    
         
    
         
     
         
  
 
wH R R H R H H R y
xH B 0
wH H R H H R y
xH B 0
wH R H B H R y
xH B 0
H R H B x H R y
x B H R H H R y
On the other hand, eliminatinga
 x from both block rows,
120
1
0
T
a
T
a





    
        
    
         
wR H y
xHBH HBB 0
wR H y
xHBH H 00
0
0
0
( )
T
a
T

 

               
 
w yR H
x yHBH R
HBH R w y
we obtain an equation for the vectorw ,1
( )T
o

w R + HBH y
.
From this, replacingw in the second block row of (5.10),1T
a

 H w B x 0
1 1
( )T T
o a
  
 H R + HBH y B x 0 
we obtain the OI version of the weight matrix:1
( )T T
a o


 x BH HBH R y .
13
This demonstrates the formal equivalence of the problems solved by 3D-Var and OI.
Because the methods of solution are different, however, their results are different, and
most centers have adopted the 3D-Var approach.
14
Another way of showing the equivalence of two formulae is (note that the O is our R
and the x' is our xa):
15
Why do we choose the above cost function?
The cost function (5.1) can also be derived based on a Bayesian approach.
Baye’s theorem of probability states that “the posterior probability of an event A
occurring, given that event B is known to have occurred, is proportional to the prior
probability of A, multiplied by the probability of B occurring given that A is known to
have occurred”.( ) ( )
( ) ( )
p B | A p A
p A| B p B

.
If A is event x = xt, B is event y = yo, then the probability the a posteriori probability
distribution of the true field, given the new observations yo¸is( | ) ( )
( | ) ( )
o t
t o
o
p p
p p
 
   
B
y y x x x
x x y y y y
(5.11)
The Bayesian estimate of the true state is the one that maximizes the a posteriori
probability (5.11), i.e., we want to find an analysis that has a maximum probability to
occur and this probability can be obtained from the above equation if the probability
distribution of the background (pB) and the probability distribution of the observation( | )o
p y y x
are known.
16
We assume that the true field is a realization of a random process defined by the prior
(multi-dimensional Gaussian) probability distribution function (given the background
field), 
1
/2 1/2
1 1
( ) exp [( ) ( )]
22 | |
T
n b b
p

 
    
 
B x x x B x x
B
(Remember of the Gaussian probability distribution for scalar x:2
0
2
( )1 1
( ) exp 22
x x
p x


 
  
 
)
The denominator in (5.11) is the “climatological” distribution of observations, and does
not depend on the current true state x.
Since 
1
/2 1/2
1 1
( | ) exp [( ( )) ( ( ))]
22 | |
T
po o o
p H H

 
    
 
y x y x R y x
R
therefore
17   
1 1
/2 /21/2 1/2
1 1 1
( | ) exp [( ( )) ( ( )) ( ) ( )]
22 | | 2 | |
T T
p no o o b b
p H H


  
       
 
x y y x R y x x x B x x
R B
The x that minimizes the minus of the exponent is the x that maximizes the probability of
the analysis!
Therefore the maximum of the a posteriori probability is attained when the numerator is
maximum, and is given by the minimum of the cost function (5.1).
This is, of course, only valid when probability distributions are Gaussian!
Reference: Lorenc (1986). Read also sections 5.3.2 and 5.5 of Kalnay’s book.
18
Numerical minimization of the cost function
In practice, 3DVAR does not find its solution by evaluating Eq. (5.8)1 1 1 1
( ) { ( )}T T
a b o b
H   
   x x B H R H H R y x
, or Eq. (5.8)'. The minimum is found by
numerical minimization, which is usually an iterative procedure.
3DVAR minimization: An illustration of gradient descent
19
Schematics of variational cost-function minimization
20
Typical iterative procedure for numerically minimizing J:
1. Starting from background xb as the first guess, compute the cost function J
according to (5.1) or (5.1a)
2. Compute the gradient of cost function J with respect to the analysis variable x or
x
3. Call certain optimization subroutine (using e.g., the conjugate gradient method),
passing into the subroutine the cost function and gradient vector, and determine
the amount of correction to x or
x, so that1 ( )n n f J
   x x
where n is the number of iteration, and  is the optimal step size factor.( )f J is
the optimal descent direction obtained by combining the gradients from several
former iterations when using the conjugate gradient method. For the simple
steepest decent algorithm,( )f J J   . We should always have1
( ) ( )n n
J J
x x
.
4. Check if the optimal solution has been found by computing the norm of the
gradients or the value ofJ itself to see if either is less than a prescribed
tolerance. If not, go back to step 1, with the updated value xn+1, and repeat the
21
steps until convergence is reached. The solution obtained at convergence is the
optimal solution that minimizes J.
Several issues related to the minimization
1. Undetermined problem - In the absence of background, the problem is generally
underdetermined.
2. Non-linearity - When the observations models are not linear, the uniqueness of the
minimum is not guaranteed.
3. Computational cost - Because the minimization is an iterative process, it can be very costly
22
3D-VAR: Main issues: Missing background - undetermined problem
The state vector is a 3 dimensional array X = [x, y, z] but only Y = [x, z] is observed.
Different starting point x0 leads to different solutions x0*.
23
3D-VAR: Main issues: Nonlinearities
When observation operators are non-linear, the minimum is not unique.
24
3D-VAR: Main issues: Computational cost
Because the minimization is iterative, 3D-VAR can be very expensive
How to reduce the computational cost ?
1) Code optimization - through vectorization, multitasking and paralellization -
2) Incremental approach - Reduce the computations per iteration, and
linearize around increasingly accurate ‘first guess’ state
3) Preconditioning - Reduce the number of iterations.
Incremental 3DVAR (and 4DVAR)
Write cost function J in (5.1) in terms of incrementb
  x x x and innovation( )o o b
H
  y y x
:1 1
2 ( ) [ ] [ ]T T
o o
J
      
   x x B x y H x R y H x
.
which is the same as Eq. (5.4) and involves linearization operation( ) ( ) ( )b b
H H  x x H x x
. The closer is xb to the final optimal analysis, the better is
linearization approximation.
25
J is minimized to find*
 x , a new ‘background’ is found* *
b b
 x x x , the linearization
is re-performed around the new ‘background’ which should be closer to the optimal
solution therefore x is smaller and the linearization more valid.
Another good thing about the incremental approach is that the nonlinear observation
operator H in the innovation( )o o b
H
  y y x can be calculated at different (usually
higher) resolution from that of analysis. In the case of 4DVAR, the nonlinear forecast
model is part of H, which can be run at higher resolution to achieve better accuracy while
the analysis, which is the expensive part of 4DVAR, can be performed at lower
resolution. This is the essence of the incremental approach initially proposed by Courtier
et al (1994) and the computational saving made operational implementation at ECMRF
possible.
Reference:
Courtier, P., J.-N. Thepaut, and A. Hollingsworth, 1994: A strategy for operational implementation of 4D-Var, using an
incremental approach. Quart. J. Roy. Meteor. Soc., 120, 1367-1387.
Important Note: In the above, we said a ‘new background’ is found by the variational
minimization (the inner iteration loops) around which new linearization of H is
performed. With this ‘new background’, ‘outer loop’ iterations can be performed where
the ‘background’ can be updated several times. However, keep in mind that this ‘new
background’ should only be used in the linearization of H. In the background term, B still
26
represents the error covariance of the ‘original’ forecast background. Therefore, in the
background term, the original background xb should be used.
In terms of equations, if we letf b f
 x x x be the ‘new background’ or new first guess,
a result of the previous variational minimization,( ) ( )
f b f
f b b f f
b f f f f


  
   
 
      
      
x x x
x x x x x x x x
x x x x x x x x1 1
2 ( ) ( ) ( ) [{ ( )} ( )] [{ ( )} ( )]T T
b b o b b o b b
J H H 
         x x x B x x y x H x x R y x H x x1 1
2 ( ) [{ ( )} ( )] [{ ( )} ( )]T T
o f f o f f
J H H
  
       x x B x y x H x x R y x H x x1
1
2 ( ) ( ) ( ) [{ ( )}
( )] [{ ( )} ( )]
T
f f f f o f
T
f o f f
J H
H
  
  
 
 


      
    
x x x x B x x x y x
H x x R y x H x x
Let'f
   x x x1 1
2 ( ) ( ' ) ( ' ) [{ ( )} '] [{ ( )} ']T T
f f o f o f
J H H
 
 

 
       x x x B x x y x H x R y x H x
27
which is a quadratic function of'
 x . A solution for'
 x can be found using the
variational minimization algorithm and new updated solution is then'b f
   x x x x ,
which can serve as the newf
x in the next outer iteration.
28
29
Preconditioning: 2-D example2 2
2 2
1
2
x y
J a b
 
  
 
,2 1
M M J
   ,1 1
O M OM 
30
Goal of Preconditioning: To find coordinate rotation so that1
OM R J  . Then we can
find the minimum in one step!
It turns out that this is true when a = b or a variable transform is performed of x (x' = xb/a
) so that a becomes equal to b  2 2
2
1 '
2
J x y
b
 
.
Lorenc (1997, see also Huang 2000) proposed the following variable transform:x Bv
 
so that the cost function1 11 1
( ) ( ) ( ) ( ( )) ( ( ))
2 2
T T
b b o o
J H H 
     x x x B x x y x R y x
becomes11 1 [ ( ) ] [ ( ) ]
2 2
T T
b o b oJ H Hv v Bv x y R Bv x y
     
Transform 1) eliminated B-1 and 2) improved the conditioning of the minimization (when
B dominates over R).
Reference:
Lorenc, A. C., 1997: Development of an operational variational assimilation scheme. J. Met Soc Japan, 75, 339-346.
31
Physical-space Statistical Analysis Scheme (PSAS)
Da Silva et al (1995) introduced another scheme related to 3D-Var and OI, where the
minimization is performed in the (physical) space of the observations, rather than in the
model space as in the 3D-Var scheme.
They solve the same OI/3D-Var equation (5.8) written as in the OI approach,1
( )( )T T
a o


 x BH R HBH y
(5.12)
but separate it into two steps:1
( )T
o

 w R HBH y
(5.13)
followed by( )T
a
 x BH w
. (5.14)
The first step is the most computing intensive, and is solved by minimization of a cost
function:1
( ) ( )
2
T T T
o
J w w R HBH w w y
  
(5.15)
32
Note that w is a vector of length p, the number of observations. If p is much smaller than
the state vector length n, this is a more efficient method to achieve results similar to those
of 3D-Var.
The exercise in the previous section indicates that the intermediate solution vectorw is
also given by1
( )T
o

 w R HBH y
therefore the w here is the same w in Eq. (5.10). From Eq. (5.10), we havea o
  Rw H x y
1 1 1
( ) [ { ( ) ( )}] ( ( ))o a o b a b o a
H H
   
       w R y H x R y x H x x R y x
, (5.16)
i.e, it is the misfit of the observations to the analysis weighted by the inverse of the
observation covariance matrix.
33
Other 3DVAR topics
3DVAR without inversion of B (see Huang 2000 MWR paper, also Lorenc’s approach
that also does preconditioning)
Huang (2000) used variable transform1
v B x


So that11 1[ ( ) ] [ ( ) ]
2 2
T T
b o b oJ H Hv Bv Bv x y R Bv x y
     
.
This avoids inversion of B in the background term. Such a formulation is used in NCEP
operational DA system GSI although it does not improve the conditioning of the
background term.
Use of filter to model background error covariances
Use explicit Gaussian filter (Huang 2000). Using implicit recursive filter (Lorenc 1992;
Hayden and Purser 1995)
Huang, X.-Y., 2000: Variational analysis using spatial filters. Mon. Wea. Rev., 128, 2588–2600.
Lorenc, A. C., 1992: Iterative analysis using covariance functions and filters. Quart. J. Roy. Met. Soc., 118,
569-591.
34
Hayden, C. M. and R. J. Purser, 1995: Recursive filter objective analysis of meteorological fields: applications
to NESDIS operational processing. J. Appl. Meteor., 34, 3-15.
Anisotropic and/or spatially inhomogeneous background error covariances
Inclusion of equation constraints in the cost function (EC notes)1 11 1
( ) ( ) ( ) ( ( )) ( ( ))
2 2
T T
b b o o c
J H H J 
      x x x B x x y x R y x
- the Jc term.
For example, if we believe the horizontal flow is nearly non-divergence, we can define2
c
u v
J w x y
  
  
  
where w a weight the determines the how strictly this (weak)
constraint is enforced. It’s a weak constraint because this condition is not strictly
enforced.
35
Final comments on the relative advantages between 3D-Var, PSAS and OI
Although 3D-Var, Optimal Interpolation, and PSAS have been shown to formally solve
the same problem, there are important differences in the method of solution.
As indicated before, in practice OI requires introducing a number of approximations, and
solving the analysis locally, grid point by grid point, or small volume by small volume
(Lorenc, 1981). This in turn requires using a "radius of influence" and selecting only the
stations closest to the grid point or volume being analyzed. The background error
covariance matrix has to be also locally approximated.
Despite their formal equivalence, 3D-Var (and the closely related PSAS) has several
important advantages with respect to OI, because the cost function is minimized using
global minimization algorithms, and as a result it makes many of the simplifying
approximations required by OI unnecessary.
No need for data selection and background error localization
In 3D-Var (and PSAS) there is no data selection, all available data are used
simultaneously. This avoids jumpiness in the boundaries between regions that have
selected different observations.
In OI, the background error covariance has been crudely obtained assuming, for example,
separability of the correlation into products of horizontal and vertical Gaussian
correlations, and that the background errors are in geostrophic balance. The background
36
error covariance matrix for 3D-Var, although it may still require simplifying
assumptions, can be defined with a more general, global approach, rather than the local
approximations used in OI.
Easy incorporation of balance constraints
It is possible to add constraints to the cost function without increasing the cost of the
minimization much. For example, Parrish and Derber (1992) included a "penalty" term in
the cost function forcing simultaneously the analysis increments to approximately satisfy
the linear global balance equation. With the global balance equation, the NCEP global
model spin up was reduced by more than an order of magnitude compared to the results
obtained with OI. With the 3D-Var it became unnecessary for the first time to perform a
separate initialization step in the analysis cycle.
The use of nonlinear observation operators
It is possible to incorporate important nonlinear relationships between observed variables
and model variables in the H operator in the minimization of the cost function (1) by
performing "inner" iterations with the linearized H observation operator kept constant
and "outer" iterations in which it is updated. This is harder to do in the OI approach.
The introduction of 3D-Var has allowed 3D variational assimilation of radiances (Derber
and Wu, 1998). In this approach, there is no attempt to perform retrievals, and instead,
each satellite sensor is taken as an independent observation with uncorrelated errors. As a
result, for each satellite observation spot (pixel), even if some channel measurements are
37
rejected because of cloud contamination, others may still be used. In addition, because all
data are assimilated simultaneously, information from one channel at a certain location
can influence the use of satellite data at a different geographical location. The quality
control of the observations becomes easier and more reliable when it is made in the space
of the observations than in the space of the retrievals.
It is possible to include quality control of the observations within the 3D-VAR analysis
(see section 5.8 of Kalnay book)
Cohn et al (1998) have shown that the observation-space form of 3D-Var (PSAS) offers
opportunities, through the grouping of data, to improve the preconditioning of the
problem in an iterative solution.
Because PSAS cost function is formulated in an ‘observation space’, it is difficult to
incorporate equation constraint in PSAS, which is an important disadvantage of PSAS.
For this reason, PSAS or observation space 3DVAR is used much less often (US Navy’s
and NASA’s VAR DA systems are formulated in the observation space).