#!/bin/bash

# Update & Install
sudo apt update
sudo apt upgrade -y
sudo apt install curl git zsh vim gnome-shell gnome-tweak-tool unity-tweak-tool snapd -y

echo "Would you like to install""\033[1;34m PHP Storm, Bitwarden, Postman, Atom & Spotify?\033[0m" "\033[1;33m yes/no \033[0m"
read yesno
if [ "$yesno" = 'yes' ]; then
  echo "\033[1;32mInstalling Programs\033[0m"...

  # Install Default Applications
  sudo snap install phpstorm --classic    #   web development
  sudo snap install bitwarden             #   password manager
  sudo snap install postman               #   api development
  sudo snap install atom --classic        #   web development -- free edition if you don't have a phpstorm license
  sudo snap install spotify               #   spotify music

  # Download hyper.js Terminal and Install
  curl -L https://releases.hyper.is/download/deb --output ~/Downloads/Hyper.deb
  sudo apt install -y ~/Downloads/Hyper.deb
  rm ~/Downloads/Hyper.deb
fi

echo "Would you like to install""\033[1;34m Docker & Devilbox?\033[0m" "\033[1;33m yes/no \033[0m"
read yesno
if [ "$yesno" = 'yes' ]; then
  echo "\033[1;32mInstalling Docker & Devilbox\033[0m"...

  # Install Docker
  sudo apt install docker -y
  sudo apt install docker-compose -y

  # Clone Devilbox & copy base env
  git clone https://github.com/cytopia/devilbox ~/Websites
  cp ~/ubuntu-dev-setup/.env ~/Websites/.env
fi

echo "Would you like to install""\033[1;34m OSX Theme?\033[0m" "\033[1;33m yes/no \033[0m"
read yesno
if [ "$yesno" = 'yes' ]; then
  echo "Downloading github repo...."

  mkdir ~/.themes
  mkdir ~/Themes
  git clone https://github.com/vinceliuice/Mojave-gtk-theme.git ~/Themes/Mojave-Dark
  cd ~/Themes/Mojave-Dark
  ./install.sh
fi

echo "Would you like to install""\033[1;34m Oh My ZSH?\033[0m" "\033[1;33m yes/no \033[0m"
read yesno
if [ "$yesno" = 'yes' ]; then
  echo "\033[1;32mInstalling Oh My ZSH\033[0m"...

  # Install OH My ZSH
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Fix % bug in hyper.js after Oh My ZSH Install
  echo 'unsetopt PROMPT_SP' >> ~/.zshrc
  chsh -s $(which zsh)
  echo "\033[1;31mLog Out User To Reset Shell?\033[0m" "\033[1;33m yes/no \033[0m"
  read yesno
  if [ "$yesno" = 'yes' ]; then
    echo "LOGGING OUT"
    # Logout the user so their shell is set to ZSH
    gnome-session-quit --no-prompt
  fi
fi
