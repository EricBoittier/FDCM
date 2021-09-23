#!/bin/bash

#SBATCH --job-name=5_SCAN_N.pdb
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
# 
#$ -S /bin/bash
source /opt/cluster/programs/g09_d.01/g09/bsd/g09.login.bash
#source /opt/Modules/etc/profile.modules

 
#set -xv
mkdir -p /scratch/$USER/5_SCAN_N.pdb
export GAUSS_SCRDIR=/scratch/$USER/5_SCAN_N.pdb

$GAUSSIAN_EXE /home/unibas/boittier/RDKit_G2/N.pdb/SCAN_1_2_6_8_S_17_20.0/5_SCAN_1_2_6_8_F/5_SCAN_N.pdb.com /scratch/$USER/5_SCAN_N.pdb/5_SCAN_N.pdb.out

# don't delete the result file if not able to copy to fileserver 
cp /scratch/$USER/5_SCAN_N.pdb/5_SCAN_N.pdb.out /home/unibas/boittier/RDKit_G2/N.pdb/SCAN_1_2_6_8_S_17_20.0/5_SCAN_1_2_6_8_F/5_SCAN_N.pdb.out 
status=$?
if [ $status -eq 0 ] 
then 
   rm -rf /scratch/$USER/5_SCAN_N.pdb
else
   host=`/bin/hostname`
   /usr/bin/Mail -v -s "Error at end of batch job" $USER@verdi.cluster <<EOF

At the end of the batch job the system could not copy the output file
	$host:/scratch/$USER/5_SCAN_N.pdb/5_SCAN_N.pdb.out
to
	/home/unibas/boittier/RDKit_G2/N.pdb/SCAN_1_2_6_8_S_17_20.0/5_SCAN_1_2_6_8_F/5_SCAN_N.pdb.out
Please copy this file by hand or inform the system manager.

EOF
 
fi
