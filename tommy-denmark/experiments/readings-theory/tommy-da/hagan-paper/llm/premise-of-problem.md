Here, **stationarity means that the statistical behaviour does not change over time**.

It does **not** mean \(X_1\) and \(X_2\) remain constant.

A stationary series may move up and down, but properties such as these remain approximately stable:

- Mean.
- Variance.
- Covariance between \(X_1\) and \(X_2\).
- Dynamical relationship between them.

### Example

Suppose:

- Days 1–50: higher soil moisture tends to reduce temperature.
- Days 51–100: higher soil moisture tends to increase temperature.

The relationship changed. Therefore the complete record is nonstationary.

Original LK calculates one covariance using all 100 days:

\[
C_{12}
=
\operatorname{Cov}(X_1,X_2).
\]

The negative first half and positive second half may cancel, producing a value near zero. LK might then report weak information flow even though the relationship was strong—but different—in both periods.

So Hagan’s sentence means:

> Original LK treats all time samples as if they came from one unchanged statistical relationship.

TvLK tries to replace that one full-record relationship with a changing estimate:

\[
T_{2\rightarrow1}(t).
\]