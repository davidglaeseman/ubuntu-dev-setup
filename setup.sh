#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git zsh vim gnome-shell gnome-tweak-tool unity-tweak-tool -y

# Setup a theme folder for Tweaks
mkdir ~/.themes

# Clone Devilbox
git clone https://github.com/cytopia/devilbox ~/Websites
cp ~/Websites/env-example ~/Websites/.env

# Install Docker
sudo apt install docker
sudo apt install docker-compose


# Install OH My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)
