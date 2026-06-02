#!/bin/bash
#SBATCH -A 2024_300
#SBATCH --partition=cpu_milan
#SBATCH --nodes="1"
#SBATCH --ntasks-per-node="1"
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=16G
#SBATCH --output=output_eubibridge_concatenated.out
#SBATCH --error=error_eubibridge_concatenated.err
#SBATCH --time=03:00:00

module load Miniconda3
source activate eubizarr_env
eubi to_zarr /dodrio/scratch/projects/2024_300/ome_zarr_hackathon_2026/stitched/ /dodrio/scratch/projects/2024_300/ome_zarr_hackathon_2026/output_tiff/ --channel_tag C1_autofluorescence,C2_farRed --z_tag TEST_ --concatenation_axes cz --region_size_mb 512  --max_concurrency 1 --verbose --skip_dask --memory_per_worker 8GB
