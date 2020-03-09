#!/bin/bash

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

# google chrome
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable

# vim + stewart's vimrc config
sudo dnf group install "C Development Tools and Libraries"
sudo dnf install vim cmake gcc-c++
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
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
tar -xzvf ruby-install-0.7.0.tar.gz
cd ruby-install-0.7.0/
sudo make install

ruby-install ruby

# bashrc
cd ~/Workspace/pheno/dotfiles
cp .bashrc ~/.bashrc
source ~/.bashrc

# autokey
sudo dnf install -y gtksourceview3 autokey-gtk
mkdir ~/.config/autokey/data/Keybindings -p
cp -R autokey_keybindings/. ~/.config/autokey/data/Keybindings

# slack
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install slack spotify steam

# node
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install yarn

# docker
sudo dnf -y install dnf-plugins-core grubby
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo systemctl start docker
sudo usermod -aG docker pheno
sudo systemctl enable docker

# filewatcher
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p