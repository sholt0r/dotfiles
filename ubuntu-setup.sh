#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install stow rustup npm neovim fish unzip zoxide fzf git gh jq whois golang-go eza

curl -sS https://starship.rs/install.sh | sh

rustup default stable
chsh -s $(which fish) $USER
stow linux
