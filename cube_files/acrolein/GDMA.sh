#!/bin/bash
#SBATCH --job-name=SCAN_1_2_6_8_S_17_20.0_O
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=short


cd /home/unibas/boittier/RDKit_G2/O.pdb/SCAN_1_2_6_8_S_17_20.0

/home/unibas/boittier/gdma < GDMA.inp > SCAN_1_2_6_8_S_17_20.0_O_GDMA.log