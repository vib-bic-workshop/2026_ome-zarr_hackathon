# Readme

## for general HPC installation 
- see the pdf file on this repo

## Easy Build configs
- https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild

```bash
module load Miniconda3
conda config --append envs_dirs $VSC_DATA/conda_envs
conda config --append pkgs_dirs $VSC_SCRATCH/conda_pkgs
conda create -n eubizarr openjdk=11.* maven python=3.12
source activate eubizarr
pip install pyqt6=6.8.1
pip install --no-cache-dir eubi-bridge==0.1.2b1
eubi reset_config
```
## EESSI
- https://github.com/orgs/EESSI/repositories
