function strays_updown(f, X, R)
    xB = X[1]
    xF = X[2]
    xD = X[3]
    xi = X[4]
    yi = X[5]
    x = [xD]
    y = [xD]
    while x[end] > xB
        foo(x) = (f(x) - y[end])
        x = [x; bissection(foo, 0.0, 1.0)]
        if x[end] > xi
            y = [y; R / (R + 1) * x[end] + xD / (R + 1)]
        else
            y = [y; (xB - yi) / (xB - xi) * (x[end] - xB) + xB]
        end
    end
    N = length(x) - 1 - 1 + (x[end-1] - xB) / (x[end-1] - x[end])
    return N, x, y
end