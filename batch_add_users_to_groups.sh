#!/bin/bash

# Check for required commands
command -v gh >/dev/null 2>&1 || { echo >&2 "The GitHub CLI (gh) is required but it's not installed. Aborting."; exit 1; }

# Function to display usage instructions
usage() {
    echo "Usage: $0 -o <organization> -f <file>"
    echo "File format: username,group_slug"
    exit 1
}

# Parse command line arguments
while getopts ":o:f:" opt; do
  case $opt in
    o)
      ORG=$OPTARG
      ;;
    f)
      FILE=$OPTARG
      ;;
    *)
      usage
      ;;
  esac
done

# Check if all required arguments are provided
if [ -z "$ORG" ] || [ -z "$FILE" ]; then
    usage
fi

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

# Read the file and process each line
while IFS=',' read -r USERNAME GROUP_SLUG; do
    # Remove any trailing whitespace or control characters
    USERNAME=$(echo "$USERNAME" | tr -d '\r' | xargs)
    GROUP_SLUG=$(echo "$GROUP_SLUG" | tr -d '\r' | xargs)

    if [ -n "$USERNAME" ] && [ -n "$GROUP_SLUG" ]; then
        ./add_user_to_group.sh -o "$ORG" -g "$GROUP_SLUG" -u "$USERNAME"
    else
        echo "Skipping invalid line: $USERNAME,$GROUP_SLUG"
    fi
done < "$FILE"

echo "All operations completed."
