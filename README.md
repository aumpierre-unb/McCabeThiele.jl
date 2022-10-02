# McCabeThiele.jl (Under Construction)

[![DOI](https://zenodo.org/badge/543161141.svg)](https://doi.org/10.5281/zenodo.7126164)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![version](https://juliahub.com/docs/McCabeThiele/version.svg)](https://juliahub.com/ui/Packages/McCabeThiele/WauTj)

## Installing and Loading McCabeThiele

McCabeThiele can be installed and loaded either
from the JuliaHub repository (last released version) or from the
[maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).


### Last Released Version (Under Construction)

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

### Pre-Release Version (Under Construction)

The next version (under construction) of McCabeThiele
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

For citation of the last released version of InternalFluidFlow, please check CITATION file at the [maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).

## The McCabeThiele Module for Julia

McCabeThiele provides the following functions:

- refmin
- stages

### refmin

refmin computes the minimum value of the reflux ratio
of a distillation column, given
a function y = f(x) that relates the liquid fraction x and the vapor fraction y, or
a x-y matrix of the liquid and the vapor fractions,
the vector of the fractions of the distillate and the feed, and
the feed quality q.

**Syntax:**

```dotnetcli
Rmin=refmin(f,X,q)
```

**Examples:**

Compute the minimum value of the reflux ratio
of a distillation column, given
a matrix that relates the liquid fraction and the vapor fraction,
the composition xD = 88 % of the distillate,
the composition xF = 46 % of the feed, and
the feed quality q = 54 %:

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
x=[0.88 0.46];
q=0.54;
Rmin=refmin(data,x,q)
```

Compute the number of theoretical stages of a distillation column
from the top of the column, given
the function that compute the vapor fraction given the liquid fraction,
the composition xD = 88 % of the distillate,
the composition xF = 46 % of the feed,
the feed quality q = 54 %:

```julia
f(x)=x.^1.11 .* (1-x).^1.09 + x;
x=[0.88 0.46];
q=0.54;
Rmin=refmin(f,x,q)
```

### stages

stages computes the number of theoretical stages
of a distillation column using the method of McCabe-Thiele, given
a function y = f(x) that relates the liquid fraction x and the vapor fraction y, or
a x-y matrix of the liquid and the vapor fractions,
the vector of the fractions of the products and the feed,
the feed quality q, and
the reflux ratio R at the top of the column.

By default, theoretical stages are computed
from the stripping section to the rectifying section, updown = true.

If updown = false is given, theoretical stages are computed
from the rectifying section to the stripping section.

By default, stages plots a schematic diagram of the solution, fig = true.

If fig = false is given, no plot is shown.

**Syntax:**

```dotnetcli
stages(f,X,q,R[,updown[,fig]])
```

**Examples:**

Compute the number of theoretical stages of a distillation column
from the bottom of the column, given
a matrix that relates the liquid fraction and the vapor fraction,
the composition xB = 11 % of the column's bottom,
the composition xD = 88 % of the distillate,
the composition xF = 46 % of the feed,
the feed quality q = 54 %, and
the reflux ratio at the top of the column 70 % higher that the minimum reflux ratio:

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
x=[0.88 0.46 0.11];
q=0.54;
Rmin=refmin(data,x,q)
R=1.70*Rmin;
N=stages(data,x,q,R,false,false)
```

Compute the number of theoretical stages of a distillation column
from the top of the column, given
the function that compute the vapor fraction given the liquid fraction,
the composition xB = 11 % of the column's bottom,
the composition xD = 88 % of the distillate,
the composition xF = 46 % of the feed,
the feed quality q = 54 %, and
the reflux ratio at the top of the column 70 % higher that the minimum reflux ratio,
and plot a schematic diagram of the solution:

```julia
f(x)=x.^1.11 .* (1-x).^1.09 + x;
x=[0.88 0.46 0.11];
q=0.54;
Rmin=refmin(f,x,q)
R=1.70*Rmin;
N=stages(f,x,q,R)
```

Copyright &copy; 2022 Alexandre Umpierre

email: <aumpierre@gmail.com>
