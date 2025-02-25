# SNP_calling_pipeline_slurm_mpilesup


This is a simple SNP calling pipeline, implemented for SLURM job scheduler.
Simply run the scripts one by one in their order.

Files needed: 
Paired end fastq files
Reference genome in FASTA format

NOTES:

The resources requested for each script (CPUs, RAM and run time) should be changed according to your data: size of your raw fastq, size of reference etc. The resources provided are an indication and probably an overkill in some steps.
Indel realignment (script 07) needs a bit more RAM than the rest of the scripts.

The pipeline uses as example a B. platyphylla dataset, which had 83 samples -- hence why the job arrays in the various scripts are of size 83. Change according to your samples number or libraries number. Mind the job number limit of your HPC!!!


This pipeline speeds the process by launching a single job with minimal resources and run time per sample, allowing to process all or most samples in parallel, depending on CPUs availability. 
Remember to adjust resources to your needs to improve q times with job schedulers.


######### IMPORTANT 
This pipeline assumes that each sample has a pair of paired end reads. 


If your dataset has multiple libraries per sample(multiple pairs of fastq per sample), you can use this pipeline but you need to merge the multiple resulting bams per sample into a single final sorted bam per sample before calling SNPs (before script 09). Remember to re-sort them after merging them.
