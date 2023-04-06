#!/bin/bash
#SBATCH --job-name=SimpleGrid
#SBATCH --output=logs/SimpleGrid.out
#SBATCH --error=logs/SimpleGrid.err
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --account=pi-jjberg
#SBATCH --ntasks-per-node=10
#SBATCH --mem-per-cpu=2000

source ~/.bashrc

module load python/anaconda-2022.05
module load R
module load samtools

conda activate pga2

module load openblas/0.3.13
module load htslib

echo "SLURM_JOBID="$SLURM_JOBID
cat Snakefile
snakemake --cores --rerun-incomplete -s snakefile_grid  
#snakemake -j1 --rerun-incomplete 
