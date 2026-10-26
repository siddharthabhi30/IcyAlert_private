"""Independent teaching reconstruction of Pires et al. (2024), not author code.

Source: arXiv:2307.10623v2, Eqs. 37a, 71, 72e; Section 6.2.
Continuous-time, noise-free Lorenz, sampled at dt. No climate data or DNN.
Run: python lorenz_walkthrough.py --output results/lorenz
"""
import argparse
import json
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from numpy.polynomial import Polynomial
from scipy.integrate import solve_ivp

MU = np.array([0., 0., 22.61])
SD = np.array([7.74, 8.76, 8.35])
POWERS = np.array([[0,0,0], [1,0,0], [0,1,0], [0,0,1], [2,0,0],
                   [1,1,0], [1,0,1], [0,2,0], [0,1,1], [0,0,2]])

def drift(_, x):
    """Eq. 71 with sigma=10, Ra=27, beta=8/3, b=alpha_m=0."""
    a = 10 * SD[1] / SD[0]
    b = SD[0] / SD[1] * (27 - MU[2])
    c = SD[0] * SD[2] / SD[1]
    d = SD[0] * SD[1] / SD[2]
    return np.array([a*x[1]-10*x[0], b*x[0]-c*x[0]*x[2]-x[1],
                     d*x[0]*x[1]-(8/3)*x[2]-(8/3)*MU[2]/SD[2]])

def features(x):
    """x: [samples, 3] -> ten degree-at-most-two monomials [samples, 10]."""
    return np.prod(x[:, None, :] ** POWERS[None, :, :], axis=-1)

def pair_flow(coef, fit_x, eval_x, target, driver, degree):
    """Termwise Eq. 37a. Slopes are with respect to target value, not time."""
    total = np.zeros(len(eval_x))
    for coefficient, powers in zip(coef, POWERS):
        if powers[driver] == 0:
            continue
        outer = powers.copy()
        outer[[target, driver]] = 0
        outer_values = np.prod(fit_x ** outer, axis=1)
        driver_values = fit_x[:, driver] ** powers[driver]
        mean_outer = Polynomial.fit(fit_x[:, target], outer_values, degree)
        mean_driver = Polynomial.fit(fit_x[:, target], driver_values, degree)
        u = eval_x[:, target]
        total += coefficient * u**powers[target] * mean_outer(u) * mean_driver.deriv()(u)
    return float(total.mean())

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=Path("results/lorenz"))
    parser.add_argument("--dt", type=float, default=.01)
    parser.add_argument("--duration", type=float, default=1200.)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    burn = 100.
    times = np.arange(0, burn + args.duration + args.dt/2, args.dt)
    solution = solve_ivp(drift, (0, times[-1]), (np.array([1.,1.,1.])-MU)/SD,
                         t_eval=times, rtol=1e-9, atol=1e-11, max_step=.02)
    if not solution.success:
        raise RuntimeError(solution.message)
    x = solution.y.T[times >= burn]
    times = times[times >= burn]
    rate = np.diff(x, axis=0) / args.dt
    states = x[:-1]
    split = len(states)//2
    fit_x, eval_x = states[:split], states[split:]
    fit_rate, eval_rate = rate[:split], rate[split:]
    # MF fits observed one-step changes, not the known drift used to generate data.
    learned, *_ = np.linalg.lstsq(features(fit_x), fit_rate, rcond=None)
    exact = np.zeros((10,3))
    exact[1,0], exact[2,0] = -10, 10*SD[1]/SD[0]
    exact[1,1], exact[2,1], exact[6,1] = SD[0]/SD[1]*(27-MU[2]), -1, -SD[0]*SD[2]/SD[1]
    exact[0,2], exact[3,2], exact[5,2] = -(8/3)*MU[2]/SD[2], -8/3, SD[0]*SD[1]/SD[2]
    conditional_results = {}
    for degree in [2, 6, 10]:
        conditional_results[str(degree)] = {
            "known_model_T3_to_2": pair_flow(exact[:,1], fit_x, eval_x, 1, 2, degree),
            "fitted_model_T3_to_2": pair_flow(learned[:,1], fit_x, eval_x, 1, 2, degree)}
    linear, *_ = np.linalg.lstsq(np.column_stack([np.ones(split),fit_x]), fit_rate, rcond=None)
    c = np.cov(eval_x.T)
    # Same full covariance-form estimator as least-squares coefficient times Cij/Cii.
    dc = np.cov(np.column_stack([eval_x,eval_rate]).T)[:3,3:]
    covariance_coefficients = np.linalg.solve(c,dc)
    flow_covariance = covariance_coefficients[2,1]*c[1,2]/c[1,1]
    linear_flow = linear[3,1]*c[1,2]/c[1,1]
    m1 = Polynomial.fit(fit_x[:,1], fit_x[:,0], 10)
    m3 = Polynomial.fit(fit_x[:,1], fit_x[:,2], 10)
    u = np.linspace(*np.quantile(eval_x[:,1],[.005,.995]), 400)
    weight = -SD[0]*SD[2]/SD[1]
    local = weight*m1(u)*m3.deriv()(u)
    contributions = weight*m1(eval_x[:,1])*m3.deriv()(eval_x[:,1])
    np.savez_compressed(args.output/"samples.npz", time=times, state=x,
                        fitted_drift_coefficients=learned, exact_drift_coefficients=exact,
                        powers=POWERS, target_grid=u, conditional_x1=m1(u),
                        conditional_x3=m3(u), slope_x3=m3.deriv()(u), contribution=local)
    metrics = {
        "status": "Independent reconstruction; not full paper replication or author implementation",
        "source": "https://arxiv.org/pdf/2307.10623v2", "source_equations": ["37a","71","72e","79c"],
        "parameters": {"sigma":10,"Ra":27,"beta":8/3,"mu":MU.tolist(),"sd":SD.tolist()},
        "dt":args.dt,"duration":args.duration,"burn":burn,"samples":len(states),
        "fitting_samples":split,"evaluation_samples":len(eval_x),
        "empirical_means":x.mean(0).tolist(),"empirical_sd":x.std(0).tolist(),
        "conditional_degree_results":conditional_results,
        "linear_full_covariance_same_evaluation_series_T3_to_2":float(flow_covariance),
        "linear_fit_first_half_T3_to_2":float(linear_flow),
        "degree10_known_formula_direct_check":float(contributions.mean()),
        "published_minimal_CSM_79c_approximation":-.883,
        "our_reconstruction_of_79c":float(weight*.88*.136*np.mean(eval_x[:,1]**2)),
        "MF_forward_rate_test_RMSE":np.sqrt(np.mean((features(eval_x)@learned-eval_rate)**2,0)).tolist(),
        "MF_exact_drift_test_RMSE":np.sqrt(np.mean((features(eval_x)@learned-drift(0,eval_x.T).T)**2,0)).tolist(),
        "notes":["Numerical deterministic benchmark, not real climate observations.",
                 "Rates are nats per Lorenz model time unit, not bits or probabilities.",
                 "Halves share one long trajectory; no independent-seed uncertainty estimate.",
                 "Forward differences bias finite-dt fitted coefficients.",
                 "No diffusion fit: true process noise is zero, numerical residuals are not physical noise.",
                 "Stationary time averages are used; this does not implement transient online estimation."]}
    (args.output/"metrics.json").write_text(json.dumps(metrics,indent=2)+"\n")
    fig,axs=plt.subplots(2,2,figsize=(11,7),constrained_layout=True)
    axs[0,0].scatter(eval_x[::40,1],eval_x[::40,2],s=2,alpha=.1,color="gray")
    axs[0,0].plot(u,m3(u),color="black",label="Fitted mean X3 given X2")
    axs[0,0].set(xlabel="Target X2 value",ylabel="X3",title="1. Conditional average, degree 10")
    axs[0,0].legend()
    axs[0,1].plot(u,m3.deriv()(u),color="darkblue")
    axs[0,1].set(xlabel="Target X2 value",ylabel="d mean(X3 | X2) / dX2",title="2. Slope with respect to X2")
    axs[1,0].plot(u,local,color="darkred")
    axs[1,0].set(xlabel="Target X2 value",ylabel="Local transfer contribution",title="3. Multiply by conditional X1 and coefficient")
    rows=conditional_results["10"]
    labels=["Known nonlinear\nEq. 72e","Fitted nonlinear\nEq. 37a","Linear full\ncovariance"]
    vals=[rows["known_model_T3_to_2"],rows["fitted_model_T3_to_2"],flow_covariance]
    bars=axs[1,1].bar(labels,vals,color=["darkred","slateblue","gray"])
    axs[1,1].bar_label(bars,labels=[f"{v:.3g}" for v in vals],padding=4)
    axs[1,1].axhline(0,color="black",lw=.6)
    axs[1,1].set(ylabel="nats per model time unit",title="4. Average over evaluation samples",
                 ylim=(min(vals)*1.25,.12))
    fig.suptitle("Lorenz 3 → 2: independent reconstruction of the calculation")
    fig.savefig(args.output/"lorenz_steps.png",dpi=160)
    plt.close(fig)
    print(json.dumps(metrics,indent=2))

if __name__ == "__main__":
    main()
