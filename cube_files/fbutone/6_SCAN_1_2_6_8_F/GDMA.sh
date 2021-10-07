#!/bin/bash
#SBATCH --job-name=6_SCAN_1_2_6_8_F_N
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=short


cd /home/unibas/boittier/RDKit_G2/N.pdb/SCAN_1_2_6_8_S_17_20.0/6_SCAN_1_2_6_8_F

/home/unibas/boittier/gdma < GDMA.inp > 6_SCAN_1_2_6_8_F_N_GDMA.log