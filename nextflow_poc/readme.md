# usage

## on WSL
```bash
# for no concatenation
nextflow run main.nf -profile apptainer_wsl -params-file params.json
# for concatenation
nextflow run main.nf -profile apptainer_wsl -params-file params_concatenation.json
```
- works with local sif or docker or pullone
- works with json and csv
- concatenation and simple conversion
- dynamic  ressource allocation

### to do
- debug docker issue
- add nf-test
- test on HPC and test instutional config

### Ben's wish

- add cellpose-zarr
