#!/bin/bash

# This script addresses the open files limit issue by processing the files in batches.

# Adjust MAX_OPEN_FILES to a value that works for your system.
MAX_OPEN_FILES=1000

for ((i=1; i<=10000; i+=MAX_OPEN_FILES)); do
  # Array to hold file descriptors
  fds=() 
  # Create a limited number of files and store the file descriptors
  for ((j=i; j<i+MAX_OPEN_FILES && j<=10000; j++)); do
    exec 3>&- # close file descriptor 3 if it's open from previous iteration 
    exec 3<>/tmp/tempfile_$j #open the file and associate it with fd 3
    fds+=("3")
  done
  #Process the files here, using file descriptor 3
  # Example:
  #for fd in "${fds[@]}"; do
  #  echo "Processing file with descriptor $fd" >&3
  #done

  # Close all the files (Important!)
  for fd in "${fds[@]}"; do
      exec >&3- # Close the file descriptor 
  done 

  #Remove temp files
  for ((k=i; k<i+MAX_OPEN_FILES && k<=10000; k++)); do
    rm /tmp/tempfile_$k
  done
done