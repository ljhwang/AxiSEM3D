# inparam.model.yaml

## 1D model

Parameters for 1D model (the mesh).

### `exodus_mesh`

**What:** Exodus mesh file created by salvus mesher

**Type:** filename

**Default:** `global_mesh__prem_ani__50s.e`


## geodesy

Parameters for geodesy.

### `lat_lon_north_pole_mesh`

**What:** geographic location of the north pole in the mesh

**Type:** array of double / SOURCE

**Default:** `SOURCE`

**Note:**

1) this reference location enables the usage of geographic
coordinates for locating sources, receivers and 3D models,
compatible with Cartesian meshes
2) array of double: [latitude, longitude]
3) SOURCE: determined this location by the FIRST source
presented in list_of_sources in inparam.source.yaml;
always use SOURCE for a single-source simulation


### `flattening_on_surface`

**What:** flattening on the surface

**Type:** string / double

**Only:** SPHERE / WGS84 / GRS80 / SPECFEM3D_GLOBE / value

**Default:** `WGS84`

**Note:**

1) ellipticity is ignored for a Cartesian mesh
2) 0 for a perfect sphere; ~0.0033 for the Earth
3) ellipticity will be used in the transformation between
the geographic and the geocentric co-latitudes;
see eq. (14.32) in Dahlen & Tromp, 1998
4) to actually deform the entire mesh, add 3D model
"Ellipticity" to list_of_3D_models


## absorbing boundary

Parameters for absorbing boundary condition.

### `boundaries`

**What:** model boundaries regarded as absorbing boundaries

**Type:** array of string

**Only:** a subset of [RIGHT, BOTTOM, TOP]

**Default:** `[RIGHT, BOTTOM]`

**Note:**

1) an AxiSEM3D mesh may contain four outer boundaries:
left (axial), right, bottom and top (surface); the right,
bottom and top ones can be absorbing boundaries (the left
or axial one is non-physical)
2) use [] to disable absorbing boundary condition
(so that all model boundaries will be stress-free)
3) the most common case in seismology is [RIGHT, BOTTOM]


### `enable_Clayton_Enquist`

**What:** enable the Clayton-Enquist approach

**Type:** bool

**Default:** `true`

**Note:**

the simplest linear approach by Clayton & Engquist (1977)


### Kosloff_Kosloff

the sponge approach by Kosloff & Kosloff (1986)

#### `enable`

**What:** enable the Kosloff-Kosloff approach

**Type:** bool

**Default:** `true`

**Note:**

Clayton-Enquist and Kosloff-Kosloff can be used together,
but one of them has to be enabled at least


#### `relative_spans`

**What:** relative spans of the sponge layers

**Type:** array of double

**Default:** `[.05, .05]`

**Note:**

1) must be presented in the same order as absorbing_boundaries
2) to use Kosloff-Kosloff, the mesh should be a little larger
than the required computational domain; for example, given
a required domain spans from 0 to 100 km in depth, one can
generate a mesh from 0 to 110 km and set the relative span
to 0.05, so the thickness of the sponge layer at the mesh
bottom will be determined as 110 * 0.05 = 5.5 km, leaving
an unaffected depth range from 0 to 104.5 km for normal
wave propagation and analysis
3) allowed range: .01 ~ 0.25


#### `gamma_expr_solid`

**What:** expression of γ-factor in solid domain

**Type:** math expression

**Default:** `1.1 / T0 * (VS / VP)^2 * exp(-0.04 * SPAN / (VP * T0))`

**Note:**

1) γ-factor represents the absorbing strength at a point
2) allowed arguments include (case sensitive):
- VP, VS: P- and S- wave velocities at the point
- RHO   : density at the point
- SPAN  : span of the sponge layer
- T0    : mesh period
* VP, VS and RHO are the 1D values in the Exodus mesh
3) this expression will be further multiplied by a pattern
function that equals to 1 on the outermost edge of the
sponge layer (i.e., on the mesh boundary) and gradually
decreases to 0 on the the innermost edge; such a decreasing
pattern is automatically handled by the solver
4) the default is an empirical expression from
Haindl et al., 2020


#### `gamma_expr_fluid`

**What:** expression of γ-factor in fluid domain

**Type:** math expression

**Default:** `0.88 / T0 * exp(-0.04 * SPAN / (VP * T0))`

**Note:**

same as gamma_expr_solid but without VS dependency


## attenuation

### `attenuation`

**What:** attenuation mode

**Type:** string

**Only:** NONE / FULL / CG4

**Default:** `CG4`

**Note:**

1) NONE: turn off attenuation
2) FULL: compute attenuation on all GLL points
3) CG4:  compute attenuation on 4 GLL points per element;
CG4 is mostly as accurate as FULL but more efficient
than FULL, see van Driel & Nissen-​Meyer, 2014;
CG4 requires set(NPOL 4) in CMakeLists.txt;


## 3D models

### `list_of_3D_models`

**What:** list of 3D models

**Type:** array of objects

**Default:** `[]`

**Note:**

1) the order in this list can affect the final 3D model
2) use [] if no 3D model presents


