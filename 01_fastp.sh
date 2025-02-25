#!/bin/bash
#SBATCH --time=0-6:00
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1G
#SBATCH --account=def-yeaman
#SBATCH --array=1-83


### THESE FILES NEED TO HAVE THE SAME SAMPLE ORDER
INPUT1=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list1.txt)  ### A list of your R1 fastq files
INPUT2=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list2.txt)  ### A list of your R2 fastq files
OUTPUT1=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list3.txt) ### A list of R1 output name -- I usually just capture the meaningful part of the fastq name
OUTPUT2=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list4.txt) ### A list of R2 output name -- I usually just capture the meaningful part of the fastq name


module load fastp

### Trimming --  for each sample pair of raw fastq reads, we produce a pair of trimmed output files

fastp -w  4 -i $INPUT1 -I $INPUT2 -o $OUTPUT1\_trimmed.fastq.gz -O $OUTPUT2\_trimmed.fastq.gz
