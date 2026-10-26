"""Small entropy check using the KNIFE authors' unchanged MargKernel class.

This checks separate Gaussian distributions, not online physical evolution or LK.
Clone g-pichler/knife at bec8e057110450d16a89f09ea2688e62f9246235 first.
"""
import argparse
import hashlib
import json
from pathlib import Path
import sys
from types import SimpleNamespace

import numpy as np
import torch

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--author-root", type=Path, required=True,
                    help="Path to the authors' knife/synthetic_experiments folder")
parser.add_argument("--output", type=Path, default=Path("results/knife"))
args = parser.parse_args()
sys.path.insert(0, str(args.author_root.resolve()))
from estimators.knife import MargKernel

torch.set_num_threads(1)
torch.manual_seed(17)
args.output.mkdir(parents=True, exist_ok=True)
options = SimpleNamespace(optimize_mu=True, marg_modes=8, batch_size=256,
                          use_tanh=False, init_std=.01, cov_diagonal="var",
                          cov_off_diagonal="var", average="var")
rows = []
for sd in [1., .7, .5]:
    train = torch.randn(8192,2)*sd
    test = torch.randn(32768,2)*sd  # independent of the fitting samples
    model = MargKernel(options, 2, None, init_samples=train[:8].clone())
    optimizer = torch.optim.Adam(model.parameters(), lr=.01)
    for step in range(800):
        batch = train[torch.randint(len(train),(256,))]
        optimizer.zero_grad(set_to_none=True)
        loss = model(batch)
        loss.backward()
        optimizer.step()
    model.eval()
    with torch.no_grad():
        per_sample = -model.logpdf(test)
        estimate = float(per_sample.mean())
        stderr = float(per_sample.std()/np.sqrt(len(test)))
    truth = float(np.log(2*np.pi*np.e*sd**2))
    rows.append(dict(sd=sd, estimated_entropy=estimate, exact_entropy=truth,
                     error=estimate-truth, evaluation_MC_stderr=stderr))
    torch.save(model.state_dict(), args.output/f"knife_sd_{sd}.pt")
source = args.author_root/"estimators/knife.py"
result = {
    "status":"Author marginal estimator executed on our small synthetic Gaussian check",
    "source":"https://github.com/g-pichler/knife/blob/bec8e057110450d16a89f09ea2688e62f9246235/synthetic_experiments/estimators/knife.py",
    "source_sha256":hashlib.sha256(source.read_bytes()).hexdigest(),
    "seed":17,"train_samples":8192,"test_samples":32768,"steps":800,"rows":rows,
    "exact_last_minus_first_entropy":rows[-1]["exact_entropy"]-rows[0]["exact_entropy"],
    "estimated_last_minus_first_entropy":rows[-1]["estimated_entropy"]-rows[0]["estimated_entropy"],
    "limits":["Separate distributions and separate fits; no physical time coordinate or entropy derivative.",
              "No process model, no driver attribution, no LK transfer.",
              "MargKernel is a learnable Gaussian mixture; the full author package also has neural conditional kernels.",
              "One seed only. Evaluation MC error excludes fitting and model-approximation uncertainty."]}
(args.output/"metrics.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
