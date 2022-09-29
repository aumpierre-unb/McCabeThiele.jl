function strays_downup(f, X, R)
    xB = X[1]
    xF = X[2]
    xD = X[3]
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