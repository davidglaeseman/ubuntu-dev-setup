#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git zsh vim -y

# Install OH My ZSH
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
