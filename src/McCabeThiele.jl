@doc raw"""

`McCabeThiele` xxxxxxxxx

#=
data(x)=x.^1.11 .* (1-x).^1.09 + x;
x=[0.1 0.5 0.9];
q=0.54;
R=refmin(data,x,q)
R=1.7*R;
N=strays(data,x,q,R,true)
N=strays(data,x,q,R,false,false)
=#

#=
data2=[0.  0.;
      0.1 0.212;
      0.2 0.384;
      0.3 0.529;
      0.4 0.651;
      0.5 0.752;
      0.6 0.833;
      0.7 0.895;
      0.8 0.942;
      0.9 0.974;
      1.  1.];
x=[0.11 0.55 0.88];
q=0.54;
R=refmin(data2,x,q)
R=1.7*R;
N=strays(data2,x,q,R,true)
N=strays(data2,x,q,R,false,false)
=#

See also: `Re2f`.
"""
module InternalFluidFlow

using Plots
using Test

export strays

include("Re2f.jl")
include("f2Re.jl")
include("hDeps2fRe.jl")
include("hveps2fRe.jl")
include("hvthk2fRe.jl")
include("hQeps2fRe.jl")
include("hQthk2fRe.jl")
include("laminar.jl")
include("turb.jl")
include("smooth.jl")
include("rough.jl")
include("bissecao.jl")
include("figure.jl")

end