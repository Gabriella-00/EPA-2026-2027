#!/bin/bash

usage() {
  echo "Usage: lab04_cpu_count.sh [MAX_NUM_CORES]"
}

if [ -z "$1" ]; then
  usage
  exit 1
fi

num_cpu=$(grep processor /proc/cpuinfo | wc -l)

num_nproc=$(nproc)

now=$(date)

if [ $num_cpu -lt $1 ]; then
  echo "$now - Error: only $num_cpu CPUs, at least $1 needed"
  exit 1
else
  echo "$now - OK: $num_cpu CPUs"
fi

echo "grep counted $num_cpu CPUs and nproc counted $num_nproc CPUs"

echo "nproc prints the number of CPUs available. I used it to check my grep count, so the result is more reliable."
echo "date prints the current date and time. I used it to add a time stamp to the messages, so I know when the check was done."
