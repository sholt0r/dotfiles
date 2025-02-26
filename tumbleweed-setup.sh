#!/bin/bash

sudo zypper install stow rustup npm neovim fish unzip zoxide fzf git gh jq whois go eza starship gcc-c++ zed

rustup default stable
chsh -s $(which fish) $USER
stow linux
