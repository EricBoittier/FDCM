#!/bin/bash
#SBATCH --job-name=OPT_wB97XD_6-31+G_L
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=short


cd /home/unibas/boittier/RDKit_G2/L.pdb/OPT_wB97XD_6-31+G

/home/unibas/boittier/gdma < GDMA.inp > OPT_wB97XD_6-31+G_L_GDMA.log