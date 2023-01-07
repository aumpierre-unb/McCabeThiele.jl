using Plots

@doc raw"""
`doplot` produces a x-y diagram with
a representation of the theoretical stages of equilibrium
computed for a distillation column using the
McCabe-Thiele method.

`doplot` is an auxiliary function of
the `McCabeThiele` toolbox for Julia.
"""
function doplot(dots, updown, f, x, y, data, X, q, R)
    xD = X[1]
    xF = X[2]
    xB = X[3]
    xi = X[4]
    yi = X[5]
    plot(xlabel="x",
        ylabel="y",
        xlims=(0, 1),
        ylims=(0, 1),
        legend=false,
        framestyle=:box,
        grid=:true,
        minorgrid=:true,
        size=(500, 400))
    if dots
        X = data[:, 1]
        Y = data[:, 2]
        plot!(X, Y,
            seriestype=:line,
            color=:black,
            markershape=:circle,
            markersize=3)
    else
        X = collect(range(0, 1, length=101))
        Y = f.(X)
        plot!(X, Y,
            seriestype=:line,
            color=:black)
    end
    X = [0; 1]
    Y = X
    plot!(X, Y,
        seriestype=:line,
        color=:black,
        linestyle=:dash)
    Y = R / (1 + R) .* X .+ xD / (1 + R)
    plot!(X, Y,
        seriestype=:line,
        color=:blue)
    plot!([xD],
        seriestype=:vline,
        color=:blue,
        linestyle=:dash)
    Y = (xB - yi) / (xB - xi) .* (X .- xi) .+ yi
    plot!(X, Y,
        seriestype=:line,
        color=:red)
    plot!([xB],
        seriestype=:vline,
        color=:red,
        linestyle=:dash)
    if q != 1 - 1e-10
        Y = q / (q - 1) .* X .- xF / (q - 1)
        plot!(X, Y,
            seriestype=:line,
            color=:magenta,
            linestyle=:dash)
    end
    plot!([xF],
        seriestype=:vline,
        color=:magenta,
        linestyle=:dash)
    if updown
        display(plot!(x, y,
            seriestype=:steppost,
            color=:cyan,
            linestyle=:solid))
    else
        display(plot!(x, y,
            seriestype=:steppre,
            color=:cyan,
            linestyle=:solid))
    end
end