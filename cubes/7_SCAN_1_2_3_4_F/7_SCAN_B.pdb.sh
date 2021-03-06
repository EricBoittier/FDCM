#!/bin/bash

#SBATCH --job-name=7_SCAN_B.pdb
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
# 
#$ -S /bin/bash
source /opt/cluster/programs/g09_d.01/g09/bsd/g09.login.bash
#source /opt/Modules/etc/profile.modules

 
#set -xv
mkdir -p /scratch/$USER/7_SCAN_B.pdb
export GAUSS_SCRDIR=/scratch/$USER/7_SCAN_B.pdb

$GAUSSIAN_EXE /home/unibas/boittier/RDKit_G2/B.pdb/SCAN_1_2_3_4_S_17_20.0/7_SCAN_1_2_3_4_F/7_SCAN_B.pdb.com /scratch/$USER/7_SCAN_B.pdb/7_SCAN_B.pdb.out

# don't delete the result file if not able to copy to fileserver 
cp /scratch/$USER/7_SCAN_B.pdb/7_SCAN_B.pdb.out /home/unibas/boittier/RDKit_G2/B.pdb/SCAN_1_2_3_4_S_17_20.0/7_SCAN_1_2_3_4_F/7_SCAN_B.pdb.out 
status=$?
if [ $status -eq 0 ] 
then 
   rm -rf /scratch/$USER/7_SCAN_B.pdb
else
   host=`/bin/hostname`
   /usr/bin/Mail -v -s "Error at end of batch job" $USER@verdi.cluster <<EOF

At the end of the batch job the system could not copy the output file
	$host:/scratch/$USER/7_SCAN_B.pdb/7_SCAN_B.pdb.out
to
	/home/unibas/boittier/RDKit_G2/B.pdb/SCAN_1_2_3_4_S_17_20.0/7_SCAN_1_2_3_4_F/7_SCAN_B.pdb.out
Please copy this file by hand or inform the system manager.

EOF
 
fi
