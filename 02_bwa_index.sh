#!/bin/bash
#SBATCH --time=0-6:00
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --account=def-yeaman

### Here we just create bwa index of the reference genome, needed for mapping
### Keep the output of this command in the same dir where you keep the reference genome fasta

module load bwa 


bwa index -a bwtsw Betula_pendula_subsp._pendula.faa
