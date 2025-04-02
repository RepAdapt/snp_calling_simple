# SNP_calling_pipeline_slurm_mpilesup


This is a simple SNP calling pipeline, implemented for SLURM job scheduler.
Simply run the scripts one by one in their order.

Software/tools versions: https://github.com/RepAdapt/singularity/blob/main/RepAdaptSingularity.md


Files needed: 

- Paired end fastq files

- Reference genome in FASTA format

- Genes gff file

# NOTES:

The resources requested for each script (CPUs, RAM and run time) should be changed according to your data: size of your raw fastq, size of reference etc. The resources provided here are an indication and probably an overkill for some steps.
Indel realignment (script 07) needs a bit more RAM than the rest of the scripts.

The pipeline uses as example a B. platyphylla dataset, which has 83 samples -- that is why the job arrays in the various scripts are of size 1-83. Change this range according to your samples or libraries number. 
Mind the job number limit of your HPC!!!


This pipeline speeds the process by launching a single job with minimal resources and run time per sample, allowing to process all or most samples in parallel, depending on CPUs availability. 
Remember to adjust resources (RAM, CPUs) to your needs to improve q times with job schedulers.

The lists of input files needed at each step, can be quickly generated by using the "find" command. The lists of output file names can be generated by using "sed" (for example to remove "^./" and the file suffix) on the input files lists. An unique output suffix at each step is always added to the output names by the scripts.


# IMPORTANT 

This pipeline assumes that each sample has a single pair of paired end reads. 


If your dataset has multiple libraries per sample (multiple pairs of fastq files per sample), you can use this pipeline but you need to merge the multiple resulting bams per sample into a single final sorted bam per sample before calling SNPs (before script 09). Remember to re-sort them after merging them.
