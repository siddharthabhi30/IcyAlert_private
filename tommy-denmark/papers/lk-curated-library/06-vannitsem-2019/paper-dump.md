Skip to Article Content
Skip to Article Information
AGU Journals
Search within
Search term

Login / Register
JOURNALS
 
TOPICS
 
BOOKS
 
OTHER PUBLICATIONS
 
POLICIES
 
Membership
 
AGU.org
 
Geophysical Research Letters
Geophysical Research Letters
Research Letter
Free Access
Testing for Dynamical Dependence: Application to the Surface Mass Balance Over Antarctica
Stéphane Vannitsem, Quentin Dalaiden, Hugues Goosse
First published: 16 October 2019 https://doi.org/10.1029/2019GL084329Digital Object Identifier (DOI)   VIEW METRICS
SECTIONSPDF
CITE
TOOLS SHARE
Abstract
Dynamical dependence between key observables and the surface mass balance (SMB) over Antarctica is analyzed in two historical runs performed with the MPI-ESM-P and the CESM1-CAM5 climate models. The approach used is a novel method allowing for evaluating the rate of information transfer between observables that goes beyond the classical correlation analysis and allows for directional characterization of dependence. It reveals that a large proportion of significant correlations do not lead to dependence. In addition, three coherent results concerning the dependence of SMB emerge from the analysis of both models: (i) The SMB over the Antarctic Plateau is mostly influenced by the surface temperature and sea ice concentration and not by large-scale circulation changes; (ii) the SMB of the Weddell Sea and the Dronning Maud Land coasts are not influenced significantly by the surface temperature; and (iii) the Weddell Sea coast is not significantly influenced by the sea ice concentration.

1 Introduction
In the climatological literature, one often reads terminologies like impact, driving mechanisms, influence, relationship, dependence, and coupling, among many others, but the actual meaning of these terms are usually quite loose. These connections are often derived from a detailed analysis of the covariances or lag covariances between different observables. For instance, it is very often claimed that the El Niño-Southern Oscillation has an influence over many regions of the globe due to the strong teleconnections (covariances or lagged covariances) between the observables of the Tropical Pacific and other regions of the globe ( Alexander et al., 2002; Brönnimann, 2007; Lau, 2016). Far from claiming that such (tele)connections do not exist, the statistical tools which are applied are however not appropriate to detect causal relationship if they are not complemented with additional analyses, such as sensitivity experiments with climate models for instance. Consequently, the terminology is used in a very loose sense, and conclusions can be difficult to draw.

The climate system and its components are dynamical systems whose descriptions are based on nonlinear dynamical equations, forced by both deterministic and random forcings. The way its different components and variables interact is complicated and can lead to intricate relations. How to disentangle the influence of one observable on another is an immense challenge, in particular when investigating sets of observations. Recent advances in dynamical system theories can considerably help in disentangling the influence of one observable on another. One particular approach developed by Sugihara et al. (2012) based on analog techniques in a reconstructed phase space has numerous potential applications (e.g., Luo et al., 2015; Tsonis et al., 2015; Vannitsem & Ekelmans, 2018; Ye et al., 2015, Ma et al., 2018), see also Vannitsem and Ghil (2017) for an other analog-based approach. One drawback is the necessity to define an appropriate phase space to reconstruct the attractor of the system.

Another methodology is based on the flow of information, derived from the notion of information entropy introduced originally by Shannon (1948). This approach has been advocated for many years (e.g., Abarbanel et al., 2001; Bianco-Martinez & Baptista, 2018; Deza et al., 2015; Hlavackova-Schindler et al., 2007; Krakovská et al., 2018; Liang & Kleeman, 2005; Runge et al., 2012; Schreiber, 2000; Vastano & Swinney, 1988). In this framework, a rigorous formalism for the transfer of information from one set of variables of a dynamical system to another has been recently put forward (Liang & Kleeman, 2005; 2007). Since then, this formalism has been considerably expanded, in particular in the analysis of the information transfer between two observational time series (Liang, 2014b, 2015).

The latter approach will be used here to analyze surface mass balance (SMB) changes of the Antarctic ice sheet and to disentangle the rate of information transfer between different observables. SMB over Antarctica is defined as the difference between the snow mass accumulation and the mass loss due to surface sublimation and the sublimation of blowing snow. The net surface meltwater runoff is negligible nearly everywhere over Antarctica in present climate conditions and is generally not included in the Antarctic SMB (Lenaerts et al., 2019).

The climate of the high latitudes of the Southern Hemisphere is characterized by complex interactions between the atmosphere, the ocean, and the ice. Many studies have put forward a strong influence on Antarctica of both tropical and extratropical modes of variability as well as of the changes in sea ice in the Southern Ocean (Ding et al., 2011; Lenaerts et al., 2018; Raphael, 2007; Thomas et al., 2017; Thompson et al., 2011). These studies provide key observables whose influence on SMB can be estimated, and further compared, using classical correlation and the information transfer approach.

In section 2, the methodology is described with a detailed analysis of its ability to characterize the influence of one variable on another in the context of a linear stochastic system. The observables and the data sets that are analyzed are then described in section 3. Section 4 discusses the main results, and conclusions are drawn in section 5.

2 Methodology
Recently, a rigorous formalism of the rate of information transfer between two variables, X1 and X2, in deterministic and stochastic dynamical systems has been developed (Liang, 2014a, 2014b, 2015, 2016). This quantity is computed as the difference between the rate of change of the marginal entropy of X1 and the rate of change of the marginal entropy of X1 when X2 is frozen (see Liang, 2014b, together with the Supporting Information S1 in which the key concepts are developed).

These theoretical results were used successfully in the understanding of information transfers between system's variables in various contexts (see, e.g., Liang, 2014a, 2014b). But when dealing with measurement time series, the access to the underlying dynamics is not straightforward due to the complex (linear and nonlinear) interactions between the different elements of the system. To overcome these problems, Liang (2014b) proposes to assume that the underlying dynamics are in a first approximation linear, as often done in data analysis of climate time series (e.g., Sardeshmukh & Sura, 2009). In this case, the rate of information transfer from variable X2 to X1, T2→1, can be evaluated in terms of covariances as
urn:x-wiley:grl:media:grl59670:grl59670-math-0001
(1)
where Ci,j are the usual covariances between variable Xi and Xj and Ci,dj are the covariances between the variable Xi and the tendency dXj/dt (evaluated through a Euler forward finite difference). As argued in Liang (2014b), this novel approach offers new insight on the transfer of information between variables much beyond the correlation analysis, even in a nonlinear context, and is easy to implement.
Let us briefly evaluate Ti→j in the context of a stochastic 2-dimensional linear system to clarify the type of information that can be extracted from this, as in Liang (2014b),
urn:x-wiley:grl:media:grl59670:grl59670-math-0002
(2)
where ξ1(t) and ξ2(t) are white noise processes with mean 0 and autocovariance, <ξi(t)ξi(t′)>=0.01δ(t−t′) for both i=1,2, where <.> indicates ensemble average. In Figure 1a, T1→2 and T2→1, computed analytically, are represented for arbitrarily chosen parameter values, a1,1=a2,2=−1 and a1,2=0.5 as a function of a2,1. The correlation is also displayed. First T1→2 and T2→1 are clearly distinct, indicating an asymmetry, contrary to the correlation. When the correlation is equal to 0, both T1→2 and T2→1 are equal to 0. Finally, when a2,1=0, T1→2=0 but not T2→1 and the correlation. Three typical situations are expected: (i) no correlation and no transfer of information, (ii) correlation but no transfer of information, and (iii) correlation with transfer of information. Note that positive (negative) values of Ti→j mean that the influence of variable i makes the value of variable j more (less) uncertain or in other words induces a larger (smaller) set of possible outcomes of variable j.
 grl59670-fig-0001
Figure 1
Open in figure viewer
PowerPoint
Theoretical values of the rate of information transfer and correlation as a function of the coefficient a2,1 of the stochatic linear model described by equation 2. In (a), the other model parameters are fixed to a1,1=a2,2=−1 and a1,2=0.5 and, in (b), to a1,1=−0.1, a2,2=−0.01, a1,2=0.17. The rates of information transfer from 2 to 1 and from 1 to 2 are denoted as “T2→1” and “T1→2” in the legends of each panel. C(X1,X2) denotes the correlation between X1 and X2.
One can also wonder what are the amplitudes of these quantities for which a linear stochastic system is a realistic modeling framework. In recent years, there were convincing evidences that the El Niño-Southern Oscillation can be described by a simple recharge oscillator (Burgers et al., 2005). In this case, typical values of the parameters are a1,1=−0.1, a2,2=−0.01, a1,2=0.17, and a2,1=−0.17. In Figure 1b, Ti→j and correlation are displayed as a function of a2,1. When the amplitude of a2,1 is small, the correlation is high, and the rates of information transfer have opposite signs. The origin of the increasing correlation for a2,1 going to 0 is related to the strong influence of X2 on X1, also associated with a larger value of T2→1. At the same time, when a2,1 reaches 0, T1→2 also cancels out indicating the decoupling of variable X2 from X1.

Let us now turn to the estimation of equation 1 on finite time series. The estimates are represented in Figures 2a and 2b for a series sampled every 0.1 time units. The error bar is obtained by a bootstrapping method with replacement, assuming Gaussian statistics. As the number of records, L, increases, the rate of information transfer converges toward their analytical value. The slight discrepancy for T2→1 is attributed to the discretization of the derivative with the sampling time used. For smaller sampling times, the estimation is closer to the theoretical value. Note that although correlation becomes significant (different from 0) once the length of the time series is larger than 200, much larger data sets are however needed to get T2→1 significantly different from 0 (Figure 2b).

 grl59670-fig-0002
Figure 2
Open in figure viewer
PowerPoint
Estimations of the correlation coefficient (a) and the rate of information transfer (b) as a function of L for a1,1=a2,2=−1, a1,2=0.5 and a2,1=0. The theoretical values for T2→1 and T1→2 are represented by the horizontal straight lines. The error bar at the 95% level (statistics assumed to be Gaussian) is also represented for each value of L.
3 Data Sets
3.1 Defining the Observables

The SMB in Antarctica is influenced by changes in atmospheric circulations as well as by the surface conditions in the Southern Ocean (Lenaerts et al., 2019; Thomas et al., 2017), represented here by the sea ice concentration (SIC).

The atmospheric circulation variability is estimated using three standard indices in order to get a first evaluation of the technique. Many studies have also identified strong covariances between 2-m surface air temperature (SAT) and SMB variations (Frieler et al., 2015; Krinner et al., 2007). This variable is thus included in our analyses. The observables used are
SMB;
2-m SAT;
The mean SIC describing the fraction of ocean area covered by ice;
The Southern Annular Mode (SAM), the dominant mode of atmospheric variability in the extratropics of the Southern Hemisphere. It is characterized by an annular structure with synchronous geopotential height anomalies of opposite signs over midlatitudes and Antarctica (Marshall, 2003). Link between SAM and Antarctic climate have been discussed in, for example, Abram et al. (2014) and Medley et al. (2018). In this study, the SAM index is defined as the normalized zonal averaged 500-hPa geopotential heights between 40°S and 65°S.
The zonal wave 3 (ZW3) is a dominant pattern of atmospheric variability over the Southern Ocean and Antarctica on time scales ranging from daily to interannual time scales. The ZW3 index is computed as the mean of the normalized 500-hPa geopotential heights at the three ridges that characterize ZW3 (average of grid points from longitudes 45–60°E, 161–171°E, and 71–81°W and latitudes 45–60°S; ; Hobbs & Raphael, 2009; Raphael, 2004).
The El Niño-Southern Oscillation. Many studies have demonstrated links between Antarctica and tropical regions (e.g., Clem et al., 2018; Ding et al., 2011; Ionita et al., 2018). Here we use Nino 3.4 sea surface temperature index to represent tropical changes (hereafter El Nino 3.4), defined as sea surface temperature averaged over the region 170–120°W and 5°S–5°N.
3.2 Model Data and Reanalysis

Simulations outputs from the coupled global climate model CESM1-CAM5 (Lehner et al., 2015) and MPI-ESM-P (Stevens et al., 2013) covering the 850–2005 period are analyzed. These simulations are driven by both anthropogenic (greenhouse gases, aerosol, ozone, and land use) and natural (solar, volcanic, and orbital) forcing (Schmidt et al., 2012). They were chosen since they provide very long time series at annual time scale (1,156 years). A brief overview of the quality of their simulated climate is provided in Text S2, see also Dalaiden et al. (2019) and Klein et al. (2019). These models have been chosen because they reproduce reasonably well the mean state and the correlation between SMB and atmospheric circulation.

The ERA-Interim data set (Dee et al., 2011), considered as one of the best reanalysis products for the Antarctic region (e.g., Agosta et al., 2015; Bromwich et al., 2011), reproduces reasonably well the observed state of SMB and SAT (Figure S1) and the atmospheric circulation (Figure S2). It is available from 1979 to 2018 at a spatial resolution of 0.75°. We use the SIC data based on HadISSt and NCEP 2DVAR data before January 2002 (Fiorino, 2004) and on OSTIA afterward (Donlon et al., 2011). These data sets have also been used here, but the length of the reanalysis data set is small (about 40 years), and as alluded in section 2, much longer time series are needed to get rates of information transfer that are significantly different from 0. The results provided as Text S3 suggest that the length of the reanalysis data set does not allow for inferring useful information.

3.3 Defining the Regions

The analyses are performed on SMB averaged over several continental Antarctic regions as in Thomas et al. (2017). East Antarctica above 2,000-m elevation constitutes the Antarctica Plateau (Region 1). The coastal zones are divided into four regions: the Wilkes Land Coast (70–150°E; Region 2), the Weddell Sea Coast (15–60°E; Region 3), the Antarctic Peninsula (Region 4), the West Antarctica Ice Sheet (Region 5), with a division at 88°W, the Victoria Land and Ross Sea (150–170°E; Region 6) and the Dronning Maud Land coast (DML coast; 15°W–150°E; Region 7). These boundaries are also used in computing regional mean SAT. For SIC, an oceanic region is assigned to each of the seven continental regions, following its longitudinal extent: 30°W–165°E, 67–160°E, 60–30°W, 80–50°W, 150–70°W, 150°E–150°W, and 30°W–70°E, respectively, for Regions 1 to 7 (Figure 3).

 grl59670-fig-0003
Figure 3
Open in figure viewer
PowerPoint
Regional boundaries separating the different regions used in this study. DML = Dronning Maud Land; WAIS = West Antarctica Ice Sheet.
4 Results
Figures 4 and 5 display the rate of information transfer urn:x-wiley:grl:media:grl59670:grl59670-math-0003, from a set of observables to the SMB over Antarctica, the El Niño, the SAM, and ZW3 indices, together with the corresponding correlations, for two historical simulations with the MPI-ESM-P and CESM1-CAM5 climate models from 850 to 2005. The error bars represent the uncertainty at the 95% level. The observable experiencing the influence of the others is referred as the Target in each panel. A first general remark is that many of the observables used display significant correlations with each other, but several of them are not associated with detectable dynamical influences as measured by  urn:x-wiley:grl:media:grl59670:grl59670-math-0004.

 grl59670-fig-0004
Figure 4
Open in figure viewer
PowerPoint
The rate of information transfer and the correlation are plotted as a function of the observables for seven different targeted observables. In (a)–(g), the targeted observable is referred to as the “Target” in the title, and the rate of information transfer from the other observables is plotted in red with the scale on the left vertical axis. The corresponding correlation coefficient is plotted in blue with the scale on the right vertical axis. The data used are coming from one specific run (Run 1) from an ensemble of runs made with the MPI-ESM-P climate model from 850 to 2005. Along the horizontal axis, the different observables used are the sea surface temperature of Nino 3.4 region, the Southern Annular Mode (SAM) index, the zonal wave 3 (ZW3) mode over Antarctica, the sea ice concentration (SIC), and the 2-m surface air temperature (SAT) averaged over the seven regions (Regions 1–7). SMB = surface mass balance.
 grl59670-fig-0005
Figure 5
Open in figure viewer
PowerPoint
As in Figure 4 for the CESM1-CAM5 model. The run used here is Run 10 of the ensemble produced with the CESM1-CAM5 model from 850 to 2005.
Let us now focus on specific interesting cases related to the influence of the large-scale dynamical modes, SIC, and SAT on SMB. The term influence is used when discussing the results based on  urn:x-wiley:grl:media:grl59670:grl59670-math-0005, but when needed, the correlation is also explicitly mentioned. We consider that significant influence is present when the error bar at the 95% level does not cross the zero line and vice versa. Results for Regions 1 to 7 of Figure 3 are shown in panels (a) to (g). Additional results are also displayed in Text S4.

4.1 Large-Scale Modes

For the MPI-ESM-P model (Figure 4), El Niño 3.4 is significantly influencing regional SMB over Regions 2 and 3 that are on opposite sides (East and West) of Antarctica, SAM is influencing Regions 4 and 6, and ZW3, Region 3 only. Interestingly, several highly significant correlations of ZW3 with the SMB over Regions 2, 4, 6, and 7 do not lead to any dynamical dependence. It indicates that previous links expected from the computations of correlations between large-scale modes and observables over Antarctica are not necessarily of dynamical origine but rather a covariability whose origin should be found in the common influence of upstream processes.

For CESM1-CAM5 (Figure 5), the picture is slightly different, with El Niño 3.4 significantly influencing Regions 2, 5, and 6, SAM influencing Regions 2, 4, 5, 6, and 7, and ZW3 influencing Regions 2 and 7. This model overall displays a stronger influence of the climate modes on the SMB than the MPI-ESM-P model. CESM1-CAM5 has stronger correlation between SMB and geopotential height than MPI-ESM-P (Figure S2) but also than ERA-Interim, suggesting that it may also overestimate the influence of circulation modes on SMB.

Interestingly, none of them are showing any influence on the Plateau (Region 1) although important significant correlations are found with El Niño and SAM.

In both models, the influence of SAM on the Antarctic Peninsula and the Victoria Land and Ross Sea is marked. SAM is also expected to have an influence on many other coastal regions (e.g., Medley et al., 2018). This can be masked for some regions by the specific box averaging, as, for instance, for West Antarctica Ice Sheet (Region 5) for MPI-ESM-P where SAM can induce positive and negative SMB anomaly inside the box. El Nino 3.4 is also expected to have an influence on many regions (e.g., Clem et al., 2018; Kohyama & Hartmann, 2017) in particular on West Antarctica, but it is detected here only in CESM1-CAM5 and in the Indian Sector, which may be related to the influence over Wilkes Land in both models.

Several studies have suggested decreased precipitation over the Antarctic Plateau associated to a positive SAM index (e.g., Marshall et al., 2017; Medley et al., 2018), in agreement with the significant correlation found for both models (Figures 4 and 5). Nevertheless, the absence of dependence indicates that the link is not of dynamical nature. Rather, the changes should be associated with local thermodynamic processes in Region 1 as discussed below. If SAM has an influence at all, it would probably be associated with modifications of temperature conditions.

4.2 SIC

For the MPI-ESM-P model (Figure 4), SIC of Regions 1, 2, 5, and 6 are influencing the SMB over Region 1, SIC of Region 5 is influencing SMB of Region 5, and SIC of Regions 4–6 are influencing the SMB of Region 6. Here also some high and significant correlations do not lead to significant dependence like for the influence of SIC on SMB of Region 4.

For the CESM1-CAM5 model (Figure 5), SIC of Regions 1, 2, 5, and 6 are again influencing the SMB over Region 1, but now SIC over Region 7 is also influencing SMB over Region 1. Contrary to the MPI-ESM-P model, the SMB over Region 2 is here influenced by the SIC over Regions 1, 2, 3, and 7. The SMB over Region 4 is influenced by SIC over Regions 4 and 5, result also different to the ones obtained with the MPI-ESM-P model. The SMB over Region 5 is influenced by SIC over Regions 1, 2, 3, 5, and 7, over Region 6, by SIC of Regions 4 and 6, and over Region 7, by SIC of Regions 1, 3, and 7.

Remarkably, the SMB in Region 3 (Weddell sea coast) is not influenced by SIC in any model despite significant correlations.

Finally, as for the large-scale modes, the CESM1-CAM5 model displays in general stronger influences of SIC over the SMB of Antarctica that could be related to a larger mean sea ice extent and thus larger amplitude variations in SIC than in MPI-ESM-P.

4.3 SAT

For the MPI-ESM-P model (Figure 4), SATs of Regions 1, 2, 6, and 7 are influencing the SMB over Region 1. SMB of Region 4 is influenced by SATs of Regions 3 and 4; SMB of Region 5 by the SATs of Regions 3 and 5; and SMB of Region 6 by SATs of Regions 5 and 6.

For the CESM1-CAM5 model (Figure 5), SATs of Regions 1, 2, 3, and 7 are again influencing the SMB over Region 1. SMB of Region 2 is now influenced by the SATs of Regions 2 and 5; SMB of Region 4 by SAT in Regions 4–7; and SMB of Region 6 by SAT of Regions 1, 2, and 7.

A dependence of SMB on temperature and mean SIC is expected from basic thermodynamic processes. Less sea ice induces more evaporation from the open ocean surface and then potentially more precipitation, while temperature influences the moisture content through the Clausius-Clapeyron law (Altnau et al., 2015; Frieler et al., 2015; Monaghan et al., 2008). This link appears stronger inside the continent than on the coast as clear dependence is found in both models for temperature and SIC for the Antarctic Plateau (Region 1, Figures 4a and 4b). This region is the largest one including zones further away from the coast, where it is expected that a robust thermodynamic link is present. By contrast, SMB over the Weddell Sea Coast and DML coast are not influenced by SAT in both model runs. These two regions have potentially larger influence of air masses coming from the ocean and display strong topographic gradients. This can impose a strong signature of multiple regional processes with a complex interplay between circulation, temperature, and precipitation (Lenaerts et al., 2013, 2019; Turner et al., 2019).

5 Conclusions
The analysis of the influence of certain processes on others in climate science is often based on correlation. Although the statistics based on this quantity are useful to have a first clue on the presence of a link between two observables, it cannot be used to infer any dynamical influence between them. Recent developments on information transfer in dynamical systems provide new tools to investigate dynamical interactions (Liang, 2014b). The power of the approach has been successfully demonstrated here by the use of a simple measure of directional dynamical influence between observables in the context of the analysis of the link between the SMB over Antarctica and a set of other surface observables and global indices.

As measurement data are sparse and do not cover a long period, the analysis has been performed in the context of two long climate simulations on a yearly basis, obtained with the MPI-ESM-P and CESM1-CAM5 climate models, known to provide good representations of the Antarctic climate as discussed in the supporting information. Although dynamical connections between SMB and the other observables are stronger in the CESM1-CAM5 model than in MPI-ESM-P, a few key results concerning the dependence of SMB, coherent between the two models, are emerging: (i) The Antarctic Plateau is not influenced by the large-scale modes but well by the SAT and SIC; (ii) the SMB over the Weddell Sea coast and the DML coast are not influenced by the SAT; and (iii) the Weddell Sea coast is not dynamically influenced by the SIC.

Acknowledgements
This work is supported in part by the project Mass2Ant (BR/165/A2/Mass2Ant) of the Belgian Science Policy Office. H. Goosse is Research Director within the F.R.S.-FNRS, Belgium. The data sets used in the present paper are coming from main data sources websites: All CMIP5/PMIP3 model simultation including the MPI-ESM-P simulation are available online (https://pcmdi9.llnl.gov); the CESM1-CAM5 ensemble over the last millenium can be directly downloaded online (https://www.earthsystemgrid.org); the ERA-interim reanalysis is available from the ECMWF website (https://www.ecmwf.int/en/research/climate-reanalysis/era-interim).

Supporting Information
References
Citing Literature

Volume46, Issue21
16 November 2019
Pages 12125-12135
Figures
References
Related
Information
Recommended
Identifying the Impacts of Sea Ice Variability on the Climate and Surface Mass Balance of West Antarctica

Jessica D. Kromer, 
Luke D. Trusel
Geophysical Research Letters
The Greenland Ice Sheet's surface mass balance in a seasonally sea ice-free Arctic

J. J. Day, 
J. L. Bamber, 
P. J. Valdes
Journal of Geophysical Research: Earth Surface
Thermodynamic and Dynamic Variations in Sea Ice Thickness of the Ross Sea, Antarctica, Driven by Atmospheric Circulation

Younghyun Koo, 
Hongjie Xie, 
Stephen F. Ackley
Journal of Geophysical Research: Oceans
Causal Links Between Arctic Sea Ice and Its Potential Drivers Based on the Rate of Information Transfer

D. Docquier, 
S. Vannitsem, 
F. Ragone, 
K. Wyser, 
X. S. Liang
Geophysical Research Letters
A new, high‐resolution surface mass balance map of Antarctica (1979–2010) based on regional atmospheric climate modeling

J. T. M. Lenaerts, 
M. R. van den Broeke, 
W. J. van de Berg, 
E. van Meijgaard, 
P. Kuipers Munneke
Geophysical Research Letters
Download PDF
 Back
Back to Top
AGU Journals Logo
  
© 2026 American Geophysical Union
AGU PUBLICATIONS
AGU.ORG
AGU MEMBERSHIP
Author Resources
Contact AGU
Editor Searches
Librarian Resources
Media Kits
Publication Award
Publication Policies
Scientific Ethics
Submit a paper
Usage Permissions
Additional links
ABOUT WILEY ONLINE LIBRARY

Privacy Policy
Terms of Use
About Cookies
Manage Cookies
Accessibility
Wiley Research DE&I Statement and Publishing Policies
HELP & SUPPORT

Contact Us
Training and Support
DMCA & Reporting Piracy
Sitemap
OPPORTUNITIES

Subscription Agents
Advertisers & Corporate Partners
CONNECT WITH WILEY

The Wiley Network
Wiley Press Room
Copyright © 1999-2026 John Wiley & Sons, Inc or related companies. All rights reserved, including rights for text and data mining and training of artificial intelligence technologies or similar technologies.
Wiley Home Page