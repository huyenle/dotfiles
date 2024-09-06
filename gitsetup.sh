gitsetup() {
    echo "WARNING: not checking for existing SSH keys\!"

    # Use current branch only when doing git push
    git config --global push.default current

    echo "What’s your git name?"
    read GIT_SETUP_NAME
    git config --global user.name $GIT_SETUP_NAME

    echo "What’s your git email?"
    read GIT_SETUP_EMAIL
    git config --global user.email $GIT_SETUP_EMAIL

    echo "Now configuring SSH keys..."
    ssh-keygen -t ed25519 -C $GIT_SETUP_EMAIL

    echo "Let’s start the ssh-agent..."
    eval "$(ssh-agent -s)"

    echo "Adding SSH key..."
    ssh-add ~/.ssh/id_ed25519

    echo "Now copying SSH key to clipboard..."
    pbcopy < ~/.ssh/id_ed25519.pub

    echo "Now go to your github setting page and add the SSH key. You are then set"

    # Use the patience algorithm for diffing
    git config --global diff.algorithm histogram

    git config --global diff.colorMoved default
}

gitsetup