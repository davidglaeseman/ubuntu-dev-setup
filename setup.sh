#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git zsh vim -y

# Clone Devilbox
git clone https://github.com/cytopia/devilbox ~/Websites
cp ~/Websites/env-example ~/Websites/.env

# Setup docker permissions and install docker snap
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
sudo apt install docker
sudo apt install docker-compose


# Install OH My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)
