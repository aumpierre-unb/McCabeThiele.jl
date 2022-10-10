# McCabeThiele.jl

[![DOI](https://zenodo.org/badge/543161141.svg)](https://doi.org/10.5281/zenodo.7126164)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![version](https://juliahub.com/docs/McCabeThiele/version.svg)](https://juliahub.com/ui/Packages/McCabeThiele/WauTj)

![Illustrative plot | 690x473](https://github.com/aumpierre-unb/McCabeThiele.jl/blob/main/pics/downup_matrix.png "Example of result")

![Illustrative plot | 690x473](https://github.com/aumpierre-unb/McCabeThiele.jl/blob/main/pics/updown_satliq.png "Example of result")

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

For citation of the last released version of McCabeThiele, please check CITATION file at the [maintainer's repository](https://github.com/aumpierre-unb/McCabeThiele.jl).

## The McCabeThiele Module for Julia

McCabeThiele provides the following functions:

- stages
- refmin
- qR2S

### stages

stages computes the number of theoretical stages
of a distillation column using the method of McCabe-Thiele, given
a function or a matrix of the liquid and the vapor fraction,
the compositions of the feed and the products,
the feed quality, and
the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

By default, theoretical stages are computed
from the stripping section to the rectifying section, updown = true.

If updown = false is given, theoretical stages are computed
from the rectifying section to the stripping section.

By default, stages plots a schematic diagram of the solution, fig = true.

If fig = false is given, no plot is shown.

**Syntax:**

```dotnetcli
N=stages(y,X,q,R[,updown[,fig]])
```

**Examples:**

Compute the number of theoretical stages of a distillation column
from the bottom of the column, given
a matrix that relates the liquid fraction and the vapor fraction,
the composition of the column's bottom product is 11 %,
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the feed quality is 54 %, and
the reflux ratio at the top of the column is 70 % higher
than the minimum reflux ratio:

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
r=refmin(data,x,q);
R=1.70*r;
N=stages(data,x,q,R,false,false)
```

Compute the number of theoretical stages of a distillation column
from the top of the column, given
the function that compute the vapor fraction given the liquid fraction,
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed is saturated liquid, and
the reflux ratio at the top of the column is 70 % higher
than the minimum reflux ratio,
and plot a schematic diagram of the solution:

```julia
y(x)=x.^0.9 .* (1-x).^1.2 + x;
x=[0.88 0.46 0.11];
q=1;
r=refmin(y,x,q);
R=1.70*r;
N=stages(y,x,q,R)
```

### refmin

refmin computes the minimum value of the reflux ratio
of a distillation column using the method of McCabe-Thiele, given
a function or a matrix of the liquid and the vapor fraction,
the compositions of the feed and the distillate, and
the feed quality.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

**Syntax:**

```dotnetcli
r=refmin(y,X,q)
```

**Examples:**

Compute the minimum value of the reflux ratio
of a distillation column, given
a matrix that relates the liquid fraction and the vapor fraction,
the composition of the column's bottom is 11 %,
the composition of the distillate is 88 %, and
the feed quality is 54 %:

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
r=refmin(data,x,q)
```

Compute the minimum value of the reflux ratio
from the top of the column, given
the function that compute the vapor fraction given the liquid fraction,
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed is saturated liquid:

```julia
y(x)=x.^0.9 .* (1-x).^1.2 + x;
x=[0.88 0.46];
q=1;
r=refmin(y,x,q)
```

### qR2S

qR2S computes the reflux ratio at the bottom of the column, given
the compositions of the feed and the products,
the feed quality, and
the reflux ratio at the top of the column.

If feed is a saturated liquid, feed quality q = 1,
feed quality is reset to q = 1 - 1e-10.

**Syntax:**

```dotnetcli
S=qR2S(X,q,R)
```

**Examples:**

Compute the reflux ratio at the bottom of the column, given
the composition of the column's bottom is 11 %,
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the feed quality is 54 %,
the reflux ratio at the top of the column is 2:

```julia
x=[0.88 0.46 0.11];
q=0.54;
R=2;
S=qR2S(R,x,q)
```

Compute the reflux ratio at the bottom of the column, given
the composition of the distillate is 88 %,
the composition of the feed is 46 %,
the composition of the column's bottom product is 11 %,
the feed is saturated liquid,
the reflux ratio at the top of the column is 2:

```julia
x=[0.88 0.46 0.11];
q=1;
R=2;
S=qR2S(x,q,R)
```

Copyright &copy; 2022 Alexandre Umpierre

email: <aumpierre@gmail.com>
