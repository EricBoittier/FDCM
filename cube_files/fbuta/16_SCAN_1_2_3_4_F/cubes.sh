#!/bin/bash

#SBATCH --job-name=/home/unibas/boittier/RDKit_G2/B.pdb/SCAN_1_2_3_4_S_17_20.0/16_SCAN_1_2_3_4_F
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2200
#SBATCH --partition=short
# 
#$ -S /bin/bash
source /opt/cluster/programs/g09_d.01/g09/bsd/g09.login.bash
hostname


cd /home/unibas/boittier/RDKit_G2/B.pdb/SCAN_1_2_3_4_S_17_20.0/16_SCAN_1_2_3_4_F

echo "Running formchk"
formchk B.pdb.chk B.pdb.fchk
echo "Generating Density Cube"
cubegen 1 Density B.pdb.fchk B.d.cube
echo "Generating Potential Cube"
cubegen 1 Potential B.pdb.fchk B.p.cube

