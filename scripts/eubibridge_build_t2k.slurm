#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cluster=wice
#SBATCH --partition=batch
#SBATCH --time=00:25:00
#SBATCH --job-name=Midori_kame
#SBATCH --output=tortuga_train3.out
#SBATCH --error=tortuga_train3.err
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1G
#SBATCH -A lp_hack_bio_im


APPTAINER_CACHEDIR=$VSC_SCRATCH/.apptainer/cache
APPTAINER_TMPDIR=$VSC_SCRATCH/.apptainer/tmp
apptainer pull eubibridge.sif docker://bugraoezdemir/eubi-bridge
