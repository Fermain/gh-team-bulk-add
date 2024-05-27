#!/bin/bash

# Check for required commands
command -v gh >/dev/null 2>&1 || { echo >&2 "The GitHub CLI (gh) is required but it's not installed. Aborting."; exit 1; }

# Function to display usage instructions
usage() {
    echo "Usage: $0 -o <organization> -g <group_slug> -u <username>"
    exit 1
}

# Parse command line arguments
while getopts ":o:g:u:" opt; do
  case $opt in
    o)
      ORG=$OPTARG
      ;;
    g)
      GROUP_SLUG=$OPTARG
      ;;
    u)
      USERNAME=$OPTARG
      ;;
    *)
      usage
      ;;
  esac
done

# Check if all required arguments are provided
if [ -z "$ORG" ] || [ -z "$GROUP_SLUG" ] || [ -z "$USERNAME" ]; then
    usage
fi

# Add user to the specified group
echo "Adding $USERNAME to $GROUP_SLUG in $ORG organization..."
gh api \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  "/orgs/$ORG/teams/$GROUP_SLUG/memberships/$USERNAME" \
  -f role=member

if [ $? -eq 0 ]; then
    echo "Successfully added $USERNAME to $GROUP_SLUG in $ORG organization."
else
    echo "Failed to add $USERNAME to $GROUP_SLUG in $ORG organization."
fi

echo "Operation completed."
