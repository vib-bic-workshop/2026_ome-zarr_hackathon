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

#### Load config option
<img width="1603" height="750" alt="image" src="https://github.com/user-attachments/assets/22002fb3-0e00-4b09-b4ae-85bb998430ab" />

- `Max worker` : number of simultanoiouly images that  will be converted. If you have a single image, it will use only 1 worker
- Memory size used by the converter is equal to `Max concurency` x `Region Size` x `Max worker` (but a single image will use 1 `Max Worker` only)

#### Reader option:
<img width="1610" height="751" alt="image" src="https://github.com/user-attachments/assets/8426b1d5-ce1e-4ef4-9cb2-c07056b6c3e1" />

#### Conversion options:
That's where you can precise the ome.zarr format version (v2 == 0.4, v3 === 0.5), the codec compression, 
<img width="1277" height="800" alt="image" src="https://github.com/user-attachments/assets/a14e6b2f-fd60-4b37-9059-29ffbc2cde9f" />

#### Downscaling

Allow specific downscaling, e.g. not downscaling in Z but only in XY (in that case, set 1 to `Scale Z`).

`Apply Smart Downscaling` will try to create downscaling to generate rougly isotropic ome.zarr, which could be usefull for image processing. E.g., if you have pixel size of ZYX 5,1,1, then downlscale will be 1,5,5 for the first downscale, then 2,2,2 etc... so all images and different scale will be isovoxel.

<img width="1282" height="828" alt="image" src="https://github.com/user-attachments/assets/f48a92d2-b1b2-4bd2-ab61-13f914e01c87" />

#### Metadata

This will allow you to override metadata, like the pixel size

<img width="1278" height="821" alt="image" src="https://github.com/user-attachments/assets/99758306-0de0-410c-94f2-2b3aae5ce931" />

#### Run
Where you start the conversion process

<img width="1277" height="805" alt="image" src="https://github.com/user-attachments/assets/515d9c7d-4a81-4910-983a-b34f5f5b0026" />

#### Config 
On top of this, you can also Save and Load config

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

## Validate and Visualize with ome-zarr-py

### Installation

```bash
conda create -y -n ome-zarr -c conda-forge python=3.12
conda activate ome-zarr
pip install pip install ome-zarr
```
### Start

```bash
ome_zarr view 900_New-07-AiryscanProcessing-05.zarr
```

### Validation

Validation appear as soon as you start it

<img width="1662" height="735" alt="image" src="https://github.com/user-attachments/assets/5a886e55-11b2-42ca-b9b2-7cb84c559c60" />

### Visualize

<img width="247" height="46" alt="image" src="https://github.com/user-attachments/assets/5e830be4-6a79-4c2a-80b5-020aaeb88aad" />

Multiple viewers can be used to visualize tool

#### Web Based

##### Vol-E

This viewer do not use the Min/Max setting saved in the ome.zarr file

<img width="1612" height="682" alt="image" src="https://github.com/user-attachments/assets/6d0db760-1e0d-4696-b659-cdde4b33f2ec" />

##### Neuroglancer

This viewer do not us ethe Min/Max setting saved in the ome.zarr file

<img width="1770" height="745" alt="image" src="https://github.com/user-attachments/assets/db0e615f-d760-47ce-ae91-ced509909524" />

##### Vizarr

The viewer is 2D only
<img width="1301" height="753" alt="image" src="https://github.com/user-attachments/assets/d2d77a2e-01ba-400f-b00f-e0d788180b44" />

#### App based

##### Mobie

##### Napari

Napari has a 3d viewer but that use only the lowest resolution in 3D


Documentation : https://ome-zarr.readthedocs.io

