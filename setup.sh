#!/bin/bash

# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable

# vim + stewart's vimrc config
sudo apt-get install -y vim-gtk3 python-dev libxml2-dev libxslt-dev
sudo apt-get install -y build-essential cmake
mkdir ~/Workspace/foof
cd ~/Workspace/foof
git clone git@github.com:stewartpark/vimrc.git
cd vimrc
make install

# chruby
cd ~/Downloads
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install

cd ~/Downloads
wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
tar -xzvf ruby-install-0.6.1.tar.gz
cd ruby-install-0.6.1/
sudo make install

ruby-install ruby

# bashrc
mkdir ~/Workspace/pheno
cd ~/Workspace/pheno
git clone git@github.com:phenomeno/dotfiles.git
cd dotfiles
cp .bashrc ~/.bashrc
source ~/.bashrc

# atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install -y atom

# autokey
sudo apt-get install -y autokey-gtk
mkdir ~/.config/autokey/data/Keybindings
cp -R autokey_keybindings/. ~/.config/autokey/data/Keybindings

# i3 config
mkdir ~/.i3
cp config/i3 ~/.i3/config

# multimedia keys support when using i3
sudo apt-get update; sudo apt-get install brightnessctl alsa-utils pulseaudio
sudo chmod u+s /usr/bin/brightnessctl
