#!/bin/bash
#SBATCH --job-name=SimpleGridPerpetual12
#SBATCH --output=logs/SimpleGridPerpetual12.out
#SBATCH --error=logs/SimpleGridPerpetual12.err
#SBATCH --time=36:00:00
#SBATCH --nodes=1
#SBATCH --account=pi-jjberg
#SBATCH --ntasks-per-node=20
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
snakemake --cores --rerun-incomplete -s snakefile_grid_perpetual12  
#snakemake -j1 --rerun-incomplete 
