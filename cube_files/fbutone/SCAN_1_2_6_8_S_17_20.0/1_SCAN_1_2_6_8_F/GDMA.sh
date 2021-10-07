#!/bin/bash
#SBATCH --job-name=1_SCAN_1_2_6_8_F_N
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=short


cd /home/unibas/boittier/RDKit_G2/N.pdb/SCAN_1_2_6_8_S_17_20.0/1_SCAN_1_2_6_8_F

/home/unibas/boittier/gdma < GDMA.inp > 1_SCAN_1_2_6_8_F_N_GDMA.log