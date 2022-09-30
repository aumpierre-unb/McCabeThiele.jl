@doc raw"""

`McCabeThiele` provides a set of functions to compute 
the number of theoretical stages of distillatiob columns 
using the method of McCabe-Thiele.

All function offer the option of plotting the solution 
on a schematic Moody diagram. Check the functions' syntaxes at Julia's help.

See also: `stages`, `refmin`.
"""
module McCabeThiele

using Plots
using Test

export stages, refmin

include("stages.jl")
include("stages_updown.jl")
include("stages_downup.jl")
include("refmin.jl")
include("doplots.jl")
include("bissection.jl")
include("interp1.jl")

end