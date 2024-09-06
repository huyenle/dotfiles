#!/bin/bash

# Define the path to the Brewfile
BREWFILE="Brewfile"

# Function to update the Brewfile
update_brewfile() {
    echo "Updating Brewfile..."

    # Check if Homebrew is installed
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi

    # Generate or update the Brewfile
    brew bundle dump --file="$BREWFILE" --force

    if [ $? -eq 0 ]; then
        echo "Brewfile updated successfully at $BREWFILE."
    else
        echo "Failed to update the Brewfile."
        exit 1
    fi
}

# Run the update function
update_brewfile
