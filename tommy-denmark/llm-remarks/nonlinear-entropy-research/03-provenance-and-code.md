# Provenance, code inspection, and reproducibility

Checked on 26 October 2026. Scientific scope: [literature map](01-neural-entropy-search.md). Inspection and execution records follow.

## 1. Source hierarchy

Equations were checked against the manuscript and local transcription. Search summaries, earlier LLM notes, and abstracts were discovery aids.

| Claim | Primary location to verify |
|---|---|
| General nonlinear drift/diffusion model | Pires Equation 1, PDF page 3 |
| Probability-density evolution and entropy budget | Equations 4–8, PDF pages 4–5 |
| Conditional-average slope formula | Equations 10–13, PDF page 6 |
| Individual transfer with outer variables | Equations 28–29, PDF pages 11–12 |
| Factorized individual formulas | Equations 36–37, PDF page 14 |
| Individual plus synergy contributions | Equations 40–42, PDF pages 14–15 |
| Basis-function drift/diffusion fitting | Equations 47–50, PDF page 19; Section 4.3 |
| Lorenz equations and selected link | Equations 71–72, PDF page 29 |
| Experiment settings and two different regression degrees | Section 6.2, PDF pages 30–31 |
| Minimal Lorenz conditional fits | Equations 78a–e, PDF pages 31–32 |
| Approximately \(-0.883\) for \(X_3\to X_2\) | Equation 79c, PDF page 32 |
| Increment-rate and residual fitting | Appendix B.1, PDF pages 46–47 |

Pinned manuscript: [local PDF](sources/pires-2307.10623v2.pdf), [2307.10623v2](https://arxiv.org/pdf/2307.10623v2). Download SHA-256:

```text
2b5b20f18f5ba5c4f1f9cee8b6cd4901f14d33b6258a2d3470aa28fdefaa088e
```

The local text is [paper-dump.md](../../papers/lk-curated-library/09-pires-2024/paper-dump.md). It contains layout/OCR damage, so symbols and equation numbers were cross-checked against the PDF text.

The published [Liang 2016 article](https://doi.org/10.1103/PhysRevE.94.052201) and its accessible [2015 preprint](https://arxiv.org/pdf/1503.08389) are different versions. The walkthrough explicitly labels equation numbers taken from the older preprint. A separate download of the author-hosted journal PDF failed certificate validation; it was not treated as a successfully retrieved local source.

## 2. Author code: selected files actually inspected

Pinned commits and downloaded-file hashes: [repository manifest](repository-manifest.json).

| Repository and commit | Files/symbols inspected | What that establishes | Execution here |
|---|---|---|---|
| [KNIFE](https://github.com/g-pichler/knife/tree/bec8e057110450d16a89f09ea2688e62f9246235) | `synthetic_experiments/estimators/knife.py`: `MargKernel.logpdf`, `forward`, `CondKernel`; `estimate_entropy.py` | Marginal Gaussian-mixture negative log density; neural conditional mixture; author training driver | Marginal class executed on our Gaussian check |
| [REMEDI](https://github.com/viktor765/REMEDI/tree/b6ee9bdd3d141bf564634a56a5bb19b1b7f543e2) | `Entropy estimation/REMEDI.py`: `REMEDI.forward`, `train_model`; `README.md` | Feedforward correction and base cross-entropy minus variational KL objective | Author network and training function executed on our bimodal check |
| [NFEE](https://github.com/ziq-ao/NFEE/tree/662d18c736acafcc4d5e0629bead41a45b4e0a1e) | `ent_est/entropy.py`: `UMestimator.learn_transformation`, `calc_ent` | Learns transformation, estimates transformed entropy, adds two transformation corrections | Inspected, not run |
| [SMILE](https://github.com/ermongroup/smile-mi-estimator/tree/afa72e03f4c80a0997eb8f6b95d7f96bdf916ea7) | `estimators.py`: `mine_lower_bound`, `smile_lower_bound` | MI objectives; clipping in the SMILE calculation | Inspected, not run |
| [NJEE](https://github.com/YuvalShalev/NJEE/tree/0c800c7c0901a8af10e5dc0d704e47379b41dc90) | README; selected portions of `bitwise_entropy_estimation_transformer.py` | Current author repository includes bitwise entropy examples, including a transformer | Inspected example, not run or fully audited |
| [fDIME](https://github.com/nicolaNovello/fDIME/tree/662926ac31892f05b07a8f0ca4e4d1d8826bb215) | README and source inventory | Author-labelled experiments for MI estimation and deranged pairings | Availability/instructions checked; not executed |
| [Diffeomorphic DINE](https://github.com/baosws/DINE/tree/688f87d78fa3e69c2bddd8bfa3c194fc8cbcda81) | README/API example | MI, CMI, conditional-independence entry points and dependencies | README inspected, not run |
| [Directed-information DINE](https://github.com/zivaharoni/capacity-estimator-via-dine/tree/003cba3b21719f2e6ab4850beb9d589a23c3c2b3) | README and source inventory | TensorFlow channel-capacity/DI experiments by the paper's author group | README inspected, not run |
| [TENDE author tutorial](https://github.com/giuliofranzese/Cajal/tree/318192802d9c798a596fbd8d50692a39f81b9f40/tende) | `TENDE_notebook_colab.ipynb` code cells; tutorial bundle card | Downloads source/checkpoint/data bundle, loads or trains `TENDE`, calls `compute_te` | Notebook inspected; bundle not downloaded or executed |
| [ALICE](https://github.com/eurecom-probai/alice/tree/47944f2e80ca24b9a8e76d900ab70623dc6b6085) | README and source inventory | Frozen-model MI interface, context samples, model/checkpoint requirements | Interface inspected; weights not loaded |
| [LearnEntropy](https://github.com/tsuboshun/LearnEntropy/tree/8a40e68bf224af1ca27d498f39d6ce8002b05489) | `models.py`: `FNNt`; `utils.py`: `estimate_epr`, `obj_func`, `train`; `toy.py` inventory | Time/state neural field; transition-ensemble currents; EPR objectives and time-step normalization | Inspected, not run |
| [NEEP](https://github.com/kdkyum/neep/tree/b3c68d8043d34af2a60dcac5dedb8059ce5c295c) | README and example inventory | Public PyTorch code for the entropy-production paper | Availability checked; not run |
| [active_pflows](https://github.com/nmboffi/active_pflows/tree/236907499af8c13f8d6507a732f6e0b72fd54999) | `py/common/entropy_utils.py` | EPR utilities combine neural quantities and drift information | Selected functions inspected, not run |
| [vicsek_public](https://github.com/nmboffi/vicsek_public/tree/560fde7fa192be1b4b425ae7d05f286c9434d91a) | `py/common/losses.py`: `stratonovich_loss`; `py/launchers/learn.py`; `pflow_utils.py` | Model-free-current objective is demonstrated using simulator-generated transitions; launcher also contains physical-model diagnostics | Selected paths inspected, not run |
| [NeuralEntropy](https://github.com/akhilprem1/NeuralEntropy/tree/7f82b53a8929f12270331721c8c01524ca3411f6) | README/source inventory only | A public repository accompanies the diffusion “neural entropy” work | Not a candidate implementation of the required LK quantity; not run |

A public repository is evidence of source accessibility. Licensing metadata is preserved in the manifest; “code found” here does not imply unrestricted reuse or complete reproduction.

## 3. KNIFE check: executed steps

1. Retrieve the pinned author repository source.
2. Import its unchanged `MargKernel` class.
3. Generate independent training and evaluation Gaussian samples.
4. Train the class using its negative-log-density output.
5. Evaluate average negative log density on the held-out samples.
6. Compare with analytic Gaussian entropy.

[Driver script](code/check_knife_entropy.py), [results](results/knife/metrics.json). The exact downloaded `knife.py` SHA-256 appears in those results.

To repeat from this folder:

```bash
git clone https://github.com/g-pichler/knife /tmp/knife-entropy-reading
git -C /tmp/knife-entropy-reading checkout bec8e057110450d16a89f09ea2688e62f9246235
python code/check_knife_entropy.py \
  --author-root /tmp/knife-entropy-reading/synthetic_experiments \
  --output results/knife
```

The driver uses Python, NumPy and PyTorch. The KNIFE package import also imports sibling estimator modules. No GPU is required by this small check.

The marginal class is a learned mixture, not a deep neural predictor of a scalar entropy label. The author code's conditional estimator contains feedforward networks. REMEDI supplies a separate, genuinely neural correction of the base density estimate.

## 4. REMEDI neural correction

The [driver](code/check_remedi_entropy.py) imports the authors' unchanged `KNIFE` base class, `REMEDI` network and `train_model` function. Its base is a moment-fitted single Gaussian; the data are an equally weighted mixture of `Normal(-2, 0.5^2)` and `Normal(2, 0.5^2)`. The correction network has two 32-unit hidden layers and trains for 30 epochs on 8192 samples. Evaluation uses 16384 separate samples and an additional base-distribution Monte Carlo sample.

The corrected entropy was 1.42222 nats; quadrature of the known generating density gave 1.41884. [Full result](results/remedi/metrics.json) includes source-file hashes; [author-function log](results/remedi/author-training.log) records the run. The quadrature error is not an uncertainty interval for the neural estimate.

To repeat:

```bash
git clone https://github.com/viktor765/REMEDI /tmp/remedi-entropy-reading
git -C /tmp/remedi-entropy-reading checkout b6ee9bdd3d141bf564634a56a5bb19b1b7f543e2
python code/check_remedi_entropy.py \
  --author-root "/tmp/remedi-entropy-reading/Entropy estimation" \
  --output results/remedi
```

This uses PyTorch, NumPy, SciPy, scikit-learn, Matplotlib and tqdm. It tests a static distribution, not physical-time evolution or driver attribution.

## 5. Independent Lorenz reconstruction

[Code](code/lorenz_walkthrough.py), [settings and numbers](results/lorenz/metrics.json), [generated samples](results/lorenz/samples.npz).

The simulation uses the paper's standardized noise-free drift and parameters. The calculation follows Equation 37a termwise, Equation 72e for the selected known-model link, and the full linear covariance estimator for comparison.

The reconstruction uses SciPy integration, a single longer trajectory, and a first-half/second-half split. The paper uses its predictor–corrector scheme, multiple realizations, other lengths and noise cases, and a density-based AN reference. Therefore the reconstruction tests the calculation path; it does not reproduce the full experiment.

Checks performed include:

- checking the known polynomial coefficients against the drift function;
- checking the generic termwise transfer calculation against Equation 72e;
- checking the absent \(X_3\to X_1\) term gives zero;
- checking fitted polynomial derivatives against finite differences;
- recording conditional-regression-degree sensitivity;
- retaining the full covariance calculation and finite-step drift-fit error.

The companion [verification record](verification.json) gives numerical check errors and package versions. There are no independent-seed confidence intervals or online/nonstationary validation.

## 6. How the search was performed

Targeted review: distinguish quantities, search method families, follow primary links, inspect code, and run three checks. Not an exhaustive systematic review.

Representative queries used:

- `neural estimation entropy change time dependent entropy rate Fokker Planck neural network`
- `"Interacting Particle Solutions" "Gradient" entropy code`
- `"Entropy estimation via uniformization" code Ao Li`
- `"Liang" "Kleeman" "neural" nonlinear entropy estimation`
- `"Liang" "neural network" "information flow" nonlinear estimator`
- `"Gaussian mixture" "Liang" "information transfer"`
- `"Neural Joint Entropy Estimation" github code`
- `"TENDE" "Transfer Entropy" github`
- `"Understanding the Limitations" "SMILE" github Song Ermon`
- `"Mutual Information Estimation via f-Divergence and Data Derangements" code`
- `online differential entropy estimation neural network nonstationary streaming`
- `"REMEDI" "Neural Entropy" paper github`
- `"Model-free learning of probability flows" code`
- `"Information flow and causality as rigorous notions ab initio" pdf 2016 Liang`

Important corrections produced by source-following:

- The old NJEE preprint does not expose the current author-code link in the same way as the journal version. The journal PDF, Section V, links `YuvalShalev/NJEE`.
- SMILE's actual repository is `ermongroup/smile-mi-estimator`.
- TENDE's author tutorial now offers a source/checkpoint/data bundle, though the paper PDF alone did not expose a straightforward GitHub link.
- Boffi's 2024 method uses known dynamics; the later model-free paper changes that inference requirement. They should not be collapsed into one description.
- The Lorenz paper uses \(R_a=27\).
- The entropy-production literature has actual time-dependent neural methods, but those estimate a different quantity from pairwise LK.

A publisher full-text request for the reduced-order atmospheric paper failed. The 2026 local-EPR archive was cited by its paper but its contents were not fetched. These access failures do not establish code absence.

## 7. Source records and previous documentation

[PDF and repository records](source-manifest.json) contain URLs, download hashes, and failure notes. Some downloaded source snapshots were used only for discovery or inventory checks; the table above states which paths were actually read.

Existing [migration link gaps](../../todo/documentation-link-gaps.md) remain unresolved; this was not a full library audit.

