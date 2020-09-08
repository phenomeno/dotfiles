#!/bin/bash

# bashrc
cd ~/Workspace/pheno/dotfiles
cp .zshrc ~/.zshrc

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# python
brew install python

# vim + stewart's vimrc config
brew install vim
mkdir ~/Workspace/foof
cd ~/Workspace/foof
git clone git@github.com:stewartpark/vimrc.git
cd vimrc
# FIXME: need to fix this
make install

# ruby
brew install wget
brew install chruby
brew install ruby-install
ruby-install ruby

# node
brew install node

source ~/.zshrc
