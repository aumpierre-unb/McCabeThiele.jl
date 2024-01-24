@doc raw"""
`McCabeThiele` provides a set of functions to compute 
the number of theoretical stages of a distillation column 
using the McCabe-Thiele method.

Author: Alexandre Umpierre `aumpierre@gmail.com`

Maintainer's repository: `https://github.com/aumpierre-unb/McCabe-Thiele.jl`

Citation (any version): `DOI 10.5281/zenodo.7126164`

See also: `stages`, `refmin`, `qR2S`, `qS2R`, `RS2q`.
"""
module McCabeThiele

using Plots
using Test

export stages, refmin, qR2S, qS2R, RS2q

include("stages.jl")
include("stages_updown.jl")
include("stages_downup.jl")
include("refmin.jl")
include("qR2S.jl")
include("doplots.jl")
include("bisection.jl")
include("interp1.jl")

end