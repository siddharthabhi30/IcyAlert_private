This paper develops and applies a **time-varying, multi-timescale Liang–Kleeman (LK) information-flow analysis** to study whether changes in **Total Solar Irradiance (TSI)** causally influence **ocean heat content anomaly (OHCA)**. Its main methodological contribution is not a new basic LK estimator; rather, it repeatedly applies the standard LK estimator inside **sliding windows of different lengths**, producing causality as a function of both **time and timescale**. 

## 1. Main research question

The paper asks:

> Does variability in incoming solar radiation causally affect the amount of heat stored in the upper ocean, and does that causal relationship change depending on **location, historical period, and timescale**?

The authors argue that simple correlation is insufficient for this problem. Solar activity and climate variables can have periodic behavior, and a lead/lag correlation cannot reliably establish direction of causality. They therefore use Liang–Kleeman information flow, which is intended to quantify a directional causal influence between dynamical variables. 

Their central idea is that a climate causal relationship should not necessarily be represented by one number calculated over an entire 60-year record.

Instead, they conceptualize it as something closer to

[
T_{\mathrm{TSI}\rightarrow\mathrm{OHCA}}(t,\tau),
]

where:

* (t) = historical time;
* (\tau) = timescale/window length.

That is the core methodological point of the paper.

---

# 2. Why they study TSI → ocean heat content

Solar irradiation is the fundamental external energy source for Earth's climate, but solar activity varies on many timescales, including approximately 11-year and 22-year cycles. Previous work had found correlations between solar activity and sea-surface/ocean-temperature variability, but correlation alone does not establish whether solar forcing is genuinely driving the ocean response. 

The authors select **Ocean Heat Content Anomaly** because the ocean stores and redistributes a very large portion of energy in the climate system. OHC is important for Earth's heat balance on annual, interannual, decadal, and longer timescales. 

So their physical causal hypothesis is approximately

[
\boxed{\text{TSI variation}
\rightarrow
\text{energy entering climate system}
\rightarrow
\text{ocean heat-content response}}
]

but atmospheric and oceanic circulation may substantially modify where and when that relationship appears.

---

# 3. Data used

The principal ocean dataset is the NODC ocean heat-content anomaly product.

The OHCA data:

* cover the period beginning in **1955**;
* have **seasonal temporal resolution**;
* have a **1° × 1° horizontal resolution**;
* provide both gridded global OHCA fields and aggregated ocean-basin time series;
* the main spatial analyses concern the upper **700 m** of the ocean. 

For TSI, the authors use a reconstructed historical total solar irradiance record. The original TSI record is monthly, so they average it into seasonal values to match the OHCA temporal resolution. 

For their main common period, they analyze **1955–2017**, corresponding to:

[
63 \text{ years} \times 4
=========================

252\text{ seasonal observations}.
]

The paper explicitly reports 63 years and 252 points for its global TSI/OHCA analysis. 

---

# 4. Method 1 — ordinary Liang–Kleeman information flow

For two time series (X_1) and (X_2), they calculate directional information flow

[
T_{2\rightarrow1}.
]

The estimator is constructed using:

* covariance terms (C_{ij}) between the variables;
* covariance terms between a variable and the estimated time derivative of another variable;
* an Euler forward difference to approximate the time derivative. 

Interpretationally,

[
T_{2\rightarrow1}=0
]

means that the method detects no causal information flow from (X_2) to (X_1).

The authors state that, for their causal-inference purpose, they are mainly interested in the **absolute value** of information flow. Reversing the indices gives the opposite direction,

[
T_{1\rightarrow2}.
]

They also note that the same framework can be applied from a single time series to an entire spatiotemporal field. 

That latter point is important because their analysis is not restricted to

[
\text{TSI}\rightarrow\text{global mean OHCA}.
]

They also calculate something conceptually like

[
T_{\mathrm{TSI}\rightarrow\mathrm{OHCA}(x,y)}
]

for individual ocean grid points.

---

# 5. Why ordinary LK is insufficient for their question

If one calculates LK once over the entire record,

[
1955\rightarrow2017,
]

the result is a single summary causal estimate.

But climate dynamics evolve.

The paper explicitly argues that because dynamical states evolve,

> information flow should vary in time.

The usual solution is therefore a **sliding-window LK calculation**. 

However, there is another problem:

[
\boxed{\text{LK estimate depends on data length}}
]

and therefore depends on the selected sliding-window size.

So choosing one window, such as 10 years or 20 years, is somewhat empirical. Their solution is to evaluate **many window lengths**.

This is what creates their **multi-scale LK method**. 

---

# 6. Method 2 — ordinary sliding-window dynamic LK

Suppose there is a time series

[
X_1,\ldots,X_N.
]

Choose window size (W).

For the first window:

[
X_1,\ldots,X_W
]

calculate

[
T^{(1)}_{2\rightarrow1}.
]

Move the window:

[
X_2,\ldots,X_{W+1}
]

and calculate

[
T^{(2)}_{2\rightarrow1}.
]

Then:

[
X_3,\ldots,X_{W+2},
]

and so forth.

So instead of getting one number,

[
T_{2\rightarrow1},
]

you get a curve:

[
\boxed{
T_{2\rightarrow1}(t)
}
]

showing how the inferred causal influence changes through time.

The authors initially illustrate this using a **22-year window**, corresponding to **88 seasonal observations**. 

This is exactly the same fundamental idea you were referring to previously when discussing "dynamic LK."

---

# 7. Method 3 — their main methodological extension: multi-scale LK

The important methodological contribution is to **repeat that sliding-window analysis across many different window sizes**.

The procedure given in the Methods section is:

1. Start with a relatively small window.
2. Slide it over the time series.
3. Calculate LK information flow at every possible location.
4. Estimate statistical confidence.
5. Increase the window size.
6. Repeat the complete sliding-window procedure.
7. Continue across progressively larger windows. 

Therefore the result is no longer just

[
T(t).
]

It becomes effectively

[
\boxed{
T(t,W)
}
]

where (W) is the window length.

The authors interpret different values of (W) as different **timescales**.

---

# 8. Minimum window length

The authors recommend that a window contain at least approximately

[
\boxed{30\text{ sampling points}}.
]

Their reason is statistical uncertainty: the LK expression contains covariance/correlation-related quantities, and very short samples produce unstable estimates. 

Because their observations are seasonal,

[
30/4=7.5\text{ years}.
]

So in this particular dataset, their suggested lower limit corresponds to roughly 7.5 years.

This is an important detail for your own LK work: the method is not saying that arbitrary 5-point or 10-point windows will produce meaningful instantaneous causality.

There is a variance–temporal-resolution tradeoff:

[
\text{short window}
\Rightarrow
\text{better temporal localization}
+
\text{higher statistical uncertainty}
]

while

[
\text{long window}
\Rightarrow
\text{more stable estimate}
+
\text{poorer temporal localization}.
]

The multi-scale analysis is basically a way of explicitly displaying that dependence instead of hiding it behind one chosen window.

---

# 9. Why the multi-scale output becomes triangular

There is a simple geometric consequence.

With a short window, you can place many windows along the record.

For example,

```text
|------|
  |------|
    |------|
      |------|
```

With a longer window:

```text
|--------------|
   |--------------|
```

And eventually, for a window approaching the entire record:

```text
|--------------------------------|
```

Therefore:

[
W\uparrow
\quad\Rightarrow\quad
\text{number of possible windows}\downarrow.
]

The authors consequently visualize multi-scale LK using a **triangular contour diagram**. 

That triangle is not some special LK mathematical transformation.

It simply arises from:

[
\boxed{\text{sliding windows × progressively increasing window length}}.
]

---

# 10. Statistical significance testing

The authors do not interpret every nonzero information-flow estimate as meaningful.

For each pair of time series, they estimate confidence intervals using a **one-tailed test with Monte Carlo/bootstrap procedures**. 

Different figures use different significance thresholds.

For example:

* their initial global sliding-window analysis discusses a **68% confidence interval**;
* the multi-scale results frequently mark causal relationships significant at **90% confidence**.  

So their actual analysis is not merely

[
T(t,W).
]

It is more properly:

[
T(t,W)
\quad+\quad
\text{significance}(t,W).
]

Their plots mark the parts of the time/timescale surface that survive the significance test.

---

# 11. First experiment — one global static LK estimate

They first analyze TSI and globally averaged upper-ocean OHCA over 1955–2017.

The full-record information flow is reported as

[
T_{\mathrm{TSI}\rightarrow\mathrm{OHCA}}=0.0051.
]

The bootstrap confidence is only **52%**.

Therefore, using the entire 63-year record as one homogeneous interval, the causal relationship is **not statistically significant**. 

This is actually a crucial result.

If they stopped at static LK, the conclusion would basically be:

> There is little evidence that TSI causes global OHCA.

But their subsequent dynamic/multiscale analysis gives a more nuanced answer.

---

# 12. Second experiment — 22-year rolling LK

They then calculate information flow using a sliding window of

[
22\text{ years}=88\text{ seasonal points}.
]

In most 22-year intervals, the information flow is still not statistically significant, even using the relatively weak 68% confidence threshold. 

So merely making LK dynamic does not automatically produce a strong relationship.

This motivates looking simultaneously across different timescales.

---

# 13. Third experiment — spatially resolved LK

They next calculate information flow from TSI to gridded upper-ocean OHCA.

This asks:

[
\text{Does TSI influence OHCA differently depending on location?}
]

The answer is yes.

Significant regions include areas of:

* the **South Indian Ocean**;
* **western tropical Pacific**;
* ocean regions east of **Australia**. 

The authors observe that several of these regions lie near important pathways of the global ocean circulation/conveyor system.

Their physical interpretation is that incoming solar energy is not simply deposited uniformly and retained locally. Atmospheric and oceanic circulation redistribute it.

Therefore:

[
\boxed{
T_{\mathrm{TSI}\rightarrow\mathrm{OHCA}}
========================================

f(\text{location})
}
]

as well as time and timescale.

---

# 14. Comparison with wavelet coherence

This is an important part of the paper because it distinguishes **correlation** from **causality**.

The authors calculate wavelet coherence between TSI and OHCA.

Wavelet coherence detects significant correlation primarily at periods shorter than approximately **3 years**. 

But their multi-scale LK analysis finds significant causal influence at much longer periods:

[
\boxed{\text{decadal to approximately 25 years}}.
]

The information flow in that range reaches the **90% confidence level**. 

Beyond approximately 25 years, they do not find significant global TSI → OHCA information flow at the 90% confidence level.

This is one of the paper's major claims:

[
\text{wavelet coherence}
\neq
\text{LK information flow}.
]

Wavelet coherence tells them:

[
\text{TSI and OHCA co-vary at certain frequencies}.
]

LK is being used to ask:

[
\text{Does TSI directionally contribute information to OHCA evolution?}
]

The two analyses therefore highlight very different temporal scales.

---

# 15. Influence of major ENSO events

Another notable result occurs around the super El Niño events:

* **1982–83**;
* **1997–98**.

Around these events, TSI → OHCA information flow becomes small and statistically insignificant. 

The authors interpret this as an issue of competing climate variability.

The relatively weak decadal solar signal can be overwhelmed by very strong interannual ENSO variability.

Conceptually:

[
\text{observed OHCA}
====================

\text{solar influence}
+
\text{ENSO}
+
\text{ocean circulation}
+
\text{anthropogenic forcing}
+\cdots
]

When ENSO becomes very strong,

[
\operatorname{Var}(\text{ENSO contribution})
\gg
\operatorname{Var}(\text{solar contribution}),
]

and the TSI causal signal becomes difficult to detect.

---

# 16. Basin-specific analysis

The authors then analyze individual ocean basins because global averaging can hide regional relationships.

## Atlantic

Wavelet coherence indicates mainly interannual correlation.

The LK analysis, however, finds statistically significant causality at approximately

[
\boxed{10-25\text{-year timescales}}.
]

Furthermore, the North and South Atlantic behave differently. 

### North Atlantic

Significant information flow appears mainly on timescales below approximately 20 years.

### South Atlantic

Significant information flow can extend to roughly **40-year timescales** around the year 2000. 

So even within one ocean basin,

[
T(t,W)
]

differs depending on latitude/hemisphere.

---

# 17. Indian Ocean

The Indian Ocean likewise shows strong temporal and timescale dependence.

Because most of the Indian Ocean lies in the Southern Hemisphere, the overall Indian Ocean information-flow pattern resembles the South Indian Ocean pattern.

For the North Indian Ocean, the authors find significant TSI → OHCA information flow at window/timescales greater than approximately 40 years for some windows centered roughly between 1970 and 1990. 

Again, their conclusion is not:

> TSI causes OHCA everywhere.

It is:

[
\boxed{
\text{TSI}\rightarrow\text{OHCA causality varies by}
;;
\text{space × time × timescale}.
}
]

---

# 18. Method 4 — EOF/REOF decomposition

The authors then move beyond global and basin averages.

They apply **Rotated Empirical Orthogonal Function (REOF)** analysis to the global OHCA field.

EOF/PCA takes a high-dimensional spatiotemporal field and decomposes it into dominant spatial modes and corresponding temporal coefficients:

[
X(x,y,t)
\approx
\sum_k
EOF_k(x,y)PC_k(t).
]

The EOFs represent spatial patterns, while the PCs describe how strongly those patterns vary through time. 

They rotate the EOFs to make the patterns more physically interpretable, though rotated EOFs need not remain mutually orthogonal. 

---

# 19. The first three OHCA modes

They examine the first three dominant modes.

### EOF1 — ENSO-like mode

This explains approximately

[
\boxed{29.6%}
]

of OHCA variability.

Its spatial pattern resembles El Niño-related ocean variability. 

### EOF2 — global warming mode

This explains about

[
\boxed{25.6%}
]

of variability.

It contains strong positive anomalies in regions such as:

* Gulf Stream extension;
* Kuroshio extension;
* northern boundary of the Antarctic Circumpolar Current. 

### EOF3 — decadal/North-Pacific-dominated mode

This explains approximately

[
\boxed{9.4%}
]

of the OHCA variance and has especially strong positive OHCA anomalies in the North Pacific. 

---

# 20. Then they calculate TSI → PC causality

Instead of asking only

[
\mathrm{TSI}\rightarrow\mathrm{OHCA},
]

they ask

[
\mathrm{TSI}\rightarrow PC_1,
]

[
\mathrm{TSI}\rightarrow PC_2,
]

and

[
\mathrm{TSI}\rightarrow PC_3.
]

This is intended to tell them **which physical modes of ocean heat variability are associated with solar forcing**.

---

# 21. TSI → ENSO-like mode

Wavelet coherence shows a relationship between TSI and (PC_1) mainly at interannual scales. 

Their multi-scale LK analysis finds significant causal influence from TSI to (PC_1) particularly during the **1970s**.

After the 1980s, they argue that stronger El Niño variability overwhelms the solar information-flow signal. On timescales greater than 10 years, significant TSI → PC1 causality is no longer detected in the later period. 

This leads to one of their more interesting interpretations:

> TSI may act as a partial cause of ENSO-related ocean heat-content variability, but the strength of that causal relationship changes historically.

It is not presented as TSI being the sole driver of ENSO.

---

# 22. TSI → global warming mode

For (PC_2), which the authors interpret as a global-warming-related mode, they do **not** find a significant TSI causal influence at the 90% confidence level in their principal analysis. 

They interpret the weakening importance of solar forcing in recent decades in the context of increasing anthropogenic greenhouse-gas forcing.

Their broader argument is that approximately the **1970s** represent a transition after which anthropogenic influences increasingly dominate the global energy imbalance compared with variations in solar irradiance. 

---

# 23. TSI → PC3

Information flow from TSI to (PC_3) is reported as significant mainly **before the 1970s**. 

Thus all three mode analyses point toward the same broad conclusion:

[
\boxed{
\text{solar causal influence becomes less prominent in later decades}.
}
]

---

# 24. Their wavelet methodology

Wavelet analysis decomposes a signal into components localized simultaneously in **time and frequency/timescale**.

The authors use **wavelet coherence** to identify localized covariability between TSI and climate variables. 

They emphasize that wavelet coherence behaves conceptually like a localized correlation coefficient in time–frequency space.

So the role of wavelets in this paper is primarily a **comparison/control analysis**.

They compare:

[
\boxed{\text{wavelet coherence = localized association}}
]

against

[
\boxed{\text{LK information flow = directional causal metric}}.
]

The wavelet significance is also evaluated using Monte Carlo simulations. 

---

# 25. Overall results

The paper's broad result is that TSI → OHCA information flow is **not homogeneous**.

It varies in three dimensions:

[
\boxed{
T_{\mathrm{TSI}\rightarrow\mathrm{OHCA}}
========================================

f(\text{space},\text{time},\text{timescale})
}
]

rather than behaving like one constant relationship.

The authors attribute the spatial heterogeneity partly to atmospheric and oceanic transport, which redistributes incoming solar energy. 

---

# 26. Main timescale result

Their multi-scale analysis suggests that TSI contributes causally to upper-ocean OHCA particularly on approximately

[
\boxed{10-20\text{-year timescales}},
]

with some analyses showing significant relationships up to approximately 25 years or even longer regionally. 

This differs strongly from the wavelet-coherence analysis, which tends to highlight shorter-period correlations.

The authors therefore argue that LK exposes decadal causal relationships that correlation-based analyses may not reveal.

---

# 27. Their interpretation of strong climate events

The authors emphasize that weak external forcing can be hidden by strong internal variability.

For example:

[
\text{solar forcing}
\rightarrow
\text{small decadal influence}
]

can become difficult to detect during:

[
\text{large ENSO event}
\rightarrow
\text{strong interannual OHCA variability}.
]

This explains their observation that TSI information flow becomes weak around major El Niño events. 

---

# 28. Their interpretation of anthropogenic forcing

The paper also argues that the relative importance of solar forcing declines during the later part of the historical record.

They connect this with increasing anthropogenic influence on Earth's climate and energy imbalance.

Their conclusions specifically state that the solar contribution to some OHCA modes becomes less prominent in recent decades, while their EOF/PC analyses identify stronger TSI relationships in earlier periods such as the 1970s or before 1980. 

---

# 29. The complete methodology as a pipeline

The entire study can be summarized as:

```text
Historical TSI
        +
Historical OHCA
        ↓
match temporal resolution
(seasonal)
        ↓
ordinary LK
        ↓
TSI → global OHCA
        ↓
sliding-window LK
        ↓
TSI → OHCA as function of time
        ↓
repeat over many window sizes
        ↓
multi-scale LK
        ↓
T(time, timescale)
        ↓
Monte Carlo/bootstrap significance
```

They additionally run:

```text
TSI
 +
gridded OHCA
      ↓
spatial LK
      ↓
map of causal influence
```

and:

```text
OHCA field
   ↓
REOF / PCA
   ↓
PC1, PC2, PC3
   ↓
multi-scale LK
   ↓
TSI → PC1
TSI → PC2
TSI → PC3
```

and independently:

```text
TSI + OHCA
     ↓
wavelet coherence
     ↓
time-frequency correlation
```

so that the causal and correlation-based analyses can be compared.

---

# 30. The crucial methodological insight

For your current LK research, this is probably the most important part.

**They do not create a fundamentally different LK estimator for every point in time.**

They create dynamic causality by changing **which observations are used to estimate ordinary LK**.

For one window size:

[
T(t)
====

LK\left(
X_{t-W/2:t+W/2},
Y_{t-W/2:t+W/2}
\right)
]

conceptually gives a time-varying causal signal.

Then they change (W):

[
T(t,W_1),
]

[
T(t,W_2),
]

[
T(t,W_3),
]

etc.

Therefore:

[
\boxed{
\text{Multi-scale dynamic LK}
=============================

\text{ordinary LK}
+
\text{sliding windows}
+
\text{many window lengths}.
}
]

That is essentially the entire mathematical innovation described in their Methods section. 

---

# 31. What "scale" means here

This is worth emphasizing.

Their "timescale" is fundamentally based on **window length**.

It is not exactly equivalent to frequency in Fourier/wavelet analysis.

A 20-year LK window means:

> estimate the causal relationship using observations contained in approximately a 20-year interval.

Whereas a 20-year wavelet scale is describing oscillatory power/coherence corresponding to an approximately 20-year period.

Those ideas are related, but they are not mathematically identical.

That helps explain why their wavelet-coherence plot and multi-scale LK plot should not be interpreted as interchangeable quantities.

---

# 32. What is actually dynamic?

This paper has **two distinct kinds of variability**:

### Temporal variation

For fixed (W),

[
T(t,W)
]

changes as the window moves.

This asks:

> Did the causal relationship become stronger or weaker at different historical periods?

### Scale variation

For fixed (t),

[
T(t,W)
]

changes as (W) changes.

This asks:

> Does the inferred relationship exist over short intervals, decadal intervals, or multi-decadal intervals?

Combining both yields the triangle-style multi-scale causality diagram.

---

# 33. What this paper does NOT do

This distinction matters for your IcyAlert work.

The paper **does not recursively update LK with a Kalman filter**.

It is not the Hagan-style TvLK method where covariance itself evolves according to a state-space estimator.

Instead:

[
\boxed{
\text{dynamic LK here}
======================

\text{recompute ordinary LK repeatedly on sliding subsets}.
}
]

Similarly, it does not perform ensemble Kalman filtering, state estimation, forecast assimilation, or causal localization.

Its role is **causal diagnosis of historical climate data**.

---

# 34. How this relates directly to IcyAlert

For IcyAlert, the transferable methodological concept is:

Instead of estimating one Arctic causal network from the entire historical dataset,

[
G = {T_{j\rightarrow i}},
]

you could estimate

[
G_t(W)
======

{T_{j\rightarrow i}(t,W)}.
]

For example:

[
T_{\mathrm{SST}\rightarrow\mathrm{SIC}}(t,W),
]

[
T_{\mathrm{SAT}\rightarrow\mathrm{SIC}}(t,W),
]

[
T_{\mathrm{wind}\rightarrow\mathrm{SIC}}(t,W),
]

[
T_{\mathrm{OHC}\rightarrow\mathrm{SIC}}(t,W).
]

Then you can ask whether the Arctic causal network itself changes over:

* season;
* decade;
* climate regime;
* pre/post rapid warming;
* high-ice versus low-ice states.

That is much closer to the scientific implication of this paper than simply saying "use rolling LK."

---

# 35. But there is an important issue for forecasting

The paper is fundamentally **retrospective**.

Its sliding windows are designed for identifying historical causal structure, and the triangle representation naturally associates a window with a central historical period.

For a genuine IcyAlert forecast or assimilation system, however, you cannot use future observations.

You would need something like:

[
\boxed{
T(t,W)
======

LK
\left[
X_{t-W:t-1},
Y_{t-W:t-1}
\right]
}
]

rather than a centered interval involving observations after (t).

Then:

```text
historical observations through t-1
             ↓
       calculate LK
             ↓
      causal network G_t
             ↓
define EnKF localization
             ↓
receive observation at t
             ↓
        EnKF update
```

That would transform their retrospective multi-scale diagnostic concept into an operational/causal DA methodology.

---

# 36. What I think the paper contributes conceptually

The strongest conceptual lesson is not specifically about solar activity.

It is this:

[
\boxed{
\text{A causal relationship in a nonstationary climate system should not automatically be treated as constant.}
}
]

A single LK number can hide:

* periods when causality is strong;
* periods when it disappears;
* regions where it is important;
* regions where it is absent;
* timescales where it exists;
* timescales where other variability dominates.

The paper therefore moves from

[
T_{X\rightarrow Y}
]

to approximately

[
\boxed{
T_{X\rightarrow Y}(x,y,t,W).
}
]

That is the main methodological idea connecting this study to your IcyAlert causal-localization work.

## One-sentence summary

**The paper takes standard Liang–Kleeman information flow, calculates it repeatedly through sliding temporal windows of progressively increasing length, tests each estimate with Monte Carlo/bootstrap significance, applies it globally, spatially and to EOF-derived climate modes, and thereby shows that inferred TSI → ocean-heat-content causality varies strongly across location, historical period and timescale rather than being a fixed relationship.** 
