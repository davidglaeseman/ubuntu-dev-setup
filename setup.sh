#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git zsh vim gnome-shell gnome-tweak-tool unity-tweak-tool snapd -y

# Setup a theme folder for Tweaks
mkdir ~/.themes
curl -L https://dllb2.pling.com/api/files/download/id/1577260560/s/20a4040011c7385ad1035621a57ace07f05bd4f51a95d55408feb562cdb9b51e0eab52e5e52e87b5af6f001134a09f444190bacebc5d19d352bc74762a5751eb/t/1577465841/c/f09d227037080407b1057ab47e27d9ad454849efdb0c50f97a5329671f34b8837c7c4b9eb698fbdd9dd79cf55e07040043fe7a00b5f3abe34ac8d17b32b31e65/lt/download/Mojave-dark.tar.xz --output ~/Downloads/mojave-dark.tar.xz
tar -xf ~/Downloads/mojave-dark.tar.xz -C ~/.themes/

# Install Default Applications
sudo snap install phpstorm --classic    #   web development
sudo snap install bitwarden             #   password manager
sudo snap install postman               #   api development
sudo snap install atom --classic        #   web development -- free edition if you don't have a phpstorm license
sudo snap install spotify               #   spotify music

# Install Docker
sudo apt install docker -y
sudo apt install docker-compose -y

# Clone Devilbox & copy base env
git clone https://github.com/cytopia/devilbox ~/Websites
cp ~/ubuntu-dev-setup/.env ~/Websites/.env

# Install OH My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)
