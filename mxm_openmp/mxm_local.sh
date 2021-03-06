#!/bin/bash
#
#  Compile the program with GCC.
#
/usr/local/bin/gcc -fopenmp mxm_openmp.c
#
#  Compile the program with ICC.
#
#icc -openmp -parallel mxm_openmp.c
#
mv a.out mxm
#
#  Run with 1, 2, 4 and 8 threads.
#
echo "Run with 1 thread."
export OMP_NUM_THREADS=1
./mxm > mxm_local_output.txt
#
echo "Run with 2 threads."
export OMP_NUM_THREADS=2
./mxm >> mxm_local_output.txt
#
echo "Run with 4 threads."
export OMP_NUM_THREADS=4
./mxm >> mxm_local_output.txt
#
echo "Run with 8 threads."
export OMP_NUM_THREADS=8
./mxm >> mxm_local_output.txt
#
#  Discard the executable file.
#
rm mxm
#
echo "Program output written to mxm_local_output.txt"
