# McCabeThiele.jl
<!-- 
[![DOI](https://zenodo.org/badge/524550191.svg)](https://zenodo.org/badge/latestdoi/524550191)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![version](https://juliahub.com/docs/InternalFluidFlow/version.svg)](https://juliahub.com/ui/Packages/InternalFluidFlow/zGZKl)
-->

## Installing and Loading McCabeThiele
<!-- 
McCabeThiele can be installed and loaded either
from the JuliaHub repository (last released version) or from the
[maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).
-->

### Last Released Version of McCabeThiele

<!--
The last version of McCabeThiele can be installed from JuliaHub repository:

```julia
using Pkg
Pkg.add("McCabeThiele")
using McCabeThiele
```

If McCabeThiele is already installed, it can be updated:

```julia
using Pkg
Pkg.update("McCabeThiele")
using McCabeThiele
```
-->

### Pre-Release Version (Under Construction)
<!-- 
The next version (under construction) of McCabeThiele
can be installed from the [maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).

```julia
using Pkg
Pkg.add(path="https://github.com/aumpierre-unb/McCabeThiele.jl")
using McCabeThiele
```
-->

## Citation of McCabeThiele
<!-- 
You can cite all versions (both released and pre-released), by using
[DOI 105281/zenodo.7019888](https://doi.org/10.5281/zenodo.7019888).

This DOI represents all versions, and will always resolve to the latest one.

For citation of the last released version of InternalFluidFlow, please check CITATION file at the [maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl). -->

## The McCabeThiele Module for Julia

<!-- 
Internal Fluid Flow provides the following functions:

- Re2f
- f2Re
- hDeps2fDRe
- hveps2fDRe
- hQeps2fDRe
- hvthk2fDRe
- hQthk2fDRe

### Re2f

Re2f computes the Darcy friction f factor, given
the Reynolds number Re and
the relative roughness eps.

By default, pipe is assumed to be smooth, eps = 0.
If eps > 0.05, eps is reset to eps = 0.05.

If fig=true is given, a schematic Moody diagram
is plotted as a graphical representation
of the solution.

**Syntax:**

```dotnetcli
f=Re2f(Re[,eps[,fig]])
```

**Examples:**

Compute the Darcy friction factor f given
the Reynolds number Re = 120,000 and
the relative roughness eps = 0.001:

```julia
Re=1.2e5;eps=1e-3;
f=Re2f(Re,eps)
```

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

-->

Copyright &copy; 2022 Alexandre Umpierre

email: <aumpierre@gmail.com>
