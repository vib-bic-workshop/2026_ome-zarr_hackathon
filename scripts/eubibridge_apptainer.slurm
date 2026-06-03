#!/bin/bash
#SBATCH -A 2024_300
#SBATCH --partition=cpu_milan
#SBATCH --nodes="1"
#SBATCH --ntasks-per-node="1"
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=1G
#SBATCH --output=output_eubibridge.out
#SBATCH --error=error_eubibridge.err
#SBATCH --time=00:10:00

apptainer run /dodrio/scratch/projects/2024_300/ome_zarr_hackathon_2026/eubibridge_b3.sif eubi to_zarr /dodrio/scratch/projects/2024_300/ome_zarr_hackathon_2026/ND2/cicero6.nd2 /dodrio/scratch/projects/2024_300/ome_zarr_hackathon_2026/output_test/ --verbose --region_size_mb 1024 --max_concurrency 1
