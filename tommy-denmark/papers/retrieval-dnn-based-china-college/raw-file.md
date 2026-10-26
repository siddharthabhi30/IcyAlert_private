Citation: Zhang, L.; Tie, S.; He, Q.;
Wang, W. Performance Analysis of
the Temperature and Humidity
Profiles Retrieval for FY-3D/MWTHS
in Arctic Regions. Remote Sens. 2022,
14, 5858. https://doi.org/10.3390/
rs14225858
Academic Editor: Seon Ki Park
Received: 2 October 2022
Accepted: 16 November 2022
Published: 18 November 2022
Publisher’s Note: MDPI stays neutral
with regard to jurisdictional claims in
published maps and institutional affil-
iations.
Copyright: © 2022 by the authors.
Licensee MDPI, Basel, Switzerland.
This article is an open access article
distributed under the terms and
conditions of the Creative Commons
Attribution (CC BY) license (https://
creativecommons.org/licenses/by/
4.0/).remote sensing
Article
Performance Analysis of the Temperature and Humidity
Profiles Retrieval for FY-3D/MWTHS in Arctic Regions
Lanjie Zhang 1,2, Shengru Tie 1,2, Qiurui He 3,4,* and Wenyu Wang 4
1 Key Laboratory of Information and Communication Systems, Ministry of Information Industry,
Beijing Information Science and Technology University, Beijing 100101, China
2 Key Laboratory of Modern Measurement & Control Technology, Ministry of Education,
Beijing Information Science & Technology University, Beijing 100192, China
3 School of Information Technology, Luoyang Normal University, Luoyang 471934, China
4 Key Laboratory of Microwave Remote Sensing, National Space Science Center, Chinese Academy of Sciences,
Beijing 100190, China
* Correspondence: heqiurui@lynu.edu.cn
Abstract: The special geographical location of the polar regions increases the difficulty of modeling
surface emissivity, thus the physical retrieval algorithms of the temperature and humidity profiles
for microwave radiometers mainly focus on the regions between 60◦S and 60◦N. In this paper, the
deep neural networks (DNN) and long short-term memory (LSTM) models are first implemented to
retrieve atmospheric temperature and humidity profiles in real time from FY-3D/MWHTS in Arctic
regions and are compared with the physical retrieval algorithm. The hyperparameters of the machine
learning models are determined using the grid search and 10-fold cross-validation. Results show
that, compared with the physical retrieval algorithm, the retrieval accuracies of the atmospheric
temperature and humidity profiles of the DNN and LSTM models in June 2021 are higher over sea ice,
and the maximum retrieval accuracies are improved by about 3.5 K and 42%. Over land, the retrieval
accuracies of the atmospheric temperature profiles for the DNN and LSTM models in June 2021 are
improved by about 5 K. The retrieved humidity results for these two models are not compared with
the physical retrieval algorithm, which fails for the humidity profile retrieval over land. In addition,
the retrieval results of the DNN-based and LSTM-based models using the independent validation
data in February, April, and September are also evaluated over different surface types. The RMSEs of
the retrieved temperature profiles for the two models are within 4 K, except for the near-surface, and
the humidity profiles are within 25%, except for in February. The temperature profiles in September
and the humidity profiles in February are somewhat reduced compared to other months because of
the highly variable emissivity properties in autumn and winter. Overall results show that the machine
learning method can well-evaluate the retrieval capability of FY-3D/MWHTS of the atmospheric
temperature and humidity profiles in Arctic regions.
Keywords: MWHTS; atmospheric temperature and humidity profiles; Arctic; DNN; LSTM
1. Introduction
The Arctic has a significant effect on global climate change as it is one of the important
cold sources in the world [1,2]. The extent of Arctic snow and sea ice cover is shrinking
with global warming [3]. Particularly, the Arctic region has warmed at about twice the
rate of the entire Northern Hemisphere over the past few decades [4,5]. Moreover, climate
change in the Arctic not only has a significant impact on climate regulation in the middle
and low latitudes but will also have an uncertain influence on trends in the global climate
system in the future [6,7]. Atmospheric temperature and humidity profiles are indispens-
able parameters for Arctic climate monitoring; they can initialize and evaluate numerical
weather forecast models and be used for short-term weather warnings [8].
Remote Sens. 2022, 14, 5858. https://doi.org/10.3390/rs14225858 https://www.mdpi.com/journal/remotesensing
Remote Sens. 2022, 14, 5858 2 of 26
Compared with radiosonde and ground-based measurements, satellite microwave
remote sensing has the great advantage of wide space coverage [9–11]. Satellite microwave
remote sensing can penetrate clouds for detection and accomplish all-weather detection
in comparison to hyperspectral infrared detectors [11–13]. Thus, the satellite microwave
radiometer can obtain observational data covering the whole Arctic [14]. The physical
retrieval method is realized by modeling the atmospheric radiative transfer process and
inverting the radiative transfer equation, which is a common retrieval method for atmo-
spheric temperature and humidity profiles with microwave radiometers. Liu et al. [15] used
a one-dimensional variational (1DVAR) algorithm to simultaneously retrieve atmospheric
temperature, humidity, and cloud-water profiles through the observational data of the ad-
vanced microwave sounding unit (AMSU). The results show that, with the scattering model,
the radiative transfer model can significantly improve the retrieval accuracy of temperature,
humidity, and cloud water. He et al. [16,17] established a 1DVAR system to retrieve the
atmospheric temperature and humidity profiles from FY-3C/MWHTS measurements. It is
shown that the retrieved temperature and humidity profiles can improve the accuracy of
the forecast profile, whereafter the authors in the work [18] proposed a deviation correction
method to correct the FY-3C/MWHTS-observed brightness temperature. It is found that
the accuracy of the physical retrieval algorithm increases with the brightness temperature
correction effect. These studies demonstrate that the physical retrieval algorithm has a high
level of precision, but the modeling process is complex. Meanwhile, the performance of the
physical retrieval algorithm depends on the forward model, of which the accuracy is limited
by the near-surface parameters. Due to the special geographical location of the Arctic and
the complex weather conditions, accurate near-surface information is hard to obtain, which
increases the difficulty of modeling surface emissivity [12,19]. Although Mathew et al.
in [20] utilized AMSU data to retrieve polar temperature profiles by the physical method,
the retrieval error of near-surface atmospheric parameters is relatively large because of the
influence of surface emissivity. Based on the observations from the ground-based scanning
radiometer, which operates at millimeter wavelengths, Cimini et al. [21] utilized the 1DVAR
retrieval method to retrieve the temperature and humidity profiles in the Arctic. The re-
trieved temperature and humidity profiles present as significantly improved compared
with the NWP background profiles. At present, the measurement data from microwave
radiometers in polar regions are still rarely applied.
The statistical method retrieves the atmospheric temperature and humidity profiles
by fitting the nonlinear relationship between the microwave radiometer observed data
and the atmospheric profile information, which can avoid the modeling of the forward
model. Karbou et al. [22] used a neural network to retrieve the temperature and humidity
profiles under clear sky over land from AMSU observation data and classified land surface
types. The retrieved temperature and relative humidity profiles are satisfactory regardless
of the vegetation types and atmospheric conditions. Gangwar et al. [23] utilized a neural
network to retrieve temperature profiles over the ocean and land from AMSU observation
data and conducted the classified retrieval of temperature profiles in different latitudes
according to the characteristics of the surface types. The retrieval error over the ocean is
smaller than that over the land. Gu et al. [24] analyzed the performance of FY-3C/MWHTS
and implemented a statistical retrieval method to retrieve atmospheric parameters. Results
show that FY-3C/MWHTS improves the comprehensive detection ability of atmospheric
temperature and humidity profiles. He et al. [25] retrieved atmospheric temperature and
humidity profiles from FY-3D/MWHTS data based on the deep neural networks (DNN)
and provided a valuable pathway for retrieving reliable atmospheric temperature and
humidity profiles. This research indicates that the machine learning method does not
need to calculate the surface emissivity and simulate the radiative transfer process and
performs well in dealing with the nonlinear relationships between satellite observations
and atmospheric temperature and humidity profiles. This may make up for the poor
performance of the atmospheric temperature and humidity profile retrieval of the physical
retrieval algorithm in polar regions. However, there is a lack of research on retrieving
Remote Sens. 2022, 14, 5858 3 of 26
atmospheric temperature and humidity profiles from microwave radiometer observations
in polar regions using machine learning methods.
Although the accurate estimation of the atmospheric temperature and humidity pro-
files from satellite microwave radiometers in Arctic regions is helpful to improve the initial
field of the assimilation system [26,27], the retrieval algorithms of microwave radiometers
mainly consider the region within 60◦N to 60◦S because of the influence of surface emis-
sivity. Thus, it is urgent to study the potential of microwave radiometry in the retrieval
of Arctic atmospheric temperature and humidity profiles. In this paper, based on the
FY-3D/MWHTS measurements, the DNN and long short-term memory (LSTM) models are
implemented to retrieve temperature and humidity profiles in real time in Arctic regions
by using the obtained hyperparameters. Then the results are compared with the physical
retrieval algorithm. The organization of this paper is as follows. Section 2 introduces the
data used in this paper and the data preprocessing process. Section 3 describes the model
and the retrieval method for this paper. In Section 4, the retrieval results are analyzed and
discussed. Section 5 contains the conclusions.
2. Data
2.1. Data
The datasets used in this paper include the FY-3D/MWHTS-observed data, ERA5
reanalysis data, and National Centers for Environmental Prediction (NCEP) reanalysis
and forecast data. These datasets are summarized in Table 1. The geographical ranges of
these data include the land area of 60◦N–75◦N and 90◦E–120◦E, and the sea ice and mixed
ice–water area of 75◦N–90◦N and 120◦W–180◦W, respectively.
Table 1. Summary of the datasets used for retrieval of atmospheric temperature and humidity profiles.
Data Source Variable Time Range
FY-3D/MWHTS Brightness temperatures
Land–sea mask
January to December 2020 and February, April, June, and
September 2021
ERA5 reanalysis data
Temperature
Relative humidity
Specific humidity
2 m temperature
2 m dewpoint temperature
Surface pressure
Skin temperature
10 m v wind component
10 m u wind component
Sea ice cover
January to December 2020 and February, April, June, and
September 2021
Temporal resolution 3 h
NCEP reanalysis data Temperature
Relative humidity
February, April, June, and September 2021
Temporal resolution 6 h
NCEP forecast data Temperature
Relative humidity
June 2021
Temporal resolution 6 h
2.1.1. MWHTS Observations
The MWHTS belongs to the satellite-borne microwave radiometer. It is one of the
important payloads of the FY-3D satellite. The MWHTS-observed data can be obtained
every 102 min while FY-3D is in polar orbit operation [11]. The MWHTS uses a channel
with a central frequency point at the 183.31 GHz water-vapor absorption line to vertically
detect atmospheric humidity. It is sensitive to clouds and precipitation with a resolution of
16 km at the nadir. The channel with a central frequency point at 118.75 GHz of MWHTS is
sensitive to atmospheric temperature with a horizontal resolution of 29 km at the nadir. The
FY-3D/MWHTS-observed data are provided by Level 1 data on the website of the National
Satellite Meteorological Center (http://satellite.nsmc.org.cn, accessed from January to
December 2020 and February, April, June, and September 2021).
Remote Sens. 2022, 14, 5858 4 of 26
2.1.2. ERA5 Reanalysis Data
ERA5 is the fifth-generation ECMWF reanalysis data, which are available starting from
1950. At present, the ERA5 replaces the previous ERA-Interim [28]. As a large upgrade
over ERA-Interim, ERA5 has a higher spatial-temporal resolution, which can obtain the
hourly estimates of atmospheric variables at a horizontal resolution of 31 km and can be
used to build and validate retrieval systems or assimilation systems. To estimate more
accurate atmospheric conditions, these more historical observations are used for producing
the ERA5 data [29]. At present, the ERA5 data assimilate multiple data sources, such as
satellites, ground observatories, soundings, etc., combined with the atmospheric radiative
transfer for television and infrared orbiting satellite operational vertical sounder model,
and continuously revise the results, and it is a comprehensive dataset. The reanalysis data
are provided by the ECMWF ERA5 website (https://cds.climate.copernicus.eu, accessed
from January to December 2020 and February, April, June, and September 2021) and are
collected as sample dataset containing profile parameters and the surface parameters over
land, sea ice, and mixed ice–water [30]. The spatial resolution and temporal resolutions
are 0.25◦ × 0.25◦ and 3 h, respectively. The profile parameters are 37 layers unevenly from
1 hPa to 1000 hPa.
2.1.3. NCEP Reanalysis and Forecast Data
The NCEP reanalysis data and 6 h forecast data were provided by the NCEP website
(https://rda.ucar.edu (accessed on 1 December 2021)). The forecast data were collected
from June 1 to June 30, 2021. The reanalysis data were collected from February, April, June,
and September 2021. The spatial and temporal resolutions for reanalysis and forecast data
are 0.25◦ × 0.25◦ and 6 h, respectively. The reanalysis and forecast dataset includes the
same parameters with the atmospheric temperature and humidity profiles. The profile data
of NCEP include 31 layers from 1 hPa to 1000 hPa and are interpolated to the specified
pressure layer (1–1000 hPa: 37 layers) using the cubic spline interpolation method, which is
consistent with the stratification of the ERA5 reanalysis data. After matching, the NCEP
forecast data in the matched dataset are used as the initial profiles for the physical retrieval
algorithm. The NCEP reanalysis data are used as the validation data.
2.2. Data Preprocessing
The quality control of MWHTS-observed data is carried out to eliminate invalid data
before data matching. Then, the MWHTS-observed data, ERA5 reanalysis data, and NCEP
reanalysis and forecast data are matched using different temporal and spatial resolutions.
Figure 1 summarizes the data preprocessing process. The matching principle between
the MWHTS observed data and the ERA5 and NCEP data is that the time difference is
not less than 30 min, and the spatial difference is less than 0.1◦. Considering that there is
a large amount of sea ice and mixed ice–water and that the natural background of land is
more complex in the Arctic marine region, we divided these matching data into sea ice,
mixed ice–water, and land through the land–sea mask data of MWHTS and the sea ice
cover data of ERA5. After completing the matching steps, a total of 771,623, 1,508,152, and
1,183,313 samples were matched over sea ice, mixed ice–water, and land for the whole year
of 2020, respectively. To establish more stable and reliable models, 10-fold cross-validation
(10-CV) was implemented by calling up the GridSearchCV function. Therefore, the above
matched datasets were divided into ten subsets, of which nine subsets were used for model
training and one subset for testing to establish retrieval models over sea ice, land, mixed
ice–water, and mixed surface, respectively. Meanwhile, GridSearchCV further randomly
divided the whole year of 2020 into an 80% training dataset and 20% test dataset to adjust
hyperparameters. Finally, we fit the model to the entire set of training data with the best
parameters. To verify the generalization performance of the established retrieval models,
we also collected data over sea ice, land, mixed ice–water, and mixed surface in February,
April, June, and September 2021, respectively, as the independent validation datasets.
Remote Sens. 2022, 14, 5858 5 of 26
Figure 1. The schematic of the data preprocessing process.
3. Algorithm and Experiment Design
3.1. Deep Neural Networks
DNN is a neural network model with multiple hidden layers, including the forward
propagation algorithm and the backpropagation algorithm [31]. The loss function is calcu-
lated in the forward propagation, and the backward propagation is an optimization process.
The model parameters can be optimized and updated by reducing the loss function value
using the gradient descent method. The neural network layer inside DNN can be divided
into three types: input layer, hidden layer, and output layer. These layers are connected by
full connection layers [32].
In this paper, a temperature and humidity profile retrieval model based on DNN is
established. The accuracy of the DNN model is mainly affected by the activation function,
hidden layer number, hidden layer neurons, learning rate, and optimizer. By using the
GridSearchCV method to automatically adjust parameters, a set of optimal parameter
combinations is found so that the model has the best effect under this set of parameters.
Here, we select the ReLU function as the activation function of the hidden layer to overcome
the gradient disappearance problem. The parameters of hidden layers number, hidden layer
neurons, and batch size are determined by the GridSearchCV method. The same and the
different numbers of neurons in each hidden layer are searched from 300 to 600 at intervals
of 50 neurons. Results show that the same number of neurons in each hidden layer has
better performance than that of a different number of neurons. The DNN model is finally
selected as a six-layer network structure, including one input layer, four hidden layers, and
one output layer, and the number of neurons in each hidden layer is 400. The learning rate
is 0.0001. The optimizer chooses Adam. Figure 2 shows the neural network structure of the
established DNN model, which can simultaneously retrieve the atmospheric temperature
and humidity profiles. The input parameters are FY-3D/MWHTS brightness temperature
data. The reference truth of the DNN-based model is the atmospheric temperature and
humidity profiles of the ERA5 reanalysis data.
Remote Sens. 2022, 14, 5858 6 of 26
Figure 2. The DNN network structure.
3.2. Long Short-Term Memory
LSTM is an improved model of recurrent neural network (RNN), hence inheriting the
strengths of the RNN model [33]. Compared with RNN, it has long-term memory functions
and can avoid the gradient disappearance problem. Different from DNN, the hidden layer
of LSTM contains storage units with memory functions, which can effectively process the
time series data. The forget gates, input gates, and output gates of LSTM are used to control
the degree of memory and the forgetting of previous and current information [34].
In this paper, a retrieval model of temperature and humidity profiles based on LSTM
is also established. The key parameters of the LSTM model are the loss function, activation
function, dropout function, optimizer, and the number of hidden layer neurons. The
purpose of the loss function is to calculate the amount that the model should seek to
minimize during training and finally set the loss function as the mean square error (MSE).
Activation functions are mainly used to give the input or output of a group of input nodes.
Common ones such as Tanh and Sigmoid are nonlinear activation functions. Tanh is used to
adjust the value flowing through the network with the value range of [−1, 1]. The Sigmoid
function, unlike Tanh, which helps the network update or forget data, has a value range
of [0, 1]. We utilized the GridSearchCV method to optimize the model hyperparameters.
After comparison, the activation function is set to Tanh. The dropout function provides an
effective method for the approximate combination of various neural network structures
in exponential form. It can prevent over-fitting by randomly ignoring selected neurons
during the training period. The dropout probability is set to 0.2. The optimizer selects
Adam. The number of neurons in the hidden layer increases from 30 to 100, and the search
is performed with intervals of 5 neurons. Through the experiment, we found that the best
result is the same number of 50 neurons in each hidden layer. Figure 3 shows the neural
network structure of the established LSTM model.
Remote Sens. 2022, 14, 5858 7 of 26
Figure 3. The LSTM block diagram.
3.3. The Physical Retrieval Algorithm
Saunders, R. [35] indicated that the calculation accuracy of simulated brightness
temperatures using the radiative transfer for television and infrared orbiting satellite
operational vertical sounder (RTTOV) can meet the application requirements. Thus, the
RTTOV and the 1DVAR algorithm are used as the forward model and retrieval algorithm,
respectively, in this paper. The 1DVAR algorithm is mainly composed of two parts. One is
the RTTOV model used to generate simulated brightness temperature, and another is to
minimize the cost function [36–38]. In the process of the 1DVAR algorithm, we first input
the initial atmospheric profiles to the RTTOV model to produce simulations brightness
temperature, and then conduct an iterative process to fit RTTOV simulations to MWHTS
observations by adjusting the initial atmospheric profiles. Figure 4 shows the procedure to
establish the 1DVAR retrieval system.
Remote Sens. 2022, 14, 5858 8 of 26
Figure 4. The flow chart of the physical retrieval algorithm for the MWHTS in this paper.
First, the initial values of the atmospheric temperature and humidity profiles in the
dataset are used as inputs into the RTTOV model to calculate the simulated brightness
temperature. The initial state variables come from the collocated NCEP 6 h forecast
temperature and humidity profiles. Second, we establish a DNN-correction model (four-
layer network structure) to correct the observation bias between the observed brightness
temperature from MWHTS and the simulated brightness temperature from the RTTOV
model. The building process of the DNN-correction model is the same as in Section 3.1. The
input of the DNN-correction model is the observed brightness temperature by MWHTS,
and the output is the bias between observations and simulations. Based on the DNN-
correction model, the bias of the observations for MWHTS can be corrected. Third, the
observation-error covariance matrix generated by the errors of the forward models and
instrument and background covariance matrix describing the atmospheric state variables
is calculated, respectively. Reference [35] gives the details calculation process of these
two covariance matrixes. Finally, the corrected brightness temperature, two covariance
matrixes, background profiles, and initial atmospheric profiles are input into the 1DVAR
retrieval system to obtain the retrieval results.
Remote Sens. 2022, 14, 5858 9 of 26
4. Results Analysis and Discussion
In this section, based on the MWHTS observations, the temperature and humidity
profile retrieval results in Artic regions using the DNN model, LSTM model, and phys-
ical retrieval algorithm are presented. To better ensure the generalization ability of the
established DNN and LSTM models, we use the fully independent validation dataset in
June 2021 to compare the performance of these two models with the physical retrieval
algorithm. The ERA5 data are used as the reference data to evaluate the retrieval accuracies
of the retrieved atmospheric temperature and humidity profiles for three retrieval methods.
Reference [39] compared the near-surface temperature data of ERA5 and ERA-Interim with
the measured data of 41 weather stations to evaluate the performance of ERA5 in Antarctica.
In general, ERA5 can effectively reflect the temperature changes of Antarctica, and it is
a powerful tool that can play an important role in exploring Antarctic climate change when
in situ observations are sparse. In polar regions, the ECMWF data is generally used as the
real values of temperature and humidity profiles to compare with the retrieved results.
For example, reference [20] compared the retrieved temperature profiles from AMSU with
ECMWF data. Reference [40] estimated the retrieval accuracies of the temperature and
pressure profiles, as well as the refractive index of tropospheric dry air and water vapor in
the entire Arctic Circle, from radio occultation data, which also used the ECMWF data as
reference data. Reference [41] utilized the observations from the high-spectral resolution
infrared atmospheric sounder for the FY-3D to retrieve the atmospheric temperature and
humidity profiles in the Arctic region, which also compared the retrieved results with
the ERA5. Thus, we follow the general validation method and also use ERA5 data as
the reference data to verify and compare the retrieval results. Meanwhile, we also add
the NCEP independent validation data in February, April, June, and September 2021 to
access the quality of the DNN-based model and LSTM-based model over different surface
types. The following evaluation indexes are considered to analyze the performance of these
two established models and physical retrieval algorithm:
R = ∑n
i=1(xi − x)(yi − y)
√
∑n
i=1(xi − x)2∑n
i=1(yi − y)2 (1)
RMSE =
√ 1
n ∑n
i=1(xi − yi)2 (2)
bias = ∑n
i=1 xi − yi
n (3)
where n represents the number of profiles; xi denotes the retrieved atmospheric parameters
from the MWHTS observed data; yi represents the true value of atmospheric parameters.
4.1. Comparison of Retrieval Results over Sea Ice
Considering the distribution characteristics of peak weight function heights for MWHTS
channels, in this paper, the analysis of temperature retrieval results is from 50 hPa to
1000 hPa and the relative humidity retrieval results are 225 hPa to 1000 hPa. Figure 5
shows the density scatter plots of the retrieval results of the DNN and LSTM models versus
the ERA5 based on the validation dataset in June 2021 over sea ice, and the black lines
represent the diagonal y = x, N is the samples of test data, and R represents the correlation
coefficient. As can be seen, the temperature retrieval results of the DNN and LSTM models
are concentrated on the diagonal, and the correlation coefficients are as high as 0.99 for
these two models. The bias of the retrieved temperatures for both are 0.01 K, and the root
mean squares errors (RMSEs) are 1.29 K and 1.21 K, respectively. Although the correlation
coefficients between the retrieval values and validation values of relative humidity are still
high, the retrieval results are relatively dispersed compared with the temperature. The
humidity retrieval bias and RMSE are −0.15% and 11.03%, respectively, for the DNN-based
model, and −0.02% and 10.50%, respectively, for the LSTM-based model.
Remote Sens. 2022, 14, 5858 10 of 26
Figure 5. The retrieval results of the DNN and LSTM models versus the ERA5 over sea ice using
the validation dataset in June 2021. (a,b) are the atmospheric temperature retrieval results of the
DNN model and LSTM model, respectively. (c,d) are the atmospheric humidity retrieval results of
the DNN model and LSTM model, respectively.
In addition, to evaluate the generalization capability of the established DNN and
LSTM models, we use the fully independent validation dataset in June 2021 to retrieve the
atmospheric temperature and humidity profiles for MWHTS over sea ice. The output results
of the DNN and LSTM models are compared with the physical retrieval algorithm, which is
shown in Figure 6. It should be noted that to further validate the reliability of the retrieval
results for the three retrieval methods, we also add the comparison between the retrieved
temperature and humidity profiles and NCEP reanalysis data in Figure 6. The temperature
retrieval results between 50–1000 hPa are presented on the left, and the humidity retrieval
results between 225–1000 hPa are presented on the right. As can be seen, the trends of the
retrieved temperature and humidity profiles over sea ice compared with NCEP are almost
consistent with those compared with ERA5, especially for the retrieved humidity profiles.
The RMSEs of the retrieved temperature profiles for the three methods near 900 hPa are
slightly lower in the NCEP comparisons than in the ERA5 comparisons. On the contrary,
the RMSEs of the retrieved temperature profiles for three methods between 350 hPa and
700 hPa are slightly higher in the NCEP comparisons than in the ERA5 comparisons.
Remote Sens. 2022, 14, 5858 11 of 26
Figure 6. The retrieval RMSEs of the DNN model, the LSTM model, and the physical retrieval
algorithm with respect to ERA5 and NCEP reanalysis data over sea ice in June 2021.
Compared to the ERA5 and NCEP data, the retrieval accuracies of the temperature and
relative humidity profiles for the DNN and LSTM models are basically better than the phys-
ical retrieval algorithm in the whole atmosphere. The RMSEs of the retrieved temperature
profile of the DNN model, the LSTM model, and the physical retrieval algorithm are within
4 K, 3.5 K, and 6 K, respectively. Between 200–950 hPa, the RMSEs of the DNN and LSTM
models are reduced by more than 0.45 K and the maximum reduced by 2.62 K compared to
the physical retrieval algorithm. Especially, at the near-surface, the RMSEs of these two
models can be maximum improved by about 3.55 K. The temperature retrieval accuracy of
the DNN model is better than that of the LSTM model at around 900 hPa, and the RMSE is
reduced by 0.58 K. While from 200 hPa to 400 hPa, the RMSE of the LSTM model is better,
and the retrieval accuracy is improved by 0.4 K. The RMSEs of the retrieved humidity
profile of the DNN model, LSTM model, and physical retrieval algorithm are within 5–25%,
5–20%, and 10–60%, respectively. The RMSEs of the retrieved relative humidity profile of
the DNN and LSTM models are improved by about 20% compared to the physical retrieval
algorithm in the range of 650–950 hPa. In particular, retrieval accuracy can be improved by
about 42.6% at 450 hPa. The RMSE of the LSTM model is improved by about 1–3% between
250–450 hPa over that of the DNN model. Overall, the performance of the LSTM model is
slightly better than that of the DNN model for the humidity profile retrieval over sea ice in
June 2021.
Based on the independent validation dataset, Figures 7, A1 and A2 (see Appendix A)
show the retrieval results of the temperature profile (left) and relative humidity profile
(right) over sea ice in February, April, and September 2021, respectively. As can be seen, the
trends of the retrieved temperature profiles over sea ice compared with NCEP are almost
consistent with those compared with ERA5 except for the 75–150 hPa and 800–900 hPa
of September. However, the accuracies of the retrieved humidity profiles compared with
NCEP are higher than those compared with ERA5 between 75–150 hPa, which are opposite,
between 500–900 hPa. Especially for April and September, compared with NCEP and ERA5,
Remote Sens. 2022, 14, 5858 12 of 26
the maximum differences in the accuracies for humidity profiles can reach 5%. This is
because the ERA5 is used as the reference of the truth; the retrieval results of the two models
will be closer to ERA5. The RMSEs of the retrieved temperature profiles for the two models
are basically within 3 K, except for near-surface in February and at 50 hPa in April, and
the retrieved humidity profiles are within 15–25% between 300–1000 hPa. The retrieved
temperature profile in February is impacted by the surface emissivity; the RMSE is up to
5.4 K at 975 hPa compared to NCEP. In general, the retrieved results of the temperature
profiles for the DNN-based model in three months are superior to the LSTM-based model,
except for 225–650 hPa in April, but it is the opposite for the retrieved humidity profiles;
the retrieval results of the LSTM-based model are better than those of the DNN-based
model apart from 350–550 hPa. Combined with Figure 6, the accuracies of the retrieved
temperature and humidity profiles for the two models in April and June are better than
those in February and September. Especially in February, the snow cover increases and
the volume scattering in the snow is strong, which impact the retrieval accuracy of the
two models at the near-surface [42].
Figure 7. The retrieval RMSEs of the DNN-based model and LSTM-based model with respect to
ERA5 and NCEP reanalysis data over sea ice in February 2021.
4.2. Comparison of Retrieval Results over Land
As in Figure 6, Figure 8 shows the density scatter plots of the retrieved temperature
and humidity profiles from the validation dataset in June 2021 over land. It shows that the
correlation coefficients of the temperature retrieval results for the DNN and LSTM models
can reach 0.99 and are concentrated on the diagonal. The bias of the retrieved temperature
of the DNN model and LSTM model are both 0.02 K, and the RMSEs are 1.97 K and 1.83 K,
respectively. The density scatter plots of humidity retrieval results are more dispersed than
those of temperature. The humidity retrieval bias of the DNN and LSTM models are 0.16%
and −0.14% and the RMSEs are 13.70% and 13.10%, respectively.
Remote Sens. 2022, 14, 5858 13 of 26
Figure 8. The retrieval results of the DNN and LSTM models versus the ERA5 over land using the
validation dataset in June 2021, the black lines represent the diagonal y = x. (a,b) are the temperature
retrieval results of the DNN model and LSTM model, respectively. (c,d) are the atmospheric humidity
retrieval results of the DNN model and LSTM model, respectively.
Figure 9 shows the retrieval results of the temperature profile (left) and relative hu-
midity profile (right) over land in June 2021. The trends of the retrieved temperature
and humidity profiles over land compared with NCEP are almost consistent with those
compared with ERA5. Compared to the ERA5 and NCEP data, the retrieved temperature
and humidity profiles of the DNN and LSTM models over land are better than the physical
retrieval algorithm in the whole atmosphere. The RMSEs of the retrieved temperature
profiles for the DNN and LSTM models are both within 4 K except for 800–900 hPa, but
within 9 K for the physical retrieval algorithm. Compared with the physical retrieval
algorithm, the RMSEs of the DNN and LSTM models are reduced by about 5 K and 4 K
between 175–225 hPa and between 400–650 hPa, respectively. In the range of 200–500 hPa,
the temperature retrieval accuracy of the LSTM model is improved by 0.1–0.5 K compared
with the DNN model. It is worth noting that the special geographical location of the Arctic
regions increases the difficulty of modeling surface emissivity over land; there still are
larger errors between simulation brightness temperatures from RTTOV and observation
brightness temperatures from MWHTS after bias correction. However, the 1DVAR retrieval
algorithm requires that the bias between the observed brightness temperature and the
Remote Sens. 2022, 14, 5858 14 of 26
simulated brightness temperature is unbiased and agrees with the Gaussian distribution;
the existence of the larger bias will lead to retrieval failure. In this paper, for the atmospheric
humidity profile retrieval over land, the physical retrieval algorithm does not converge
under a larger observation bias and fails to obtain the humidity profile information from
observations (the green lines of the right sub-graph of Figure 9). Here, we do not compare
the retrieved humidity results for the DNN and LSTM models with the physical retrieval
algorithm. The RMSEs of the retrieved humidity profile for the DNN and LSTM models
are all between 15–25% compared with ERA5 and NCEP. Between 400–950 hPa, the hu-
midity retrieval accuracy of the LSTM model is better than that of the DNN model, with
a maximum improvement of 1.4%. In the range of 300–400 hPa, the LSTM and DNN mod-
els almost have the same RMSE. These results indicate that the performance of the LSTM
model is slightly better than that of the DNN model over land in June 2021. Combined
with Figure 6, the temperature retrieval accuracy of the DNN and LSTM models over land
is worse than that over sea ice between 175–1000 hPa, but the humidity profile is slightly
better than that over sea ice between 500–800 hPa.
Figure 9. The retrieval RMSEs of the DNN model, the LSTM model, and the physical retrieval
algorithm with respect to ERA5 and NCEP reanalysis data over land in June 2021.
Figures 10, A3 and A4 (see Appendix A) show the retrieval results of the temperature
profile (left) and relative humidity profile (right) over land. Compared to ERA5 and NCEP,
the RMSE of the retrieved temperature and humidity profiles for the DNN-based model
and LSTM-based model over land is higher than those over sea ice in the three selected
months. The trends of the retrieved temperature profiles over land compared with NCEP
are almost consistent with those compared with ERA5, except around 900 hPa in February
and September and 200–250 hPa in September. Between 225–350 hPa, the RMSE of the
retrieved humidity profiles compared with NCEP are lower than those compared with
ERA5, and opposite trends appear in the range of 450–700 hPa. The maximum differences
of the accuracies for humidity profile up to 5% at 850 hPa in September when compared
with NCEP and ERA5. The RMSEs of the retrieved temperature profiles for the two models
Remote Sens. 2022, 14, 5858 15 of 26
are within 4 K between 75–750 hPa in the selected months and reached 5 K in the range
of 800–950 hPa in February and September. Except for 300–400 hPa in February and
225 hPa in September, the RMSEs of the retrieved humidity profiles are within 10%–25%.
The retrieved temperature profiles are impacted by the surface emissivity in February and
September; compared to NCEP and ERA5, the RMSE is up to 7.7 K at 1000 hPa in February
and basically above 3 K between 200–1000 hPa in September. In general, the retrieved
temperature profiles for the DNN-based model are superior to the LSTM-based model
except for 200–500 hPa in April and 200–350 hPa in September. However, for the retrieved
humidity profiles, the retrieval results of the LSTM-based model are better than those of the
DNN-based model. Combined with Figure 9, the accuracies of the retrieved temperature
and humidity profiles for the two models over land in April and June are also better than
those in February and September. Especially in February, the emissivity of the land surface
is highly variable because of the snow cover, and the retrieval accuracies of the two models
are impacted at the near-surface [42]. The retrieval trends of the two models are almost
consistent compared with NCEP and ERA5, including the retrieval of the temperature and
relative humidity profiles.
Figure 10. The retrieval RMSEs of the DNN-based model and the LSTM-based model with respect to
the ERA5 and NCEP reanalysis data over land in February 2021.
4.3. Retrieval Results over Mixed Ice–Water
The physical retrieval algorithm is affected by the surface emissivity, which is difficult
to simulate by the RTTOV over mixed ice–water. Therefore, Figures 11, 12, A5 and A6
(see Appendix A) show the retrieval results of the temperature profile (left) and relative
humidity profile (right) over mixed ice–water. The trends of the retrieved temperature and
humidity profiles over mixed ice–water is almost consistent with those over sea ice, but
the retrieval accuracies are worse than those over sea ice because there is the presence of
different surface types within one sensor footprint, which impacts the retrieval results. The
RMSEs of the retrieved temperature profiles for the two models compared with NCEP are
lower than those compared with ERA5 at 900 hPa in April and September. The RMSEs of
the retrieved humidity profiles for two models between 500–900 hPa are slightly higher
Remote Sens. 2022, 14, 5858 16 of 26
in the NCEP comparisons than in the ERA5 comparisons in February, April, and June.
Especially the maximum differences in the accuracies for temperature and humidity profiles
can reach about 1 K and 4% compared with NCEP and ERA5, respectively, in February and
September. Overall, the RMSEs of the retrieved temperature profile for the two models
are within 4 K, apart from the retrieval result for the LSTM-based model in February.
The stability of the DNN-based model for temperature profile retrieval is better than the
LSTM-based model. For the humidity profile retrieval, the RMSEs for the two models
are basically within 5–25%, apart from in February. The LSTM-based model shows better
performance, and the RMSEs are improved by 0.1–2.1% over those of the DNN-based model
between 300–900 hPa in February and April. The accuracy is maximum improved by about
5% for the LSTM-based model over that for the DNN-based model in April. Compared
to other months, the accuracies of the retrieved temperature and humidity profiles for the
two models are still lower in February.
4.4. Retrieval Results over Mixed Surface
The temperature and humidity profiles over the mixed surface (including sea ice, land,
and mixed ice–water) are difficult to obtain by the physical retrieval algorithm. Here, we
still only analyze the retrieval results of the DNN and LSTM models using the validation
dataset. Figures 13, 14, A7 and A8 (see Appendix A) show the retrieval results over the
mixed surface. The trends of the retrieved temperature and relative humidity profiles over
the mixed surface are also basically consistent with those over sea ice and mixed ice–water.
Due to the relatively worse performance of the DNN and LSTM for the temperature profile
retrieval over land, the RMSEs of the retrieved temperature and humidity profiles for the
DNN-based model and LSTM-based model with respect to ERA5 and NCEP over mixed
surface are higher than those over sea ice. The trends of the retrieved temperature profiles
over mixed surface compared with NCEP are almost consistent with those compared
with ERA5 besides the near-surface of September. Between 225–350 hPa, the RMSE of the
retrieved humidity profiles compared with NCEP are lower than those compared with
ERA5 besides June, and opposite trends appear in the range of 450–700 hPa. The maximum
differences of the accuracies for humidity profile up to 2.9% at 450 hPa in June when
compared with NCEP and ERA5. The RMSEs of the retrieved temperature profiles for the
two models are within 4 K in April and September and within 5 K in February and June.
Except for in February, the RMSEs of the retrieved humidity profiles are within 10–25%.
The retrieved temperature profiles in February and September are impacted by the surface
emissivity; the RMSE is up to 5 K between 800–100 hPa compared to NCEP and ERA5. The
retrieved temperature profiles for the DNN-based model are superior to the LSTM-based
model between 450–950 hPa in February, June, and September, and the RMSE is maximum
improved by 1.1 K around 850 hPa in February, but for the retrieved humidity profiles, the
retrieval results of the LSTM-based model are better than those of the DNN-based model
except for the 750–950 hPa of February. The RMSEs of the LSTM-based model are improved
by 1.1–3.9% and 0.7–3.5% over those of the DNN-based model in April and September,
respectively. Overall, the accuracies of the retrieved temperature and humidity profiles
for the two models over the mixed surface in April and June are also better than those in
February and September.
Remote Sens. 2022, 14, 5858 17 of 26
Figure 11. The retrieval RMSEs of the DNN and LSTM models with respect to ERA5 and NCEP
reanalysis data over mixed ice–water in June 2021.
Figure 12. The retrieval RMSEs of the DNN model and the LSTM model with respect to ERA5 and
NCEP reanalysis data over mixed ice–water in February 2021.
Remote Sens. 2022, 14, 5858 18 of 26
Figure 13. The retrieval RMSEs of the DNN and LSTM models compared with ERA5 over mixed
surface in June 2021.
Figure 14. The retrieval RMSEs of the DNN model and the LSTM model with respect to ERA5 and
NCEP reanalysis data over mixed surface in February 2021.
Remote Sens. 2022, 14, 5858 19 of 26
By comparing the results from Figures 6–14 and A1–A8 (see Appendix A), it can be
seen that the accuracies of the retrieved temperature profiles for the DNN-based model are
better than for the LSTM-based model in most cases, but the retrieved humidity profiles
have the opposite results. The trends of the retrieved temperature and humidity profiles
for the two models are almost consistent, except for the near-surface, whether compared
to ERA5 or NCEP. The RMSEs of the retrieved temperature profiles for the two models
only around 900 hPa are different in the NCEP and ERA5 comparisons. However, for the
retrieved humidity profiles, the RMSEs for the two models are slightly higher in the NCEP
comparisons than in the ERA5 comparisons in most cases. For different surface types, the
retrieval accuracies of the temperature profiles for the two models are relatively poor at
near-surface in February. Apart from the near-surface, mostly the RMSEs of the retrieved
temperature profiles in September are higher than in other months. The RMSEs of the
retrieved temperature profiles for the two models are within 4 K, except for the near-surface,
and the humidity profiles are within 25% except for in February. The temperature profiles
in September and humidity profiles in February are somewhat reduced compared to other
months because of the highly variable emissivity properties.
5. Conclusions
Different from the physical retrieval algorithm, machine learning methods can avoid
the modeling of surface emissivity. Through learning the internal relationships between
measurements and retrieval parameters, the atmospheric temperature and humidity pro-
files can be obtained by the machine learning method. Considering that it is difficult to
model the surface emissivity in the polar regions, in this paper, we establish two machine
learning models to retrieve atmospheric temperature and humidity profiles in Arctic re-
gions. To optimize the model performance, we utilize the grid search and 10-CV method
to determine the hyperparameters of the DNN and LSTM models. Then, the retrieval
performances of the two models are compared with the physical retrieval algorithm under
all-weather conditions over different surface types, and the performances of the two models
are also evaluated using independent validation data for different seasons by comparing
with NCEP and ERA5 data. The capability of the temperature and humidity profile retrieval
in the Arctic region using MWHTS observations is demonstrated.
To better evaluate the generalization performance of these two established machine
learning models, we used the independent validation dataset collected in June, February,
April, and September 2021 as the representatives of summer, winter, spring, and autumn,
respectively, to assess the quality of the retrieval results for the temperature and humidity
profiles. Taking June as an example, we evaluate the performance of the two models by
comparing the retrieval results with the physical retrieval algorithm. Results show that
the trends of the retrieved temperature and humidity profiles for two machine learning
models and physical retrieval algorithms over sea ice and land in the NCEP comparisons
are almost consistent with those in the ERA5 comparisons. Compared to ERA5 and
NCEP, the RMSEs of the temperature and humidity profiles of these two models are better
than those of the physical retrieval algorithm over sea ice and land. The RMSEs of the
retrieved temperature and humidity profiles over sea ice can be improved by more than
0.4 K and 20%, respectively, between 650–950 hPa. The RMSEs maximum is improved
by 3.55 K at 1000 hPa and 42.6% at 450 hPa, respectively. Over the land, the RMSEs of
the retrieved temperature profiles for these two models can improve up to 5 K at 200 hPa.
The retrieved humidity results for these two models are not compared with the physical
retrieval algorithm, which fails to retrieve the humidity profile over land. Overall, the
retrieved temperature profile accuracy over sea ice is higher than that over land.
Remote Sens. 2022, 14, 5858 20 of 26
In addition, considering that the surface emissivity is difficult to model over mixed ice–
water and mixed surface, we only analyze the temperature and humidity profile retrieval
performance of the DNN and LSTM models by comparing them with ERA5 and NCEP data.
For different surface types, the retrieval accuracies of the temperature profiles for the DNN-
based model are better than the LSTM-based model in most cases, but there are opposite
results for the retrieved humidity profiles. The trends of the retrieved temperature and
humidity profiles for the two models over different surface types compared with NCEP are
almost consistent with those compared with ERA5, except for the near-surface. The retrieval
accuracies of temperature profiles for the two models in different seasons over different
surface types are within 4 K, except for near-surface, and the humidity profiles are within
25% except for in February. Overall, the temperature profiles in autumn and humidity
profiles in winter are somewhat reduced compared to other seasons because of the highly
variable emissivity properties. In the future, to improve the temperature and humidity
profile retrieval accuracies of the machine learning method, we will further develop the
representativeness of the training samples by dividing the MWHTS observations into clear
sky and cloudy sky observed data, respectively.
Author Contributions: Conceptualization, L.Z. and Q.H.; methodology, L.Z. and Q.H.; software,
L.Z., Q.H. and S.T.; validation, S.T. and W.W.; formal analysis, L.Z. and S.T.; investigation, L.Z. and
S.T.; resources, W.W.; data curation, L.Z. and S.T.; writing—original draft preparation, L.Z. and S.T.;
writing—review and editing, L.Z., Q.H. and W.W.; visualization, W.W.; supervision, Q.H.; project
administration, Q.H. and W.W.; funding acquisition, Q.H. All authors have read and agreed to the
published version of the manuscript.
Funding: This research was funded by the National Natural Science Foundation of China un-
der Grant No. 62001033 and No. 41901297, the Science and Technology Key Project of Henan
Province under Grant No. 202102310017, and the China Postdoctoral Science Foundation under
Grant No. 2021M693201.
Institutional Review Board Statement: Not applicable.
Informed Consent Statement: Not applicable.
Data Availability Statement: All data generated or analyzed during this study are included in
this article.
Acknowledgments: The authors would like to thank the National Satellite Meteorological Center for
providing the MWHTS observations, ECMWF ERA5 for providing the ERA5 reanalysis data, and
NCEP for providing the reanalysis and forecast data.
Conflicts of Interest: The authors declare no conflict of interest.
Remote Sens. 2022, 14, 5858 21 of 26
Appendix A Comparison of Retrieval Results over Different Surface Types
Figure A1. The retrieval RMSEs of the DNN-based model and LSTM-based model with respect to
ERA5 and NCEP reanalysis data over sea ice in April 2021.
Figure A2. The retrieval RMSEs of the DNN-based model and LSTM-based model with respect to
ERA5 and NCEP reanalysis data over sea ice in September 2021.
Remote Sens. 2022, 14, 5858 22 of 26
Figure A3. The retrieval RMSEs of the DNN-based model and the LSTM-based model with respect
to ERA5 and NCEP reanalysis data over land in April 2021.
Figure A4. The retrieval RMSEs of the DNN-based model and the LSTM-based with respect to ERA5
and NCEP reanalysis data over land in September 2021.
Remote Sens. 2022, 14, 5858 23 of 26
Figure A5. The retrieval RMSEs of the DNN model and the LSTM model with respect to ERA5 and
NCEP reanalysis data over mixed ice–water in April 2021.
Figure A6. The retrieval RMSEs of the DNN model and the LSTM model with respect to ERA5 and
NCEP reanalysis data over mixed ice–water in September 2021.
Remote Sens. 2022, 14, 5858 24 of 26
Figure A7. The retrieval RMSEs of the DNN model and the LSTM model with respect to ERA5 and
NCEP reanalysis data over mixed surface in April 2021.
Figure A8. The retrieval RMSEs of the DNN model and the LSTM model with respect to ERA5 and
NCEP reanalysis data over mixed surface in September 2021.
Remote Sens. 2022, 14, 5858 25 of 26
References
1. Bjorkman, A.D.; García Criado, M.; Myers-Smith, I.H.; Ravolainen, V.; Jónsdóttir, I.S.; Westergaard, K.B.; Lawler, J.P.; Aronsson, M.;
Bennett, B.; Gardfjell, H. Status and trends in Arctic vegetation: Evidence from experimental warming and long-term monitoring.
Ambio A J. Hum. Environ. 2020, 49, 678–692. [CrossRef] [PubMed]
2. Weller, G. Impacts of climate change in the Arctic. In Proceedings of the IEEE 2001 International Geoscience and Remote Sensing
Symposium, Sydney, NSW, Australia, 9–13 July 2001.
3. Kwok, R. Arctic sea ice thickness, volume, and multiyear ice coverage: Losses and coupled variability (1958–2018). Environ. Res.
Lett. 2018, 13, 105005. [CrossRef]
4. England, M.; Eisenman, I.; Lutsko, N.; Wagner, T.J.W. The recent emergence of Arctic Amplification. Geophys. Res. Lett. 2021, 48,
e2021GL094086. [CrossRef]
5. Cohen, J.; Screen, J.A.; Furtado, J.C.; Barlow, M.; Whittleston, D.; Coumou, D.; Francis, J.; Dethloff, K.; Entekhabi, D.;
Overland, J.; et al. Recent Arctic amplification and extreme mid-latitude weather. Nat. Geosci. 2014, 7, 627–637. [CrossRef]
6. Zhao, J.; Zhong, W.; Diao, Y.; Cao, Y. The rapidly changing Arctic and its impact on global climate. J. Ocean Univ. China 2019, 18,
537–541. [CrossRef]
7. Overland, J.; Dunlea, E.; Box, J.E.; Corell, R.; Forsius, M.; Kattsov, V.; Olsen, M.S.; Pawlak, J.; Reiersen, L.-O.; Wang, M. The
urgency of Arctic change. Polar Sci. 2019, 21, 6–13. [CrossRef]
8. Ebell, K.; Orlandi, E.; Hünerbein, A.; Lhnert, U.; Crewell, S. Combining ground-based with satellite-based measurements in the
atmospheric state retrieval: Assessment of the information content. J. Geophys. Res. Atmos. 2013, 118, 6940–6956. [CrossRef]
9. Mccarthy, M.P.; Thorne, P.W.; Titchner, H.A. An analysis of tropospheric humidity trends from radiosondes. J. Clim. 2009, 22,
5820–5838. [CrossRef]
10. Yan, X.; Liang, C.; Jiang, Y.; Luo, N.; Li, Z. A deep learning approach to improve the retrieval of temperature and humidity
profiles from a ground-based microwave radiometer. IEEE Trans. Geosci. Electron. 2020, 58, 8427–8437. [CrossRef]
11. Liu, K.; He, J.; Chen, H. Precipitation Retrieval from Fengyun-3D Microwave Humidity and Temperature Sounder Data Using
Machine Learning. Remote Sens. 2022, 14, 848. [CrossRef]
12. Zhu, L.; Bao, Y.; Petropoulos, G.P.; Zhang, P.; Lu, F.; Lu, Q.; Wu, Y.; Xu, D. Temperature and Humidity Profiles Retrieval in a Plain
Area from Fengyun-3D/HIRAS Sensor Using a 1D-VAR Assimilation Scheme. Remote Sens. 2020, 12, 435. [CrossRef]
13. Xue, Q.; Guan, L.; Shi, X. One-Dimensional Variational Retrieval of Temperature and Humidity Profiles from the FY4A GIIRS.
Adv. Atmos. Sci. 2022, 39, 471–486. [CrossRef]
14. Gómez, A.T.; Heygster, G.; Melsheimer, C.; Spreen, G. Towards a Merged Total Water Vapour Retrieval from AMSU-B and
AMSR-E Data in the Arctic Region. In Proceedings of the IGARSS 2018—IEEE International Geoscience and Remote Sensing
Symposium, Valencia, Spain, 22–27 July 2018.
15. Liu, Q.; Weng, F. One-dimensional variational retrieval algorithm of temperature, water vapor, and cloud water profiles from
advanced microwave sounding unit (AMSU). IEEE Trans. Geosci. Electron. 2005, 43, 1087–1095.
16. He, Q.; Wang, Z.; He, J. Temperature and humidity profiles retrieving over land using clear sky measurements of microwave
humidity-temperature sounder on Chinese FY-3C satellite. In Proceedings of the 2016 IEEE International Geoscience and Remote
Sensing Symposium, Beijing, China, 10–15 July 2016.
17. He, Q.; Wang, Z.; He, J. Inversion of the clear atmosphere temperature and humidity profiles based on FY-3C/MWHTS
measurements. Chin. J. Radio Sci. 2016, 31, 772–778.
18. He, Q.; Wang, Z.; He, J. Bias correction for retrieval of atmospheric parameters from the Microwave Humidity and Temperature
Sounder onboard the Fengyun-3C satellite. Atmosphere 2016, 7, 156. [CrossRef]
19. Zou, X.; Wang, X.; Weng, F.; Li, G. Assessments of Chinese Fengyun Microwave Temperature Sounder (MWTS) measurements for
weather and climate applications. J. Atmos. Ocean. Technol. 2011, 28, 1206–1227. [CrossRef]
20. Mathew, N.; Heygster, G.; Rosenkranz, P. Retrieval of emissivity and temperature profile in polar regions. In Proceedings of the
2006 IEEE International Symposium on Geoscience and Remote Sensing, Denver, CO, USA, 31 July–4 August 2006.
21. Cimini, D.; Westwater, E.R.; Gasiewski, A.J. Temperature and humidity profiling in the Arctic using ground-based millimeter-wave
radiometry and 1DVAR. J. IEEE Trans. Geosci. Remote Sens. 2009, 48, 1381–1388. [CrossRef]
22. Karbou, F.; Aires, F.; Prigent, C.; Eymard, L. Potential of Advanced Microwave Sounding Unit-A (AMSU-A) and AMSU-B
measurements for atmospheric temperature and humidity profiling over land. J. Geophys. Res. Atmos. 2005, 110, D07019. [CrossRef]
23. Gangwar, R.K.; Mathur, A.K.; Gohil, B.S.; Sujit, B. Neural network based retrieval of atmospheric temperature profile using
AMSU-A observations. Int. J. Atmos. Sci. 2014, 2014, 1–8. [CrossRef]
24. Songyan, G.; Yang, G.; Ran, Y.; Naimeng, L.; Xuebao, W. The Performance of Microwave Sounders Board on FY-3C Satellite.
Adv. Meteorol. Sci. Technol. 2016, 6, 76–82.
25. He, Q.; Wang, Z.; Li, J. Application of the deep neural network in retrieving the atmospheric temperature and humidity
profiles from the Microwave Humidity and Temperature Sounder onboard the Feng-Yun-3 satellite. Sensors 2021, 21, 4673.
[CrossRef] [PubMed]
26. Lawrence, H.; Bormann, N.; Geer, A.J.; Lu, Q.; English, S.J. Evaluation and Assimilation of the Microwave Sounder MWHS-2
Onboard FY-3C in the ECMWF Numerical Weather Prediction System. IEEE Trans. Geosci. Remote Sens. 2018, 56, 1–34. [CrossRef]
27. Lindskog, M.; Dybbroe, A.; Randriamampianina, R. Use of microwave radiances from Metop-C and Fengyun-3 C/D satellites for
a northern European limited-area data assimilation system. Adv. Atmos. Sci. 2021, 38, 1415–1428. [CrossRef]
Remote Sens. 2022, 14, 5858 26 of 26
28. Jiao, D.; Xu, N.; Yang, F.; Xu, K. Evaluation of spatial-temporal variation performance of ERA5 precipitation data in China. J. Sci.
Rep. 2021, 11, 17956. [CrossRef] [PubMed]
29. Meng, X.; Guo, J.; Han, Y.; Observatory, S.M. Preliminarily assessment of ERA5 reanalysis data. J. Mar. Meteorol. 2018, 38, 91–99.
30. Hersbach, H.; Bell, B.; Berrisford, P.; Horányi, A.; Muñoz Sabater, J.; Nicolas, J.; Peubey, C.; Radu, R.; Rozum, I.; Schepers, D.; et al.
ERA5 hourly data on single levels from 1979 to present. Copernic. Clim. Change Serv. (C3S) Clim. Data Store (CDS)
2018, 10. [CrossRef]
31. Hinton, G.E.; Osindero, S.; The, Y.W. A fast learning algorithm for deep belief nets. Neural Comput. 2016, 18, 1527–1554.
[CrossRef] [PubMed]
32. LeCun, Y.; Bengio, Y.; Hinton, G. Deep learning. Nature 2015, 521, 436–444. [CrossRef]
33. Guo, H.; Chen, Q.; Zheng, K.; Xia, Q.; Kang, C. Forecast aggregated supply curves in power markets based on LSTM model.
IEEE Trans. Power Syst. 2021, 36, 5767–5779. [CrossRef]
34. Gers, F.A.; Schmidhuber, J.; Cummins, F. Learning to forget: Continual prediction with LSTM. Neural Comput. 2000, 12,
2451–2471. [CrossRef]
35. Saunders, R.; Hocking, J.; Rundle, D.; Rayer, P.; Matricardi, M.; Geer, A.; Lupu, C.; Brunel, P.; Vidot, J. RTTOV-11 Science and
Validation Report; NWP-SAF Report; Met Office: Exeter, UK, 2013; pp. 1–62.
36. Hewison, T.J. 1D-VAR retrieval of temperature and humidity profiles from a ground-based microwave radiometer. J. IEEE Trans.
Geosci. Remote Sens. 2007, 45, 2163–2168. [CrossRef]
37. Löhnert, U.; Crewell, S.; Simmer, C. An integrated approach toward retrieving physically consistent profiles of temperature,
humidity, and cloud liquid water. J. Appl. Meteorol. Climatol. 2004, 43, 1295–1307. [CrossRef]
38. Löhnert, U.; van Meijgaard, E.; Baltink, H.K.; Groß, S.; Boers, R. Accuracy assessment of an integrated profiling technique for
operationally deriving profiles of temperature, humidity, and cloud liquid water. J. Geophys. Res. Atmos. 2007, 112. [CrossRef]
39. Zhu, J.; Xie, A.; Qin, X.; Wang, Y.; Xu, B.; Wang, Y. An assessment of ERA5 reanalysis for Antarctic near-surface air temperature.
J. Atmos. 2021, 12, 217. [CrossRef]
40. Pelliccia, F.; Pacifici, F.; Bonafoni, S.; Basili, P.; Pierdicca, N.; Ciotti, P.; Emery, W.J. Neural networks for arctic atmosphere sounding
from radio occultation data. J. IEEE Trans. Geosci. Remote Sens. 2011, 49, 4846–4855. [CrossRef]
41. Hu, J.; Bao, Y.; Liu, J.; Liu, H.; Petropoulos, G.P.; Katsafados, P.; Zhu, L.; Cai, X. Temperature and Relative Humidity Profile
Retrieval from Fengyun-3D/HIRAS in the Arctic Region. J. Remote Sens. 2021, 13, 1884. [CrossRef]
42. Mathew, N.; Heygster, G.; Melsheimer, C.; Kaleschke, L. Surface emissivity of artic sea ice at AMSU window frequencies.
IEEE Trans. Geosci. Remote Sens. 2008, 46, 2298–2306. [CrossRef]