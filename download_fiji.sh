#!/bin/bash

# Default directory is the current directory
save_dir="."

# URL to download the file from
url="https://downloads.micron.ox.ac.uk/fiji_update/mirrors/fiji-latest/fiji-linux64.zip"

# Check if an argument is provided
if [ "$1" ]; then
  save_dir="$1"
fi

# Ensure the directory exists
if [ ! -d "$save_dir" ]; then
  echo "Directory $save_dir does not exist. Creating it..."
  mkdir -p "$save_dir"
fi

# Use wget to download the file
wget -P "$save_dir""/temp" "$url"

# Unzip the archive
unzip "$save_dir""/temp""/fiji-linux64.zip" -d "$save_dir"

# Inform the user
echo "File downloaded to: $save_dir"



