@doc raw"""
`qR2S(z::Vector{Float64}, q::Number, R::Number)`

`qR2S` computes the reflux ratio at the bottom
of a distillation column
using the McCabe-Thiele method given
the compositions of the products and the feed,
the feed quality and
the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

`qR2S` is a main function of
the `McCabeThiele` toolbox for Julia.

See also: `stages`, `refmin`, `qS2R`, `RS2q`.

Examples
==========
Compute the reflux ratio at the bottom of the column given
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed is saturated liquid and
the reflux ratio at the top of the column is 2:

```
x=[0.88;0.46;0.11];
q=1;
R=2;
S=qR2S(x,q,R)
```
"""
function qR2S(z::Vector{Float64}, q::Number, R::Number)
    xD, xF, xB = z
    if xD < xF || xB > xF
        error("Inconsistent feed and/or products compositions.")
    end
    if q == 1
        q = 1 - 1e-10
    end
    xi = (xD / (R + 1) + xF / (q - 1)) / (q / (q - 1) - R / (R + 1))
    yi = q / (q - 1) * xi - xF / (q - 1)
    a = (yi - xB) / (xi - xB)
    1 / (a - 1)
end