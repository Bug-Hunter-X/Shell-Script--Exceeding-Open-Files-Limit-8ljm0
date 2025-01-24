#!/bin/bash

# This script attempts to process a large file, but it fails due to exceeding the maximum number of open files limit.

# It creates 10,000 temporary files, causing the open files limit to be exceeded.

for i in $(seq 1 10000); do
  touch /tmp/tempfile_$i
done