#!/bin/bash
#SBATCH --job-name=4_5
#SBATCH --nodes=1
#SBATCH --ntasks=1

hostname

c_w_dir=$PWD
cd $c_w_dir

time ../../cubefit.x -xyz refined.xyz -dens ../../cubes/5_SCAN_1_2_3_4_F/B.d.cube -esp ../../cubes/5_SCAN_1_2_3_4_F/B.p.cube -stepsize 0.2 -n_steps 1000 -learning_rate 0.5 
