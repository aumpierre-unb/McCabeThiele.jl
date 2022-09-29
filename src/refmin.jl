function refmin(data, X, q)
    if isa(data, Matrix)
        f(x) = interp1(data[:, 1], data[:, 2], x)
    else
        f = data
    end
    xB = X[1]
    xF = X[2]
    xD = X[3]
    foo(x) = f(x) - (q / (q - 1) * x - xF / (q - 1))
    xi = bissection(foo, xB, xF)
    yi = q / (q - 1) * xi - xF / (q - 1)
    alpha = (xD - yi) / (xD - xi)
    return alpha / (1 - alpha)
end