#!/bin/bash
#SBATCH --job-name=fit_scan
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --array=0-36
##SBATCH --output=../outfile/array_%A-%a.out

hostname

c_w_dir=$PWD
cd $c_w_dir
cd ..

n_steps=0
scan_name="_SCAN/B."
cubes_dir="/home/unibas/boittier/RDKit_G2/B.pdb/SCAN_1_2_3_4_S_36_10.0"
output_dir="fbuta-f_0"

mkdir -p $output_dir
cd $output_dir

frames="/home/unibas/boittier/pydcm-1.2/models/test3/frames.txt"
initial_fit="/home/unibas/boittier/FDCM/mdcms/f_butadiene/21_charges_refined.xyz"
initial_fit_cube="/home/unibas/boittier/RDKit_G2/B.pdb/OPT_B3LYP_6-31+G/B.d.cube"

FILE="refined.xyz"
if [ ! -f "$FILE" ]; then


python ~/AdjustReference-System/ARS.py $initial_fit $initial_fit_cube  $cubes_dir/0$scan_name"p.cube" $frames 0_fit.xyz

time ../cubefit.x -xyz global_0_fit.xyz -dens $cubes_dir/0"$scan_name"d.cube -esp  $cubes_dir/"0"$scan_name"p.cube" -stepsize 0.2 -n_steps $n_steps -learning_rate 0.5 > "GD.log"
cat "GD.log"

fi

initial_fit="../refined.xyz"

# 
# Do concerted fit with Slurm array jobs
#
start=$SLURM_ARRAY_TASK_ID
next=$(($start+1))
output_name=$output_dir"-"$start"-"$next".xyz"
dir=$start"_"$next
mkdir -p $dir
cd $dir
echo $PWD

python ~/AdjustReference-System/ARS.py $initial_fit $cubes_dir/$start$scan_name"d.cube" $cubes_dir/$next$scan_name"d.cube" $frames $output_name > "ARS.log"
cat "ARS.log"
cp "global_"$output_name refined.xyz

time ../../cubefit.x -xyz refined.xyz -dens $cubes_dir/"$next"$scan_name"d.cube" -esp  $cubes_dir/"$next"$scan_name"p.cube" -stepsize 0.2 -n_steps $n_steps -learning_rate 0.5 > "GD.log"
cat "GD.log"
cp refined.xyz $next"_final.xyz"

#initial_fit=../$start"_"$next"/"$next"_final.xyz"
#start=$(($start+1))
#next=$(($start+1))


