#!/bin/bash

# paths to Broccoli, FastTree, and DIAMOND
broccoli=/path/to/broccoli.py
fasttree=/path/to/fasttree
diamond=/path/to/diamond
# conda base path
CONDA_BASE=$(conda info --base)
# path to dataset 
dataset=/path/to/example_dataset/
# output folder (in current working directory) 
outpath=results_broccoli/

echo;  echo "-------Starting Broccoli test with example_dataset-------"; echo

# allow conda to run from script 
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate env-broccoli

python $broccoli -dir $dataset \
-path_diamond $diamond \
-path_fasttree $fasttree

conda deactivate 

mkdir $outpath
mv dir_step1 dir_step2 dir_step3 dir_step4 $outpath  

echo; echo "-------Broccoli test complete!-------" ; echo

# pic files are, python pickle files
echo; echo "output python pickle files:" ; echo
find $outpath -type f -name '*.pic'
echo; echo
