#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=00-23:00:00
#SBATCH --account=def-yeaman
#SBATCH --array=1-14


module load bcftools/1.11

CHROM=$(sed -n "${SLURM_ARRAY_TASK_ID}p" chromosomes.txt) ### list of chromosomes. This species has 14, that s why array number is 14. We parallelize by crhomosome


### here we call SNPs. list.txt is a list of ALL the realigned bam files of ALL samples. if you have multiple bam per samples due to multiple libraries, merge them into one before this step. ploidymap is a list that keeps the same order of samples in list.txt and should use the sample ID names you set in script 5, and for each
### sample ID name has the ploidy -- for a diploid species just create a tab separated file with 2 columns (first column: sample ID name set in script 5, second columnd: 2)
bcftools mpileup -Ou -f Betula_pendula_subsp._pendula.fa --bam-list list.txt -q 5 -r $CHROM -I -a FMT/AD | bcftools call -S ploidymap.txt -G - -f GQ -mv -Ov > $CHROM\.vcf
