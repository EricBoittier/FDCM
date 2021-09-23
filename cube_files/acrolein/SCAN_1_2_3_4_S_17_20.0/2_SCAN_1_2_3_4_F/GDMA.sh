#!/bin/bash
#SBATCH --job-name=2_SCAN_1_2_3_4_F_L
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=short


cd /home/unibas/boittier/RDKit_G2/L.pdb/SCAN_1_2_3_4_S_17_20.0/2_SCAN_1_2_3_4_F

/home/unibas/boittier/gdma < GDMA.inp > 2_SCAN_1_2_3_4_F_L_GDMA.log