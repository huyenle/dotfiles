# List files
# Define the path to the Homebrew installation script
INSTALL_SCRIPT_HOMEBREW="./brew/brewsetup.sh"
BREWFILE="./brew/Brewfile"
VSCODE_SETTING="./vscode/settings.json"
INSTALL_SCRIPT_OHMYZSH="./zsh/ohmyzshsetup.sh"

# MacOS setting
## Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES

## Install brew
chmod +x $INSTALL_SCRIPT_HOMEBREW
bash $INSTALL_SCRIPT_HOMEBREW

## Install zsh
chmod +x $INSTALL_SCRIPT_OHMYZSH
bash $INSTALL_SCRIPT_OHMYZSH

## Symlink dot file to home
echo "This is your home folder: $HOME"
### vs code
ln -sf "$(pwd)/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
### git config
stow git -t $HOME/
### Other settings 

