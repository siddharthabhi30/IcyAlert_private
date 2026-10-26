# Daniel Sørensen: code request and method follow-up

Recorded: 26 October 2026. Source: Daniel's reply pasted by Siddharth into this conversation. The reply was marked confidential; this is a summary for the local working notes, not a public announcement. The request shown in the thread is dated 21 October; the reply's timestamp was not supplied.

## Author and paper

Daniel Sørensen is the first author of [Information-Theoretic Causal Modelling of Semiconductor Process Dynamics](https://arxiv.org/abs/2608.14678). The paper lists imec and KU Leuven affiliations and the address `daniel.sorensen@imec.be`.

The [KU Leuven directory](https://www.kuleuven.be/wieiswie/en/person/00173035) lists Daniel Sorensen as a PhD scholarship holder in DTAI. A [likely matching LinkedIn profile, Daniel S.](https://be.linkedin.com/in/danielssorensen), lists imec and doctoral study with KU Leuven. The LinkedIn match was based on name, field, location, and affiliations, not a confirmed link from the paper. The university profile links [ORCID 0009-0004-5557-0999](https://orcid.org/0009-0004-5557-0999).

## What Daniel confirmed directly

1. He cannot share the implementation because his institution's IP protocols prevent it. This is stronger evidence than merely failing to find a public repository.
2. He has moved away from the wavelet neural network method for the reasons discussed in the paper.
3. He has also moved away from the RET estimation used there. He did not say it is mathematically incorrect; it answers a different question from the one he now wants to address.
4. His example is a joint interaction, \(Y=XZ\). Looking at X's individual contribution can miss an effect involving X and Z together.
5. He plans another publication and hopes to include code if permitted. No title, release date, implementation, or guarantee of code availability was supplied.

## What is already in the public paper

Section II.A, Equation 3, distinguishes individual transfer contributions from a synergetic contribution. The paper does not present the later decision to abandon the RET workflow or the particular \(Y=XZ\) explanation given in the email.

Section IV attributes unstable fitting and graph disagreement to selecting 30 wavelets from more than 20 million candidates. Small data changes could change the selected variable combinations. Increasing the selection size might help, but would be computationally expensive. Similar recipes produced poorly agreeing graphs; one expert classified 39% of the strongest examined links as not possible. The authors explicitly limit what that expert assessment establishes. [Paper, Sections III–IV](https://arxiv.org/pdf/2608.14678).

## What the reply does not establish

- It does not invalidate every nonlinear LK method or the full Pires framework, which includes joint/synergetic terms.
- It does not prove that a pairwise RET always misses every multiplicative interaction.
- It does not make replacing wavelets with another DNN a sufficient repair: fitting quality and the choice of transfer quantity are separate issues.
- It does not provide the missing implementation. The full pipeline remains unavailable from this author under the stated policy.

The implication for our learning is to distinguish good prediction of the recorded changes from good estimation of the specific interaction we want to measure. See [the calculation and follow-up guide](../llm-remarks/nonlinear-lk-calculation-and-followup.md).
