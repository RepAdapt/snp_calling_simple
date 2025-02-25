#!/bin/bash
#SBATCH --time=0-6:00
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1G
#SBATCH --account=def-yeaman
#SBATCH --array=1-83

INPUT1=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list1.txt) ### List of trimmed R1 reads (produced with script 01)
INPUT2=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list2.txt) ###  List of trimmed R2 reads (produced with script 01)
OUTPUT=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list3.txt) ### List of output name -- just extract the meaningful part of the name from the reads names

module load bwa samtools

#### Here we map the trimmed reads to the ref genome and produce a sam, then we sort it, convert it to bam and we index it
#### We end up with 1 bam per sample after this


bwa mem -t 4 Betula_pendula_subsp._pendula.faa $INPUT1 $INPUT2  > ./bwa_output/$OUTPUT\.sam
samtools view -Sb -q 10 ./bwa_output/$OUTPUT\.sam > ./bwa_output/$OUTPUT\.bam
rm ./bwa_output/$OUTPUT\.sam
samtools sort --threads  4 ./bwa_output/$OUTPUT\.bam > ./bwa_output/$OUTPUT\_sorted.bam
rm ./bwa_output/$OUTPUT\.bam
samtools index ./bwa_output/$OUTPUT\_sorted.bam

