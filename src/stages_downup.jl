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
    xD, xF, xB, xi, yi = X
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
    length(x) - 1 - 1 + (xD - x[end-1]) / (x[end] - x[end-1]), x, y
end