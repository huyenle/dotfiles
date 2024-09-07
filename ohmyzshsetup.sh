#!/bin/bash

# Function to check for Zsh and install if missing
install_zsh() {
    if ! command -v zsh &> /dev/null
    then
        echo "Zsh not found. Installing Zsh..."
        if [ "$(uname)" == "Darwin" ]; then
            # MacOS
            brew install zsh
        elif [ -f /etc/debian_version ]; then
            # Debian-based distros
            sudo apt update && sudo apt install -y zsh
        elif [ -f /etc/redhat-release ]; then
            # RedHat-based distros
            sudo yum install -y zsh
        else
            echo "Unsupported OS. Please install Zsh manually."
            exit 1
        fi
    else
        echo "Zsh is already installed."
    fi
}

# Install Oh My Zsh if not installed
install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Clone Powerlevel10k theme using absolute path
install_powerlevel10k() {
    bash brew install powerlevel10k
    echo "source $(brew --prefix)/Cellar/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
}

# Install fonts for Powerlevel10k (Optional but recommended)
install_fonts() {
    echo "Installing recommended fonts for Powerlevel10k..."
    bash p10k configure
}

# Main function to orchestrate installation
main() {
    install_zsh
    install_oh_my_zsh
    install_powerlevel10k
    configure_zshrc
    install_fonts

    echo "Powerlevel10k installation completed. Please restart your terminal or run 'exec zsh'."
}

# Execute main function
main
