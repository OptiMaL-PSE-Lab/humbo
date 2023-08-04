#!/bin/bash
#PBS -N toy
#PBS -j oe
#PBS -o toy/logs.out
#PBS -e toy/logs.err
#PBS -lselect=1:ncpus=64:mem=32gb
#PBS -lwalltime=4:00:00

module load anaconda3/personal

cd $PBS_O_WORKDIR
source activate multi_fidelity_experimental_design_env
python3 toy/toy.py