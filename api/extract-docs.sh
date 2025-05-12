#!/bin/bash

# Script to extract documentation files from a combined file
# and place them in their appropriate directories

# Base directory for documentation
BASE_DIR="../docs"

# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

# Function to create directory if it doesn't exist
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Created directory: $1"
    fi
}

# Create all required directories based on the doc structure
create_dir "$BASE_DIR/getting-started"
create_dir "$BASE_DIR/core-concepts"
create_dir "$BASE_DIR/resources"
create_dir "$BASE_DIR/api-reference"
create_dir "$BASE_DIR/tutorials"
create_dir "$BASE_DIR/advanced"
create_dir "$BASE_DIR/developer-resources"
create_dir "$BASE_DIR/support"

# Check if the combined file exists
if [ ! -f "../ai-files/all-docs.md" ]; then
    echo "Error: all-docs.md file not found!"
    exit 1
fi

# Process the file and extract documentation
echo "Extracting documentation files..."

# Use awk to parse the file and extract individual documentation files
awk -v BASE_DIR="$BASE_DIR" '
BEGIN {
    in_file = 0
    current_file = ""
    content = ""
}

/^--- FILE: / {
    # If we were processing a file, save it
    if (in_file && current_file != "") {
        print "Writing to " current_file
        print content > current_file
        close(current_file)
        content = ""
    }
    
    # Extract the new filename
    match($0, /^--- FILE: (.+)$/, arr)
    current_file = BASE_DIR "/" arr[1]
    in_file = 1
    next
}

{
    if (in_file) {
        content = content $0 "\n"
    }
}

END {
    # Save the last file
    if (in_file && current_file != "") {
        print "Writing to " current_file
        print content > current_file
        close(current_file)
    }
}
' "../ai-files/all-docs.md"

if [ $? -ne 0 ]; then
    echo "Error: Failed to process all-docs.md"
    exit 1
fi

echo "Documentation extraction complete!"
echo "Files have been placed in the $BASE_DIR directory structure."