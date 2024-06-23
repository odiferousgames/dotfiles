#!/bin/bash

# Install all packages and tools

# Pacman
sudo pacman -S \
    neofetch \
    i3 \
    kitty \
    dmenu \
    firefox \
    xorg \
    xf86-video-amdgpu \
    neovim \
    stow \
    tldr \
    brightnessctl \
    xorg-xev \
    telegram-desktop \
    fzf \
    btop \
    bat \
    zoxide \
    eza \
    xss-lock \
    fd \
    wget \
    lazygit \
    ripgrep \
    dunst \
    blueman \
    docker \
    docker-compose \
    tmux \
    xcape \
    zsh \
    network-manager-applet \
    autorandr \
    arandr \
    tlp \
    tlp-rdw \
    yazi \
    ffmpegthumbnailer \
    unarchiver \
    jq \
    poppler 

sudo pacman -Syu

# Yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ~/dotfiles

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --import -

yay -S ttf-meslo-nerd \
    ttf-meslo-nerd-font-powerlevel10k \
    picom \
    polybar \
    feh \
    rofi \
    batsignal \
    lazydocker \
    spotify \
    proton-vpn-gtk-app

yay -Syu

# Others
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
systemctl enable bluetooth.service
systemctl start bluetooth.service
systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket
chsh --shell $(which zsh)
