#!/bin/bash
#SBATCH --job-name=1_2
#SBATCH --nodes=1
#SBATCH --ntasks=1

hostname

c_w_dir=$PWD
cd $c_w_dir

time ../../cubefit.x -xyz refined.xyz -dens ../../cubes/2_SCAN_1_2_3_4_F/B.d.cube -esp ../../cubes/2_SCAN_1_2_3_4_F/B.p.cube

