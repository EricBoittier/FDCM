#!/bin/bash
#SBATCH --job-name=2_3
#SBATCH --nodes=1
#SBATCH --ntasks=1

hostname

c_w_dir=$PWD
cd $c_w_dir

time ../../cubefit.x -xyz refined.xyz -dens ../../cubes/3_SCAN_1_2_3_4_F/B.d.cube -esp ../../cubes/3_SCAN_1_2_3_4_F/B.p.cube -stepsize 0.2 -n_steps 5000 -learning_rate 0.5 
