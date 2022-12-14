include("bissection.jl")

@doc raw"""
`stages_updown` scomputes the number of
theoretical stages of equilibrium of
a distillation column using the
McCabe-Thiele method, strating from
the bottom to the top of the column.

`stages_updown` is an auxiliary function of
the `McCabeThiele` toolbox for Julia.
"""
function stages_updown(f, X, R)
    xD = X[1]
    xF = X[2]
    xB = X[3]
    xi = X[4]
    yi = X[5]
    x = [xD]
    y = [xD]
    while x[end] > xB
        foo(x) = (f(x) - y[end])
        x = [x; bissection(foo, 0, 1)]
        if x[end] > xi
            y = [y; R / (R + 1) * x[end] + xD / (R + 1)]
        else
            y = [y; (xB - yi) / (xB - xi) * (x[end] - xB) + xB]
        end
    end
    N = length(x) - 1 - 1 + (x[end-1] - xB) / (x[end-1] - x[end])
    return N, x, y
end