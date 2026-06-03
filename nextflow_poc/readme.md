# usage

## on WSL
```bash
nextflow run main.nf -profile docker_wsl|apptainer_wsl -params-file params.json
```
- works with local sif or docker or pullone
- works with json and csv

### to do
- debug docker issue
- dynamic allocation
- add nf-test
- test on HPC and test instutional config
- add subworkflows for concatenation

### Ben's wish

- add cellpose
