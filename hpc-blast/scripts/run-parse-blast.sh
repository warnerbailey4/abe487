#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q windfall
#PBS -l jobtype=cluster_only
#PBS -l select=1:ncpus=2:mem=4gb
#PBS -l place=pack:shared
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00
#PBS -M warnerbailey4@email.arizona.edu
#PBS -m bea

module load blast
module load perl
cd $BLAST_OUT_DIR
BLOUT="$BLAST_OUT_DIR/$FILE.${PBS_ARRAY_INDEX}.blastout"
echo File \"$FILE.${PBS_ARRAY_INDEX}.blastout\"
$SCRIPT_DIR/01-bio-searchio.pl $BLOUT > $BLOUT.parsed
