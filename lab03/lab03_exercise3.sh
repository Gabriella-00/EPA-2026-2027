#!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item"
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0"
else
	echo "You passed in $1 to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine"

# Count the running processes (ps -ef piped into wc -l)
ct=$(ps -ef | wc -l)

if [ $ct -gt $1 ]; then
  msg="Maximum number of processes exceeded"
else
  msg="The maximum number of processes NOT exceeded"
fi

# Show the message on screen or write it to the file
if [ "$2" = "screen" ]; then
  echo "$msg"
elif [ "$2" = "file" ]; then
  echo "$(date) - $msg" >> process_log.txt
else
  echo "The second option must be screen or file"
  exit 1
fi
