using Plots

function doplot(dots, updown, f, x, y, data, X, q, R)
    xD = X[1]
    xF = X[2]
    xB = X[3]
    xi = X[4]
    yi = X[5]

    plot(xlabel="x", ylabel="y",
        xlims=(0, 1), ylims=(0, 1),
        legend=false,
        framestyle=:box,
        grid=:true,
        minorgrid=:true,
        size=(500, 400))

    if dots
        X = data[:, 1]
        Y = data[:, 2]
        display(plot!(X, Y,
            seriestype=:line, color=:black, markershape=:circle))
    else
        X = collect(range(0, 1, length=101))
        Y = f.(X)
        display(plot!(X, Y,
            seriestype=:line, color=:black))
    end

    X = [0; 1]
    Y = X
    display(plot!(X, Y,
        seriestype=:line, color=:black,
        linestyle=:dash))

    Y = R / (1 + R) .* X .+ xD / (1 + R)
    display(plot!(X, Y,
        seriestype=:line, color=:blue))

    display(plot!([xD],
        seriestype=:vline, color=:blue,
        linestyle=:dash))

    Y = (xB - yi) / (xB - xi) .* (X .- xi) .+ yi
    display(plot!(X, Y,
        seriestype=:line, color=:red))

    display(plot!([xB],
        seriestype=:vline, color=:red,
        linestyle=:dash))

    Y = q / (q - 1) .* X .- xF / (q - 1)
    display(plot!(X, Y,
        seriestype=:line, color=:magenta))

    display(plot!([xF],
        seriestype=:vline, color=:magenta,
        linestyle=:dash))

    display(x)
    if updown
        display(plot!(x, y,
            seriestype=:steppost, color=:cyan,
            linestyle=:solid))
    else
        display(plot!(x, y,
            seriestype=:steppre, color=:cyan,
            linestyle=:solid))
    end
end