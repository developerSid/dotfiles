#!/usr/bin/env bash

mkdir -p ~/.config/nvim/

cd ~
ln -sf ~/.dotfiles/vimrc .vimrc
ln -sf ~/.dotfiles/zshrc .zshrc
ln -sf ~/.dotfiles/gitconfig .gitconfig
ln -sf ~/.dotfiles/init.vim ~/.config/nvim/init.vim
