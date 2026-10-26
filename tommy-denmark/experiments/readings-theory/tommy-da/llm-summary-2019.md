Let us do only the 2019 paper, end to end.

Suppose the complete recorded dataset is:

| Time | \(X_1\) | \(X_2\) |
|---|---:|---:|
| 1 | 1 | 10 |
| 2 | 2 | 11 |
| 3 | 3 | 13 |
| 4 | 4 | 16 |
| 5 | 5 | 20 |

Here \(X_1\) and \(X_2\) are simply two measured variables.

### 1. Calculate changes

Because the complete dataset is already recorded:

| Time | \(X_1\) | \(X_2\) | \(\dot X_1\) | \(\dot X_2\) |
|---|---:|---:|---:|---:|
| 1 | 1 | 10 | \(2-1=1\) | \(11-10=1\) |
| 2 | 2 | 11 | \(3-2=1\) | \(13-11=2\) |
| 3 | 3 | 13 | \(4-3=1\) | \(16-13=3\) |
| 4 | 4 | 16 | \(5-4=1\) | \(20-16=4\) |

Now there are multiple pairs:

\[
(X_1,\dot X_2)=(1,1),(2,2),(3,3),(4,4)
\]

Therefore, covariance between \(X_1\) and \(\dot X_2\) can be calculated. It is **not calculated from one point**.

### 2. Estimate \(Q_t\) and \(R_t\)

Using a moving window over these sequences, they estimate:

- \(Q_t\): uncertainty in their statistical transition model.
- \(R_t\): uncertainty in the measured data.

### 3. Kalman happens here

At time 1:

```text
predict x̂1⁻ and P1⁻
use measurement 1 to correct x̂1
update covariance to P1
```

At time 2:

```text
use x̂1 and P1 to predict x̂2⁻ and P2⁻
use measurement 2 to correct x̂2
update covariance to P2
```

Repeat for times 3 and 4.

The corrected state \(\hat x_t\) is used to make the next prediction. It is **not abandoned**.

### 4. LK happens after every Kalman update

After time 1:

\[
P_1\rightarrow\text{LK}\rightarrow
T_{1\rightarrow2}(1),T_{2\rightarrow1}(1)
\]

After time 2:

\[
P_2\rightarrow\text{LK}\rightarrow
T_{1\rightarrow2}(2),T_{2\rightarrow1}(2)
\]

And so forth.

LK reads covariance entries representing:

- \(X_1\) with \(X_2\),
- \(X_1\) with \(\dot X_2\),
- \(X_2\) with \(\dot X_1\).

Final output:

```text
time 1: X1→X2 strength, X2→X1 strength
time 2: X1→X2 strength, X2→X1 strength
time 3: X1→X2 strength, X2→X1 strength
...
```

Important honesty: the 2019 paper does not clearly specify exactly how the original and derivative series are arranged inside its Kalman state/measurement vectors. But its stated algorithm is unambiguous about the purpose:

> The corrected state continues the filter; the Kalman covariance \(P_t\) is inserted into LK after each update.