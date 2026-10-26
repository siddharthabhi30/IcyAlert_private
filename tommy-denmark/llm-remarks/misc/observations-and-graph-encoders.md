# Observation-to-state and graph-encoder pointers

## What the observation model predicts

- **Radiances → atmospheric variables:** [Zhang et al. (2022), §3.1 and Fig. 2](https://doi.org/10.3390/rs14225858) train a DNN with FY-3D/MWHTS microwave brightness temperatures as input and ERA5 temperature/humidity profiles as targets. This is a **profile retrieval**, not reconstruction of the whole ERA5 state.
- **Mixed observations → gridded state:** [Aardvark Weather (2025)](https://www.nature.com/articles/s41586-025-08897-0) pretrains an observation encoder against ERA5, then feeds its gridded state into a forecast model. It uses satellite **and** in-situ observations; it is not radiance-only.
- **Observations + forecast background → analysis:** [FuXi-DA (2025)](https://doi.org/10.1038/s41612-025-01039-3) fuses satellite observations and a forecast background with separate encoders and trains against ERA5, also using downstream forecast loss. The background is an additional input.
- **State → predicted radiance:** [Liang, Terasaki and Miyoshi (2023)](https://doi.org/10.2151/jmsj.2023-005) learn an observation operator for AMSU-A brightness temperatures in a LETKF. This mapping goes in the *opposite direction* from the Zhang retrieval.

ERA5 is a reanalysis target, not raw measured truth. The choice between a retrieval, a background-assisted analysis, and a forward observation operator depends on which inputs and comparison space our experiment actually has.

## Alternatives to a CNN-only encoder

- **Graph attention autoencoder:** [GATE (2019)](https://arxiv.org/abs/1905.10715) uses attention in graph encoder/decoder layers to reconstruct node attributes and graph structure. Graph-structured input is assumed; this paper does not demonstrate radiance-to-ERA5 reconstruction.
- **Changing graph edges:** [Dynamic Graph CNN (2019)](https://arxiv.org/abs/1801.07829) recomputes neighbours in learned feature space at each layer. This proves graph connectivity need not be fixed, but its experiments concern point clouds.
- **Changing interaction weights:** [iTransformer (ICLR 2024)](https://proceedings.iclr.cc/paper_files/paper/2024/hash/2ea18fdc667e0ef2ad82b2b4d65147ad-Abstract-Conference.html) attends across variable tokens for forecasting. It is neither a radiance encoder nor an autoencoder.
- **Cosine attention:** [Swin Transformer V2 (CVPR 2022)](https://arxiv.org/abs/2111.09883) uses scaled cosine attention for stability. The word *cosine* specifies a similarity calculation, not dynamic graph topology.

**Research combination, not an established result:** use a graph/attention observation encoder to map sparse Arctic satellite measurements to the chosen state variables, then evaluate against held-out measurements and ERA5. None of the four architecture papers above validates that exact pipeline.
