#!/bin/bash

#SBATCH --job-name=/home/unibas/boittier/RDKit_G2/O.pdb/SCAN_1_2_6_8_S_17_20.0/14_SCAN_1_2_6_8_F
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2200
#SBATCH --partition=short
# 
#$ -S /bin/bash
source /opt/cluster/programs/g09_d.01/g09/bsd/g09.login.bash
hostname


cd /home/unibas/boittier/RDKit_G2/O.pdb/SCAN_1_2_6_8_S_17_20.0/14_SCAN_1_2_6_8_F

echo "Running formchk"
formchk O.pdb.chk O.pdb.fchk
echo "Generating Density Cube"
cubegen 1 Density O.pdb.fchk O.d.cube
echo "Generating Potential Cube"
cubegen 1 Potential O.pdb.fchk O.p.cube

