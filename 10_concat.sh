#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32G
#SBATCH --time=06-00:00:00
#SBATCH --account=def-yeaman

module load bcftools

### concatenate all the chromsome vcf produced in 09. list.txt is a list of the vcfs produced in 09.
### here we concatenate them in a single vcf

bcftools concat -f list.txt -Oz > bplaty_banff.vcf.gz
tabix -p vcf bplaty_banff.vcf.gz
