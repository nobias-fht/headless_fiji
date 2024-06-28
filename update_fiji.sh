#!/bin/bash

# Default values for arguments
fiji=""
sites=""
site_url="https://sites.imagej.net/"

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --fiji) fiji="$2"; shift ;;
        --sites) sites="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Check if both arguments are provided
if [[ -z "$fiji" || -z "$sites" ]]; then
    echo "Both --fiji and --sites arguments are required."
    exit 1
fi

# Read the JSON file and run the executable on all entries
args=()
for key in $(jq -r 'keys[]' "$sites"); do
    value=$(jq -r --arg key "$key" '.[$key]' "$sites")
    path="$site_url${value}/"

    # print to console
    echo "Adding ${key} at site ${path}"

    args+=("$key" "$path")
done

"$fiji/ImageJ-linux64" --update add-update-sites "${args[@]}" 
"$fiji/ImageJ-linux64" --update update
