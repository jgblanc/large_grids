#!/bin/sh
output=$1
nchr=$2
prefix=$3

for ((i=2; i<=nchr; i++))
do
    echo $prefix/genos.recoded_$i >> $output
done
