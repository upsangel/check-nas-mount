#!/bin/bash

# Define the path to the file we're checking
file_path="/home/frigate/omv_everyone/frigate/media/mountcheck.txt"

# Check if the file exists
if [ ! -f "$file_path" ]; then
  # File doesn't exist, run the 'mount -a' command
  echo "File doesn't exist. Running 'mount -a'..."
  mount -a
else
  # File exists, exit the script
  echo "File exists. Exiting."
  exit 0
fi
