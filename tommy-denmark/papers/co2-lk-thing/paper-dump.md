This study examines the dynamic causality between the carbon emission market and the clean energy market, using an
information flow-based, quantitative Liang causality analysis which is firmly grounded on physics and derived from first
principles. The dynamic causal relationships between European Union Allowance (EUA) prices and clean energy index allow
us to explore whether the causality in return or in variance from CO2 emission allowances to the clean energy index is time-
varying. The results show that the causal relationships in return and in variance between EUA and Clean Energy Index (CEI)
are drastically time-varying. For the causality in return, a significant unidirectional long-term and stable causality from CEI
to EUA is identified after March 2020. For that in variance, a bidirectional causality is found after March 2020, but values
after 2020 are opposite to those in return. It seems when fluctuations in the clean energy market are low, the clean energy
market has a weak causal effect on the carbon emission market but when volatility in the clean energy market is increasing,
causalities between the two markets are significantly strengthened. These results obtained through this rigorous causality
analysis can serve as a reference for academics, market participants, and policymakers to understand the underlying links
between EUA prices and clean energy index.
Keywords Dynamic causality · Information flow · CO2 emission allowance prices · Clean energy index · COVID-19
Introduction
Extreme weather caused a fire in Australia that lasted for one
half of a year; torrential rain battered central China’s Zheng-
zhou City and killed dozens of people; and the worst drought
in the past 67 years is ongoing in Taiwan. These disastrous
weather and climate phenomena are frequenting our daily
lives and incurring huge losses to the economy and human
life around the world. Climate change has become an issue
that needs urgent societal attention and continuing efforts
need to be invested to provide remedial solutions, so as to
accomplish a sustainable, low-carbon lifestyle (Hammoudeh
et al. 2020). The global greenhouse gas (GHG) emissions
from human activities such as burning fossil energy sources,
deforestation, and land clearing for agriculture are recog-
nized as the most remarkable driver of the observed cli-
mate change events since the mid-twentieth century (IPCC
(Intergovernmental Panel on Climate Change) 2013). The
potential solution to mitigate climate change is to reduce
expenditure and to increase revenue to reach the global cli-
mate neutrality—an economy with net-zero GHG emissions
(Fawzy et al. 2020). The so-called reduce expenditure is
Responsible Editor: Roula Inglesi-Lotz
* Xunfa Lu
xunfalu-c@my.cityu.edu.hk
Kai Liu
liukaiedu@hnu.edu.cn
Xiang San Liang
x.san.liang@gmail.com
Kin Keung Lai
mskklai@outlook.com
Hairong Cui
002395@nuist.edu.cn
1 School of Management Science and Engineering, Nanjing
University of Information Science and Technology, No. 219,
Ningliu Road, Pukou District, Nanjing 210044, China
2 Center for Economics, Finance and Management Studies,
Hunan University, Changsha 410006, China
3 Fudan University, Shanghai 200438, China
4 International Business School, Shaanxi Normal University,
Xi’an 710062, China
/ Published online: 10 June 2022
Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
to cut down carbon dioxide emissions by combining eco-
nomic means with administrative means, while the so-called
increase revenue means to vigorously develop the environ-
ment-friendly clean or renewable energy sources to alleviate
the damage to the environment due to consumption of the
traditional fossil energies.
Under the cap and trade principle, the European Union
Emissions Trading System (EU ETS), as a financial instru-
ment and emission control mechanism, is significantly effec-
tive in curbing GHG emissions and beneficial to combat
climate change (Bayer and Aklin 2020; Wen et al. 2020a,
b). As the first and biggest CO2 emission trading scheme
worldwide, it has been the flagship of EU energy policy
initiative to achieve its climate targets under the Kyoto Pro-
tocol, such as the intermediate target of at least 55% net
reduction in GHG emissions in the EU by 2030 compared
to 1990 and the long-term target of climate neutrality in
the EU by 2050. This scheme results in that the energy-
consuming installations are regulated in accordance with
the annex of 2003/87/EC Directive, making them pay for
the consequences of their emitting activities by integrating
a price for carbon dioxide emissions into their investment
and operational strategies (Keppler and Mansanet-Bataller
2010). The EU ETS facilitates the trade-in allowances, viz.,
the European Union Allowances (EUAs), within a certain
period, between individual companies or installations. The
emission allowance means the climate credit (or carbon
credit), giving the holder the right to emit one ton of CO2
equivalent during a specified period. The total number of
EUAs is limited under the cap and trade principle, and there-
fore can encourage companies participating in the scheme
to trade future expected emissions to optimize compliance
over their entire planning horizon. Furthermore, it is helpful
for the EU to pursue ambitious emission reduction targets.
The correlation between carbon emission and energy mar-
kets has been enhanced under the EU ETS by motivating
installations or companies to reduce consumption of tradi-
tional fossil energies and improve investment in environ-
ment-friendly clean energies. Thus, the scheme has emerged
as one of the most important measures for reduction of GHG
emission (Ji et al. 2018). Since its launch in 2005, there have
been a large body of recent works that have grown exponen-
tially, highlighting the growing interest in the EUA on the
EU ETS to encourage GHG reduction and decarbonization
of economic actors (Hu et al. 2015; Bayer and Aklin 2020).
Actually, by having high liquidity and analogous characteris-
tics of financial assets, EUA has become an attractive invest-
ment instrument that is capable of continuous contribution
to the realization of a low-carbon lifestyle. European car-
bon allowance prices have languished in the single digits for
years, but not any longer. The price for carbon allowances on
the EU ETS has surged by 60% this year, recently crossing
the €50-per-ton threshold for the first time. The rally marks a
dramatic reversal from just a couple of years ago: EUA sold
for less than €10 a ton as recently as in 2018. The higher
prices of EUA will accelerate innovations of low-carbon
energies that are needed for the European Union to achieve
climate neutrality by 2050 and to impose a more important
influence on the clean or renewable energy market. Subse-
quently, as governments around the world are accelerating
the transition to low-carbon economies and mitigating cli-
mate change risk, clean energy market is becoming a greater
focus for global market participants (Hammoudeh et al.
2014; Teixidó et al. 2019; Wen et al. 2020a, b; Hanif et al.
2021). EUA and clean energy innovations share the com-
mon goal of mitigating global warming and fighting against
climate change by reducing GHG emission.
From a financial point of view, carbon emission and clean
energy markets are collectively receiving close attention
from market participants concerned about climate change
and environment improvements. Naturally, price informa-
tion of the two markets influences each other. For these rea-
sons, investigating the underlying information transmission
between the EUA prices and clean energy stock prices can
provide significant reference for economic actors making
decisions on decarbonization and clean energy develop-
ment. There have been abundant investigations of informa-
tion transmission between the two price series. These can be
roughly classified into three categories. First, the causality
between carbon emission market and clean energy market is
explored by using the traditional econometric models, e.g.,
Granger causality test and its variants, vector autoregressive
(VAR) analysis, and multiple linear regression model (Fezzi
and Bunn 2009; Nazifi and Milunovich 2010; Kumar et al.
2012; Zhu and Kong 2016; Dutta et al. 2018; Adams and
Acheampong 2019; Chang et al. 2020; Hammoudeh et al.
2020). Second, the dependence and spillovers between the
two markets are studied according to correlation analysis
and/or spillover index, such as dependence based on copu-
las by Gronwald et al. (2011) and Chevallier et al. (2019);
Diebold and Yilmaz (DY) spillover index by Wang and Guo
(2018) and Ji et al. (2018); Baruník and Křehlík (BK) spillo-
ver index by Hanif et al. (2021); BEKK model by Mansanet-
Bataller and Soriano (2009) and Chen et al. (2019); and
DCC-Generalized AutoRegressive Conditional Heteroske-
dasticity (GARCH) model by Balcilar et al. (2016) and Gar-
gallo et al. (2021), among others. In the third category, the
information transmission between carbon emission market
and clean energy market is examined using transfer entropy
(Gao et al. 2020; Hung 2021). Although mixed results have
been reported in literature, due to the different data and
methodologies used, the general agreement has been that
carbon emission market and clean energy market are related,
constituting a complex system.
Although previous empirical researches have provided
an important reference for comprehending the information
77725Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
transmission between markets of carbon emissions and clean
energies, the dynamic causality between the price of EUA
and the index of clean energy stocks remains elusive and
has rarely been investigated using information flow analysis,
a natural tool for understanding information transmission.
Information flow (or information transfer as it may appear
in the literature) is a fundamental physics concept which is
logically associated with causality: while a causal relation
entails a flow of information, the latter provides a measure
of the strength of entailing causality (Liang and Kleeman
2005; Pereda et al 2005) and has been successful in many
applications and generalized to multivariate data and non-
linear time series causal analysis (Kyrtsou et al 2019; Li and
Liu 2019; Liang 2019; Zhang et al 2022). Recently, causal-
ity in terms of information flow has been realized as a real
physical notion that can be rigorously formulated from first
principles (Liang 2008, 2016). This is in contrast to the tra-
ditional axiomatically proposed methods. Because market
participants, who are concerned about climate change and
environment improvements, pay close attention to the carbon
emission market as well as the clean energy market from the
perspective of financial investment, it is understandable that
the information flow between the prices of the two markets is
important for them to make reasonable investment decisions.
It is hence intriguing to use this more sophisticated theory
and the subsequent analysis tools to explore the causality
between the price of EUA and the index of clean energy
stocks. It merits mentioning that this causality analysis can
be easily and very efficiently fulfilled with time series in
a quantitative sense (Liang 2014, 2021). Since its advent,
many applications have been carried out with remarkable
success for diverse problems in different disciplines, such as
global warming vs. CO2 emissions, weather pattern forma-
tion, ocean eddy shedding, brain’s neural networks, financial
markets, and so on (Liang 2015, 2016, 2019; Stips et al.
2016; Lu et al. 2020; Tao et al. 2021).
In addition, studies in recent literature further show
that as information transmission between stock markets
increases, an unpredictable event in one market causes
changes in not only return but also volatility (or variance)
in other markets (Balcilar et al. 2021). As documented in
Pantelidis and Pittis (2004), causality between two variables
can be divided into two types: one is causality in return; the
other is causality in variance. Furthermore, all causality-in-
return influences should be extracted from some parametric
model before the causality in variance is examined. It is
therefore tempting to employ the aforementioned rigorously
formulated information flow and causality analysis to gain
a reliable and deeper understanding of the fundamental
process of information transmission, both in return and in
variance or volatility, between EUA prices and clean energy
index. This can provide leverage for participants in financial
markets to construct better portfolios and hedging strategies
and for policymakers at macro- as well as microlevel to take
decisions about carbon emission, clean energy innovations,
and risk management.
Also, it is worth noting that the hypothesis invoked in
these researches with a conventional method that the causal-
ity between different financial variables is constant over a
sample period is usually rejected (Hammoudeh et al. 2020).
Thus, it is necessary to take into account the dynamic cau-
sality between EUA prices and clean energy index to figure
out how the underlying information transmission between
the two series changes over time. In this context, this paper
aims to examine whether the causality in return and in vari-
ance from the EUA prices to the clean energy index is sig-
nificantly time-varying, or vice versa. This will be important
for price prediction, portfolio optimization, and risk man-
agement. Methodologically, unlike previous studies in the
literature, this study employs a novel time-varying causality
approach with a running window algorithm developed by
Liang (2014) based on the rigorously established informa-
tion flow (Liang 2016) to investigate whether the bidirec-
tional causalities in return and in variance between EUA
prices and clean energy index could change over the study
period and then exhibit a different dynamic feature.
In comparison with existing studies, the potential contri-
bution of this study is twofold. On one hand, the dynamic
causalities in return and in variance between prices of EUAs
and clean energy index are investigated. Specifically speak-
ing, the time-varying significant causalities in return and in
variance are examined. Significant causal relationships are
detected at certain intervals in the whole sample period: a
significant unidirectional long-term and stable causality in
return from the clean energy index to EUA prices exists after
March 2020. But the causality in variance between the two
shows a different scenario; there exists a sporadic causality
in variance before February 2020, and a bidirectional stable
causality in variance after 2020, but the sign of the causality
is opposite to that of causality in return. (A positive/nega-
tive sign in Liang’s formalism corresponds to the excita-
tory/inhibitory mechanism of the information flow within a
neural network. This property is not seen in the traditional
methods.) The significant causalities in return and in vari-
ance can improve the predictive powers of the clean energy
market on the carbon emission market, and vice versa. This
helps market participants to better adjust their decisions and
allocate funds to appropriate portfolios.
On the other hand, a novel time-varying causality analy-
sis with a rolling window algorithm developed by Liang
(2014, 2016) is employed to examine the causal informa-
tion transmission between EUA prices and clean energy
index. As mentioned above, the resulting causality is not
only quantitative, but it can also be further differentiated
with a positive or negative sign, which is not the case in
the traditional methods. It hence facilitates the revealing of
77726 Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
more fundamental characteristics of the influence of carbon
emission market on clean energy market. Our results show
that EUA prices exhibit a negative causality in variance after
March 2020, while the clean energy index has the opposite
causality in return and in variance after March 2020. The
causality between the two series is more significant as the
increase of EUA prices and the clean energy index, which
might imply that the turmoil in market situation strength-
ens the interaction between the carbon emission and clean
energy markets. These results will make important refer-
ences for academics, market participants, and policymakers
to understand the underlying linkages between EUA prices
and clean energy index. For example, financial investors can
use these findings to obtain better risk-adjusted returns from
their well-diversified portfolios, and to improve the portfo-
lio performance, while policymakers could adopt effective
measures to properly promote prices of the EUA so that
the carbon emission allowance market can provide stimuli
to shift from the traditional fossil resources to renewable
energy resources.
The rest of this study is organized as follows. The “Lit-
erature review” section briefly reviews the related literature.
The “Materials and methods” section depicts the data used
in our empirical research and introduces the theoretical
methods. The “Results” section presents and discusses the
obtained results. Finally, the “Conclusion” section closes
this study with general conclusions.
Literature review
It is widely accepted that CO2 emission allowance prices
are correlated with energy prices, especially clean energy
prices, but it is not clear whether the carbon emission market
has a significant influence on the clean energy market. The
traditional econometric models have been extensively used
to explore the potential causality between the two markets.
For instance, Hammoudeh et al. (2020) examine the real-
time Granger causality between green bonds and CO2 emis-
sion allowances, and find that CO2 emission allowance price
Granger causes green bond prices unidirectionally. Chang
et al. (2020) find that the significant causalities are unidirec-
tional from the stock markets to CO2 emission market, but
not the other way around. Adams and Acheampong (2019)
examine the impact of clean energy on carbon emissions
using a multiple linear regression model and report that the
use of clean energy reduces carbon emissions. Dutta et al.
(2018) use the bivariate VAR-GARCH model to investigate
the correlations of the return and volatility between CO2
allowances and renewable energy prices, and document that
fluctuations in returns of EUA positively affect returns of
clean energy stocks. Zhu and Kong (2016) analyze, using
a VAR model, the correlation between the stock prices of
companies related to low-carbon economy and prices of
carbon emission allowances; they reveal a positive influ-
ence of Shenzhen carbon emission prices on prices of stocks
of companies of low-carbon economy. Kumar et al. (2012)
investigate the dependence between renewable energy com-
panies’ stocks and carbon markets with VAR model and find
it insignificant. Nazifi and Milunovich (2010) explore the
causalities between the EU carbon allowance and natural
gas, which is often viewed as a clean energy alternative,
using the Granger causality test, and find no long-run rela-
tionship between them. Fezzi and Bunn (2009) measure the
structural interactions of electricity, natural gas, and carbon
prices applying a structural, co-integrated VECM model
and report a bidirectional interaction between natural gas
prices and carbon emission allowance prices in phase I of
the EU ETS. Mansanet-Bataller et al. (2007) highlight posi-
tive impacts of natural gas on EUA forward in phase I of the
EU ETS using a multiple linear regression model. Zhao et al.
(2020) investigate the nonlinear Granger causality in China’s
carbon emission trading markets by using the Hiemstra and
Jones test and Diks and Panchenko test; they demonstrate a
significant bidirectional nonlinear Granger cause in China’s
major carbon emission trading markets.
In addition, the conditional vine copula is used to study
the relationship between the carbon emission market and
energy markets, including natural gas, coal, and electric-
ity; a weak and negative correlation between carbon prices
and natural gas prices is found (Chevallier et al. 2019).
Also, different copulas are applied to explore the complex
dependence structure between EUA futures and natural gas
futures, and a positive dependence structure between them
is discovered (Gronwald et al. 2011). Hanif et al. (2021)
examine the spillovers between the prices of EUA and the
indices of clean energies by using the BK spillover index
and find a dominance of short-run spillovers between
the two series over their long-run counterpart. Wang and
Guo (2018) and Ji et al. (2018) investigate the spillovers
between the carbon emission and energy markets using the
DY spillover index and reveal that the dynamic spillover
effects between the carbon and natural gas/clean energy
markets exist. Chen et al. (2019) and Mansanet-Bataller
and Soriano (2009) explore the volatility transmission in
the carbon emission and energy markets with a BEKK
model and show a positive correlation between the EUA
and natural gas. Gargallo et al. (2021) use the DCC-
GARCH model to analyze the co-movements between the
carbon emission and energy markets, and find bidirectional
spillover effects between EUA and natural gas. Similarly,
Balcilar et al. (2016) detect the risk spillovers between
prices of energy futures and Europe-based carbon futures
with the DCC-GARCH model and find dynamic risk trans-
mission from energy markets, including natural gas, to the
carbon market.
77727Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
Since “information transmission” is essentially about the
flow of information, a few researchers have adopted the con-
cept of information flow to examine whether carbon emis-
sion information is transmitted to the clean energy market.
Their attempt is to approximate the “information flow” to
the real physical notion using some empirical measures. For
instance, Hung (2021) investigates with transfer entropy the
causal association between green bonds and clean energy/
CO2 emission allowances and finds a unidirectional connec-
tion from green bonds to the prices of CO2 emission allow-
ances. Gao et al. (2020) studied the “information flows”
from the CO2 emission market to the renewable energy stock
market and highlight that EUA price “information flows” to
the S&P GCE clean energy prices vary at different scales.
It merits mentioning that as of today, the important con-
cept of information flow has been rigorously derived from
the first principles. This forms our motivation to reconsider
the above problem based on this newly established sys-
tematic theory. Besides, the aforementioned studies have
allowed for influence of the carbon emission market on the
clean energy markets, while the dynamic causality in return
and in variance between the prices of EUA and the index of
clean energies remains unexplored. For these reasons, this
study extends the related literature.
Materials and methods
Data
The main variables considered in this paper are the S&P
GSCI Carbon Emission Allowances (EUA) and the S&P
Global Clean Energy Index (CEI), which are obtained from
S&P Global (https:// www. spglo bal. com/ en/). The S&P
GSCI EUA closely tracks the trend of actual EU ETS per-
mit prices, which is the most influential carbon trading asset
in the world. More importantly, it provides market partici-
pants with a reliable and publicly available investment per-
formance benchmark for European Carbon Emission Allow-
ances and facilitates them to express a specific view on the
price of carbon, or combine carbon emissions with other
assets to create low-carbon strategies while promoting the
transition to the global climate neutrality. Thus, it can be
an appropriate proxy of the global carbon emission market
quotations. The S&P Global Clean Energy Index is designed
to measure the performance of top companies in global clean
energy-related businesses from both developed and emerg-
ing markets which broadens the financial instruments avail-
able to market participants concerned about climate change
and environment improvements. As of March 2022, market
cap of European companies accounts for 52.45% of the total
market cap of the S&P Global CEI. Because it tracks the
largest and most liquid stocks worldwide which are involved
in clean energy business, we follow the majority of the
recent literature (Asl et al. 2021; Dawar et al. 2021; Liu et al.
2021) and use it as an appropriate proxy of the global clean
energy market quotations. Allowing for 57% of the total
amount of the general carbon emission allowances auctioned
in phase III (2013–2020) and phase IV (2021–2030), which
are different from the previous two phases (https://ec.europa.
eu/clima/policies/ets/auctioning_en#tab-0-0), the start date
of the analyzed period is 2 January 2013, the beginning of
the third phase of the EU ETS. Because the fourth phase has
just begun, and has adopted a new and revised legislative
proposal of the EU ETS, which sets a binding EU target of
a net GHG reduction by at least 55% by 2030, and aims to
strengthen the EU ETS as an investment driver by increasing
the pace of annual reductions in carbon emission allowances
to 2.2% from 2021 onwards compared to 1.74% previously,
the ending date of the analyzed period is 31 December 2020,
the end of the third phase of the EU ETS. After matching the
timestamps of both time series, a total of 2016 daily observa-
tions are included in the sample period.
We d e n o t e REUA
t = logPEUA
t
 − logPEUA
t−1
 a n d
RCEI
t = log PCEI
t
 − log PCEI
t−1
 as the log returns of EUA
and CEI, respectively, where PEUA and PCEI are the prices
of EUA and CEI. The descriptive statistics of the data are
provided in Table 1.
As shown in Table 1, log returns of the EUA have a
higher average value than the clean energy index, mean-
ing that the carbon emission market is more favorable
for financial participants, while the standard deviation
of the former is larger than that of the latter, indicating
that the carbon emission market is more volatile. The two
log return series are skewed to the left and show high
excess kurtosis, indicating that they have non-normal
distribution. The Jarque–Bera (JB) statistics also indi-
cate a significant absence of normality for log returns
of EUA and CEI. The augmented Dickey-Fuller (ADF)
tests for the two log return series undoubtedly reject the
null hypothesis of having the unit root at a 1% signifi-
cance level, indicating that they are stationary and turn
Table 1 Descriptive statistics
Variables Mean Std Skewness Kurtosis JB test ADF test Ljung-Box Q(20) LM ARCH test
REUA 0.0008 0.0338 − 1.1697 20.6350 26,570*** − 21.8413*** 90.468*** 18.9224***
RCEI 0.0007 0.0134 − 0.8781 16.4227 15,385*** − 15.2629*** 131.38*** 123.2901***
77728 Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
out to be integrated in the same order of 0 lag. There-
fore, analysis of the causality between the EUA and CEI
can be conducted. The statistics of Ljung-Box test are
significant and show the existence of serial correlation.
Further, the LM ARCH test significantly rejects the null
of homoscedasticity at a 1% significance level, implying
that the heteroscedastic model, i.e., Generalized AutoRe-
gressive Conditional Heteroskedasticity (GARCH) model
(Bollerslev 1986), is suitable to capture their conditional
variances.
Figure 1 shows that lower market fluctuations in EUA
prices are observed from 2013 to 2018. Then the latest
reforms on the withdrawal of excess supply of carbon
emission allowances caused a significant rebound in the
price. EUA prices soared after that until the beginning of
2020, when the COVID-19 pandemic caused stagnation
in global production and some concern and uncertainty
in the recovery of certain key sectors in energy demand,
leading to a turmoil in financial markets. After that, EUA
prices follow a rising trend as the economy picks up. The
evolution of the CEI prices is similar to that of the EUA,
although a relatively steady movement is displayed from
2013 to the beginning of 2020. It seems that the increase
of the EUA prices encourages production and use of clean
energies, and further exerts a more important influence
on stock prices of clean energy companies. Log returns
of both EUA and CEI show stationarity and obvious vola-
tility clustering. The log returns of the EUA are clearly
more volatile from the beginning of the sample period
until the middle of 2014 than those of the CEI. In addi-
tion, high volatility of EUA and CEI is observed during
the outbreak of the COVID-19 pandemic.
Methodology
To examine the dynamic causal relationship in return and in
variance between CO2 emission allowance prices and the clean
energy index, we follow the recently developed causality analy-
sis with a rolling window algorithm developed by Liang (2014,
2016). In order to fit the autoregression and conditional vari-
ances of log returns of EUA and CEI, the autoregression with
the GJR-GARCH (ARMA-GJR-GARCH) model introduced by
Glosten et al. (1993) is employed. This is one of the most popular
models ever proposed to represent conditional heteroscedasticity
with volatility clustering and leverage effect in financial markets.
The rigorously derived quantitative causality analysis
Causal inference is of central importance for researchers in
various disciplines. Recently, in terms of information flow,
Liang (2008, 2014, 2016) found that causality is actually a
real physical notion (not just something in statistics) which
can be rigorously derived from first principles, initially moti-
vated by a discovery in a two-dimensional dynamic system
(Liang and Kleeman 2005). Because of the formalism ab ini-
tio, it is universally applicable, quite different from other
empirical/half-empirical formalisms. In the following, a brief
introduction of the part pertaining to this study is presented.
Consider a stochastic dynamic system
where 𝐗 and 𝐅 are n-dimensional vectors, 𝐁 is a pertur-
bation coefficient matrix with n rows and m columns, and
𝐖 is a standard Wiener process vector with m elements.
(1)d𝐗 = 𝐅(𝐗, t)dt + 𝐁(𝐗, t)d𝐖
Fig. 1 Price and log return
series of EUA (left) and CEI
(right)
13 14 15 16 17 18 19 20
0
50
100
150 PEUA
13 14 15 16 17 18 19 20
500
1000
1500
2000 PCEI
13 14 15 16 17 18 19 20
-0.4
-0.2
0
0.2
REUA
13 14 15 16 17 18 19 20
-0.1
0
0.1
RCEI
77729Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
Throughout the paper, 𝐅 and 𝐁 are supposed to be differenti-
able in 𝐗 and time t. The rate of information flowing (RIF)
from Xj to Xi (in nats per unit time) proves to be (Liang
2016)
where E denotes mathematical expectation, and 𝜌i = 𝜌i(xi)
and 𝜌̃j = ∫ℜ 𝜌(𝐱)dxj are the marginal probability of density
function of Xi and the joint probability of density function
of 𝐗 with Xj removed, respectively; gii =
m
∑
k=1
bikbik ; d𝐱̃ ĩj
stands for d𝐱 but with d𝐱i and d𝐱j removed. Ideally, if
Tj→i = 0, then Xj is NOT causal to Xi ; otherwise, it is causal
(for either positive or negative information flow). But in
practice, significance test must be performed.
Equation (2) has many nice properties, one of which is
the “principle of nil causality”: if the evolution of an event
is independent of another event, then the causality (or the
RIF) from the latter to the former is zero. This is the only
quantitatively stated observational fact in causal inference;
it has defied the classical formalism under numerous cir-
cumstances, but within Liang’s framework, it turns out to
be a theorem. In addition, Tj→i is invariant upon nonlinear
coordinate transformation.
Let X1 and X2 be two time series, and the maximum likeli-
hood estimator of the RIF from X2 to X1, under the assump-
tion of a linear model with additive noise, is proved by Liang
(2014) to bear a very concise form:
where Cij is the sample covariance matrix between Xi and
Xj , and Ci,dj is the sample covariance between Xi and a series
derived from Xj using Euler forward differencing scheme:
Δt being the time step size. This concise formula has had
remarkable success in resolving a variety of real-world prob-
lems, for example, global climate change (Stips et al. 2016),
meteorology (Yang et al. 2021), neuroscience (Hristopulos
et al. 2019), and financial markets (Liang 2015; Lu et al.
2020), to name a few. A direct corollary is that causation,
in linear sense, implies correlation, but correlation does not
imply causation.
The above formula does not need to be applicable for the
whole duration; the dynamic causality—from X2 to X1, which
in general varies in time, can be obtained by applying the for-
mula window by window with a rolling window algorithm.
(2)
Tj→i = −E
� 1
𝜌i ℜn−2
𝜕(Fi𝜌̃j)
𝜕xi
d𝐱̃ ĩ j
�
+ 1
2 E
⎡
⎢
⎢
⎣
1
𝜌i 
ℜn−2
𝜕2(gii𝜌̃j)
𝜕x2
i
d𝐱̃ ĩj
⎤
⎥
⎥
⎦
(3)T2→1 = C11C12C2,d1 − C2
12C1,d1
C2
11C22 − C11C2
12
(4)̇Xj,n = Xj,n+1 − Xj,n
∕Δt
ARMA‑GJR‑GARCH model
GARCH models have the power of investigating con-
ditional heteroscedasticity with volatility clustering
and leverage effect in financial markets (see Agnolucci
2009; Dyhrberg 2016; Lin 2018; among others). Specifi-
cally, the ARMA-GJR-GARCH model of Glosten et al.
(1993) is suitable for our case, as it allows one to study
the volatility features of carbon emission prices and clean
energy stock index (Benz and Trück 2009). The standard
ARMA(m, n) − GJR − GARCH(p, q) model is presented as
follows:
where xt is a stationary time series, such as REUA
t or RCEI
t , 𝜇
and 𝜔 are constants, 𝜀t are residuals, ht are the conditional
variance of 𝜀t , and 𝜂t belongs to a normal or Student’s t dis-
tribution. Due to rejection of the normal distribution accord-
ing to the Jarque–Bera (JB) statistics of log returns of EUA
and CEI (Table 1), the Student t distribution is chosen for 𝜂t .
It−1 = 1 if 𝜀t−1 < 0, and 0 otherwise. 𝛿 measures the leverage
effect, that is, asset return volatility rises more following bad
news than following good news. 𝜔 > 0, 𝛼i ≥ 0, 𝛽j ≥ 0, and
max (p,q)
∑
i=1
�𝛼i + 𝛽i
� < 1.
Results
In line with most of the classical literature, in this section,
we first investigate the static causality in return to identify
the information flow between the carbon emission market
and the clean energy market over the full sample period.
Specifically, the traditional Granger causality test (Granger
1969) and the Liang formalism (Liang 2014, 2016) are
employed to detect the causal relationship between EUA
and CEI in the full sample. The results are listed in Table 2.
As shown in Table 2, the T value estimated with Eq. (3) for
the causality from EUA to CEI is 0.0052. The corresponding
confidence interval at the 90% probability level is [− 0.0005,
0.0109], inclusive of 0. Therefore, the null hypothesis that
the EUA log returns do not cause the CEI log returns can-
not be rejected at the 10% significance level, indicating that
the T value of 0.0052 is not significantly different from 0 at
(5)xt = 𝜇 +
m

i=1
𝜙ixt−i + 𝜀t −
n

j=1
𝜃i𝜀t−i
(6)ht = 𝜔 +
p

i=1
𝛼i𝜀2
t−i +
q

j=1
𝛽jht−j + 𝛿𝜀2
t−1It−1
(7)𝜀t = √ht𝜂t 𝜂t ∼ i.i.d. f (0, 1)
77730 Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
the 10% level. In the other way, the T value for the causality
from CEI to EUA is − 0.0073. Its corresponding confidence
interval at the 90% probability level is [− 0.013, − 0.0016],
which is exclusive of 0, indicating that there is a statistically
significant causality from the CEI log returns to the EUA log
returns at the 10% significance level.
The Granger causality test between EUA and CEI is
developed from vector autoregressive (VAR) model, and the
smallest BIC (− 15.4258) means that the optimum lag order
of the Granger causality test is 1. The results out of the two
methods are generally in accord with each other. The F sta-
tistics show that the null hypothesis of no causality running
from CEI to EUA is rejected at the 10% significance level
over the full sample period, but not the reverse, indicating
the existence of a significant and unidirectional causality
running from the clean energy market to the carbon emis-
sion market on the conditional mean and a clear directional
statement regarding temporal predictability of the former
to the latter.
Although consistent results are obtained from the Liang
causality analysis and the Granger causality test, it is worth
noting that the Granger causality test could not be robust
because spurious Granger causality in mean may arise due
to unobserved variables that influence the system dynamics,
such as variances of variables (Liang 2014, 2016), and due
to observational noise. Besides, the Granger causality test
cannot provide time-varying causalities between variables,
which are more important for market participants to make
real-time decisions. Another problem about the Granger
causality test is that it only tests the time-lag relationship
between variables and the contemporaneous causality is hard
to infer (Xu and Zhang 2022), which means it cannot detect
the contemporaneous information flow between different
variables. Therefore, the following content in this section
explores the dynamic causality in return and that in variance
between EUA and CEI, with a rolling window algorithm
developed by Liang (2014, 2016) based on information flow.
By and large, both the Granger causality test and the
Liang method (Table 2) yield similar results; that is, there is
a static and unidirectional causality in mean running from
the clean energy market to the carbon emission market over
the full sample period, but not the reverse. Outcomes of the
causality tests imply the significant information flow from
the clean energy market to the carbon emission market,
indicating the former can improve the prediction of the lat-
ter based on the conditional mean.
Next, the dynamic causality in return between the
two variables is firstly examined. Then, we use the
ARMA(m, n) − GJR − GARCH(p, q) model to obtain the
conditional variances of EUA and CEI. The Liang causality
analysis is then used to detect the potential dynamic causal
relationship in variance between EUA and CEI.
Causality in return
In Fig. 2, the blue line is the dynamic T value estimated
with Eq. (3) using the rolling window algorithm developed
by Liang (2014, 2016) with two red lines marking the con-
fidence interval at a 90% probability level. If the confidence
interval does not include 0, the null hypothesis of no causal-
ity or RIF in that period is rejected at the 10% significance
level, and the T value is significantly different from 0 at the
10% significance level. On the contrary, if the confidence
interval includes 0, the null hypothesis cannot be rejected
at the 10% significance level, indicating that the T value is
not significantly different from 0 at the 10% significance
level. Without loss of generality, we choose a rolling window
length of 250 trading days for the estimation purpose.
Figure 2 clearly shows that at the 90% probability level,
confidence intervals of the T values that measure the causali-
ties between EUA and CEI almost entirely include 0 from
the beginning of the chosen rolling window until February
2020. This implies that the null hypothesis of no causality
in return between EUA and CEI cannot be rejected at the
10% significance level, and hence, the EUA does not sig-
nificantly cause CEI and vice versa. It is worth noting that,
after March 2020, the causal relationship in return between
EUA and CEI becomes obviously stronger. Especially, T
values of the causalities running from CEI to EUA are sig-
nificantly different from 0, indicating that the change in the
clean energy market significantly affects fluctuations of the
carbon emission market at the 10% significance level during
that period. In contrast, T values of the causalities running
from CEI to EUA are not always significantly different from
0 after March 2020. There are several short periods when
causalities from the carbon emission market to the clean
energy market are significant at the 10% level. It can be seen
in Fig. 1 that, after March 2020, carbon emission allowances
and the clean energy index experienced a dramatic increase.
It appears as if, under the lower fluctuations of the clean
energy market, it has a weak predictive power on the carbon
emission market, and vice versa, while under its bull market
condition, it has a strong predictive power on the carbon
emission market and the predictive powers of the carbon
emission market on the clean energy market also obtain a
certain improvement.
Table 2 The static causality tests for EUA and CEI over the full sam-
ple period
*Statistical significance at the 10% level.
REUA → RCEI RCEI → REUA
Liang (T) 0.0052 − 0.0073*
Granger (F) 2.233 4.371*
77731Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
In general, the dynamic T values show that the
carbon emission and clean energy markets interact
with each other in a complex fashion. Under the nor-
mal market condition, there exist fewer causalities in
return between the two markets. Under the bull mar-
ket condition of the clean energy market, causalities
in return between the two markets become stronger.
Therefore, market participants concerned about cli-
mate change and environment improvements need to
adjust decisions according to market conditions. For
example, the significant causalities in return running
from the clean energy market to the carbon emission
market indicate that for investors, the EUA plays a
strong hedging role against the clean energy index
variations during these periods. That is to say, it is
profitable for investors to include the EUA into their
portfolios in the increasing phase of the CEI.
Estimation of ARMA‑GJR‑GARCH model
According to the Ljung-Box test and LM ARCH test as
shown in Table 1, serial correlation and heteroscedastic-
ity exist in log returns of EUA and CEI. We hence use the
ARMA-GARCH model to capture their stylized features. In
light of BIC criterion, the ARMA-GJR-GARCH with Stu-
dent t distribution is chosen. The estimated results of the
parameters in the model are listed in Table 3.
The tabulated results show that the ARMA((1, 4), (4)) − GARCH(1, 1) − t
model and the AR(1) − GJR − GARCH(1, 1) − t model are suitable to fit
the log returns of EUA and CEI, respectively, according to the
BIC criterion. The coefficients in the ARMA models are all
statistically significant, indicating the present log returns of
the two series are impacted by the corresponding previous log
returns, with lags of orders 1 and 4 for EUA and lag of order 1
for CEI. The Ljung-Box test for the first ten lags of the sample
autocorrelation function of residuals exhibits no significant
series correlation for EUA and CEI. Thus, the ARMA models
Fig. 2 Dynamic causality in
return between EUA and CEI
14 15 16 17 18 19 20
-0.15
-0.1
-0.05
0
0.05
14 15 16 17 18 19 20
-0.1
-0.05
0
0.05
0.1
Table 3 Estimation of the ARMA-GJR-GARCH model
*** and * indicate statistical significance at the 1% and 10% levels, respectively.
Variables REUA RCEI
ARMA 𝜇 𝜙1 𝜙4 𝜃4 𝜇 𝜙1
0.00124*** − 0.04214*** 0.86456*** − 0.85230*** 0.00061* 0.15219***
GJR-GARCH 𝜔 𝛼 𝛽 𝛿 𝜔 𝛼 𝛽 𝛿
1.03E − 05*** 0.08745*** 0.90722*** – 2.35E − 6*** 0.05582*** 0.89062*** 0.06491***
Degrees of
freedom
BIC Ljung-Box
Q(10)
LM ARCH
test
Degrees of
freedom
BIC Ljung-Box
Q(10)
LM ARCH test
4.93423*** − 4.340626 8.8669 0.001857 6.11754*** − 6.203741 9.8958 0.019838
77732 Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
can preserve the residuals of the EUA and CEI log returns at
a conventional level. In terms of GJR-GARCH model, the
ARCH and GARCH items are always significant. These out-
comes mean that the present variances of the two log return
series are easily impacted by the information in the previous
period. The asymmetric term 𝛿 is statistically significant and
positive for CEI at the 1% level, which means the leverage
effect exists for CEI, the impact of shocks is asymmetric, and
negative shocks increase the conditional variances of CEI log
returns. However, the asymmetric term 𝛿 of EUA is not statis-
tically significant, which implies that the impact of shocks on
EUA log returns is symmetric. The degrees of freedom reject
the null hypothesis, indicating that the Student t distribution
of standardized residuals is more appropriate than the normal
distribution and can capture the fat tails and kurtosis of the
two log return series. The LM ARCH test statistics for the
two log return series indicate no ARCH effect remaining in
the residuals of the models.
The time-varying conditional variances of EUA and CEI
are displayed in Fig. 3. It can be observed that the maximum
of the conditional variances of EUA took place in 2013,
while that of CEI took place in 2020. In 2013, the first year
of the third stage of EU ETS, policy changes resulted in the
price of EUA going up. In 2020, the clean energy index had
a great growth, so the CEI experienced much volatility.
Causality in variance
To investigate the causality in variance between EUA and
CEI, the time-varying conditional variances for the two
series from the ARMA-GJR-GARCH model are input into
Eq. (3) to compute the causality. The results are shown in
Fig. 4. It can be seen that this figure starts with a very low
level of T values, similar to those in Fig. 2. This implies that
the carbon emission and clean markets are not integrated,
and variances of EUA do not influence those of CEI, and
vice versa. However, if we go over the confidence intervals
of the T values at the 90% probability level from the begin-
ning of the chosen rolling window to February 2020, we
can find that there are several periods that do not include
0, indicating that there exist significant causalities at the
10% significance level between variances of EUA and CEI.
Regarding significant causalities in variance from CEI to
EUA, the sporadic periods are January through June 2016,
October through December 2016, and July through Sep-
tember 2018, while in the other way around, the significant
periods are May 2014, June 2015, and December 2016. Par-
ticularly, larger absolute T values show up after March 2020
in Fig. 4, indicating EUA and CEI are bidirectionally causal
in variance after March 2020. As a note, the T values switch
their signs (+ / −). This means the causalities in variance
between EUA and CEI are different from those in return.
The causal relationship from CEI to EUA in return is nega-
tive, indicating that the increase in RCEI
t will cause decrease
in REUA
t . However, the causal relationship in variance from
CEI to EUA is positive, which means that increase in condi-
tional variances of CEI will cause the increase in conditional
variances of EUA. On the other hand, the causal relationship
from EUA to CEI in return is positive and not so significant,
indicating that the increase in RCEI
t may cause increase in
REUA
t . Nevertheless, the causal relationship from EUA to CEI
in variance is significantly negative, which means that the
increase in conditional variances of CEI will cause decrease
in conditional variances of EUA.
By examining variances of EUA and CEI in Fig. 3, it can
be found that the significant and bidirectional causalities in
variance happens during the dramatic volatilities of the vari-
ances of EUA and CEI, especially the latter. The results gen-
erally reveal stronger causalities in variance between EUA
and CEI under the market turmoil. This suggests that the
change in variances of the clean energy market can provide
better predictive powers for variances of the carbon emission
market, and vice versa. It also suggests that the importance
of identifying the causalities in variance between EUA and
13 14 15 16 17 18 19 20
0
0.01
0.02
13 14 15 16 17 18 19 20
0
2
4
6 10-3
Fig. 3 Time-varying conditional variances of EUA and CEI
14 15 16 17 18 19 20
0
0.2
0.4
14 15 16 17 18 19 20
-0.2
-0.1
0
Fig. 4 Dynamic causality in variance between EUA and CEI
77733Environmental Science and Pollution Research (2022) 29:77724–77736
1 3
