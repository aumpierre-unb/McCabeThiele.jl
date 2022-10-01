include("stages_updown.jl")
include("stages_downup.jl")
include("interp1.jl")
include("doplots.jl")

@doc raw"""
`stages(f,X,q,R[,updown[,fig]])`

`stages` computes the number of theoretical stages
of a distillation column using the method of McCabe-Thiele, given
a function y = f(x) that relates the liquid fraction x and the vapor fraction y, or
a x-y matrix of the liquid and the vapor fractions,
the vector of the fractions of the products and the feed,
the feed quality q, and
the reflux ratio R at the top of the column.

By default, theoretical stages are computed
from the stripping section to the rectifying section, updown = true.

If updown = false is given, theoretical stages are computed
from the rectifying section to the stripping section.

By default, `stages` plots a schematic diagram of the solution, fig = true.

If fig = false is given, no plot is shown.

See also: `refmin`.

Examples
==========
Compute the number of theoretical stages of a distillation column
from the bottom of the column, given
a matrix that relates the liquid fraction and the vapor fraction,
the composition xB = 11 % of the column's bottom,
the composition xD = 88 % of the distillate,
the composition xF = 46 % of the feed,
the feed quality q = 54 %, and
the reflux ratio at the top of the column 70 % higher that the minimum reflux ratio:

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
x=[0.88 0.46 0.11];
q=0.54;
Rmin=refmin(data,x,q)
R=1.70*Rmin;
N=stages(data,x,q,R,false,false)
```

Compute the number of theoretical stages of a distillation column
from the top of the column, given
the function that compute the vapor fraction given the liquid fraction,
the composition xB = 11 % of the column's bottom,
the composition xD = 88 % of the distillate,
the composition xF = 46 % of the feed,
the feed quality q = 54 %, and
the reflux ratio at the top of the column 70 % higher that the minimum reflux ratio,
and plot a schematic diagram of the solution:

```
f(x)=x.^1.11 .* (1-x).^1.09 + x;
x=[0.88 0.46 0.11];
q=0.54;
Rmin=refmin(data,x,q)
R=1.70*Rmin;
N=stages(f,x,q,R)
```
"""
function stages(data, X, q, R, updown=true, fig=true)
    if isa(data, Matrix)
        f(x) = interp1(data[:, 1], data[:, 2], x)
        dots = true
    else
        f = data
        dots = false
    end
    xD = X[1]
    xF = X[2]
    xB = X[3]
    xi = (xD / (R + 1) + xF / (q - 1)) / (q / (q - 1) - R / (R + 1))
    yi = q / (q - 1) * xi - xF / (q - 1)
    X = [xD xF xB xi yi]
    if updown
        N, x, y = stages_updown(f, X, R)
    else
        N, x, y = stages_downup(f, X, R)
    end
    if fig
        doplot(dots, updown, f, x, y, data, X, q, R)
    end
    return N
end