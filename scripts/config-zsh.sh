#!/bin/bash

# Install zsh
sudo apt update
sudo apt install zsh wget git
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install additional plugins

## zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

compaudit | xargs chmod g-w,o-w  

## thefuck
sudo apt install python3-dev python3-pip
sudo pip3 install thefuck

# Restore .zshrc
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
if [ -f ../data/.zshrc ]; then
	cp ../data/.zshrc ~/
	source ~/.zshrc
fi
