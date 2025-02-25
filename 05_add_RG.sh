#!/bin/bash
#SBATCH --time=0-6:00
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2G
#SBATCH --account=def-yeaman
#SBATCH --array=1-83

INPUT=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list1.txt) ### List of input deduplicated bam
OUTPUT=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list2.txt) ### List of output names (just remove .bam) from the inputs
NAME=$(sed -n "${SLURM_ARRAY_TASK_ID}p" list3.txt)   ### Here you want to extract the sample name from the input name, which is used to set read. Can be the same as list2


### Here we add read groups, we start with our deduplicated bam and we get a deduplicated bam with read groups assigned
module load picard java

java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=$INPUT O=$OUTPUT\_RG.bam RGID=$NAME RGLB=$NAME\_LB RGPL=ILLUMINA RGPU=unit1 RGSM=$NAME
