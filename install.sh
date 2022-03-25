#!/usr/bin/env bash

mkdir -p ~/.config/nvim/ ~/.config/alacritty/

cd ~
ln -sf ~/.dotfiles/vimrc .vimrc
ln -sf ~/.dotfiles/zshrc .zshrc
ln -sf ~/.dotfiles/gitconfig .gitconfig
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
