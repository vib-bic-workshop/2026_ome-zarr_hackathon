# usage

## on WSL
```bash
# for no concatenation
nextflow run main.nf -profile apptainer_wsl -params-file params.json
# for concatenation
nextflow run main.nf -profile apptainer_wsl -params-file params_concatenation.json
# on Tier1 with institutional config
nextflow run main.nf -profile vsc_ugent,singularity_tier1 -params-file params.json   --tier1_project 2024_300
```
- works with local sif or docker or pullone
- works with json and csv
- concatenation and simple conversion
- dynamic  ressource allocation
- test on HPC and test instutional config

### to do
- debug docker issue
- add nf-test


### Ben's wish

- add cellpose-zarr
