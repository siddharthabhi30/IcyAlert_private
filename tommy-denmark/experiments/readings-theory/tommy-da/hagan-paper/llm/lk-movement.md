I’ll assume you mean **pure LK only—no Kalman or time-varying part yet**.

Start with:

\[
\dot X=a_{11}X+a_{12}Y+\text{noise}.
\]

Ignore noise initially. Let:

\[
\dot X=0.2X+0.5Y.
\]

Suppose \(X=10\):

| \(Y\) | Own contribution \(0.2X\) | \(Y\)’s contribution \(0.5Y\) | \(\dot X\) |
|---:|---:|---:|---:|
| 0 | 2 | 0 | 2 |
| 2 | 2 | 1 | 3 |
| −2 | 2 | −1 | 1 |

Here:

\[
a_{12}=0.5.
\]

Its meaning is:

> Holding \(X\) fixed, increasing \(Y\) by one unit adds \(0.5\) units to the rate of change of \(X\).

So \(a_{12}\) describes how \(Y\) participates in the dynamics of \(X\).

If the time step is one:

\[
X_{\text{next}}\approx X+\dot X.
\]

For \(X=10,Y=2\):

\[
X_{\text{next}}=10+3=13.
\]

The movement from 10 to 13 contains:

- \(+2\) from \(X\)’s own dynamics.
- \(+1\) from \(Y\).

This is the first goal of pure LK: use many observed \(X,Y,\dot X\) values to estimate how much \(Y\) enters \(X\)’s evolution.

We have **not discussed entropy flow yet**. We have only established the dynamical coupling \(a_{12}\).