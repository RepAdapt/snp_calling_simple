# SNP_calling_pipeline_slurm_mpilesup


This is a simple SNP calling pipeline, implemented for SLURM job scheduler.
Simply run the scripts one by one in their order.

NOTES:

The system requirements requested for each job (CPUs, RAM and run time) should be changed according to your data: size of your raw fastq, size of reference etc.

The pipeline uses as example a B. platyphylla dataset, which had 83 samples -- hence why the job arrays in the various script are of size 83.

This pipeline assumes that each sample has a pir of paired end reads. If your dataset has multiple libraries per sample, you also need to merge them into one before calling SNPs
