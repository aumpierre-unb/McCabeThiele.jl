# McCabeThiele.jl

[![DOI](https://zenodo.org/badge/543161141.svg)](https://doi.org/10.5281/zenodo.7126164)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![version](https://juliahub.com/docs/McCabeThiele/version.svg)](https://juliahub.com/ui/Packages/McCabeThiele/WauTj)

## Installing and Loading McCabeThiele

McCabeThiele can be installed and loaded either
from the JuliaHub repository (last released version) or from the
[maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).

### Last Released Version

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

### Pre-Release (Under Construction) Version

The pre-release (under construction) version of McCabeThiele
can be installed from the [maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).

```julia
using Pkg
Pkg.add(path="https://github.com/aumpierre-unb/McCabeThiele.jl")
using McCabeThiele
```

## Citation of McCabeThiele

You can cite all versions (both released and pre-released), by using
[10.5281/zenodo.7126164](https://doi.org/10.5281/zenodo.7126164).
This DOI represents all versions, and will always resolve to the latest one.

<!--For citation of the last released version of McCabeThiele, please check CITATION file at the [maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).-->

## The McCabeThiele Module for Julia

McCabeThiele provides the following functions:

- **stages**
- **refmin**
- **qR2S**

### **stages**

stages computes the number of theoretical stages of a distillation column using the McCabe-Thiele method, given a function or a matrix of the liquid and the vapor fraction, the compositions of the feed and the products, the feed quality, and the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1, feed quality is reset to q = 1 - 1e-10.

By default, theoretical stages are computed from the stripping section to the rectifying section, updown = true.

If updown = false is given, theoretical stages are computed from the rectifying section to the stripping section.

By default, stages plots a schematic diagram of the solution, fig = true.

If fig = false is given, no plot is shown.

**Syntax:**

```julia
N=stages(data::Union{Matrix{Float64},Function},X::Vector{Float64};
  q::Number=NaN,R::Number=NaN,S::Number=NaN,updown::Bool=true,fig::Bool=true)
```

**Examples:**

Compute the number of theoretical stages of a distillation column from the bottom to the top of the column given a matrix that relates the liquid fraction and the vapor fraction, the composition of the distillate is 88 %, the composition of the feed is 46 %, the composition of the column's bottom product is 11 %, the feed is a liquid-vapor equilibrium with 0.46 vapor at the feed stage and the reflux ratio at the top of the column is 70 % higher than the minimum reflux ratio:

```julia
data=[0.  0.;
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
x=[0.88;0.46;0.11];
qf=1-0.46;
r,s=refmin(data,x,qf)
N=stages(data,x,q=qf,R=1.70*r,updown=false,fig=false)
```

Compute the number of theoretical stages of a distillation column from the top to the bottom of the column given the function that compute the vapor fraction given the liquid fraction, the composition of the distillate is 88 %, the composition of the feed is 46 %, the composition of the column's bottom product is 11 %, the feed is saturated liquid at the feed stage and the reflux ratio at the top of the column is 70 % higher than the minimum reflux ratio and plot a schematic diagram of the solution:

```julia
y(x)=x.^0.9 .* (1-x).^1.2 + x;
x=[0.88;0.46;0.11];
qf=1;
r,s=refmin(y,x,qf)
N=stages(y,x,q=qf,R=1.70*r)
```

### **refmin**

refmin computes the minimum value of the reflux ratio of a distillation column using the McCabe-Thiele method, given a function or a matrix of the liquid and the vapor fraction, the compositions of the feed and the distillate, and the feed quality.

If feed is a saturated liquid, feed quality q = 1, feed quality is reset to q = 1 - 1e-10.

**Syntax:**

```julia
r,s=refmin(data::Union{Matrix{Float64},Function},X::Vector{Float64},q::Number)
```

**Examples:**

Compute the minimum value of the reflux ratio of a distillation column given a matrix that relates the liquid fraction and the vapor fraction, the composition of the distillate is 88 %, the composition of the feed is 46 %, the composition of the column's bottom product is 11 % and the feed is a liquid-vapor equilibrium with 0.46 vapor at the feed stage:

```julia
data=[0.  0.;
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
x=[0.88;0.46;0.11];
q=1-0.46;
r,s=refmin(data,x,q)
```

Compute the minimum value of the reflux ratio of a distillation column given the function that compute the vapor fraction given the liquid fraction, the composition of the distillate is 88 %, the composition of the feed is 46 %, the composition of the column's bottom product is 11 % and the feed is saturated liquid at the feed stage:

```julia
y(x)=x.^0.9 .* (1-x).^1.2 + x;
x=[0.88;0.46;0.11];
q=1;
r,s=refmin(y,x,q)
```

### **qR2S**

qR2S computes the reflux ratio at the bottom of the column, given the compositions of the feed and the products, the feed quality, and the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1, feed quality is reset to q = 1 - 1e-10.

**Syntax:**

```julia
S=qR2S(X::Vector{Float64},q::Number,R::Number)
```

**Examples:**

Compute the reflux ratio at the bottom of the column given the composition of the distillate is 88 %, the composition of the feed is 46 %, the composition of the column's bottom product is 11 %, the feed is saturated liquid q = 1 and the reflux ratio at the top of the column is 2:

```julia
x=[0.88;0.46;0.11];
q=1;
R=2;
S=qR2S(x,q,R)
```

### **qS2R**

qS2R computes the reflux ratio at the top of a distillation column using the McCabe-Thiele method given the compositions of the products and the feed, the feed quality and the reflux ratio at the bottom of the column.

If feed is a saturated liquid, feed quality q = 1, feed quality is reset to q = 1 - 1e-10.

**Syntax:**

```julia
S=qS2R(X::Vector{Float64},q::Number,S::Number)
```

**Examples:**

Compute the reflux ratio at the top of the column given
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed is saturated liquid q = 1 and
the reflux ratio at the bottom of the column is 2.5:

```julia
x=[0.88;0.46;0.11];
q=1;
S=2.5;
R=qS2R(x,q,S)
```

### **RS2q**

RS2q computes the feed quality of a distillation column using the McCabe-Thiele method given the compositions of the products and the feed, the reflux ratio at the bottom of the column and the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1, feed quality is reset to q = 1 - 1e-10.

**Syntax:**

```julia
q=RS2q(X::Vector{Float64}, R::Number, S::Number)
```

**Examples:**

Compute the reflux ratio at the top of the column given
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed is saturated liquid q = 1 and
the reflux ratio at the bottom of the column is 2.5:

```julia
x=[0.88;0.46;0.11];
R=2;
S=2.5;
q=RS2q(x,R,S)
```

### See Also

[PonchonSavarit.jl](https://github.com/aumpierre-unb/PonchonSavarit.jl),
[Psychrometrics.jl](https://github.com/aumpierre-unb/Psychrometrics.jl),
[InternalFluidFlow.jl](https://github.com/aumpierre-unb/InternalFluidFlow.jl).

Copyright &copy; 2022 2023 Alexandre Umpierre

email: <aumpierre@gmail.com>
