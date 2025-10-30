#!/bin/bash
#SBATCH --time=0-6:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --account=def-yeaman

### Here we just create the bwa index of the reference genome, needed for mapping
### Keep the output of this command in the same dir where you keep the reference genome fasta

###### CHANGE THE LINE OF CODE BELOW TO LOAD THE CORRECT VERSION OF BWA IN YOUR MACHINE/SERVER  = bwa-mem v.0.7.17-r1188
module load bwa 


bwa index -a bwtsw Betula_pendula_subsp._pendula.fa
