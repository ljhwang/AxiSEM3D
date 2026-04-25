# inparam.output.yaml

## station-wise

### `list_of_station_groups`

**What:** list of station groups

**Type:** array of objects

**Default:** `[]`

**Note:**

1) different options such as channels and sampling rates can
be used for different station groups; for example, one may
have one group of real-world seismic stations to record the
displacement vector at a high sampling rate and another group
of animation stations to record only the vertical displacement
at a low sampling rate
2) use [] if no station group presents


## element-wise

### `list_of_element_groups`

**What:** list of element groups

**Type:** array of objects

**Default:** `[]`

**Note:**

1) different options such as channels and sampling rates can
be used for different element groups
2) use [] if no element group presents


