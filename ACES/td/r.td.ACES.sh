#!/bin/bash
#SBATCH --job-name=mpi_test
#SBATCH --account=155485226413
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --ntasks=12
#SBATCH --mem-per-cpu=5GB
#SBATCH --ntasks-per-node=12
#SBATCH --cpus-per-task=1
#SBATCH --time=72:00:00

module load intel-compilers/2024.0.0
module load impi/2021.11.0
module load GCC/13.2.0
module load FFTW/3.3.10
module load imkl/2024.0.0

dftdir=/scratch/group/p.phy240167.000/codes/varga_dft_code_parallel/release/

cd $SLURM_SUBMIT_DIR

mpirun -n 12 $dftdir/dft > output 2> error
