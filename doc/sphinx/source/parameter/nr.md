# inparam.nr.yaml

## type

### `type_Nr`

**What:** type of Nr(s,z)

**Type:** string

**Only:** CONSTANT / ANALYTICAL / POINTWISE / STRUCTURED

**Default:** `CONSTANT`

**Note:**

1) CONSTANT:   Nr(s,z) = const
2) ANALYTICAL: analytical Nr(s,z) defined in NrFieldAnalytical.cpp
3) POINTWISE:  Nr provided at discrete control points
4) STRUCTURED: Nr provided on a structured grid


### `bound_Nr_by_inplane`

**What:** bound Nr(s,z) from above by inplane resolution

**Type:** bool

**Default:** `true`

**Note:**

there is no reason to use an azimuthal resolution higher than
the inplane (or mesh) resolution; users should use true.


## constant

### `constant`

**What:** the constant value for type_Nr = CONSTANT

**Type:** int

**Default:** `5`

**Note:**

for an axisymmetric model with a single axial source, use
1) 5 for a moment tensor (earthquake)
2) 3 for a force vector (impact)
3) 1 for a pressure (explosion) in either solid or fluid


## analytical

Parameters for type_Nr = ANALYTICAL.

### `code_ID`

**What:** code ID to match NrFieldAnalytical::sCodeID

**Type:** string

**Default:** `depth-dependent (AxiSEM3D default)`

**Note:**

to ensure that AxiSEM3D has been compiled with the wanted
NrFieldAnalytical.cpp, repeat here the code ID defined by
NrFieldAnalytical::sCodeID in NrFieldAnalytical.cpp (line 18)


### depth_dependent_AxiSEM3D_default

depth-dependent Nr(s,z), i.e., Nr(s,z) = Nr(depth),
with code ID = "depth-dependent (AxiSEM3D default)"
2) linear interpolation is applied between two control depths

#### `control_depths`

**What:** the control depths

**Type:** array of double

**Default:** `[0., 50e3, 100e3, 6371e3]`


#### `Nr_at_control_depths`

**What:** Nr at the control depths

**Type:** array of double

**Default:** `[100, 100, 50, 50]`


### any_user_defined_parameters

on how they are read and used in NrFieldAnalytical.cpp

#### `example__bool`

**Default:** `true`


#### `example__string`

**Default:** `Hello world!`


#### `example__array_of_double`

**Default:** `[1., 2., 3.]`


#### `example__array_of_string`

**Default:** `[path, file1, file2]`


## pointwise

Parameters for type_Nr = POINTWISE.

### `nc_data_file`

**What:** netcdf data file

**Type:** filename

**Default:** `pointwise.nc`

**Note:**

1) this file must contain the following two variables:
* pointwise_sz, double, (X, 2), (s,z) of X control points
* pointwise_Nr, int,    (X, ),  Nr at the X control points
2) the unit is meter for s and z
3) interpolation is based on inverse distance weighting
4) another variable starting_Nr_for_scanning will exist if
this file has been created by wavefield scanning


### `multip_factor`

**What:** factor multiplied to Nr(s,z)

**Type:** double

**Default:** `1.`

**Note:**

useful if nc_data_file was created by wavefield scanning;
for example, Nr(s,z) obtained by scanning s20rts may be
applied to s40rts by using a factor of 2.0


## structured

Parameters for type_Nr = STRUCTURED.

### `nc_data_file`

**What:** netcdf data file

**Type:** filename

**Default:** `structured.nc`

**Note:**

1) for a Cartesian mesh, this file must contain three variables:
* structured_s,  double, (M, ),  s of M grid points
* structured_z,  double, (N, ),  z of N grid points
* structured_Nr, int,    (M, N), Nr at the M*N grid points
2) for a spherical mesh, replace (_s, _z) with (_r, _t), t for θ
3) the unit is meter for s, z and r and radian for θ


### `value_out_of_range`

**What:** value of Nr at any location out of the grid range

**Type:** int

**Default:** `5`


## wavefield scanning

Parameters for wavefield scanning.

### `enable_scanning`

**What:** enable/disable wavefield scanning

**Type:** bool

**Default:** `false`

**Note:**

enabling wavefield scanning barely slows a simulation but
will increase memory usage


### `output_file`

**What:** output file

**Type:** filename

**Default:** `scanning_output_Nr.nc`


### `threshold_Fourier_convergence`

**What:** relative threshold for the convergence of Fourier series

**Type:** double

**Default:** `1e-2`

**Note:**

1) this parameter represents the accuracy loss by truncating
the Fourier series of the wavefield
2) allowed range: [1e-4, 1e-1]


### `relative_amplitude_skipped`

**What:** relative amplitude skipped for scanning

**Type:** double

**Default:** `0.1`

**Note:**

1) an energy peak with an amplitude smaller than
"this relative amplitude * the largest energy peak"
will be skipped for scanning
2) using 1. means that the resultant Nr accounts only for
the largest energy peak across the record length
3) using 0. means that the resultant Nr accounts for all
the energy peaks across the record length
4) allowed range: [0., 1.]


### advanced

advanced scanning parameters (users are unlikely to change)

#### `absolute_amplitude_skipped`

**What:** absolute amplitude skipped for scanning

**Type:** double

**Default:** `1e-12`

**Note:**

1) tiny values must be skipped to avoid numerical errors
2) allowed range: [1e-14, 1e-10]


#### `max_num_peaks`

**What:** maximum number of energy peaks to be recorded

**Type:** int

**Default:** `10000`

**Note:**

use a small one to consider only a few largest peaks


#### `vertex_only`

**What:** perform scanning only on vertex GLL points

**Type:** bool

**Default:** `true`

**Note:**

vertex-only scanning can significantly decrease both
runtime memory and output file size


#### `num_steps_per_mesh_period`

**What:** how many time steps per mesh period to detect energy peaks

**Type:** int

**Default:** `12`

**Note:**

must be no less than 4; recommended range: [8, 16]


