"""Execute the REMEDI authors' network and training function on a small mixture.

Independent teaching check, not the paper's full benchmark or an online LK test.
Author commit: b6ee9bdd3d141bf564634a56a5bb19b1b7f543e2.
"""
import argparse
from contextlib import redirect_stdout
import hashlib
import json
from pathlib import Path
import sys
from types import SimpleNamespace

import numpy as np
from scipy.integrate import quad
from scipy.special import logsumexp
import torch
from torch.utils.data import DataLoader

parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument("--author-root",type=Path,required=True,
                    help="Path to REMEDI/Entropy estimation")
parser.add_argument("--output",type=Path,default=Path("results/remedi"))
args=parser.parse_args()
sys.path.insert(0,str(args.author_root.resolve()))
from KNIFE import KNIFE
from REMEDI import REMEDI, train_model

torch.set_num_threads(1)
torch.manual_seed(23)
args.output.mkdir(parents=True,exist_ok=True)
def samples(n):
    return (torch.randint(0,2,(n,1))*4-2).float()+.5*torch.randn(n,1)
train,test=samples(8192),samples(16384)
options=SimpleNamespace(optimize_mu=True,marg_modes=1,batch_size=256,
                        use_tanh=False,init_std=.01,cov_diagonal="var",
                        cov_off_diagonal="var",average="var")
base=KNIFE(options,1,None,init_samples=train.mean(0,keepdim=True))
with torch.no_grad():
    base.logvar.copy_(-train.std(0,unbiased=False).log().reshape(1,1,1))
    base.tri.zero_()
model=REMEDI(base,train_base_dist=False,hidden_dim=[32,32])
optimizer=torch.optim.Adam(model.parameters(),lr=.001)
with (args.output/"author-training.log").open("w") as log,redirect_stdout(log):
    history=train_model(model,False,False,optimizer,
                        DataLoader(train,batch_size=256,shuffle=True),
                        DataLoader(test,batch_size=256),
                        n_epochs=30,batchsize=256,sample_size=256)
with torch.no_grad():
    cross=float(-base.log_prob(test).mean())
    reference=base.sample((131072,)).float()
    correction=float(model(test).mean()-torch.logsumexp(model(reference),0)
                     +np.log(len(reference)))
    estimate=cross-correction
def log_density(x):
    return logsumexp(-.5*((x-np.array([-2.,2.]))/.5)**2-np.log(.5*np.sqrt(2*np.pi)))-np.log(2)
truth,quadrature_error=quad(lambda x:-np.exp(log_density(x))*log_density(x),-8,8,epsabs=1e-10)
result={"status":"Author REMEDI network and train_model executed on our bimodal synthetic check",
        "source":"https://github.com/viktor765/REMEDI/tree/b6ee9bdd3d141bf564634a56a5bb19b1b7f543e2",
        "source_sha256":{name:hashlib.sha256((args.author_root/name).read_bytes()).hexdigest()
                         for name in ["KNIFE.py","REMEDI.py"]},
        "seed":23,"train_samples":8192,"test_samples":16384,"epochs":30,
        "hidden_dim":[32,32],"base_components":1,
        "data_distribution":"0.5 Normal(-2, 0.5^2) + 0.5 Normal(2, 0.5^2)",
        "base_cross_entropy":cross,"neural_KL_correction":correction,
        "corrected_entropy":estimate,"reference_entropy_quadrature":truth,
        "quadrature_error":quadrature_error,"estimation_error":estimate-truth,
        "limits":["One seed and one static distribution.",
                  "Reference entropy uses numerical quadrature of the known generating density.",
                  "Base is the moment-fitted single Gaussian; the neural correction is trained.",
                  "No physical-time entropy derivative, driver attribution, or LK calculation."]}
(args.output/"metrics.json").write_text(json.dumps(result,indent=2)+"\n")
torch.save(model.state_dict(),args.output/"remedi.pt")
print(json.dumps(result,indent=2))
