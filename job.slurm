#!/bin/bash
#SBATCH --job-name=4_5
#SBATCH --nodes=1
#SBATCH --ntasks=1

hostname

c_w_dir=$PWD
cd $c_w_dir

start=5
next=$(($start+1))


time ./../cubefit.x -xyz refined.xyz -dens ../../cubes/"$next"_SCAN_1_2_3_4_F/B.d.cube -esp ../../cubes/"$next"_SCAN_1_2_3_4_F/B.p.cube -stepsize 0.2 -n_steps 1000 -learning_rate 0.5 
