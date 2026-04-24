# inparam.source.yaml

## time axis

Parameters for the time axis of the simulation.

### `record_length`

**What:** record length (the end time in seismograms)

**Type:** double

**Default:** `1800.`

**Note:**

the start time depends on the source-time functions


### `enforced_dt`

**What:** user-specified Δt

**Type:** string / double

**Only:** NONE / value

**Default:** `NONE`

**Note:**

use NONE to automatically determine Δt by mesh


### `Courant_number`

**What:** the Courant number for determining Δt by mesh

**Type:** double

**Default:** `0.6`

**Note:**

1) Δt increases with the Courant number; decrease it when
numerical instability occurs
2) [safe] 0.5 <===> 1.0 [aggressive]; 0.6~0.7 normally works
3) if Courant_number < 0.3 but instability still occurs,
it is likely to be an issue caused by an input 3D model
(e.g., mislocation near a model boundary)


### `integrator`

**What:** time integrator

**Type:** string

**Only:** NEWMARK / SYMPLECTIC

**Default:** `NEWMARK`

**Note:**

1) NEWMARK is faster while SYMPLECTIC is less dispersive
2) use SYMPLECTIC for ultra-long simulations
3) Δt can be larger for SYMPLECTIC than for NEWMARK


## sources

### `list_of_sources`

**What:** list of sources

**Type:** array of objects

**Default:** `[]`

**Note:**

1) multiple sources are allowed
2) use [] if no source presents


