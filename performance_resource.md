# Observation

- same file cicero.nd2
- conversion with gui and slurm and no sharding and conda is ~ 51 mins
- conversion with conda and gui and sharding is 16.8 mins
- conversion with apptainer and gui and sharding is 2.71 mins

## current remarks

- conda is slower than apptainer
- also slurm is rather slow due to conda import
- sharding helps due to less file created 
