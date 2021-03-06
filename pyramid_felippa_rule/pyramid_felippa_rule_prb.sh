#!/bin/bash
#
gcc -c -I/$HOME/include pyramid_felippa_rule_prb.c
if [ $? -ne 0 ]; then
  echo "Errors compiling pyramid_felippa_rule_prb.c"
  exit
fi
#
gcc pyramid_felippa_rule_prb.o /$HOME/libc/$ARCH/pyramid_felippa_rule.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading pyramid_felippa_rule_prb.o."
  exit
fi
#
rm pyramid_felippa_rule_prb.o
#
mv a.out pyramid_felippa_rule_prb
./pyramid_felippa_rule_prb > pyramid_felippa_rule_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running pyramid_felippa_rule_prb."
  exit
fi
rm pyramid_felippa_rule_prb
#
echo "Program output written to pyramid_felippa_rule_prb_output.txt"
