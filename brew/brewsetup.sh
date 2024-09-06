#!/bin/bash
# Function to install Homebrew
install_homebrew() {
    if command -v brew &>/dev/null; then
        echo "Homebrew is already installed."
    else
        echo "Homebrew is not installed. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        if [ -x "$(command -v brew)" ]; then
            echo "Homebrew installed successfully."
        else
            echo "Failed to install Homebrew."
            exit 1
        fi
    fi
}

# Function to install packages from Brewfile
install_from_brewfile() {
    if [ -f "$BREWFILE" ]; then
        echo "Found Brewfile. Installing packages from Brewfile..."
        
        # Update Homebrew to make sure we have the latest package information
        brew update
        
        # Install packages listed in the Brewfile
        brew bundle --file="$BREWFILE"
        
        if [ $? -eq 0 ]; then
            echo "Packages from Brewfile installed successfully."
        else
            echo "Failed to install packages from Brewfile."
            exit 1
        fi
    else
        echo "Brewfile not found. Skipping Brewfile installation."
    fi
}

install_homebrew
install_from_brewfile
