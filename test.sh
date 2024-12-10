#!/bin/bash

NUM_ITERATIONS=10  # Define the number of iterations
CSV="increasing.csv"   # Example CSV file
TIMEOUT=60

./compile.sh

echo "instance,alpha,num_iterations,score,time" > $CSV

# Outer loop: iterate over instances
for path_instance in custom_dat/increasing_size/*.dat; do
  # Inner loop: iterate over alpha values from 0 to 1 in increments of 0.2
  for alpha in $(seq 0 0.2 1); do
    sleep 1

    # Call the solve function or script with timeout
    timeout "$TIMEOUT" ./run 3 "$path_instance" "$NUM_ITERATIONS" "$alpha" "$CSV"
    
    # Check if the timeout command timed out
    if [ $? -eq 124 ]; then
      echo $path_instance,$alpha,$NUM_ITERATIONS,NA,TO >> "$CSV"  # Append "TO" to the CSV file
    fi
  done
done
