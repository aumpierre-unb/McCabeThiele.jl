@doc raw"""
`stages_downup` scomputes the number of
theoretical stages of equilibrium of
a distillation column using the
McCabe-Thiele method, strating from
the bottom to the top of the column.

`stages_downup` is an internal function of
the `McCabeThiele` toolbox for Julia.
"""
function stages_downup(f, X, R)
    xD = X[1]
    xF = X[2]
    xB = X[3]
    xi = X[4]
    yi = X[5]
    y = [xB]
    x = [xB]
    while x[end] < xD
        y = [y; f(x[end])]
        if y[end] < yi
            x = [x; (y[end] - yi) / ((xB - yi) / (xB - xi)) + xi]
        else
            x = [x; (y[end] - xD / (R + 1)) * (R + 1) / R]
        end
    end
    N = length(x) - 1 - 1 + (xD - x[end-1]) / (x[end] - x[end-1])
    return N, x, y
end