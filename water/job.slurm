#!/bin/bash
#SBATCH --job-name=1_2
#SBATCH --nodes=1
#SBATCH --ntasks=1

hostname

c_w_dir=$PWD
cd $c_w_dir

time ../../cubefit.x -xyz ../water_555.xyz -dens /home/unibas/boittier/pydcm-1.2/water_5_5_5/ref/Water_5_5_5.den.cub -esp /home/unibas/boittier/pydcm-1.2/water_5_5_5/ref/Water_5_5_5.pot.cub -stepsize 0.2 -n_steps 5000 -learning_rate 0.5 

