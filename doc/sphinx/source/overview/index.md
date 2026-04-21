# Overview

## First things first - should I be using AxiSEM3D? 

The question of which modelling software you ought to be using probably
has no definite or finite-length answer. However, the common pieces of
software used for global wavefield simulations include SPECFEM 
{cite:p}`Komatitsch2002a, Komatitsch2002b`,
AxiSEM3D {cite:p}`Leng2016, Leng2019`, and Salvus.

There are also normal-mode codes such as MINEOS which are very different
in implementation and functionality to AxiSEM3D, SPECFEM, and Salvus
(which are all spectral-element based codes), but nonetheless useful if
you are looking at normal modes, gravity or ellipticity, and so on {cite:p}`Panning2017`.

Before undertaking any
synthetic studies, it is worth deciding upon what functionality is
important to you, and choosing accordingly. The advantage of AxiSEM3D over the other methods is its ability to
undertake calculations at much higher frequencies, but this also comes
with limitations on how complex a scenario you are able to simulate.

If you are:
* planning to calculate global wavefields for simple 1D
models at high frequencies such as PREM {cite:p}`Dziewonski1981`, AxiSEM3D is the most
efficient way to do it.

* interested in the global 5s resolution wavefield in the
presence of strong off-plane scattering, AxiSEM3D can do this where the
other two could not, at least not with any reasonable resource usage.

* interested in local-scale wavefields in
coastal regions with mixed surface patches of ocean and land, AxiSEM3D
is absolutely not the correct code to be using. 

* interested in how
a planet’s rotation or self-gravity
from large seismic oscillations influence the normal-mode spectrum,
AxiSEM3D is not for you.


Other factors worth bearing in mind is that in AxiSEM3D creating a mesh
is trivially easy but creating a 3D model to superimpose on the mesh can
be extremely challenging to do or indeed to debug. AxiSEM3D and SPECFEM
also have the advantage that they are free and open-source, but
therefore do not come with dedicated technical support. On the other
hand, Salvus is proprietary and paid - so the technical support is
commensurate with that.

```{toctree}
---
maxdepth: 2
---
models.md
capabilities.md
```
