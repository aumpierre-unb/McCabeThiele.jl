include("stages_updown.jl")
include("stages_downup.jl")

@doc raw"""
`N=xyRq2N(data::Matrix{Float64}, X::Vector{Float64}, q::Number, R::Number, updown::Bool=true)`

`xyRq2N` computes the number of theoretical stages
of a distillation column
using the McCabe-Thiele method given
a function y = y(x) that relates
the liquid fraction x and the vapor fraction y or
a x-y matrix of the liquid and the vapor fractions,
the vector of products and feed compositions,
the feed quality, and
the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

By default, theoretical stages are computed
from the stripping section to the rectifying section, updown = true.

If updown = false is given, theoretical stages are computed
from the rectifying section to the stripping section.

`xyRq2N` is is an internal function of
the `McCabeThiele` toolbox for Julia.
"""
function xyRq2N(f, X, q, R, updown::Bool=true)
    xD, xF, xB = X
    xi = (xD / (R + 1) + xF / (q - 1)) / (q / (q - 1) - R / (R + 1))
    yi = q / (q - 1) * xi - xF / (q - 1)
    X = [X; xi; yi]
    if updown
        N, x, y = stages_updown(f, X, R)
    else
        N, x, y = stages_downup(f, X, R)
    end
    N, X, x, y
end
