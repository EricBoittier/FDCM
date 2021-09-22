#!/bin/bash
#SBATCH --job-name=fit_scan
#SBATCH --nodes=1
#SBATCH --ntasks=1

hostname

c_w_dir=$PWD
cd $c_w_dir

n_steps=1
scan_name="_SCAN_1_2_6_8_F/O."
cubes_dir="../../cube_files/"

output_dir="acrolein"
mkdir -p $output_dir
cd $output_dir

start=0

frames="../../../pydcm-1.2/acrolein-min/frames.txt"
initial_fit="../../../pydcm-1.2/acrolein-min/5-refine/23-charges/23_charges_refined.xyz"

for start in {0..16}
do

next=$(($start+1))

output_name=$output_dir"-"$start"-"$next".xyz"
dir=$start"_"$next

mkdir -p $dir

cd $dir


echo $PWD

python ~/AdjustReference-System/ARS.py $initial_fit $cubes_dir$output_dir/$start$scan_name"d.cube" $cubes_dir$output_dir/$next$scan_name"d.cube" $frames $output_name > "ARS.log"

cat "ARS.log"

cp $output_name refined.xyz

time ../../cubefit.x -xyz refined.xyz -dens $cubes_dir$output_dir/"$next"$scan_name"d.cube" -esp  $cubes_dir$output_dir/"$next"$scan_name"p.cube" -stepsize 0.2 -n_steps $n_steps -learning_rate 0.5 > "GD.log"

cat "GD.log"

cp refined.xyz $next"_final.xyz"

initial_fit=../$start"_"$next"/"$next"_final.xyz"

start=$(($start+1))
next=$(($start+1))

 
cd ..

done



