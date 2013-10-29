#!/usr/bin/env bash

files="time globals heap
seqint seqbyte seqdouble seqob values string hashtable
smallob obops bootstrap stringbuf append pmstate
pmstack dblock pcode pm io imports list serialize
serializecollect hetarray rdfinit init main top hash callc stubs"
ofiles=""
for a in $files
do
gcc source/$a.c  -w -c -g -O0 -DLINUX -o bin/$a.o

echo "compiling $a.c"
ofiles="$ofiles bin/$a.o"
done
echo "linking to bin/fabl"
gcc $ofiles -o bin/fabl -lm
echo "done"
