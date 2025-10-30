#!/bin/bash
#SBATCH --time=0-0:50
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --account=def-yeaman

### This is to create gatk index of ref genome needed for indel realignment
### Keep the output files of this command in the same dir where you keep the reference genome fasta


###### CHANGE THE LINE OF CODE BELOW TO LOAD THE CORRECT VERSION OF SAMTOOLS IN YOUR MACHINE/SERVER  = samtools v.1.16.1
module load StdEnv/2020 samtools

samtools faidx Betula_pendula_subsp._pendula.fa


module purge
###### CHANGE THE LINE OF CODE BELOW TO LOAD THE CORRECT VERSION OF PICARD IN YOUR MACHINE/SERVER  = Picard Tools v.2.26.3
module load picard java


java -jar $EBROOTPICARD/picard.jar CreateSequenceDictionary R=Betula_pendula_subsp._pendula.fa O=Betula_pendula_subsp._pendula.dict

