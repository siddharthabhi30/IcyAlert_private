# Full-text extraction

- Title: Causality-Driven Localization Method for Improving Ensemble-Based Kalman Filters in Strongly Coupled Data Assimilation System
- Year: 2025
- DOI: https://doi.org/10.3389/fmars.2025.1600634
- PDF source: https://www.frontiersin.org/journals/marine-science/articles/10.3389/fmars.2025.1600634/pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

                                                                                                                     TYPE Methods
                                                                                                                     PUBLISHED 04 September 2025
                                                                                                                     DOI 10.3389/fmars.2025.1600634




                                                    Causality-driven localization
OPEN ACCESS                                         method for improving ensemble-
EDITED BY
Andrea Storto,
National Research Council (CNR), Italy
                                                    based Kalman ﬁlters in strongly
REVIEWED BY
Lilian Garcia-Oliva,
                                                    coupled data assimilation system
Barcelona Supercomputing Center, Spain
Luyu Sun,                                           Tian'ao Wang, Xuan Wang*, Lige Cao, Wei Li and Guijun Han
University of Maryland, College Park,
United States                                       Tianjin Key Laboratory for Marine Environmental Research and Service, School of Marine Science and
Kenta Kurosawa,                                     Technology, Tianjin University, Tianjin, China
Chiba University, Japan

*CORRESPONDENCE
Xuan Wang
   xuanwang@tju.edu.cn
                                                    Strongly coupled data assimilation (SCDA) is a critical tool for improving Earth
                                                    system predictions by directly integrating observational data into coupled
RECEIVED 26 March 2025
ACCEPTED 07 August 2025
                                                    numerical models that simulate interactions among atmospheric, oceanic, and
PUBLISHED 04 September 2025                         terrestrial components. However, SCDA faces signiﬁcant challenges, including
CITATION
                                                    high sensitivity to hyperparameters such as localization and difﬁculties in
Wang T, Wang X, Cao L, Li W and Han G               diagnosing cross-component interactions. These challenges can arise in
(2025) Causality-driven localization method         ensemble-based Kalman ﬁlters, a primary category method used in SCDA, due
for improving ensemble-based Kalman ﬁlters
in strongly coupled data assimilation system.       to limited ensemble sizes. This study introduces a novel causality-driven
Front. Mar. Sci. 12:1600634.                        localization method for SCDA utilizing the Liang-Kleeman (LK) information
doi: 10.3389/fmars.2025.1600634
                                                    ﬂow. By transforming the empirical determination of localization parameters,
COPYRIGHT
                                                    as done in the conventional Gaspari-Cohn (G-C) localization method, into a
© 2025 Wang, Wang, Cao, Li and Han. This is
an open-access article distributed under the        quantitative assessment of causal dependence strength, the LK information ﬂow
terms of the Creative Commons Attribution           generates an anisotropic localization method that provides a physically
License (CC BY). The use, distribution or
reproduction in other forums is permitted,
                                                    constrained framework for SCDA. Through twin experiments using the
provided the original author(s) and the             Ensemble Adjustment Kalman Filter (EAKF) based on an intermediate
copyright owner(s) are credited and that the        atmosphere-ocean-land coupled model, the LK-based SCDA is found to
original publication in this journal is cited, in
accordance with accepted academic                   outperform the G-C localization method. The LK method captures variable
practice. No use, distribution or reproduction      heterogeneity, directional asymmetry, and spatial heterogeneity in component
is permitted which does not comply with
                                                    interactions, leading to faster stabilization and more accurate assimilation results,
these terms.
                                                    with these improvements being particularly pronounced in small ensemble sizes.
                                                    These ﬁndings highlight the potential of causality-driven localization to enhance
                                                    the robustness and efﬁciency of SCDA, particularly in complex, multi-
                                                    component systems.




                                                    KEYWORDS

                                                    strongly coupled data assimilation, EAKF, localization, adaptive method, causal analysis




                                                    1 Introduction
                                                        The Earth system represents a complex network of interactions among atmospheric,
                                                    oceanic, and terrestrial components, functioning across various spatial and temporal scales.
                                                    To improve the accuracy of Earth system predictions, coupled data assimilation (CDA) has
                                                    emerged as a pivotal technology. It can integrate observational data into the coupled



Frontiers in Marine Science                                               01                                                            frontiersin.org
Wang et al.                                                                                                                10.3389/fmars.2025.1600634




numerical models that simulate the interactions among different                 effective results in SCDA (Yoshida and Kalnay, 2018; Chang and
components of the Earth system. Unlike conventional data                        Kalnay, 2022; Stanley et al., 2024), the sensitivity of SCDA to
assimilation (DA) methods, which typically focus on a single                    hyperparameters—especially localization—becomes pronounced
component (e.g., atmosphere or ocean), CDA explicitly considers                 under small ensembles (Miwa and Sawada, 2024). Consequently,
the instantaneous interactions and feedback between these                       empirical debugging may compromise the reliability of these
components, leading to more consistent and physically                           methods, posing a signiﬁcant challenge to further improving the
balanced predictions.                                                           performance of SCDA.
     Currently, CDA methodologies are broadly categorized into                       To effectively estimate error covariance among different
two types: Weakly Coupled Data Assimilation (WCDA) and                          components using small ensembles, it is essential to objectively
Strongly Coupled Data Assimilation (SCDA). In WCDA,                             identify the multiscale interactions between various components.
observations are assimilated independently into individual                      Causality analysis, which is regarded as a more rigorous approach
components, with the coupling between components managed                        than correlation for examining interactions among different
externally to the assimilation process. Conversely, SCDA directly               components (Pearl and Mackenzie, 2018), has been successfully
incorporates observations from one component to update the states               applied across diverse ﬁelds such as ecology, economics, and
of other coupled components using the cross-covariance between                  climate science (Stips et al., 2016; Hagan et al., 2019; Lu et al.,
different components. Previous studies have highlighted the distinct            2023). Among the methods of causal analysis, the Liang-Kleeman
advantages possessed by both WCDA and SCDA (Han et al., 2013;                   (LK) information ﬂow method stands out as an innovative approach.
Lu et al., 2015; Goodliff and Penny, 2022). However, when                       Derived from fundamental principles, the LK method effectively
considering the physical processes of the real world, SCDA is                   distinguishes genuine physical interactions from spurious
generally regarded as more advantageous (Sluka et al., 2016;                    covariations, providing a logical framework for inferring causality
Penny et al., 2019; Frolov et al., 2023). Nevertheless, the                     in physical systems (Liang, 2014; Liang et al., 2021). Critically, this
implementation of SCDA presents signiﬁcant challenges,                          causality-based approach is particularly well-suited for coupled
including high computational costs due to the complexity of                     atmosphere-ocean systems, where cross-component inﬂuence is
coupled models and assimilation systems, as well as difﬁculties in              strongly asymmetry. Due to fundamental differences in spatial
diagnosing and correcting errors within individual components.                  scales, adjustment timescales, and energy propagation mechanisms,
Despite these challenges, advancements in computational power                   the inﬂuence footprint of ocean observations (e.g., SST) on the
and assimilation techniques have driven efforts to optimize SCDA                atmosphere often extends over broader or differently shaped
for application in coupled systems.                                             regions than the inﬂuence of atmospheric observations on the
     The Ensemble Kalman Filter (EnKF; Evensen, 1994; 1997; Burgers             ocean. This inherent asymmetry provides a compelling physical
et al., 1998) and its variants are widely employed in SCDA due to their         motivation for employing causality-informed, directionally sensitive
effective balance between computational feasibility and covariance              localization schemes like the one proposed. The LK method’s logical
estimation accuracy. The Ensemble Adjustment Kalman Filter                      and objective nature renders it a valuable tool for SCDA systems by
(EAKF; Anderson, 2001; 2003) is a deterministic variant of the                  leveraging this directional causality. Speciﬁcally, by identifying
EnKF. Unlike the EnKF that applies random perturbations to                      distinct causal regions for ocean-to-atmosphere versus atmosphere-
observations, the EAKF adjusts the ensemble mean and                            to-ocean inﬂuences, robust and physically consistent localization
perturbations through linear transformation to ensure that the                  areas can be determined. This effectively suppresses non-physical
analyzed ensemble satisﬁes the optimal estimation of the Kalman                 correlations while preserving the essential asymmetric coupling
ﬁlter, avoiding additional noise introduced by perturbed observations           mechanisms. Its successful applications in atmosphere-ocean
(Anderson, 2001; 2003). To improve the computational efﬁciency of               analysis studies (Stips et al., 2016; Rong and Liang, 2022)
EnKF and its variants, researchers attempted to reduce the required             underscore its potential for estimating meaningful cross-component
ensemble size by enhancing error covariance estimation techniques.              covariance structures under these complex dynamical interactions.
However, smaller ensembles amplify sampling errors, leading to                       To enhance the accuracy of the SCDA using an ensemble-based
spurious correlations, especially when quantifying cross-component              Kalman ﬁlter, this study proposes a localization method based on
interactions (Anderson, 2007). To address this issue, techniques such as        LK information ﬂow for SCDA. To evaluate the proposed method,
the localization based on the Gaspari-Cohn (G-C) function, the                  we employ an intermediate atmosphere-ocean-land coupled model
empirical localization function, and inﬂation have been widely                  and utilize the EAKF as a case study. The performance of the LK-
implemented, yielding favorable outcomes (Houtekamer and                        based method is assessed through twin experiments and compared
Mitchell, 1998; Houtekamer et al., 2005; Houtekamer and Zhang,                  with the conventional G-C localization method.
2016; Gaspari and Cohn, 1999; Anderson, 2007; Anderson and Lei,                      In this study, Section 2 describes the methods involved, including
2013; Lei and Anderson, 2014a, 2014b). Despite their popularity, most           the EAKF, the G-C function, and the LK information ﬂow-based
of these methods are static and empirically based, making it challenging        localization method. Section 3 presents the numerical model used for
to achieve an objective analysis of interactions among different                testing and the design of the twin experiments. The results are
components in complex systems. Although some empirical and                      detailed in Section 4, followed by a discussion in Section 5, and
correlation-based localization methods have recently demonstrated               concluded in Section 6.




Frontiers in Marine Science                                                02                                                            frontiersin.org
Wang et al.                                                                                                                              10.3389/fmars.2025.1600634




2 Methodology                                                                                2.2 LK information ﬂow-based localization
                                                                                             method for SCDA
2.1 Description of EAKF and G-C function
                                                                                                 LK information ﬂow, proposed by Liang and Kleeman (Liang
    The EAKF (Anderson, 2001, 2003), as a variant of the EnKF,                               and Kleeman, 2005), is an information-theoretic method for causal
incorporates the observation error into the ensemble adjustment.                             analysis. It investigates the potential information transfer processes
Under the assumption that observation errors are uncorrelated, the                           between components, quantifying their causality by calculating
EAKF can sequentially assimilate observations. The implementation                            information ﬂow values to determine the strength of one
of the EAKF for observation yo can be summarized by the following                            component’s causal inﬂuence on another. Unlike conventional
two steps:                                                                                   correlation analysis, the LK information ﬂow is a method for
    First, the observational increment Dyi can be calculated using                           calculating causality. Liang (2014) strictly proved that causality
Equation 1:                                                                                  necessarily implies a correlation, but correlation does not
                                         sﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ !                             necessarily imply a causality. Therefore, the LK information ﬂow
                 p
           (sy )2                                 r2                p                        has the potential to remove spurious correlations.
   Dyi = 2       p (y −                                      − 1 (yi − yp ) ,
                     o
                        yp ) +                          p                         (1)
        r + (sy )2                        r 2 + (sy )2                                           To explore causality between two components, the information
                                                               p
                                                                                             ﬂow between them can be calculated using their time series
    where i represents the ensemble member; yi denotes the ith                               according to Equation 5 (Liang, 2014).
prior ensemble member of yo , which is usually computed by
interpolating the ith prior ensemble member of a state variable to                                                       C11 C12 C1,d1 − C12
                                                                                                                                          2
                                                                                                                                             C1,d1
                                    p                                                                           T2→1 =                                            (5)
the observation location, yp and sy represent the prior ensemble                                                           C11 C22 − C11 C12
                                                                                                                              2              2
                                      p
mean and standard deviation of yi , respectively, which can be
                    p                                                                            where T2→1 represents the ﬂow of information from variable 2
calculated from yi , and r denotes the standard deviation of
                                                                                             to variable 1, C represents the covariance between the two variables,
observation error.
                                                                                             and C1,d1 represents the covariance of the Eulerian priors of variable
    Second, the observational increment calculated above can be
                                                                                             1 with itself. If T2→1 is not equal to zero and it successfully passes
projected to each model grid according to Equation 2:
                                                                                             the signiﬁcance test, then variable 2 can be considered a causal
                                             p
                                        covj,y                                               factor of variable 1. For more details regarding the signiﬁcance test,
                              Dxi,j =     p Dyi ,                                 (2)        please refer to Liang (2014).
                                        (sy )2
                                                                                                 As mentioned above, LK information ﬂow quantiﬁes the process
     where Dxi,j represents the state increment of jth state variable                        of information transmission, facilitating the determination of
                                     p
for the ith ensemble member, covj,y is the prior error covariance                            causality between two variables and elucidating the direction of this
                  o
between xi and y .                                                                           causality. This approach addresses the limitations of the G-C function
     However, accurately estimating the correlation between state                            in applications related to SCDA and supports the development of
variables and remote observations is challenging with a limited                              various localization methods tailored to different components. It
ensemble size. To reduce the inﬂuence of spurious correlations                               should be noted that the LK information ﬂow used in this study is
between observation and state variables, Gaspari and Cohn (1999)                             calculated from sufﬁciently long time series prior to DA, and it is
employ the localization factor rj,y , Equation 2 can be updated as                           assumed that the causal relationships derived from the LK
follows:                                                                                     information ﬂow remain unchanged during the DA process.
                                                 p
                                                                                             Therefore, the LK information ﬂow-based localization method also
                                           covj,y                                            remains ﬁxed throughout the entire assimilation. Speciﬁcally, the
                            Dxi,j = rj,y     p       Dyi ,                        (3)
                                           (sy )2                                            steps involved in the LK information ﬂow-based localization method
                                                                                             for a single ‘State variable (i)’ are shown in Figure 1. Initially, the
    where rj,y represents the localization factor between the state                          Equation 5 is used to sequentially calculate the LK information ﬂow
variable xj and the observation yo , the factor is determined using the                      from observations to ‘State variable (i)’, retaining only those
G-C function as illustrated in Equation 4 (Gaspari and Cohn, 1999).                          observations that meet the signiﬁcance test criteria. Subsequently,
       8 1 b 5 1 b 4 5 b 3 5 b 2                                                             the maximum distance ‘a’ is derived, representing the furthest
       >
       > − ( ) + 2 ( a ) + 8 ( a ) − 3 ( a ) + 1,                        0≤b≤a
       < 4 a                                                                                 distance between the grid point of state variable (i) and the
                       b                                             −1
 rj,y = 12 ( a ) − 2 ( a ) + 8 ( a ) − 3 ( a ) − 5( a ) + 4 − 3 ( a ) , a ≤ b ≤ 2a
         1   b  5  1      4  5   b  3  5   b  2     b         2   b
       >
       >                                                                                     observation points that successfully pass the LK information ﬂow
       :
         0,                                                                b > 2a
                                                                                             signiﬁcance test. In this localization framework, distance ‘a’ signiﬁes
                                                                                  (4)
                                                                                             the maximum range at which observations can inﬂuence the state
    where b represents the spatial distance between the state                                variable (i). Ultimately, this distance is utilized to assign weights to
variable xj and the observation yo , and a represents the maximum                            these observations through the G-C function. By repeating this
radius within which an observation yo can affect. In this study, a is                        process, the LK information ﬂow-based localization method for any
also referred to as the optimal inﬂuence radius.                                             state variable can be effectively implemented. The distinct




Frontiers in Marine Science                                                             03                                                             frontiersin.org
Wang et al.                                                                                                                           10.3389/fmars.2025.1600634




   FIGURE 1
   LK information ﬂow-based localization method for single ‘state variable (i)’.




information ﬂow between observations and state variables can be                          method designed to simulate the interactions among the
estimated for each ensemble result. Their intersection serves as the                     atmosphere, ocean, and land. All three model components adopt
foundation for deﬁning the localization area. Consequently, Equation                     64 × 54 Gaussian grid.
3 can be reformulated as follows:                                                            The atmospheric component is represented by a global spectral
                                 p
                                                 (                                       barotropic model as shown in Equation 7, which employs the
                             covj,y                  0, Tobs(i)→grid(j) = 0              potential vorticity conservation equation, while accounting for the
        Dxi,j = IFj,i rj,y     p Dyi , IFj,i =                                (6)
                             (sy )2                  1, Tobs(i)→grid(j) ≠ 0              nonlinear effects of vorticity advection.
                                                                                                                       (
    where IFj,i , represents the information ﬂow from the ith                                        ∂q                    l(To − my ) ocean surface
observation to the jth model grid, which can be treated as a                                            + J(y , q) =                                             (7)
                                                                                                     ∂t                    l(Tl − my ) land surface
binary ﬁlter.
                                                                                                                         df
    The LK information ﬂow is utilized in the SCDA to not only                               where q = by + m2 y , b = dy   , f denotes the Coriolis parameter, y
identify the localization range but also quantify the maximum                            represents the northward meridional distance from the equator, J( · )
distance ‘a’ where a causal link is formed. Through the                                  represents the Jacobian operator, y represents the geostrophic
integration with G-C function, a non-empirical localization range                        atmosphere stream-function, l is the ﬂux coefﬁcient from the
that inherently reﬂects causality can be identiﬁed based on                              ocean (land) to the atmosphere, To and Tl denote sea surface
information ﬂow analysis, and the corresponding adjusting                                temperature (SST) and land surface temperature (LST) respectively,
parameter ‘a’can provide adaptive weights based on the G-                                and m is a scale factor that converts stream-function to temperature.
C function.                                                                                  The ocean is represented by a 1.5-layer baroclinic ocean model
                                                                                         shown in Equation 8, which incorporates a slab mixed layer and
                                                                                         simulates upwelling through a stream-function equation.
                                                                                         8
3 Numerical model and twin                                                               <                  ∂      j          ∂
                                                                                                           ∂ t ( − L20 ) + b ∂ x j = g m y − Kq m j
                                                                                                                                        2        2

experiment                                                                               : ∂ To + u ∂ To + v ∂ To − K j = −K T + A m2 T + s(t, t) + C (T − my )
                                                                                            ∂t       ∂x       ∂y     h      T o   T    o             o o

                                                                                                                                                                 (8)
3.1 Intermediate atmosphere-ocean-land                                                                                                          0
coupled model                                                                                where j is the oceanic stream-function, L20 = fg2 h0 is the oceanic
                                                                                         deformation radius, g 0 is the reduced gravity and h0 is the mean
     The intermediate atmosphere-ocean-land coupled model (Wu                            thermocline depth, g is the momentum coupling coefﬁcient
et al., 2012) utilized in this study comprises three main components:                    between the atmosphere and the ocean, Kq is the horizontal
a global spectral barotropic atmospheric model, a 1.5-layer                              diffusion coefﬁcient of the oceanic stream-function, KT and AT
baroclinic ocean model, and a simpliﬁed land model. These                                are the damping and horizontal diffusion coefﬁcients of sea surface
components are interconnected through a speciﬁc coupling                                 temperature (SST), respectively, Kh = KT  k  gf 0 represents the



Frontiers in Marine Science                                                         04                                                                frontiersin.org
Wang et al.                                                                                                                  10.3389/fmars.2025.1600634




intensity of upwelling, k is the ratio of upwelling to damping, Co is              deviation of 106 m2 s−1 for y, 102 m2 s−1 for j and 1 K for To, and
the ﬂux coefﬁcient from the atmosphere to the ocean s(t, t) is the                 Tl is added as observation errors on the 64×54 Gaussian grid to
solar radiation forcing that introduces the seasonal cycle.                        generate ‘observations’ (Figure 2), where these error magnitudes are
    The land is modeled using a simple linear approach that                        set to 4% of the global mean natural variability. The sampling
simulates the evolution of land surface temperature as illustrated                 frequencies are 6 hour for y and 1 day for j, To, and Tl ﬁelds, due to
in Equation 9.                                                                     distinct temporal scale of different components.
                                                                                        In this experimental framework, the EAKF is employed to
              ∂ Tl
         m         = −KL Tl + AL m2 Tl + s(t, t) + Cl (Tl − my )       (9)         conduct a 5-year state estimation experiment, with the evaluation
               ∂t
                                                                                   of results based on the last 5 years of the biased model. As
     where m represents the ratio of heat capacity between the land                summarized in Table 1, the assimilated variables include y, j, To,
and the ocean mixed layer, KL and AL are damping and diffusive                     and Tl. The assimilation processes for y, j, and To not only
coefﬁcients, respectively, and Cl denotes the ﬂux coefﬁcient from the              leveraged their own respective observations but also integrated
atmosphere to the land.                                                            cross-component observations from the other two variables. In
     The atmospheric model is coupled with the ocean model through                 contrast, the Tl is solely assimilated using its own observations
ﬂux terms that represent exchanges at both oceanic and terrestrial                 because it is simulated through a relatively simple and semi-
surfaces. These ﬂux terms are integrated into the potential vorticity              independent structure, which results in weak coupling
conservation equation. The ocean model provides feedback to the                    interactions with other components. The biased model is
atmospheric model via its stream-function equation and heat ﬂux                    initialized for a 50-year period to generate the biased initial states
terms, which characterize energy and momentum exchanges between                    of Z1 = (y 1 , j 1 , To1 , Tl1 ). The ensemble initial states of y are
the ocean and the atmosphere. Furthermore, the ocean model is                      produced by superimposing a Gaussian white noise (with a
coupled with the land model through heat ﬂux terms that describe                   standard deviation of 106 m2 s−1 ) on y 1 , whilej, To, and Tl
energy exchange between the ocean and the land. The land model,                    remain unchanged. The inﬂation method adopts the adaptive
represented by a simple linear equation, simulates the evolution of land           inﬂation algorithm proposed by Anderson (2007). To facilitate a
surface temperature and incorporates feedback from the land surface                comparison with the localization method based on LK information
to the atmospheric model by accounting for heat exchange between the               ﬂow, the optimal local radii in conventional G-C for y and Tl are set
atmosphere and the land surface. All three model components-the                    at 1,500 and 1,000 km, respectively. The optimal local radius for
atmosphere, ocean, and land-utilize the same 64 × 54 Gaussian grid                 both j and To is deﬁned as 1,000 km × cos [min (latitude, 60)],
and are solved using the Leapfrog time integration method with a half-             following the study outlined according to Cao et al. (2024). The
hour time step. An Asselin-Robert time ﬁlter is introduced to suppress             sensitivity of the LK method to ensemble size is evaluated using
spurious computational modes that arise from the Leapfrog time                     conﬁgurations N = [5, 10, 20, 30, 40], with speciﬁc analysis focused
integration. Additional information regarding the coupled model,                   on the N=20 case.
including default parameter settings, can be found in Wu et al. (2012).                 The proposed LK information ﬂow-based localization method
                                                                                   is tested within the twin experiment. To evaluate its effectiveness
                                                                                   and assess the differences between causal and correlational effects
3.2 The twin experiment design                                                     on assimilation, the assimilation results are compared with those
                                                                                   based on the conventional G-C method in SCDA system. Since an
    To validate the effectiveness of the proposed method, we                       optimized localization can accurately reﬂect the complex
conducted twin experiments to ensure experimental stability and                    relationships between components and enhance the effectiveness
mitigate performance evaluation errors arising from uncontrolled                   of SCDA, the localization results will thus be discussed ﬁrst in the
data uncertainty.                                                                  next section.
    The true model is ﬁrst created to serve as the baseline system
and then used to generate a biased version and an observation
system. This true model is initialized with climatological averages                4 Results
Z0 = (y 0 , j 0 , To0 , Tl0 ), and executes a 55-year integration, with the
ﬁrst 50 years serving as spin-up and the ﬁnal 5-year outputs                           The localization results estimated using the LK information
constituting the true value. To evaluate the assimilation                          ﬂow are compared with the optimal localization radius obtained
performance, parameter biases (1.1 times the true values) are                      from the G-C method, followed by an analysis of their
introduced to establish the biased model. The model’s outputs                      corresponding SCDA results. For the LK information ﬂow
provide the prior estimates for subsequent analysis. In this                       estimation, a time series consisting of 9600 output times is
conﬁguration, the systematic errors arise from perturbations in                    selected to ensure both efﬁciency and effectiveness. This length is
model parameters. Same as the true model, the biased model is also                 chosen because a time series that is too short may not satisfy the
initialized with Z0 = (y 0 , j 0 , To0 , Tl0 ), and executes a 50-year             fundamental assumption of ergodicity, potentially leading to
integration as spin-up. Following previous studies (Wu et al.,                     inaccurate results, whereas an excessively long time series would
2012; Cao et al., 2024), Gaussian white noise with a standard                      increase the consumption of computational resources.




Frontiers in Marine Science                                                   05                                                           frontiersin.org
Wang et al.                                                                                                                   10.3389/fmars.2025.1600634




   FIGURE 2
   Location of observations, j/To (blue “+”), Tl (brown “+”), y (all “+”).




4.1 The localization results                                                      from that calculated from y to To. This ﬁnding underscores that the
                                                                                  inﬂuence range of one variable on each of the other variables varies
    The localization results based on LK information ﬂow in SCDA                  at the same point. The LK information ﬂow effectively captures this
are calculated using Equation 5. Where Tobs(i)→grid(j) is estimated               variable heterogeneity, highlighting the differing inﬂuence ranges of
based on the time series from the observation at the ith point to the             a variable across multiple variables, which is particularly critical in
state at the jth point with a signiﬁcance test conducted. Liang (2008)            multi-component systems like SCDA.
pointed out that the values of LK information ﬂow in this context                      To investigate the directional relationship between the two
are not directly comparable. Therefore, this study focuses solely on              variables, Figure 3c presents the estimated inﬂuence range based
the existence of LK information ﬂow.                                              on LK information ﬂow from j to y at the same point. In contrast
    Since constructing LK information ﬂow-based localization                      to Figure 3a, the weights between the same variable pair y and j
method requires utilizing the area of LK information ﬂow shown                    exhibit a distinct pattern and range when considering the inherent
in Figure 3, this result was generated before the ﬁrst DA cycle. In               causal direction. This observation suggests that even for the same
Figure 3, two grid points were selected for demonstration. The ﬁrst               pair of variables, accounting for the directionality of causal
point is located in the tropical Paciﬁc Ocean, a region dominated by              interactions reveals asymmetric inﬂuence: the y at point A may
El Niño–Southern Oscillation (ENSO) dynamics. The second point                    signiﬁcantly drive the j at point B, whereas j at this point of B does
resides in the South Paciﬁc, an area inﬂuenced by the Antarctic                   not necessarily exert an equivalent inﬂuence on y at A. If their
Circumpolar Current (ACC) and prevailing westerlies. While air–                   inﬂuences were symmetric, Figures 3a and c would depict identical
sea interactions at both locations exhibit high activity and intrinsic            inﬂuence ranges—a phenomenon that is rarely observed in practice.
asymmetry, their underlying physical drivers differ signiﬁcantly.                 This directional asymmetry is often overlooked by conventional
Figure 3a illustrates the existence range of LK information ﬂow                   correlation analysis, which assumes relationships to be undirected
from y to j, demonstrating the inﬂuence range of y on j. To                       and homogeneous. The same ﬁnding can also be observed in
compare the inﬂuence of the same variable on other variables at the               Figure 3d, which illustrates the area and value of LK information
same point, the existing range of LK information ﬂow from y to To                 ﬂow from To (sea surface temperature) to y (atmosphere stream-
is presented in Figure 3b. This indicates that the inﬂuence range of              function) at the same grid point as in Figure 3b.
LK information ﬂow calculated from y to j at the same point differs                    To investigate whether the relationship between the same two
                                                                                  variables exhibits different variations across different points,
                                                                                  Figure 2 in supplementary plots the inﬂuence range estimated
TABLE 1 The SCDA schemes.
                                                                                  based on LK information ﬂow from y to j at another point. It
         State variables                           Observations                   shows that the ranges to which y at two distinct points inﬂuence j
                                                                                  are drastically different. This indicates that the intrinsic relationship
    y (Atmosphere stream-function)                    y, j, and To
                                                                                  between variables manifests uniquely at each point, exhibiting
      j (Oceanic stream-function)                     j, y, and To                spatial heterogeneity. This spatial heterogeneity underscores the
      To (Sea surface temperature)                    To, y, and j
                                                                                  unique advantages of causal analysis.
                                                                                       As demonstrated by the results, the relationship between the
     Tl(Land surface temperature)                          Tl
                                                                                  two components exhibits variable heterogeneity, directional



Frontiers in Marine Science                                                  06                                                              frontiersin.org
Wang et al.                                                                                                                 10.3389/fmars.2025.1600634




   FIGURE 3
   An example of the area and value of LK information ﬂow from (a) y (atmosphere stream-function) to j (oceanic stream-function), (b) y to To (sea
   surface temperature), (c) j to y and (d) To to y. Where “C” (black) represents the model grid; The value of LK information in this ﬁgure has all
   undergone logarithmic transformation.




asymmetry, and spatial heterogeneity—characteristics clearly                    at the target point, and therefore cannot be employed to update the
identiﬁed and analyzed through the LK information ﬂow. This                     state variables at this location. Moreover, some observations,
demonstrates the strengths of causal analysis. Through a                        despite being distant and outside the optimal localization radius
comprehensive analysis of these relationships among components,                 of the G-C, are used to update the states at the target point due to
we facilitate an accurate estimation of the cross-component                     their direct causality with the variables requiring updates.
localization parameter, which plays a crucial role in SCDA.                          Similar ﬁndings can be observed between Figures 4c and d,
    Based on the analysis of the causality between two components,              where the localization results for the observation of y used to
the observational information at a speciﬁc point can affect certain             update the state variable j at the same point are presented. Notably,
aspects of the surrounding model state ﬁeld. Considering its                    for the same observation information of y, when the state variables
application in the DA process for coupled systems, the                          that require updating at this computational grid point change, the
localization area and weights can be estimated based on the range               corresponding localization range and weights also vary. This further
and corresponding magnitude of observations that inﬂuence the                   indicates that, when updating state variables at a speciﬁc point, the
update of a state variable at a computational grid point as calculated          observation area required for assimilation is not necessarily
according to Equation 6.                                                        identical for different state variables based on the same observed
    As with Figure 3, the two representative grid points shown in               information. In other words, each state variable in the assimilation
Figure 4 are respectively situated in the ENSO-dominated tropical               process, even when located at the same computational grid point,
Paciﬁc Ocean, and the South Paciﬁc region modulated by the ACC                  necessitates distinct regions and weights of observational
and prevailing westerlies. Figure 4b illustrates the inﬂuence range             information, reﬂecting the uniqueness of the variable. This
and corresponding weights from the observation of y to the state                uniqueness is challenging to capture using the G-C method.
variable To at this point, indicating the localization range for the            Conversely, the LK information ﬂow-based localization method
state variable. For comparison, the same localization results based             effectively distinguishes the varying degrees of inﬂuence that the
on G-C estimation at the same grid point are presented in Figure 4a.            same observation exerts on different state variables. This capability
As shown, the localization area in Figure 4a appears as a region with           is particularly crucial for coupled systems, such as atmosphere-
a ﬁxed radius. The G-C method determines the optimal localization               ocean-land models.
radius through empirical trials. In contrast, the localization results               In comparison with Figures 4c and d, the impact of the
estimated by LK information ﬂow exhibit irregular variation (non-               observation y on updating the state variable j at another
isotropic). This indicates a discrepancy between the areas estimated            computational grid is illustrated in Figures 4e and f. The results
by the two methods. This means that in the assimilation process to              of the LK information ﬂow analysis indicate that when identical
update the y at the target point, observations of To at certain points,         observations are employed to update the same state variable, both
although utilized based on the G-C localization, are actually not               the range of required observations and their corresponding weights
used according to LK information ﬂow analysis. Because, according               vary according to changes in the computational grid points. This
to the judgment of LK information ﬂow, the observations from                    ﬁnding suggests that the LK information ﬂow-based localization
these points are not deemed to have a direct relationship with the y            method effectively differentiates the magnitude of inﬂuence exerted



Frontiers in Marine Science                                                07                                                              frontiersin.org
Wang et al.                                                                                                                      10.3389/fmars.2025.1600634




   FIGURE 4
   An example of the localization based on the G-C method (a, c, e) and LK information ﬂow-based localization method (b, d, f), which use the
   observation of y (atmosphere stream-function) to update state variables To (sea surface temperature) (a, b) and j (oceanic stream-function) (c–f).
   Where “+” (black) represents the location of the state variable, (a–d) are the same model grid point, while (e, f) are another grid point.




by observation data on the state variable at various locations. Such             (RMSEi,j ) over the last year, as deﬁned in Equation 11.
spatial heterogeneity may reﬂect the distinct localized physical                                               qﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
                                                                                                1
                                                                                                    o i=1 oj=1           − yi,j,s    ) ; s = 1, …, 21600 ,
                                                                                                      I    J        a           true 2
environments and dynamic mechanisms surrounding each grid                          RMSEs =                      (yi,j,s                                     (10)
                                                                                               I *J
point, which cannot be captured by the G-C method that enforces
uniform inﬂuence patterns across all grid points.                                     where I and J represent the number of rows and columns,
    Overall, when updating a state variable, the LK information                  respectively, within the model grid, yi,j,s
                                                                                                                        a          true
                                                                                                                              and yi,j,s represent the
ﬂow method, in contrast to the G-C method which assumes                          ensemble mean of the variables and true value at the (i,j) grid point
isotropic relationships between state variables and surrounding                  at time s, respectively.
observations, can identify and select the relevant range and
                                                                                               1 S qﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
                                                                                               S os=1
weight of correlated observations for each state variable at each                  RMSEi,j =             a
                                                                                                      (yi,j,s − yi,j,s
                                                                                                                   true 2
                                                                                                                         ) , i = 1, …, 64; j = 1, …54,       (11)
computational grid. As noted by Gaspari and Cohn (1999), the
correlations of geophysical ﬁelds rarely exhibit such special                        where S represents the number of time steps.
symmetries. Thus, this anisotropy may align more closely with                        The spatially averaged RMSE at each time step obtained from
physical laws and contribute to the advancement of SCDA.                         the twin experiment based on localization of the LK information
                                                                                 ﬂow localization method is depicted as the orange line in Figure 5.
                                                                                 Figures 5a–d illustrate the assimilation results for y, j, To, and Tl,
4.2 Assimilation results with 20 ensembles                                       respectively. For comparison, the DA results based on G-C
                                                                                 localization are represented in the blue line. It can be observed
    Based on the aforementioned localization estimation, the SCDA                that the assimilation results based on G-C localization stabilize at
was conducted, and the results were statistically assessed using the             approximately 0.8 to 1 year. In contrast, when considering the LK
spatially averaged root mean square error (RMSEs ) as deﬁned in                  information ﬂow for localization, the updated y, j, and To align
Equation 10, and the temporally averaged root mean square error                  more closely with the true values, with the presented error


Frontiers in Marine Science                                                 08                                                                    frontiersin.org
Wang et al.                                                                                                                           10.3389/fmars.2025.1600634




   FIGURE 5
   Spatially averaged RMSE time series based on LK information ﬂow-based localization method and G-C method. Variables shown are the (a) y
   (atmosphere stream-function, m2 s−1 ), (b) j (oceanic stream-function, m2 s−1 ), (c) To (sea surface temperature, K) and (d) Tl (land surface temperature, K).




decreasing within half a year. Notably, for y, the assimilated result                 j demonstrate a decreasing trend from the equator to the poles. In
based on the localization of LK information ﬂow exhibits an error of                  contrast, the RMSE of the assimilation results for To is more evenly
2.36×105 m2 s−1 , which is 5% lower than that obtained through G-C                    distributed globally. The spatial error patterns in the assimilation
localization. In the case of To, the error is further suppressed to                   results stem from the biased model used in this study. Speciﬁcally,
0.28 K, a 22% reduction relative to the G-C. j exhibits the most                      parameter perturbations introduced systematic biases, which vary
pronounced enhancement: its error decreases from 61 m2 s−1 under                      across variables and regions due to their differential sensitivity to
G-C localization to 29 m2 s−1 with the LK method, achieving a 51%                     parameters (Wu et al., 2012). Furthermore, the geographical
improvement. Regarding the assimilation results for Tl shown in                       sensitivity of the parameters leads to different magnitudes of bias
Figure 5d, both experiments yield consistent outcomes. As indicated                   for the same variable across different regions. As a systematic bias
in Table 1, it is important to note that the state variable Tl is updated             caused by parameter perturbations, it can only be corrected through
solely by assimilating observations of Tl itself. Since only the                      parameter optimization. The characteristics of the distributions
information from a single observed element is considered in                           presented in the three plots of our experimental results are caused
relation to the corresponding state variable at the assimilated grid                  by systematic bias and do not fall within the scope of correction in
point. Consequently, the inﬂuence of surrounding observed                             this state ﬁeld estimation test. Therefore, it is more valuable to focus
information on the assimilated point is likely to exhibit a                           on the error differences in the assimilation results compared to
homogeneous variation concerning distance. Therefore, the two                         another G-C-based localization method.
localization methods are likely to yield similar results in estimating                    The percentage error reduction achieved by the LK localization
their relationship, thus resulting in no signiﬁcant differences in the                relative to the G-C method (calculated as (e_LK – e_GC)/e_GC ×
assimilation outcomes.                                                                100%) is illustrated in Figures 6b, d and f. It is evident that the
    Overall, the observational information required for updating                      assimilation results derived from the LK information ﬂow method
each computational grid is typically inhomogeneous, both spatially                    exhibit a signiﬁcant reduction in error across this simulation region
and in relation to speciﬁc variables, particularly when transferring                  when compared to those obtained from the G-C method. This
information across components. Consequently, the LK information                       ﬁnding suggests that the LK information ﬂow-based localization
ﬂow-based SCDA demonstrates faster stabilization and more                             method enhances the assimilation results, both under high-
convincing performance.                                                               resolution observational data in the polar regions and low-
    To further illustrate the spatial variation of the assimilation                   resolution observational data in the equatorial region, thereby
results, the RMSE averaged over the ﬁnal year after the system                        demonstrating the universality of the LK method. Notably, the
reaches a stable state is analyzed for the SCDA based on LK                           assimilation results for j reveal a substantial decrease in error in the
information methods for y, j, and To are shown in Figures 6a, c                       Southern Ocean region following localization via the LK
and e, respectively. As observed, the assimilated RMSE for y                          information ﬂow. This outcome indicates that the LK information
exhibits higher values in land areas depicted in Figure 6a.                           ﬂow analysis effectively ﬁlters out spurious correlations between j
Figure 6c illustrates that the errors in the assimilation results for                 and other components in this region while preserving the



Frontiers in Marine Science                                                      09                                                                   frontiersin.org
Wang et al.                                                                                                                        10.3389/fmars.2025.1600634




   FIGURE 6
   Temporally averaged RMSE (the ﬁnal year) based on LK information ﬂow-based localization method (a, c, e) and the percentage error reduction
   achieved by the LK localization relative to the G-C method, calculated as (e_LK – e_GC)/e_GC × 100% (b, d, f). Variables shown are the (a, b) y
   (atmosphere stream-function, m2 s−1 ), (c, d) j (oceanic stream-function, m2 s−1 ), (e, f) To (sea surface temperature, K).




fundamental coupling mechanisms and integrating causally related                        increasing ensemble size under both localization schemes. The G-C
observational information into the assimilation process, resulting in                   method exhibits greater sensitivity to ensemble size than the LK
a marked improvement in assimilation effectiveness.                                     method, demonstrating a more rapid error reduction. This occurs
                                                                                        because larger ensembles effectively mitigate the impact of spurious
                                                                                        correlations. However, the intrinsic ability of the LK method to
4.3 Ensemble size sensitivity test                                                      suppress spurious correlations attenuates the error-reducing effect of
                                                                                        increased ensemble size. Notably, even at larger ensemble sizes, the
    Robustness evaluation of the LK localization method across                          G-C method yields higher errors than the LK method at equivalent
ensemble size variations was conducted via dedicated sensitivity                        ensemble sizes, though the performance gap between the two
analysis, systematically testing conﬁgurations encompassing N = [5,                     methods narrows as the ensemble size increases. Crucially, ﬁlter
10, 20, 30, 40]. The results were statistically assessed using the                      divergence occurs when using the G-C method at an ensemble size of
spatial-temporal average RMSE and associated standard deviation                         5, while the LK method maintains stability—albeit with larger errors.
over the last year, as deﬁned in Equations 12 and 13.                                   This indicates that although the LK method effectively reduces errors
                                                                                        for small ensemble sizes, its capability to suppress spurious
                       1 S
                       S os=1
              RMSE =          RMSEs , s = 1, …, 21600 ,                     (12)        correlations is signiﬁcantly diminished under extremely small
                                                                                        ensembles (e.g., N=5) due to severely limited information availability.
                       rﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃﬃ
                        1 S
                        S os=1
                  z=                 (RMSEs − RMSE)2 ;                      (13)
                                                                                        5 Discussion
    Where, RMSEs represents spatially averaged RMSE, as deﬁned
in Equation 10; z represents the standard deviation.                                        Prior studies have highlighted both the signiﬁcance and the
    The result of the ensemble size sensitivity test is shown in                        challenges associated with implementing SCDA. In this study, we
Figure 7. Figures 7a–c respectively display the Spatial-temporal                        seek to diagnose and identify the inherent relationships between two
average RMSE and associated standard deviations for variables y,                        components to adjust the assimilation process in a coupled system. The
j, and To using both localization methods across multiple ensemble                      LK information ﬂow analysis was employed to assess relationships not
sizes. It is observed that errors for all variables decrease with                       only among various variables but also between observation and state



Frontiers in Marine Science                                                        10                                                            frontiersin.org
Wang et al.                                                                                                                10.3389/fmars.2025.1600634




                                                                                demonstrate that the LK method’s advantages are particularly
                                                                                pronounced in small ensembles (e.g., ensemble size of 5, 10, and 20).
                                                                                When the G-C method optimizes the inﬂuence radius of observational
                                                                                information, it assumes isotropic among internal components, often
                                                                                neglecting variable–speciﬁc directional couplings and scale disparities
                                                                                between components (as shown in Figure 3). In contrast, the LK
                                                                                method not only utilizes observations beyond the empirical radius
                                                                                deﬁned by the G-C method but also eliminates non-causal statistical
                                                                                noise within the G-C optimized range, thereby avoiding ﬁlter
                                                                                divergence observed in G-C at N=5 (Figure 7) and resulting in LK
                                                                                method-based SCDA stabilizing more quickly and achieving
                                                                                greater accuracy.
                                                                                     These ﬁndings further conﬁrm that one factor limiting the
                                                                                improvement of SCDA performance is its high sensitivity to
                                                                                hyperparameters, such as localization (Miwa and Sawada, 2024).
                                                                                Speciﬁcally, when the ensemble size is small, SCDA’s performance
                                                                                becomes more vulnerable to variations in hyperparameters. This
                                                                                highlights the practical necessity of accurately estimating SCDA’s
                                                                                hyperparameters to ensure better performance. Grounded in causal
                                                                                analysis theory, the LK method reframes the empirical determination
                                                                                of localization parameters as a quantitative assessment of causal
                                                                                dependence strength. This establishes a physically constrained
                                                                                framework for determining localization parameters, thereby
                                                                                enhancing the robustness of SCDA.
                                                                                     Our study was conducted based on twin experiments of an ideal
                                                                                model. Further research is needed to determine whether the LK
                                                                                method can be extended to real-world assimilation systems. In
                                                                                practice, for coupled assimilation systems, the primary challenges
                                                                                arise from the larger number of components that must be managed,
                                                                                the stronger nonlinear characteristics, and the more irregularity of
                                                                                observational information. The LK method’s ability to identify causality
                                                                                among components is particularly advantageous for ﬁltering out
                                                                                consistent information in complex coupled systems, thereby avoiding
                                                                                interference among components. Regarding the irregular features that
                                                                                may exist in observational data, such as resolution or uncertainty, the
                                                                                LK method requires only the time series from the observation positions
                                                                                with no speciﬁc resolution requirements. Noisy observations can also
                                                                                be screened and eliminated. Furthermore, earlier studies have shown
                                                                                that LK information ﬂow maintains its capacity to accurately determine
                                                                                causality even within highly nonlinear systems (Liang, 2014) and
                                                                                demonstrates strong robustness in high-noise environments (Zhou
                                                                                et al., 2024). Therefore, we believe that the application of LK
   FIGURE 7
   Spatial-temporal average RMSE and standard deviation of last 1 year          information-based SCDA will also show stable and convincing
   based on G-C and LK method. Variables shown are the (a) y                    performance in practical trials.
   (atmosphere stream-function, m2 s−1 ), (b) j (oceanic stream-
   function, m2 s−1 ), (c) To (sea surface temperature, K).


                                                                                6 Conclusions
variables, as well as information across different geographic locations.
One interesting ﬁnding is that different state variables respond to                 This study proposes a causality-driven adaptive localization method,
observed information in distinct and directional ways. Additionally, the        termed the LK information ﬂow localization method, aimed at
effect of observational information on a state variable is characterized        enhancing SCDA by addressing critical challenges such as sensitivity
differently across geographic locations. These insights are revealed            to hyperparameters and spurious correlations in cross-component
through causality analysis using the LK information ﬂow method,                 interactions. By leveraging causality analysis, the LK method offers a
which offers capabilities beyond conventional G-C optimization based            physically constrained framework for localization, facilitating more
on correlation analysis. Critically, ensemble size sensitivity tests            accurate and efﬁcient assimilation of observational data across coupled



Frontiers in Marine Science                                                11                                                             frontiersin.org
Wang et al.                                                                                                                   10.3389/fmars.2025.1600634




systems. By integrating the LK information ﬂow with the EAKF within                Author contributions
an intermediate atmosphere–ocean–land coupled model, our results
reveal that the LK-based SCDA effectively captures variable                           TW: Writing – original draft, Writing – review & editing. XW:
heterogeneity, directional asymmetry, and spatial heterogeneity in                 Writing – review & editing. LC: Writing – review & editing. WL:
component interactions, which are often overlooked by conventional                 Writing – review & editing. GH: Writing – review & editing.
correlation-based methods like conventional G-C localization. These
capabilities enable the LK method to ﬁlter out non-causal statistical noise
and utilize observations beyond the empirical radius of G-C, resulting in          Funding
faster stabilization and signiﬁcantly improved assimilation accuracy.
     While the LK method exhibits distinct advantages in small-                        The author(s) declare ﬁnancial support was received for the
ensemble regimes due to its causality analysis, its capability to                  research and/or publication of this article. This research is
achieve high absolute accuracy is still limited by the small ensemble              cosponsored by grants from the National Key Research and
size. Speciﬁcally, the errors (e.g., RMSE) obtained with the LK                    Development Program of China(2023YFC3107802).
method using small ensembles are smaller than those of the G-C
method, but their absolute errors remain considerable. Moreover,
ensemble sensitivity tests conﬁrm that the performance gap                         Acknowledgments
between LK and G-C narrows rapidly beyond a threshold, with
diminishing returns on LK’s relative improvement as ensemble size                      We would like to express our sincere gratitude to Professor X S
increases. This convergence indicates that LK’s distinctive value                  Liang for providing the valuable method and sincerely appreciate
may diminish in computational environments supporting larger                       the editor and reviewers for their valuable comments and
ensembles, where G-C’s isotropic localization beneﬁts more directly                suggestions that helped us improve the quality of the article.
from inﬂated sampling. Although the computation of information
ﬂow can be parallelized, the additional computational cost incurred
under high-resolution operating systems remains non-negligible.                    Conﬂict of interest
When the LK method demonstrates comparable errors to the G-C
method under large-ensemble conditions, a trade-off between                            The authors declare that the research was conducted in the
computational cost and accuracy must be carefully considered.                      absence of any commercial or ﬁnancial relationships that could be
     The twin experiments conducted in this study highlight the                    construed as a potential conﬂict of interest.
potential of the LK method to enhance SCDA performance,
particularly in systems characterized by small ensemble sizes and
complex interactions. However, the current work focuses on the
                                                                                   Generative AI statement
stable, large-scale dynamics between coupled components. The
performance of this static framework in capturing real-world
                                                                                       The author(s) declare that no Generative AI was used in the
transient, small-scale dynamics remains to be validated. In
                                                                                   creation of this manuscript.
addition, future work should also explore the integration of ﬂow-
                                                                                       Any alternative text (alt text) provided alongside ﬁgures in this
dependent ensemble covariances within the LK framework to deﬁne
                                                                                   article has been generated by Frontiers with the support of artiﬁcial
the information ﬂow dynamically throughout the DA window. Such
                                                                                   intelligence and reasonable efforts have been made to ensure
development would allow the information pathways to adapt
                                                                                   accuracy, including review by the authors wherever possible. If
instantaneously to the evolving atmospheric and oceanic states,
                                                                                   you identify any issues, please contact us.
potentially capturing fast-changing interactions between the two
components more accurately. This dynamic framework could also
be applied to vertical localization. However, given that observation
                                                                                   Publisher’s note
devices below the sea surface are often mobile, obtaining long-term
measurements at a ﬁxed position becomes challenging. In such
                                                                                       All claims expressed in this article are solely those of the authors
scenarios, how to implement the LK method will be a key focus of
                                                                                   and do not necessarily represent those of their afﬁliated organizations,
our future work. Notwithstanding these challenges, the LK method
                                                                                   or those of the publisher, the editors and the reviewers. Any product
establishes a new approach to localization by replacing empirical
                                                                                   that may be evaluated in this article, or claim that may be made by its
parameterization with causality, thereby positioning it to enhance
                                                                                   manufacturer, is not guaranteed or endorsed by the publisher.
the accuracy and reliability of Earth system predictions.


Data availability statement                                                        Supplementary material
    The original contributions presented in the study are included                     The Supplementary Material for this article can be found online
in the article/Supplementary Material. Further inquiries can be                    at: https://www.frontiersin.org/articles/10.3389/fmars.2025.
directed to the corresponding author.                                              1600634/full#supplementary-material



Frontiers in Marine Science                                                   12                                                             frontiersin.org
Wang et al.                                                                                                                                               10.3389/fmars.2025.1600634




References
 Anderson, J. L. (2001). An ensemble adjustment kalman ﬁlter for data assimilation.                 Lei, L., and Anderson, J. L. (2014a). Comparisons of empirical localization techniques
Monthly Weather Rev. 129, 2884–2903. doi: 10.1175/1520-0493(2001)129<2884:                        for serial ensemble kalman ﬁlters in a simple atmospheric general circulation model.
AEAKFF>2.0.CO;2                                                                                   Monthly Weather Rev. 142, 739–754. doi: 10.1175/MWR-D-13-00152.1
 Anderson, J. L. (2003). A local least squares framework for ensemble ﬁltering.                     Lei, L., and Anderson, J. L. (2014b). Empirical localization of observations for serial
Monthly Weather Rev. 131, 634–642. doi: 10.1175/1520-0493(2003)131<0634:                          ensemble kalman ﬁlter data assimilation in an atmospheric general circulation model.
ALLSFF>2.0.CO;2                                                                                   Monthly Weather Rev. 142, 1835–1851. doi: 10.1175/MWR-D-13-00288.1
  Anderson, J. L. (2007). Exploring the need for localization in ensemble data                      Liang, X. S. (2008). Information ﬂow within stochastic dynamical systems. Phys. Rev.
assimilation using a hierarchical ensemble ﬁlter. Physica D: Nonlinear Phenomena                  E 78, 31113. doi: 10.1103/PhysRevE.78.031113
230, 99–111. doi: 10.1016/j.physd.2006.02.011                                                       Liang, X. S. (2014). Unraveling the cause-effect relation between time series. Phys.
  Anderson, J., and Lei, L. (2013). Empirical localization of observation impact in               Rev. E 90, 52150. doi: 10.1103/PhysRevE.90.052150
ensemble kalman ﬁlters. Monthly Weather Rev. 141, 4140–4153. doi: 10.1175/MWR-D-                    Liang, X. S., and Kleeman, R. (2005). Information transfer between dynamical system
12-00330.1                                                                                        components. Phys. Rev. Lett. 95, 244101. doi: 10.1103/PhysRevLett.95.244101
  Burgers, G., Leeuwen, P.J.v., and Evensen, G. (1998). Analysis scheme in the                      Liang, X. S., Xu, F., Rong, Y., Zhang, R., Tang, X., and Zhang, F. (2021). El Niño
ensemble kalman ﬁlter. Monthly Weather Rev. 126, 1719–1724. doi: 10.1175/1520-                    Modoki can be mostly predicted more than 10 years ahead of time. Sci. Rep. 11, 17860.
0493(1998)126<1719:ASITEK>2.0.CO;2                                                                doi: 10.1038/s41598-021-97111-y
  Cao, L., Han, G., Li, W., Wu, H., Wu, X., Zhou, G., et al. (2024). Impact of                      Lu, F., Liu, Z., Zhang, S., Liu, Y., and Jacob, R. (2015). Strongly coupled data
instantaneous parameter sensitivity on ensemble-based parameter estimation:                       assimilation using leading averaged coupled covariance (LACC). Part II: CG-CM
simulation with an intermediate coupled model. J. Adv. Modeling Earth Syst. 16,                   experiments. Monthly Weather Rev. 143, 4645–4659. doi: 10.1175/MWR-D-15-0088.1
e2024MS004253. doi: 10.1029/2024MS004253
                                                                                                    Lu, X., Sun, J., Wei, G., and Chang, C.-T. (2023). Causal interactions and ﬁnancial
  Chang, C.-C., and Kalnay, E. (2022). Applying prior correlations for ensemble-based             contagion among the BRICS stock markets under rare events: A Liang causality
spatial localization. Nonlinear Processes Geophysics 29, 317–327. doi: 10.5194/npg-29-            analysis. Int. J. Emerging Markets 20, 2014–2041. doi: 10.1108/IJOEM-01-2023-0055
317-2022
                                                                                                    Miwa, N., and Sawada, Y. (2024). Strongly versus weakly coupled data assimilation in
  Evensen, G. (1994). Sequential data assimilation with a nonlinear quasi-geostrophic             coupled systems with various inter-compartment interactions. J. Adv. Modeling Earth
model using Monte Carlo methods to forecast error statistics. J. Geophysical Research:            Syst. 16, e2022MS003113. doi: 10.1029/2022MS003113
Oceans 99, 10143–10162. doi: 10.1029/94JC00572
                                                                                                     Pearl, J., and Mackenzie, D. (2018). The book of why: The new science of cause and
 Evensen, G. (1997). Advanced data assimilation for strongly nonlinear dynamics.                  effect. Science 361, 855–855. doi: 10.1126/science.aau9731
Monthly Weather Rev. 125, 1342–1354. doi: 10.1175/1520-0493(1997)125<1342:
ADAFSN>2.0.CO;2                                                                                     Penny, S. G., Bach, E., Bhargava, K., Chang, C.-C., Da, C., Sun, L., et al. (2019). Strongly
                                                                                                  coupled data assimilation in multiscale media: experiments using a quasi-geostrophic
  Frolov, S., Rousseaux, C. S., Auligne, T., Dee, D., Gelaro, R., Heimbach, P., et al.            coupled model. J. Adv. Modeling Earth Syst. 11, 1803–1829. doi: 10.1029/2019MS001652
(2023). Road map for the next decade of earth system reanalysis in the United States.
Bull. Am. Meteorological Soc. 104, E706–E714. doi: 10.1175/BAMS-D-23-0011.1                         Rong, Y., and Liang, X. S. (2022). An information ﬂow-based sea surface height
                                                                                                  reconstruction through machine learning. IEEE Trans. Geosci. Remote Sens. 60, 1–9.
   Gaspari, G., and Cohn, S. E. (1999). Construction of correlation functions in two and          doi: 10.1109/TGRS.2022.3140398
three dimensions. Q. J. R. Meteorological Soc. 125, 723–757. doi: 10.1002/
qj.49712555417                                                                                      Sluka, T. C., Penny, S. G., Kalnay, E., and Miyoshi, T. (2016). Assimilating
                                                                                                  atmospheric observations into the ocean using strongly coupled ensemble data
  Goodliff, M., and Penny, S. G. (2022). Developing 4D-var for strongly coupled data              assimilation. Geophysical Res. Lett. 43, 752–759. doi: 10.1002/2015GL067238
assimilation using a coupled atmosphere–ocean quasigeostrophic model. Monthly
                                                                                                    Stanley, Z. C., Draper, C., Frolov, S., Slivinski, L. C., Huang, W., and Winterbottom,
Weather Rev. 150, 2443–2458. doi: 10.1175/MWR-D-21-0240.1
                                                                                                  H. R. (2024). Vertical localization for strongly coupled data assimilation: experiments
  Hagan, D. F. T., Wang, G., Liang, X. S., and Dolman, H. A. J. (2019). A time-varying            in a global coupled atmosphere-ocean model. J. Adv. Modeling Earth Syst. 16,
causality formalism based on the Liang-Kleeman information ﬂow for analyzing                      e2023MS003783. doi: 10.1029/2023MS003783
directed interactions in nonstationary climate systems. J. Climate 32, 7521–7537.
                                                                                                    Stips, A., Macias, D., Coughlan, C., Garcia-Gorriz, E., and Liang, X. S. (2016). On the
doi: 10.1175/JCLI-D-18-0881.1
                                                                                                  causal structure between CO2 and global temperature. Sci. Rep. 6, 21691. doi: 10.1038/
  Han, G., Wu, X., Zhang, S., Liu, Z., and Li, W. (2013). Error covariance estimation for         srep21691
coupled data assimilation using a lorenz atmosphere and a simple pycnocline ocean                   Wu, X., Zhang, S., Liu, Z., Rosati, A., Delworth, T. L., and Liu, Y. (2012). Impact of
model. J. Climate 26, 10218–10231. doi: 10.1175/JCLI-D-13-00236.1                                 geographic-dependent parameter optimization on climate estimation and prediction:
  Houtekamer, P. L., and Mitchell, H. L. (1998). Data assimilation using an ensemble              simulation with an intermediate coupled model. Monthly Weather Rev. 140, 3956–
kalman ﬁlter technique. Monthly Weather Rev. 126, 796–811. doi: 10.1175/1520-0493                 3971. doi: 10.1175/MWR-D-11-00298.1
(1998)126<0796:DAUAEK>2.0.CO;2                                                                      Yoshida, T., and Kalnay, E. (2018). Correlation-cutoff method for covariance
   Houtekamer, P. L., Mitchell, H. L., Pellerin, G., Buehner, M., Charron, M., Spacek, L.,        localization in strongly coupled data assimilation. Monthly Weather Rev. 146, 2881–
et al. (2005). Atmospheric data assimilation with an ensemble kalman ﬁlter: results with          2889. doi: 10.1175/MWR-D-17-0365.1
real observations. Monthly Weather Rev. 133, 604–620. doi: 10.1175/MWR-2864.1                       Zhou, D., Liu, J., Yang, X., Wei, Y., Wu, Z., and Li, M. (2024). “The bayesian network
  Houtekamer, P. L., and Zhang, F. (2016). Review of the ensemble kalman ﬁlter for                method for handling cyclic loops based on information ﬂow,” in 2024 IEEE 6th
atmospheric data assimilation. Monthly Weather Rev. 144, 4489–4532. doi: 10.1175/                 International Conference on Civil Aviation Safety and Information Technology
MWR-D-15-0440.1                                                                                   (ICCASIT). 789–793. doi: 10.1109/ICCASIT62299.2024.10827953




Frontiers in Marine Science                                                                  13                                                                               frontiersin.org
