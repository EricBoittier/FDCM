#!/bin/bash
#SBATCH --job-name=water_10
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --output=/home/unibas/boittier/FDCM/out_files/water_10.out
hostname

olivers_code="/home/boittier/esp_check/bin/cubefit.x"

c_w_dir=$PWD
cd $c_w_dir
cd ..

n_steps=10
n_charges=6
scan_name="2_2_2_new"
cubes_dir="/home/boittier/v1/"
output_dir="water_10"
frames="/home/boittier/v1/frames.txt"
initial_fit="/home/boittier/v1/6_charges_refined.xyz"
initial_fit_cube="/home/boittier/v1/2_2_2_new.com.chk.p.cube"


mkdir -p $output_dir
cd $output_dir
# Do Initial Fit
#
# adjust reference frame
python ~/AdjustReference-System/ARS.py $initial_fit $initial_fit_cube.d.cube  $cubes_dir/$scan_name"p.cube" $frames 0_fit.xyz > "ARS.log"
# do gradient descent fit
time ../cubefit.x -xyz global_0_fit.xyz -dens $cubes_dir/$scan_name"d.cube -esp  $cubes_dir/$scan_name"p.cube" -stepsize 0.2 -n_steps $n_steps -learning_rate 0.5 > "GD.log"
# make a cubefile for the fit
$olivers_code -v -generate -esp  $cubes_dir/$scan_name"p.cube" -dens  $cubes_dir/$scan_name"d.cube" -xyz refined.xyz > "cubemaking.log"
# do analysis
$olivers_code -v -analysis -esp  $cubes_dir/$scan_name"p.cube" -esp2 $n_charges"charges.cube" -dens  $cubes_dir/$scan_name"d.cube" > "analysis.log"

initial_fit="../refined.xyz"


next=$(($start+1))
output_name=$output_dir$next".xyz"
dir=$start"_"$next
mkdir -p $dir
cd $dir
echo $PWD

python ~/AdjustReference-System/ARS.py $initial_fit $cubes_dir/$scan_name"d.cube" $cubes_dir/$scan_name"d.cube" $frames $output_name > "ARS.log"

cp "global_"$output_name refined.xyz

time ../../cubefit.x -xyz refined.xyz -dens $cubes_dir/"$next"$scan_name"d.cube" -esp  $cubes_dir/"$next"$scan_name"p.cube" -stepsize 0.2 -n_steps $n_steps -learning_rate 0.5 > "GD.log"

cp refined.xyz final.xyz

# make a cubefile for the fit
$olivers_code -v -generate -esp  $cubes_dir/$scan_name"p.cube" -dens  $cubes_dir/"$next"$scan_name"d.cube" -xyz refined.xyz > "cubemaking.log"
# do analysis
$olivers_code -v -analysis -esp  $cubes_dir/$scan_name"p.cube" -esp2 $n_charges"charges.cube" -dens  $cubes_dir/$scan_name"d.cube" > "analysis.log"

initial_fit=../$start"_"$next"/"$next"_final.xyz"
start=$(($start+1))
next=$(($start+1))

cd ..
done
