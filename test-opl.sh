#!/bin/bash

CSV=$1
# "increasing-opl.csv"
TIMEOUT=60

echo "instance,score,time" > $CSV

# Outer loop: iterate over instances
for path_instance in custom_dat/increasing_size/*.dat; do
    sleep 1

    out="sol-opl/$(basename $path_instance)".sol
    timeout $TIMEOUT oplrun opl/project.mod "$path_instance" > $out

    if [ $? -eq 124 ]; then
        objective=$(tail -n 1 $out | cut -c 40-49 | awk '{$1=$1};1' | sed 's/,/./')
        elapsed_time=TO
    else
        objective=$(grep "OBJECTIVE:" "$out" | awk '{print $2}')
        elapsed_time=$(grep "Total (root+branch&cut) =" "$out" | awk '{print $4}' | sed 's/,/./')
    fi
    echo $path_instance,$objective,$elapsed_time >> $CSV
done