# SNP_calling_pipeline_slurm_mpilesup


This is a simple SNP calling pipeline, implemented for SLURM job scheduler.
Simply run the scripts one by one in their order.

NOTES:
The system requirements requested for each job (CPUs, RAM and run time) should be changed according to your data: size of your raw fastq, size of reference etc.
The pipeline uses as example a B. platyphylla dataset, which had 83 samples -- hence why the job arrays in the various script are of size 83.
