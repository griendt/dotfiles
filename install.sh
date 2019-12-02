#!/bin/bash

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    ./get-oh-my-zsh.sh
fi

# Copy all dotfiles to the home directory
cp ./.* ~ > /dev/null 2>&1

# Copy the theme file
cp alex.zsh-theme ~/.oh-my-zsh/themes/

# Copy the docker config file
mkdir -p ~/.docker && cp docker_config.json ~/.docker/config.json

# Reload the shell
source ~/.zshrc
