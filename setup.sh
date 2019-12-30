#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install curl git zsh vim gnome-shell gnome-tweak-tool unity-tweak-tool snapd -y

#!/bin/bash
INSTALL_APPS=$1
if [ "$INSTALL_APPS" = true ]; then
  # Install Default Applications
  sudo snap install phpstorm --classic    #   web development
  sudo snap install bitwarden             #   password manager
  sudo snap install postman               #   api development
  sudo snap install atom --classic        #   web development -- free edition if you don't have a phpstorm license
  sudo snap install spotify               #   spotify music

  # Download hyper.js Terminal and Install
  curl -L https://releases.hyper.is/download/deb --output ~/Downloads/Hyper.deb
  sudo apt install -y ~/Downloads/Hyper.deb
fi

GITHUB_USER=$2
if [ "$GITHUB_USER" = true ]; then
  # Clone the Mojave Dark Theme -- Requires github account
  mkdir ~/.themes
  git clone git@github.com:vinceliuice/Mojave-gtk-theme.git ~/Themes/Mojave-Dark
  cp ~/Themes/Mojave-Dark/src ~/.themes/Mojave-Dark
fi

# Install Docker
sudo apt install docker -y
sudo apt install docker-compose -y

# Clone Devilbox & copy base env
git clone https://github.com/cytopia/devilbox ~/Websites
cp ~/ubuntu-dev-setup/.env ~/Websites/.env

# Install OH My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

# Create a symlink between functions
ln -s ~/ubuntu-dev-setup/functions.zsh ~/.oh-my-zsh/custom/functions.zsh

# Logout the user so their shell is set to ZSH
gnome-session-quit --no-prompt
