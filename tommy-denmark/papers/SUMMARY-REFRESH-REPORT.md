# Older LK Summary Refresh

## Scope

Twelve existing LK-related summaries were re-read against their local full paper dumps and rewritten in place. The four other old summaries (`bussy-smoother`, `general-da-geoscience-review`, `kalman-3dvar-chapter`, and `lorenc-1986-3dvar`) were not changed because they are not LK causality papers.

The replaced files are archived under `_archive/` so no potentially useful old detail is silently lost. Those archived files are unaudited and must not be treated as authoritative.

## Files refreshed

| Folder | Summary file | Main correction |
|---|---|---|
| `information-flow-liang` | `gemini_summary.md` | Removed the unsupported conclusion that Liang proves forecast covariance is correct and analysis covariance is invalid. |
| `liang-2014-original` | `gemini_summary.md` | Kept the time-series estimator and assumptions separate from later filter interpretations. |
| `vannitsem-2019` | `gemini_summary.md` | Removed claims that a free ensemble “perfectly” gives physical causality or that the paper compares forecast and analysis covariance. |
| `hagan` | `gemini_summary.md` | Corrected the role of the Kalman filter and removed the claim that wavelets eliminate hidden confounding. |
| `hagan-zhou-2024-mtvlk` | `gemini_summary.md` | Removed “perfect recovery” and overly strong real-world causal conclusions; documented Q/R estimation. |
| `pires` | `gemini_summary.md` | Separated the paper's transient-ensemble theory from our proposed Pf/Pa interpretation. |
| `lien-2025-lim-lk` | `gemini_summary.md` | Clarified LIM, lagged covariance, and white-versus-colored noise. |
| `siddiqui-et-al` | `gemini_summary.md` | Replaced “true causal reality/cutting edge” language with the actual conditioned comparison and preprint limitations. |
| `co2-lk-thing` | `llm-summary.md` | Preserved rolling-window provenance while stating that 250 days is application-specific and not instantaneous truth. |
| `docquier-arctic` | `gemini_summary.md` | Corrected the variable count and replaced dataset guesses with the paper's actual member/time analyses. |
| `wang-2020` | `summary.md` | Rebuilt the long summary around the verified multiscale sliding-window method and its spatial meaning. |
| `wang-2025-causality-localization` | `gemini_summary.md` | Removed hype and universal performance claims; emphasized static pre-DA LK localization. |

## Common structure now used

Every revised summary states:

1. the paper's question;
2. data or model used;
3. actual methodology;
4. where covariance/statistics come from;
5. principal result;
6. IcyAlert relevance;
7. limitations and claims the paper does not establish;
8. DOI/code/source-dump provenance.

## Preservation result

- Original paper dumps: unchanged.
- Original summary files: archived before replacement.
- New claims: restricted to the source dumps; project interpretations are labeled separately.
