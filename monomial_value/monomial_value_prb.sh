#!/bin/bash
#
gcc -c -I/$HOME/include monomial_value_prb.c
if [ $? -ne 0 ]; then
  echo "Errors compiling monomial_value_prb.c"
  exit
fi
#
gcc -o monomial_value_prb monomial_value_prb.o /$HOME/libc/$ARCH/monomial_value.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading monomial_value_prb.o."
  exit
fi
#
rm monomial_value_prb.o
#
./monomial_value_prb > monomial_value_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running monomial_value_prb."
  exit
fi
rm monomial_value_prb
#
echo "Program output written to monomial_value_prb_output.txt"
