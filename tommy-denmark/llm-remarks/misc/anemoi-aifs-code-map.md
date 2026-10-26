# Anemoi and AIFS: code-reading pointer

**Anemoi is a trainable weather-ML framework; AIFS is one forecast model built with it.** Anemoi covers dataset preparation, graph construction, model definition, training, and inference. The current [`anemoi-core`](https://github.com/ecmwf/anemoi-core) repository contains the models, graphs, and training packages; the [umbrella repository](https://github.com/ecmwf/anemoi) explains how they fit together. The [configuration repository](https://github.com/ecmwf/anemoi-configs) contains example recipes. The older standalone training repository is archived; start with `anemoi-core`.

For AIFS, read the [AIFS Single v2 model card](https://huggingface.co/ecmwf/aifs-single-2.0) for the exact released model version. It describes a graph neural network encoder and decoder with a sliding-window Transformer processor. Its forecast input is a gridded atmospheric state, **not raw satellite radiances**. The card provides an inference example; inference with its checkpoint is different from training a new model.

## Trace one training step

1. [Dataset package](https://github.com/ecmwf/anemoi-datasets): how dates, variables, grids, and normalization become batches.
2. [`anemoi-core` graphs](https://github.com/ecmwf/anemoi-core/tree/main/graphs): how nodes and edges are made. Check whether a chosen recipe fixes connectivity or changes it during a forward pass; do not infer dynamic edges from attention alone.
3. [`anemoi-core` models](https://github.com/ecmwf/anemoi-core/tree/main/models): find the configured encoder, processor, and decoder.
4. [`anemoi-core` training](https://github.com/ecmwf/anemoi-core/tree/main/training): locate the target, loss, optimizer step, and any autoregressive rollout.
5. [Configurations](https://github.com/ecmwf/anemoi-configs) and [inference package](https://github.com/ecmwf/anemoi-inference): connect the recipe to a checkpoint and forecast output.

**First reading task:** follow one small example configuration from dataset sample to graph, model output, loss, and optimizer update. Record tensor shapes and which fields are inputs, targets, or forcings. The full AIFS training scale in the pasted note is version-specific and should be checked against its paper/configuration before reuse; Anemoi itself does not require that scale.

**IcyAlert boundary:** this code is relevant if we build a learned process/forecast model. It does not choose the covariance that our LK filter should estimate, and Anemoi's gridded-state forecasting route is separate from a satellite-radiance-to-state model.
