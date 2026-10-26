# Full-text extraction

- Title: The Dynamic Causality in Sporadic Bursts between CO2 Emission Allowance Prices and Clean Energy Index
- Year: 2022
- DOI: https://doi.org/10.1007/s11356-022-21316-5
- PDF source: https://www.ncoads.org/upload/202302/02/202302021110574953.pdf
- Extraction: `pdftotext -layout` from the verified local PDF

---

Environmental Science and Pollution Research (2022) 29:77724–77736
https://doi.org/10.1007/s11356-022-21316-5

    RESEARCH ARTICLE



The dynamic causality in sporadic bursts between ­CO2 emission
allowance prices and clean energy index
Xunfa Lu1      · Kai Liu2 · Xiang San Liang3 · Kin Keung Lai4 · Hairong Cui1

Received: 12 November 2021 / Accepted: 2 June 2022 / Published online: 10 June 2022
© The Author(s), under exclusive licence to Springer-Verlag GmbH Germany, part of Springer Nature 2022


Abstract
This study examines the dynamic causality between the carbon emission market and the clean energy market, using an
information flow-based, quantitative Liang causality analysis which is firmly grounded on physics and derived from first
principles. The dynamic causal relationships between European Union Allowance (EUA) prices and clean energy index allow
us to explore whether the causality in return or in variance from C ­ O2 emission allowances to the clean energy index is time-
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
Responsible Editor: Roula Inglesi-Lotz
                                                                            half of a year; torrential rain battered central China’s Zheng-
* Xunfa Lu                                                                  zhou City and killed dozens of people; and the worst drought
  xunfalu-c@my.cityu.edu.hk                                                 in the past 67 years is ongoing in Taiwan. These disastrous
     Kai Liu                                                                weather and climate phenomena are frequenting our daily
     liukaiedu@hnu.edu.cn                                                   lives and incurring huge losses to the economy and human
     Xiang San Liang                                                        life around the world. Climate change has become an issue
     x.san.liang@gmail.com                                                  that needs urgent societal attention and continuing efforts
     Kin Keung Lai                                                          need to be invested to provide remedial solutions, so as to
     mskklai@outlook.com                                                    accomplish a sustainable, low-carbon lifestyle (Hammoudeh
     Hairong Cui                                                            et al. 2020). The global greenhouse gas (GHG) emissions
     002395@nuist.edu.cn                                                    from human activities such as burning fossil energy sources,
                                                                            deforestation, and land clearing for agriculture are recog-
1
     School of Management Science and Engineering, Nanjing                  nized as the most remarkable driver of the observed cli-
     University of Information Science and Technology, No. 219,
     Ningliu Road, Pukou District, Nanjing 210044, China                    mate change events since the mid-twentieth century (IPCC
2                                                                           (Intergovernmental Panel on Climate Change) 2013). The
     Center for Economics, Finance and Management Studies,
     Hunan University, Changsha 410006, China                               potential solution to mitigate climate change is to reduce
3                                                                           expenditure and to increase revenue to reach the global cli-
     Fudan University, Shanghai 200438, China
                                                                            mate neutrality—an economy with net-zero GHG emissions
4
     International Business School, Shaanxi Normal University,              (Fawzy et al. 2020). The so-called reduce expenditure is
     Xi’an 710062, China


13
Environmental Science and Pollution Research (2022) 29:77724–77736                                                           77725


to cut down carbon dioxide emissions by combining eco-               dramatic reversal from just a couple of years ago: EUA sold
nomic means with administrative means, while the so-called           for less than €10 a ton as recently as in 2018. The higher
increase revenue means to vigorously develop the environ-            prices of EUA will accelerate innovations of low-carbon
ment-friendly clean or renewable energy sources to alleviate         energies that are needed for the European Union to achieve
the damage to the environment due to consumption of the              climate neutrality by 2050 and to impose a more important
traditional fossil energies.                                         influence on the clean or renewable energy market. Subse-
   Under the cap and trade principle, the European Union             quently, as governments around the world are accelerating
Emissions Trading System (EU ETS), as a financial instru-            the transition to low-carbon economies and mitigating cli-
ment and emission control mechanism, is significantly effec-         mate change risk, clean energy market is becoming a greater
tive in curbing GHG emissions and beneficial to combat               focus for global market participants (Hammoudeh et al.
climate change (Bayer and Aklin 2020; Wen et al. 2020a,              2014; Teixidó et al. 2019; Wen et al. 2020a, b; Hanif et al.
b). As the first and biggest ­CO2 emission trading scheme            2021). EUA and clean energy innovations share the com-
worldwide, it has been the flagship of EU energy policy              mon goal of mitigating global warming and fighting against
initiative to achieve its climate targets under the Kyoto Pro-       climate change by reducing GHG emission.
tocol, such as the intermediate target of at least 55% net              From a financial point of view, carbon emission and clean
reduction in GHG emissions in the EU by 2030 compared                energy markets are collectively receiving close attention
to 1990 and the long-term target of climate neutrality in            from market participants concerned about climate change
the EU by 2050. This scheme results in that the energy-              and environment improvements. Naturally, price informa-
consuming installations are regulated in accordance with             tion of the two markets influences each other. For these rea-
the annex of 2003/87/EC Directive, making them pay for               sons, investigating the underlying information transmission
the consequences of their emitting activities by integrating         between the EUA prices and clean energy stock prices can
a price for carbon dioxide emissions into their investment           provide significant reference for economic actors making
and operational strategies (Keppler and Mansanet-Bataller            decisions on decarbonization and clean energy develop-
2010). The EU ETS facilitates the trade-in allowances, viz.,         ment. There have been abundant investigations of informa-
the European Union Allowances (EUAs), within a certain               tion transmission between the two price series. These can be
period, between individual companies or installations. The           roughly classified into three categories. First, the causality
emission allowance means the climate credit (or carbon               between carbon emission market and clean energy market is
credit), giving the holder the right to emit one ton of ­CO2         explored by using the traditional econometric models, e.g.,
equivalent during a specified period. The total number of            Granger causality test and its variants, vector autoregressive
EUAs is limited under the cap and trade principle, and there-        (VAR) analysis, and multiple linear regression model (Fezzi
fore can encourage companies participating in the scheme             and Bunn 2009; Nazifi and Milunovich 2010; Kumar et al.
to trade future expected emissions to optimize compliance            2012; Zhu and Kong 2016; Dutta et al. 2018; Adams and
over their entire planning horizon. Furthermore, it is helpful       Acheampong 2019; Chang et al. 2020; Hammoudeh et al.
for the EU to pursue ambitious emission reduction targets.           2020). Second, the dependence and spillovers between the
   The correlation between carbon emission and energy mar-           two markets are studied according to correlation analysis
kets has been enhanced under the EU ETS by motivating                and/or spillover index, such as dependence based on copu-
installations or companies to reduce consumption of tradi-           las by Gronwald et al. (2011) and Chevallier et al. (2019);
tional fossil energies and improve investment in environ-            Diebold and Yilmaz (DY) spillover index by Wang and Guo
ment-friendly clean energies. Thus, the scheme has emerged           (2018) and Ji et al. (2018); Baruník and Křehlík (BK) spillo-
as one of the most important measures for reduction of GHG           ver index by Hanif et al. (2021); BEKK model by Mansanet-
emission (Ji et al. 2018). Since its launch in 2005, there have      Bataller and Soriano (2009) and Chen et al. (2019); and
been a large body of recent works that have grown exponen-           DCC-Generalized AutoRegressive Conditional Heteroske-
tially, highlighting the growing interest in the EUA on the          dasticity (GARCH) model by Balcilar et al. (2016) and Gar-
EU ETS to encourage GHG reduction and decarbonization                gallo et al. (2021), among others. In the third category, the
of economic actors (Hu et al. 2015; Bayer and Aklin 2020).           information transmission between carbon emission market
Actually, by having high liquidity and analogous characteris-        and clean energy market is examined using transfer entropy
tics of financial assets, EUA has become an attractive invest-       (Gao et al. 2020; Hung 2021). Although mixed results have
ment instrument that is capable of continuous contribution           been reported in literature, due to the different data and
to the realization of a low-carbon lifestyle. European car-          methodologies used, the general agreement has been that
bon allowance prices have languished in the single digits for        carbon emission market and clean energy market are related,
years, but not any longer. The price for carbon allowances on        constituting a complex system.
the EU ETS has surged by 60% this year, recently crossing               Although previous empirical researches have provided
the €50-per-ton threshold for the first time. The rally marks a      an important reference for comprehending the information

                                                                                                                        13
77726                                                             Environmental Science and Pollution Research (2022) 29:77724–77736

transmission between markets of carbon emissions and clean       and for policymakers at macro- as well as microlevel to take
energies, the dynamic causality between the price of EUA         decisions about carbon emission, clean energy innovations,
and the index of clean energy stocks remains elusive and         and risk management.
has rarely been investigated using information flow analysis,        Also, it is worth noting that the hypothesis invoked in
a natural tool for understanding information transmission.       these researches with a conventional method that the causal-
Information flow (or information transfer as it may appear       ity between different financial variables is constant over a
in the literature) is a fundamental physics concept which is     sample period is usually rejected (Hammoudeh et al. 2020).
logically associated with causality: while a causal relation     Thus, it is necessary to take into account the dynamic cau-
entails a flow of information, the latter provides a measure     sality between EUA prices and clean energy index to figure
of the strength of entailing causality (Liang and Kleeman        out how the underlying information transmission between
2005; Pereda et al 2005) and has been successful in many         the two series changes over time. In this context, this paper
applications and generalized to multivariate data and non-       aims to examine whether the causality in return and in vari-
linear time series causal analysis (Kyrtsou et al 2019; Li and   ance from the EUA prices to the clean energy index is sig-
Liu 2019; Liang 2019; Zhang et al 2022). Recently, causal-       nificantly time-varying, or vice versa. This will be important
ity in terms of information flow has been realized as a real     for price prediction, portfolio optimization, and risk man-
physical notion that can be rigorously formulated from first     agement. Methodologically, unlike previous studies in the
principles (Liang 2008, 2016). This is in contrast to the tra-   literature, this study employs a novel time-varying causality
ditional axiomatically proposed methods. Because market          approach with a running window algorithm developed by
participants, who are concerned about climate change and         Liang (2014) based on the rigorously established informa-
environment improvements, pay close attention to the carbon      tion flow (Liang 2016) to investigate whether the bidirec-
emission market as well as the clean energy market from the      tional causalities in return and in variance between EUA
perspective of financial investment, it is understandable that   prices and clean energy index could change over the study
the information flow between the prices of the two markets is    period and then exhibit a different dynamic feature.
important for them to make reasonable investment decisions.          In comparison with existing studies, the potential contri-
It is hence intriguing to use this more sophisticated theory     bution of this study is twofold. On one hand, the dynamic
and the subsequent analysis tools to explore the causality       causalities in return and in variance between prices of EUAs
between the price of EUA and the index of clean energy           and clean energy index are investigated. Specifically speak-
stocks. It merits mentioning that this causality analysis can    ing, the time-varying significant causalities in return and in
be easily and very efficiently fulfilled with time series in     variance are examined. Significant causal relationships are
a quantitative sense (Liang 2014, 2021). Since its advent,       detected at certain intervals in the whole sample period: a
many applications have been carried out with remarkable          significant unidirectional long-term and stable causality in
success for diverse problems in different disciplines, such as   return from the clean energy index to EUA prices exists after
global warming vs. ­CO2 emissions, weather pattern forma-        March 2020. But the causality in variance between the two
tion, ocean eddy shedding, brain’s neural networks, financial    shows a different scenario; there exists a sporadic causality
markets, and so on (Liang 2015, 2016, 2019; Stips et al.         in variance before February 2020, and a bidirectional stable
2016; Lu et al. 2020; Tao et al. 2021).                          causality in variance after 2020, but the sign of the causality
    In addition, studies in recent literature further show       is opposite to that of causality in return. (A positive/nega-
that as information transmission between stock markets           tive sign in Liang’s formalism corresponds to the excita-
increases, an unpredictable event in one market causes           tory/inhibitory mechanism of the information flow within a
changes in not only return but also volatility (or variance)     neural network. This property is not seen in the traditional
in other markets (Balcilar et al. 2021). As documented in        methods.) The significant causalities in return and in vari-
Pantelidis and Pittis (2004), causality between two variables    ance can improve the predictive powers of the clean energy
can be divided into two types: one is causality in return; the   market on the carbon emission market, and vice versa. This
other is causality in variance. Furthermore, all causality-in-   helps market participants to better adjust their decisions and
return influences should be extracted from some parametric       allocate funds to appropriate portfolios.
model before the causality in variance is examined. It is            On the other hand, a novel time-varying causality analy-
therefore tempting to employ the aforementioned rigorously       sis with a rolling window algorithm developed by Liang
formulated information flow and causality analysis to gain       (2014, 2016) is employed to examine the causal informa-
a reliable and deeper understanding of the fundamental           tion transmission between EUA prices and clean energy
process of information transmission, both in return and in       index. As mentioned above, the resulting causality is not
variance or volatility, between EUA prices and clean energy      only quantitative, but it can also be further differentiated
index. This can provide leverage for participants in financial   with a positive or negative sign, which is not the case in
markets to construct better portfolios and hedging strategies    the traditional methods. It hence facilitates the revealing of


13
Environmental Science and Pollution Research (2022) 29:77724–77736                                                            77727

more fundamental characteristics of the influence of carbon          companies related to low-carbon economy and prices of
emission market on clean energy market. Our results show             carbon emission allowances; they reveal a positive influ-
that EUA prices exhibit a negative causality in variance after       ence of Shenzhen carbon emission prices on prices of stocks
March 2020, while the clean energy index has the opposite            of companies of low-carbon economy. Kumar et al. (2012)
causality in return and in variance after March 2020. The            investigate the dependence between renewable energy com-
causality between the two series is more significant as the          panies’ stocks and carbon markets with VAR model and find
increase of EUA prices and the clean energy index, which             it insignificant. Nazifi and Milunovich (2010) explore the
might imply that the turmoil in market situation strength-           causalities between the EU carbon allowance and natural
ens the interaction between the carbon emission and clean            gas, which is often viewed as a clean energy alternative,
energy markets. These results will make important refer-             using the Granger causality test, and find no long-run rela-
ences for academics, market participants, and policymakers           tionship between them. Fezzi and Bunn (2009) measure the
to understand the underlying linkages between EUA prices             structural interactions of electricity, natural gas, and carbon
and clean energy index. For example, financial investors can         prices applying a structural, co-integrated VECM model
use these findings to obtain better risk-adjusted returns from       and report a bidirectional interaction between natural gas
their well-diversified portfolios, and to improve the portfo-        prices and carbon emission allowance prices in phase I of
lio performance, while policymakers could adopt effective            the EU ETS. Mansanet-Bataller et al. (2007) highlight posi-
measures to properly promote prices of the EUA so that               tive impacts of natural gas on EUA forward in phase I of the
the carbon emission allowance market can provide stimuli             EU ETS using a multiple linear regression model. Zhao et al.
to shift from the traditional fossil resources to renewable          (2020) investigate the nonlinear Granger causality in China’s
energy resources.                                                    carbon emission trading markets by using the Hiemstra and
   The rest of this study is organized as follows. The “Lit-         Jones test and Diks and Panchenko test; they demonstrate a
erature review” section briefly reviews the related literature.      significant bidirectional nonlinear Granger cause in China’s
The “Materials and methods” section depicts the data used            major carbon emission trading markets.
in our empirical research and introduces the theoretical                 In addition, the conditional vine copula is used to study
methods. The “Results” section presents and discusses the            the relationship between the carbon emission market and
obtained results. Finally, the “Conclusion” section closes           energy markets, including natural gas, coal, and electric-
this study with general conclusions.                                 ity; a weak and negative correlation between carbon prices
                                                                     and natural gas prices is found (Chevallier et al. 2019).
                                                                     Also, different copulas are applied to explore the complex
Literature review                                                    dependence structure between EUA futures and natural gas
                                                                     futures, and a positive dependence structure between them
It is widely accepted that ­CO2 emission allowance prices            is discovered (Gronwald et al. 2011). Hanif et al. (2021)
are correlated with energy prices, especially clean energy           examine the spillovers between the prices of EUA and the
prices, but it is not clear whether the carbon emission market       indices of clean energies by using the BK spillover index
has a significant influence on the clean energy market. The          and find a dominance of short-run spillovers between
traditional econometric models have been extensively used            the two series over their long-run counterpart. Wang and
to explore the potential causality between the two markets.          Guo (2018) and Ji et al. (2018) investigate the spillovers
For instance, Hammoudeh et al. (2020) examine the real-              between the carbon emission and energy markets using the
time Granger causality between green bonds and C      ­ O2 emis-     DY spillover index and reveal that the dynamic spillover
sion allowances, and find that C ­ O2 emission allowance price       effects between the carbon and natural gas/clean energy
Granger causes green bond prices unidirectionally. Chang             markets exist. Chen et al. (2019) and Mansanet-Bataller
et al. (2020) find that the significant causalities are unidirec-    and Soriano (2009) explore the volatility transmission in
tional from the stock markets to ­CO2 emission market, but           the carbon emission and energy markets with a BEKK
not the other way around. Adams and Acheampong (2019)                model and show a positive correlation between the EUA
examine the impact of clean energy on carbon emissions               and natural gas. Gargallo et al. (2021) use the DCC-
using a multiple linear regression model and report that the         GARCH model to analyze the co-movements between the
use of clean energy reduces carbon emissions. Dutta et al.           carbon emission and energy markets, and find bidirectional
(2018) use the bivariate VAR-GARCH model to investigate              spillover effects between EUA and natural gas. Similarly,
the correlations of the return and volatility between C     ­ O2     Balcilar et al. (2016) detect the risk spillovers between
allowances and renewable energy prices, and document that            prices of energy futures and Europe-based carbon futures
fluctuations in returns of EUA positively affect returns of          with the DCC-GARCH model and find dynamic risk trans-
clean energy stocks. Zhu and Kong (2016) analyze, using              mission from energy markets, including natural gas, to the
a VAR model, the correlation between the stock prices of             carbon market.


                                                                                                                         13
77728                                                                  Environmental Science and Pollution Research (2022) 29:77724–77736

   Since “information transmission” is essentially about the      energy-related businesses from both developed and emerg-
flow of information, a few researchers have adopted the con-      ing markets which broadens the financial instruments avail-
cept of information flow to examine whether carbon emis-          able to market participants concerned about climate change
sion information is transmitted to the clean energy market.       and environment improvements. As of March 2022, market
Their attempt is to approximate the “information flow” to         cap of European companies accounts for 52.45% of the total
the real physical notion using some empirical measures. For       market cap of the S&P Global CEI. Because it tracks the
instance, Hung (2021) investigates with transfer entropy the      largest and most liquid stocks worldwide which are involved
causal association between green bonds and clean energy/          in clean energy business, we follow the majority of the
CO2 emission allowances and finds a unidirectional connec-        recent literature (Asl et al. 2021; Dawar et al. 2021; Liu et al.
tion from green bonds to the prices of ­CO2 emission allow-       2021) and use it as an appropriate proxy of the global clean
ances. Gao et al. (2020) studied the “information flows”          energy market quotations. Allowing for 57% of the total
from the ­CO2 emission market to the renewable energy stock       amount of the general carbon emission allowances auctioned
market and highlight that EUA price “information flows” to        in phase III (2013–2020) and phase IV (2021–2030), which
the S&P GCE clean energy prices vary at different scales.         are different from the previous two phases (https://e​ c.e​ uropa.​
   It merits mentioning that as of today, the important con-      eu/​clima/​polic​ies/​ets/​aucti​oning_​en#​tab-0-0), the start date
cept of information flow has been rigorously derived from         of the analyzed period is 2 January 2013, the beginning of
the first principles. This forms our motivation to reconsider     the third phase of the EU ETS. Because the fourth phase has
the above problem based on this newly established sys-            just begun, and has adopted a new and revised legislative
tematic theory. Besides, the aforementioned studies have          proposal of the EU ETS, which sets a binding EU target of
allowed for influence of the carbon emission market on the        a net GHG reduction by at least 55% by 2030, and aims to
clean energy markets, while the dynamic causality in return       strengthen the EU ETS as an investment driver by increasing
and in variance between the prices of EUA and the index of        the pace of annual reductions in carbon emission allowances
clean energies remains unexplored. For these reasons, this        to 2.2% from 2021 onwards compared to 1.74% previously,
study extends the related literature.                             the ending date of the analyzed period is 31 December 2020,
                                                                  the end of the third phase of the EU ETS. After matching the
                                                                  timestamps of both time series, a total of 2016 daily observa-
Materials and methods                                             tions are included in the sample(period.       )      (      )
                                                                      We d e(n o t e) REUA    t ( = log )  PEUA
                                                                                                             t     − log PEUA
                                                                                                                           t−1
                                                                                                                                   and
Data                                                              RCEI
                                                                    t
                                                                         = log  P CEI
                                                                                  t
                                                                                         − log   P  CEI
                                                                                                    t−1
                                                                                                          as  the log returns  of EUA
                                                                  and CEI, respectively, where PEUA and PCEI are the prices
The main variables considered in this paper are the S&P           of EUA and CEI. The descriptive statistics of the data are
GSCI Carbon Emission Allowances (EUA) and the S&P                 provided in Table 1.
Global Clean Energy Index (CEI), which are obtained from              As shown in Table 1, log returns of the EUA have a
S&P Global (https://​www.​spglo​bal.​com/​en/). The S&P           higher average value than the clean energy index, mean-
GSCI EUA closely tracks the trend of actual EU ETS per-           ing that the carbon emission market is more favorable
mit prices, which is the most influential carbon trading asset    for financial participants, while the standard deviation
in the world. More importantly, it provides market partici-       of the former is larger than that of the latter, indicating
pants with a reliable and publicly available investment per-      that the carbon emission market is more volatile. The two
formance benchmark for European Carbon Emission Allow-            log return series are skewed to the left and show high
ances and facilitates them to express a specific view on the      excess kurtosis, indicating that they have non-normal
price of carbon, or combine carbon emissions with other           distribution. The Jarque–Bera (JB) statistics also indi-
assets to create low-carbon strategies while promoting the        cate a significant absence of normality for log returns
transition to the global climate neutrality. Thus, it can be      of EUA and CEI. The augmented Dickey-Fuller (ADF)
an appropriate proxy of the global carbon emission market         tests for the two log return series undoubtedly reject the
quotations. The S&P Global Clean Energy Index is designed         null hypothesis of having the unit root at a 1% signifi-
to measure the performance of top companies in global clean       cance level, indicating that they are stationary and turn


Table 1  Descriptive statistics
Variables      Mean          Std      Skewness   Kurtosis    JB test           ADF test            Ljung-Box Q(20)       LM ARCH test

REUA           0.0008        0.0338   − 1.1697   20.6350     26,570***          − 21.8413***       90.468***             18.9224***
R   CEI        0.0007        0.0134   − 0.8781   16.4227     15,385***          − 15.2629***       131.38***             123.2901***



13
Environmental Science and Pollution Research (2022) 29:77724–77736                                                                 77729

out to be integrated in the same order of 0 lag. There-              Methodology
fore, analysis of the causality between the EUA and CEI
can be conducted. The statistics of Ljung-Box test are               To examine the dynamic causal relationship in return and in
significant and show the existence of serial correlation.            variance between ­CO2 emission allowance prices and the clean
Further, the LM ARCH test significantly rejects the null             energy index, we follow the recently developed causality analy-
of homoscedasticity at a 1% significance level, implying             sis with a rolling window algorithm developed by Liang (2014,
that the heteroscedastic model, i.e., Generalized AutoRe-            2016). In order to fit the autoregression and conditional vari-
gressive Conditional Heteroskedasticity (GARCH) model                ances of log returns of EUA and CEI, the autoregression with
(Bollerslev 1986), is suitable to capture their conditional          the GJR-GARCH (ARMA-GJR-GARCH) model introduced by
variances.                                                           Glosten et al. (1993) is employed. This is one of the most popular
    Figure 1 shows that lower market fluctuations in EUA             models ever proposed to represent conditional heteroscedasticity
prices are observed from 2013 to 2018. Then the latest               with volatility clustering and leverage effect in financial markets.
reforms on the withdrawal of excess supply of carbon
emission allowances caused a significant rebound in the              The rigorously derived quantitative causality analysis
price. EUA prices soared after that until the beginning of
2020, when the COVID-19 pandemic caused stagnation                   Causal inference is of central importance for researchers in
in global production and some concern and uncertainty                various disciplines. Recently, in terms of information flow,
in the recovery of certain key sectors in energy demand,             Liang (2008, 2014, 2016) found that causality is actually a
leading to a turmoil in financial markets. After that, EUA           real physical notion (not just something in statistics) which
prices follow a rising trend as the economy picks up. The            can be rigorously derived from first principles, initially moti-
evolution of the CEI prices is similar to that of the EUA,           vated by a discovery in a two-dimensional dynamic system
although a relatively steady movement is displayed from              (Liang and Kleeman 2005). Because of the formalism ab ini-
2013 to the beginning of 2020. It seems that the increase            tio, it is universally applicable, quite different from other
of the EUA prices encourages production and use of clean             empirical/half-empirical formalisms. In the following, a brief
energies, and further exerts a more important influence              introduction of the part pertaining to this study is presented.
on stock prices of clean energy companies. Log returns
of both EUA and CEI show stationarity and obvious vola-              Consider a stochastic dynamic system
tility clustering. The log returns of the EUA are clearly
more volatile from the beginning of the sample period                          d𝐗 = 𝐅(𝐗, t)dt + 𝐁(𝐗, t)d𝐖                            (1)
until the middle of 2014 than those of the CEI. In addi-             where 𝐗 and 𝐅 are n-dimensional vectors, 𝐁 is a pertur-
tion, high volatility of EUA and CEI is observed during              bation coefficient matrix with n rows and m columns, and
the outbreak of the COVID-19 pandemic.                               𝐖 is a standard Wiener process vector with m elements.

Fig. 1  Price and log return
series of EUA (left) and CEI                                 PEUA                                               PCEI
(right)
                                      150                                              2000

                                      100                                              1500

                                        50                                             1000

                                         0                                               500
                                          13 14 15 16 17 18 19 20                           13 14 15 16 17 18 19 20
                                                     REUA                                              RCEI
                                       0.2
                                                                                         0.1
                                         0
                                                                                            0
                                      -0.2

                                      -0.4                                              -0.1

                                          13 14 15 16 17 18 19 20                            13 14 15 16 17 18 19 20

                                                                                                                             13
77730                                                                           Environmental Science and Pollution Research (2022) 29:77724–77736

Throughout the paper, 𝐅 and 𝐁 are supposed to be differenti-                  ARMA‑GJR‑GARCH model
able in 𝐗 and time t. The rate of information flowing (RIF)
from Xj to Xi (in nats per unit time) proves to be (Liang                     GARCH models have the power of investigating con-
2016)                                                                         ditional heteroscedasticity with volatility clustering
                                                                              and leverage effect in financial markets (see Agnolucci
            �                            �   ⎡                            ⎤
                        𝜕(Fi 𝜌̃j )                  𝜕 2 (gii 𝜌̃j )            2009; Dyhrberg 2016; Lin 2018; among others). Specifi-
                𝜌i ∫ℜn−2 𝜕xi               2 ⎢ 𝜌i ∫
                1                          1 1
Tj→i = −E                          d𝐱̃ĩj + E⎢                     d𝐱̃ĩj ⎥   cally, the ARMA-GJR-GARCH model of Glosten et al.
                                                        𝜕xi2              ⎥
                                             ⎣ ℜn−2                       ⎦   (1993) is suitable for our case, as it allows one to study
                                                                    (2)       the volatility features of carbon emission prices and clean
where E denotes mathematical expectation, and 𝜌i = 𝜌i (xi )                   energy stock index (Benz and Trück 2009). The standard
and 𝜌̃j = ∫ℜ 𝜌(𝐱)dxj are the marginal probability of density                  ARMA(m, n) − GJR − GARCH(p, q) model is presented as
function of Xi and the joint probability of density function                  follows:
                                              ∑m
of 𝐗 with Xj removed, respectively; gii =         bik bik ; d𝐱̃ĩj                         ∑
                                                                                           m
                                                                                                                     ∑
                                                                                                                     n
                                                         k=1
stands for d𝐱 but with d𝐱i and d𝐱j removed. Ideally, if
                                                                              xt = 𝜇 +           𝜙i xt−i + 𝜀t −            𝜃i 𝜀t−i            (5)
                                                                                           i=1                       j=1
Tj→i = 0, then Xj is NOT causal to Xi ; otherwise, it is causal
(for either positive or negative information flow). But in
practice, significance test must be performed.                                             ∑
                                                                                           p
                                                                                                              ∑
                                                                                                              q
                                                                              ht = 𝜔 +           𝛼i 𝜀2t−i +         𝛽j ht−j + 𝛿𝜀2t−1 It−1     (6)
    Equation (2) has many nice properties, one of which is                                 i=1                j=1
the “principle of nil causality”: if the evolution of an event
is independent of another event, then the causality (or the                           √
RIF) from the latter to the former is zero. This is the only
                                                                              𝜀t =     ht 𝜂t 𝜂t ∼ i.i.d. f (0, 1)                             (7)
quantitatively stated observational fact in causal inference;                 where xt is a stationary time series, such as REUA      or RCEI ,𝜇
it has defied the classical formalism under numerous cir-
                                                                                                                                  t       t
                                                                              and 𝜔 are constants, 𝜀t are residuals, ht are the conditional
cumstances, but within Liang’s framework, it turns out to                     variance of 𝜀t , and 𝜂t belongs to a normal or Student’s t dis-
be a theorem. In addition, Tj→i is invariant upon nonlinear                   tribution. Due to rejection of the normal distribution accord-
coordinate transformation.                                                    ing to the Jarque–Bera (JB) statistics of log returns of EUA
    Let X1 and X2 be two time series, and the maximum likeli-                 and CEI (Table 1), the Student t distribution is chosen for 𝜂t .
hood estimator of the RIF from X2 to X1, under the assump-                    It−1 = 1 if 𝜀t−1 < 0, and 0 otherwise. 𝛿 measures the leverage
tion of a linear model with additive noise, is proved by Liang                effect, that is, asset return volatility rises more following bad
(2014) to bear a very concise form:                                           news than following good news. 𝜔 > 0, 𝛼i ≥ 0, 𝛽j ≥ 0, and
                                                                              max (p,q) �       �
                                                                                 ∑
                          2
         C11 C12 C2,d1 − C12 C1,d1                                                       𝛼i + 𝛽i < 1.
T2→1 =       2             2                                           (3)      i=1
            C11 C22 − C11 C12

where Cij is the sample covariance matrix between Xi and
Xj , and Ci,dj is the sample covariance between Xi and a series               Results
derived from Xj using Euler forward differencing scheme:
        (               )                                                     In line with most of the classical literature, in this section,
Ẋ j,n = Xj,n+1 − Xj,n ∕Δt                                  (4)               we first investigate the static causality in return to identify
                                                                              the information flow between the carbon emission market
   Δt being the time step size. This concise formula has had                  and the clean energy market over the full sample period.
remarkable success in resolving a variety of real-world prob-                 Specifically, the traditional Granger causality test (Granger
lems, for example, global climate change (Stips et al. 2016),                 1969) and the Liang formalism (Liang 2014, 2016) are
meteorology (Yang et al. 2021), neuroscience (Hristopulos                     employed to detect the causal relationship between EUA
et al. 2019), and financial markets (Liang 2015; Lu et al.                    and CEI in the full sample. The results are listed in Table 2.
2020), to name a few. A direct corollary is that causation,                      As shown in Table 2, the T value estimated with Eq. (3) for
in linear sense, implies correlation, but correlation does not                the causality from EUA to CEI is 0.0052. The corresponding
imply causation.                                                              confidence interval at the 90% probability level is [− 0.0005,
   The above formula does not need to be applicable for the                   0.0109], inclusive of 0. Therefore, the null hypothesis that
whole duration; the dynamic causality—from X2 to X1, which                    the EUA log returns do not cause the CEI log returns can-
in general varies in time, can be obtained by applying the for-               not be rejected at the 10% significance level, indicating that
mula window by window with a rolling window algorithm.                        the T value of 0.0052 is not significantly different from 0 at


13
Environmental Science and Pollution Research (2022) 29:77724–77736                                                                77731

Table 2  The static causality tests for EUA and CEI over the full sam-   indicating the former can improve the prediction of the lat-
ple period                                                               ter based on the conditional mean.
                             REUA → RCEI                RCEI → REUA         Next, the dynamic causality in return between the
                                                                         two variables is firstly examined. Then, we use the
Liang (T)                    0.0052                     − 0.0073*        ARMA(m, n) − GJR − GARCH(p, q) model to obtain the
Granger (F)                  2.233                      4.371*           conditional variances of EUA and CEI. The Liang causality
*Statistical significance at the 10% level.                              analysis is then used to detect the potential dynamic causal
                                                                         relationship in variance between EUA and CEI.

the 10% level. In the other way, the T value for the causality           Causality in return
from CEI to EUA is − 0.0073. Its corresponding confidence
interval at the 90% probability level is [− 0.013, − 0.0016],            In Fig. 2, the blue line is the dynamic T value estimated
which is exclusive of 0, indicating that there is a statistically        with Eq. (3) using the rolling window algorithm developed
significant causality from the CEI log returns to the EUA log            by Liang (2014, 2016) with two red lines marking the con-
returns at the 10% significance level.                                   fidence interval at a 90% probability level. If the confidence
    The Granger causality test between EUA and CEI is                    interval does not include 0, the null hypothesis of no causal-
developed from vector autoregressive (VAR) model, and the                ity or RIF in that period is rejected at the 10% significance
smallest BIC (− 15.4258) means that the optimum lag order                level, and the T value is significantly different from 0 at the
of the Granger causality test is 1. The results out of the two           10% significance level. On the contrary, if the confidence
methods are generally in accord with each other. The F sta-              interval includes 0, the null hypothesis cannot be rejected
tistics show that the null hypothesis of no causality running            at the 10% significance level, indicating that the T value is
from CEI to EUA is rejected at the 10% significance level                not significantly different from 0 at the 10% significance
over the full sample period, but not the reverse, indicating             level. Without loss of generality, we choose a rolling window
the existence of a significant and unidirectional causality              length of 250 trading days for the estimation purpose.
running from the clean energy market to the carbon emis-                    Figure 2 clearly shows that at the 90% probability level,
sion market on the conditional mean and a clear directional              confidence intervals of the T values that measure the causali-
statement regarding temporal predictability of the former                ties between EUA and CEI almost entirely include 0 from
to the latter.                                                           the beginning of the chosen rolling window until February
    Although consistent results are obtained from the Liang              2020. This implies that the null hypothesis of no causality
causality analysis and the Granger causality test, it is worth           in return between EUA and CEI cannot be rejected at the
noting that the Granger causality test could not be robust               10% significance level, and hence, the EUA does not sig-
because spurious Granger causality in mean may arise due                 nificantly cause CEI and vice versa. It is worth noting that,
to unobserved variables that influence the system dynamics,              after March 2020, the causal relationship in return between
such as variances of variables (Liang 2014, 2016), and due               EUA and CEI becomes obviously stronger. Especially, T
to observational noise. Besides, the Granger causality test              values of the causalities running from CEI to EUA are sig-
cannot provide time-varying causalities between variables,               nificantly different from 0, indicating that the change in the
which are more important for market participants to make                 clean energy market significantly affects fluctuations of the
real-time decisions. Another problem about the Granger                   carbon emission market at the 10% significance level during
causality test is that it only tests the time-lag relationship           that period. In contrast, T values of the causalities running
between variables and the contemporaneous causality is hard              from CEI to EUA are not always significantly different from
to infer (Xu and Zhang 2022), which means it cannot detect               0 after March 2020. There are several short periods when
the contemporaneous information flow between different                   causalities from the carbon emission market to the clean
variables. Therefore, the following content in this section              energy market are significant at the 10% level. It can be seen
explores the dynamic causality in return and that in variance            in Fig. 1 that, after March 2020, carbon emission allowances
between EUA and CEI, with a rolling window algorithm                     and the clean energy index experienced a dramatic increase.
developed by Liang (2014, 2016) based on information flow.               It appears as if, under the lower fluctuations of the clean
    By and large, both the Granger causality test and the                energy market, it has a weak predictive power on the carbon
Liang method (Table 2) yield similar results; that is, there is          emission market, and vice versa, while under its bull market
a static and unidirectional causality in mean running from               condition, it has a strong predictive power on the carbon
the clean energy market to the carbon emission market over               emission market and the predictive powers of the carbon
the full sample period, but not the reverse. Outcomes of the             emission market on the clean energy market also obtain a
causality tests imply the significant information flow from              certain improvement.
the clean energy market to the carbon emission market,


                                                                                                                             13
77732                                                                          Environmental Science and Pollution Research (2022) 29:77724–77736

Fig. 2  Dynamic causality in
return between EUA and CEI

                                         0.05
                                             0
                                        -0.05
                                          -0.1
                                        -0.15
                                             14               15            16               17          18            19             20


                                           0.1
                                         0.05
                                             0
                                        -0.05
                                          -0.1
                                              14              15            16               17          18            19             20


   In general, the dynamic T values show that the                            Estimation of ARMA‑GJR‑GARCH model
carbon emission and clean energy markets interact
with each other in a complex fashion. Under the nor-                         According to the Ljung-Box test and LM ARCH test as
mal market condition, there exist fewer causalities in                       shown in Table 1, serial correlation and heteroscedastic-
return between the two markets. Under the bull mar-                          ity exist in log returns of EUA and CEI. We hence use the
ket condition of the clean energy market, causalities                        ARMA-GARCH model to capture their stylized features. In
in return between the two markets become stronger.                           light of BIC criterion, the ARMA-GJR-GARCH with Stu-
Therefore, market participants concerned about cli-                          dent t distribution is chosen. The estimated results of the
mate change and environment improvements need to                             parameters in the model are listed in Table 3.
adjust decisions according to market conditions. For                            The tabulated results show that the ARMA((1, 4), (4)) − GARCH(1, 1) − t
example, the significant causalities in return running                       model and the AR(1) − GJR − GARCH(1, 1) − t model are suitable to fit
from the clean energy market to the carbon emission                          the log returns of EUA and CEI, respectively, according to the
market indicate that for investors, the EUA plays a                          BIC criterion. The coefficients in the ARMA models are all
strong hedging role against the clean energy index                           statistically significant, indicating the present log returns of
variations during these periods. That is to say, it is                       the two series are impacted by the corresponding previous log
profitable for investors to include the EUA into their                       returns, with lags of orders 1 and 4 for EUA and lag of order 1
portfolios in the increasing phase of the CEI.                               for CEI. The Ljung-Box test for the first ten lags of the sample
                                                                             autocorrelation function of residuals exhibits no significant
                                                                             series correlation for EUA and CEI. Thus, the ARMA models


Table 3  Estimation of the ARMA-GJR-GARCH model
Variables       REUA                                                                  RCEI

ARMA      𝜇                      𝜙1               𝜙4               𝜃4                 𝜇               𝜙1
          0.00124***             − 0.04214***     0.86456***       − 0.85230***       0.00061*        0.15219***
GJR-GARCH 𝜔                      𝛼                𝛽                𝛿                  𝜔               𝛼          𝛽                    𝛿
          1.03E − 05***          0.08745***       0.90722***       –                  2.35E − 6***    0.05582*** 0.89062***           0.06491***
          Degrees of             BIC              Ljung-Box        LM ARCH            Degrees of      BIC        Ljung-Box            LM ARCH test
            freedom                                 Q(10)            test               freedom                    Q(10)
          4.93423***              − 4.340626      8.8669           0.001857           6.11754***      − 6.203741 9.8958               0.019838

*** and * indicate statistical significance at the 1% and 10% levels, respectively.


13
Environmental Science and Pollution Research (2022) 29:77724–77736                                                               77733

can preserve the residuals of the EUA and CEI log returns at
                                                                      0.4
a conventional level. In terms of GJR-GARCH model, the
ARCH and GARCH items are always significant. These out-               0.2
comes mean that the present variances of the two log return
series are easily impacted by the information in the previous           0
period. The asymmetric term 𝛿 is statistically significant and          14       15      16       17       18      19       20
positive for CEI at the 1% level, which means the leverage
effect exists for CEI, the impact of shocks is asymmetric, and          0
negative shocks increase the conditional variances of CEI log
returns. However, the asymmetric term 𝛿 of EUA is not statis-        -0.1

tically significant, which implies that the impact of shocks on      -0.2
EUA log returns is symmetric. The degrees of freedom reject
                                                                        14       15      16       17       18      19       20
the null hypothesis, indicating that the Student t distribution
of standardized residuals is more appropriate than the normal
                                                                     Fig. 4  Dynamic causality in variance between EUA and CEI
distribution and can capture the fat tails and kurtosis of the
two log return series. The LM ARCH test statistics for the
two log return series indicate no ARCH effect remaining in           of the T values at the 90% probability level from the begin-
the residuals of the models.                                         ning of the chosen rolling window to February 2020, we
   The time-varying conditional variances of EUA and CEI             can find that there are several periods that do not include
are displayed in Fig. 3. It can be observed that the maximum         0, indicating that there exist significant causalities at the
of the conditional variances of EUA took place in 2013,              10% significance level between variances of EUA and CEI.
while that of CEI took place in 2020. In 2013, the first year        Regarding significant causalities in variance from CEI to
of the third stage of EU ETS, policy changes resulted in the         EUA, the sporadic periods are January through June 2016,
price of EUA going up. In 2020, the clean energy index had           October through December 2016, and July through Sep-
a great growth, so the CEI experienced much volatility.              tember 2018, while in the other way around, the significant
                                                                     periods are May 2014, June 2015, and December 2016. Par-
Causality in variance                                                ticularly, larger absolute T values show up after March 2020
                                                                     in Fig. 4, indicating EUA and CEI are bidirectionally causal
To investigate the causality in variance between EUA and             in variance after March 2020. As a note, the T values switch
CEI, the time-varying conditional variances for the two              their signs (+ / −). This means the causalities in variance
series from the ARMA-GJR-GARCH model are input into                  between EUA and CEI are different from those in return.
Eq. (3) to compute the causality. The results are shown in           The causal relationship from CEI to EUA in return is nega-
Fig. 4. It can be seen that this figure starts with a very low       tive, indicating that the increase in RCEI
                                                                                                              t
                                                                                                                  will cause decrease
level of T values, similar to those in Fig. 2. This implies that     in REUA
                                                                          t
                                                                               . However,  the  causal relationship  in variance from
the carbon emission and clean markets are not integrated,            CEI to EUA is positive, which means that increase in condi-
and variances of EUA do not influence those of CEI, and              tional variances of CEI will cause the increase in conditional
vice versa. However, if we go over the confidence intervals          variances of EUA. On the other hand, the causal relationship
                                                                     from EUA to CEI in return is positive and not so significant,
                                                                     indicating that the increase in RCEI t
                                                                                                              may cause increase in
0.02                                                                 REUA
                                                                       t
                                                                            . Nevertheless, the causal relationship from EUA to CEI
                                                                     in variance is significantly negative, which means that the
0.01                                                                 increase in conditional variances of CEI will cause decrease
                                                                     in conditional variances of EUA.
   0                                                                     By examining variances of EUA and CEI in Fig. 3, it can
    13             14   15   16    17      18     19        20       be found that the significant and bidirectional causalities in
              -3
   6
         10                                                          variance happens during the dramatic volatilities of the vari-
                                                                     ances of EUA and CEI, especially the latter. The results gen-
   4
                                                                     erally reveal stronger causalities in variance between EUA
   2                                                                 and CEI under the market turmoil. This suggests that the
                                                                     change in variances of the clean energy market can provide
   0
    13             14   15   16    17      18     19        20       better predictive powers for variances of the carbon emission
                                                                     market, and vice versa. It also suggests that the importance
Fig. 3  Time-varying conditional variances of EUA and CEI            of identifying the causalities in variance between EUA and


                                                                                                                           13
77734                                                               Environmental Science and Pollution Research (2022) 29:77724–77736

CEI in a dynamic way is crucial for market participants to        abatement and then improve the performance of the clean
efficiently manage the investment portfolios and to imple-        energy-related companies. Hence, portfolios including the
ment optimal risk decisions.                                      carbon emissions and clean energy-related companies are
                                                                  probably considered by the financial participants concerned
                                                                  about climate change and environment improvements. In
Conclusions                                                       addition, policymakers can use EUA to put certain pres-
                                                                  sure on enterprises with high emission and high pollution
 An understanding of the causal relationship between the car-     to move on, energy-mix transformation, and development
 bon emission market and the clean energy market is essential     of clean energy-related industries. For example, implement-
 for probing the interaction between the C­ O2 emission allow-    ing appropriate carbon price and auction ration of carbon
ance prices and clean energy asset prices. It is beneficial for   permits is able to accelerate the phase-out of operating coal
financial participants to obtain better risk-adjusted returns     power plants and reduce the implied risk for newly built coal
from their well-diversified portfolios and to improve the         plants to become stranded asset (Mo et al. 2021a, 2021b).
portfolio performance; it is also beneficial for policymakers     Moreover, the results imply that policymakers should con-
to adopt effective measures to properly promote the prices        sider not only the causality in return, but also the causality
of EUA so that the carbon emission market could provide           in variance, between EUA and CEI, in attempt to implement
stimuli to transfer traditional resources to clean resources.     their policies regarding the global climate neutrality.
Based on the CEI and EUA data during the period spanning
from 2 January 2013 to 31 December 2020, this paper stud-
ies the causal relationships in return and in variance between    Author contribution XL: conceptualization, formal analysis, funding
                                                                  acquisition, investigation, methodology, software, supervision, valida-
­CO2 emission allowance prices and the clean energy index,        tion, writing—original draft, writing—review and editing; KL: data
 using a novel time-varying causality analysis with a rolling     curation, formal analysis, resources, software, writing—original draft;
 window algorithm developed by Liang (2014, 2016).                XSL: software; writing—review and editing. KKL: writing—review;
     Our results reveal that the causal relationships in return   HC: writing—review and editing.
 and in variance between EUA and CEI are time-varying.
                                                                  Funding This work was financially supported by the National Natural
 Regarding the causality in return, most of the time in the       Science Foundation of China [71701104]; the MOE Project of Humani-
 considered period, no significant causality has been identi-     ties and Social Sciences [17YJC790102]; and the Social Science Fund
 fied between ­CO2 allowance prices and clean energy index;       of Jiangsu Province [20GLB008].
 a unidirectional long-term and stable causality in return from
 CEI to EUA is identified after March 2020. For the causal-       Data availability The datasets generated and/or analyzed during the
                                                                  current study are available in the S&P Global official website: https://​
 ity in variance, EUA and CEI have bidirectional causality        www.s​ pglob​ al.c​ om/s​ pdji/e​ n/i​ ndice​ s/c​ ommod​ ities/s​ p-g​ sci-c​ arbon-e​ miss​
 after March 2020, but T values of causality, i.e., the rate of   ion-​allow​ances-​eua/#​overv​iew for Carbon Emission Allowances and
 information flow, after 2020 are opposite to those in return.    https://w
                                                                          ​ ww.s​ pglob​ al.c​ om/s​ pdji/e​ n/i​ ndice​ s/e​ sg/s​ p-g​ lobal-c​ lean-e​ nergy-​
 It seems that under lower fluctuations of the clean energy       index/#​overv​iew for Clean Energy Index.
 market, the clean energy market has a weak causality on the
 carbon emission market, while under the increasing situ-         Declarations
 ation of the clean energy market, causalities between the
                                                                  Ethics approval and consent to participate Not applicable.
 two markets have been significantly strengthened. Moreover,
 there are some sporadic periods when causalities in variance     Consent for publication Not applicable.
 between the two markets are significant at the 10% level
 before February 2020, indicating that the carbon emission        Competing interests The authors declare no competing interests.
 and clean energy markets interact in a complex way.
     Our results have several important implications for inves-
 tors as well as for policymakers. With high liquidity and
 similar financial asset characteristics, EUA has become an       References
 interesting financial investment tool to continue to contrib-
 ute to realization of a low-carbon economy. Financial inves-     Adams S, Acheampong AO (2019) Reducing carbon emissions: the role
 tors can benefit from the causality running from the carbon          of renewable energy and democracy. J Clean Prod 240:118245.
                                                                      https://​doi.​org/​10.​1016/j.​jclep​ro.​2019.​118245
 emission market to the clean energy market, or vice versa,       Agnolucci P (2009) Volatility in crude oil futures: a comparison of the
 when they allow for EUA and CEI in their diversified port-           predictive ability of GARCH and implied volatility models. Energ
 folios. For example, Tu et al. (2019, 2021) highlighted that         Econ 31(2):316–321. https://d​ oi.o​ rg/1​ 0.1​ 016/j.e​ neco.2​ 008.1​ 1.0​ 01
 the high trading price of carbon emissions may increase the      Asl MG, Canarella G, Miller SM (2021) Dynamic asymmetric opti-
                                                                      mal portfolio allocation between energy stocks and energy
 revenues of the clean energy investment from the carbon


13
Environmental Science and Pollution Research (2022) 29:77724–77736                                                                                      77735

     commodities: evidence from clean energy and oil and gas com-                   Hammoudeh S, Ajmi AN, Mokni K (2020) Relationship between
     panies. Resour Policy 71:101982. https://​doi.​org/​10.​1016/j.​resou​               green bonds and financial and environmental variables: a novel
     rpol.​2020.​101982                                                                   time-varying causality. Energ Econ 92:104941. https://​doi.​org/​
Balcilar M, Demirer R, Hammoudeh S, Nguyen DK (2016) Risk spillo-                         10.​1016/j.​eneco.​2020.​104941
     vers across the energy and carbon markets and hedging strategies               Hammoudeh S, Nguyen DK, Sousa RM (2014) Energy prices and
     for carbon risk. Energ Econ 54:159–172. https://d​ oi.o​ rg/1​ 0.1​ 016/j.​         ­CO2 emission allowance prices: a quantile regression approach.
     eneco.​2015.​11.​003                                                                Energ Policy 70:201–206. https://​doi.​org/​10.​1016/j.​enpol.​2014.​
Balcilar M, Ozdemir ZA, Ozdemir H (2021) Dynamic return and vola-                        03.​026
     tility spillovers among S&P 500, crude oil, and gold. Int J Financ             Hanif W, Hernandez JA, Mensi W, Kang SH, Uddin GS, Yoon S-M
     Econ 26:153–170 (https://​www.​doi.​org/​10.​1002/​ijfe.​1782)                      (2021) Nonlinear dependence and connectedness between clean/
Bayer P, Aklin M (2020) The European Union emissions trading sys-                        renewable energy sector equity and European emission allow-
     tem reduced ­CO2 emissions despite low prices. P Natl Acad Sci                      ance prices. Energ Econ 101:105409. https://​doi.​org/​10.​1016/j.​
     USA 117(16):8804–8812. https://​doi.​org/​10.​1073/​pnas.​19181​                    eneco.​2021.​105409
     28117                                                                          Hristopulos DT, Babul A, Babul S, Brucar LR, Virji-Babul N (2019)
Benz E, Trück S (2009) Modeling the price dynamics of ­CO2 emission                      Disrupted information flow in resting-state in adolescents with
     allowances. Energ Econ 31(1):4–15. https://​doi.​org/​10.​1016/j.​                  sports related concussion. Front Hum Neurosci 13:419. https://​
     eneco.​2008.​07.​003                                                                doi.​org/​10.​3389/​fnhum.​2019.​00419
Bollerslev T (1986) Generalized Autoregressive Conditional Heter-                   Hu J, Crijns-Graus W, Lam L, Gilbert A (2015) Ex-ante evaluation
     oskedasticity. J Econometrics 31(3):307–327. https://​doi.​org/​10.​                of EU ETS during 2013–2030: EU-internal abatement. Energ
     1016/​0304-​4076(86)​90063-1                                                        Policy 77:152–163. https://​doi.​org/​10.​1016/j.​enpol.​2014.​11.​023
Chang C-L, Ilomäki J, Laurila H, McAleer M (2020) Causality between                 Hung NT (2021) Nexus between green bonds, financial and environ-
     CO2 emissions and stock markets. Energies 13:2893. https://​doi.​                   mental indicators. Econ Bus Lett 10(3):191–199 (https://​reuni​
     org/​10.​3390/​en131​12893                                                          do.​uniovi.​es/​index.​php/​EBL/​artic​le/​view/​1585)
Chen Y, Qu F, Li W, Chen M (2019) Volatility spillover and dynamic                  IPCC (Intergovernmental Panel on Climate Change) (2013) Cli-
     correlation between the carbon market and energy markets. J Bus                     mate change 2013: The physical science basis. Contribution of
     Econ Manag 20:979–999. https://​doi.​org/​10.​3846/​jbem.​2019.​                    Working Group I to the Fifth Assessment Report of the Inter-
     10762                                                                               governmental Panel on Climate Change [Stocker TF, Qin D,
Chevallier J, Nguyen DK, Reboredo JC (2019) A conditional depend-                        Plattner G-K, Tignor M, Allen SK, Boschung J, Nauels A, Xia
     ence approach to CO2-energy price relationships. Energ Econ                         Y, Bex V, Midgley PM (eds.)]. Cambridge University Press,
     81:812–821. https://​doi.​org/​10.​1016/j.​eneco.​2019.​05.​010                     Cambridge, UK. https://​www.​ipcc.​ch/​site/​assets/​uploa​ds/​2018/​
Dawar I, Dutta A, Bouri E, Saeed E (2021) Crude oil prices and clean                     02/​WG1AR5_​all_​final.​pdf
     energy stock indices: lagged and asymmetric effects with quantile              Ji Q, Zhang D, Geng J (2018) Information linkage, dynamic spill-
     regression. Renew Energ 163:288–299. https://​doi.​org/​10.​1016/j.​                overs in prices and volatility between the carbon and energy
     renene.​2020.​08.​162                                                               markets. J Clean Prod 198:972–978. https://​doi.​org/​10.​1016/j.​
Dutta A, Bouri E, Noor MH (2018) Return and volatility linkages                           jclep​ro.​2018.​07.​126
     between CO2 emission and clean energy stock prices. Energy                     Keppler JH, Mansanet-Bataller M (2010) Causalities between C          ­ O2,
     164:803–810. https://​doi.​org/​10.​1016/j.​energy.​2018.​09.​055                   electricity, and other energy variables during phase I and phase
Dyhrberg UC (2016) Bitcoin, gold and the dollar – a GARCH volatil-                       II of the EU ETS. Energ Policy 38(7):3329–3341. https://​doi.​
     ity analysis. Financ Res Lett 16:85–92. https://​doi.​org/​10.​1016/j.​             org/​10.​1016/j.​enpol.​2010.​02.​004
     frl.​2015.​10.​008                                                             Kumar S, Managi S, Matsuda A (2012) Stock prices of clean energy
Fawzy S, Osman AI, Doran J, Rooney DW (2020) Strategies for miti-                        firms, oil and carbon markets: a vector autoregressive analysis.
     gation of climate change: a review. Environ Chem Lett 18:2069–                      Energ Econ 34(1):215–226. https://​d oi.​o rg/​1 0.​1 016/j.​e neco.​
     2094. https://​doi.​org/​10.​1007/​s10311-​020-​01059-w                             2011.​03.​002
Fezzi C, Bunn DW (2009) Structural interactions of European carbon                  Kyrtsou C, Kugiumtzis D, Papana A (2019) Further insights on the
     trading and energy markets. J Energ Mark 2(4):53–69 (https://​                      relationship between SP500, VIX and volume: a new asym-
     www.​doi.​org/​10.​21314/​JEM.​2009.​034)                                           metric causality test. Eur J Financ 25(15):1402–1419. https://​
Gao A, Sun M, Han D, Shen C (2020) Multiresolution analysis of infor-                    doi.​org/​10.​1080/​13518​47X.​2019.​15994​06
     mation flows from international carbon trading market to the clean             Li M, Liu K (2019) Causality-based attribute weighting via informa-
     energy stock market. J Renew Sustain Ener 12:055901. https://d​ oi.​                tion flow and genetic algorithm for naive Bayes classifier. IEEE
     org/​10.​1063/5.​00220​46                                                           Access 7:150630–150641. https://​doi.​org/​10.​1109/​ACCESS.​
Gargallo P, Lample L, Miguel JA, Salvador M (2021) Co-movements                           2019.​29475​68
     between EU ETS and the energy markets: a VAR-DCC-GARCH                         Liang XS (2008) Information flow within stochastic dynamical sys-
     approach. Mathematics 9:1787. https://​doi.​org/​10.​3390/​math9​                    tems. Phys Rev E 78:031113. https://​doi.​org/​10.​1103/​PhysR​
     151787                                                                               evE.​78.​031113
Glosten L, Jagannathan R, Runkle D (1993) On the relation between                   Liang XS (2014) Unraveling the cause–effect relation between time
     the expected value and the volatility on the nominal excess returns                  series. Phys Rev E 90:052150. https://​doi.​org/​10.​1103/​PhysR​
     on stocks. J Financ 48:1779–1801. https://d​ oi.o​ rg/1​ 0.1​ 111/j.1​ 540-​         evE.​90.​052150
     6261.​1993.​tb051​28.x                                                         Liang XS (2015) Normalizing the causality between time series.
Granger CWJ (1969) Investigating casual relations by econometric                          Phys Rev E 92:022126. https://​doi.​org/​10.​1103/​PhysR​evE.​92.​
     models and cross-spectral methods. Econometrica 37(3):424–438.                       022126
     https://​doi.​org/​10.​2307/​19127​91                                          Liang XS (2016) Information flow and causality as rigorous notions
Gronwald M, Ketterer J, Trück S (2011) The relationship between                           ab initio. Phys Rev E 94:052201. https://​doi.​org/​10.​1103/​PhysR​
     carbon, commodity and financial markets: a copula analysis.                          evE.​94.​052201
     Econ Rec 87:105–124. https://​d oi.​o rg/​1 0.​1 111/j.​1 475-​4 932.​         Liang XS (2019) A study of the cross-scale causation and informa-
     2011.​00748.x                                                                        tion flow in a stormy model mid-latitude atmosphere. Entropy
                                                                                          21(2):149. https://​doi.​org/​10.​3390/​e2102​0149


                                                                                                                                                 13
77736                                                                             Environmental Science and Pollution Research (2022) 29:77724–77736

Liang XS (2021) Normalized multivariate time series causality analysis              evidence. Ecol Econ 164:106347. https://​doi.​org/​10.​1016/j.​ecole​
     and causal graph reconstruction. Entropy 23(6):679. https://​doi.​             con.​2019.​06.​002
     org/​10.​3390/​e2306​0679                                                  Tu Q, Betz R, Mo J, Fan Y, Liu Y (2019) Achieving grid parity of wind
Liang XS, Kleeman R (2005) Information transfer between dynamical                   power in China - present levelized cost of electricity and future
     system components. Phys Rev E 95:244101. https://​doi.​org/​10.​               evolution. Appl Energ 250:1053–1064. https://​doi.​org/​10.​1016/j.​
     1103/​PhysR​evLett.​95.​244101                                                 apene​rgy.​2019.​05.​039
Lin Z (2018) Modelling and forecasting the stock market volatility of           Tu Q, Mo J, Liu Z, Gong C, Fan Y (2021) Using green finance to coun-
     SSE composite index using GARCH models. Future Gener Comp                      teract the adverse effects of COVID-19 pandemic on renewable
     Sy 79:960–972. https://​doi.​org/​10.​1016/j.​future.​2017.​08.​033            energy investment - the case of offshore wind power in China.
Liu N, Liu C, Da B, Zhang T, Guan F (2021) Dependence and risk                      Energ Policy 158:112542. https://​doi.​org/​10.​1016/j.​enpol.​2021.​
     spillovers between green bonds and clean energy markets. J Clean               112542
     Prod 279:123595. https://​doi.​org/​10.​1016/j.​jclep​ro.​2020.​123595     Wang Y, Guo Z (2018) The dynamic spillover between carbon and
Lu X, Liu K, Liang XS, Zhang Z, Cui H (2020) The break point-                       energy markets: new evidence. Energy 149:24–33. https://d​ oi.o​ rg/​
     dependent causality between the cryptocurrency and emerging                    10.​1016/j.​energy.​2018.​01.​145
     stock markets. Econ Comput Econ Cyb 54:203–216 (https://w         ​ ww.​   Wen F, Wu N, Gong X (2020a) China’s carbon emissions trading and
     doi.​org/​10.​24818/​18423​264/​54.4.​20.​13)                                  stock returns. Energ Econ 86:104627. https://​doi.​org/​10.​1016/j.​
Mansanet-Bataller M, Pardo A, Valor E (2007) ­CO2 prices, energy,                   eneco.​2019.​104627
     and weather. Energ J 28:73–92 (https://​doi.​org/​10.​5547/​ISSN0​         Wen F, Zhao L, He S, Yang G (2020b) Asymmetric relationship
     195-​6574-​EJ-​Vol28-​No3-5)                                                   between carbon emission trading market and stock market: evi-
Mansanet-Bataller M, Soriano P (2009, May) Volatility transmission in               dences from China. Energ Econ 91:104850. https://​doi.​org/​10.​
     the CO2 and energy markets. In the 6th International Conference                1016/j.​eneco.​2020.​104850
     on the European Energy Market, Leuven. https://​www.​doi.​org/​            Xu X, Zhang Y (2022) Contemporaneous causality among one hundred
     10.​1109/​EEM.​2009.​52071​31. Accessed 10 June 2022                           Chinese cities. Empir Econ Forthcoming. https://d​ oi.o​ rg/1​ 0.1​ 007/​
Mo J, Cui L, Duan H (2021a) Quantifying the implied risk for newly-                 s00181-​021-​02190-5
     built coal plant to become stranded asset by carbon pricing. Energ         Yang M, Luo D, Li C, Yao Y, Li X, Chen X (2021) Influence of atmos-
     Econ 99:105286. https://​doi.​org/​10.​1016/j.​eneco.​2021.​105286             pheric blocking on storm track activity over the North Pacific
Mo J, Zhang W, Tu Q, Yuan J, Duan H, Fan Y, Pan J, Zhang J, Meng Z                  during boreal winter. Geophys Res Lett 48(17):e2021GL093863.
     (2021) The role of national carbon pricing in phasing out China’s              https://​doi.​org/​10.​1029/​2021G​L0938​63
     coal power. iScience 24:102655. https://​doi.​org/​10.​1016/j.​isci.​      Zhang X, Hu W, Yang F (2022) Detection of cause-effect relations
     2021b.​102655                                                                  based on information granulation and transfer entropy. Entropy
Nazifi F, Milunovich G (2010) Measuring the impact of carbon allow-                 24:212. https://​doi.​org/​10.​3390/​e2402​0212
     ance trading on energy prices. Energ Envir 21:367–383. https://​           Zhao L, Wen F, Wang X (2020) Interaction among China carbon emis-
     doi.​org/​10.​1260/​0958-​305X.​21.5.​367                                      sion trading markets: nonlinear granger causality and time-varying
Pantelidis T, Pittis N (2004) Testing for Granger causality in variance             effect. Energ Econ 91:104901. https://​doi.​org/​10.​1016/j.​eneco.​
     in the presence of causality in mean. Econ Lett 85(2):201–207.                 2020.​104901
     https://​doi.​org/​10.​1016/j.​econl​et.​2004.​04.​006                     Zhu D, Kong Y (2016) A study on the relationship between stock prices
Pereda E, Quiroga RQ, Bhattacharya J (2005) Nonlinear multivariate                  of companies of low carbon economy & new energy and the price
     analysis of neurophysiological signals. Prog Neurobiol 77(1–2):1–              of carbon allowances. Ecol Ec 32(1):52–57. https://​www.​cnki.​
     37. https://​doi.​org/​10.​1016/j.​pneur​obio.​2005.​10.​003                   com.​cn/​Artic​le/​CJFDT​otal-​STJJ2​01601​011.​htm (in Chinese with
Stips A, Macias D, Coughlan C, Garcia-Gorriz E, Liang XS (2016) On                  English abstract). Accessed 10 June 2022
     the causal structure between C    ­ O2 and global temperature. Sci Rep
     6:21691. https://​doi.​org/​10.​1038/​srep2​1691                           Publisher's note Springer Nature remains neutral with regard to
Tao L, Liang XS, Cai L, Zhao J, Zhang M (2021) Relative contribu-               jurisdictional claims in published maps and institutional affiliations.
     tions of global warming, AMO and IPO to the land precipitation
     variabilities since 1930s. Clim Dynam 56:2225–2243. https://d​ oi.​
     org/​10.​1007/​s00382-​020-​05584-w
Teixidó J, Verde SF, Nicolli F (2019) The impact of the EU emissions
     trading system on low-carbon technological change: the empirical




13
