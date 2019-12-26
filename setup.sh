#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git zsh vim -y

# Install OH My ZSH
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Setup docker permissions and install docker snap
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
sudo snap install docker

# Clone Devilbox
git clone https://github.com/cytopia/devilbox ~/Websites
