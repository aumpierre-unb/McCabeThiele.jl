function stages(data, X, q, R, updown, fig=true)
    if isa(data, Matrix)
        f(x) = interp1(data[:, 1], data[:, 2], x)
        dots = true
    else
        f = data
        dots = false
    end
    xB = X[1]
    xF = X[2]
    xD = X[3]
    xi = (xD / (R + 1) + xF / (q - 1)) / (q / (q - 1) - R / (R + 1))
    yi = q / (q - 1) * xi - xF / (q - 1)
    X = [xB xF xD xi yi]
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