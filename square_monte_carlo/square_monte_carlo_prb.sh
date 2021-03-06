#!/bin/bash
#
gcc -c -g -I/$HOME/include square_monte_carlo_prb.c >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling square_monte_carlo_prb.c"
  exit
fi
rm compiler.txt
#
gcc square_monte_carlo_prb.o /$HOME/libc/$ARCH/square_monte_carlo.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading square_monte_carlo_prb.o."
  exit
fi
#
rm square_monte_carlo_prb.o
#
mv a.out square_monte_carlo_prb
./square_monte_carlo_prb > square_monte_carlo_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running square_monte_carlo_prb."
  exit
fi
rm square_monte_carlo_prb
#
echo "Program output written to square_monte_carlo_prb_output.txt"
