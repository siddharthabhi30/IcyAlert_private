# PDF and Text Verification Report

## Result

- Selected papers: **20**
- Verified full local PDFs: **18**
- Complete full-text dumps: **20**
- Text extraction method: `pdftotext -layout`
- OCR required: **0** verified PDFs; all contained usable text layers.
- Manual PDF downloads still needed: **2**

The machine-readable audit is in `pdf-audit.tsv`.

## Manual downloads needed

### 06 — Vannitsem et al. (2019)

- DOI: https://doi.org/10.1029/2019GL084329
- Institutional record: https://orfeo.belnet.be/handle/internal/7473
- Attempted PDF: `https://orfeo.belnet.be/bitstream/handle/internal/7473/grl-VDG-2019-final.pdf?sequence=2&isAllowed=y`
- Failure: HTTP 403 from command-line retrieval.
- Current local state: complete publisher full-text dump and summary are present; `paper.pdf` is absent.

### 19 — Lv et al. (2025)

- DOI: https://doi.org/10.1029/2025JC022344
- Open article: https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2025JC022344
- Attempted PDF: `https://agupubs.onlinelibrary.wiley.com/doi/pdfdirect/10.1029/2025JC022344`
- Failure: HTTP 403 from command-line retrieval.
- Current local state: complete full-text dump and summary are present; `paper.pdf` is absent.

## Verification rule

A file was accepted as a paper PDF only when `pdfinfo` parsed it successfully. HTML challenge pages and interrupted downloads were rejected. The full-text dump records its DOI and PDF source at the top when it came from a verified PDF.
