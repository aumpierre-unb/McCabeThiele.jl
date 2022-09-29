function bissection(f, x1, x2)
    while abs(f(x2)) > 1e-4
        x = (x1 + x2) / 2
        if f(x) * f(x1) > 0
            x1 = x
        else
            x2 = x
        end
    end
    return x2
end