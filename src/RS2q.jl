@doc raw"""
`q=RS2q(X::Vector{Float64}, R::Number, S::Number)`

`RS2q` computes the feed quality
of a distillation column
using the McCabe-Thiele method given
the compositions of the products and the feed,
the reflux ratio at the bottom of the column and
the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

`RS2q` is a main function of
the `McCabeThiele` toolbox for Julia.

See also: `stages`, `refmin`.

Examples
==========
Compute the the feed quality given
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the reflux ratio at the top of the column is 2 and
reflux ratio at the bottom of the column is 2.5:

```
x=[0.88;0.46;0.11];
R=2;
S=2.5;
q=RS2q(x,R,S)
```
"""
function RS2q(X::Vector{Float64}, R::Number, S::Number)
    xD, xF, xB = X
    if xD < xF || xB > xF
        println("Inconsistent feed and/or products compositions.")
        return
    end
    xi = (xB / S + xD / (R + 1)) / ((S + 1) / S - R / (R + 1))
    yi = R / (R + 1) * xi + xD / (R + 1)
    a = (yi - xF) / (xi - xF)
    q = a / (a - 1)
    if q == 1
        q = 1 - 1e-10
    else
        q
    end
end