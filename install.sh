#!/bin/bash

# Install all packages and tools

# Pacman
sudo pacman -S \
    neofetch \
    kitty \
    firefox \
    neovim \
    stow \
    tldr \
    fzf \
    btop \
    bat \
    zoxide \
    eza \
    fd \
    wget \
    lazygit \
    ripgrep \
    tmux \
    zsh \
    yazi \
    ffmpegthumbnailer \
    unarchiver \
    jq \
    yay \
    xcape

sudo pacman -Syu

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --import -

yay -S ttf-meslo-nerd \
    ttf-meslo-nerd-font-powerlevel10k \
    spotify 

yay -Syu

# Others
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
chsh --shell $(which zsh)
