# 06 Finite Source Local
To generate the mesh (already done in the input folders): 
```
sh genmesh.sh
```
Models of the San Francisco Bay Area need to be downloaded from Zenodo & copied to the input folder: <br>
Zenodo link: TBA 

To generate source & surface observation locations (already done in the input folders):
```
ipython notebook input_setup.ipynb
```

To run AxiSEM3D on Archer2 (need to set necessary uppercase variables in `submit.slurm`):
```
cp axisem3d .
sbatch submit.slurm
```

To plot the resulting animation on the surface:
```
ipython notebook post_processing.ipynb
```