#!/bin/bash
#SBATCH --job-name=SCAN_1_2_3_4_S_17_20.0_B
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=short


cd /home/unibas/boittier/RDKit_G2/B.pdb/SCAN_1_2_3_4_S_17_20.0

/home/unibas/boittier/gdma < GDMA.inp > SCAN_1_2_3_4_S_17_20.0_B_GDMA.log