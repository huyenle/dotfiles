# List files
# Define the path to the Homebrew installation script
INSTALL_SCRIPT_HOMEBREW="./brew/brewsetup.sh"
BREWFILE="./brew/Brewfile"
VSCODE_SETTING="./vscode/settings.json"

# MacOS setting
## Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES

## Install brew
chmod +x $INSTALL_SCRIPT_HOMEBREW

## Symlink dot file to home
echo "This is your home folder: $HOME"
### vs code
ln -sf "./vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
### git config
stow git -t $HOME/
### Other settings 

