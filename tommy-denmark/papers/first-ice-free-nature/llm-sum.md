# Detailed paper summary: the first ice-free day in the Arctic Ocean

**Paper:** Céline Heuzé and Alexandra Jahn, *The first ice-free day in the Arctic Ocean could occur before 2030*, **Nature Communications**, 15, 10101, published 3 December 2024. [Published article](https://doi.org/10.1038/s41467-024-54508-3).

**Reading basis:** This summary follows the article text in [raw.md](raw.md). It explains the paper’s definitions, methods, results, and limitations. The extraction includes figure and table captions but lacks the actual figures, Table 1 values, and supplementary tables. Their unreported details are not reconstructed. These are the study’s 2024 findings, rather than an updated assessment of observations after publication.

## 1. The central finding and what the headline means

The paper investigates **the first individual day when Arctic sea-ice area falls to one million square kilometres or less**. Earlier multi-model projections primarily examined the first ice-free month. A brief daily threshold crossing can occur before a whole month averages below that threshold, so monthly projections can miss the earliest observable event.

Using **366 scenario simulations from 11 selected CMIP6 climate models**, the authors find a very wide range of transition times: from **three years after a model reaches a state comparable to the observed 2023 sea-ice minimum**, to no ice-free day before simulations end in 2100. Nine simulations make the transition in **3–6 years**. These fast cases motivate the possibility in the title that an ice-free day could occur before 2030.

The authors explicitly present these nine cases as **rare, high-impact storylines**. They investigate the conditions that could produce a rapid transition; they do not claim that this transition is the expected outcome. In those simulations, several years of ice weakening culminate in unusually warm winter and spring conditions, sometimes followed by summer storms.

The result concerns a first threshold crossing. It does not establish that the Arctic thereafter becomes ice-free every summer, remains ice-free for a whole month, or loses winter sea ice. (Abstract; Introduction; Results; Discussion.)

## 2. The definitions that make the results understandable

### 2.1. “Ice-free” still permits some ice

The conventional threshold used here is **sea-ice area of at most one million km²**. Residual ice can remain. The term describes a nearly ice-free Arctic under this scientific convention, rather than literally zero ice.

The observed **2023 daily minimum sea-ice area was 3.39 million km²**, calculated from the NOAA/NSIDC Climate Data Record. Reaching the ice-free threshold from that minimum requires an additional reduction of at least **2.39 million km²**. This subtraction describes the scale of the transition; it is not a separately measured trend or a prediction of a steady annual loss.

### 2.2. Concentration, area, extent, and mass answer different questions

| Quantity | Meaning | Role in this paper |
|---|---|---|
| Sea-ice concentration, SIC | Fraction of a grid cell covered by ice | Basic input used to calculate area and extent |
| Sea-ice area, SIA | Total actual ice-covered area, accounting for concentration | Defines the daily and monthly ice-free events |
| Sea-ice extent, SIE | Total area of cells whose ice concentration exceeds 15% | Defines Rapid Ice Loss Events |
| Sea-ice mass | Total amount of ice, reflecting thickness as well as coverage | Reveals weakening across the seasonal cycle |

Writing concentration as a fraction \(c_n\) and grid-cell area as \(A_n\), the paper’s area and extent equations can be expressed as:

\[
\mathrm{SIA}(t)=\sum_n c_n(t)A_n,
\]

\[
\mathrm{SIE}(t)=\sum_{n:\,c_n(t)>0.15} A_n.
\]

For example, a **100 km²** cell that is **40% ice-covered** contributes **40 km² to area** and **100 km² to extent**. A cell with 10% ice still contributes to area, but not to extent under this definition. This example is explanatory, not a result from the study.

The authors calculate area, extent, and mass **north of 30° N on each model’s native grid**. Their detailed atmospheric diagnostics focus on the **Central Arctic north of 80° N** and surrounding shelf seas. The integration domain and the atmospheric diagnostic domain therefore differ. (Methods: Data and definitions.)

### 2.3. A first day, a first month, and recurring summer conditions differ

A daily ice-free event occurs when one day’s SIA reaches the threshold. A monthly ice-free event occurs when a monthly average reaches it. A month can contain ice-free days while its average remains above the threshold.

The first daily crossing can therefore precede the first monthly crossing by years or decades. Neither event guarantees recurrence the next year. The paper’s threshold is also based on **area**; a threshold applied to **extent** would define a different event.

## 3. The crucial timing method: a “2023-equivalent” model year

### 3.1. Why model calendar dates are not used directly

Climate models differ in how much Arctic ice they simulate at a particular calendar date. Comparing their ice-free dates without addressing this could partly compare starting-state biases. The authors instead align each trajectory to an ice-area benchmark derived from observations.

For a simulation that eventually reaches daily ice-free conditions, its **2023-equivalent year** is the **last year before that event when the annual daily minimum SIA is at least 3.39 million km²**. The reported transition time is measured from that year to the first ice-free year.

Using explanatory notation, if \(a(y)\) is the daily SIA minimum in year \(y\):

\[
y_{\mathrm{ice}}=\min\{y:a(y)\leq 1.00\times10^6\ \mathrm{km}^2\},
\]

\[
y_0=\max\{y<y_{\mathrm{ice}}:a(y)\geq 3.39\times10^6\ \mathrm{km}^2\},
\]

\[
\Delta y=y_{\mathrm{ice}}-y_0.
\]

These equations restate the textual method; they are not extra equations printed in the article. They apply to trajectories with the necessary threshold crossings and available data.

### 3.2. Why “three years” is not automatically a forecast for 2026

The reference year is a model-state match, and need not be calendar year 2023. The paper explains that a real-world countdown anchored to 2023 would apply if later annual minima all remained below the 2023 minimum. If a later observed year returned above that value, the last qualifying reference year would move forward.

For illustration, a simulated three-year transition starting from a qualifying 2027 state would produce an event in 2030. The example clarifies the alignment method; it is not a model result or a present-day forecast.

This approach compares **time from a similar ice-area state**, but it does not initialize models from the observed 2023 atmosphere, ocean, or full ice distribution. Two trajectories with the same minimum area can differ in ice thickness, ocean heat, weather, and spatial ice patterns. Alignment reduces one source of disagreement without removing all state differences.

The reference year is also identified **retrospectively**: finding the last qualifying year requires knowing what happens later in the simulation. It is an analysis convention rather than a directly observable real-time countdown. (Introduction; Methods: Detection of the 2023 equivalent year; Discussion.)

## 4. Models, observations, scenarios, and selection

### 4.1. What the simulations provide

The study uses the **Coupled Model Intercomparison Project phase 6, CMIP6**. In semi-lay terms, these are climate models that simulate interacting atmosphere, ocean, land, and sea ice under specified external forcing. This paper analyzes their output; it does not train a neural network or develop a new ice-dynamics model.

An **ensemble member** is one possible evolution from a model. Members under the same forcing can experience different sequences of weather and ocean fluctuations. This lets the authors study how internal climate variability changes the timing of an event even when the model and emissions pathway are held fixed.

Data availability was assessed in **late May 2024**, using ESGF portals and previously downloaded files on the DKRZ Levante system. Inputs include daily sea-ice concentration on ocean or atmosphere grids, the corresponding grid-cell areas, and, for the nine detailed storylines, daily surface-air temperature, daily sea-level pressure, and monthly sea-ice mass. Mass is monthly because daily mass was unavailable for some models.

### 4.2. The five forcing pathways

| Scenario | Number of analyzed simulations | Position among the studied pathways |
|---|---:|---|
| SSP1-1.9 | 34 | Lowest forcing |
| SSP1-2.6 | 86 | Second-lowest forcing |
| SSP2-4.5 | 89 | Intermediate forcing |
| SSP3-7.0 | 86 | Higher forcing |
| SSP5-8.5 | 71 | Highest forcing |
| **Total** | **366** | Across 11 selected models |

These are alternative forcing trajectories used to explore possible futures. They are not five equally probable forecasts, and the study does not assign real-world probabilities to the emissions pathways. (Methods: Data and definitions; Model selection.)

### 4.3. Historical screening reduces 29 candidate models to 11

The authors retain models that satisfy two observationally based criteria:

1. **Historical September ice amount:** The **1995–2014 mean September SIA** must lie within the satellite-derived range, with an additional allowance of approximately **±0.38 million km²** for internal variability. The observational range uses Bootstrap and NASA Team ice-area estimates from the NOAA/NSIDC CDR dataset. Their mean estimates differ substantially, by approximately **1.16 million km²**, illustrating retrieval uncertainty.
2. **Timing of the annual minimum:** The minimum-day timing over **1980–2014** must fall within the observed range of **day 238 to day 272**, expanded by approximately **±5 days** for variability.

A model is excluded under a criterion only if all available members fail it. Both criteria must be satisfied at model level. The supplied wording does not establish that the same individual member must satisfy both criteria. These screens reject unsuitable historical ice amounts or seasonal timing; they do not certify every simulated atmospheric or oceanic mechanism as accurate.

Models using 360-day calendars, specifically **UKESM1-0-LL** and **HadGEM3-GC31-LL**, are excluded because daily dates cannot be compared directly with 365-day calendars. Leap days are removed from standard-calendar data. Some members are also discarded when the equivalent year falls in an unavailable historical run. (Methods: Model selection; Data and definitions; Detection of the 2023 equivalent year.)

### 4.4. Unequal ensemble sizes affect interpretation

One model, **MPI-ESM1-2-LR**, supplies **205 of the 366 simulations**, approximately 56% of the pooled sample. A distribution formed by counting every simulation therefore gives that model substantially more influence.

For Figure 1, the authors instead use the **earliest and latest member for each model and scenario**, so large ensembles do not dominate the plotted counts. This addresses one weighting problem, while creating a specific interpretation: those panels describe model/scenario extremes, rather than the distribution of every trajectory or a calibrated probability distribution for the real climate.

Large ensembles also have more opportunities to generate rare extreme members. Selecting earliest/latest members cannot completely remove that sampling difference. This is a methodological implication of the sampling design, not a sensitivity result established by the paper.

## 5. Timing results across the full analyzed ensemble

| Result | Reported value | Interpretation |
|---|---:|---|
| Fastest transition | 3 years | From a model-specific 2023-equivalent state |
| Quick-transition group | 9 simulations in 3–6 years | Selected for detailed storyline analysis |
| Transitions within a decade | 34 simulations from 4 models | Occur under SSP1-2.6 through SSP5-8.5 |
| Earliest SSP1-1.9 transition | 18 years | No sub-decade case in this sampled lowest-forcing ensemble |
| Largest grouping of earliest cases discussed by the authors | 7–20 years | Based on earliest members per model/scenario |
| Pooled median transition time | 24 years | Across simulations and scenarios as reported in the Discussion |
| Pooled mean transition time | 29 years | Subject to unequal ensemble sizes and reporting details |
| Slow outcomes | More than 50 years, or no event by 2100 | Possible in the two lowest-forcing pathways |

The **7–20-year** statement and the **24-year median** summarize different selections of trajectories. They should not be read as contradictory estimates of the same distribution. The earliest-member grouping emphasizes early possibilities, whereas the pooled statistic includes slower trajectories.

The extracted text does not fully specify how simulations with no event before 2100 enter the reported mean and median. Such trajectories are **right-censored**: the simulation ends before the event is observed. “No event by 2100” also does not prove that an event can never occur after 2100.

The most rapid three transitions, taking **3–4 years**, occur under **SSP1-2.6**. Rapid events occur across all studied scenarios except SSP1-1.9. This supports the authors’ argument that **internal variability strongly controls the earliest events**. It does not mean that lower emissions cause faster ice loss or that anthropogenic warming is unimportant. (Results: Timing of the first ice-free day; Discussion.)

## 6. How a first ice-free day relates to a first ice-free month

Across the analyzed simulations, the first ice-free episode lasts **1–71 days**, with a mean of **25 days** and standard deviation of **17 days**. Duration varies enough that the first ice-free month can follow in the same year, decades later, or fail to occur by the end of the simulation.

The member with the earliest daily event is also the member with the earliest monthly event in only **just over half** of the assessed model/scenario cases with multiple members. A brief early dip in one trajectory can be followed by recovery, while another trajectory develops a longer low-ice season sooner.

For the **nine quick-transition storylines**, the first episodes last **11–53 days**, averaging **27 days**. The first crossing dates range from **11 August to 9 September**, with a reported average date of approximately **26 August**. Two September-starting episodes last only **12 and 11 days**. Earlier onset generally allows a longer episode before autumn recovery.

The extracted day numbers and calendar-date labels have small conversion inconsistencies, so precise date reproduction should use the actual model calendars and source table. The ranges above follow the dates reported in the prose. (Results: Timing of the first ice-free day; Multiyear sea ice area transition.)

## 7. Why the authors focus on nine storylines

A storyline asks: **If this unusual outcome occurred, what sequence of physical conditions could produce it?** Here the authors deliberately select the fastest transitions to understand a plausible severe outcome. This selection provides physical narratives, without establishing their likelihood for the real Arctic.

The nine cases comprise **one 3-year**, **two 4-year**, **two 5-year**, and **four 6-year** transitions. They come from **ACCESS-CM2, CanESM5, EC-Earth3, and MPI-ESM1-2-LR**, under **SSP1-2.6, SSP2-4.5, and SSP3-7.0**.

| Model | Quick-transition cases / analyzed simulations | Approximate share reported by the authors |
|---|---:|---:|
| ACCESS-CM2 | 2 / 39 | 5% |
| CanESM5 | 2 / 72 | 3% |
| EC-Earth3 | 3 / 10 | 30% |
| MPI-ESM1-2-LR | 2 / 205 | 1% |

The fractions are descriptive counts across the available scenario simulations. EC-Earth3’s 30% is based on only ten simulations. The wide differences cannot be interpreted as precise real-world risk estimates.

Other members of the same models under the same forcing take much longer to cross the threshold, with differences reaching approximately **58 years**. This is strong evidence that the fastest outcomes depend on particular internal climate evolutions, rather than these four models inevitably losing ice within a few years.

Likewise, **9 out of 366** is approximately **2.5% of the pooled simulations**, but is not a defensible estimate of the probability of an ice-free Arctic before 2030. Models and scenarios are unevenly sampled, trajectories are aligned to different reference years, and the ensemble is not a random sample from real-world futures. (Results: Storylines.)

## 8. The rapid transitions occur during Rapid Ice Loss Events

### 8.1. The event definition

A **Rapid Ice Loss Event, RILE**, is a sustained rapid decline defined using September **extent**, rather than the **area** used for the ice-free threshold. Following earlier studies, the paper requires a period of at least **four years** during which the trend in the **five-year running mean September SIE** is below:

\[
-0.3\times10^6\ \mathrm{km}^2\,\mathrm{yr}^{-1}.
\]

This describes a multi-year loss episode. It is not simply a large one-day decline or a single storm, and it should not be applied directly to an unsmoothed daily-area record. (Methods: Data and definitions.)

### 8.2. What is shared by the fast cases

All nine quick-transition simulations reach the first ice-free day **during a September RILE**. They also show an August RILE, or a near-RILE when the threshold is slightly relaxed to **−0.299 million km² per year**.

The start of the rapid-loss period need not coincide with the 2023-equivalent year. September RILEs begin, on average, approximately **1.7 years earlier**, with a median of one year earlier. August events have a mean and median start approximately one year earlier, with a range from three years before to two years after. The authors relate this partly to the smoothed RILE definition.

This means the state matching can occur after a rapid-loss sequence has already begun. An observer should not assume that every trajectory matching the 2023 minimum has an otherwise identical history or vulnerability.

### 8.3. Relation to the observed record

The authors compare the simulated drops with the large observed reductions associated with **2007 and 2012**. They argue that if those record drops had occurred within a shorter interval, their sequence could have met the RILE definition. This is a plausibility comparison, not evidence that the observed Arctic had already undergone a qualifying RILE.

They report **2023 September mean extent of 4.24 million km²**, and cite prior work suggesting that simulated RILEs become most likely to begin when September mean extent is slightly below four million km². These values concern **extent**, and must not be confused with the **3.39 million km² daily minimum area** used for alignment.

All nine fast cases also follow approximately **10–15 years of little or no trend** in daily and monthly ice area. The implication is that an apparent pause in area decline can precede a fast loss episode. A stable interval alone is not a validated warning rule. (Results: Multiyear sea ice area transition; Discussion.)

## 9. The hidden preparation: thinner ice across the whole year

The transition is not produced solely by an unusually bad final summer. Most fast cases lose ice area during autumn, winter, and spring as well. **EC-Earth3** shows comparatively little change in winter area, but its winter ice mass still decreases. All nine cases show a year-round mass decline.

The distinction matters physically: the ocean can look similarly ice-covered in winter while the ice has become thinner and easier to remove in summer. Reduced winter thickness appears within **one or two years** of the reference state in all four models. Warm autumn conditions delay cooling and freeze-up, leaving less opportunity to rebuild ice before the next melt season.

A conceptual physical explanation is that thinner ice requires less energy to melt. This helps explain why area alone may conceal preparation for rapid loss. The paper diagnoses that preparation with model mass data, rather than establishing a new quantitative mass-to-event prediction equation. (Figure 3; Results: Multiyear sea ice area transition.)

## 10. The final-year sequence: warm winter, persistent spring warmth, summer stress

### 10.1. Autumn and winter weaken the ice before melting season

Years leading up to the event commonly have delayed autumn cooling and warm spells continuing into December. The final winter is warm in all nine cases. Its warmth is anomalous over the Central Arctic relative to earlier years in eight cases; the remaining case has its strong anomaly over the **Barents Sea**.

The analysis shows that the **maximum surface-air temperature north of 80° N** remains above approximately **−20°C**, a temperature cited as characteristic of the spring transition, throughout the final winter. That is still below freezing. Winter warming can reduce growth without requiring winter air temperatures to exceed 0°C.

These temperature series are **spatial maxima**, smoothed with a five-day running mean. They do not mean that the entire Central Arctic has the plotted temperature. High-pressure episodes are common, while some low-pressure episodes transport warm air into the region. (Figure 4; Results: Final-year triggers.)

### 10.2. Spring warming arrives early or becomes unusually persistent

Warmth and high pressure persist into spring in all nine storylines. The authors describe two routes: spring warming arrives up to approximately **one month early**, or the season has fewer cold spells and more persistent warmth even without extraordinary peaks.

Several-day warm episodes with maximum temperatures above **0°C** are common. **Atmospheric blocking** means a circulation pattern persists, holding conditions in place and allowing warm air to remain over the Central Arctic. Its significance here is prolonged thermal stress rather than a single temperature spike.

This distinction suggests why accumulated warmth and interruptions by cold spells can matter alongside peak temperature. The study uses seasonal **heating degree days relative to 0°C** and pressure-percentile anomalies to diagnose departures from earlier years, but the extraction does not provide a complete mathematical HDD implementation. An exact reproduction should use the released code rather than assume a building-heating convention from the variable’s name.

### 10.3. Summer storms frequently supply additional stress

The final summer is warm in all nine cases, with spatial maximum temperatures that can exceed **10°C from late May**. **Six of nine** cases have storms crossing the Arctic, often in the final month or days before the first ice-free crossing.

In the fastest case, a storm travels from the **Kara Sea region to the Canada Basin in approximately five days**, close to the first ice-free event. Other cases have several weaker systems stressing different locations at once.

As physical background, storms can stress, rearrange, and break up weakened ice, while their thermal effects depend on the conditions. The study’s storm timing supports a role for storms in several storylines, but storms are **not universal** across the nine cases and their contribution is not isolated through a controlled experiment.

Six cases also have anomalous final-summer warmth over the Central Arctic. The other three instead show significant warmth in surrounding seas: the **Barents Sea**, the **Laptev/East Siberian/Chukchi seas**, or the **Kara Sea**. A diagnostic limited to the Central Arctic could therefore miss relevant regional warmth. (Figure 4; Supplementary figures described in the text.)

### 10.4. A candidate late-summer warning indicator

In all nine quick-transition simulations, SIA reaches **3.39 million km² by 31 July at the latest** in the event year. The observed 2023 record reached its daily minimum on **11 September**, 42 days later than 31 July.

The authors suggest that reaching the 2023 minimum area already in July could warn of an ice-free day later that summer. This identifies a common precursor in the selected fast cases. They do not establish its sensitivity, false-alarm rate, or forecasting skill across the full ensemble or observations. It should therefore be treated as a candidate indicator requiring validation. (Results: Multiyear sea ice area transition.)

## 11. Why emissions still matter when internal variability controls fast cases

The study separates three sources of uncertainty:

| Source | What changes | Evidence in this paper |
|---|---|---|
| Internal variability | Weather and ocean evolution under the same model and forcing | Event times differ by decades between members |
| Scenario uncertainty | Future anthropogenic forcing | Lowest-forcing pathways permit longer delays or no event by 2100 |
| Model uncertainty | Simulated physical responses and biases | Different timing remains after historical screening and area alignment |

The largest ensemble shows within-model timing differences of approximately **26 years under SSP5-8.5** and **more than 58 years under SSP1-2.6**. Internal variability therefore limits confidence in an exact event year even when an emissions pathway is specified.

The earliest events do not increase monotonically with scenario strength. Nevertheless, **SSP1-1.9** has no very early event in this sample, and **SSP1-1.9 and SSP1-2.6** contain cases with very long delays or no crossing by 2100. Reducing warming changes the chance of avoiding or postponing the threshold, even though it cannot determine the sequence of natural fluctuations.

All nine fast storylines reach their first ice-free day at a simulated global warming level of **at least 1.5°C above pre-industrial**. The warming value is calculated using the **five-year mean centred on the event year**, relative to the area-weighted mean of the first 50 years of a pre-industrial control run. It includes two years after the event, so it is a retrospective climate diagnostic.

This supports the authors’ argument that limiting warming below 1.5°C could help avoid ice-free conditions. It does not establish a sharp universal physical threshold or prove that a single observed year above 1.5°C makes an ice-free day inevitable. The nine selected outcomes also cannot prove that every possible ice-free day requires that exact warming level. (Methods: Data and definitions; Discussion.)

## 12. Strengths and practical limits of the evidence

The main strengths are the use of **daily output**, explicit historical screening, multiple models and scenarios, state alignment, and a physical examination of the earliest outcomes across the full seasonal cycle. Released data and code make further checking possible. The distinction between ice area and mass is especially useful because it reveals winter weakening that area alone can miss.

Several limits should shape how the paper is used:

1. **It provides conditional climate projections.** The models are not initialized to reproduce the actual weather and ocean evolution after 2023. A model-state transition time is not a direct calendar forecast.
2. **Ensemble counts are not calibrated probabilities.** Unequal model contributions, unequal scenario sampling, and extreme-member selection affect the timing distributions. The pooled mean and median should not be translated into precise real-world likelihoods.
3. **Selected storylines diagnose plausibility, not necessity or sufficiency.** Shared warm conditions in fast cases suggest mechanisms, but the analysis does not establish whether similar conditions also occur frequently without an ice-free event.
4. **Area matching does not match the full ice–ocean state.** Thickness, geography, ocean heat, and atmospheric circulation can remain different at the reference year.
5. **Atmospheric drivers receive the detailed analysis.** Oceanic effects are acknowledged, but their separate contribution to the nine rapid transitions is not quantified here. The article does not establish that ocean conditions are unimportant.
6. **First crossings are threshold-sensitive events.** Observation-product uncertainty, residual model biases, and the chosen metric can affect their detected timing. Historical screening reduces some biases without eliminating them.
7. **Some replication details are absent from the extraction.** Table 1, supplementary tables, exact pressure thresholds, and the full anomaly/HDD implementation require the published material or code. Treatment of no-event simulations in pooled timing statistics also needs checking.

The statement that all quick cases occur during RILEs is descriptive of this selected group. Without a comparison group, it does not establish that every RILE produces an ice-free day or that every first ice-free day must occur during a RILE.

## 13. Relevance to Arctic monitoring and forecasting work

For an Arctic monitoring project, the paper supports tracking the **seasonal history** leading into a low-ice summer: autumn freeze-up, winter growth or thickness, spring warmth and persistence, regional circulation, summer storm activity, and the date when area reaches particular low values.

Its strongest practical lesson is that similar ice coverage can conceal different vulnerability when thickness and thermal history differ. A forecast based only on current concentration or area may miss that preparation. This is a research implication from the paper, rather than a forecasting model evaluated by its authors.

For a regional sea-ice system such as IcyAlert, the basin-scale daily ice-free threshold would need to be connected to the local outcome of interest. Local concentration, drift, thickness, and hazard timing have different definitions. The paper does not validate a particular assimilation algorithm or a regional alert system.

If testing its candidate warning signals, a useful next analysis would compare fast events with **slow events and non-events**, group validation by independent years or trajectories, and measure lead time and false alarms. That would test whether the physical storylines can support useful predictions. These are proposed extensions, not experiments already conducted in the article.

## 14. Figure guide and reproducibility resources

| Figure or table | What it contributes |
|---|---|
| Figure 1 | Earliest/latest transition times by model and scenario, for daily and monthly thresholds |
| Table 1 | Characteristics of the nine fast cases: transition time, warming, onset date, duration |
| Figure 2 | Daily minima, September mean area, and September RILEs in the fast cases |
| Figure 3 | Seasonal changes in ice area and mass during the transition |
| Figure 4 | Final-year maximum temperature and pressure extremes north of 80° N |
| Supplementary Figure S1 | Delay between first daily and first monthly ice-free conditions |
| Supplementary Figure S2 | August RILEs or near-RILEs |
| Supplementary Figures S3–S6 | Temperature evolution, circulation patterns, and storm examples |
| Supplementary Tables S1–S2 | Detailed daily/monthly timing results |
| Supplementary Tables S3–S4 | Atmospheric anomalies in the Central Arctic and surrounding seas |
| Supplementary Table S5 | Selected models and ensemble availability |

The paper makes its [analysis code available on Zenodo](https://doi.org/10.5281/zenodo.14006059) and its [derived daily area and extent data available through the Arctic Data Center](https://doi.org/10.18739/A2CC0TV9V). The observational input is the [NOAA/NSIDC Sea Ice Concentration Climate Data Record, version 4](https://nsidc.org/data/g02202/versions/4). The DOI in the extraction’s Data Availability paragraph has a reference number joined to its end; the correctly separated DOI appears in the reference list and is used here.

**The result to retain:** A first daily ice-free Arctic is a plausible rare outcome within a few years of a 2023-like minimum-area state. The fastest simulations build vulnerability through year-round ice-mass loss, warm winters, and persistent spring warmth, with summer storms contributing in several cases. The timing remains highly uncertain, and limiting warming can still delay or avoid events in the analyzed projections.
