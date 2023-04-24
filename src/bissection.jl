@doc raw"""
`bissection` computes computes the root of
a function using the method of bissection
given it is found between the guess values.

`bissection` is an internal function of
the `McCabeThiele` toolbox for Julia.
"""
function bissection(f, x1, x2)
    while abs(f(x2)) > 1e-4
        x = (x1 + x2) / 2
        if f(x) * f(x1) > 0
            x1 = x
        else
            x2 = x
        end
    end
    x2
end
