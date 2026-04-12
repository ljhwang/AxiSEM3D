# Installation Scripts
These scripts are meant to be used to install AxiSEM3D on HPC clusters.


## Stampede3 (TACC)

To install AxiSEM3D on TACC's Stampede3, use the `build_axisem3d_stampede.sh` script.
You will need to use scp to transfer the file onto Stampede3.
Here is the syntax for the scp command:
`scp path/to/build_axisem3d_stampede.sh username@stampede3.tacc.utexas.edu:path/to/destination/directory`

You will need to replace `path/to/build_axisem3d_stampede.sh` with the correct path on your machine.

You will need to replace `username@stampede3` with your actual TACC username.

Finally, you will need to choose the destination directory you want within your environment on stampede3.
A good choice is the $SCRATCH directory. In order to find the absolute location of the $SCRATCH directory 
in your environment in stampede3, you can log into TACC and type: `printenv SCRATCH`.

You will be prompted to log into TACC when running the `scp` command.
Once the scp file transfer has completed, you can log into Stampede3 and run `build_axisem3d_stampede.sh` by typing: `chmod +x build_axisem3d_stampede.sh; ./build_axisem3d_stampede.sh;`

This should compile AxiSEM3D on your environment on stampede3.
