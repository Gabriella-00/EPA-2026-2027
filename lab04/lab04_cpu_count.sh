#!/bin/bash

num_cpu=$(grep processor /proc/cpuinfo | wc -l)

if [ $num_cpu -lt $1 ]; then
  echo "Error: only $num_cpu CPUs, at least $1 needed"
  exit 1
else
  echo "OK: $num_cpu CPUs"
fi
