#!/bin/bash

sudo pacman -Syu

# Repo
force_install() {
    local package=$1
    sudo pacman -S $package
}
install() {
    local package=$1
    if command pacman -Qs | grep $package &> /dev/null; then
        echo "$package is already installed."
    else
        echo "$package is not installed. trying to install $package ...\n"
        sudo pacman -S $package
    fi
}

echo "#Repo"
install "git"
install "curl"
install "wget"
install "net-tools"
install "gcc"
install "zsh"
install "telegram-desktop"
install "docker"
install "htop"
install "openssh"
install "ranger"
install "nano"
install "vim"
install "neovim"
install "tmux"
install "dbeaver"
force_install "go"

# AUR
install_from_AUR() {
    local app_command=$1
    local git_repo_name=$2
    if command pacman -Qs | grep $app_command &> /dev/null; then
        echo "$app_command  is already installed."
    else
        echo "$app_command is not installed. trying to install $app_command ...\n"
        git clone https://aur.archlinux.org/$git_repo_name.git
        cd $git_repo_name
        makepkg -sif
        cd ..
        sudo rm -r $git_repo_name
    fi
}

echo "#AUR"
install_from_AUR "google-chrome" "google-chrome"
install_from_AUR "vscode" "visual-studio-code-bin"
install_from_AUR "postman" "postman-bin"