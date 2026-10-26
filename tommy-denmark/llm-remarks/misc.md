Related concise pointers: [Anemoi/AIFS code](misc/anemoi-aifs-code-map.md) · [observation and graph encoders](misc/observations-and-graph-encoders.md).

I checked the claims against current ECMWF documentation, the actual papers/repos, and newer 2025–2026 work. The **main conclusion survives**, but several details in that write-up need correction before we use it as the basis for a project.

### 1. Claim-by-claim audit

| Claim                                                        | Verdict                  | What is actually true                                                                                                                                                                                                                                                                                                                                              |
| ------------------------------------------------------------ | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **ERA5 uses IFS CY41R2 + 4D-Var**                            | ✅ Correct                | ERA5 is produced with **IFS Cycle 41r2**, using **4D-Var data assimilation** in 12-hour windows. ([confluence.ecmwf.int][1])                                                                                                                                                                                                                                       |
| **We can download the exact system that produced ERA5**      | ❌ No                     | There is **no public, reproducible ERA5 production code/configuration bundle**. The full IFS remains non-public/restricted. ([ecmwf.int][2])                                                                                                                                                                                                                       |
| **Full IFS is only available to ECMWF member states**        | ⚠️ Too absolute          | Full IFS is not public, but access can extend beyond member-state services to certain cooperating services/approved partners. The important statement is simply: **we cannot publicly clone the ERA5 production stack.** ([doi.org][3])                                                                                                                            |
| **OpenIFS is a research-only licensed forecast model**       | ❌ Outdated               | Since **5 March 2026**, OpenIFS 48r1 is public under **Apache-2.0**. This changed recently. ([ecmwf.int][4])                                                                                                                                                                                                                                                       |
| **OpenIFS gives us ERA5's forecast model**                   | ⚠️ Not exactly           | OpenIFS 48r1 derives from **IFS CY48R1**, whereas ERA5 uses **CY41R2**. And OpenIFS deliberately excludes DA/observation handling, tangent-linear/adjoint code and 4D-Var. ([confluence.ecmwf.int][5])                                                                                                                                                             |
| **OOPS is the open engine that produced ERA5**               | ❌ Wrong                  | ERA5 predates operational OOPS. ECMWF only moved its operational atmospheric 4D-Var control layer to OOPS with **CY48R1 in June 2023**. ERA5 is CY41R2. ([ecmwf.int][6])                                                                                                                                                                                           |
| **OOPS is open source**                                      | ⚠️ Complicated           | The open **JCSDA/OOPS** implementation exists under Apache-2.0, but JCSDA's OOPS and ECMWF's OOPS-IFS were explicitly maintained as separate repositories. Do **not** equate the public JCSDA repo with ECMWF's complete operational DA code. ([github.com][7])                                                                                                    |
| **ERA5 data is open**                                        | ✅ Correct                | ERA5 is openly distributed through the Copernicus CDS. There is also an NSF/NCAR copy on AWS. The old ECMWF AWS registry is deprecated, so “ERA5 on AWS” needs that nuance. ([cds.climate.copernicus.eu][8])                                                                                                                                                       |
| **Appa gives us open global diffusion DA**                   | 🟡 Mostly                | The repository is public and Appa performs global generative DA. But the current model is **565M parameters**, not 1.5B, and its DA observations are **synthetically generated around ERA5 truth**. Real station locations are used, but not real measurement values. ([arxiv.org][9])                                                                             |
| **PhysicsNeMo ReGen gives diffusion DA**                     | ✅ With caveat            | Yes, and this one actually assimilates **real weather-station observations**. But it's regional, surface-focused, kilometer-scale—not a global full-atmosphere ERA5 replacement. PhysicsNeMo itself is Apache-2.0. ([docs.nvidia.com][10])                                                                                                                         |
| **The npj AI paper says hybrids win in the next five years** | 🟡 Directionally correct | The paper synthesizes responses from **35 experts across 22 institutions** and expects hybrid DA–ML approaches to dominate operationally in the near term. It says pure ML is unlikely to displace physics systems in high-stakes operations over the next five years. That's an **expert outlook**, not an empirical proof that “hybrid wins.” ([nature.com][11]) |
| **The paper says you can't outperform reanalysis**           | ❌ No                     | I found no such claim. Retracting that statement was correct.                                                                                                                                                                                                                                                                                                      |

One subtle point from that npj paper: it really does describe reanalyses such as ERA5 as an important “ground truth” used for ML training, and it discusses the short-range model forecast/background as a **prior** in DA. So those parts of your Section 7 summary are supported. ([nature.com][11])

---

## 2. The most important correction to our understanding

The situation is **not**:

> ERA5 closed → Appa/ReGen open → therefore diffusion DA is the untouched opportunity.

The field has gone substantially further already.

**Global diffusion DA already exists.** DiffDA, published at ICML 2024, performs global 0.25° diffusion-based assimilation; like Appa, it primarily evaluates with ERA5-derived simulated observations. ([proceedings.mlr.press][12])

**Global ML assimilation of real observations already exists too.** FuXi Weather performs global cycling assimilation every six hours from real observations including satellite brightness temperatures and GNSS radio occultation. ([nature.com][13])

**Global learned latent-space DA with real observations now exists.** The 2026 Science Advances LDA work performs physically consistent global atmospheric assimilation in latent space and includes real observational experiments. Its code is public. ([pmc.ncbi.nlm.nih.gov][14])

And the boundary is moving even further. **WeatherNext 3**, released in September 2026, is probabilistic and directly ingests recent geostationary satellite imagery along with an existing atmospheric analysis. So real observations are increasingly being pushed directly into operational-scale AI forecasting too. ([arxiv.org][15])

So three project pitches are already too weak:

> “Use diffusion for weather DA.” → **already done.**

> “Do global ML data assimilation.” → **already done.**

> “Use real weather observations instead of synthetic ones.” → **also already done.**

That changes our project search materially.

---

# 3. So what **can** we actually obtain?

Think of the ERA5 machinery as several layers:

**Observations → observation processing/QC/bias correction → DA/4D-Var → atmospheric model → analysis → forecast → repeat/cycle**

For the **exact ERA5 pipeline**, we do **not** have the whole chain.

What we now have publicly is roughly:

| Piece                                                     | Can we get it?               |
| --------------------------------------------------------- | ---------------------------- |
| ERA5 output data                                          | ✅ Yes                        |
| ERA5 documentation/configuration descriptions             | ✅ Largely                    |
| Exact IFS CY41R2 source used for ERA5                     | ❌ Not publicly               |
| Exact ERA5 observation-processing/4D-Var production stack | ❌ Not publicly               |
| Modern ECMWF forecast-model family                        | ✅ **OpenIFS 48r1**, Apache-2 |
| DA inside OpenIFS                                         | ❌ No                         |
| Generic open DA framework                                 | ✅ **JEDI/OOPS**              |
| Global generative DA examples                             | ✅ DiffDA, Appa               |
| Generative DA with real observations                      | ✅ ReGen, but regional        |
| Global learned DA with real observations                  | ✅ FuXi Weather, LDA          |
| Real satellite-aware probabilistic forecasting            | ✅ Emerging now               |

Therefore:

### **We cannot reproduce ERA5.**

But:

### **We absolutely can build a new assimilation system.**

Those are different statements.

And OpenIFS becoming genuinely open in March 2026 makes the second proposition more interesting than it was even a year ago.

---

# 4. Where I think the research gap has moved

From this search, the interesting seam is **much narrower** than “diffusion weather DA.”

Something closer to:

> **Global probabilistic/generative atmospheric state estimation from real heterogeneous observations, especially satellite radiances, with cycling and calibrated posterior uncertainty—without relying on ERA5 as the observation truth or on an already-created operational analysis as the input.**

Why this survives the obvious prior-art checks:

**Appa / DiffDA:** global + generative, **but synthetic ERA5-derived observations**. ([arxiv.org][9])

**ReGen:** generative + **real observations**, but regional/surface/stations rather than the global atmosphere. ([docs.nvidia.com][10])

**FuXi Weather / LDA:** global + **real observations**, but not doing the same explicit score/diffusion posterior-distribution formulation. ([nature.com][13])

**WeatherNext 3:** probabilistic + real satellite imagery, but it still takes an **existing analysis** as an input and is primarily a forecasting system rather than replacing the analysis-generating DA system. ([arxiv.org][15])

That combination is much more defensible as a research frontier.

I would **not yet call it novel**. That requires a much more exhaustive prior-art search specifically around generative Bayesian DA, satellite radiances, cycling, score models and operational observation operators. But it's the first formulation from this branch that has survived the obvious contradictions.

---

# 5. And most importantly: **where are *we* in your project selection?**

According to the framework in your project brief, **we have not selected a project yet**.

This weather/ERA5 discussion has gotten dangerously close to choosing a **method before an application**:

> “Can we replace ERA5 assimilation with diffusion?”

That is a technically interesting research question, but **it is not yet the concrete application your framework requires**.

We currently have:

**Technology vehicle:** ML / computational algorithms
**Interesting technical domain:** atmospheric state estimation / data assimilation
**Interesting mechanism:** recovering a huge hidden physical state from sparse/noisy observations
**Potential methods:** generative models, latent DA, hybrid physics/ML
**Concrete beneficiary/problem/outcome:** **NOT selected yet**
**Career field:** **NOT selected yet**
**Project:** **NOT selected yet**

And that distinction matters.

For example, “better state estimation from sparse satellite observations” could eventually serve very different applications: weather prediction in observation-poor regions, tropical cyclone initialization, severe-convection nowcasting, inexpensive national forecasting capability, polar weather, aviation, etc. **We haven't chosen among those**, and under your rules we shouldn't silently choose one just because a cool method exists.

So I would preserve this whole ERA5 investigation as a **candidate technical branch**, not promote it to “our project.”

### The clean corrected bottom line

**Exact ERA5 code:** ❌ unavailable publicly.
**Open ECMWF forecast model:** ✅ yes now—OpenIFS 48r1, Apache-2.
**Open exact ECMWF ERA5 DA:** ❌ no.
**Open generic DA frameworks:** ✅ yes.
**Diffusion DA:** ✅ already exists.
**Global diffusion DA:** ✅ already exists.
**Real-observation ML DA:** ✅ already exists.
**Global real-observation ML DA:** ✅ already exists.
**Global generative posterior DA from real heterogeneous observations:** **this is where a potentially interesting gap still appears.**

And crucially, **we still need to decide what real-world problem would justify building that system before deciding that this is your project.**

I also have **not yet done the other half required by your framework**: live hiring/momentum analysis for atmospheric DA/NWP as an industry career field, nor an exhaustive novelty search of that narrower “global generative + real radiances + cycling” formulation. So I would not rank this field or lock the project yet.

[1]: https://confluence.ecmwf.int/pages/viewpage.action?pageId=669811810 "https://confluence.ecmwf.int/pages/viewpage.action?pageId=669811810"
[2]: https://www.ecmwf.int/en/newsletter/182/computing/modernisation-integrated-forecasting-system "https://www.ecmwf.int/en/newsletter/182/computing/modernisation-integrated-forecasting-system"
[3]: https://doi.org/10.1002/qj.70144 "https://doi.org/10.1002/qj.70144"
[4]: https://www.ecmwf.int/en/about/media-centre/news/2026/openifs-open-source "https://www.ecmwf.int/en/about/media-centre/news/2026/openifs-open-source"
[5]: https://confluence.ecmwf.int/spaces/OIFS/pages/61124850/OpenIFS%2BReleases "https://confluence.ecmwf.int/spaces/OIFS/pages/61124850/OpenIFS%2BReleases"
[6]: https://www.ecmwf.int/en/about/media-centre/news/2023/ecmwfs-next-model-upgrade-provide-better-initial-conditions-weather "https://www.ecmwf.int/en/about/media-centre/news/2023/ecmwfs-next-model-upgrade-provide-better-initial-conditions-weather"
[7]: https://github.com/JCSDA/oops "https://github.com/JCSDA/oops"
[8]: https://cds.climate.copernicus.eu/datasets/reanalysis-era5-single-levels?tab=documentation "https://cds.climate.copernicus.eu/datasets/reanalysis-era5-single-levels?tab=documentation"
[9]: https://arxiv.org/html/2504.18720 "https://arxiv.org/html/2504.18720"
[10]: https://docs.nvidia.com/physicsnemo/latest/physicsnemo/examples/weather/regen/README.html "https://docs.nvidia.com/physicsnemo/latest/physicsnemo/examples/weather/regen/README.html"
[11]: https://www.nature.com/articles/s44387-026-00107-0 "https://www.nature.com/articles/s44387-026-00107-0"
[12]: https://proceedings.mlr.press/v235/huang24h.html "https://proceedings.mlr.press/v235/huang24h.html"
[13]: https://www.nature.com/articles/s41467-025-62024-1 "https://www.nature.com/articles/s41467-025-62024-1"
[14]: https://pmc.ncbi.nlm.nih.gov/articles/PMC12757030/ "https://pmc.ncbi.nlm.nih.gov/articles/PMC12757030/"
[15]: https://arxiv.org/abs/2609.03582 "https://arxiv.org/abs/2609.03582"
