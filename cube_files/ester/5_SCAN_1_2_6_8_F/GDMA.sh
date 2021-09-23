#!/bin/bash
#SBATCH --job-name=5_SCAN_1_2_6_8_F_O
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=short


cd /home/unibas/boittier/RDKit_G2/O.pdb/SCAN_1_2_6_8_S_17_20.0/5_SCAN_1_2_6_8_F

/home/unibas/boittier/gdma < GDMA.inp > 5_SCAN_1_2_6_8_F_O_GDMA.log