#!/bin/bash

# You should be able to reproduce the output files located in the directories
# 32bit or 64bit (depending on your hardware) copying this script to the upper
# directory:
# cp example.sh ..
# and then executing it:
# cd ..
# bash example.sh

# Compilation
make
make -f makefile_trunc

#Run
./candia.x 0 0 1 1 1 e0
./candia.x 1 6 1 1 1 e1
./candia.x 2 7 1 1 1 e2
./candia_trunc.x 1 6 1 1 1 t1
./candia_trunc.x 2 7 1 1 1 t2
