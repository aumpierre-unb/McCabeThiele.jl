@doc raw"""
`S=qR2S(X,q,R)`

`qR2S` computes the reflux ratio at the bottom of the column, given
the compositions of the feed and the products,
the feed quality, and
the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

See also: `stages`, `refmin`.

Examples
==========
Compute the reflux ratio at the bottom of the column, given
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed quality is 54 %,
the reflux ratio at the top of the column is 70 % higher
than the minimum reflux ratio::

```
x=[0.88 0.46 0.11];
q=0.54;
r=refmin(data,x,q);
R=1.70*r;
S=qR2S(x,q,R)
```

Compute the reflux ratio at the bottom of the column, given
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed is saturated liquid,
the reflux ratio at the top of the column is 70 % higher
than the minimum reflux ratio:

```
x=[0.88 0.46 0.11];
q=1;
r=refmin(data,x,q);
R=1.70*r;
S=qR2S(x,q,R)
```

"""
function qR2S(X, q, R)
    if q == 1
        q = 1 - 1e-10
    end
    xD = X[1]
    xF = X[2]
    xB = X[3]
    xi = (xD / (R + 1) + xF / (q - 1)) / (q / (q - 1) - R / (R + 1))
    yi = q / (q - 1) * xi - xF / (q - 1)
    alpha = (yi - xB) / (xi - xB)
    return 1 / (alpha - 1)
end