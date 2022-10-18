function interp1(X, Y, x)
    for i = 1:length(X)-1
        if X[i] <= x <= X[i+1]
            return (Y[i+1] - Y[i]) / (X[i+1] - X[i]) * (x - X[i]) + Y[i]
        end
    end
end