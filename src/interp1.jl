@doc raw"""
`interp1` computes the interpolation of a number.

`interp1` is an internal function of
the `McCabeThiele` toolbox for Julia.
"""
function interp1(X, Y, x)
    for i = 1:length(X)-1
        if X[i] <= x <= X[i+1]
            (Y[i+1] - Y[i]) / (X[i+1] - X[i]) * (x - X[i]) + Y[i]
        end
    end
end
