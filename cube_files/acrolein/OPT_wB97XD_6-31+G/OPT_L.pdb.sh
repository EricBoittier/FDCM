#!/bin/bash

#SBATCH --job-name=OPT_L.pdb
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
# 
#$ -S /bin/bash
source /opt/cluster/programs/g09_d.01/g09/bsd/g09.login.bash
#source /opt/Modules/etc/profile.modules

 
#set -xv
mkdir -p /scratch/$USER/OPT_L.pdb
export GAUSS_SCRDIR=/scratch/$USER/OPT_L.pdb

$GAUSSIAN_EXE /home/unibas/boittier/RDKit_G2/L.pdb/OPT_wB97XD_6-31+G/OPT_L.pdb.com /scratch/$USER/OPT_L.pdb/OPT_L.pdb.out

# don't delete the result file if not able to copy to fileserver 
cp /scratch/$USER/OPT_L.pdb/OPT_L.pdb.out /home/unibas/boittier/RDKit_G2/L.pdb/OPT_wB97XD_6-31+G/OPT_L.pdb.out 
status=$?
if [ $status -eq 0 ] 
then 
   rm -rf /scratch/$USER/OPT_L.pdb
else
   host=`/bin/hostname`
   /usr/bin/Mail -v -s "Error at end of batch job" $USER@verdi.cluster <<EOF

At the end of the batch job the system could not copy the output file
	$host:/scratch/$USER/OPT_L.pdb/OPT_L.pdb.out
to
	/home/unibas/boittier/RDKit_G2/L.pdb/OPT_wB97XD_6-31+G/OPT_L.pdb.out
Please copy this file by hand or inform the system manager.

EOF
 
fi
