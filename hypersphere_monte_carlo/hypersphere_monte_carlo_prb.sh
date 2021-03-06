#!/bin/bash
#
gcc -c -g -I/$HOME/include hypersphere_monte_carlo_prb.c >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling hypersphere_monte_carlo_prb.c"
  exit
fi
rm compiler.txt
#
gcc hypersphere_monte_carlo_prb.o /$HOME/libc/$ARCH/hypersphere_monte_carlo.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading hypersphere_monte_carlo_prb.o."
  exit
fi
#
rm hypersphere_monte_carlo_prb.o
#
mv a.out hypersphere_monte_carlo_prb
./hypersphere_monte_carlo_prb > hypersphere_monte_carlo_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running hypersphere_monte_carlo_prb."
  exit
fi
rm hypersphere_monte_carlo_prb
#
echo "Program output written to hypersphere_monte_carlo_prb_output.txt"
