@doc raw"""
`S=qR2S(R,X,q)`

`qR2S` computes the reflux ratio at the bottom of the column, given
the reflux ratio at the top of the column,
the vector of the fractions of the products and the feed, and
the feed quality.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

See also: `stages`, `refmin`.

Examples
==========
Compute the reflux ratio at the bottom of the column, given
the reflux ratio R = 2 at the top of the column,
the composition of the column's bottom is 11 %,
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the feed quality is 54 %:

```
R=2;
x=[0.88 0.46 0.11];
q=0.54;
S=qR2S(R,x,q)
```
"""
function qR2S(R, X, q)
    if q == 1
        q = 1 - 1e-10
    end
    xD = X(1)
    xF = X(2)
    xB = X(3)
    xi = (xD / (R + 1) + xF / (q - 1)) / (q / (q - 1) - R / (R + 1))
    yi = q / (q - 1) * xi - xF / (q - 1)
    alpha = (yi - xB) / (xi - xB)
    return 1 / (alpha - 1)
end