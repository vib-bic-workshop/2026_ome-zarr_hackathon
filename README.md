# OME-ZARR hackathon AT VIB to test eubi-bridge

EuBi-Bridge : https://github.com/Euro-BioImaging/EuBI-Bridge


Tested on Tier 1

Location of the folder : `/dodrio/scratch/projects/2024_300/ome_zarr_hackathon_2026`

## Usage

### start a cluster desktop or biomage analysis desktop
```bash
cd /dodrio/scratch/projects/2024_300/ome_zarr_hackathon_2026/containers
apptainer run eubi-bridge-0.1.2b1.sif eubi-gui
```
### specify the input, output
                                                          
<img width="1603" height="750" alt="image" src="https://github.com/user-attachments/assets/22002fb3-0e00-4b09-b4ae-85bb998430ab" />

- `Max worker` : number of simultanoiouly images that  will be converted. If you have a single image, it will use only 1 worker
- Memory size used by the converter is equal to `Max concurency` x `Region Size` x `Max worker` (but a single image will use 1 `Max Worker` only)

<img width="1610" height="751" alt="image" src="https://github.com/user-attachments/assets/8426b1d5-ce1e-4ef4-9cb2-c07056b6c3e1" />

### Inspect after conversion

#### Metadata
<img width="1601" height="826" alt="image" src="https://github.com/user-attachments/assets/94e3c9c2-6d32-474d-90fc-ba1d0266d1b5" />

You can check the metadata and even modified the pixel one if you edit them, click on `Confirm` and `Save Pixel Sizes`

#### Viewer
<img width="1605" height="827" alt="image" src="https://github.com/user-attachments/assets/ed2d6642-1584-4d00-a766-e27d8dcd23f5" />

At this stage, you can for eample change `Min`/`Max` intensity per channel, click `Confirm` and `Save Channels` to save in the ome.zarr the metadata for the channels.

## Building

- only works on Tier2 KUL, wice: connect here: https://ondemand.hpc.kuleuven.be
```bash
sbatch eubibridge.slurm
```
### example of concatenation
- how to concatenate a image sequence of 2 channels along cz
<img width="1888" height="909" alt="image" src="https://github.com/user-attachments/assets/7366cc53-f916-4bb7-846c-b82447a4dc9d" />


