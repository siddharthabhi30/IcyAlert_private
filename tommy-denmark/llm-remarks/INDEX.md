# IcyAlert LK and Filtering Notes

The latest discussion is consolidated below. The earlier status document remains an experiment/history record; its older next-step suggestions are not a newly agreed plan.

## Read first: current discussion through 26 October

1. [Neural entropy research and Pires equation walkthrough](nonlinear-entropy-research/README.md) — 24 selected papers, public-code audit, nonlinear Lorenz calculation, author-code entropy checks, and possible next experiments.
2. [Nonlinear LK: calculation, assumptions, and follow-up](nonlinear-lk-calculation-and-followup.md) — what happens after fitting a nonlinear function, the two slopes, an explicitly artificial teaching example, model restrictions, discrete samples versus online estimation, and learning prerequisites.
3. [Daniel Sørensen's code and method response](../mails-and-imp-notes/daniel-sorensen-code-and-method-followup.md) — author-confirmed code restrictions, why he changed direction, published limitations, and the individual-versus-joint interaction issue.

## 22 October meeting notes

[Nonlinear information flow, Gaussian mixtures, and neural estimators](nonlinear-information-flow-meeting-2026-10-22.md): the two handwritten pages and email context, with explanations of GMM, entropy bounds, MINE, SMILE, nonlinear process fitting, and unresolved questions.

## Reading order

1. [IcyAlert LK and Filtering: Evidence, Results, and Next Decisions](icyalert-lk-filtering-status.md)

After reading it, you should be able to explain:

- which covariance appears in original LK, Hagan/Zhou, Docquier, and Wang;
- what our two-variable EnKF/Kalman experiment established;
- why current-time ensemble covariance, posterior covariance, rolling windows, and pooled time–ensemble samples are different choices;
- which questions still require agreement with Stéphane, David, Nir, and Tommy;
- what experiment and reading should happen next.

## Source entry points

The consolidated document links to the local paper dumps and primary online papers. The most important local sources are:

- [Vannitsem et al. 2019](../papers/vannitsem-2019/paper-dump.md)
- [Pires et al. 2024](../papers/pires/paper-dump.md)
- [Hagan et al. 2019](../papers/hagan/paper_dump.md)
- [Wang et al. 2025](../papers/wang-2025-causality-localization/paper-dump.md)
- [Liang foundational paper](../papers/information-flow-liang/paper-dump.md)
- [Docquier Arctic paper](../papers/docquier-arctic/paper-dump.md)
- [Team-mail record](../mails-and-imp-notes/mail-raw-interpretation.md)

## Refactor mapping

| Previous file | New destination |
|---|---|
| `claude-point-on-first-deep-search.md` | Dynamic-versus-static evidence and evidence gaps |
| `dynamic-lk.md` | Docquier and rolling-window evidence |
| `live-covariance-evidence-and-options.md` | Covariance definitions, candidate estimators, low-\(R\) nuance, and next benchmark |
| `more-info.md` | David Docquier’s role, papers, and meeting questions |
| `more-paper-2.md` | David’s research trajectory and method-specific evidence |
| `more-paper.md` | Later spatial reconstruction methods |
| `readings-suggested.md` | Completed experiments, prioritized reading, and next actions |
| `beyond-2019-further-papers.md` | Hagan reproducibility gap, related methods, limitations, and later reading |

True duplicates, speculative filler, repeated biographies, and unsupported method rankings were removed. Unresolved claims remain explicitly labelled as unresolved.
