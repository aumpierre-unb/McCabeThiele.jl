include("bissection.jl")
include("interp1.jl")

@doc raw"""
`r=refmin(y,X,q)`

`refmin` computes the minimum value of the reflux ratio
of a distillation column, given
a function y = y(x) that relates the liquid fraction x and the vapor fraction y, or
a x-y matrix of the liquid and the vapor fractions,
the vector of the fractions of the distillate and the feed, and
the feed quality.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

See also: `stages`, `qR2S`.

Examples
==========
Compute the minimum value of the reflux ratio
of a distillation column, given
a matrix that relates the liquid fraction and the vapor fraction,
the composition of the column's bottom is 11 %,
the composition of the distillate is 88 %, and
the feed quality is 54 %:

```
data=[0.  0.;
      0.1 0.212;
      0.2 0.384;
      0.3 0.529;
      0.4 0.651;
      0.5 0.752;
      0.6 0.833;
      0.7 0.895;
      0.8 0.942;
      0.9 0.974;
      1.  1.];
x=[0.88 0.46];
q=0.54;
r=refmin(data,x,q)
```

Compute the number of theoretical stages of a distillation column
from the top of the column, given
the function that compute the vapor fraction given the liquid fraction,
the composition of the column's bottom is 11 %,
the composition of the distillate is 88 %, and
the feed quality is 54 %:

```
y(x)=x.^1.11 .* (1-x).^1.09 + x;
x=[0.88 0.46];
q=0.54;
r=refmin(y,x,q)
```
"""
function refmin(data, X, q)
    if q == 1
        q = 1 - 1e-10
    end
    if isa(data, Matrix)
        y(x) = interp1(data[:, 1], data[:, 2], x)
    else
        f = data
    end
    xD = X[1]
    xF = X[2]
    foo(x) = y(x) - (q / (q - 1) * x - xF / (q - 1))
    xi = bissection(foo, 0, 1)
    yi = q / (q - 1) * xi - xF / (q - 1)
    alpha = (xD - yi) / (xD - xi)
    return alpha / (1 - alpha)
end