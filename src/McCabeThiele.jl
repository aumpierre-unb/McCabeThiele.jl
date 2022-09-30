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
module McCabeThiele

using Plots
using Test

export stages

include("stages.jl")
include("stages_updown.jl")
include("stages_downup.jl")
include("refmin.jl")
include("doplots.jl")
include("bissection.jl")
include("interp1.jl")

end